`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2023 10:24:54 PM
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
    
    parameter half_period = 5; 
    parameter s = 4; 
    
    reg [s-1:0] D;
    reg clk, load, CE;
    wire [s-1:0] Q; 
    wire upper; 
    
    Counter UUT (.clk(clk), .load(load), .CE(CE), .D(D), .Q(Q), .upper(upper));
    
    initial begin 
        #0 D = 4'b0000;  load = 1'b1; clk = 1'b1; CE = 1'b0; 
        #10 load = 1'b0; CE = 1'b1;
        #300 D = 4'b1111; load = 1'b1;
        #50 load = 1'b0;
        #90 CE = 1'b0; 
    end
    
    always #half_period clk = ~clk;
    initial #500 $stop; 

endmodule
