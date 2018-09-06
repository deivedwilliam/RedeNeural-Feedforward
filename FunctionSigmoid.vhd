library ieee;


use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_of_types_and_weights.all;


package FunctionSigmoid is
	
	function Sigmoid(signal inputf: signed) return signed;

end package FunctionSigmoid;

package body FunctionSigmoid is

	function Sigmoid(signal inputf: signed) return signed is
		
		variable temp: integer range 0 to 4**N-1;
		variable res: integer range 0 to 2**N-1;
		
	begin
	
		temp := to_integer(abs(inputf));
		
		if(temp = 0) then 
			res := 0;
		elsif(temp > 0 and temp < 97) then
			res := 2;
		elsif(temp >= 97 and temp < 198) then
			res := 6;
		elsif(temp >= 198 and temp < 305) then
			res := 10;
		elsif(temp >= 305 and temp < 425) then
			res := 14;
		elsif(temp >= 425 and temp < 567) then
			res := 18;
		elsif(temp >= 567 and temp < 753) then
			res := 22;
		elsif(temp >= 753 and temp < 1047) then
			res := 26;
		else
			res := 30;
		end if;
		
		if(inputf(2*N-1) = '0') then 
			return to_signed(res,N);
		else
			return to_signed(-res,N);
		end if;
	end function Sigmoid;
end package body FunctionSigmoid;	