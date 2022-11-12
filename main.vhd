library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity main is
   Port (clk : in std_logic ;
   q: out std_logic_vector(6 downto 0);
   dp: out std_logic;
   tart: in std_logic;
   ause: in std_logic;
   ontinue: in std_logic;
   eset: IN std_logic;
   an : out std_logic_vector(3 downto 0));
end main;

architecture Behavioral of main is
component mux_gate is
port(

     a : in std_logic_vector(3 downto 0);
     b : in std_logic_vector(3 downto 0);
     c : in std_logic_vector(3 downto 0);
     d : in std_logic_vector(3 downto 0);
     s0,s1: in STD_LOGIC;
       dp: out std_logic;
     o: out std_logic_vector(3 downto 0));
end component;
component seven_display_gate is
port(
     a: in std_logic_vector(3 downto 0);
     q: out std_logic_vector(6 downto 0));
end component;
component clock_modified is
port(
     clk: IN std_logic;
     ts0,ts1: out STD_LOGIC;
     an: out std_logic_vector(3 downto 0));
end component;
component clock_divider is
port(
     clk,reset,enable: IN std_logic;
aa,ba,ca,da: INout std_logic_vector(3 downto 0):="0000");
end component;
component edge is
Port( clk : in std_logic;
inp : in std_logic;
o : out std_logic);
end component;
signal ts0,ts1:  STD_LOGIC;
signal x:  std_logic_vector(3 downto 0);
signal y,z,w,r:std_logic_vector(3 downto 0);
signal i,j,k: std_logic:='0';
signal m:std_logic:='0';
signal enable_watch: std_logic:='0';
signal rising_a0,rising_a1,rising_a2,rising_a3,b0,b1,b2,b3 : std_logic 
:='0';
begin
process(clk,rising_a0,rising_a1,rising_a2,rising_a3)
begin
if falling_edge(clk) then
if rising_a3='1' then
enable_watch<='0';
elsif rising_a1='1' then
enable_watch<='0';
elsif rising_a2='1' then
enable_watch<='1';
elsif rising_a0='1' then
enable_watch<='1';
end if;
end if;
end process;
UUT1 : clock_modified port map(clk=> clk, ts0=>ts0,ts1=>ts1,an=>an);
UUT4 : clock_divider port map(clk=> 
clk,reset=>rising_a3,enable=>enable_watch,aa=>y,ba=>z,ca=>w,da=>r);
UUT2 : mux_gate port 
map(a=>y,b=>z,c=>w,d=>r,s0=>ts0,s1=>ts1,dp=>dp,o=>x);
UUT3 : seven_display_gate port map(a=>x,q=>q);
process(clk)
begin
if rising_edge(clk) then
     rising_a0<= tart and (not b0);
     b0<= tart;
end if;
end process;
process(clk)
begin
if rising_edge(clk) then
     rising_a3<= eset and (not b3);
     b3<= eset;
end if;
end process;
process(clk)
begin
if rising_edge(clk) then
     rising_a1<= ause and (not b1);
     b1<= ause;
end if;
end process;
process(clk)
begin
if rising_edge(clk) then
     rising_a2<= ontinue and (not b2);
     b2<= ontinue;
end if;
end process;
end Behavioral;
