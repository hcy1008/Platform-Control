# PowerShell script to fix PipelinePage.xaml with beautified UI

$baseDir = "d:\Hcy\项目\平台domo\Platform-Control\Platform-Control"
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

Write-Host "Fixing PipelinePage.xaml with beautified UI..." -ForegroundColor Green

$pipelinePage = @"
<Page x:Class="Platform_Control.Pages.PipelinePage"
      xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
      xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
      xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
      xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
      xmlns:pipeline="clr-namespace:Platform_Control.Controls.Pipeline"
      mc:Ignorable="d"
      Title="管路监控"
      Background="#1E1E1E">
    <Page.Resources>
        <Style x:Key="CardStyle" TargetType="Border">
            <Setter Property="Background">
                <Setter.Value>
                    <LinearGradientBrush StartPoint="0,0" EndPoint="1,1">
                        <GradientStop Offset="0" Color="#2D2D35"/>
                        <GradientStop Offset="1" Color="#25252D"/>
                    </LinearGradientBrush>
                </Setter.Value>
            </Setter>
            <Setter Property="BorderBrush" Value="#3F3F46"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="CornerRadius" Value="8"/>
            <Setter Property="Padding" Value="20"/>
            <Setter Property="Margin" Value="0,0,0,20"/>
        </Style>
        <Style x:Key="SectionTitleStyle" TargetType="TextBlock">
            <Setter Property="FontSize" Value="16"/>
            <Setter Property="FontWeight" Value="Bold"/>
            <Setter Property="Foreground">
                <Setter.Value>
                    <LinearGradientBrush StartPoint="0,0" EndPoint="1,0">
                        <GradientStop Offset="0" Color="#00D4FF"/>
                        <GradientStop Offset="1" Color="#0099FF"/>
                    </LinearGradientBrush>
                </Setter.Value>
            </Setter>
            <Setter Property="Margin" Value="0,0,0,15"/>
        </Style>
        <Style x:Key="DescriptionStyle" TargetType="TextBlock">
            <Setter Property="FontSize" Value="12"/>
            <Setter Property="Foreground" Value="#AAAAAA"/>
            <Setter Property="Margin" Value="0,8,0,5"/>
        </Style>
        <Style x:Key="ActionButtonStyle" TargetType="Button">
            <Setter Property="Padding" Value="20,10"/>
            <Setter Property="Margin" Value="0,0,10,0"/>
            <Setter Property="Foreground" Value="White"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="FontSize" Value="12"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}" CornerRadius="6" Padding="{TemplateBinding Padding}">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter Property="Opacity" Value="0.9"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter Property="Opacity" Value="0.8"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Page.Resources>
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>
        <Border Grid.Row="0">
            <Border.Background>
                <LinearGradientBrush StartPoint="0,0" EndPoint="1,0">
                    <GradientStop Offset="0" Color="#1A1A2E"/>
                    <GradientStop Offset="0.5" Color="#16213E"/>
                    <GradientStop Offset="1" Color="#0F3460"/>
                </LinearGradientBrush>
            </Border.Background>
            <Border BorderBrush="#3F3F46" BorderThickness="0,0,0,1" Padding="20,15">
                <Grid>
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="*"/>
                        <ColumnDefinition Width="Auto"/>
                    </Grid.ColumnDefinitions>
                    <TextBlock Grid.Column="0" Text="管路监控系统 - 组件演示" FontSize="24" FontWeight="Bold">
                        <TextBlock.Foreground>
                            <LinearGradientBrush StartPoint="0,0" EndPoint="1,0">
                                <GradientStop Offset="0" Color="#00D4FF"/>
                                <GradientStop Offset="1" Color="#FFFFFF"/>
                            </LinearGradientBrush>
                        </TextBlock.Foreground>
                    </TextBlock>
                    <Button Grid.Column="1" Content="返回主页" Click="BackButton_Click" Padding="20,10" Cursor="Hand" FontSize="12" FontWeight="Bold">
                        <Button.Background>
                            <LinearGradientBrush StartPoint="0,0" EndPoint="1,0">
                                <GradientStop Offset="0" Color="#2196F3"/>
                                <GradientStop Offset="1" Color="#1976D2"/>
                            </LinearGradientBrush>
                        </Button.Background>
                        <Button.Foreground>White</Button.Foreground>
                        <Button.BorderThickness>0</Button.BorderThickness>
                        <Button.Template>
                            <ControlTemplate TargetType="Button">
                                <Border Background="{TemplateBinding Background}" CornerRadius="6" Padding="{TemplateBinding Padding}">
                                    <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                                </Border>
                                <ControlTemplate.Triggers>
                                    <Trigger Property="IsMouseOver" Value="True">
                                        <Setter Property="Opacity" Value="0.9"/>
                                    </Trigger>
                                    <Trigger Property="IsPressed" Value="True">
                                        <Setter Property="Opacity" Value="0.8"/>
                                    </Trigger>
                                </ControlTemplate.Triggers>
                            </ControlTemplate>
                        </Button.Template>
                    </Button>
                </Grid>
            </Border>
        </Border>
        <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto" Padding="25">
            <StackPanel>
                <Border Style="{StaticResource CardStyle}">
                    <StackPanel>
                        <TextBlock Text="使用说明" Style="{StaticResource SectionTitleStyle}"/>
                        <TextBlock Text="以下是独立的管道和阀门控件，可以自由组合使用。控件支持调节大小，通过 IsFlowing 和 IsOpen 属性控制状态。" FontSize="13" Foreground="#CCCCCC" TextWrapping="Wrap" LineHeight="20"/>
                    </StackPanel>
                </Border>
                <Border Style="{StaticResource CardStyle}">
                    <StackPanel>
                        <TextBlock Text="横向管道 (HorizontalPipe)" Style="{StaticResource SectionTitleStyle}"/>
                        <TextBlock Text="流动状态 (Width=400, Height=40):" Style="{StaticResource DescriptionStyle}"/>
                        <pipeline:HorizontalPipe Width="400" Height="40" IsFlowing="True" HorizontalAlignment="Left"/>
                        <TextBlock Text="停止状态 (Width=300, Height=35):" Style="{StaticResource DescriptionStyle}"/>
                        <pipeline:HorizontalPipe Width="300" Height="35" IsFlowing="False" HorizontalAlignment="Left" Margin="0,15,0,0"/>
                        <TextBlock Text="较大尺寸 (Width=500, Height=50):" Style="{StaticResource DescriptionStyle}"/>
                        <pipeline:HorizontalPipe Width="500" Height="50" IsFlowing="True" HorizontalAlignment="Left" Margin="0,15,0,0"/>
                    </StackPanel>
                </Border>
                <Border Style="{StaticResource CardStyle}">
                    <StackPanel>
                        <TextBlock Text="纵向管道 (VerticalPipe)" Style="{StaticResource SectionTitleStyle}"/>
                        <StackPanel Orientation="Horizontal">
                            <StackPanel Margin="0,0,40,0">
                                <TextBlock Text="流动状态 (Width=40, Height=150):" Style="{StaticResource DescriptionStyle}"/>
                                <pipeline:VerticalPipe Width="40" Height="150" IsFlowing="True"/>
                            </StackPanel>
                            <StackPanel Margin="0,0,40,0">
                                <TextBlock Text="停止状态 (Width=35, Height=120):" Style="{StaticResource DescriptionStyle}"/>
                                <pipeline:VerticalPipe Width="35" Height="120" IsFlowing="False"/>
                            </StackPanel>
                            <StackPanel>
                                <TextBlock Text="较大尺寸 (Width=50, Height=180):" Style="{StaticResource DescriptionStyle}"/>
                                <pipeline:VerticalPipe Width="50" Height="180" IsFlowing="True"/>
                            </StackPanel>
                        </StackPanel>
                    </StackPanel>
                </Border>
                <Border Style="{StaticResource CardStyle}">
                    <StackPanel>
                        <TextBlock Text="阀门 (ValveControl)" Style="{StaticResource SectionTitleStyle}"/>
                        <StackPanel Orientation="Horizontal">
                            <StackPanel Margin="0,0,40,0" HorizontalAlignment="Center">
                                <TextBlock Text="开启状态" Style="{StaticResource DescriptionStyle}" HorizontalAlignment="Center"/>
                                <pipeline:ValveControl Width="70" Height="90" IsOpen="True"/>
                            </StackPanel>
                            <StackPanel Margin="0,0,40,0" HorizontalAlignment="Center">
                                <TextBlock Text="关闭状态" Style="{StaticResource DescriptionStyle}" HorizontalAlignment="Center"/>
                                <pipeline:ValveControl Width="70" Height="90" IsOpen="False"/>
                            </StackPanel>
                            <StackPanel HorizontalAlignment="Center">
                                <TextBlock Text="较大尺寸" Style="{StaticResource DescriptionStyle}" HorizontalAlignment="Center"/>
                                <pipeline:ValveControl Width="90" Height="110" IsOpen="True"/>
                            </StackPanel>
                        </StackPanel>
                    </StackPanel>
                </Border>
                <Border Style="{StaticResource CardStyle}">
                    <StackPanel>
                        <TextBlock Text="自由组合示例" Style="{StaticResource SectionTitleStyle}"/>
                        <Border Background="#1A1A2E" CornerRadius="6" Padding="20" Margin="0,0,0,15">
                            <Canvas Width="650" Height="320">
                                <pipeline:HorizontalPipe Canvas.Left="50" Canvas.Top="140" Width="550" Height="40" IsFlowing="True"/>
                                <pipeline:VerticalPipe Canvas.Left="160" Canvas.Top="50" Width="40" Height="90" IsFlowing="True"/>
                                <pipeline:VerticalPipe Canvas.Left="430" Canvas.Top="50" Width="40" Height="90" IsFlowing="True"/>
                                <pipeline:ValveControl Canvas.Left="260" Canvas.Top="100" Width="70" Height="90" IsOpen="True"/>
                                <pipeline:ValveControl Canvas.Left="360" Canvas.Top="100" Width="70" Height="90" IsOpen="False"/>
                                <TextBlock Canvas.Left="160" Canvas.Top="25" Text="入口" FontSize="11" FontWeight="Bold" Foreground="#00D4FF"/>
                                <TextBlock Canvas.Left="430" Canvas.Top="25" Text="出口" FontSize="11" FontWeight="Bold" Foreground="#00D4FF"/>
                                <TextBlock Canvas.Left="260" Canvas.Top="195" Text="阀门1 (开)" FontSize="10" Foreground="#4CAF50"/>
                                <TextBlock Canvas.Left="360" Canvas.Top="195" Text="阀门2 (关)" FontSize="10" Foreground="#F44336"/>
                                <Path Data="M 80,130 L 100,130 L 95,125 M 100,130 L 95,135" Stroke="#00D4FF" StrokeThickness="2" Fill="None"/>
                                <Path Data="M 550,130 L 570,130 L 565,125 M 570,130 L 565,135" Stroke="#00D4FF" StrokeThickness="2" Fill="None"/>
                            </Canvas>
                        </Border>
                        <StackPanel Orientation="Horizontal">
                            <Button Content="开启所有管道" Click="EnableAll_Click" Style="{StaticResource ActionButtonStyle}">
                                <Button.Background>
                                    <LinearGradientBrush StartPoint="0,0" EndPoint="1,0">
                                        <GradientStop Offset="0" Color="#4CAF50"/>
                                        <GradientStop Offset="1" Color="#388E3C"/>
                                    </LinearGradientBrush>
                                </Button.Background>
                            </Button>
                            <Button Content="关闭所有管道" Click="DisableAll_Click" Style="{StaticResource ActionButtonStyle}" Margin="0">
                                <Button.Background>
                                    <LinearGradientBrush StartPoint="0,0" EndPoint="1,0">
                                        <GradientStop Offset="0" Color="#F44336"/>
                                        <GradientStop Offset="1" Color="#D32F2F"/>
                                    </LinearGradientBrush>
                                </Button.Background>
                            </Button>
                        </StackPanel>
                    </StackPanel>
                </Border>
            </StackPanel>
        </ScrollViewer>
    </Grid>
</Page>
"@

[System.IO.File]::WriteAllText("$baseDir\Pages\PipelinePage.xaml", $pipelinePage, $utf8NoBom)
Write-Host "Fixed PipelinePage.xaml with beautified UI!" -ForegroundColor Green
Write-Host "`nAll XAML files have been fixed!" -ForegroundColor Green
