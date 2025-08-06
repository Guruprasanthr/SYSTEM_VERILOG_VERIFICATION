class scoreboard;

  // Mailbox to receive transactions from monitor
  mailbox mb2;

  // Constructor to initialize mailbox
  function new(mailbox mb2);
    this.mb2 = mb2;
  endfunction

  // Main task to verify outputs
  task main();
    transaction tr;

    repeat (2) begin
      mb2.get(tr);  // Receive transaction from monitor

      tr.display("From Scoreboard");  // Display received values

      // Check expected sum and carry using full adder logic
      if ((tr.a ^ tr.b ^ tr.c) == tr.sum &&
          ((tr.a & tr.b) | (tr.b & tr.c) | (tr.a & tr.c)) == tr.carry)
        $display("Result: PASS");
      else
        $display("Result: FAIL");
    end
  endtask

endclass
