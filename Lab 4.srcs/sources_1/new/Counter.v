`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 07:03:30 PM
// Design Name: 
// Module Name: Counter
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


module Counter (
    input clk,
    input reset,
    input up_down,
    output reg [3:0] count,
    output reg [6:0] ssd 
); 
    
    always @(posedge clk)
        if (reset == 1'b1)
            count <= 0;
        else if (up_down == 1'b1)
            count <= count + 1;
        else
            count <= count - 1; 
    
    always @(count)
    case(count)
        4'b0000: ssd = 7'b1000000; // Display '0'
        4'b0001: ssd = 7'b1111001; // Display '1'
        4'b0010: ssd = 7'b0100100; // Display '2'
        4'b0011: ssd = 7'b0110000; // Display '3'
        4'b0100: ssd = 7'b0011001; // Display '4'
        4'b0101: ssd = 7'b0010010; // Display '5'
        4'b0110: ssd = 7'b0000010; // Display '6'
        4'b0111: ssd = 7'b1111000; // Display '7'
        4'b1000: ssd = 7'b0000000; // Display '8'
        4'b1001: ssd = 7'b0011000; // Display '9'
        4'b1010: ssd = 7'b0001000; // Display 'A'
        4'b1011: ssd = 7'b0000011; // Display 'B'
        4'b1100: ssd = 7'b1000110; // Display 'C'
        4'b1101: ssd = 7'b0100001; // Display 'D'
        4'b1110: ssd = 7'b0000110; // Display 'E'
        4'b1111: ssd = 7'b0001110; // Display 'F'
        default: ssd = 7'b1111111; // Turn off the display for unknown values
    endcase
endmodule
