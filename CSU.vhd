library IEEE;
use IEEE.std_logic_1164.all;

entity CarrySelectUnit is
port(Control, Cpredict, Cout, BP, G: in std_logic;  
    Cin: out std_logic);

end CarrySelectUnit;

architecture behavior of CarrySelectUnit is

begin
    
    Cin <= Cpredict and 

end behavior;