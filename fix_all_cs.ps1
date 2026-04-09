# PowerShell script to recreate all .cs files

$baseDir = "d:\Hcy\项目\平台domo\Platform-Control\Platform-Control"
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

Write-Host "Recreating all .cs files..." -ForegroundColor Green

# App.xaml.cs
$appCs = @"
using System.Windows;

namespace Platform_Control
{
    public partial class App : Application
    {
    }
}
"@
[System.IO.File]::WriteAllText("$baseDir\App.xaml.cs", $appCs, $utf8NoBom)
Write-Host "Fixed App.xaml.cs"

# AssemblyInfo.cs
$assemblyInfo = @"
using System.Windows;

[assembly: ThemeInfo(
    ResourceDictionaryLocation.None,
    ResourceDictionaryLocation.SourceAssembly
)]
"@
[System.IO.File]::WriteAllText("$baseDir\AssemblyInfo.cs", $assemblyInfo, $utf8NoBom)
Write-Host "Fixed AssemblyInfo.cs"

# MainWindow.xaml.cs
$mainWindowCs = @"
using System.Windows;
using Platform_Control.Pages;

namespace Platform_Control
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void NavigateToPipeline_Click(object sender, RoutedEventArgs e)
        {
            HomePage.Visibility = Visibility.Collapsed;
            MainFrame.Visibility = Visibility.Visible;
            MainFrame.Navigate(new PipelinePage());
        }

        private void NavigateToChamber_Click(object sender, RoutedEventArgs e)
        {
            HomePage.Visibility = Visibility.Collapsed;
            MainFrame.Visibility = Visibility.Visible;
            MainFrame.Navigate(new ChamberPage());
        }

        private void NavigateToRobot_Click(object sender, RoutedEventArgs e)
        {
            HomePage.Visibility = Visibility.Collapsed;
            MainFrame.Visibility = Visibility.Visible;
            MainFrame.Navigate(new RobotPage());
        }

        private void NavigateToLoadPort_Click(object sender, RoutedEventArgs e)
        {
            HomePage.Visibility = Visibility.Collapsed;
            MainFrame.Visibility = Visibility.Visible;
            MainFrame.Navigate(new LoadPortPage());
        }

        public void NavigateToHome()
        {
            MainFrame.Visibility = Visibility.Collapsed;
            HomePage.Visibility = Visibility.Visible;
            MainFrame.Navigate(null);
        }
    }
}
"@
[System.IO.File]::WriteAllText("$baseDir\MainWindow.xaml.cs", $mainWindowCs, $utf8NoBom)
Write-Host "Fixed MainWindow.xaml.cs"

# HorizontalPipe.xaml.cs
$horizontalPipeCs = @"
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
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Pipeline\HorizontalPipe.xaml.cs", $horizontalPipeCs, $utf8NoBom)
Write-Host "Fixed HorizontalPipe.xaml.cs"

# VerticalPipe.xaml.cs
$verticalPipeCs = @"
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
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Pipeline\VerticalPipe.xaml.cs", $verticalPipeCs, $utf8NoBom)
Write-Host "Fixed VerticalPipe.xaml.cs"

# ValveControl.xaml.cs
$valveControlCs = @"
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
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Pipeline\ValveControl.xaml.cs", $valveControlCs, $utf8NoBom)
Write-Host "Fixed ValveControl.xaml.cs"

# PipeControl.xaml.cs
$pipeControlCs = @"
using System.Windows.Controls;

namespace Platform_Control.Controls.Pipeline
{
    public partial class PipeControl : UserControl
    {
        public PipeControl()
        {
            InitializeComponent();
        }
    }
}
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Pipeline\PipeControl.xaml.cs", $pipeControlCs, $utf8NoBom)
Write-Host "Fixed PipeControl.xaml.cs"

# PipelinePage.xaml.cs
$pipelinePageCs = @"
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
"@
[System.IO.File]::WriteAllText("$baseDir\Pages\PipelinePage.xaml.cs", $pipelinePageCs, $utf8NoBom)
Write-Host "Fixed PipelinePage.xaml.cs"

# ChamberPage.xaml.cs
$chamberPageCs = @"
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
"@
[System.IO.File]::WriteAllText("$baseDir\Pages\ChamberPage.xaml.cs", $chamberPageCs, $utf8NoBom)
Write-Host "Fixed ChamberPage.xaml.cs"

# RobotPage.xaml.cs
$robotPageCs = @"
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
"@
[System.IO.File]::WriteAllText("$baseDir\Pages\RobotPage.xaml.cs", $robotPageCs, $utf8NoBom)
Write-Host "Fixed RobotPage.xaml.cs"

# LoadPortPage.xaml.cs
$loadPortPageCs = @"
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
"@
[System.IO.File]::WriteAllText("$baseDir\Pages\LoadPortPage.xaml.cs", $loadPortPageCs, $utf8NoBom)
Write-Host "Fixed LoadPortPage.xaml.cs"

# ChamberControl.xaml.cs
$chamberControlCs = @"
using System.Windows.Controls;

namespace Platform_Control.Controls.Chamber
{
    public partial class ChamberControl : UserControl
    {
        public ChamberControl()
        {
            InitializeComponent();
        }
    }
}
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Chamber\ChamberControl.xaml.cs", $chamberControlCs, $utf8NoBom)
Write-Host "Fixed ChamberControl.xaml.cs"

# StatusIndicator.xaml.cs
$statusIndicatorCs = @"
using System.Windows.Controls;

namespace Platform_Control.Controls.Common
{
    public partial class StatusIndicator : UserControl
    {
        public StatusIndicator()
        {
            InitializeComponent();
        }
    }
}
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Common\StatusIndicator.xaml.cs", $statusIndicatorCs, $utf8NoBom)
Write-Host "Fixed StatusIndicator.xaml.cs"

# ValueDisplay.xaml.cs
$valueDisplayCs = @"
using System.Windows.Controls;

namespace Platform_Control.Controls.Common
{
    public partial class ValueDisplay : UserControl
    {
        public ValueDisplay()
        {
            InitializeComponent();
        }
    }
}
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Common\ValueDisplay.xaml.cs", $valueDisplayCs, $utf8NoBom)
Write-Host "Fixed ValueDisplay.xaml.cs"

# LoadPortControl.xaml.cs
$loadPortControlCs = @"
using System.Windows.Controls;

namespace Platform_Control.Controls.Equipment
{
    public partial class LoadPortControl : UserControl
    {
        public LoadPortControl()
        {
            InitializeComponent();
        }
    }
}
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Equipment\LoadPortControl.xaml.cs", $loadPortControlCs, $utf8NoBom)
Write-Host "Fixed LoadPortControl.xaml.cs"

# RobotControl.xaml.cs
$robotControlCs = @"
using System.Windows.Controls;

namespace Platform_Control.Controls.Robot
{
    public partial class RobotControl : UserControl
    {
        public RobotControl()
        {
            InitializeComponent();
        }
    }
}
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Robot\RobotControl.xaml.cs", $robotControlCs, $utf8NoBom)
Write-Host "Fixed RobotControl.xaml.cs"

Write-Host "`nAll .cs files have been recreated!" -ForegroundColor Green
