`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 23:02:33
// Design Name: 
// Module Name: tb_key_scan
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


module tb_key_scan(
input   rst,
input   clk,                                // 10MHz SYSTEM CLK
input   pls100k,                            // 100kHz PULSE , SCAN TIMING CONTROL
input   pls1k,                              // 1KHz PULSE , SCAN START AT RISING EDGE  
input [4:0] key_v,                          // 4BIT KEY ASSIGN INPUT FOR SIMULATION
output nkpls,                               // ONE SHOT PULSE WHEN NEW KEY HAS DETECTED
output [4:0] nkv                            // 4BIT NEW KEY VALUE OUTPUT
);

wire    [3:0] key_out;
wire    [4:0] key_in;

//------------------------key scan,v 
key_scan ukey_scan
    (
//input    
    .rst                (rst        ),
    .clk                (clk        ),
    .pls100k            (pls100k    ),
    .pls1k              (pls1k      ),
    .key_in             (key_in     ),
//output 
    .key_out            (key_out    ),
    .nkpls              (nkpls      ),
    .nkv                (nkv        )
    );
    
//----------------------key pad.v 
key_pad ukey_pad
    (
//input 
    .rst                (rst        ),
    .clk                (clk        ),
    .key_v              (key_v      ),
    .key_column_in      (key_out    ),
//output 
    .key_row_out        (key_in     )
    );
    
endmodule
