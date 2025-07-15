// ALU Unit - Performs arithmetic and logic operations
module alu_unit (
    input  logic [31:0] op1,
    input  logic [31:0] op2,
    input  logic [3:0]  alu_ctrl,
    output logic [31:0] result,
    output logic        zero
);
    always_comb begin
        case (alu_ctrl)
            4'b0000: result = op1 & op2;
            4'b0001: result = op1 | op2;
            4'b0010: result = op1 + op2;
            4'b0110: result = op1 - op2;
            4'b0111: result = (op1 < op2) ? 1 : 0;
            4'b1100: result = ~(op1 | op2);
            default: result = 32'h00000000;
        endcase
    end
    assign zero = (result == 32'b0);
endmodule