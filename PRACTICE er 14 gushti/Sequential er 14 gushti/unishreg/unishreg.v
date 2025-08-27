module unishreg (
    input clk,                      // Clock signal
    input [1:0] sel,                // Selection input: sel = {S1, S0}
    input sin_left, sin_right,     // Serial inputs
    input [3:0] D,                 // Parallel input (4-bit)
    output reg [3:0] Q             // 4-bit register output
);

    always @(posedge clk) begin
        case (sel)
            2'b00: Q <= Q;  // Hold: কোনো পরিবর্তন হয় না

            2'b01: begin    // ➡️ Right Shift
                Q[3] <= sin_right;
                Q[2] <= Q[3];
                Q[1] <= Q[2];
                Q[0] <= Q[1];
            end

            2'b10: begin    // ⬅️ Left Shift
                Q[0] <= sin_left;
                Q[1] <= Q[0];
                Q[2] <= Q[1];
                Q[3] <= Q[2];
            end

            2'b11: Q <= D;  // 🔄 Parallel Load
        endcase
    end
endmodule
