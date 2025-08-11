class generator;
  transaction tr;
  mailbox mb1;
  event my_event;

  // Constructor: pass both mailbox and event from environment
  function new(mailbox mb1, event my_event);
    this.mb1 = mb1;
    this.my_event = my_event;
  endfunction

  task main();
    repeat (10) begin
      tr = new();
      tr.randomize();
      tr.display("From Generator");
      mb1.put(tr);       // Send transaction to driver
      @my_event;         // Wait until driver signals completion
    end
  endtask
endclass
