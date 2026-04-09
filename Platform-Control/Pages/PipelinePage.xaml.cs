using System.Windows;
using System.Windows.Controls;
using Platform_Control.Controls.Pipeline;

namespace Platform_Control.Pages
{
    public partial class PipelinePage : Page
    {
        public PipelinePage()
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

        private void EnableAll_Click(object sender, RoutedEventArgs e)
        {
            // Enable all pipes logic
        }

        private void DisableAll_Click(object sender, RoutedEventArgs e)
        {
            // Disable all pipes logic
        }
    }
}