library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RGB is
    Port ( Din 	: in	STD_LOGIC_VECTOR (11 downto 0);			
		   Nblank : in	STD_LOGIC;																					
           d_out 	: out	unsigned(7 downto 0));		
end RGB;

architecture Behavioral of RGB is

begin
process(Nblank)
    variable Rt,Gt,Bt,GS : unsigned(15 downto 0);
      begin
		Rt := "00001010" * unsigned(Din(11 downto 8)& Din(11 downto 8)); 
		Gt := "00111100" * unsigned(Din(7 downto 4)&Din(7 downto 4)); 
		Bt := "00011110" * unsigned(Din(3 downto 0)&Din(3 downto 0));
		GS := Rt + Gt + Bt;
		d_out <= GS(15 downto 8) + ("0000000" & GS(7));
end process;
end architecture;