`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 16:11:54
// Design Name: 
// Module Name: forwarding_unit
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


module forwarding_unit(IDEX_Rs,IDEX_Rt,MemDest,MEM_RegWrite,WriteBackDest,RegWriteWB,Forward_A,Forward_B);
input [4:0] IDEX_Rs,IDEX_Rt,MemDest,WriteBackDest;
input MEM_RegWrite,RegWriteWB;
output reg [1:0] Forward_A,Forward_B;

always@(*)
begin
    Forward_A = 2'b00;
    Forward_B = 2'b00;
//    if ( (RegWriteWB) && (WriteBackDest!=0) && (WriteBackDest == IDEX_Rs))
//        Forward_A = 2'b10;
//    if ( (RegWriteWB) && (WriteBackDest!=0) && (WriteBackDest == IDEX_Rt))
//        Forward_B = 2'b10;    
    if ( (MEM_RegWrite) && (MemDest!=0) && (MemDest == IDEX_Rs))
        Forward_A = 2'b01;
    else 
    begin
        if ( (RegWriteWB) && (WriteBackDest!=0) && (WriteBackDest == IDEX_Rs))
        Forward_A = 2'b10;
    end
    
    
    if ( (MEM_RegWrite) && (MemDest!=0) && (MemDest == IDEX_Rt))
        Forward_B = 2'b01;
    else
    begin
        if ((RegWriteWB) && (WriteBackDest!=0) && (WriteBackDest == IDEX_Rt))
        Forward_B = 2'b10;
    end
    
//    if ( ((MEM_RegWrite) && (MemDest!=0) && (MemDest == IDEX_Rs))==0 && (RegWriteWB) && (WriteBackDest!=0) && (WriteBackDest == IDEX_Rs))
//        Forward_A = 2'b10;
//    if ( ((MEM_RegWrite) && (MemDest!=0) && (MemDest == IDEX_Rs))==0 && (RegWriteWB) && (WriteBackDest!=0) && (WriteBackDest == IDEX_Rt))
//        Forward_B = 2'b10;    

end



endmodule
