`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 04:40:34 PM
// Design Name: 
// Module Name: register
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

module register(reg_load, clk, rst, D, Q); 

    input reg_load, clk, rst;
    input [3:0] D; 
    output reg [3:0] Q; 

    always @ (posedge clk or posedge rst)
    begin 
        if (rst == 1)
            Q <= 4'd0; 
        else if (reg_load == 1)
            Q <= D;
        else
            Q <= Q; 
    end
endmodule
