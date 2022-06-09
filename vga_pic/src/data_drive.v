module data_drive (input			wire						vga_clk,
                   input			wire						rst_n,
                   input			wire		[ 11:0 ]		addr_h,
                   input			wire		[ 11:0 ]		addr_v,
                  
                   output			reg		[ 23:0 ]				rgb_data);



parameter	height = 343; // 图片高度
parameter	width  = 400; // 图片宽度

reg			[ 17:0 ]		rom_address				; // ROM地址
wire			[ 23:0 ]		rom_data				; // 图片数据


wire							flag_clear_rom_address		; // 地址清零
wire							flag_begin_h			    ; // 图片显示行
wire							flag_begin_v			    ; // 图片显示列

wire							flag_enable_out			;

//状态输出
always @( * ) begin
    
    if (flag_enable_out) begin
         rgb_data = rom_data;
    end
    else  begin
        rgb_data= 0;
    end    
               
            
        
end


assign flag_begin_h     = addr_h > ( ( 640 - width ) / 2 ) && addr_h < ( ( 640 - width ) / 2 ) + width + 1;
assign flag_begin_v     = addr_v > ( ( 480 - height )/2 ) && addr_v <( ( 480 - height )/2 ) + height + 1;
assign flag_enable_out =  flag_begin_h && flag_begin_v;

//ROM地址计数器
always @( posedge vga_clk or negedge rst_n ) begin
    if ( !rst_n ) begin
        rom_address <= 0;
    end
    else if ( flag_clear_rom_address ) begin //计数满清零
        rom_address <= 0;
    end
        else if ( flag_enable_out ) begin  //在有效区域内+1
        rom_address <= rom_address + 1;
        end
    else begin  //无效区域保持
        rom_address <= rom_address;
    end
end
assign flag_clear_rom_address = rom_address == height * width - 1;



//实例化ROM
rom_2	rom_one_inst (
.address ( rom_address ),
.clock ( vga_clk ),
.q ( rom_data )
);
endmodule // data_drive

