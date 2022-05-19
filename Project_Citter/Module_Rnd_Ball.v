module Module_RNDnumberGenerator (	input clk_in,
												input reset,
												input new_game,
												input caught,
												input [10:0] radius,
					
												output reg [9:0] X_rnd,
												output reg [9:0] Y_rnd);

always @(posedge clk_in) begin
	if (reset || new_game) begin
		X_rnd = 10'd320;
		Y_rnd <= 10'd10;
	end else if (caught) begin					//When the ball touches the bar: random new x-position
		X_rnd[9:0] = {X_rnd[8:0], ~(X_rnd[9]^X_rnd[7])};
		if (X_rnd >= 10'd639) begin 			//No balls in the corner
			X_rnd = 10'd629;	
		end else if (X_rnd <= 10'd22) begin //No balls in the corner
			X_rnd = 10'd23;	
		end
	end 
	Y_rnd <= Y_rnd + radius + radius;
	if (Y_rnd >= 10'd457) begin 				//When the ball is under the bar: start from the top
		Y_rnd <= 10'd10;	
	end 
end

endmodule 