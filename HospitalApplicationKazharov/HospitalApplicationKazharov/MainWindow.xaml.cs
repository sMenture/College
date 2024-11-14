using System;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media.Imaging;

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


        private void TextBoxFIO_GotFocus(object sender, RoutedEventArgs e)
        {
            if (GridFIO.Visibility == Visibility.Visible)
            {
                GridFIO.Visibility = Visibility.Collapsed;
            }
            else
            {
                GridFIO.Visibility = Visibility.Visible;
            }
        }

        private void TextBoxPersonalData_GotFocus(object sender, RoutedEventArgs e)
        {
            if (GridPersonalData.Visibility == Visibility.Visible)
            {
                GridPersonalData.Visibility = Visibility.Collapsed;
            }
            else
            {
                GridPersonalData.Visibility = Visibility.Visible;
            }
        }

        private void TextBoxPolicy_GotFocus(object sender, RoutedEventArgs e)
        {
            if (GridPolicy.Visibility == Visibility.Visible)
            {
                GridPolicy.Visibility = Visibility.Collapsed;
            }
            else
            {
                GridPolicy.Visibility = Visibility.Visible;
            }
        }
    }
}
