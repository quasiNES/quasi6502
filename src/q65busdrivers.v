
module q65busDriver0
   (output wire [7:0] busOut,
    input  wire       enableOut);

    assign busOut = enableOut ? 8'h00 : 8'hzz;
endmodule

module q65busDriver1
   (output wire [7:0] busOut,
    input  wire       enableOut);

    assign busOut = enableOut ? 8'hff : 8'hzz;
endmodule

module q65busDriver
   (input  wire [7:0] data,
    output wire [7:0] busOut,
    input  wire       enableOut);

    assign busOut = enableOut ? data : 8'hzz;
endmodule

module q65busBridge
   (inout  wire [7:0] bus1,
    inout  wire [7:0] bus2,
    input  wire       pass12,
    input  wire       pass21);

    assign bus1 = pass21 && !pass21 ? bus2 : 8'hzz;
    assign bus2 = pass12 && !pass12 ? bus1 : 8'hzz;
endmodule
