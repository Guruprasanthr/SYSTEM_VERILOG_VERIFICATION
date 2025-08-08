`include "interface.sv"
`include "test.sv"

module testbench;
  intf vif();

  // Instantiate the DUT
  dff dut(
    .d   (vif.d),
    .clk (vif.clk),
    .rst (vif.rst),
    .q   (vif.q),
    .qb  (vif.qb)
  );

  // Instantiate the test
  test tst(vif);

  initial begin
    vif.clk = 0;
    vif.d = 0;
    vif.rst = 0;  // Start with known reset value
  end

  always #2 vif.clk = ~vif.clk;  // 4ns clock

  initial begin
    $dumpfile("waves.vcd");
    $dumpvars();
    #100;
    $finish;
  end
endmodule
