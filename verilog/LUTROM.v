module LUTROMAccelerator( // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109861.2]
  input         clock, // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109862.4]
  input         reset, // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109863.4]
  output        io_cmd_ready, // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109865.4]
  input         io_cmd_valid, // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109865.4]
  input  [6:0]  io_cmd_bits_inst_funct, // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109865.4]
  input  [4:0]  io_cmd_bits_inst_rd, // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109865.4]
  input  [63:0] io_cmd_bits_rs1, // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109865.4]
  input  [63:0] io_cmd_bits_rs2, // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109865.4]
  input         io_resp_ready, // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109865.4]
  output        io_resp_valid, // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109865.4]
  output [4:0]  io_resp_bits_rd, // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109865.4]
  output [63:0] io_resp_bits_data, // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109865.4]
  output        io_busy // @[:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109865.4]
);
  reg [4:0] funct; // @[LUTROMAccelerator.scala 16:22:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109871.4]
  reg [31:0] _RAND_0;
  reg [31:0] v_mem; // @[LUTROMAccelerator.scala 17:18:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109872.4]
  reg [31:0] _RAND_1;
  reg [31:0] curve_select; // @[LUTROMAccelerator.scala 18:25:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109873.4]
  reg [31:0] _RAND_2;
  reg [4:0] req_rd; // @[LUTROMAccelerator.scala 19:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109874.4]
  reg [31:0] _RAND_3;
  reg [63:0] call_count; // @[LUTROMAccelerator.scala 20:23:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109875.4]
  reg [63:0] _RAND_4;
  wire  LUT_clock; // @[LUTROMAccelerator.scala 29:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109880.4]
  wire  LUT_reset; // @[LUTROMAccelerator.scala 29:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109880.4]
  wire  LUT_io_req_ready; // @[LUTROMAccelerator.scala 29:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109880.4]
  wire  LUT_io_req_valid; // @[LUTROMAccelerator.scala 29:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109880.4]
  wire [4:0] LUT_io_req_bits_curve_select; // @[LUTROMAccelerator.scala 29:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109880.4]
  wire [31:0] LUT_io_req_bits_v_mem; // @[LUTROMAccelerator.scala 29:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109880.4]
  wire  LUT_io_resp_ready; // @[LUTROMAccelerator.scala 29:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109880.4]
  wire  LUT_io_resp_valid; // @[LUTROMAccelerator.scala 29:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109880.4]
  wire [31:0] LUT_io_resp_bits_slope; // @[LUTROMAccelerator.scala 29:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109880.4]
  wire [31:0] LUT_io_resp_bits_offset; // @[LUTROMAccelerator.scala 29:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109880.4]
  wire [31:0] LUT_io_resp_bits_scaled_vmem; // @[LUTROMAccelerator.scala 29:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109880.4]
  reg [31:0] output$; // @[LUTROMAccelerator.scala 34:23:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109886.4]
  reg [31:0] _RAND_5;
  reg [2:0] state; // @[LUTROMAccelerator.scala 38:22:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109887.4]
  reg [31:0] _RAND_6;
  wire  do_LUT_offset; // @[LUTROMAccelerator.scala 22:30:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109876.4]
  wire  do_LUT_slope; // @[LUTROMAccelerator.scala 23:29:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109877.4]
  wire  _T_183; // @[Decoupled.scala 37:37:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109888.4]
  wire  _T_185; // @[LUTROMAccelerator.scala 49:36:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109894.6]
  wire  _T_188; // @[LUTROMAccelerator.scala 52:43:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109900.8]
  wire [64:0] _T_190; // @[LUTROMAccelerator.scala 55:34:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109905.10]
  wire [63:0] _T_191; // @[LUTROMAccelerator.scala 55:34:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109906.10]
  wire [63:0] _GEN_4; // @[LUTROMAccelerator.scala 43:23:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109889.4]
  wire [63:0] _GEN_5; // @[LUTROMAccelerator.scala 43:23:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109889.4]
  wire [6:0] _GEN_6; // @[LUTROMAccelerator.scala 43:23:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109889.4]
  wire  _T_192; // @[Decoupled.scala 37:37:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109911.4]
  wire  _T_193; // @[Decoupled.scala 37:37:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109915.4]
  wire [31:0] _T_194; // @[LUTROMAccelerator.scala 65:62:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109917.6]
  wire [31:0] _T_195; // @[LUTROMAccelerator.scala 65:18:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109918.6]
  wire [31:0] _GEN_11; // @[LUTROMAccelerator.scala 63:29:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109916.4]
  wire  _T_196; // @[LUTROMAccelerator.scala 69:15:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109922.4]
  wire [63:0] _GEN_13; // @[LUTROMAccelerator.scala 69:33:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109923.4]
  wire  _T_197; // @[Decoupled.scala 37:37:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109927.4]
  wire  _T_200; // @[LUTROMAccelerator.scala 76:9:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109932.4]
  LUTROMScaledReduced LUT ( // @[LUTROMAccelerator.scala 29:19:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109880.4]
    .clock(LUT_clock),
    .reset(LUT_reset),
    .io_req_ready(LUT_io_req_ready),
    .io_req_valid(LUT_io_req_valid),
    .io_req_bits_curve_select(LUT_io_req_bits_curve_select),
    .io_req_bits_v_mem(LUT_io_req_bits_v_mem),
    .io_resp_ready(LUT_io_resp_ready),
    .io_resp_valid(LUT_io_resp_valid),
    .io_resp_bits_slope(LUT_io_resp_bits_slope),
    .io_resp_bits_offset(LUT_io_resp_bits_offset),
    .io_resp_bits_scaled_vmem(LUT_io_resp_bits_scaled_vmem)
  );
  assign do_LUT_offset = funct == 5'h0; // @[LUTROMAccelerator.scala 22:30:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109876.4]
  assign do_LUT_slope = funct == 5'h1; // @[LUTROMAccelerator.scala 23:29:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109877.4]
  assign _T_183 = io_cmd_ready & io_cmd_valid; // @[Decoupled.scala 37:37:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109888.4]
  assign _T_185 = io_cmd_bits_inst_funct == 7'h2; // @[LUTROMAccelerator.scala 49:36:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109894.6]
  assign _T_188 = io_cmd_bits_inst_funct == 7'h3; // @[LUTROMAccelerator.scala 52:43:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109900.8]
  assign _T_190 = call_count + 64'h1; // @[LUTROMAccelerator.scala 55:34:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109905.10]
  assign _T_191 = _T_190[63:0]; // @[LUTROMAccelerator.scala 55:34:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109906.10]
  assign _GEN_4 = _T_183 ? io_cmd_bits_rs1 : {{32'd0}, v_mem}; // @[LUTROMAccelerator.scala 43:23:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109889.4]
  assign _GEN_5 = _T_183 ? io_cmd_bits_rs2 : {{32'd0}, curve_select}; // @[LUTROMAccelerator.scala 43:23:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109889.4]
  assign _GEN_6 = _T_183 ? io_cmd_bits_inst_funct : {{2'd0}, funct}; // @[LUTROMAccelerator.scala 43:23:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109889.4]
  assign _T_192 = LUT_io_req_ready & LUT_io_req_valid; // @[Decoupled.scala 37:37:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109911.4]
  assign _T_193 = LUT_io_resp_ready & LUT_io_resp_valid; // @[Decoupled.scala 37:37:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109915.4]
  assign _T_194 = do_LUT_slope ? LUT_io_resp_bits_slope : LUT_io_resp_bits_scaled_vmem; // @[LUTROMAccelerator.scala 65:62:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109917.6]
  assign _T_195 = do_LUT_offset ? LUT_io_resp_bits_offset : _T_194; // @[LUTROMAccelerator.scala 65:18:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109918.6]
  assign _GEN_11 = _T_193 ? _T_195 : output$; // @[LUTROMAccelerator.scala 63:29:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109916.4]
  assign _T_196 = state == 3'h3; // @[LUTROMAccelerator.scala 69:15:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109922.4]
  assign _GEN_13 = _T_196 ? call_count : {{32'd0}, _GEN_11}; // @[LUTROMAccelerator.scala 69:33:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109923.4]
  assign _T_197 = io_resp_ready & io_resp_valid; // @[Decoupled.scala 37:37:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109927.4]
  assign _T_200 = reset == 1'h0; // @[LUTROMAccelerator.scala 76:9:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109932.4]
  assign io_cmd_ready = state == 3'h0;
  assign io_resp_valid = state == 3'h4;
  assign io_resp_bits_rd = req_rd;
  assign io_resp_bits_data = {{32'd0}, output$};
  assign io_busy = state != 3'h0;
  assign LUT_clock = clock;
  assign LUT_reset = reset;
  assign LUT_io_req_valid = state == 3'h1;
  assign LUT_io_req_bits_curve_select = curve_select[4:0];
  assign LUT_io_req_bits_v_mem = v_mem;
  assign LUT_io_resp_ready = state == 3'h2;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  funct = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  v_mem = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  curve_select = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  req_rd = _RAND_3[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{$random}};
  call_count = _RAND_4[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  output$ = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  state = _RAND_6[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      funct <= 5'h0;
    end else begin
      funct <= _GEN_6[4:0];
    end
    v_mem <= _GEN_4[31:0];
    curve_select <= _GEN_5[31:0];
    if (_T_183) begin
      req_rd <= io_cmd_bits_inst_rd;
    end
    if (_T_183) begin
      if (_T_185) begin
        call_count <= 64'h0;
      end else begin
        if (!(_T_188)) begin
          call_count <= _T_191;
        end
      end
    end
    if (reset) begin
      output$ <= 32'h0;
    end else begin
      output$ <= _GEN_13[31:0];
    end
    if (reset) begin
      state <= 3'h0;
    end else begin
      if (_T_197) begin
        state <= 3'h0;
      end else begin
        if (_T_196) begin
          state <= 3'h4;
        end else begin
          if (_T_193) begin
            state <= 3'h4;
          end else begin
            if (_T_192) begin
              state <= 3'h2;
            end else begin
              if (_T_183) begin
                if (_T_185) begin
                  state <= 3'h3;
                end else begin
                  if (_T_188) begin
                    state <= 3'h3;
                  end else begin
                    state <= 3'h1;
                  end
                end
              end
            end
          end
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_200) begin
          $fwrite(32'h80000002,"cmd: ready %d   valid %d -- resp:  ready %d  valid %d -- v:%h c:%h output:%h\n",io_cmd_ready,io_cmd_valid,io_resp_ready,io_resp_valid,io_cmd_bits_rs1,io_cmd_bits_rs2,io_resp_bits_data); // @[LUTROMAccelerator.scala 76:9:Top.ZynqFPGALUTROMAcceleratorConfig.fir@109934.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
