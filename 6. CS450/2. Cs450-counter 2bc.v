module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    parameter [1:0] SNT=2'd0,
                    WNT=2'd1,
                    WT=2'd2,
                    ST=2'd3; 
    
    reg [1:0] next_state;
    always@(posedge clk or posedge areset) begin
        if(areset)
            state<=2'b01;
        else
            state<=next_state;
    end
    
    always@(*)begin
        
        case(state)
            
            SNT:begin
                if(train_valid && train_taken)
                    next_state=WNT;
                else 
                    next_state=SNT;
            end
            
            WNT:begin
                if(train_valid && train_taken)
                    next_state=WT;
                else if(train_valid && !train_taken)
                    next_state=SNT;
                else
                    next_state=WNT;
            end
            
            WT: begin
                if(train_valid && train_taken)
                    next_state=ST;
                else if(train_valid && !train_taken)
                    next_state=WNT;
                else
                    next_state=WT;
            end
            
            ST:begin
                if(train_valid && train_taken)
                    next_state=ST;
                else if(train_valid && !train_taken)
                    next_state=WT;
                else
                    next_state=ST;
            end
            
            default:next_state=WNT;
        endcase
    end
                 

endmodule

