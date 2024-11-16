`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 04:09:50 PM
// Design Name: 
// Module Name: SSD_posneg
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


module SSD_posneg(ssd, Q);

    input [3:0] Q; 
    output reg [6:0] ssd; 

    always @ (Q)
    begin 
        case (Q)
            1'b0: ssd = 7'b1111111; // 0 -> +
            1'b1: ssd = 7'b1111110; // 1 -> -
            default: ssd = 7'b1111111; // 0 -> +
        endcase 
    end
endmodule
