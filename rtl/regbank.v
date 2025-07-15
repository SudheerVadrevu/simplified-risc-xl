// Register Bank
module regbank (
    input  logic clk,
    input  logic rst,
    input  logic [4:0] rs1, rs2, rd,
    input  logic [31:0] write_data,
    input  logic reg_write,
    output logic [31:0] read_data1,
    output logic [31:0] read_data2
);
    logic [31:0] regs [0:31];

    assign read_data1 = regs[rs1];
    assign read_data2 = regs[rs2];

    always_ff @(posedge clk) begin
        if (rst)
            for (int i = 0; i < 32; i++) regs[i] <= 0;
        else if (reg_write)
            regs[rd] <= write_data;
    end
endmodule