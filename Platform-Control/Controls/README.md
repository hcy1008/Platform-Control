# 半导体工业自动化控件库

## 目录结构

```
Controls/
├── Common/               # 通用控件
│   ├── StatusIndicator   # 状态指示灯
│   └── ValueDisplay      # 数值显示
│
├── Equipment/            # 设备控件
│   └── LoadPortControl   # LoadPort料盒端口（25片wafer）
│
├── Chamber/              # 腔体控件
│   └── ChamberControl    # 真空腔体
│
├── Pipeline/             # 管路控件
│   └── PipeControl       # 管道管路
│
└── Robot/                # 机械臂控件
    └── RobotControl      # Robot机械臂
```

## 控件列表

### 1. LoadPortControl - 料盒端口控件
**位置**: `Controls/Equipment/LoadPortControl.xaml`

**功能**:
- 显示料盒端口状态（Online/Offline/Alarm/Running）
- 显示25片wafer的状态网格（OK/NG/Processing/Empty）
- 显示料盒ID、到位状态、夹紧状态
- 统计OK/NG/加工中数量

**依赖属性**:
- `PortName`: 端口名称
- `PortStatus`: 端口状态
- `CassetteId`: 料盒ID
- `WaferCount`: Wafer数量
- `WaferStates`: Wafer状态列表（ObservableCollection<string>）
- `IsPresent`: 是否到位
- `IsClamped`: 是否夹紧

**示例**:
```xml
<equipment:LoadPortControl PortName="LP-01" 
                           PortStatus="Online" 
                           CassetteId="CAS-20260409-001"
                           WaferCount="25"
                           IsPresent="True"
                           IsClamped="True"/>
```

---

### 2. ChamberControl - 腔体控件
**位置**: `Controls/Chamber/ChamberControl.xaml`

**功能**:
- 显示腔体运行状态
- 显示真空度、温度、射频功率、气体流量、压力等参数
- 显示运行时间
- 报警/运行LED指示灯

**依赖属性**:
- `ChamberName`: 腔体名称
- `Status`: 状态（运行中/待机/维护中/报警/离线）
- `Vacuum`: 真空度
- `Temperature`: 温度
- `RFPower`: 射频功率
- `GasFlow`: 气体流量
- `Pressure`: 压力
- `RunTime`: 运行时间
- `IsAlarming`: 是否报警
- `IsRunning`: 是否运行

**示例**:
```xml
<chamber:ChamberControl ChamberName="Chamber-A" 
                        Status="运行中"
                        Vacuum="1.2E-3"
                        Temperature="150.5"
                        RFPower="500"
                        GasFlow="250"
                        Pressure="5.0"
                        RunTime="02:35:18"
                        IsAlarming="False"
                        IsRunning="True"/>
```

---

### 3. PipeControl - 管路控件
**位置**: `Controls/Pipeline/PipeControl.xaml`

**功能**:
- 显示管路状态
- 显示压力、流量、温度参数
- 流向指示箭头

**依赖属性**:
- `PipeName`: 管路名称
- `Pressure`: 压力（MPa）
- `FlowRate`: 流量（L/min）
- `Temperature`: 温度（°C）
- `Status`: 状态（正常/警告/报警/关闭）
- `IsFlowing`: 是否流动

**示例**:
```xml
<pipeline:PipeControl PipeName="Pipe-01" 
                      Pressure="0.45"
                      FlowRate="12.5"
                      Temperature="25.3"
                      Status="正常"
                      IsFlowing="True"/>
```

---

### 4. RobotControl - 机械臂控件
**位置**: `Controls/Robot/RobotControl.xaml`

**功能**:
- 显示机械臂运行状态
- 显示X/Y/Z轴位置和旋转角度
- 显示速度
- 是否有片检测
- 电源/伺服/报警LED指示灯

**依赖属性**:
- `RobotName`: 机械臂名称
- `Status`: 状态（运行中/待机/初始化中/报警/离线）
- `PositionX`: X轴位置（mm）
- `PositionY`: Y轴位置（mm）
- `PositionZ`: Z轴位置（mm）
- `Rotation`: 旋转角度（°）
- `Speed`: 速度（mm/s）
- `HasWafer`: 是否有片
- `IsPowerOn`: 电源是否开启
- `IsServoOn`: 伺服是否开启
- `IsAlarming`: 是否报警

**示例**:
```xml
<robot:RobotControl RobotName="Robot-01" 
                    Status="运行中"
                    PositionX="125.5"
                    PositionY="80.3"
                    PositionZ="150.0"
                    Rotation="45.0"
                    Speed="500"
                    HasWafer="True"
                    IsPowerOn="True"
                    IsServoOn="True"
                    IsAlarming="False"/>
```

---

### 5. StatusIndicator - 状态指示灯
**位置**: `Controls/Common/StatusIndicator.xaml`

**功能**:
- 通用状态指示
- 支持多种状态颜色（OK/警告/报警/离线/信息）
- 带发光效果

**依赖属性**:
- `Label`: 标签文本
- `Status`: 状态（OK/正常/警告/报警/离线/信息）

**示例**:
```xml
<common:StatusIndicator Label="系统" Status="OK"/>
```

---

### 6. ValueDisplay - 数值显示
**位置**: `Controls/Common/ValueDisplay.xaml`

**功能**:
- 显示参数名称、数值、单位
- 可设置小数位数

**依赖属性**:
- `Label`: 参数名称
- `Value`: 数值
- `Unit`: 单位
- `DecimalPlaces`: 小数位数

**示例**:
```xml
<common:ValueDisplay Label="温度" Value="150.5" Unit="°C" DecimalPlaces="1"/>
```

---

## 如何扩展新控件

1. 在对应分类目录下创建新的UserControl（XAML + XAML.CS）
2. 定义依赖属性用于数据绑定
3. 在构造函数中初始化默认数据
4. 在MainWindow.xaml中添加引用命名空间并使用

## 设计规范

- 深色主题背景：#1E1E1E
- 卡片背景：#2D2D30
- 边框颜色：#3F3F46
- 成功/正常：#4CAF50（绿色）
- 警告：#FF9800（橙色）
- 报警/错误：#F44336（红色）
- 信息/运行：#2196F3（蓝色）
- 离线/禁用：#666666（灰色）
