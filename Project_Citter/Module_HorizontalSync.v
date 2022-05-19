module Module_HorizontalSync(  input clk,		//25 MHz
	 
										 output H_Sync,
										 output reg H_Display,
										 output reg [9:0] H_Coord); //Coordinates from 0 to 639

reg [10:0] counter; 

always@(posedge clk) begin
	if(counter == 11'd799)	//800 = Total number of clocks needed for the Horizontal Sync
	begin
		counter = 11'b0;
	end else	begin
		counter = counter + 1'b1;
	end
end

assign H_Sync = (counter < 11'd96)? 0 : 1;	//96 = Clocks in the Pulse Width for the Horizontal Sync

always@(posedge clk) begin
	if((counter > 11'd144) && (counter < 11'd784))	//Display area: from 144 to 784 clocks
	begin
		H_Display <= 1'b1;
		H_Coord <= H_Coord + 1'b1;
	end else begin
		H_Coord <= 7'b0;
      H_Display <= 0;
	end
end

endmodule 
