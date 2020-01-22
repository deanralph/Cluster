using System;
using System.IO;

namespace Testing_App
{
    class Program
    {
        static void Main(string[] args)
        {
            DriveInfo[] allDrives = DriveInfo.GetDrives();

            foreach (DriveInfo d in allDrives)
            {
                Console.WriteLine("Drive {0}", d.Name);
                Console.WriteLine("  Drive type: {0}", d.DriveType);
                if (d.IsReady == true)
                {
                    if (d.VolumeLabel.Contains("boot"))
                    {

                    }
                }
            }
        }
    }
}
