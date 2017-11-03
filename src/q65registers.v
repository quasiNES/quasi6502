
module q65registerI11
   (input  wire [7:0] busIn,
    input  wire       loadIn,
    output wire [7:0] busOut,
    input  wire       enableOut);

    reg [7:0] mem;
    assign busOut = enableOut ? mem : 8'hzz;

    always @(loadIn, busIn) begin
        if (loadIn)
            mem <= busIn;
    end
endmodule


module q65registerI12
   (input  wire [7:0] busIn,
    input  wire       loadIn,
    output wire [7:0] busOut1,
    input  wire       enableOut1,
    output wire [7:0] busOut2,
    input  wire       enableOut2);

    reg [7:0] mem;
    assign busOut1 = enableOut1 ? mem : 8'hzz;
    assign busOut2 = enableOut2 ? mem : 8'hzz;

    always @(loadIn, busIn) begin
        if (loadIn)
            mem <= busIn;
    end
endmodule


module q65registerI21
   (input  wire [7:0] busIn1,
    input  wire       loadIn1,
    input  wire [7:0] busIn2,
    input  wire       loadIn2,
    output wire [7:0] busOut,
    input  wire       enableOut);

    reg [7:0] mem;
    assign busOut = enableOut ? mem : 8'hzz;

    // FIXME: Potential race condition.
    always @(loadIn1, busIn1, loadIn2, busIn2) begin
        if (loadIn1)
            mem <= busIn1;

        if (loadIn2)
            mem <= busIn2;
    end
endmodule
