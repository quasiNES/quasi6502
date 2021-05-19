`include "Quasi6502_Implementation.v"

module Quasi6502(
    input  wire         reset,
    output wire         ready,
    input  wire         clk,
    input  wire         irq,
    input  wire         nmi,
    output wire         sync,
    output wire         busRequestWrite,
    output wire [15:0]  busRqAddress,
    input  wire  [7:0]  busDataIn,
    output wire  [7:0]  busDataOut
);

    `Quasi6502_GenerateImplementation(
        `ModifyZeropage     (8'he6, Inc)
        `ModifyZeropageX    (8'hf6, Inc)
        `ModifyAbsolute     (8'hee, Inc)
        `ModifyAbsoluteX    (8'hfe, Inc)
    )

    task Inc(input [7:0] operand);
        reg [7:0] result;
        begin
            result = operand + 1'b1;
            `SetOperationResult(result);
            `UpdateFlagN(result);
            `UpdateFlagZ(result);
        end
    endtask

endmodule
