module vga_top (input			wire						clk,
                input			wire						rst_n,
                output			wire						vga_clk,
                output			wire						h_sync,
                output			wire						v_sync,
                output			wire		[ 7:0 ]			rgb_r,
                output			wire		[ 7:0 ]			rgb_g,
                output			wire		[ 7:0 ]			rgb_b
);

reg			[ 27:0 ]			cnt			        ;
wire		[ 11:0 ]		    addr_h              ;
wire		[ 11:0 ]		    addr_v              ;
wire		[ 23:0 ]			rgb_data			;

//vga模块
vga_drive u_vga_drive(
.clk      ( clk ),
.rst_n    ( rst_n ),
.rgb_data ( rgb_data ),
.vga_clk  ( vga_clk ),
.h_sync   ( h_sync ),
.v_sync   ( v_sync ),
.rgb_r    ( rgb_r ),
.rgb_g    ( rgb_g ),
.rgb_b    ( rgb_b ),
.addr_h   ( addr_h ),
.addr_v   ( addr_v )
);

//数据模块
data_drive u_data_drive(
.vga_clk ( vga_clk ),
.rst_n   ( rst_n ),
.addr_h  ( addr_h ),
.addr_v  ( addr_v ),
.rgb_data  ( rgb_data )
);



endmodule // vga_top

