`define ADD 3'b001
`define SUB 3'b010
`define MUL 3'b011
`define AND 3'b100
`define XOR 3'b101
`define SLL 3'b110
`define SRA 3'b111

module ALU(
    data1_i,
    data2_i,
    ALUCtrl_i,
    data_o,
    Zero_o
);

input signed[31:0] data1_i;
input signed [31:0] data2_i;
input [2:0] ALUCtrl_i;
output reg [31:0] data_o;
output Zero_o;

assign Zero_o = data_o == 0 ? 1 : 0;

always@(data1_i, data2_i, ALUCtrl_i)
begin
case (ALUCtrl_i)
    `ADD: data_o = data1_i + data2_i;
    `SUB: data_o = data1_i - data2_i;
    `MUL: data_o = data1_i * data2_i;
    `AND: data_o = data1_i & data2_i;
    `XOR: data_o = data1_i ^ data2_i;
    `SLL: data_o = data1_i << data2_i;
    `SRA: data_o = data1_i >>> data2_i[4:0];
endcase
end


endmodule