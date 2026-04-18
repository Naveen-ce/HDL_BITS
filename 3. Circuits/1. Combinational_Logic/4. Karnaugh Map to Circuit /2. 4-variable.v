module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    assign out=((~d)&(~a))|((~a)&(~b)&(~c))|(c&d&a)|((~c)&(~b))|(c&d&b);

endmodule

