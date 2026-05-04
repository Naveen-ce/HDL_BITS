module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

   
    always@(posedge clk) begin
        if(reset)
            pm<=1'b0;
        else if(ena) begin
            if(hh==8'h11 && mm==8'h59 && ss==8'h59)
            pm<=~pm;
        end
    end
    
    // Hour counter
    always@(posedge clk) begin
        if(reset)
            hh<=8'h12;
        else if(ena) begin
            if(mm==8'h59 && ss==8'h59) begin
                if(hh==8'h12)
                    hh<=8'h01;
                else if(hh[3:0]==4'h9) begin
                    hh[3:0]<=4'h0;
                    hh[7:4]<=hh[7:4]+1'b1;
                end
                else
                    hh[3:0]<=hh[3:0]+1'b1;
            end
        end
    end

//Minutes counter
 always@(posedge clk) begin
        if(reset)
            mm<=8'h00;
        else if(ena) begin
            if(ss==8'h59) begin
                if(mm==8'h59)
                    mm<=8'h00;
                else if(mm[3:0]==4'h9) begin
                    mm[3:0]<=4'h0;
                    mm[7:4]<=mm[7:4]+1'b1;
                end
                else
                    mm[3:0]<=mm[3:0]+1'b1;
            end
        end
    end
    
// Seconds counter
 always@(posedge clk) begin
        if(reset)
            ss<=8'h00;
        else if(ena) begin
            if(ss==8'h59)
                    ss<=8'h00;
            else if(ss[3:0]==4'h9) begin
                    ss[3:0]<=4'h0;
                    ss[7:4]<=ss[7:4]+1'b1;
            end
            else
                    ss[3:0]<=ss[3:0]+1'b1;
            
        end
    end
    

endmodule

