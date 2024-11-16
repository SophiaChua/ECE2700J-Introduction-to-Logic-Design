`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2023 11:33:34 AM
// Design Name: 
// Module Name: digital_clock
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


module digital_clock(clk_100M, reset, ssd, AN);

    input clk_100M, reset;
    output reg [6:0] ssd; 
    output [3:0] AN; 
    
    wire out500Hz, out1Hz; 
    wire [3:0] tens, ones; 
    wire [17:0] count200T;
    wire [8:0] count500; 
    wire [6:0] Q1, Q2; 

    clock_divider_500 cd1(clk_100M, reset, count200T, out500Hz); 
    clock_divider_1 cd2(out500Hz, reset, count500, out1Hz); 
    ring_counter rc(out500Hz, reset, AN); 
    timer t(out1Hz, reset, tens, ones); 
    SSD S1(Q1, tens); 
    SSD S2(Q2, ones); 
    
    always @ (posedge out500Hz)
    begin 
        case (AN)
            4'b0111: ssd = 7'b1111111; 
            4'b1011: ssd = 7'b1111111;          
            4'b1101: ssd = Q1; 
            4'b1110: ssd = Q2; 
            default ssd = 7'b1111111;
        endcase
    end
endmodule
