within VirtualFCS.SubSystems.Air;

block SubSystemAirControl

  parameter Real pressure_Air_set(unit = "Pa") = 150000 "Set H2 Pressure";
  parameter Real massFlow_Air_set(unit = "kg/s") = 4e-3 "Set H2 Recirculation Mass Flow";

  VirtualFCS.Control.PumpSpeedControl pumpSpeedControl annotation(
    Placement(visible = true, transformation(origin = {0, -7.10543e-15}, extent = {{-58, -58}, {58, 58}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant setAirPressure(k = pressure_Air_set) annotation(
    Placement(visible = true, transformation(origin = {1, 145}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant setAirMassFlow(k = massFlow_Air_set) annotation(
    Placement(visible = true, transformation(origin = {-144, 28}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  
  
  Modelica.Blocks.Routing.Multiplex2 multiplex2 annotation(
    Placement(visible = true, transformation(origin = {140, 0}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput controlInterface[2] annotation(
    Placement(visible = true, transformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput sensorInterface[2] annotation(
    Placement(visible = true, transformation(origin = {-220, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-220, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Routing.DeMultiplex2 deMultiplexAirSensors annotation(
    Placement(visible = true, transformation(origin = {-138, -120}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression getAirMassFlow(y = deMultiplexAirSensors.y1[1]) annotation(
    Placement(visible = true, transformation(origin = {-121, -32}, extent = {{-23, -16}, {23, 16}}, rotation = 0)));
equation
  connect(setAirMassFlow.y, pumpSpeedControl.setMassFlow) annotation(
    Line(points = {{-128, 28}, {-66, 28}, {-66, 30}, {-64, 30}}, color = {0, 0, 127}));
  connect(setAirPressure.y, multiplex2.u1[1]) annotation(
    Line(points = {{18, 146}, {96, 146}, {96, 11}, {118, 11}}, color = {0, 0, 127}));
  connect(pumpSpeedControl.setPumpSpeed, multiplex2.u2[1]) annotation(
    Line(points = {{64, 0}, {92, 0}, {92, -11}, {118, -11}}, color = {0, 0, 127}));
  connect(multiplex2.y, controlInterface) annotation(
    Line(points = {{160, 0}, {204, 0}, {204, 0}, {210, 0}}, color = {0, 0, 127}));
  connect(sensorInterface, deMultiplexAirSensors.u) annotation(
    Line(points = {{-220, 0}, {-182, 0}, {-182, -120}, {-164, -120}, {-164, -120}}, color = {0, 0, 127}));
  connect(getAirMassFlow.y, pumpSpeedControl.getMassFlow) annotation(
    Line(points = {{-96, -32}, {-66, -32}, {-66, -30}, {-64, -30}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1), graphics = {Rectangle(fillColor = {50, 50, 50}, fillPattern = FillPattern.Solid, extent = {{-200, 200}, {200, -200}}), Text(origin = {-25, 244}, lineColor = {0, 0, 255}, extent = {{-53, 28}, {91, -54}}, textString = "%name")}));
end SubSystemAirControl;
