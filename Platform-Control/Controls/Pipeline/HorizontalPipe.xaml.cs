using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Animation;

namespace Platform_Control.Controls.Pipeline
{
    public partial class HorizontalPipe : UserControl
    {
        public HorizontalPipe()
        {
            InitializeComponent();
            Loaded += HorizontalPipe_Loaded;
        }

        private void HorizontalPipe_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateFlowEffect();
        }

        public bool IsFlowing
        {
            get => (bool)GetValue(IsFlowingProperty);
            set => SetValue(IsFlowingProperty, value);
        }
        public static readonly DependencyProperty IsFlowingProperty =
            DependencyProperty.Register(""IsFlowing"", typeof(bool), typeof(HorizontalPipe),
                new PropertyMetadata(false, OnIsFlowingChanged));

        private static void OnIsFlowingChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is HorizontalPipe pipe)
            {
                pipe.UpdateFlowEffect();
            }
        }

        private void UpdateFlowEffect()
        {
            if (IsFlowing)
            {
                WaterFlow.Visibility = Visibility.Visible;
                var storyboard = this.Resources[""FlowAnimation""] as Storyboard;
                storyboard?.Begin();
            }
            else
            {
                WaterFlow.Visibility = Visibility.Collapsed;
                var storyboard = this.Resources[""FlowAnimation""] as Storyboard;
                storyboard?.Stop();
            }
        }
    }
}