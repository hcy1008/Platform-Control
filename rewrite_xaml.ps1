# PowerShell script to rewrite XAML files with proper UTF-8 encoding
# Run this script in the Platform-Control directory

$baseDir = "d:\Hcy\项目\平台domo\Platform-Control\Platform-Control"

# HorizontalPipe.xaml
$horizontalPipe = @"
<UserControl x:Class="Platform_Control.Controls.Pipeline.HorizontalPipe"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
             xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
             mc:Ignorable="d"
             MinWidth="100" MinHeight="30"
             ClipToBounds="True">
    <UserControl.Resources>
        <LinearGradientBrush x:Key="PipeOuterBrush" StartPoint="0,0" EndPoint="0,1">
            <GradientStop Offset="0" Color="#5A5A5E"/>
            <GradientStop Offset="0.3" Color="#4A4A4E"/>
            <GradientStop Offset="0.7" Color="#3A3A3E"/>
            <GradientStop Offset="1" Color="#2A2A2E"/>
        </LinearGradientBrush>
        <LinearGradientBrush x:Key="PipeInnerBrush" StartPoint="0,0" EndPoint="0,1">
            <GradientStop Offset="0" Color="#1A1A2E"/>
            <GradientStop Offset="0.5" Color="#16213E"/>
            <GradientStop Offset="1" Color="#0F3460"/>
        </LinearGradientBrush>
        <LinearGradientBrush x:Key="WaterFlowBrush" StartPoint="0,0" EndPoint="1,0">
            <GradientStop Offset="0" Color="#00D4FF"/>
            <GradientStop Offset="0.25" Color="#0099FF"/>
            <GradientStop Offset="0.5" Color="#00D4FF"/>
            <GradientStop Offset="0.75" Color="#0066CC"/>
            <GradientStop Offset="1" Color="#00D4FF"/>
        </LinearGradientBrush>
        <LinearGradientBrush x:Key="GlossBrush" StartPoint="0,0" EndPoint="0,1">
            <GradientStop Offset="0" Color="#FFFFFF"/>
            <GradientStop Offset="0.4" Color="#FFFFFF"/>
            <GradientStop Offset="0.5" Color="Transparent"/>
            <GradientStop Offset="1" Color="Transparent"/>
        </LinearGradientBrush>
        <Storyboard x:Key="FlowAnimation" RepeatBehavior="Forever">
            <DoubleAnimation Storyboard.TargetName="FlowPatternTransform"
                           Storyboard.TargetProperty="X"
                           From="0" To="60" Duration="0:0:1.2"/>
        </Storyboard>
    </UserControl.Resources>
    <Grid>
        <Border CornerRadius="4" BorderThickness="0" Background="{StaticResource PipeOuterBrush}">
            <Border.Effect>
                <DropShadowEffect Color="#000000" BlurRadius="8" ShadowDepth="2" Opacity="0.5"/>
            </Border.Effect>
        </Border>
        <Border Margin="3" CornerRadius="2" Background="{StaticResource PipeInnerBrush}"/>
        <Border x:Name="WaterFlow" Margin="3" CornerRadius="2" Visibility="Collapsed">
            <Border.Background>
                <DrawingBrush TileMode="Tile" Viewport="0,0,60,1" ViewportUnits="Absolute" Stretch="None">
                    <DrawingBrush.Drawing>
                        <DrawingGroup>
                            <GeometryDrawing Brush="{StaticResource WaterFlowBrush}">
                                <GeometryDrawing.Geometry>
                                    <RectangleGeometry Rect="0,0,30,1"/>
                                </GeometryDrawing.Geometry>
                            </GeometryDrawing>
                            <GeometryDrawing Brush="#00FFFF">
                                <GeometryDrawing.Geometry>
                                    <RectangleGeometry Rect="30,0,30,1"/>
                                </GeometryDrawing.Geometry>
                            </GeometryDrawing>
                        </DrawingGroup>
                    </DrawingBrush.Drawing>
                    <DrawingBrush.Transform>
                        <TranslateTransform x:Name="FlowPatternTransform" X="0"/>
                    </DrawingBrush.Transform>
                </DrawingBrush>
            </Border.Background>
            <Border.Effect>
                <DropShadowEffect Color="#00D4FF" BlurRadius="10" ShadowDepth="0" Opacity="0.7"/>
            </Border.Effect>
        </Border>
        <Border Margin="4,4,4,15" CornerRadius="2" Background="{StaticResource GlossBrush}" Opacity="0.2"/>
        <Border Margin="3" CornerRadius="2" BorderBrush="#88FFFFFF" BorderThickness="1" Opacity="0.3"/>
    </Grid>
</UserControl>
"@

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText("$baseDir\Controls\Pipeline\HorizontalPipe.xaml", $horizontalPipe, $utf8NoBom)
Write-Host "Written HorizontalPipe.xaml"
