// 1. Main module: dig_system
module dig_system(input D, clk, R, output [3:0] Y);
  wire Q, W;
  
  assign W = 1'b1; // ধরলাম W হলো প্রতিবার ইনপুটে ঢোকানোর ডেটা (বা আপনি আলাদা ইনপুট দিতে পারেন)

  dff dff1(.D(D), .clk(clk), .Q(Q));
  LR_shift lr1(.clk(clk), .R(R), .Q(Q), .W(W), .Y(Y));
  
endmodule


// 2. JK Flip-Flop
module jk_ff(input j, k, clk, output reg Q);
  always @(posedge clk) begin
    case ({j, k})
      2'b00: Q <= Q;
      2'b01: Q <= 0;
      2'b10: Q <= 1;
      2'b11: Q <= ~Q;
    endcase
  end
endmodule


// 3. D Flip-Flop implemented using JK Flip-Flop
module dff(input D, clk, output Q);
  jk_ff jk_ff1(D,~D,clk,Q);
endmodule


// 4. Left-Right Shift Register
module LR_shift(input clk, R, Q, W, output reg [3:0] Y);
  always @(posedge clk or posedge R) begin
    if (R) begin
      Y <= 4'b0000;
    end else begin
      if (Q == 1'b0) begin // LEFT SHIFT
        Y[3] <= Y[2];
        Y[2] <= Y[1];
        Y[1] <= Y[0];
        Y[0] <= W;
      end else begin // RIGHT SHIFT
        Y[0] <= Y[1];
        Y[1] <= Y[2];
        Y[2] <= Y[3];
        Y[3] <= W;
      end
    end
  end
endmodule
