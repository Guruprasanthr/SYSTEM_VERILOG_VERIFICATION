class driver;
  mailbox mb1;          
  virtual intf vif;     
  transaction tr;       

  function new(mailbox mb1, virtual intf vif);
    this.mb1 = mb1;
    this.vif = vif;
  endfunction

  task main();
    repeat (10) begin
      mb1.get(tr);  // Wait for transaction from generator

      vif.up  = tr.up;
//       vif.rst = tr.rst;1

      tr.display("From driver");
    end
  endtask
endclass
