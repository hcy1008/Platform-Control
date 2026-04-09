using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Animation;

namespace Platform_Control.Controls.Pipeline
{
    public partial class VerticalPipe : UserControl
    {
        public VerticalPipe()
        {
            InitializeComponent();
            Loaded += VerticalPipe_Loaded;
        }

        private void VerticalPipe_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateFlowEffect();
        }

        public bool IsFlowing
        {
            get => (bool)GetValue(IsFlowingProperty);
            set => SetValue(IsFlowingProperty, value);
        }
        public static readonly DependencyProperty IsFlowingProperty =
            DependencyProperty.Register(""IsFlowing"", typeof(bool), typeof(VerticalPipe),
                new PropertyMetadata(false, OnIsFlowingChanged));

        private static void OnIsFlowingChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is VerticalPipe pipe)
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