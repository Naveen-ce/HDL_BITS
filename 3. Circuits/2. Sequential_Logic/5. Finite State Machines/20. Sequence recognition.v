module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    parameter [2:0] S0=3'd0,S1=3'd1,S2=3'd2,S3=3'd3,S4=3'd4,S5=3'd5,FLAG=3'd6,ERROR=3'd7;
    reg[2:0] state,next_state;
    
    always@(posedge clk) begin
        if(reset)
            state<=0;
        else
            state<=next_state;
    end
    
    always@(*)begin
        
        case(state)
            
            S0:begin
                if(in)
                    next_state=S1;
                else
                    next_state=S0;
            end
            
            S1:begin
                if(in)
                    next_state=S2;
                else
                    next_state=S0;
            end
            
            S2:begin
                if(in)
                    next_state=S3;
                else
                    next_state=S0;
            end
            
            S3:begin
                if(in)
                    next_state=S4;
                else
                    next_state=S0;
            end
            
            S4:begin
                if(in)
                    next_state=S5;
                else
                    next_state=S0;
            end
            
            S5:begin
                if(in)
                    next_state=FLAG;
                else
                    next_state=S0;
            end
            
            FLAG:begin
                if(in)
                    next_state=ERROR;
                else
                    next_state=S0;
            end
            
            ERROR:begin
                if(in)
                    next_state=ERROR;
                else
                    next_state=S0;
            end
            
            default:next_state=S0;
            
        endcase
    end
    
  
    assign err=(state==ERROR);

    always@(posedge clk)begin
        if(reset)
            disc<=1'b0;
        else if((state==S5)&& (!in))
            disc<=1'b1;
        else
            disc<=1'b0;
    end

 always@(posedge clk)begin
        if(reset)
            flag<=1'b0;
     else if((state==FLAG)&& (!in))
            flag<=1'b1;
        else
            flag<=1'b0;
    end



endmodule

