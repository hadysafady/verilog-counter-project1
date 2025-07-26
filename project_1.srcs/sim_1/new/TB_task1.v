`timescale 1ns / 1ps
module TB_task1;
reg EN , rst;
reg clk=0 ;
wire [3:0] count;
reg [3:0] expected_count = 0,mon_count=0;
integer count_enable = 0;
integer count_reset = 0;
integer count_en_off = 0;

Task1 U(.EN(EN), .rst(rst), .clk(clk), .count(count));
always #5 clk = ~clk;

always @(posedge clk) 
   #0.1 mon_count = count;  
  
always @(posedge clk or posedge rst ) begin
    if (rst)
        expected_count <= 0;
    else if (EN)
        expected_count <= expected_count + 1;

    if (!rst && mon_count !== expected_count) begin
        $display("? ERROR at time %0t: mon_count=%d, expected=%d", $time, mon_count, expected_count);
        $fatal;  
    end
end
initial begin
    rst = 1; EN = 0; #20;  
    rst = 0; EN = 1; #80;  
    EN = 0; #20;           
    rst = 1; #10; rst = 0; 
    EN = 1; #80;   
    $display("==== Coverage Report ====");
    $display("Clock cycles with EN=1     : %0d", count_enable);
    $display("Clock cycles with EN=0     : %0d", count_en_off);
    $display("Reset activations observed : %0d", count_reset);        
    $finish;
end

always @(posedge clk) begin
    if (EN)
        count_enable = count_enable+1;
    else
        count_en_off = count_en_off + 1;
    if (rst)
        count_reset = count_reset + 1;
end
endmodule
