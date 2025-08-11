module up_down_counter (
    input        clk,    
    input        rst,    
    input        up,     
    output reg [3:0] count );

    always @(posedge clk) begin
        if (rst) begin
            count <= 4'b0000; // Reset counter to 0
        end
        else begin
            if (up) 
                count <= count + 1; // Count up
            else 
                count <= count - 1; // Count down
        end
    end

endmodule
