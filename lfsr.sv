module LFSR_10bit (
    input logic clk,
    input logic rst,    
    output logic [9:0] lfsr_out 
);

   
    logic lfsr_bit9, lfsr_bit8, lfsr_bit7, lfsr_bit6, lfsr_bit5;
    logic lfsr_bit4, lfsr_bit3, lfsr_bit2, lfsr_bit1, lfsr_bit0;

    logic feedback;

    assign feedback = lfsr_bit9 ^ lfsr_bit6;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
           
            lfsr_bit9 <= 1'b1;
            lfsr_bit8 <= 1'b0;
            lfsr_bit7 <= 1'b0;
            lfsr_bit6 <= 1'b0;
            lfsr_bit5 <= 1'b0;
            lfsr_bit4 <= 1'b0;
            lfsr_bit3 <= 1'b0;
            lfsr_bit2 <= 1'b0;
            lfsr_bit1 <= 1'b0;
            lfsr_bit0 <= 1'b0;
        end else begin
            
            lfsr_bit9 <= lfsr_bit8;
            lfsr_bit8 <= lfsr_bit7;
            lfsr_bit7 <= lfsr_bit6;
            lfsr_bit6 <= lfsr_bit5;
            lfsr_bit5 <= lfsr_bit4;
            lfsr_bit4 <= lfsr_bit3;
            lfsr_bit3 <= lfsr_bit2;
            lfsr_bit2 <= lfsr_bit1;
            lfsr_bit1 <= lfsr_bit0;
            lfsr_bit0 <= feedback;  
        end
    end

    
    assign lfsr_out = {lfsr_bit9, lfsr_bit8, lfsr_bit7, lfsr_bit6, 
                       lfsr_bit5, lfsr_bit4, lfsr_bit3, lfsr_bit2, 
                       lfsr_bit1, lfsr_bit0};

endmodule