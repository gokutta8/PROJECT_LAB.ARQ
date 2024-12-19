module ParallelOUT(input EN, clk, rst,
						input [7:0]RegData, Address,
						output reg [7:0] w_DataOut);
			
	integer flip;	
	always @ (*)begin
		if (Address == 8'hFF)
			flip = 1;
		else
			flip = 0;
	end
	
	always @ (posedge clk or negedge rst)begin
		if (~rst)
			w_DataOut <= 0;
		else if (EN && flip == 1'b1)
			w_DataOut <= RegData;
	end

endmodule
