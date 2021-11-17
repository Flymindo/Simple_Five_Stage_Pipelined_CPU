`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/09 00:47:45
// Design Name: 
// Module Name: CPU_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU_tb();
    // Inputs
	reg clk;
	reg Reset;
	reg LoadInstructions;
	reg [31:0] Instruction;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.out(out), 
		.clk(clk), 
		.Reset(Reset), 
		.LoadInstructions(LoadInstructions), 
		.Instruction(Instruction)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Reset = 1;
		LoadInstructions = 0;
		Instruction = 0;
		#10;
		Reset = 0;
		LoadInstructions = 1;
		#10;
		// begin by loading values into registers
		Instruction = 32'b001000_00000_00001_0000000110100111; //addi $R1, 423
		#10;
		Instruction = 32'b001000_00000_00010_0000000001011100; //addi $R2, 92
		#10;
		Instruction = 32'b001000_00000_00011_0000000000001101; //addi $R3, 13
		#10;
		Instruction = 32'b001000_00000_00100_0000000010010010; //addi $R4, 146
		#10;
		Instruction = 32'b001000_00000_00101_0000000000000101; //addi $R5, 5
		#10;
		Instruction = 32'b000000_00001_00100_00101_00000_100000; //add  $R5, $R1, $R4
		#10;
		Instruction = 32'b000000_00011_00101_00110_00000_101010; //slt  $R6, $R3, $R5
		#10;
		Instruction = 32'b100011_00000_00100_00000_00000_000100; // LW R4, 4(R0)
		#10;
		Instruction = 32'b000000_00100_00110_00111_00000_100010; //sub  $R7, $R4, $R6	
		#10;
		Instruction = 32'b101011_00000_00111_00000_00000_000010;	// SW R7, 2(R0)
		#10;
		Instruction = 32'b000000_00111_00010_01000_00000_100000; //add  $R8, $R7, $R2
		
//		#10;
//		Instruction = 32'b100011_00000_00110_00000_00000_000100;	// LW $6, 4(R0)
//		#10;
//		Instruction = 32'b000000_00110_00011_01001_00000_100101; //or  $R9, $R6, $R3
//		#10;
//		Instruction = 32'b000000_00001_00010_01000_00000_100010; //sub  $R8, $R1, $R2		
//		#10;
//		Instruction = 32'b000000_00101_01001_01010_00000_100000; //add  $R10, $R5, $R9
//		#10;
//		Instruction = 32'b101011_00000_00111_00000_00000_001000;	// SW R7, 8(R0)
//		#10;
//		Instruction = 32'b001000_01010_01011_0000000000000101; //addi $R11, $R10, 5
//		#10;
//		Instruction = 32'b000000_00111_00010_01100_00000_100100; //and  $R12, $R7, $R2
//		#10;
//		Instruction = 32'b000000_01011_01100_01101_00000_101010; //slt  $R13, $R11, $R12
	
		

		#10;
		LoadInstructions = 0;
      	Reset = 1;
		#10;
		Reset = 0;
//		#100;

	end
	always begin
	#5;
	clk = ~clk;
	end
      

endmodule
