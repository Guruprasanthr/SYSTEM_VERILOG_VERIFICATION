class monitor;

  // Virtual interface and mailbox handles
  virtual intf vif;
  mailbox mb2;
  transaction tr;

  // Constructor to initialize handles
  function new(virtual intf vif, mailbox mb2);
    this.vif = vif;
    this.mb2 = mb2;
  endfunction

  // Main task to monitor DUT outputs and send to scoreboard
  task main();
    repeat (2) begin
      #2; // Wait for outputs to settle
      
      tr = new();
      
      // Sample values from DUT through interface
      tr.a     = vif.a;
      tr.b     = vif.b;
      tr.c     = vif.c;
      tr.sum   = vif.sum;
      tr.carry = vif.carry;
      
      // Send transaction to scoreboard
      mb2.put(tr);
      
      // Display captured values
      tr.display("From Monitor");
      #1;
    end
  endtask

endclass
