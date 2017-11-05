
module test_q65busdrivers;

    tri [7:0] busL;
    tri [7:0] busR;
    q65busDriver0 driverL(busL, );
    q65busDriver1 driverR(busR, );
    q65busBridge  bridge (busL, busR,, );

    q65generateSeq#(4) gen({
        bridge.pass12,
        bridge.pass21,
        driverL.enableOut,
        driverR.enableOut}, );

    initial
        $monitor("Tick %d: (%b) %h <-%b--%b-> %h (%b)",
            gen.counter, driverL.enableOut, busL, bridge.pass21, bridge.pass12, busR, driverR.enableOut);

endmodule
