class monitor;
  mailbox mb2;          
  virtual intf vif;    
  transaction tr;      

  function new(mailbox mb2, virtual intf vif);
    this.mb2 = mb2;
    this.vif = vif;
  endfunction

  task main();
    repeat(10)begin
      @(negedge vif.clk);
      tr = new();

      tr.rst   = vif.rst;
      tr.up    = vif.up;
      tr.count = vif.count;

      mb2.put(tr);  // Send to scoreboard
      tr.display("From Monitor");
      $display(vif.count,vif.up);
    end
  endtask
endclass
