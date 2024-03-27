
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY simulacion1 IS
END simulacion1;
 
ARCHITECTURE behavior OF simulacion1 IS
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memoria_ram
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         en : IN  std_logic;
         wr : IN  std_logic;
         rd : IN  std_logic;
         din : IN  std_logic_vector(31 downto 0);
         addr : IN  std_logic_vector(7 downto 0);
         dout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal en : std_logic := '0';
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';
   signal din : std_logic_vector(31 downto 0) := (others => '0');
   signal addr : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memoria_ram PORT MAP (
          clk => clk,
          rst => rst,
          en => en,
          wr => wr,
          rd => rd,
          din => din,
          addr => addr,
          dout => dout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		
		rst <= '1';
		en <= '1';
      wr <= '1';
		addr <= "10100101";
		din <= "01001010001000001100000010000100";
		
		wait for clk_period;
		rst <= '0';
		en <= '1';
		wr <= '1';
		addr <= "10100111";
		din <= "00001111000011110000111100001111";
		
		wait for clk_period;
		
		rst <= '0';
		en <= '1';
		wr <= '0';
      rd <= '1';
		addr <= "10100101";
		
		wait for clk_period*3;
		
		rst <= '0';
		en <= '1';
		wr <= '0';
      rd <= '1';
		addr <= "10100111";
		
		
		wait for clk_period*3;
		
		
      wait;
   end process;

END;
