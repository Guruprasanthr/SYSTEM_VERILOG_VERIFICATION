class transaction;
  rand bit d;
  bit rst;
  bit q;
  bit qb;
  
function void display(string name);
    $display("%s", name);
    $display("time = %0t,d=%b, rst=%b, q=%b, qb=%b",$time, d, rst, q, qb);
  endfunction
endclass
