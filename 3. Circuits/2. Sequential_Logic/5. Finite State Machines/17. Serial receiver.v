module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

    parameter [2:0] IDLE=3'd0,START=3'd1,DATA=3'd2,STOP=3'd3,WAIT=3'd4;
    reg [2:0] state,next_state;
    reg [2:0] count;
    
    always@(posedge clk) begin
        if(reset)
            state<=2'b0;
        else
            state<=next_state;
    end
    
    always@(posedge clk) begin
        if(reset || state!=DATA)
            count<=3'b0;
       else
            count<=count+1'b1;
    end
            
    
    always@(*) begin
        
        case(state)
            
            IDLE:begin
                if(!in)
                    next_state=DATA;
                else
                    next_state=IDLE;
            end
            
            
            DATA:begin
                if(count==3'b111) 
                    next_state=STOP;
                else
                    next_state=DATA;
            end
                
            STOP:begin
                if(in)
                    next_state=IDLE;
                else
                    next_state=WAIT;
            end
            
            WAIT:begin
                if(in)
                    next_state=IDLE;
                else
                    next_state=WAIT;
            end
            
            default:next_state=IDLE;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)
            done<=1'b0;
        else if((state==STOP)&&in)
            done<=1'b1;
        else
            done<=1'b0;
    end
            
                
endmodule

