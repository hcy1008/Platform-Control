using System.Windows;
using System.Windows.Controls;

namespace Platform_Control.Pages
{
    public partial class LoadPortPage : Page
    {
        public LoadPortPage()
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