# PowerShell script to fix all damaged Page XAML files

$baseDir = "d:\Hcy\项目\平台domo\Platform-Control\Platform-Control"
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

Write-Host "Fixing Page XAML files..." -ForegroundColor Green

# Fix ChamberPage.xaml
$chamberPage = @"
<Page x:Class="Platform_Control.Pages.ChamberPage"
      xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
      xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
      xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
      xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
      mc:Ignorable="d"
      Title="腔体监控"
      Background="#1E1E1E">
    <Grid>
        <TextBlock Text="腔体监控页面 - 开发中" FontSize="24" Foreground="#FFFFFF" HorizontalAlignment="Center" VerticalAlignment="Center"/>
    </Grid>
</Page>
"@
[System.IO.File]::WriteAllText("$baseDir\Pages\ChamberPage.xaml", $chamberPage, $utf8NoBom)
Write-Host "Fixed ChamberPage.xaml"

# Fix LoadPortPage.xaml
$loadPortPage = @"
<Page x:Class="Platform_Control.Pages.LoadPortPage"
      xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
      xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
      xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
      xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
      mc:Ignorable="d"
      Title="LoadPort管理"
      Background="#1E1E1E">
    <Grid>
        <TextBlock Text="LoadPort管理页面 - 开发中" FontSize="24" Foreground="#FFFFFF" HorizontalAlignment="Center" VerticalAlignment="Center"/>
    </Grid>
</Page>
"@
[System.IO.File]::WriteAllText("$baseDir\Pages\LoadPortPage.xaml", $loadPortPage, $utf8NoBom)
Write-Host "Fixed LoadPortPage.xaml"

# Fix RobotPage.xaml
$robotPage = @"
<Page x:Class="Platform_Control.Pages.RobotPage"
      xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
      xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
      xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
      xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
      mc:Ignorable="d"
      Title="机械臂控制"
      Background="#1E1E1E">
    <Grid>
        <TextBlock Text="机械臂控制页面 - 开发中" FontSize="24" Foreground="#FFFFFF" HorizontalAlignment="Center" VerticalAlignment="Center"/>
    </Grid>
</Page>
"@
[System.IO.File]::WriteAllText("$baseDir\Pages\RobotPage.xaml", $robotPage, $utf8NoBom)
Write-Host "Fixed RobotPage.xaml"

Write-Host "`nDone fixing page files!" -ForegroundColor Green
