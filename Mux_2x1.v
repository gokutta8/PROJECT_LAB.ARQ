module Mux_2x1 (input [7:0]i0, i1,
		input sel,
		output reg[7:0]out);
	
	always @ * 
	begin
		if (!sel)
			out = i0;
		else 
			out = i1;
	end	
endmodule