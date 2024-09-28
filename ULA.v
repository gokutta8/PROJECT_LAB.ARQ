module ULA(input [7:0]SrcA, SrcB,
	   input [2:0]UlaControl,
	   output reg [7:0]UlaResult,
	   output reg Z);

	always @ (*)
	begin
		case (UlaControl)
		3'b010: begin
			UlaResult = SrcA & SrcB;
		end
		3'b011: begin
			UlaResult = SrcA | SrcB;
		end
		3'b000: begin
			UlaResult = SrcA + SrcB;
		end
		3'b001: begin
			UlaResult = SrcA + ~SrcB + 1;
		end
		3'b101: begin
			if (SrcA < SrcB)
				UlaResult = 1;
			else
				UlaResult = 0;
		end
		default:UlaResult = 8'h00;
		endcase
		
		if(UlaResult==8'h00)
				Z = 1;
		else 
				Z = 0;	
	end
endmodule