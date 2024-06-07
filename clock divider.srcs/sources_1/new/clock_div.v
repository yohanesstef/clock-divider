`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Institute Technology Sepuluh Nopember
// Engineer: Yohanes Stefanus
// 
// Create Date: 07.06.2024 04:21:55
// Design Name: 
// Module Name: clock_div
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


module clock_div(
    input clk_in,
    input [1:0] control,
    output reg clock_out
);

// Instantiate clock wizard
wire CLK_32MHZ;

clk_wiz_0 clk_wizard_inst (
    .CLK_32MHZ(CLK_32MHZ), // output clock 32MHz
    .clk_in(clk_in)        // input clock 12MHz
);

reg[24:0] counter = 25'd0;
reg[24:0] divider = 25'd1;

always @(posedge CLK_32MHZ) begin
    // Set divider value based on control input
    case (control)
        2'b00: divider <= 2;             // 32MHz / 2 = 16MHz
        2'b01: divider <= 128;           // 32MHz / 128 = 250kHz
        2'b10: divider <= 32000;         // 32MHz / 32000 = 1kHz
        2'b11: divider <= 32000000;      // 32MHz / 32000000 = 1Hz
        default: divider <= 25'd1;
    endcase

    counter <= counter + 25'd1;
    if(counter >= (divider - 1)) begin
        counter <= 25'd0;
    end

    clock_out <= (counter < (divider / 2)) ? 1'b1 : 1'b0;
end

endmodule

