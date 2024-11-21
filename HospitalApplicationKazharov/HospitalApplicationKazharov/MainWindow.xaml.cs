using System;
using System.Drawing;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media.Imaging;
using QRCoder;
using System.IO;

namespace HospitalApplicationKazharov
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void GenderImage_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (GenderImage.Source.ToString().Contains("м.png"))
            {
                GenderImage.Source = new BitmapImage(new Uri("pack://application:,,,/Resources/Gender/ж.png"));
            }
            else
            {
                GenderImage.Source = new BitmapImage(new Uri("pack://application:,,,/Resources/Gender/м.png"));
            }
        }

        private void GenerateQRCode(object sender, RoutedEventArgs e)
        {
            if (CheckString(InputSurname.Text) || CheckString(InputName.Text) || CheckString(InputLastname.Text))
            {
                MessageBox.Show("Не все данные заполнены!", "Ошибка заполнения");
                return;
            }

            string qrText = $"" +
                $"Фамилия {InputSurname.Text}\r\n" +
                $"Имя {InputName.Text}\r\n" +
                $"Отчество {InputLastname.Text}\r\n";

            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(qrText, QRCodeGenerator.ECCLevel.Q);
            QRCode qrCode = new QRCode(qrCodeData);
            Bitmap qrCodeImage = qrCode.GetGraphic(20);

            BitmapImage bitmapImage = BitmapToBitmapImage(qrCodeImage);
            QRCode.Source = bitmapImage;
        }

        private BitmapImage BitmapToBitmapImage(Bitmap bitmap)
        {
            using (MemoryStream memory = new MemoryStream())
            {
                bitmap.Save(memory, System.Drawing.Imaging.ImageFormat.Bmp);
                memory.Position = 0;
                BitmapImage bitmapImage = new BitmapImage();
                bitmapImage.BeginInit();
                bitmapImage.StreamSource = memory;
                bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                bitmapImage.EndInit();
                return bitmapImage;
            }
        }
        private bool CheckString(string text)
        {
            return string.IsNullOrWhiteSpace(text);
        }
    }
}
