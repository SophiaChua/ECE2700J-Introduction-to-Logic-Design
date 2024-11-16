`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2023 08:55:18 PM
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


module Counter(clk, load, CE, D, Q, upper);

    parameter s = 4; 

    input clk, load, CE;
    input [s-1:0] D;
    output reg [s-1:0] Q;
    output upper; 
    
    always @ (posedge clk)
    begin
       if (load == 1)
          Q = D; 
       else if (CE == 1)
          Q = Q + 1; 
       else 
          Q = Q;
    end

    assign upper = Q[3]; 

endmodule
