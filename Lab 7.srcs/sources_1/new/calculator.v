`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 04:56:07 PM
// Design Name: 
// Module Name: calculator
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


module calculator(reset, enter, sum, overflow, sign, display, num, stored);
    
    input reset, enter; 
    input [3:0] num, stored; 
    output reg overflow, sign; 
    output reg [3:0] sum, display; 
    
    always @ (posedge reset or posedge enter)
    begin 
        if (reset == 1'b1) 
            begin
                overflow <= 1'b0; 
                sum <= 4'b0000; 
                display <= 4'b0000; 
            end 
        else if (enter == 1'b1)
            begin
                sum <= num + stored; 
                overflow <= (num[3]==stored[3] && num[3]^sum[3]); 
                if (sum[3] == 1'b1)
                    begin
                        display <= ~sum + 1; 
                        sign <= 1'b1;
                    end
                else
                    begin 
                        display <= sum; 
                        sign <= 1'b0; 
                    end
            end
        else 
            begin 
                sum <= sum; 
                overflow <= overflow; 
                display <= sum; 
            end 
    end
endmodule
