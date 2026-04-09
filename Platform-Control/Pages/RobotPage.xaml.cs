using System.Windows;
using System.Windows.Controls;

namespace Platform_Control.Pages
{
    public partial class RobotPage : Page
    {
        public RobotPage()
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