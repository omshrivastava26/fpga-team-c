module receiver(input rx, input s_tick,input clk, output reg [7:0] dout);

parameter [3:0] IDLE=4'd0;
parameter [3:0] DATA0=4'd1;
parameter [3:0] DATA1=4'd2;
parameter [3:0] DATA2=4'd3;
parameter [3:0] DATA3=4'd4;
parameter [3:0] DATA4=4'd5;
parameter [3:0] DATA5=4'd6;
parameter [3:0] DATA6=4'd7;
parameter [3:0] DATA7=4'd8;

    reg [5:0]counter;
    reg [3:0] state;
    reg [7:0] dout_tp;
    reg [3:0] count;


    always @(posedge s_tick) begin
        case(state)

            IDLE:
                if(rx==0 && counter ==4'd7)begin

                  state <= DATA0;
                  counter<=0;
                  dout_tp<=0;

                end
                else begin
                  counter<=counter+1;
                end
                
            DATA0:
            if (counter == 4'd15) begin
                state<=DATA1;
                counter<=0;
                dout_tp[0]<=rx;
                count<=count+1;

            end
            else begin
              counter<=counter+1;
            end
            
            DATA1:
            if (counter == 4'd15) begin
                state<=DATA2;
                counter<=0;
                dout_tp[1]<=rx;
                count<=count+1;

            end
            else begin
              counter<=counter+1;
            end

            DATA2:
            if (counter == 4'd15) begin
                state<=DATA3;
                counter<=0;
                dout_tp[2]<=rx;
                count<=count+1;

            end
            else begin
              counter<=counter+1;
            end
            DATA3:
            if (counter == 4'd15) begin
                state<=DATA4;
                counter<=0;
                dout_tp[3]<=rx;
                count<=count+1;

            end
            else begin
              counter<=counter+1;
            end
            DATA4:
            if (counter == 4'd15) begin
                state<=DATA5;
                counter<=0;
                dout_tp[4]<=rx;
                count<=count+1;

            end
            else begin
              counter<=counter+1;
            end
            DATA5:
            if (counter == 4'd15) begin
                state<=DATA6;
                counter<=0;
                dout_tp[5]<=rx;
                count<=count+1;

            end
            else begin
              counter<=counter+1;
            end
            DATA6:
            if (counter == 4'd15) begin
                state<=DATA7;
                counter<=0;
                dout_tp[6]<=rx;
                count<=count+1;

            end
            else begin
              counter<=counter+1;
            end
            DATA7:
            if (counter == 4'd15) begin
                state<=IDLE;
                counter<=0;
                dout_tp[7]<=rx;
                count<=count+1;

            end
            else begin
              counter<=counter+1;
            end    

        endcase
    end

    always @(posedge clk) begin
        if (count==4'd8) begin
            for (integer i =0 ;i<8 ; i++) begin
                dout[i]<=dout_tp[i];
                dout_tp[i]<=0;
            end
            count<=0;
            counter<=0;
            state<=IDLE;

        end
        
    end





endmodule