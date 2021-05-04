`define R_Type 7'b0110011
`define I_Type 7'b0010011
module Control(
    Op_i,
    ALUOp_o,
    ALUSrc_o,
    RegWrite_o
);

input [6:0] Op_i;
output reg [1:0] ALUOp_o;
output reg ALUSrc_o;
output reg RegWrite_o;



always@(Op_i)
begin
case (Op_i)
    `R_Type: begin
            ALUSrc_o <= 1'b0;
            RegWrite_o <= 1'b1;
            ALUOp_o <= 2'b00;
        end    
    `I_Type: begin
            ALUSrc_o <= 1'b1;
            RegWrite_o <= 1'b1;
            ALUOp_o <=2'b10;
        end    
    default:begin
            RegWrite_o <= 1'b0;
        end    
endcase
end

endmodule