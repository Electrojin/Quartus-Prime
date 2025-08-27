module mux_2_to_1(s,I0,I1,Y);
input s,I0,I1;
output Y;
wire w1,w2,w3;
not g1(w1,s);
and g2(w2,I0,w1);
and g3(w3,s,I1);
or g4(Y,w2,w3);
endmodule
