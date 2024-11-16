`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2023 04:54:10 PM
// Design Name: 
// Module Name: keypad_scanner
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


module keypad_scanner(clk, rst, row, col, reg_load, code); 

    input clk, rst;
    input [3:0] row; 
    output reg [3:0] col, code;  
    output reg reg_load; 
    reg [3:0] curr_state = 4'b0000;
    reg [3:0] next_state = 4'b0000; 
    wire or_row;
    
    parameter state0 = 4'b0000;
    parameter state1 = 4'b0001;
    parameter state2 = 4'b0010;
    parameter state3 = 4'b0011;
    parameter state4 = 4'b0100;
    parameter state5 = 4'b0101; 
    parameter state6 = 4'b0110;
    parameter state7 = 4'b0111;
    parameter state8 = 4'b1000;
    parameter state9 = 4'b1001; 
    
    or (or_row, row[0], row[1], row[2], row[3]); 
    
    always @ (posedge clk or posedge rst)
    begin
        if (rst == 1)
            curr_state <= state0;
        else 
            curr_state <= next_state; 
    end
    
    always @ (curr_state or or_row)
    begin 
        case (curr_state)
            state0: 
                begin  
                    col = 4'b1111; 
                    if (or_row == 1)
                        next_state <= state1; 
                    else 
                        next_state <= state0; 
                end
            state1: 
                begin 
                    col = 4'b0001;
                    if (or_row == 1)
                        next_state <= state5; 
                    else 
                        next_state <= state2; 
                 end 
            state2: 
                begin 
                    col = 4'b0010; 
                    if (or_row == 1)
                        next_state <= state6; 
                    else
                        next_state <= state3;
                end
            state3: 
                begin 
                    col = 4'b0100;
                    if (or_row == 1)
                        next_state <= state7; 
                    else 
                        next_state <= state4; 
                end  
            state4: 
                begin 
                    col = 4'b1000;
                    if (or_row == 1)
                        next_state <= state8;
                    else 
                        next_state <= state0; 
                end
            state5: 
                begin 
                    col = 4'b0001;
                    reg_load = 1; 
                    case (row)
                        4'b0001: code <= 4'b0000;
                        4'b0010: code <= 4'b0100;
                        4'b0100: code <= 4'b1000;
                        4'b1000: code <= 4'b1100;
                        default: code <= 4'b0000;
                    endcase
                    next_state <= state9; 
                end 
            state6: 
                begin
                    col = 4'b0010;
                    reg_load = 1; 
                    case (row)
                        4'b0001: code <= 4'b0001;
                        4'b0010: code <= 4'b0101;
                        4'b0100: code <= 4'b1001;
                        4'b1000: code <= 4'b1101;
                        default: code <= 4'b0000;
                    endcase
                    next_state <= state9; 
                end
            state7: 
                begin
                    col = 4'b0100;
                    reg_load = 1; 
                    case (row)
                        4'b0001: code <= 4'b0010;
                        4'b0010: code <= 4'b0110;
                        4'b0100: code <= 4'b1010;
                        4'b1000: code <= 4'b1110;
                        default: code <= 4'b0000;
                    endcase
                    next_state <= state9; 
                end
            state8: 
                begin
                    col = 4'b1000;
                    reg_load = 1; 
                    case (row)
                        4'b0001: code <= 4'b0011;
                        4'b0010: code <= 4'b0111;
                        4'b0100: code <= 4'b1011;
                        4'b1000: code <= 4'b1111;
                        default: code <= 4'b0000;
                    endcase
                    next_state <= state9; 
                end
            state9: 
                begin
                    col <= 4'b1111;  
                    if (or_row == 1)
                        next_state <= state9;
                    else 
                        next_state <= state0;
                    reg_load = 0; 
                end 
           default: next_state <= state0; 
        endcase
    end
    
endmodule
