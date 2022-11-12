library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
  Port (a : in std_logic_vector(3 downto 0);
  b : in std_logic_vector(3 downto 0);
  c : in std_logic_vector(3 downto 0);
  d: in std_logic_vector(3 downto 0);
  clk : in std_logic ;
  q: out std_logic_vector(6 downto 0);
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
signal ts0,ts1:  STD_LOGIC;
signal x:  std_logic_vector(3 downto 0);
begin
UUT1 : clock_modified port map(clk=> clk, ts0=>ts0,ts1=>ts1,an=>an);
UUT2 : mux_gate port map(a=>a,b=>b,c=>c,d=>d,s0=>ts0,s1=>ts1,o=>x);
UUT3 : seven_display_gate port map(a=>x,q=>q);

end Behavioral;
