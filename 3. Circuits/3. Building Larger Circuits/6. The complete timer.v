module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack
    );
    
    parameter [3:0] s1=4'd0,
    s2=4'd1,
    s3=4'd2,
    s4=4'd3,
    shift_1=4'd4,
    shift_2=4'd5,
    shift_3=4'd6,
    shift_4=4'd7,
    wait_count=4'd8,
    wait_ack=4'd9;
    
    reg [3:0] state;
    reg [9:0] thousand_count;
    wire done_counting;
    wire shift_ena;
    always@(posedge clk) begin
        
        if(reset)
            state<=s1;
        else begin
            
            case(state)
                
                s1: begin
                    
                    if(data)
                        state<=s2;
                    else
                        state<=s1;
                end
                
                s2: begin
                       
                    if(data)
                        state<=s3;
                    else
                        state<=s1;
                end
                
                s3: begin
                        
                    if(data)
                        state<=s3;
                    else
                        state<=s4;
                end
                
                s4: begin
                    
                    if(data) 
                        state<=shift_1;
                    else
                        state<=s1;
                end
                
                
                shift_1: state<=shift_2;
              
                shift_2: state<=shift_3;
               
                shift_3:state<=shift_4;
                
                shift_4:state<=wait_count;
                
                    
                wait_count: begin
                        
                        if(done_counting)
                            state<=wait_ack;
                        else
                            state<=wait_count;
                    end
                    
                wait_ack: begin
                        
                        if(ack)
                            state<=s1;
                        else
                            state<=wait_ack;
                        
                    end
                    endcase
                end
                end
                    
    assign shift_ena=(state==shift_1) || (state==shift_2) || (state==shift_3) || (state==shift_4);
                                                             assign counting=(state==wait_count);
                                                             assign done=(state==wait_ack);
    
    assign done_counting=(count==0 && thousand_count==999 && counting);
   
    always@(posedge clk) begin

        if(counting) begin

        if(thousand_count==999)

            thousand_count<=0;

        else

            thousand_count<=thousand_count+1'b1;

    end

        else

            thousand_count<=0;

    end

    
    always@(posedge clk) begin

        if(shift_ena)

            count<={count[2:0],data};

        

        else if(counting && thousand_count==999)

            count<=count-1'b1;

        else

            count<=count;
    end

        
                        
endmodule

