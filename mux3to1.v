module mux3to1(out, in0, in1, in2, sel);
    parameter N = 32;
    output[N-1:0] out;
    input[N-1:0] in0, in1, in2;
    input[1:0] sel;
    
    reg[N-1:0] out;
    
    always@(*)
    begin
        case(sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
        endcase
    end
endmodule
