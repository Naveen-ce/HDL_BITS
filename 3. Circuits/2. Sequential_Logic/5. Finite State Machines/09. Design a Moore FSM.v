module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter [2:0] LOW=3'd0,QUART=3'd1,HALF=3'd2,FULL=3'd3;
    reg [2:0] state,next_state;
    
    always@(posedge clk) begin
        if(reset) begin
            state<=LOW;
            dfr<=1'b1;
        end
        else begin
            state<=next_state;
            
            if(next_state<state)
                dfr<=1'b1;
            else if(next_state>state)
                dfr<=1'b0;
        end
    end
    
    always@(*) begin
       
        case(s)
            3'b000:next_state=LOW;
            3'b001:next_state=QUART;
            3'b011:next_state=HALF;
            3'b111:next_state=FULL;
            default:next_state=state;
           
        endcase
    end
    
    always@(*) begin
        case(state)
            
            LOW:{fr3,fr2,fr1}=3'b111;
            QUART:{fr3,fr2,fr1}=3'b011;
            HALF:{fr3,fr2,fr1}=3'b001;
            FULL:{fr3,fr2,fr1}=3'b000;
            default:{fr3,fr2,fr1}=3'b111;
        endcase
    end
endmodule

