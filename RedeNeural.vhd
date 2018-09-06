library ieee;  

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_of_types_and_weights.all;
use work.FunctionSigmoid.all;

entity RedeNeural is

	port(
			clk, rst: in std_logic;
			x: in signed(N-1 downto 0);
			y: out short_array);
			
end entity RedeNeural;

architecture behaviourRNA of RedeNeural is
	
	signal prod,acc1,acc2: long_array;
	signal resFSigmoid: short_array;
	signal counter: integer range 1 to weights+1;

begin
	
	process(clk)
	begin
		
		if(clk' event and clk = '1') then
			if(rst = '1') then
				counter <= 1;
			else 
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if(clk' event and clk = '1') then
			if(rst ='1') then
				for i in 1 to neurons loop
					y(i) <= resFSigmoid(i);
					acc2(i) <= (others => '0');
				end loop;
			else
				for i in 1 to neurons loop
					acc2(i) <= acc1(i);
				end loop;
			end if;
		end if;
	end process;
	
	process(x, counter)
	begin
		for i in 1 to neurons loop
			prod(i) <= x * to_signed(weight(i,counter),N);
			acc1(i) <= prod(i) + acc2(i);
			if((acc2(i)(2*N-1) = prod(i)(2*N-1)) and (acc1(i)(2*N-1) /= acc2(i)(2*N-1))) then
				acc1(i) <= ((2*N-1) => acc2(i)(2*N-1), others => not acc2(i)(2*N-1));
			end if;
			
			resFSigmoid(i) <= Sigmoid(acc2(i));
		end loop;
	end process;
end architecture behaviourRNA;