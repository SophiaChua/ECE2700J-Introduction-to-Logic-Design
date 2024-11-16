`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 04:24:33 PM
// Design Name: 
// Module Name: ring_counter
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



module ring_counter(clk, reset, AN);

    input clk, reset; 
    output reg [3:0] AN; 
    
    always @ (posedge clk or posedge reset)
    begin
        if (reset == 1'b1)
            AN <= 4'b1110;
        else 
            AN <= {AN[2:0], AN[3]}; 
    end
endmodule

