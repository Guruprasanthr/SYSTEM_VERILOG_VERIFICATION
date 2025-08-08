class monitor;
  virtual intf vif;
  mailbox mb2;
  transaction tr;

  function new(virtual intf vif, mailbox mb2);
    this.vif = vif;
    this.mb2 = mb2;
  endfunction

  task main();
    repeat (10) begin
      #3;
      tr = new();
      tr.d   = vif.d;
      tr.rst = vif.rst;
      tr.q   = vif.q;
      tr.qb  = vif.qb;
      mb2.put(tr);
      tr.display("From Monitor");
      #1;
    end
  endtask
endclass
