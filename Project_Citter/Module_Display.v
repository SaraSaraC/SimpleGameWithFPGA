module Module_Display(	input clk,
								input Hdisplay,
								input Vdisplay,
								input ball,
								input bar,
								input win,
								input points,
								input [4:0] win_letters,
								
								output reg [3:0] Green,
								output reg [3:0] Blue,
								output reg [3:0] Red);

always@(posedge clk) begin
	if(Hdisplay && Vdisplay) begin
		if (!win) begin
			if (bar) begin					//Shows the green bar
				Red <= 4'b0000;
				Green <= 4'b1111;
				Blue <= 4'b0000;	
			end else if (ball) begin	//Shows the red ball
				Red <= 4'b1111;
				Green <= 4'b0000;
				Blue <= 4'b0000;
			end else if (points) begin	//Shows the score
				Red <= 4'b1111;
				Green <= 4'b1111;
				Blue <= 4'b1111;
			end else begin
				Red <= 4'b0000;
				Green <= 4'b0000;
				Blue <= 4'b0000;
			end 
		end else if (win) begin 
			if (win_letters == 5'b00001) begin		//Shows the W
				Red <= 4'b1111;
				Green <= 4'b1111;
				Blue <= 4'b1111;
			end else if (win_letters == 5'b00010) begin 
				Red <= 4'b1111;
				Green <= 4'b1111;
				Blue <= 4'b1111;
			end else if (win_letters == 5'b00100) begin //Shows the I
				Red <= 4'b1111;
				Green <= 4'b1111;
				Blue <= 4'b1111;				
			end else if (win_letters == 5'b01000) begin //Shows the N
				Red <= 4'b1111;
				Green <= 4'b1111;
				Blue <= 4'b1111;				
			end else if (win_letters == 5'b10000) begin //Shows the !
				Red <= 4'b1111;
				Green <= 4'b1111;
				Blue <= 4'b1111;	
			end else 				//Background
				Red <= 4'b0011;
				Green <= 4'b0111;
				Blue <= 4'b1011;	
		end	
	end else begin
	      Red <= 4'b0000;
	      Green <= 4'b0000;
	      Blue <= 4'b0000;
	end
end
	
endmodule 
