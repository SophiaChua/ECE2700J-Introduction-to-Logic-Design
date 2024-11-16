`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 04:13:41 PM
// Design Name: 
// Module Name: SSD_fun
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


module SSD_fun(ssd, Q);

    input [3:0] Q; 
    output reg [6:0] ssd; 

    always @ (Q)
    begin 
        case (Q)
            4'b0000: ssd=7'b1001111; //0 -> I
            4'b0001: ssd=7'b1111111; //1->_
            4'b0010: ssd=7'b1110001; //3 -> L
            4'b0011: ssd=7'b0000001; //4-> O
            4'b0100: ssd=7'b1000001; // 5 -> V
            4'b0101: ssd=7'b0110000; // 6 -> E
            4'b0110: ssd=7'b1111111; //7->_
            4'b0111: ssd=7'b1000001; // 8 -> V
            4'b1000: ssd=7'b0110000; // 9 -> E
            4'b1001: ssd=7'b0010010; // 10 -> 2
            4'b1010: ssd=7'b0001111; // 11 -> 7
            4'b1011: ssd=7'b0000001; // 12 -> 0
            4'b1100: ssd=7'b1111111; // 13 -> _
            default: ssd=7'b1111111; // default -> _
        endcase 
    end
endmodule
