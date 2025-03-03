within VirtualFCS.Control;

block PumpSpeedControl
  Modelica.Blocks.Continuous.LimPID limPID( initType = Modelica.Blocks.Types.InitPID.InitialOutput, limitsAtInit = true, yMax = 1, yMin = 0, y_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput setMassFlow annotation(
    Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput getMassFlow annotation(
    Placement(visible = true, transformation(origin = {-100, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput setPumpSpeed annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(setMassFlow, limPID.u_s) annotation(
    Line(points = {{-100, 40}, {-60, 40}, {-60, 30}, {-42, 30}, {-42, 30}}, color = {0, 0, 127}));
  connect(getMassFlow, limPID.u_m) annotation(
    Line(points = {{-100, -20}, {-60, -20}, {-60, 0}, {-30, 0}, {-30, 18}, {-30, 18}}, color = {0, 0, 127}));
  connect(limPID.y, setPumpSpeed) annotation(
    Line(points = {{-18, 30}, {40, 30}, {40, 0}, {110, 0}, {110, 0}}, color = {0, 0, 127}));
  annotation(
    Icon(graphics = {Rectangle(fillColor = {50, 50, 50}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-3, 126}, lineColor = {0, 0, 255}, extent = {{-55, 18}, {55, -18}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end PumpSpeedControl;
