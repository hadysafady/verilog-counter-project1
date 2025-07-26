`timescale 1ns / 1ps
module Task1(
input clk,rst,EN ,
output reg [3:0] count = 0 );

always @(posedge clk or posedge rst) 
     if (rst) begin 
        count<=0;
     end
     else if (EN) begin
          count <= count + 1 ;
     end   
endmodule
