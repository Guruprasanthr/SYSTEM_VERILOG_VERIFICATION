class driver;

  // Class members: virtual interface and mailbox
  virtual intf vif;
  mailbox mb1;
  transaction tr;

  // Constructor: initializes interface and mailbox
  function new(virtual intf vif, mailbox mb1);
    this.vif = vif;
    this.mb1 = mb1;
  endfunction

  // Main task: receive transaction and drive signals
  task main();
    repeat (2) begin
      #1;
      tr =new();
      mb1.get(tr);        // Receive transaction from generator
      vif.a = tr.a;             // Drive input signals
      vif.b = tr.b;
      vif.c = tr.c;                        // Wait for signals to settle
      tr.display("From Driver");
      #2;// Display the transaction
    end
  endtask

endclass
