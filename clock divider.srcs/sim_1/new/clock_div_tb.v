`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2024 05:55:43
// Design Name: 
// Module Name: clock_div_tb
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

module clock_div_tb;

    // Inputs
    reg clk_in;
    reg [1:0] control;

    // Outputs
    wire clock_out;

    // Instantiate the Unit Under Test (UUT)
    clock_div uut (
        .clk_in(clk_in), 
        .control(control), 
        .clock_out(clock_out)
    );

    // Generate 12MHz input clock
       
       always #41.6667 clk_in = ~clk_in; // 12MHz clock (period = 83.3333ns)

    // Test sequence
    initial begin
        // Initialize control signal
        clk_in = 0;
        control = 2'b00; 

        // Test control = 00 (output should be 16MHz)
        #2;
        control = 2'b01; // Switch to 250kHz
        #50;
        control = 2'b10; // Switch to 1kHz
        #100;
        control = 2'b11; // Switch to 1Hz
        #20;
        
        // End simulation
        $stop;
    end

    // Monitor output
    initial begin
        $monitor("At time %t, control = %b, clock_out = %b", $time, control, clock_out);
    end

endmodule

