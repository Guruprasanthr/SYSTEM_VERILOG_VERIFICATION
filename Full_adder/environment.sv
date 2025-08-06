`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;

  // Component handles
  generator     g;
  driver        d;
  monitor       m;
  scoreboard    s;

  // Mailboxes for communication
  mailbox mb1;
  mailbox mb2;

  // Interface handle
  virtual intf vif;

  // Constructor
  function new(virtual intf vif);
    this.vif = vif;

    // Create mailboxes
    mb1 = new();
    mb2 = new();

    // Instantiate components
    g = new(mb1);
    d = new(vif, mb1);
    m = new(vif, mb2);
    s = new(mb2);
  endfunction

  // Run all components in parallel
  task test_run();
    fork
      g.main();
      d.main();
      m.main();
      s.main();
    join
  endtask

endclass
