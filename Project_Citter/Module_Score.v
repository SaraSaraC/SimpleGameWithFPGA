module Module_Score	(	input clk,
								input new_game,
								input [7:0]  max_score,
								input [9:0]  Xball,
								input [9:0]  Yball,
								input [9:0]	 barMovement,
								input [10:0] radius,
								input [10:0] bar_lenght,
				
								output reg [7:0] score,
								output reg reset,
								output caught,
								output win);

assign caught = (((Xball-radius) >= (barMovement-radius)) && ((Xball+radius) <= (barMovement + bar_lenght)) && (Yball >= 10'd455));
assign win = (score >= max_score);

always @(posedge clk) begin
	if (!win) begin
		if (caught) begin		//Point
			score <= score + 8'd1;	
			reset <= 0;
		end else if (((((Xball-radius) < (barMovement)) || ((Xball+radius) > (barMovement + bar_lenght))) && (Yball >= 10'd455))) begin	// reset
			score <= 8'd0;
			reset <= 1;
		end	
	end else if (win) begin		//When the player wins, reaching max_score 
		if (!new_game) begin
			score <= (8'b11111111);
		end else if (new_game) begin
			score <= 8'd0;
		end	
	end	
end

endmodule 
