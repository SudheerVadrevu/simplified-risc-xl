// Control Unit - Generates control signals
module core_control (
    input  logic [6:0] opcode,
    output logic       reg_write,
    output logic       alu_src,
    output logic       mem_to_reg
);
    always_comb begin
        case (opcode)
            7'b0110011: begin
                reg_write = 1;
                alu_src   = 0;
                mem_to_reg= 0;
            end
            7'b0000011: begin
                reg_write = 1;
                alu_src   = 1;
                mem_to_reg= 1;
            end
            default: begin
                reg_write = 0;
                alu_src   = 0;
                mem_to_reg= 0;
            end
        endcase
    end
endmodule