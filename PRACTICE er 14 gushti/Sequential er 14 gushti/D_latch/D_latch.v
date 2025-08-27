module D_latch(D, E, Q);
    input D, E;
    output reg Q;

    always @(*) begin
        if (E)
            Q <= D;
    end
endmodule
