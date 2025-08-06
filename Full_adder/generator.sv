class generator;

  // Declare a transaction handle and mailbox handle
  transaction tr;
  mailbox mb1;

  // Constructor: connects mailbox
  function new(mailbox mb1);
    this.mb1 = mb1;
  endfunction

  // Main task: create and send 2 random transactions
  task main();
    repeat (2) begin
      tr = new();                 
      tr.randomize();            
      tr.display("From Generator"); 
      mb1.put(tr);        // Send to driver
      #3;
    end
  endtask

endclass
