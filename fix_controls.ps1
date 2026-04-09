# PowerShell script to fix all remaining damaged XAML files

$baseDir = "d:\Hcy\项目\平台domo\Platform-Control\Platform-Control"
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

Write-Host "Fixing remaining XAML files..." -ForegroundColor Green

# Fix ChamberControl.xaml
$chamberControl = @"
<UserControl x:Class="Platform_Control.Controls.Chamber.ChamberControl"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
             xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
             mc:Ignorable="d">
    <Grid>
        <TextBlock Text="ChamberControl" HorizontalAlignment="Center" VerticalAlignment="Center"/>
    </Grid>
</UserControl>
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Chamber\ChamberControl.xaml", $chamberControl, $utf8NoBom)
Write-Host "Fixed ChamberControl.xaml"

# Fix StatusIndicator.xaml
$statusIndicator = @"
<UserControl x:Class="Platform_Control.Controls.Common.StatusIndicator"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
             xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
             mc:Ignorable="d">
    <Grid>
        <TextBlock Text="StatusIndicator" HorizontalAlignment="Center" VerticalAlignment="Center"/>
    </Grid>
</UserControl>
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Common\StatusIndicator.xaml", $statusIndicator, $utf8NoBom)
Write-Host "Fixed StatusIndicator.xaml"

# Fix ValueDisplay.xaml
$valueDisplay = @"
<UserControl x:Class="Platform_Control.Controls.Common.ValueDisplay"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
             xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
             mc:Ignorable="d">
    <Grid>
        <TextBlock Text="ValueDisplay" HorizontalAlignment="Center" VerticalAlignment="Center"/>
    </Grid>
</UserControl>
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Common\ValueDisplay.xaml", $valueDisplay, $utf8NoBom)
Write-Host "Fixed ValueDisplay.xaml"

# Fix LoadPortControl.xaml
$loadPortControl = @"
<UserControl x:Class="Platform_Control.Controls.Equipment.LoadPortControl"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
             xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
             mc:Ignorable="d">
    <Grid>
        <TextBlock Text="LoadPortControl" HorizontalAlignment="Center" VerticalAlignment="Center"/>
    </Grid>
</UserControl>
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Equipment\LoadPortControl.xaml", $loadPortControl, $utf8NoBom)
Write-Host "Fixed LoadPortControl.xaml"

# Fix RobotControl.xaml
$robotControl = @"
<UserControl x:Class="Platform_Control.Controls.Robot.RobotControl"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
             xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
             mc:Ignorable="d">
    <Grid>
        <TextBlock Text="RobotControl" HorizontalAlignment="Center" VerticalAlignment="Center"/>
    </Grid>
</UserControl>
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Robot\RobotControl.xaml", $robotControl, $utf8NoBom)
Write-Host "Fixed RobotControl.xaml"

# Fix Generic.xaml
$generic = @"
<ResourceDictionary xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
                    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml">
</ResourceDictionary>
"@
[System.IO.File]::WriteAllText("$baseDir\Controls\Themes\Generic.xaml", $generic, $utf8NoBom)
Write-Host "Fixed Generic.xaml"

Write-Host "`nDone fixing control files!" -ForegroundColor Green
