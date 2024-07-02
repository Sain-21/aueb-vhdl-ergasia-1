library ieee;
use ieee.std_logic_1164.all;

entity orosAnd2 is
	port (in1, in2: in std_logic; out1: out std_logic);
end orosAnd2;

architecture model_conc of orosAnd2 is
begin
	out1 <= in1 and in2;
end model_conc;

library ieee; 
use ieee.std_logic_1164.all; 

entity orosAnd3 is
	port (in1, in2, in3: in std_logic; out1: out std_logic);
end orosAnd3;

architecture model_conc2 of orosAnd3 is
begin
	out1 <= in1 and in2 and in3;
end model_conc2;

library ieee; 
use ieee.std_logic_1164.all;

entity orosAnd4 is
	port (in1, in2, in3, in4: in std_logic; out1: out std_logic);
end orosAnd4;

architecture model_conc3 of orosAnd4 is
begin
	out1 <= in1 and in2 and in3 and in4;
end model_conc3;

library ieee; 
use ieee.std_logic_1164.all;

entity SOP is 
	port (in1, in2, in3, in4: in std_logic; out1: out std_logic); 
end SOP; 

architecture model_conc4 of SOP is 
begin 
	out1 <= in1 or in2 or in3 or in4; 
end model_conc4;

library ieee; 
use ieee.std_logic_1164.all;

entity pr1_er2 is 
	port (x1, x2, x3, x4, x5: in std_logic; 
					f: out std_logic); 
end pr1_er2;

architecture structural of pr1_er2 is
component orosAnd2 
	port (in1, in2: in std_logic; out1: out std_logic); 
end component; 

component orosAnd3 
	port (in1, in2, in3: in std_logic; out1: out std_logic); 
end component; 

component orosAnd4 
	port (in1, in2, in3, in4: in std_logic; out1: out std_logic); 
end component; 

component SOP 
	port (in1, in2, in3, in4: in std_logic; out1: out std_logic); 
end component; 

signal oros1, oros2, oros3, func: std_logic;

begin

I0: orosAnd2 port map (not x3, not x5, oros1);
I1: orosAnd2 port map (not x4, not x5, oros2); 
I2: orosAnd4 port map (not x2, x3, x4, x5, oros3);
I3: orosAnd3 port map (x1, x2, not x3, func);
I4: SOP port map (oros1, oros2, oros3, func, f);


end structural;