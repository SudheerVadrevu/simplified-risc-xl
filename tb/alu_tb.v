module alu_tb;
    logic [31:0] op1, op2;
    logic [3:0]  alu_ctrl;
    logic [31:0] result;
    logic        zero;

    alu_unit dut (
        .op1(op1), .op2(op2), .alu_ctrl(alu_ctrl),
        .result(result), .zero(zero)
    );

    initial begin
        op1 = 32'd10; op2 = 32'd20; alu_ctrl = 4'b0010; #10; // ADD
        op1 = 32'd30; op2 = 32'd10; alu_ctrl = 4'b0110; #10; // SUB
        op1 = 32'd5;  op2 = 32'd7;  alu_ctrl = 4'b0111; #10; // SLT
        $stop;
    end
endmodule