using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Microsoft.Azure.Devices.Client;

namespace Trackmverse.devicesimulator
{
    class TrackSystem
    {
        //Connection string for device IoT Hub
        private static readonly string connectionString_IoTHub = "<IoTHub_device_connection_string>";
        static DeviceClient trackDeviceClient;
        static Random random = new Random();

        // Parameters
        const double deviceLattitude_min = 80;
        const double deviceLattitude_max = 120;
        static double deviceLattitude = 80;
        const double deviceLongitude_min = 80;
        const double deviceLongitude_max = 120;
        static double deviceLongitude = 80;

        static void Main(string[] args)
        {
            var cts = new CancellationTokenSource();
            Console.WriteLine("Press CTRL+C to stop the simulation");
            Console.CancelKeyPress += (s,e)=>
            {
                Console.WriteLine("Stopping the Application....");
                cts.Cancel();
                e.Cancel = true;
            };

            trackDeviceClient = DeviceClient.CreateFromConnectionString(connectionString_IoTHub);
            SendMessagesToIoTHub(cts.Token);
            Console.ReadLine();
        }
        private static double GenerateSensor(double currentValue, double min, double max)
        {
            double percentage = 5;
            double value = currentValue * (1 + ((percentage / 100) * (2 * random.NextDouble() - 1)));
            value = Math.Max(value, min);
            value = Math.Min(value, max);
            return value;
        }
        private static string CreateJSON(double lattitudedata, double longitude)
        {
            var data = new
            {
                Latitude = lattitudedata,
                Longitude = longitude
            };
            return JsonConvert.SerializeObject(data);
        }

        private static Message CreateMessage(string jsonObject)
        {
            var message = new Message(Encoding.ASCII.GetBytes(jsonObject));
            message.ContentType = "application/json";
            message.ContentEncoding = "UTF-8";
            return message;
        }
        private static async void SendMessagesToIoTHub(CancellationToken token)
        {
            while (!token.IsCancellationRequested)
            {
                deviceLattitude = GenerateSensor(deviceLattitude, deviceLattitude_min, deviceLattitude_max);
                deviceLongitude = GenerateSensor(deviceLongitude, deviceLongitude_min, deviceLongitude_max);

                var json = CreateJSON(deviceLattitude, deviceLongitude);
                var message = CreateMessage(json);
                await trackDeviceClient.SendEventAsync(message);
                Console.WriteLine($"Sending message at {DateTime.Now} and Message : {json}");
                await Task.Delay(5000);
            }
        }
    }
}