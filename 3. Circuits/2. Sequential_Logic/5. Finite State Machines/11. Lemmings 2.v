module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
     parameter LEFT=2'd0, RIGHT=2'd1, FALL_L=2'd2, FALL_R=2'D3; 
    reg [1:0] state, next_state;

    always @(*) begin
        case(state)
            
            LEFT:begin
                if(!ground)
                    next_state=FALL_L;
                else if(bump_left)
                    next_state=RIGHT;
                else
                    next_state=LEFT;
            end
            
            FALL_L:begin
                if(ground)
                    next_state=LEFT;
                else
                    next_state=FALL_L;
            end
                    
            
            RIGHT:begin
                if(!ground)
                    next_state=FALL_R;
                else if(bump_right)
                    next_state=LEFT;
                else
                    next_state=RIGHT;
            end
            
            FALL_R:begin
                if(ground)
                    next_state=RIGHT;
                else
                    next_state=FALL_R;
            end
                    
            default:next_state=LEFT;
        endcase
    end
                

    always @(posedge clk, posedge areset) begin
        if(areset)
            state<=LEFT;
        else
            state<=next_state;
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
            assign aaah=(state==FALL_L) || (state==FALL_R);

endmodule




