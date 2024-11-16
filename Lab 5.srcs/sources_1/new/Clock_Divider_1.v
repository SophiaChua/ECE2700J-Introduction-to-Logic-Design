`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2023 11:11:14 AM
// Design Name: 
// Module Name: Clock_Divider_1
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


module clock_divider_1(clk_500, reset, count, out1Hz); 

    input clk_500, reset;
    output reg [8:0] count;  
    output reg out1Hz; 
    
    always @ (posedge clk_500 or posedge reset)
    begin
        if (reset == 1)
            begin
                out1Hz <= 1'b0; 
                count <= 9'b0; 
            end
        else if (count == 9'd499)
            begin
                out1Hz <= ~out1Hz; 
                count <= 9'b0; 
            end
        else
            begin
                count <= count + 1;
                out1Hz <= 1'b0;
            end
    end         
endmodule



