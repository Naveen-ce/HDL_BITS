module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    
    parameter [2:0] A=3'd0,B=3'd1,B_R=3'd2,CH1=3'd3,CH2=3'd4,D1=3'd5,D2=3'd6,D3=3'd7;
    
    reg [2:0] state,next_state;
    always@(posedge clk ) begin
        if(reset)
            state<=3'd0;
        else
            state<=next_state;
    end
    
    always@(*) begin
        case(state)
 
           A:next_state=s?B:A;
            
           B:next_state=w?CH1:CH2;
           B_R:next_state=w?CH1:CH2; 
            
           CH1:next_state=w?D1:D2;
           CH2:next_state=w?D2:D3;


           D1:next_state=w?B:B_R; 
           D2:next_state=w?B_R:B;
           D3:next_state=w?B:B;
            
           default:next_state=A;  
        endcase
    end
    
assign z=(state==B_R);
    
endmodule

