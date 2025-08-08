class driver;
  mailbox mb1;
  virtual intf vif;
  transaction tr;

  function new(virtual intf vif, mailbox mb1);
    this.vif = vif;
    this.mb1 = mb1;
  endfunction

  task main();
    repeat (10) begin
      #1;
      mb1.get(tr);
      vif.d = tr.d;
      vif.rst = tr.rst;
      tr.display("From driver");
    end
  endtask
endclass
