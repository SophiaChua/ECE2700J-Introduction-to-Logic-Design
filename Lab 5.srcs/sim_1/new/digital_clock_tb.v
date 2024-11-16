`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2023 11:56:57 AM
// Design Name: 
// Module Name: digital_clock_tb
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


module digital_clock_tb;

    reg clk_100M, reset;
    wire [3:0] AN;
    wire [6:0] SSD; 
    
    digital_clock UUT (clk_100M, reset, SSD, AN);
    
    initial begin 
        #0 clk_100M = 1; reset = 0; 
        //#100 reset = 1; 
        //#150 reset = 0; 
    end
    
    always #1 clk_100M = ~clk_100M;
    initial #2000 $stop; 
    
endmodule
