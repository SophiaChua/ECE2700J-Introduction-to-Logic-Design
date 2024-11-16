`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2023 01:30:18 PM
// Design Name: 
// Module Name: MUX
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


module MUX(out, a, b, c, d, sel);
    
    parameter size = 8;
    
    input [size-1:0] a, b, c, d;
    input [1:0] sel;
    output reg [size-1:0] out; 
    
    always @ (*)
    begin 
        case (sel)
            2'b00: out = a;
            2'b01: out = b;
            2'b10: out = c;
            2'b11: out = d; 
            default: out = 8'b00000000; 
        endcase
    end

endmodule
