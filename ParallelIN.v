module ParallelIN(input [7:0]MemData, Address, Datain,
						output reg [7:0]RegData);
			
	integer flip;	
	always @ (*)begin
		if (Address == 8'hFF)
			flip = 1;
		else
			flip = 0;
	end
	
	always @ (*)begin
		case (flip)
		1'b0: RegData = MemData;
		1'b1: RegData = Datain;
		default: RegData = 8'hff;
		endcase
	end

endmodule
