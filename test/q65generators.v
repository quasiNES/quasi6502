
module q65generateSeq
  #(parameter Nsignals = 1,
    parameter Nticks   = 1 << Nsignals)
   (output wire [Nsignals-1:0] out,
    output wire         [31:0] counter);

    reg [Nsignals-1:0] val;
    integer tick;

    assign out = val;
    assign counter = tick;

    initial begin
        val = 0;
        tick = 0;
        while (tick < Nticks) begin
            #1;
            val  = val + 1;
            tick = tick + 1;
        end
        $finish;
    end
endmodule
