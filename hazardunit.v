module hazardunit(IFIDWrite,PCWrite,HazardMux,ReadReg1,ReadReg2,RegDestMuxOut,MemDest,IDEX_RegWrite,MEM_RegWrite,MemReadEx,MEM_MemRead);

	output reg	IFIDWrite, PCWrite, HazardMux;
	
	input [4:0] ReadReg1,ReadReg2,RegDestMuxOut,MemDest;
	input IDEX_RegWrite,MEM_RegWrite,MemReadEx,MEM_MemRead;
	
    initial begin
        IFIDWrite = 1;
        PCWrite = 1;
        HazardMux = 0;
        
    end

    always@(*)
    begin
        if ( (IDEX_RegWrite == 1)&& (MemReadEx) && (RegDestMuxOut != 0) && ((RegDestMuxOut == ReadReg1) || (RegDestMuxOut == ReadReg2) ) )
        begin
            IFIDWrite = 0;
            PCWrite = 0;
            HazardMux = 1;
        end     

        else if ((MEM_RegWrite == 1) && (MEM_MemRead) &&(MemDest!=0) && ((MemDest == ReadReg1) || (MemDest == ReadReg2) ) )
        begin

            IFIDWrite = 0;
            PCWrite = 0;
            HazardMux = 1;

        end
        else
        begin
            IFIDWrite = 1;
            PCWrite = 1;
            HazardMux = 0;
        end
        
    end
		
    

endmodule
