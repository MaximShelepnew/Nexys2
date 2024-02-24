----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:17:25 09/27/2023 
-- Design Name: 
-- Module Name:    spi_slave - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADC_priem is
	port (   clk_in : in  STD_LOGIC; --clk_da2
				
				CS_spi : out std_logic;
				CLK_spi : out std_logic;
				MOSI1_spi  : in std_logic;
				MOSI2_spi  : in std_logic;
				
				DataADC : out std_logic_vector(11 downto 0)
				);
end ADC_priem;

architecture Behavioral of ADC_priem is

signal bit_counter : integer range 0 to 15	 := 0;
signal CS_s : std_logic :='1';
signal DataADC1 : std_logic_vector(11 downto 0):="000000000000";

begin

CLK_spi <= clk_in;
cs_spi <= cs_s;

process (clk_in, bit_counter)
begin	
	if (clk_in'event and clk_in = '0') then
		if (bit_counter = 15) then
		bit_counter <= 0;
			else
				bit_counter <= bit_counter + 1;
		end if;
	end if;
end process;


process (clk_in, bit_counter)
begin
if (clk_in'event and clk_in ='1') then
		case bit_counter is
			 when 0 => CS_s <= '0';	DataADC1 <= "000000000000";		
			 when 3 => DataADC(11) <= MOSI1_spi;
			 when 4 => DataADC1(10) <= MOSI1_spi;
			 when 5 => DataADC1(9) <= MOSI1_spi;
			 when 6 => DataADC1(8) <= MOSI1_spi;
			 when 7 => DataADC1(7) <= MOSI1_spi;
			 when 8 => DataADC1(6) <= MOSI1_spi;
			 when 9 => DataADC(5) <= MOSI1_spi;
			 when 10 => DataADC1(4) <= MOSI1_spi;
			 when 11 => DataADC1(3) <= MOSI1_spi;
			 when 12 => DataADC1(2) <= MOSI1_spi;
			 when 13 => DataADC1(1) <= MOSI1_spi;
			 when 14 => DataADC1(0) <= MOSI1_spi;	 
			 when 15 => 
			 DataADC <= DataADC1;
			 CS_s <= '1';
			 when others => null;
		end case;
end if;
end process;

end Behavioral;



