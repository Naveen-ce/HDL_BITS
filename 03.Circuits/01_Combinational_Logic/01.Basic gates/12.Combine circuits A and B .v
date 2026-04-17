module top_module (input x, input y, output z);
    
    wire out1,out2,out3,out4,out5,out6;
    
    assign out1=(x^y)&x;
    assign out2=~(x^y);
    
    assign out3=(x^y)&x;
    assign out4=~(x^y);
     
    assign out5=out1|out2;
    assign out6=out3&out4;
    
    assign z=out5^out6;
   
endmodule



