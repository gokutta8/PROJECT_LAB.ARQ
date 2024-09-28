module contador_modulo_rpm
	( input clk_12Hz,
	  output reg[0:6] Hex0, Hex1, Hex2, Hex3
	);

	reg [3:0] out;

	always @ (posedge clk_12Hz)
	begin

		case(out)
		4'b0000: begin
			Hex3 <= 7'b0111111;
			Hex2 <= 7'b1111111;
			Hex1 <= 7'b1111111;
			Hex0 <= 7'b1111111;
			out <=out + 1;
			end
		4'b0001: begin
			Hex2 <= 7'b0111111;
			Hex3 <= 7'b1111111;
			Hex1 <= 7'b1111111;
			Hex0 <= 7'b1111111;
			out <=out + 1;
			end
		4'b0010: begin
			Hex1 <= 7'b0111111;
			Hex2 <= 7'b1111111;
			Hex3 <= 7'b1111111;
			Hex0 <= 7'b1111111;
			out <=out + 1;
			end
		4'b0011: begin
			Hex0 <= 7'b0111111;
			Hex2 <= 7'b1111111;
			Hex1 <= 7'b1111111;
			Hex3 <= 7'b1111111;
			out <=out + 1;
			end
		4'b0100: begin
			Hex0 <= 7'b1011111;
			Hex2 <= 7'b1111111;
			Hex1 <= 7'b1111111;
			Hex3 <= 7'b1111111;
			out <=out + 1;
			end
		4'b0101: begin
			Hex0 <= 7'b1101111;
			Hex2 <= 7'b1111111;
			Hex1 <= 7'b1111111;
			Hex3 <= 7'b1111111;
			out <=out + 1;
			end
		4'b0110: begin
			Hex0 <= 7'b1110111;
			Hex2 <= 7'b1111111;
			Hex1 <= 7'b1111111;
			Hex3 <= 7'b1111111;
			out <=out + 1;
			end
		4'b0111: begin
			Hex1 <= 7'b1110111;
			Hex2 <= 7'b1111111;
			Hex0 <= 7'b1111111;
			Hex3 <= 7'b1111111;
			out <=out + 1;
			end
		4'b1000: begin
			Hex2 <= 7'b1110111;
			Hex3 <= 7'b1111111;
			Hex1 <= 7'b1111111;
			Hex0 <= 7'b1111111;
			out <=out + 1;
			end
		4'b1001: begin
			Hex3 <= 7'b1110111;
			Hex2 <= 7'b1111111;
			Hex1 <= 7'b1111111;
			Hex0 <= 7'b1111111;
			out <=out + 1;
			end
		4'b1010: begin
			Hex3 <= 7'b1111011;
			Hex2 <= 7'b1111111;
			Hex1 <= 7'b1111111;
			Hex0 <= 7'b1111111;
			out <=out + 1;
			end
		4'b1011: begin
			Hex3 <= 7'b1111101;
			Hex2 <= 7'b1111111;
			Hex1 <= 7'b1111111;
			Hex0 <= 7'b1111111;
			out <= 0;
			end
		endcase 
	
	end

endmodule
