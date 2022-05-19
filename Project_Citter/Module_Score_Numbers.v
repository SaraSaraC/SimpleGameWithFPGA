module Module_Score_Numbers ( input clk,
										input [7:0] score,
										input [9:0] H_Coord,
										input [9:0] V_Coord,

										output reg points_display);

reg zero, zero2, one, one2, two, two2, three, three2, four, four2, five, five2, six, six2, seven, seven2, eight, eight2, nine, nine2;
parameter shift = 10'd20;

always @(posedge clk) begin
	//zero
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		zero = (H_Coord >= 10'd11) && (H_Coord <= 10'd22);
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd25) begin
		zero = ((H_Coord >= 10'd10) && (H_Coord <= 10'd14) || (H_Coord >= 10'd19) && (H_Coord <= 10'd23));
	end
	//one
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd29)) begin
		one = (H_Coord >= 10'd15) && (H_Coord <= 10'd18);
	end
	//two
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd21 && V_Coord <= 10'd23) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		two = (H_Coord >= 10'd10) && (H_Coord <= 10'd22);
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd20) begin
		two = ((H_Coord >= 10'd20) && (H_Coord <= 10'd22));
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd25) begin
		two = ((H_Coord >= 10'd10) && (H_Coord <= 10'd12));
	end 
	//three
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd21 && V_Coord <= 10'd23) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		three = (H_Coord >= 10'd10) && (H_Coord <= 10'd22);
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd20) begin
		three = ((H_Coord >= 10'd20) && (H_Coord <= 10'd22));
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd25) begin
		three = ((H_Coord >= 10'd20) && (H_Coord <= 10'd22));
	end
	//four
	if (V_Coord >= 10'd21 && V_Coord <= 10'd23) begin
		four = (H_Coord >= 10'd10) && (H_Coord <= 10'd22);
	end else if (V_Coord >= 10'd15 && V_Coord <= 10'd20) begin
		four = ((H_Coord >= 10'd10) && (H_Coord <= 10'd14) || (H_Coord >= 10'd20) && (H_Coord <= 10'd22));
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd29) begin
		four = ((H_Coord >= 10'd20) && (H_Coord <= 10'd22));
	end
	//five
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd21 && V_Coord <= 10'd23) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		five = (H_Coord >= 10'd10) && (H_Coord <= 10'd22);
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd25) begin
		five = ((H_Coord >= 10'd20) && (H_Coord <= 10'd22));
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd20) begin
		five = ((H_Coord >= 10'd10) && (H_Coord <= 10'd12));
	end 
	//six
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd21 && V_Coord <= 10'd23) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		six = (H_Coord >= 10'd10) && (H_Coord <= 10'd22);
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd25) begin
		six = ((H_Coord >= 10'd20) && (H_Coord <= 10'd22) || (H_Coord >= 10'd10) && (H_Coord <= 10'd12));
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd20) begin
		six = ((H_Coord >= 10'd10) && (H_Coord <= 10'd12));
	end  
	//seven
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18)) begin
		seven = (H_Coord >= 10'd11) && (H_Coord <= 10'd22);
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd29) begin
		seven = ((H_Coord >= 10'd19) && (H_Coord <= 10'd22));
	end 
	//eight
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd21 && V_Coord <= 10'd23) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		eight = (H_Coord >= 10'd10) && (H_Coord <= 10'd22);
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd20) begin
		eight = ((H_Coord >= 10'd20) && (H_Coord <= 10'd22) || (H_Coord >= 10'd10) && (H_Coord <= 10'd12));
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd25) begin
		eight = ((H_Coord >= 10'd20) && (H_Coord <= 10'd22) || (H_Coord >= 10'd10) && (H_Coord <= 10'd12));
	end
	//nine
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd21 && V_Coord <= 10'd23) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		nine = (H_Coord >= 10'd10) && (H_Coord <= 10'd22);
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd25) begin
		nine = ((H_Coord >= 10'd20) && (H_Coord <= 10'd22));
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd20) begin
		nine = ((H_Coord >= 10'd20) && (H_Coord <= 10'd22) || (H_Coord >= 10'd10) && (H_Coord <= 10'd12));
	end  
	//traslated numbers for the second digit
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		zero2 = (H_Coord >= 10'd11 + shift) && (H_Coord <= 10'd22 + shift);
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd25) begin
		zero2 = ((H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd14 + shift) || (H_Coord >= 10'd19 + shift) && (H_Coord <= 10'd23 + shift));
	end
	//one
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd29)) begin
		one2 = (H_Coord >= 10'd15 + shift) && (H_Coord <= 10'd18 + shift);
	end
	//two
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd21 && V_Coord <= 10'd23) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		two2 = (H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd22 + shift);
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd20) begin
		two2 = ((H_Coord >= 10'd20 + shift) && (H_Coord <= 10'd22 + shift));
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd25) begin
		two2 = ((H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd12 + shift));
	end 
	//three
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd21 && V_Coord <= 10'd23) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		three2 = (H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd22 + shift);
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd20) begin
		three2 = ((H_Coord >= 10'd20 + shift) && (H_Coord <= 10'd22 + shift));
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd25) begin
		three2 = ((H_Coord >= 10'd20 + shift) && (H_Coord <= 10'd22 + shift));
	end
	//four
	if (V_Coord >= 10'd21 && V_Coord <= 10'd23) begin
		four2 = (H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd22 + shift);
	end else if (V_Coord >= 10'd15 && V_Coord <= 10'd20) begin
		four2 = ((H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd14 + shift) || (H_Coord >= shift + 10'd20) && (H_Coord <= 10'd22 + shift));
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd29) begin
		four2 = ((H_Coord >= 10'd20 + shift) && (H_Coord <= 10'd22 + shift));
	end
	//five
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd21 && V_Coord <= 10'd23) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		five2 = (H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd22 + shift);
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd25) begin
		five2 = ((H_Coord >= 10'd20 + shift) && (H_Coord <= 10'd22 + shift));
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd20) begin
		five2 = ((H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd12 + shift));
	end 
	//six
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd21 && V_Coord <= 10'd23) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		six2 = (H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd22 + shift);
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd25) begin
		six2 = ((H_Coord >= 10'd20 + shift) && (H_Coord <= 10'd22 + shift) || (H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd12 + shift));
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd20) begin
		six2 = ((H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd12 + shift));
	end  
	//seven
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18)) begin
		seven2 = (H_Coord >= 10'd11 + shift) && (H_Coord <= 10'd22 + shift);
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd29) begin
		seven2 = ((H_Coord >= 10'd19 + shift) && (H_Coord <= 10'd22 + shift));
	end 
	//eight
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd21 && V_Coord <= 10'd23) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		eight2 = (H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd22 + shift);
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd20) begin
		eight2 = ((H_Coord >= 10'd20 + shift) && (H_Coord <= 10'd22 + shift) || (H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd12 + shift));
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd25) begin
		eight2 = ((H_Coord >= 10'd20 + shift) && (H_Coord <= 10'd22 + shift) || (H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd12 + shift));
	end
	//nine
	if ((V_Coord >= 10'd15 && V_Coord <= 10'd18) || (V_Coord >= 10'd21 && V_Coord <= 10'd23) || (V_Coord >= 10'd26 && V_Coord <= 10'd29)) begin
		nine2 = (H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd22 + shift);
	end else if (V_Coord >= 10'd24 && V_Coord <= 10'd25) begin
		nine2 = ((H_Coord >= shift + 10'd20) && (H_Coord <= 10'd22 + shift));
	end else if (V_Coord >= 10'd19 && V_Coord <= 10'd20) begin
		nine2 = ((H_Coord >= 10'd20 + shift) && (H_Coord <= 10'd22 + shift) || (H_Coord >= 10'd10 + shift) && (H_Coord <= 10'd12 + shift));
	end
end

always @(posedge clk) begin
	if (score == 8'd0) begin
		points_display = zero;
	end else if (score == 8'd1) begin
		points_display = one;
	end else if (score == 8'd2) begin
		points_display = two;
	end else if (score == 8'd3) begin
		points_display = three;
	end else if (score == 8'd4) begin
		points_display = four;
	end else if (score == 8'd5) begin
		points_display = five;
	end else if (score == 8'd6) begin 
		points_display = six;
	end else if (score == 8'd7) begin
		points_display = seven;
	end else if (score == 8'd8) begin
		points_display = eight;
	end else if (score == 8'd9) begin
		points_display = nine;
	end else if (score == 8'd10) begin
		points_display = (one | zero2);
	end else if (score == 8'd11) begin
		points_display = one | one2;
	end else if (score == 8'd12) begin
		points_display = one | two2;
	end else if (score == 8'd13) begin
		points_display = one | three2;
	end else if (score == 8'd14) begin
		points_display = one | four2;
	end else if (score == 8'd15) begin
		points_display = one | five2;
	end	
end

endmodule
