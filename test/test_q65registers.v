
module test_q65registerI11;

    reg  [7:0] dataIn;
    wire [7:0] dataOut;
    reg        load;
    reg        enableOut;

    q65registerI11 r(
        .busIn     (dataIn),
        .busOut    (dataOut),
        .loadIn    (load),
        .enableOut (enableOut));

    initial begin
        dataIn = 13;
        load = 1;
        #1;

        $display("dataOut = %d", dataOut);
        #1;

        enableOut = 1;
        #1;
        $display("dataOut = %d", dataOut);

    end
endmodule
