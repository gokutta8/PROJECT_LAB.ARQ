module InstMemory(input [7:0]Adress, 
		output reg [31:0]CodMaquina);

	always @ (*) begin
	/*	case (Adress)
		8'h00: CodMaquina = 32'h0ff00083;
		8'h04: CodMaquina = 32'h0e100fa3;
		8'h08: CodMaquina = 32'hfe000ce3;
		default: CodMaquina = 32'hxxxxxxxx;
		endcase*/
		case (Adress)
		8'h00: CodMaquina = 32'h0ff00083;
		8'h04: CodMaquina = 32'h00100113;
		8'h08: CodMaquina = 32'h0020f1b3;
		8'h0C: CodMaquina = 32'h003023b3;
		8'h10: CodMaquina = 32'h0e700fa3;
		8'h14: CodMaquina = 32'hfe0006e3;
		default: CodMaquina = 32'hxxxxxxxx;
		endcase  
	end
endmodule
