class generator;
  transaction tr;
  mailbox mb1;
  event my_event;

  function new(mailbox mb1);
    this.mb1 = mb1;
  endfunction

  task main();
    repeat (10) begin
      tr = new();
      tr.randomize();
      tr.display("From Generator");
      mb1.put(tr);
      @(my_event);
    end
  endtask
endclass
