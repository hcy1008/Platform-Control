using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Animation;

namespace Platform_Control.Controls.Pipeline
{
    public partial class ValveControl : UserControl
    {
        public ValveControl()
        {
            InitializeComponent();
            UpdateStatus();
        }

        public bool IsOpen
        {
            get => (bool)GetValue(IsOpenProperty);
            set => SetValue(IsOpenProperty, value);
        }
        public static readonly DependencyProperty IsOpenProperty =
            DependencyProperty.Register(""IsOpen"", typeof(bool), typeof(ValveControl),
                new PropertyMetadata(false, OnIsOpenChanged));

        public Brush StatusColor
        {
            get => (Brush)GetValue(StatusColorProperty);
            set => SetValue(StatusColorProperty, value);
        }
        public static readonly DependencyProperty StatusColorProperty =
            DependencyProperty.Register(""StatusColor"", typeof(Brush), typeof(ValveControl),
                new PropertyMetadata(Brushes.Red));

        private static void OnIsOpenChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            if (d is ValveControl valve)
            {
                valve.UpdateStatus();
                valve.PlayRotateAnimation();
            }
        }

        private void UpdateStatus()
        {
            if (IsOpen)
            {
                StatusColor = new SolidColorBrush(Color.FromRgb(0x4C, 0xAF, 0x50));
            }
            else
            {
                StatusColor = new SolidColorBrush(Color.FromRgb(0xF4, 0x43, 0x36));
            }
        }

        private void PlayRotateAnimation()
        {
            if (IsOpen)
            {
                var storyboard = this.Resources[""RotateWheelOpen""] as Storyboard;
                storyboard?.Begin();
            }
            else
            {
                var storyboard = this.Resources[""RotateWheelClose""] as Storyboard;
                storyboard?.Begin();
            }
        }
    }
}