module mux2to1(out, in0, in1, sel);
    parameter N = 4;
    output[N-1:0] out;
    input[N-1:0] in0, in1;
    input sel;
    
    reg[N-1:0] out;
    
    always@(*)
    begin
        case(sel)
            1'b0: out = in0;
            1'b1: out = in1;
        endcase
    end
endmodule

    