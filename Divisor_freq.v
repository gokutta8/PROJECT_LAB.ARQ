module Divisor_frequencia
	(input clk_50MHz,
	 output reg clk_1Hz
	);

	reg [31:0] flip;

	always @(posedge clk_50MHz)
	begin

	if (flip == 2500000)
	begin
		clk_1Hz <= ~clk_1Hz;
		flip <= 0;
	end

	else
	begin
		flip <= flip + 1;
	end

	end

endmodule
