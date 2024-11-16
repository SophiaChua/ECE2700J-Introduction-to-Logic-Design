`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2023 11:21:23 AM
// Design Name: 
// Module Name: timer
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


module timer(clk, reset, tens, ones);

    input clk, reset; 
    output reg [3:0] tens, ones; 
    
    always @(posedge clk or posedge reset)
    begin
        if (reset == 1)
        begin 
            tens <= 4'b0000; 
            ones <= 4'b0000; 
        end 
        else if (ones == 4'b1001)
        begin
            if (tens == 4'b0101)
            begin 
                ones <= 4'b0000;
                tens <= 4'b0000;
            end
            else 
            begin 
                ones <= 4'b0000; 
                tens <= tens + 1; 
            end 
        end    
        else 
            ones <= ones + 1; 
    end                      
endmodule
