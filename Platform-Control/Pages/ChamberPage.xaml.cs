using System.Windows;
using System.Windows.Controls;

namespace Platform_Control.Pages
{
    public partial class ChamberPage : Page
    {
        public ChamberPage()
        {
            InitializeComponent();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Window.GetWindow(this) is MainWindow mainWindow)
            {
                mainWindow.NavigateToHome();
            }
        }
    }
}