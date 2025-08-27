module syn_uc(E,clr,clk,Q);

input E,clr,clk;

output reg[3:0] Q;

always @(posedge clk or negedge clr) 

begin 

if (clr==0)
Q <= 0;

else if (E==1)
Q<= Q+1;

else 
Q<=0;

end

endmodule