
// IDEA: Use 'generate' to create a (kind of) nested namespace.
`define Quasi6502_GenerateImplementation(spec)              \
    `GenerateOpcodeDecoder(spec, busDataIn)                 \
    /* --- */                                               \
    reg [7:0] q$operationResult;                            \
    reg q$flagZ;                                            \
    reg q$flagN;                                            \
    function q$calcFlagZ(input [7:0] operand);              \
        q$calcFlagZ = (operand == 0);                       \
    endfunction                                             \
    function q$calcFlagN(input [7:0] operand);              \
        q$calcFlagN = (operand[7] == 1);                    \
    endfunction                                             \
    /*--*/

`define EvaluateSpec(spec, mode)                            \
    `define SpecEvaluation$``mode                           \
    spec                                                    \
    `undef SpecEvaluation$``mode

`define GenerateOpcodeDecoder(spec, octet)                  \
    reg q$decoderZeropage;                                  \
    reg q$decoderZeropageX;                                 \
    reg q$decoderAbsolute;                                  \
    reg q$decoderAbsoluteX;                                 \
    reg q$decoderWriteBack;                                 \
    always @(*) begin                                       \
        q$decoderZeropage = 0;                              \
        q$decoderZeropageX = 0;                             \
        q$decoderAbsolute = 0;                              \
        q$decoderAbsoluteX = 0;                             \
        q$decoderWriteBack = 0;                             \
        case (octet)                                        \
            `EvaluateSpec(spec, DecodeOpcode)               \
        endcase                                             \
    end                                                     \
    /* --- */

`define ModifyZeropage(opcode, operation)                   \
    `ifdef SpecEvaluation$DecodeOpcode                      \
        opcode: begin                                       \
            q$decoderZeropage = 1'b1;                       \
            q$decoderWriteBack = 1'b1;                      \
        end                                                 \
    `endif

`define ModifyZeropageX(opcode, operation)                  \
    `ifdef SpecEvaluation$DecodeOpcode                      \
        opcode: begin                                       \
            q$decoderZeropageX = 1'b1;                      \
            q$decoderWriteBack = 1'b1;                      \
        end                                                 \
    `endif

`define ModifyAbsolute(opcode, operation)                   \
    `ifdef SpecEvaluation$DecodeOpcode                      \
        opcode: begin                                       \
            q$decoderAbsolute = 1'b1;                       \
            q$decoderWriteBack = 1'b1;                      \
        end                                                 \
    `endif

`define ModifyAbsoluteX(opcode, operation)                  \
    `ifdef SpecEvaluation$DecodeOpcode                      \
        opcode: begin                                       \
            q$decoderAbsoluteX = 1'b1;                      \
            q$decoderWriteBack = 1'b1;                      \
        end                                                 \
    `endif

`define SetOperationResult(result) q$operationResult <= (result)
`define UpdateFlagN(result) q$flagN <= q$calcFlagN(result)
`define UpdateFlagZ(result) q$flagZ <= q$calcFlagZ(result)
