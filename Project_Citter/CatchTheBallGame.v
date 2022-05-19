`define	10Hz_period		30'd2500000
`define	16Hz_period		30'd1562500
`define	25Hz_period		30'd1200000
`define	31_25Hz_period 30'd900000
`define	25MHz_period	30'd1

module CatchTheBallGame (	input CLK_50M,
									input BTN_EAST,	// To move the bar on the right
									input BTN_SOUTH,	// To start a new game
									input BTN_WEST,	// To move the bar in the left
								
									output VGA_HSYNC,
									output VGA_VSYNC,
									output [3:0] VGA_R,
									output [3:0] VGA_G,
									output [3:0] VGA_B,
									output [7:0] LED);
									
// VGA
wire 			w_clock_VGA;	 
wire			w_Vdisplay;
wire			w_Hdisplay;
wire [9:0]	wb_HCoord; // 640 -> needs 10 bits
wire [9:0]	wb_VCoord; // 480 -> needs 9 bits

// Bar
wire 			w_clockBar_31_25Hz;
wire			w_right;
wire			w_left;
wire [9:0]	wb_barMovement;
parameter 	bar_lenght = 11'd50; 

// Balls
wire 			w_clockBall_10Hz;
wire 			w_clockBall_16Hz;
wire 			w_clockBall_25Hz;
wire [9:0]  wb_Xball;
wire [9:0]  wb_Yball;
parameter 	radius = 11'd5; 

// Score
wire 			w_caught;
wire			w_points_display;
wire 			w_win;
wire 			w_reset;
wire [4:0]  wb_win_letters;
wire [7:0]  wb_score;
parameter 	max_score = 8'd7;

// VGA sync
Module_FrequencyDivider Generator_VGA	(	.clk_in(CLK_50M), 
														.period(`25MHz_period), 
																							
														.clk_out(w_clock_VGA));
			
Module_HorizontalSync 	HSync	(	.clk(w_clock_VGA),
				
											.H_Sync(VGA_HSYNC),
											.H_Coord(wb_HCoord),
											.H_Display(w_Hdisplay));
																				
Module_VerticalSync	  	VSync	(	.clk(w_clock_VGA),
						
											.V_Sync(VGA_VSYNC),		
											.V_Coord(wb_VCoord),
											.V_Display(w_Vdisplay));	
						
												
// Bar position, via a Finite State Machine															
Module_FrequencyDivider Generator_clockBar31_25	(	.clk_in(CLK_50M), 
																	.period(`31_25Hz_period), 
																									
																	.clk_out(w_clockBar_31_25Hz));	

Module_FSM_Bar	Bar_movements	(	.clk_in(w_clockBar_31_25Hz),	
											.reset(w_reset), 
											.new_game(BTN_SOUTH),
											.direction({BTN_WEST,BTN_EAST}),
											.dimension(11'd10),
														
											.movement(wb_barMovement));	
															
wire w_bar = ((!w_win)? ((wb_HCoord >= (wb_barMovement)) && (wb_HCoord <= (wb_barMovement + bar_lenght)) && (wb_VCoord >= 10'd455) && (wb_VCoord <10'd465)) : 0);

// Random balls, via a Shift Register
Module_FrequencyDivider Generator_clockBall10	(	.clk_in(CLK_50M), 
																	.period(`10Hz_period), 
																									
																	.clk_out(w_clockBall_10Hz));

Module_FrequencyDivider Generator_clockBall16	(	.clk_in(CLK_50M), 
																	.period(`16Hz_period), 
																									
																	.clk_out(w_clockBall_16Hz));

Module_FrequencyDivider Generator_clockBall25	(	.clk_in(CLK_50M), 
																	.period(`25Hz_period), 
																										
																	.clk_out(w_clockBall_25Hz));	
																	
Module_RNDnumberGenerator Ball_generation	(	.clk_in((wb_score<=8'd5)? w_clockBall_10Hz : ((wb_score<=8'd10)? w_clockBall_16Hz : w_clockBall_25Hz)),
															.reset(w_reset),
															.new_game(BTN_SOUTH),
															.caught(w_caught),
															.radius(radius),
				
															.X_rnd(wb_Xball),
															.Y_rnd(wb_Yball));

wire w_ball = ((!w_win)? (((wb_HCoord-wb_Xball)*(wb_HCoord-wb_Xball)) <= (radius*radius-((wb_VCoord-wb_Yball)*(wb_VCoord-wb_Yball)))) : 0);			  

// Score counter																	
Module_Score	Score		(	.clk((wb_score<=8'd5)? w_clockBall_10Hz : ((wb_score<=8'd10)? w_clockBall_16Hz : w_clockBall_25Hz)),
									.new_game(BTN_SOUTH),
									.max_score(max_score),
									.Xball(wb_Xball),
									.Yball(wb_Yball),
									.radius(radius),
									.barMovement(wb_barMovement),
									.bar_lenght(bar_lenght),
									
									.reset(w_reset),
									.caught(w_caught),
									.win(w_win),
									.score(wb_score));																

buf(LED, wb_score);

//to show the numbers on the screen
Module_Score_Numbers Score_Numbers	(	.clk(w_clock_VGA),
													.score(wb_score),
													.H_Coord(wb_HCoord),
													.V_Coord(wb_VCoord),

													.points_display(w_points_display));

//to show "WIN!" when the player wins										
Module_Win   Win_letters	 (	.H_Coord(wb_HCoord),
										.V_Coord(wb_VCoord),
										
										.win_letters(wb_win_letters));

// Feed the monitor					
Module_Display		DisplayOnMonitor	(	.clk(w_clock_VGA),
													.Hdisplay(w_Hdisplay),
													.Vdisplay(w_Vdisplay),
													.ball(w_ball),
													.bar(w_bar),
													.win(w_win),
													.points(w_points_display),
													.win_letters(wb_win_letters),
												
													.Green(VGA_G),
													.Blue(VGA_B),
													.Red(VGA_R));
	 
endmodule
