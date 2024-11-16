`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 04:26:30 PM
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


module clock_divider_500(clk_100M, reset, count, out500Hz); 

    input clk_100M, reset;
    output reg [17:0] count;  
    output reg out500Hz; 
    
    always @ (posedge clk_100M or posedge reset)
    begin
        if (reset == 1)
            begin
                out500Hz <= 0; 
                count <= 18'b0; 
            end
        else if (count == 18'd199999)
            begin
                out500Hz <= ~out500Hz; 
                count <= 0; 
            end
        else
            begin
                count <= count + 1;
            end
    end         
endmodule

