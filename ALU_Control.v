`define ADD 3'b001
`define SUB 3'b010
`define MUL 3'b011
`define AND 3'b100
`define XOR 3'b101
`define SLL 3'b110
`define SRA 3'b111

module ALU_Control(
    funct_i,
    ALUOp_i,
    ALUCtrl_o
);

input [9:0] funct_i;
input [1:0] ALUOp_i;
output reg [2:0] ALUCtrl_o;

assign funct7 = funct_i [9:3];
assign funct3 = funct_i [2:0];

always@(funct_i,ALUOp_i)
begin
    case (ALUOp_i)
    2'b00: begin
        case (funct3)
            3'b001: ALUCtrl_o <= `SLL;
            3'b100: ALUCtrl_o <= `XOR;
            3'b111: ALUCtrl_o <= `AND;
            3'b000:begin
                case (funct7)
                    7'b0000000: ALUCtrl_o <= `ADD;
                    7'b0100000: ALUCtrl_o <= `SUB;
                    7'b0000001: ALUCtrl_o <= `MUL;
                endcase
            end
        endcase
    end
    2'b10:begin
        case (funct3)
            3'b000: ALUCtrl_o <= `ADD;
            3'b101: ALUCtrl_o <= `SRA;
        endcase
    end
    endcase
end

endmodule