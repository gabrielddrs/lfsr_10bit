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

        rst = 1;        
        #10;            
        rst = 0;        
        #100;           
        
        
        rst = 1;
        #15;            
        rst = 0;
        #25;            
        rst = 1;
        #10;
        rst = 0;
        #100;           
        
        #3 rst = 1;     
        #8 rst = 0;     
        #100;           
        
        rst = 1;
        #10;
        rst = 0;
        #50;
        
        $stop;
    end

    initial begin
        $monitor("Time: %0t ns, lfsr_out = %b", $time, lfsr_out);
    end

endmodule
