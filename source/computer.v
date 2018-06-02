/////////////////////////////////////////////////////////////
//                                                         //
// School of Software of SJTU                              //
//                                                         //
/////////////////////////////////////////////////////////////

module computer (resetn,clock,mem_clk,
						sw,hex0,hex1,hex2,hex3);
   
   input 		  resetn,clock,mem_clk;
	input  [7:0]  sw;
	output [6:0]  hex0,hex1,hex2,hex3;
	
	wire          imem_clk,dmem_clk,wmem;
	wire   [31:0] mem_dataout,io_read_data,inst,memout,pc,aluout,data,out_port0,out_port1,in_port0,in_port1;
    
   sc_cpu cpu (clock,resetn,inst,memout,pc,wmem,aluout,data);            // CPU module.
	
   sc_instmem  imem (pc,inst,clock,mem_clk,imem_clk);               // instruction memory.
	
   sc_datamem  dmem (aluout,data,memout,wmem,clock,mem_clk,dmem_clk,resetn, 
							out_port0,out_port1,in_port0,in_port1,mem_dataout,io_read_data);   // data memory.
							
	ledmodule ledm(clock,in_port0,in_port1,out_port0,out_port1,
							resetn,sw,hex0,hex1,hex2,hex3);
	
endmodule



