class scoreboard;
  mailbox mb2;
  event my_event;
  

  function new(mailbox mb2);
    this.mb2 = mb2;
  endfunction

  task main();
    transaction tr;
    repeat (10) begin
      mb2.get(tr);
      tr.display("From Scoreboard");

      if ((tr.rst && (tr.q == 0) && (tr.qb == 1)) ||
          (!tr.rst && (tr.q == tr.d) && (tr.qb == ~tr.q))) begin
        $display("STATUS:  Testcase Pass");
      end else begin
        $display("STATUS:  Testcase FAIL");
      end
      ->my_event;
    end
  endtask
endclass
