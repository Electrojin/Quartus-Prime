////top module

module ha_2to1 (I0,I1,A,B,Y,Carry);
    input I0,I1,A,B;
    output Y,Carry;

    mux_2to1 m1(Y,sum,I0,I1);
    half_adder ha1 (sum,Carry, A,B);

endmodule

///sub modules
module mux_2to1(Y,s1,i0,i1);
    input s1,i0,i1;
    output Y;
    assign Y = (~s1&i0)|(s1&i1);
endmodule

module half_adder(s2,c,a,b);
    input a,b;
    output s2,c;
    assign s2 = a ^ b;
    assign c = a & b;
endmodule