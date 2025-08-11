class scoreboard;

  mailbox mb2;        
  transaction tr;    
  bit [3:0] count;  
  event my_event;     

  function new(mailbox mb2, event my_event);
    this.mb2     = mb2;
    this.my_event = my_event;
    count        = 0;  // Initialize expected count
  endfunction

  task main();
    repeat (10) begin
      mb2.get(tr);
      tr.display("From scoreboard");

      if (tr.rst)
        count = 0;
      else begin 
        if (tr.up)
        count = count + 1;
      else
        count = count - 1;
        
      end

      if (count == tr.count)
        $display("--------------------- PASS --------------------");
      else
        $display("--------------------- FAIL --------------------",tr.count);

      ->my_event; 
    end
  endtask

endclass
