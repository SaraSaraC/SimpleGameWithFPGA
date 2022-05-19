module Module_Win(	input [9:0] H_Coord,
							input [9:0] V_Coord,
						
							output [4:0] win_letters);

// Common parameters
parameter V_start = 10'd200;
parameter height  = 10'd100;
parameter base    = 10'd20;

// W: two isosceles triangles with the basis up
parameter H_start_t1 = 10'd160;
parameter H_start_t2 = 10'd220;

wire [9:0] wb_v_end_t1   = V_start + height;
wire [9:0] wb_width_t1   = height - (V_Coord - V_start);
wire [9:0] wb_h_start_t1 = H_start_t1 - wb_width_t1;
wire [9:0] wb_h_end_t1   = H_start_t1 + wb_width_t1;
wire [9:0] wb_v_end_t2   = V_start +  height;
wire [9:0] wb_width_t2   = height - (V_Coord - V_start);
wire [9:0] wb_h_start_t2 = H_start_t2 - wb_width_t2;
wire [9:0] wb_h_end_t2   = H_start_t2 + wb_width_t2;

assign W1 = ((V_Coord >= V_start) && (V_Coord <= wb_v_end_t1) && (H_Coord >= wb_h_start_t1) && (H_Coord <= wb_h_end_t1));
assign W2 = ((V_Coord >= V_start) && (V_Coord <= wb_v_end_t2) && (H_Coord >= wb_h_start_t2) && (H_Coord <= wb_h_end_t2));

// I: a vertical bar
parameter H_start_r1 = 10'd350;

wire [9:0] wb_v_end_r1 = V_start + height;
wire [9:0] wb_h_end_r1 = H_start_r1 + base;

assign I = ((H_Coord >= H_start_r1) && (H_Coord <= wb_h_end_r1) && (V_Coord >= V_start) && (V_Coord <= wb_v_end_r1));

// N: a right triangle + a vertical bar
parameter H_start_t3 = 10'd400;
parameter H_start_r2 = 10'd480;

wire [9:0] wb_v_end_t3   = V_start + height;
wire [9:0] wb_width_t3   = V_Coord - V_start;
wire [9:0] wb_h_start_t3 = H_start_t3;
wire [9:0] wb_h_end_t3   = H_start_t3 + wb_width_t3;
wire [9:0] wb_v_end_r2   = V_start + height;
wire [9:0] wb_h_end_r2   = H_start_r2 + base;

assign N2 = ((H_Coord >= H_start_r2) && (H_Coord <= wb_h_end_r2) && (V_Coord >= V_start) && (V_Coord <= wb_v_end_r2));
assign N1 = ((V_Coord >= V_start) && (V_Coord <= wb_v_end_t3) && (H_Coord >= wb_h_start_t3) && (H_Coord <= wb_h_end_t3));

// !: a vertical bar + a square
parameter H_start_r3 = 10'd560;

wire [9:0] wb_v_end_r3  = V_start + height - (base + 10'd10);
wire [9:0] wb_h_end_r3  = H_start_r3 + base;
wire [9:0] wb_v_start_s = wb_v_end_r3 + 10'd10;
wire [9:0] wb_v_end_s   = wb_v_end_r3 + (base + 10'd10);

assign Excl_pnt = ((H_Coord >= H_start_r3) && (H_Coord <= wb_h_end_r3) && (V_Coord >= V_start) && (V_Coord <= wb_v_end_r3)) ||
						((H_Coord >= H_start_r3) && (H_Coord <= wb_h_end_r3) && (V_Coord >= wb_v_start_s) && (V_Coord <= wb_v_end_s));

buf(win_letters[4:0],{Excl_pnt,(N2 | N1),I,W2,W1});

endmodule 