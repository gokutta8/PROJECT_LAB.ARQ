
`default_nettype none //Comando para desabilitar declaração automática de wires
module Mod_Teste (
//Clocks
input CLOCK_27, CLOCK_50,
//Chaves e Botoes
input [3:0] KEY,
input [17:0] SW,
//Displays de 7 seg e LEDs
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
output [8:0] LEDG,
output [17:0] LEDR,
//Serial
output UART_TXD,
input UART_RXD,
inout [7:0] LCD_DATA,
output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS,
//GPIO
inout [35:0] GPIO_0, GPIO_1
);
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
wire [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
LCD_TEST MyLCD (
.iCLK ( CLOCK_50 ),
.iRST_N ( KEY[0] ),
.d0x0(w_d0x0),.d0x1(w_d0x1),.d0x2(w_d0x2),.d0x3(w_d0x3),.d0x4(w_d0x4),.d0x5(w_d0x5),
.d1x0(w_d1x0),.d1x1(w_d1x1),.d1x2(w_d1x2),.d1x3(w_d1x3),.d1x4(w_d1x4),.d1x5(w_d1x5),
.LCD_DATA( LCD_DATA ),
.LCD_RW ( LCD_RW ),
.LCD_EN ( LCD_EN ),
.LCD_RS ( LCD_RS )
);
//---------- modifique a partir daqui --------

wire [31:0] w_Inst;
wire [7:0] w_ImmPCJ, w_pc, w_PCp4, w_rd1SrcA, w_rd2, w_ULAResultWd3, w_RData, w_Wd3, w_SrcB, w_Imm, w_ImmPC, w_PCn, w_RegData;
assign w_PCp4 = w_pc + 3'h4;
wire [2:0] w_ULAControl;
wire [1:0] w_ImmSrc, w_ResultSrc;
wire w_ULASrc, w_RegWrite, w_MemWrite, clk, w_Zero, w_Branch, w_PCSrc, w_Jump, w_Jr;
//assign clk = KEY[1];
Divisor_frequencia clock_1hz(.clk_50MHz(CLOCK_50),.clk_1Hz(clk));

Mux_2x1 PCnext(.i0(w_PCp4), .i1(w_ImmPCJ), .sel(w_PCSrc), .out(w_PCn));

RegisterPC registerteste(.clk(clk), .rst(KEY[2]),.PCin(w_PCn),.PC(w_pc));

InstMemory memoriainstanc(.Adress(w_pc),.CodMaquina(w_Inst));

UndeControl unidadeteste(.op(w_Inst[6:0]), .func7(w_Inst[31:25]), .func3(w_Inst[14:12]),.ULAControl(w_ULAControl), .ULASrc(w_ULASrc), .RegWrite(w_RegWrite), .ImmSrc(w_ImmSrc),
.MemWrite(w_MemWrite), .ResultSrc(w_ResultSrc), .Branch(w_Branch), .Jump(w_Jump), .Jr(w_Jr));

register_8bits registradores(.clk(clk), .we3(w_RegWrite), .rst(KEY[2]),.wa3(w_Inst[11:7]), .ra1(w_Inst[19:15]), .ra2(w_Inst[24:20]),.wd3(w_Wd3),.rd1(w_rd1SrcA), .rd2(w_rd2), .x0(w_d0x0), 
.x1(w_d0x1), .x2(w_d0x2), .x3(w_d0x3), .x4(w_d1x0), .x5(w_d1x1), .x6(w_d1x2), .x7(w_d1x3));

Mux_4x1 muxIMM(.i0(w_Inst[31:20]), .i1({w_Inst[31:25],w_Inst[11:7]}), .i2({w_Inst[7],w_Inst[30:25],w_Inst[11:8],1'b0}), .i3({w_Inst[31],w_Inst[19:12],w_Inst[20], w_Inst[30:21],1'b0}), .sel(w_ImmSrc), .out(w_Imm));
assign w_ImmPC = w_Imm + w_pc; 

Mux_2x1 muxULA(.i0(w_rd2), .i1(w_Imm), .sel(w_ULASrc), .out(w_SrcB));

Mux_2x1 addPC(.i0(w_ImmPC), .i1(w_rd1SrcA), .sel(w_Jr), .out(w_ImmPCJ));

ULA ulateste(.SrcA(w_rd1SrcA), .SrcB(w_SrcB), .UlaControl(w_ULAControl),.UlaResult(w_ULAResultWd3),.Z(w_Zero));

assign w_PCSrc = (w_Branch & w_Zero)|w_Jump;

Data_Memory datateste(.rst(KEY[2]), .clk(clk), .WE(w_MemWrite), .A(w_ULAResultWd3), .WD(w_rd2), .RD(w_RData));

Mux_4x1 muxRes(.i0(w_ULAResultWd3), .i1(w_RegData), .i2(w_PCp4), .i3(8'hxx), .sel(w_ResultSrc), .out(w_Wd3));

ParallelOUT out(.EN(w_MemWrite), .clk(clk), .rst(KEY[2]), .RegData(w_rd2), .Address(w_ULAResultWd3), .w_DataOut(w_d1x4));

ParallelIN(.MemData(w_RData), .Address(w_ULAResultWd3), .Datain(SW[7:0]),.RegData(w_RegData));

assign w_pc = w_d0x4;
assign LEDR[0] = w_Branch;
assign LEDR[1] = w_ResultSrc;
assign LEDR[2] = w_MemWrite;
assign LEDR[5:3] = w_ULAControl;
assign LEDR[6] = w_ULASrc;
assign LEDR[8:7] = w_ImmSrc;
assign LEDR[9] = w_RegWrite;
assign LEDR[10] = w_Zero;

Decodificador_4x7 zero(.in(w_Inst[3:0]),.out(HEX0));
Decodificador_4x7 um(.in(w_Inst[7:4]),.out(HEX1));
Decodificador_4x7 dois(.in(w_Inst[11:8]),.out(HEX2));
Decodificador_4x7 tres(.in(w_Inst[15:12]),.out(HEX3));
Decodificador_4x7 quatro(.in(w_Inst[19:16]),.out(HEX4));
Decodificador_4x7 cinco(.in(w_Inst[23:20]),.out(HEX5));
Decodificador_4x7 seis(.in(w_Inst[27:24]),.out(HEX6));
Decodificador_4x7 sete(.in(w_Inst[31:28]),.out(HEX7));

endmodule



