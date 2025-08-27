module mg_comparator (A,B,equal,greater,lesser);
    input [3:0] A,B;
    output reg equal,greater,lesser;

    always @*
    begin
        equal = 0;
        greater = 0;
        lesser = 0;
        if (A==B)
            equal = 1;
        else if (A>B)
            greater = 1;
        else if (A<B)
            lesser = 1;
    end
endmodule