module Module_FSM_Bar(	input clk_in,
								input reset,
								input new_game,
								input [3:0] direction,
								input [9:0] dimension,
														
								output [9:0] movement);

reg signed [9:0] H_Direction;

buf(movement, H_Direction);

always @(posedge clk_in) begin
	if (reset || new_game) begin
		H_Direction <= 10'd300; 	//Starting position
	end else if (~reset) begin
		case (direction)				
			4'b0001 : H_Direction <= (H_Direction + dimension); // right 
			4'b0010 : H_Direction <= (H_Direction - dimension); // left
		endcase
	end 	
end

endmodule 
