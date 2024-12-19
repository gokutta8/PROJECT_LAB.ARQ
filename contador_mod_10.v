module contador_modulo_10
	( input clk_1Hz,
	  input reset,
	  output reg[3:0] out
	);

	always @ (posedge clk_1Hz or negedge reset)
	begin
	
	if (~reset)
	begin
		out <= 0;
	end

	
	else
	begin
		out <= out + 1;
		
		if (out == 10)
		begin
			out <= 0;
		end
	end
		

		
	
	end

endmodule