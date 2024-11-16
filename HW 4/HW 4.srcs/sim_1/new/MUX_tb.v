`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2023 01:54:19 PM
// Design Name: 
// Module Name: MUX_tb
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


module MUX_tb;
    
    parameter size = 8; 
    
    reg [size - 1:0] a, b, c, d;
    reg [1:0] sel; 
    wire [size - 1:0] out;
    
    MUX UUT (.a(a), .b(b), .c(c), .d(d), .sel(sel), .out(out)); 
    
    initial begin
        #0  a = 8'b10101010; b = 8'b10111011; c = 8'b11001100; d = 8'b11011101; sel = 2'b00; 
        #25 sel = 2'b01;
        #25 sel = 2'b10;
        #25 sel = 2'b11;  
        #25 sel = 2'bxx; 
    end
    
        initial #125 $stop; 
        
endmodule
