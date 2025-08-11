class transaction;
  rand bit up;           
  bit rst;               
  bit [3:0] count;       
  bit clk;

  function void display(string name);
    $display("%s", name);
    $display($time,"up=%b, clk=%b, rst=%b, count=%0d", up, clk, rst, count);
  endfunction
endclass
