# PowerShell script to fix all damaged XAML files
# Run this from PowerShell directly

$baseDir = "d:\Hcy\项目\平台domo\Platform-Control\Platform-Control"
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

Write-Host "Starting to fix all damaged XAML files..." -ForegroundColor Green

# 1. Fix MainWindow.xaml
$mainWindow = @"
<Window x:Class="Platform_Control.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        mc:Ignorable="d"
        Title="半导体平台控制系统" Height="700" Width="1200"
        WindowStartupLocation="CenterScreen"
        Background="#1E1E1E">
    <Grid>
        <Grid x:Name="HomePage">
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
            </Grid.RowDefinitions>
            <Border Grid.Row="0" Background="#2D2D30" BorderBrush="#3F3F46" BorderThickness="0,0,0,1" Padding="20,15">
                <TextBlock Text="半导体平台控制系统" FontSize="24" FontWeight="Bold" Foreground="#FFFFFF"/>
            </Border>
            <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto" Padding="20">
                <StackPanel>
                    <TextBlock Text="功能导航" FontSize="20" FontWeight="Bold" Foreground="#FFFFFF" Margin="0,0,0,20"/>
                    <WrapPanel>
                        <Button Content="管路监控" Click="NavigateToPipeline_Click" Width="200" Height="80" Margin="10" Background="#2196F3" Foreground="White" BorderThickness="0" FontSize="16" Cursor="Hand"/>
                        <Button Content="腔体监控" Click="NavigateToChamber_Click" Width="200" Height="80" Margin="10" Background="#4CAF50" Foreground="White" BorderThickness="0" FontSize="16" Cursor="Hand"/>
                        <Button Content="机械臂控制" Click="NavigateToRobot_Click" Width="200" Height="80" Margin="10" Background="#FF9800" Foreground="White" BorderThickness="0" FontSize="16" Cursor="Hand"/>
                        <Button Content="LoadPort管理" Click="NavigateToLoadPort_Click" Width="200" Height="80" Margin="10" Background="#9C27B0" Foreground="White" BorderThickness="0" FontSize="16" Cursor="Hand"/>
                    </WrapPanel>
                    <Border Background="#2D2D30" BorderBrush="#3F3F46" BorderThickness="1" CornerRadius="4" Padding="15" Margin="0,30,0,0">
                        <StackPanel>
                            <TextBlock Text="系统状态" FontSize="16" FontWeight="Bold" Foreground="#FFFFFF" Margin="0,0,0,15"/>
                            <StackPanel Orientation="Horizontal" Margin="0,0,0,10">
                                <TextBlock Text="系统运行状态: " FontSize="12" Foreground="#CCCCCC" Width="120"/>
                                <TextBlock Text="正常运行" FontSize="12" Foreground="#4CAF50" FontWeight="Bold"/>
                            </StackPanel>
                            <StackPanel Orientation="Horizontal" Margin="0,0,0,10">
                                <TextBlock Text="运行时间: " FontSize="12" Foreground="#CCCCCC" Width="120"/>
                                <TextBlock Text="125 小时 32 分钟" FontSize="12" Foreground="#CCCCCC"/>
                            </StackPanel>
                            <StackPanel Orientation="Horizontal" Margin="0,0,0,10">
                                <TextBlock Text="活跃管路段: " FontSize="12" Foreground="#CCCCCC" Width="120"/>
                                <TextBlock Text="3 / 5" FontSize="12" Foreground="#2196F3"/>
                            </StackPanel>
                            <StackPanel Orientation="Horizontal">
                                <TextBlock Text="报警数量: " FontSize="12" Foreground="#CCCCCC" Width="120"/>
                                <TextBlock Text="0" FontSize="12" Foreground="#4CAF50" FontWeight="Bold"/>
                            </StackPanel>
                        </StackPanel>
                    </Border>
                </StackPanel>
            </ScrollViewer>
        </Grid>
        <Frame x:Name="MainFrame" Visibility="Collapsed" NavigationUIVisibility="Hidden"/>
    </Grid>
</Window>
"@

[System.IO.File]::WriteAllText("$baseDir\MainWindow.xaml", $mainWindow, $utf8NoBom)
Write-Host "Fixed MainWindow.xaml" -ForegroundColor Green

# 2. Fix App.xaml
$appXaml = @"
<Application x:Class="Platform_Control.App"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             StartupUri="MainWindow.xaml">
</Application>
"@

[System.IO.File]::WriteAllText("$baseDir\App.xaml", $appXaml, $utf8NoBom)
Write-Host "Fixed App.xaml" -ForegroundColor Green

# 3. Fix PipeControl.xaml
$pipeControl = @"
<UserControl x:Class="Platform_Control.Controls.Pipeline.PipeControl"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
             xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
             mc:Ignorable="d">
    <Grid>
        <TextBlock Text="PipeControl" HorizontalAlignment="Center" VerticalAlignment="Center"/>
    </Grid>
</UserControl>
"@

[System.IO.File]::WriteAllText("$baseDir\Controls\Pipeline\PipeControl.xaml", $pipeControl, $utf8NoBom)
Write-Host "Fixed PipeControl.xaml" -ForegroundColor Green

Write-Host "`nDone! Please run the remaining scripts to fix other files." -ForegroundColor Yellow
