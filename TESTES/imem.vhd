 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 USE ieee.numeric_std.ALL;
 ------------------------------------------------------------------
 ENTITY imem IS
 PORT (address: STD_LOGIC_VECTOR(31 DOWNTO 0);
       data_out: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
 END imem;
 ------------------------------------------------------------------
 ARCHITECTURE rom OF imem IS
 
 SIGNAL reg_address: STD_LOGIC_VECTOR(31 DOWNTO 0);
 TYPE memory IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
 SIGNAL myrom: memory;
 SIGNAL endereco: integer;
 
 ATTRIBUTE ram_init_file: STRING;
 ATTRIBUTE ram_init_file OF myrom: SIGNAL IS "rom_contents.mif";
 BEGIN
 endereco <= to_integer(unsigned(address));
 data_out <= myrom(endereco);
 END rom;
 
 