// Top-level module (diagram er signal name use kore)
module top_module(a, out);
  input [3:0] a;        // diagram e a = input Grey code
  output [3:0] out;

  wire [3:0] b, c, d;   // b = Binary, c = input to module_y, d = output of module_y
  wire [3:0] L, M;

  // Module X: Grey → Binary (b = output)
  module_x mx(.grey(a), .binary(b));

  // b -> c (same value), then goes to module_y
  assign c = b;

  // Module Y: 2's complement + reverse (d = output)
  module_y my(.in(c), .out(d));

  // Now use L = d, M = b for subtraction
  assign L = d;
  assign M = b;

  // Module Z: M - L = out
  module_z mz(.L(L), .M(M), .out(out));
endmodule

// Module X: Grey to Binary
module module_x(grey, binary);
  input [3:0] grey;
  output [3:0] binary;

  assign binary[3] = grey[3];
  assign binary[2] = grey[2] ^ binary[3];
  assign binary[1] = grey[1] ^ binary[2];
  assign binary[0] = grey[0] ^ binary[1];
endmodule

// Module Y: 2's complement then reverse
module module_y(in, out);
  input [3:0] in;
  output [3:0] out;

  wire [3:0] temp;
  assign temp = ~in + 4'b0001;
  assign out[3] = temp[0];
  assign out[2] = temp[1];
  assign out[1] = temp[2];
  assign out[0] = temp[3];
endmodule

// Module Z: Subtractor
module module_z(L, M, out);
  input [3:0] L, M;
  output reg [3:0] out;

  reg [4:0] temp;

  always @(*) begin
    temp = M + (~L + 4'b0001);
    if (temp[4] == 0)
      out = ~temp[3:0] + 4'b0001;
    else
      out = temp[3:0];
  end
endmodule
