// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    
    always@(*) begin
        
        if(sel_b1==0 && sel_b2==0)
            out_always=a;
        else if(sel_b1==0 && sel_b2==1)
            out_always=a;
        else if(sel_b1==1 && sel_b2==0)  
            out_always=a;
        else
            out_always=b;
    end
    
    assign out_assign=sel_b1?(sel_b2?b:a):(sel_b2?a:a);

endmodule

