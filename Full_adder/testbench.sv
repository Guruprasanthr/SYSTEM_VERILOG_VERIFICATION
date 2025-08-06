`include "interface.sv"
`include "test.sv"
module testbench;
  intf vif();
  test tst(vif);
  
  full_adder FA(.a(vif.a),
                .b(vif.b),
                .c(vif.c),
                .sum(vif.sum),
                .carry(vif.carry));
endmodule
                
