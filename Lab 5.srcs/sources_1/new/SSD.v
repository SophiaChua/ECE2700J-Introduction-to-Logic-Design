`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2023 03:05:04 AM
// Design Name: 
// Module Name: SSD
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


module SSD(ssd, Q);

    input [3:0] Q; 
    output reg [6:0] ssd; 

    always @ (Q)
    begin 
        case (Q)
            4'b0000: ssd = 7'b0000001;
            4'b0001: ssd = 7'b1001111;
            4'b0010: ssd = 7'b0010010;
            4'b0011: ssd = 7'b0000110;
            4'b0100: ssd = 7'b1001100;
            4'b0101: ssd = 7'b0100100;
            4'b0110: ssd = 7'b0100000;
            4'b0111: ssd = 7'b0001111;
            4'b1000: ssd = 7'b0000000;
            4'b1001: ssd = 7'b0000100;
            //4'b1010: ssd = 7'b0001000; // Display 'A'
            //4'b1011: ssd = 7'b0000011; // Display 'B'
            //4'b1100: ssd = 7'b1000110; // Display 'C'
            //4'b1101: ssd = 7'b0100001; // Display 'D'
            //4'b1110: ssd = 7'b0000110; // Display 'E'
            //4'b1111: ssd = 7'b0001110; // Display 'F'
            default: ssd = 7'b1111111; // Turn off the display for unknown values
        endcase 
    end
endmodule
