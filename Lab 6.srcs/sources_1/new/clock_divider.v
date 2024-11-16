`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 05:30:27 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider_500(clk_in, reset, count, clk_out); 

    input clk_in, reset;
    output reg [17:0] count;  
    output reg clk_out; 
    
    always @ (posedge clk_in or posedge reset)
    begin
        if (reset == 1)
            begin
                clk_out <= 0; 
                count <= 18'd0; 
            end
        else if (count == 18'd199999)
            begin
                clk_out <= ~clk_out; 
                count <= 0; 
            end
        else
                count <= count + 1;
    end         
endmodule
