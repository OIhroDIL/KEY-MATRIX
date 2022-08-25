`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 22:51:10
// Design Name: 
// Module Name: key_pad
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


module key_pad(
input   rst,
input   clk,                                                    // 10MHz SYSTEM CLK
input   [4:0] key_v,                                            // 5BIT KEY ASSIGN INPUT FOR SIMULATION
input   [3:0] key_column_in,                                    // 4BIT KEY PAD COLUM INPUT 
output  reg [4:0] key_row_out                                   // 5BIT KEY PAD POW OUTPUT TO KEY_SCAN V. KEY_IN [4:0]
);

always@(negedge rst, posedge clk)
    if(rst == 0)
        key_row_out <= 5'b11111;
    else if(key_v >= 26)
        key_row_out <= 5'b11111;
    else
        if      (key_column_in == 4'b1110)                      // COLUM 0 CHECK
            if      (key_v == 01)   key_row_out <= 5'b11110;
            else if (key_v == 02)   key_row_out <= 5'b11101;
            else if (key_v == 03)   key_row_out <= 5'b11011;
            else if (key_v == 04)   key_row_out <= 5'b10111;
            else if (key_v == 05)   key_row_out <= 5'b01111;
            else if (key_v == 21)   key_row_out <= 5'b01110;
            else if (key_v == 25)   key_row_out <= 5'b11110;
            else                    key_row_out <= 5'b11111;
        else if (key_column_in == 4'b1101)                      // COLUM 1 CHECK
            if      (key_v == 06)   key_row_out <= 5'b11110;
            else if (key_v == 07)   key_row_out <= 5'b11101;
            else if (key_v == 08)   key_row_out <= 5'b11011;
            else if (key_v == 09)   key_row_out <= 5'b10111;
            else if (key_v == 10)   key_row_out <= 5'b01111;
            else if (key_v == 22)   key_row_out <= 5'b01110;
            else if (key_v == 25)   key_row_out <= 5'b11110;
            else                    key_row_out <= 5'b11111;
        else if (key_column_in == 4'b1011)                      // COLUM 2 CHECK
            if      (key_v == 11)   key_row_out <= 5'b11110;
            else if (key_v == 12)   key_row_out <= 5'b11101;
            else if (key_v == 13)   key_row_out <= 5'b11011;
            else if (key_v == 14)   key_row_out <= 5'b10111;
            else if (key_v == 15)   key_row_out <= 5'b01111;
            else if (key_v == 23)   key_row_out <= 5'b01110;
            else                    key_row_out <= 5'b11111;            
        else if (key_column_in == 4'b0111)                      // COLUM 3 CHECK   
            if      (key_v == 16)   key_row_out <= 5'b11110;
            else if (key_v == 17)   key_row_out <= 5'b11101;
            else if (key_v == 18)   key_row_out <= 5'b11011;
            else if (key_v == 19)   key_row_out <= 5'b10111;
            else if (key_v == 20)   key_row_out <= 5'b01111;
            else if (key_v == 24)   key_row_out <= 5'b11110;
            else                    key_row_out <= 5'b11111;
        else                        key_row_out <= 5'b11111;
endmodule  

        














