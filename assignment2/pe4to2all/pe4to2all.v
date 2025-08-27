/////////// 4-to-2 Priority Encoder sajidur

module pe4to1 (d, y, v);
    input [3:0] d;
    output reg [1:0] y;
    output reg v;

    always @ * begin
        casex(d)
            4'b0001: begin
                y = 2'b00;
                v = 1;
            end
            4'b001x: begin
                y = 2'b01;
                v = 1;
            end
            4'b01xx: begin
                y = 2'b10;
                v = 1;
            end
            4'b1xxx: begin
                y = 2'b11;
                v = 1;
            end
            default: begin
                y = 2'b00;
                v = 0;
            end
        endcase
    end
endmodule

///// 2-to-1 Multiplexer

module mux2to1(i0, i1, s, y);
    input i0, i1, s;
    output y;
    assign y = (~s & i0) | (s & i1);
endmodule

////// Half Adder

module ha(a, b, sum, carry);
    input a, b;
    output sum, carry;
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

//// Full Adder

module fa(a1, a2, cin, sum1, cout);
    input a1, a2, cin;
    output sum1, cout;
    assign sum1 = a1 ^ a2 ^ cin;
    assign cout = (a1 & a2) | (a2 & cin) | (a1 & cin);
endmodule

// Top-Level Module: Uses pe4to1, mux2to1, ha, fa

module pe4to2all(A, B, C, D, E, F, L, M, N);
    input A, B, C, D, E, F;
    output L, M, N;
    wire w1, w2, w3, w4, w5;

    pe4to1 m1({A, B, C, D}, w1, w2);     
    mux2to1 m2(w1, w2, A, w4);             
    ha m3(w3, F, w5, N);                   
    fa m4(w4, w5, , L, M);              
endmodule
