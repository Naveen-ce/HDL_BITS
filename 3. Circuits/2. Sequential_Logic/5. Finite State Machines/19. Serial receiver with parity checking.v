module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Modify FSM and datapath from Fsm_serialdata
    
    parameter [2:0] IDLE=3'd0,DATA=3'd1,PARITY=3'd2,STOP=3'd3,WAIT=3'd4;
    reg [2:0] state,next_state;
    reg [2:0] count;
    reg[7:0] mem;
    wire odd;
    
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
                    next_state=PARITY;
                else
                    next_state=DATA;
            end
            
            
            PARITY:next_state=STOP;
               
            
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
    
    
            
    // New: Datapath to latch input bits.
        always@(posedge clk) begin
            if(state==DATA)
                mem<={in,mem[7:1]};
            else
                mem<=mem;
        end
        
        assign out_byte=mem;
    
    
    wire reset_parity=reset||(state==IDLE);
 
    // New: Add parity checking.
    parity p1(.clk(clk), .in(in), .reset(reset_parity), .odd(odd));


    always@(posedge clk) begin
        if(reset)
            done<=1'b0;
        else if((state==STOP) && in && odd)
            done<=1'b1;
        else
            done<=1'b0;
        end


endmodule

