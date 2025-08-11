`include "interface.sv"
`include "test.sv"

module testbench;
  // Instantiate the interface
  intf vif();

  // Instantiate the DUT
  up_down_counter uut (
    .clk   (vif.clk),
    .rst   (vif.rst),
    .up    (vif.up),
    .count (vif.count)
  );

  // Instantiate the test program
  test tst(vif);

  // Clock generation
  initial begin 
    vif.clk = 1;
    vif.rst=1;#4;
    vif.rst = 0;
//     vif.up=0;
  end
  always #2 vif.clk = ~vif.clk; // 4 time unit period
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars(0, testbench);
    #100;
    $finish;
  end
endmodule
