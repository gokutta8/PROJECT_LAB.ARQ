module Data_Memory (input rst, clk, WE,
		input [7:0]A, WD,
		output reg[7:0]RD);
	
	reg [7:0] memory[255:0];
	integer flip;

	always @ (posedge clk or negedge rst)
	begin
		if(~rst)begin
			for (flip = 0; flip <255 ; flip = flip +1)	
				memory[flip] <= 0;
		end

		else if (WE!= 1'b0 && A != 8'hff)begin
			memory[A] <= WD;
		end		
	end

	always @ (*)
		RD <= memory[A];
endmodule
