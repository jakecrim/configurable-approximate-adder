library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.math_real.all;
use IEEE.std_logic_arith.all;
entity TestBenchE is
end TestBenchE;

architecture testbench of TestBenchE is
component ApproxAdder is
    port(A,B: in std_logic_vector(15 downto 0);
    Ci: in std_logic;
    S: out std_logic_vector(15 downto 0);
    Co: out std_logic);
end component;
signal A, B, Ci, Sum: std_logic_vector(15 downto 0);
signal Co: std_logic;
signal error: integer;
signal C: integer;
begin
	process
	variable count: integer := 100000000;
	variable seed1 : integer := 11;
	variable seed2: integer := 100;
	variable Areal, Breal, Creal: real;
	variable Aint, Bint,Cint,Sumint: integer;
	variable cotest: std_logic;
	begin
		error <= 0;
		C <= 0;
		for i in 1 to count loop
			uniform(seed1,seed2,Areal);
			uniform(seed1,seed2,Breal);
			uniform(seed1,seed2,Creal);
			Aint := integer(round(Areal * real(65535 - 0 + 1) + real(0) - 0.5));
			Bint := integer(round(Breal * real(65535 - 0 + 1) + real(0) - 0.5));
			Cint := integer(round(Creal * real(1 - 0 + 1) + real(0) - 0.5));
			--Sumint := Aint + Bint + Cint;
			Sumint := Aint + Bint;
			cotest := '0';
			if Sumint > 65535 then
				Sumint := Sumint-65536;
				cotest := '1';
			end if;
			A <= conv_std_logic_vector(Aint, A'length);
			B <= conv_std_logic_vector(Bint, B'length);
			Ci <= "0000000000000000";
			--Ci <= conv_std_logic_vector(Cint, Ci'length);
			wait for 40 ns;
			if sum /= conv_std_logic_vector(Sumint, Sum'length) then 
				error <= error + 1;
			end if;
			C<= C+1;
		end loop;
		report "Test Finished";
	end process;
	a1: ApproxAdder port map(A,B,Ci(0),Sum,Co);
end testbench;