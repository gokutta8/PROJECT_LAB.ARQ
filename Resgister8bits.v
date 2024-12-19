module register_8bits (
  input  [7:0] wd3,
  input  [2:0] wa3, ra1, ra2,
  input  clk, rst, we3,
  output reg [7:0] rd1, rd2, x0, x1, x2, x3, x4, x5, x6, x7
);
  integer k;
  
  reg [7:0] regfile [7:0];
  
  
  always @(*)
  begin
	  rd1 = regfile[ra1];
	  rd2 = regfile[ra2];
	  x0 = regfile[0];
	  x1 = regfile[1];
	  x2 = regfile[2];
	  x3 = regfile[3];
	  x4 = regfile[4];
	  x5 = regfile[5];
	  x6 = regfile[6];
	  x7 = regfile[7];
  
  end

 always @(posedge clk or negedge rst)
 begin 
		if (!rst)
	      begin
			for (k=0; k<8; k=k+1) 
			   begin
				regfile[k] <= 0;
				end
			end
		else if (we3 && wa3 != 3'b0) 
		begin 
	   regfile[wa3] <= wd3;
		end
end
endmodule
