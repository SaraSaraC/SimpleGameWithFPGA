module Module_VerticalSync( input clk,		//25 MHz
									 output V_Sync,
									 output reg V_Display,
									 output reg [9:0] V_Coord);	//Coordinates from 0 to 479
									 
reg [19:0] counter;
reg [10:0] divide_counter;

always@(posedge clk) begin
	if(counter == 20'd416799) begin	//416800 = Total number of clocks needed for the Vertical Sync
		counter <= 20'b0;
	end else begin
		counter <= counter + 1'b1;
	end
end

assign V_Sync = (counter < 20'd1600)? 0 : 1; 	//1600 = Clocks in the Pulse Width for the Vertical Sync (2 lines x 800 columns)

always@(posedge clk) begin
	if((counter > 20'd24800) && (counter < 20'd408801)) begin	//Display Area is on
		V_Display <= 1'b1;
		if(divide_counter == 11'd799) begin
         divide_counter <= 0;
         if(V_Coord == 10'd479) begin
            V_Coord <= 0;
         end else begin
				V_Coord <= V_Coord + 1'b1;
         end
      end else begin
         divide_counter <= divide_counter + 1'b1;
			V_Coord <= V_Coord;
      end
	end else begin
		V_Coord <= 7'b0;
		V_Display <= 0;
	end		
end

endmodule 
