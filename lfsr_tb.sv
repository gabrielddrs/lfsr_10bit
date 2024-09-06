`include "lfsr.sv"
`timescale 1ns / 1ps

module tb_LFSR_10bit;

    logic clk;
    logic rst;

    logic [9:0] lfsr_out;

    LFSR_10bit uut (
        clk,
        rst,
        lfsr_out
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        $dumpfile("lfsr_tb.vcd");
        $dumpvars(0, tb_LFSR_10bit);

        rst = 1;        // Apply reset
        #10;            // Hold reset for 10ns
        rst = 0;        // Release reset

        repeat(20) begin
            @(posedge clk); 
            $display("Time: %0t ns, LFSR Output: %b", $time, lfsr_out);
        end
        
        $stop;
    end

endmodule
