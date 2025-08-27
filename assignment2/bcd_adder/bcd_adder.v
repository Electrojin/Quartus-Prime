module bcd_adder(A, B, Cin, Sum, Cout);
    input [3:0] A, B;
    input Cin;
    output reg [3:0] Sum;
    output reg Cout;

    reg [4:0] Z;

    always @* begin
        Z = A + B + Cin;
        if (Z > 9) begin
            Sum = Z + 6;
            Cout = 1;
        end
        else begin
            Sum = Z;
            Cout = 0;
        end
    end
endmodule
