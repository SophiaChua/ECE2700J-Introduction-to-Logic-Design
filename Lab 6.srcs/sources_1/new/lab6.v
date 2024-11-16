`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 09:33:50 PM
// Design Name: 
// Module Name: lab6
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


module lab6(clk_in, rst, row, col, ssd, AN);
    input clk_in, rst; 
    output [3:0] col; 
    input [3:0] row; 
    output [6:0] ssd; 
    output [3:0] AN; 
    
    wire clk_out;
    wire [18:0] count; 
    wire reg_load;
    wire [3:0] code; 
    wire [3:0] Q;  
    
    clock_divider_500 clk(clk_in, rst, count, clk_out);
    keypad_scanner scanner(clk_out, rst, row, col, reg_load, code);
    register r(reg_load, clk_out, rst, code, Q); 
    SSD s(ssd, Q); 
    
    assign AN = 4'b1110; 
    
endmodule
