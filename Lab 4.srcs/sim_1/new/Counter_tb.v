`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 07:18:17 PM
// Design Name: 
// Module Name: Counter_tb
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


module Counter_tb;
    parameter half_period = 25; 

    reg clk, reset, up_down;
    wire [3:0] count; 
    wire [6:0] ssd;
    
    Counter #(3) UUT (clk, reset, up_down, count, ssd); 
    
    initial begin
        #0      clk = 0;up_down = 1; reset = 1; 
        #50     reset = 0;
        #500    up_down = 0;
        #500    up_down = 1; 
     end
     
     always #half_period clk = ~clk; 
     initial #5000 $stop; 
     
endmodule
