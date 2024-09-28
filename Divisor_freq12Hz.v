module clock12Hz
	(input clk_50MHz,
	 output reg clk_12Hz
	);

	reg [31:0] flip;

	always @(posedge clk_50MHz)
	begin

	if (flip == 2083333)
	begin
		clk_12Hz <= ~clk_12Hz;
		flip <= 0;
	end

	else
	begin
		flip <= flip + 1;
	end

	end

endmodule
