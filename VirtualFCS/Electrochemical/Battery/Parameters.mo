within VirtualFCS.Electrochemical.Battery;

package Parameters
  extends Modelica.Icons.UtilitiesPackage;

  package Functions
    extends Modelica.Icons.FunctionsPackage;

    function getOCP_NMC
      extends Modelica.Icons.Function;
      
      input Real SOC "State of Charge";
      
      output SI.ElectricPotential OCP "Open-Circuit Potential";
      
      // Coefficients for open-circuit voltage calculation
      // NMC
      Real A0 = 2.951;
      Real A1 = 1;
      Real A2 = -0.05;
      Real A3 = -0.4;
      Real A4 = -0.085;
      
    algorithm
    
      OCV := (A0 + A1 * SOC + A2 / SOC + A3 * log(SOC + 0.001) + A4 * log(1.01 - SOC));

    end getOCP_NMC;
  end Functions;
end Parameters;
