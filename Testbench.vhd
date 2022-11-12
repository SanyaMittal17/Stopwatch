library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity a1_tb is

end a1_tb;

architecture tb of a1_tb is
component main
Port(a: in std_logic_vector(0 to 3);
          b: in std_logic_vector(0 to 3);
          c: in std_logic_vector(0 to 3);
          d: in std_logic_vector(0 to 3);
          clk : in STD_LOGIC;
          q: out std_logic_vector(0 to 6);
          an: out std_logic_vector(0 to 3) );
end component;
signal s,t,u,v: std_logic_vector(0 to 3);
signal clk: std_logic:='0';
signal cat:std_logic_vector(0 to 6);
signal an: std_logic_vector(0 to 3);
begin
UUT5: main port map(a=>s,b=>t,c=>u,d=>v,clk=>clk,q=>cat,an=>an);
--inputs
s<="1000", "1001" after 20ns,"1111" after 40ns;
t<="1001", "1000" after 20ns,"1110" after 40ns;
u<="0010", "1110" after 20ns,"1010" after 40ns;
v<="1110", "0010" after 20ns, "1101" after 40ns;
clk<= not(clk) after 010 ns;
end tb;
