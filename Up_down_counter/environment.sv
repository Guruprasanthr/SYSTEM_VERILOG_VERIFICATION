`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator g;
  driver d;
  monitor m;
  scoreboard s;
  event myevent;

  mailbox mb1;
  mailbox mb2;

  virtual intf vif;

  function new(virtual intf vif);
    this.vif = vif;

    mb1 = new();
    mb2 = new();


    g = new(mb1, myevent);
    d = new(mb1, vif);
    m = new(mb2, vif); 
    s = new(mb2,myevent);
  endfunction

  task t_run();
    fork
      g.main();
      d.main();
      m.main();
      s.main();
    join
  endtask
endclass
