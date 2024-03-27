library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity memoria_ram is
    generic (datai: integer:=32 );
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           en : in  STD_LOGIC;
           wr : in  STD_LOGIC;
           rd : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (datai-1 downto 0);
           addr : in  STD_LOGIC_VECTOR ( 7 downto 0);
           dout : out  STD_LOGIC_VECTOR (datai-1 downto 0));
end memoria_ram;

architecture Behavioral of memoria_ram is

--alto y ancho del arreglo de la matriz 
type ram_type is array (255 downto 0) of std_logic_vector (31 downto 0);
signal ram_tade: ram_type;

begin

process (clk)
 begin
   if (clk'event and clk = '1') then
	   if (rst = '1') then 
	for i in 0 to 255 loop
    dout <= (others => '0');
   end loop;
      if (en = '1') then 
  		 if ( wr = '1') then
            ram_tade(conv_integer(addr)) <= din;
         if ( rd = '1') then
            dout <= ram_tade(conv_integer(addr));
         end if;
		 end if;
		end if;
     end if;
   end if;
end process;
  
end Behavioral;

