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

entity spi_master is
	port (   clk_in : in  STD_LOGIC; --clk_da2
				Data1 : in  std_logic_vector(11 DOWNTO 0);--pila
				Data2 : in  STD_LOGIC_VECTOR(11 DOWNTO 0);--not pila
				
				CS_spi : out std_logic;
				CLK_spi : out std_logic;
				MOSI1_spi  : out std_logic;
				MOSI2_spi  : out std_logic
				);
end spi_master;

architecture Behavioral of spi_master is

signal bit_counter : integer range 0 to 16 := 0;
signal Data1_s : std_logic_vector (11 downto 0);
signal Data2_s : std_logic_vector (11 downto 0);
signal CS_s : std_logic :='1';

begin

CS_spi <= Cs_s;
CLK_spi <= clk_in;

process(clk_in, cs_s)--bit_counter
begin
if (CS_s ='1' and clk_in'event and clk_in = '1') then
	Data1_s<=Data1;
	Data2_s<=Data2;
end if;
end process;

process (clk_in, bit_counter)
begin	
	if (clk_in'event and clk_in = '0') then
		if (bit_counter = 16) then
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
			 when 0 => MOSI1_spi <= '0';--X
						  MOSI2_spi <= '0';--X
						  CS_s <= '0';
			 when 1 => MOSI1_spi <= '0';--X
						  MOSI2_spi <= '0';--X	
			 when 2 => MOSI1_spi <= '0';--PD0
						  MOSI2_spi <= '0';--PD0
			 when 3 => MOSI1_spi <= '0';--PD1
						  MOSI2_spi <= '0';--PD1				 
			 when 4 => MOSI1_spi <= data1_s(11);--? убрать
						  MOSI2_spi <= data2_s(11);				 
			 when 5 => MOSI1_spi <= data1_s(10);
						  MOSI2_spi <= data2_s(10);				 
			 when 6 => MOSI1_spi <= data1_s(9);
						  MOSI2_spi <= data2_s(9);				 
			 when 7 => MOSI1_spi <= data1_s(8);
						  MOSI2_spi <= data2_s(8);				 
			 when 8 => MOSI1_spi <= data1_s(7);
						  MOSI2_spi <= data2_s(7);				 
			 when 9 => MOSI1_spi <= data1_s(6);
						  MOSI2_spi <= data2_s(6);				 
			 when 10 => MOSI1_spi <= data1_s(5);
						   MOSI2_spi <= data2_s(5);				 
			 when 11 => MOSI1_spi <= data1_s(4);
						   MOSI2_spi <= data2_s(4);
			 when 12 => MOSI1_spi <= data1_s(3);
							MOSI2_spi <= data2_s(3);
			 when 13 => MOSI1_spi <= data1_s(2);
							MOSI2_spi <= data2_s(2);
			 when 14 => MOSI1_spi <= data1_s(1);
							MOSI2_spi <= data2_s(1);
			 when 15 => MOSI1_spi <= data1_s(0);
							MOSI2_spi <= data2_s(0);
			 when 16 => MOSI1_spi <= '0';
							MOSI2_spi <= '0';
							CS_s <= '1';
		end case;
end if;
end process;

end Behavioral;

