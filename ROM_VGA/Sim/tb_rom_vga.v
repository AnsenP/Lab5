`timescale 1ns/ 1ns
module tb_rom_vga();

////
//\* Parameter and Internal Signal \//
////
//wire define
 wire hsync ;
 wire [15:0] rgb ;
 wire vsync ;

 //reg define
 reg sys_clk ;
 reg sys_rst_n ;

 ////
 //\* Clk And Rst \//
 ////

 //Init sys_clk,sys_rst_n
 initial
 begin
	 sys_clk = 1'b1;
	 sys_rst_n <= 1'b0;
	 #200
	 sys_rst_n <= 1'b1;
 end

 //Generate system clock 50MHz
 always #10 sys_clk = ~sys_clk ;
 
 //------------------------------------------------------------
 //Get the internal variables
 wire rd_en = rom_vga_inst.vga_pic_inst.rd_en;
 wire pic_valid = rom_vga_inst.vga_pic_inst.pic_valid;
 wire [9:0] pix_x = rom_vga_inst.vga_pic_inst.pix_x;
 wire [9:0] pix_y = rom_vga_inst.vga_pic_inst.pix_y;
 //------------------------------------------------------------

 ////
 //\* Instantiation \//
 ////

 //------------- rom_vga_inst -------------
 rom_vga rom_vga_inst
 (
 .sys_clk (sys_clk ), 
 .sys_rst_n (sys_rst_n ), 

 .hsync (hsync ), 
 .vsync (vsync ), 
 .rgb (rgb ) 
 );

 endmodule