module UndeControl(input [6:0]op, func7, 
		input [2:0]func3, 
		output reg[2:0]ULAControl, 
		output reg[1:0]ImmSrc, ResultSrc,			
		output reg Jump, Jr, ULASrc, RegWrite, MemWrite, Branch);
	
	wire [16:0]IN_unControl;
	assign IN_unControl = {op,func3,func7};

	always @ (*)
	begin
		casex (IN_unControl)
		17'b01100110000000000:begin //ADD
			RegWrite = 1;
			ULASrc = 0;
			ULAControl = 3'b000;
			ImmSrc = 2'bxx;
			MemWrite = 0;
			ResultSrc = 2'b00;
			Branch = 0;	
			Jump = 0;
			Jr = 0;		
		end
		17'b01100110000100000:begin //SUB
			RegWrite = 1;
			ULASrc = 0;
			ULAControl = 3'b001; 
			ImmSrc = 2'bxx;
			MemWrite = 0;
			ResultSrc = 2'b00;
			Branch = 0;
			Jump = 0;
			Jr = 0;
		end
		17'b01100111110000000:begin //AND
			RegWrite = 1;
			ULASrc = 0;
			ULAControl = 3'b010;
			ImmSrc = 2'bxx;
			MemWrite = 0;
			ResultSrc = 2'b00;
			Branch = 0;
			Jump = 0;
			Jr = 0;
		end
		17'b01100111100000000:begin //OR
			RegWrite = 1;
			ULASrc = 0;
			ULAControl = 3'b011;
			ImmSrc = 2'bxx;
			MemWrite = 0;
			ResultSrc = 2'b00;
			Branch = 0;
			Jump = 0;
			Jr = 0;
		end
		17'b01100110100000000:begin //SLT
			RegWrite = 1;
			ULASrc = 0;
			ULAControl =  3'b101;
			ImmSrc = 2'bxx;
			MemWrite = 0;
			ResultSrc = 2'b00;
			Branch = 0;
			Jump = 0;
			Jr = 0;
		end
		17'b0010011000xxxxxxx:begin //ADDI
			RegWrite = 1;
			ULASrc = 1;
			ULAControl =  3'b000;
			ImmSrc = 2'b00;
			MemWrite = 0;
			ResultSrc = 2'b00;
			Branch = 0;
			Jump = 0;
			Jr = 0;
		end
		17'b0000011000xxxxxxx:begin //LB
			RegWrite = 1;
			ULASrc = 1;
			ULAControl =  3'b000;
			ImmSrc = 2'b00;
			MemWrite = 0;
			ResultSrc = 2'b01;
			Branch = 0;
			Jump = 0;
			Jr = 0;
		end
		17'b0100011000xxxxxxx:begin //SB
			RegWrite = 0;
			ULASrc = 1;
			ULAControl =  3'b000;
			ImmSrc = 2'b01;
			MemWrite = 1;
			ResultSrc = 2'bxx;
			Branch = 0;
			Jump = 0;
			Jr = 0;
		end
		17'b1100011000xxxxxxx:begin //BEQ
			RegWrite = 0;
			ULASrc = 0;
			ULAControl =  3'b001;
			ImmSrc = 2'b10;
			MemWrite = 0;
			ResultSrc = 2'bxx;
			Branch = 1;
			Jump = 0;
			Jr = 0;
		end
		17'b1101111xxxxxxxxxx:begin //JAL
			RegWrite = 1;
			ULASrc = 1;
			ULAControl =  3'bxxx;
			ImmSrc = 2'b11;
			MemWrite = 0;
			ResultSrc = 2'b10;
			Branch = 0;
			Jump = 1;
			Jr = 0;
		end
		17'b1100111000xxxxxxx:begin //JR 	
			RegWrite = 0;
			ULASrc = 0;
			ULAControl =  3'bxxx;
			ImmSrc = 2'bxx;
			MemWrite = 0;
			ResultSrc = 2'bxx;
			Branch = 0;
			Jump = 1;
			Jr = 1;
		end
		17'b0010011111xxxxxxx:begin //ANDI 	
			RegWrite = 1;
			ULASrc = 1;
			ULAControl =  3'b010;
			ImmSrc = 2'b00;
			MemWrite = 0;
			ResultSrc = 2'b00;
			Branch = 0;
			Jump = 0;
			Jr = 0;
		end
 		17'b0010011110xxxxxxx:begin //ORI 	
			RegWrite = 1;
			ULASrc = 1;
			ULAControl =  3'b011;
			ImmSrc = 2'b00;
			MemWrite = 0;
			ResultSrc = 2'b00;
			Branch = 0;
			Jump = 0;
			Jr = 0;
		end
		default:begin
			RegWrite = 0;
			ULASrc = 0;
			ULAControl =  3'b000;
			ImmSrc = 1'bx;
			MemWrite = 0;
			ResultSrc = 2'b00;
			Branch = 0;
			Jump = 0;
			Jr = 0;
		end
endcase
end
endmodule