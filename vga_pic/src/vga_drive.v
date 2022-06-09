module vga_drive (input			wire						clk,            //系统时钟
                  input			wire						rst_n,          //复位
                  input			wire		[ 23:0 ]		rgb_data,       //24位RGB对应值
                  output			wire							vga_clk,    //vga时钟 25M
                  output			reg							h_sync,     //行同步信号
                  output			reg							v_sync,     //场同步信号
                  output			reg		[ 11:0 ]				addr_h, //行地址
                  output			reg		[ 11:0 ]				addr_v,  //列地址
                  output			wire		[ 7:0 ]				rgb_r,  //红基色
                  output			wire		[ 7:0 ]				rgb_g,  //绿基色
                  output			wire		[ 7:0 ]				rgb_b  //蓝基色
);

// 640 * 480 60HZ
localparam	 H_FRONT = 16; 
localparam	 H_SYNC  = 96;
localparam	 H_BLACK = 48; 
localparam	 H_ACT   = 640; 
localparam	 V_FRONT = 11; 
localparam	 V_SYNC  = 2;
localparam	 V_BLACK = 31;
localparam	 V_ACT   = 480; 

// 800 * 600 72HZ
// localparam	 H_FRONT = 40; 
// localparam	 H_SYNC  = 120;
// localparam	 H_BLACK = 88; 
// localparam	 H_ACT   = 800; 
// localparam	 V_FRONT = 37;
// localparam	 V_SYNC  = 6;
// localparam	 V_BLACK = 23; 
// localparam	 V_ACT   = 600; 


localparam	H_TOTAL = H_FRONT + H_SYNC + H_BLACK + H_ACT; // 行周期
localparam	V_TOTAL = V_FRONT + V_SYNC + V_BLACK + V_ACT; // 列周期

reg			[ 11:0 ]			cnt_h			; // 行计数器
reg			[ 11:0 ]			cnt_v			; // 场计数器
reg			[ 23:0 ]			rgb			; // 对应显示颜色值

// 对应计数器开始、结束、计数信号
wire							flag_enable_cnt_h			;
wire							flag_clear_cnt_h			;
wire							flag_enable_cnt_v			;
wire							flag_clear_cnt_v			;
wire							flag_add_cnt_v  			;
wire							valid_area      			;


// 25M时钟 行周期*场周期*刷新率 = 800 * 525* 60
wire							clk_25			;
// 50M时钟 1040 * 666 * 72
wire							clk_50			;
//PLL
pll_one	pll_one_inst (
	.areset ( ~rst_n ),
	.inclk0 ( clk ),
	.c0 ( clk_50 ), //50M
	.c1 ( clk_25 ) //25M
	);
//根据不同分配率选择不同频率时钟
assign vga_clk = clk_25;


// 行计数
always @( posedge vga_clk or negedge rst_n ) begin
    if ( !rst_n ) begin
        cnt_h <= 0;
    end
    else if ( flag_enable_cnt_h ) begin
        if ( flag_clear_cnt_h ) begin
            cnt_h <= 0;
        end
        else begin
            cnt_h <= cnt_h + 1;
        end
    end
    else begin
        cnt_h <= 0;
    end
end
assign flag_enable_cnt_h = 1;
assign flag_clear_cnt_h  = cnt_h == H_TOTAL - 1;

// 行同步信号
always @( posedge vga_clk or negedge rst_n ) begin
    if ( !rst_n ) begin
        h_sync <= 0;
    end
    else if ( cnt_h == H_SYNC - 1 ) begin // 同步周期时为1
        h_sync <= 1;
    end
        else if ( flag_clear_cnt_h ) begin // 其余为0
        h_sync <= 0;
        end
    else begin
        h_sync <= h_sync;
    end
end

// 场计数
always @( posedge vga_clk or negedge rst_n ) begin
    if ( !rst_n ) begin
        cnt_v <= 0;
    end
    else if ( flag_enable_cnt_v ) begin
        if ( flag_clear_cnt_v ) begin
            cnt_v <= 0;
        end
        else if ( flag_add_cnt_v ) begin
            cnt_v <= cnt_v + 1;
        end
        else begin
            cnt_v <= cnt_v;
        end
    end
    else begin
        cnt_v <= 0;
    end
end
assign flag_enable_cnt_v = flag_enable_cnt_h;
assign flag_clear_cnt_v  = cnt_v == V_TOTAL - 1;
assign flag_add_cnt_v    = flag_clear_cnt_h;

// 场同步信号
always @( posedge vga_clk or negedge rst_n ) begin
    if ( !rst_n ) begin
        v_sync <= 0;
    end
    else if ( cnt_v == V_SYNC - 1 ) begin
        v_sync <= 1;
    end
        else if ( flag_clear_cnt_v ) begin
        v_sync <= 0;
        end
    else begin
        v_sync <= v_sync;
    end
end

// 对应有效区域行地址 1-640
always @( posedge vga_clk or negedge rst_n ) begin
    if ( !rst_n ) begin
        addr_h <= 0;
    end
    else if ( valid_area ) begin
        addr_h <= cnt_h - H_SYNC - H_BLACK + 1;
    end
    else begin
        addr_h <= 0;
    end
end
// 对应有效区域列地址 1-480
always @( posedge vga_clk or negedge rst_n ) begin
    if ( !rst_n ) begin
        addr_v <= 0;
    end
    else if ( valid_area ) begin
        addr_v <= cnt_v -V_SYNC - V_BLACK + 1;
    end
    else begin
        addr_v <= 0;
    end
end
// 有效显示区域
assign valid_area = cnt_h >= H_SYNC + H_BLACK && cnt_h <= H_SYNC + H_BLACK + H_ACT && cnt_v >= V_SYNC + V_BLACK && cnt_v <= V_SYNC + V_BLACK + V_ACT;


// 显示颜色
always @( posedge vga_clk or negedge rst_n ) begin
    if ( !rst_n ) begin
        rgb <= 24'h0;
    end
    else if ( valid_area ) begin
        rgb <= rgb_data;
    end
    else begin
        rgb <= 24'b0;
    end
end
assign rgb_r = rgb[ 23:16 ];
assign rgb_g = rgb[ 15:8 ];
assign rgb_b = rgb[ 7:0 ];

endmodule // vga_dirve

