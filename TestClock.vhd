library IEEE;
use IEEE.std_logic_1164.all;


entity TestClock is
port(CLK: in std_logic;
	LED1, LED2, LED3, LED4: out std_logic);
end TestClock;

architecture execute of TestClock is
component GenClock
Generic(time_period: integer range 1 to 4);
Port(CLK: in std_logic;
	CLOCK: buffer std_logic);
end component;

begin
U1 : GenClock generic map (1) port map (CLK, LED1);
U2 : GenClock generic map (2) port map (CLK, LED2);
U3 : GenClock generic map (3) port map (CLK, LED3);
U4 : GenClock generic map (4) port map (CLK, LED4);


end execute;