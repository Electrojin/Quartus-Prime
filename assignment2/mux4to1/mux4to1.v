module mux4to1 (S0,S1,I0,I1,I2,I3,Y);/////top
    input S0,S1,I0,I1,I2,I3;
    output Y;

    wire x1,x2;
    mux2to1 m1(x1,S0,I0,I1);
    mux2to1 m2(x2,S0,I2,I3);
    mux2to1 m3(Y,S1,x1,x2);

endmodule
///////sub
module mux2to1(Y,s,i0,i1);
    input s,i0,i1;
    output Y;
    assign Y = ((~s)&i0) | (s&i1);
endmodule