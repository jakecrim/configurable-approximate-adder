library IEEE;
use IEEE.std_logic_1164.all;

entity ApproxAdder is
    port(A,B: in std_logic_vector(7 downto 0);
    Ci: in std_logic;
    S: out std_logic_vector(7 downto 0);
    Co: out std_logic);
end ApproxAdder;

Architecture Structure of ApproxAdder is
    signal C: std_logic;
    signal G: std_logic_vector(7 downto 0);
    signal Carry: std_logic;
    signal CPredict: std_logic;
    signal BP: std_logic;
  
    component adder4
        port(A,B: in std_logic_vector(3 downto 0);
        Ci: in std_logic;
        S: out std_logic_vector(3 downto 0);
        Co: out std_logic);
    end component;

    component CarrySelectUnit
        port(Control, Cpredict, Cout, BP, G: in std_logic;  
            Cin: out std_logic);
    end component;
        
    component CarryPredict
        port(A, B: in std_logic_vector(3 downto 0);
            CPredict, BP: out std_logic);
    end component;
    begin
        -- Generate
        G <= A and B;

	    -- Section 1
        SumGenerator1: adder4 port map (A(3 downto 0), B(3 downto 0), Ci, S(3 downto 0), C);
        CarryPredict1: CarryPredict port map (A(3 downto 0), B(3 downto 0), CPredict, BP);
        CSU1: CarrySelectUnit port map ('0', CPredict, C, BP, G(0), Carry);
    	-- Section 2    
        SumGenerator2: adder4 port map (A(7 downto 4), B(7 downto 4), Carry, S(7 downto 4), Co);

end Structure;
