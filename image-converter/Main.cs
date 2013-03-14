/*
 * Converts an image to RGB222 format.
 *
 * It is assumed that the image is already indexed by an external program
 * such as Gimp.
 */

using System;
using System.IO;
using System.Drawing;

namespace Avrsim {
	class MainClass {
		public static void Main (string[] args) {
			// The first argument is the filename to convert to binary format.
			var image = Image.FromFile (args[0]);
			var bitmap = (Bitmap)image;
			
			// Create the output file.
			var stream = File.Open("output.bin", FileMode.OpenOrCreate);
			using(BinaryWriter writer = new BinaryWriter(stream)) {
				// Loop through each pixel
				for(int y = 0; y < bitmap.Height; y++) {
					for(int x = 0; x < bitmap.Width; x++) {
						var pixel = bitmap.GetPixel(x, y);
	
						byte newPixel = 0;
						
						/*
						 * It is assumed that the image is already indexed and
						 * in maps the values 0, 85, 170 and 255 to their
						 * respective 00, 01, 10 and 11 values in the output
						 * binary file.
						 */

						switch(pixel.B) {
							case 255:
								newPixel |= 0x30;
								break;
							case 170:
								newPixel |= 0x10;
								break;
							case 85:
								newPixel |= 0x20;
								break;
							default:
								break;
						}
		
						switch(pixel.G) {
							case 255:
								newPixel |= 0x0C;
								break;
							case 170:
								newPixel |= 0x04;
								break;
							case 85:
								newPixel |= 0x08;
								break;
							default:
								break;
						}
	
						switch(pixel.R) {
							case 255:
								newPixel |= 0x03;
								break;
							case 170:
								newPixel |= 0x01;
								break;
							case 85:
								newPixel |= 0x02;
								break;
							default:
								break;
						}
						
						// Write out the new pixel value
						writer.Write(newPixel);
					}
				}
			}

			Console.WriteLine("Image converted successfully.");
		}
	}
}
