--**********************************************************--
--		Author: Deived William											--
--		Date: 25/08/2018													--
--		Rede Neural Artificial -- RNA									--			
--   	Tópicos Especiais em programação de Computadores		--
--		Prof: Juliana Zamith												--
--**********************************************************--

library ieee;

use ieee.numeric_std.all;

package package_of_types_and_weights is

	constant neurons: integer := 3;
	constant weights: integer := 5;
	constant N: integer := 6;
	
	type short_array is array (1 to neurons) of signed (N-1 downto 0);
	type long_array is array (1 to neurons) of signed (2*N-1 downto 0);
	type weight_array is array (1 to neurons, 1 to weights) of integer range -(2**(N-1)) to 2**(N-1)-1;
	
	constant weight: weight_array := ((1,4,5,5,-5), (5,20,25,25,-25), (-30,-30,-30,-30,-30));
	
end package package_of_types_and_weights;

