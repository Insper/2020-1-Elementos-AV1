library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_questao1 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_questao1 is

component questao1 is  port (
	a : in  STD_LOGIC_VECTOR(2 downto 0);
	even : out STD_LOGIC := '0'	);
end component;

signal A : std_logic_vector(2 downto 0);
signal e : std_logic;

begin

  u1 : questao1 port map(a,e);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    a <= "000"; wait for 200 ps;
    assert(e = '1')  report "Falha em teste" severity error;

    a <= "001"; wait for 200 ps;
    assert(e = '0')  report "Falha em teste" severity error;

    a <= "010"; wait for 200 ps;
    assert(e = '0')  report "Falha em teste" severity error;

    a <= "011"; wait for 200 ps;
    assert(e = '1')  report "Falha em teste" severity error;

    a <= "100"; wait for 200 ps;
    assert(e = '0')  report "Falha em teste" severity error;

    a <= "101"; wait for 200 ps;
    assert(e = '1')  report "Falha em teste" severity error;

    a <= "110"; wait for 200 ps;
    assert(e = '1')  report "Falha em teste" severity error;

    a <= "111"; wait for 200 ps;
    assert(e = '0')  report "Falha em teste" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui


  end process;
end architecture;
