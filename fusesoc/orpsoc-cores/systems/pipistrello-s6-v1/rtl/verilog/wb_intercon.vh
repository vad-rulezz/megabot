wire [31:0] wb_m2s_or1k_i_adr;
wire [31:0] wb_m2s_or1k_i_dat;
wire  [3:0] wb_m2s_or1k_i_sel;
wire        wb_m2s_or1k_i_we;
wire        wb_m2s_or1k_i_cyc;
wire        wb_m2s_or1k_i_stb;
wire  [2:0] wb_m2s_or1k_i_cti;
wire  [1:0] wb_m2s_or1k_i_bte;
wire [31:0] wb_s2m_or1k_i_dat;
wire        wb_s2m_or1k_i_ack;
wire        wb_s2m_or1k_i_err;
wire        wb_s2m_or1k_i_rty;
wire [31:0] wb_m2s_or1k_d_adr;
wire [31:0] wb_m2s_or1k_d_dat;
wire  [3:0] wb_m2s_or1k_d_sel;
wire        wb_m2s_or1k_d_we;
wire        wb_m2s_or1k_d_cyc;
wire        wb_m2s_or1k_d_stb;
wire  [2:0] wb_m2s_or1k_d_cti;
wire  [1:0] wb_m2s_or1k_d_bte;
wire [31:0] wb_s2m_or1k_d_dat;
wire        wb_s2m_or1k_d_ack;
wire        wb_s2m_or1k_d_err;
wire        wb_s2m_or1k_d_rty;
wire [31:0] wb_m2s_dbg_adr;
wire [31:0] wb_m2s_dbg_dat;
wire  [3:0] wb_m2s_dbg_sel;
wire        wb_m2s_dbg_we;
wire        wb_m2s_dbg_cyc;
wire        wb_m2s_dbg_stb;
wire  [2:0] wb_m2s_dbg_cti;
wire  [1:0] wb_m2s_dbg_bte;
wire [31:0] wb_s2m_dbg_dat;
wire        wb_s2m_dbg_ack;
wire        wb_s2m_dbg_err;
wire        wb_s2m_dbg_rty;
wire [31:0] wb_m2s_sdc_master_adr;
wire [31:0] wb_m2s_sdc_master_dat;
wire  [3:0] wb_m2s_sdc_master_sel;
wire        wb_m2s_sdc_master_we;
wire        wb_m2s_sdc_master_cyc;
wire        wb_m2s_sdc_master_stb;
wire  [2:0] wb_m2s_sdc_master_cti;
wire  [1:0] wb_m2s_sdc_master_bte;
wire [31:0] wb_s2m_sdc_master_dat;
wire        wb_s2m_sdc_master_ack;
wire        wb_s2m_sdc_master_err;
wire        wb_s2m_sdc_master_rty;
wire [31:0] wb_m2s_mem32_sdc_adr;
wire [31:0] wb_m2s_mem32_sdc_dat;
wire  [3:0] wb_m2s_mem32_sdc_sel;
wire        wb_m2s_mem32_sdc_we;
wire        wb_m2s_mem32_sdc_cyc;
wire        wb_m2s_mem32_sdc_stb;
wire  [2:0] wb_m2s_mem32_sdc_cti;
wire  [1:0] wb_m2s_mem32_sdc_bte;
wire [31:0] wb_s2m_mem32_sdc_dat;
wire        wb_s2m_mem32_sdc_ack;
wire        wb_s2m_mem32_sdc_err;
wire        wb_s2m_mem32_sdc_rty;
wire [31:0] wb_m2s_rom0_adr;
wire [31:0] wb_m2s_rom0_dat;
wire  [3:0] wb_m2s_rom0_sel;
wire        wb_m2s_rom0_we;
wire        wb_m2s_rom0_cyc;
wire        wb_m2s_rom0_stb;
wire  [2:0] wb_m2s_rom0_cti;
wire  [1:0] wb_m2s_rom0_bte;
wire [31:0] wb_s2m_rom0_dat;
wire        wb_s2m_rom0_ack;
wire        wb_s2m_rom0_err;
wire        wb_s2m_rom0_rty;
wire [31:0] wb_m2s_mem32_dbus_adr;
wire [31:0] wb_m2s_mem32_dbus_dat;
wire  [3:0] wb_m2s_mem32_dbus_sel;
wire        wb_m2s_mem32_dbus_we;
wire        wb_m2s_mem32_dbus_cyc;
wire        wb_m2s_mem32_dbus_stb;
wire  [2:0] wb_m2s_mem32_dbus_cti;
wire  [1:0] wb_m2s_mem32_dbus_bte;
wire [31:0] wb_s2m_mem32_dbus_dat;
wire        wb_s2m_mem32_dbus_ack;
wire        wb_s2m_mem32_dbus_err;
wire        wb_s2m_mem32_dbus_rty;
wire [31:0] wb_m2s_mem32_ibus_adr;
wire [31:0] wb_m2s_mem32_ibus_dat;
wire  [3:0] wb_m2s_mem32_ibus_sel;
wire        wb_m2s_mem32_ibus_we;
wire        wb_m2s_mem32_ibus_cyc;
wire        wb_m2s_mem32_ibus_stb;
wire  [2:0] wb_m2s_mem32_ibus_cti;
wire  [1:0] wb_m2s_mem32_ibus_bte;
wire [31:0] wb_s2m_mem32_ibus_dat;
wire        wb_s2m_mem32_ibus_ack;
wire        wb_s2m_mem32_ibus_err;
wire        wb_s2m_mem32_ibus_rty;
wire [31:0] wb_m2s_uart0_adr;
wire [31:0] wb_m2s_uart0_dat;
wire  [3:0] wb_m2s_uart0_sel;
wire        wb_m2s_uart0_we;
wire        wb_m2s_uart0_cyc;
wire        wb_m2s_uart0_stb;
wire  [2:0] wb_m2s_uart0_cti;
wire  [1:0] wb_m2s_uart0_bte;
wire [31:0] wb_s2m_uart0_dat;
wire        wb_s2m_uart0_ack;
wire        wb_s2m_uart0_err;
wire        wb_s2m_uart0_rty;
wire [31:0] wb_m2s_sdc_adr;
wire [31:0] wb_m2s_sdc_dat;
wire  [3:0] wb_m2s_sdc_sel;
wire        wb_m2s_sdc_we;
wire        wb_m2s_sdc_cyc;
wire        wb_m2s_sdc_stb;
wire  [2:0] wb_m2s_sdc_cti;
wire  [1:0] wb_m2s_sdc_bte;
wire [31:0] wb_s2m_sdc_dat;
wire        wb_s2m_sdc_ack;
wire        wb_s2m_sdc_err;
wire        wb_s2m_sdc_rty;

wb_intercon wb_intercon0
   (.wb_clk_i            (wb_clk),
    .wb_rst_i            (wb_rst),
    .wb_or1k_i_adr_i     (wb_m2s_or1k_i_adr),
    .wb_or1k_i_dat_i     (wb_m2s_or1k_i_dat),
    .wb_or1k_i_sel_i     (wb_m2s_or1k_i_sel),
    .wb_or1k_i_we_i      (wb_m2s_or1k_i_we),
    .wb_or1k_i_cyc_i     (wb_m2s_or1k_i_cyc),
    .wb_or1k_i_stb_i     (wb_m2s_or1k_i_stb),
    .wb_or1k_i_cti_i     (wb_m2s_or1k_i_cti),
    .wb_or1k_i_bte_i     (wb_m2s_or1k_i_bte),
    .wb_or1k_i_dat_o     (wb_s2m_or1k_i_dat),
    .wb_or1k_i_ack_o     (wb_s2m_or1k_i_ack),
    .wb_or1k_i_err_o     (wb_s2m_or1k_i_err),
    .wb_or1k_i_rty_o     (wb_s2m_or1k_i_rty),
    .wb_or1k_d_adr_i     (wb_m2s_or1k_d_adr),
    .wb_or1k_d_dat_i     (wb_m2s_or1k_d_dat),
    .wb_or1k_d_sel_i     (wb_m2s_or1k_d_sel),
    .wb_or1k_d_we_i      (wb_m2s_or1k_d_we),
    .wb_or1k_d_cyc_i     (wb_m2s_or1k_d_cyc),
    .wb_or1k_d_stb_i     (wb_m2s_or1k_d_stb),
    .wb_or1k_d_cti_i     (wb_m2s_or1k_d_cti),
    .wb_or1k_d_bte_i     (wb_m2s_or1k_d_bte),
    .wb_or1k_d_dat_o     (wb_s2m_or1k_d_dat),
    .wb_or1k_d_ack_o     (wb_s2m_or1k_d_ack),
    .wb_or1k_d_err_o     (wb_s2m_or1k_d_err),
    .wb_or1k_d_rty_o     (wb_s2m_or1k_d_rty),
    .wb_dbg_adr_i        (wb_m2s_dbg_adr),
    .wb_dbg_dat_i        (wb_m2s_dbg_dat),
    .wb_dbg_sel_i        (wb_m2s_dbg_sel),
    .wb_dbg_we_i         (wb_m2s_dbg_we),
    .wb_dbg_cyc_i        (wb_m2s_dbg_cyc),
    .wb_dbg_stb_i        (wb_m2s_dbg_stb),
    .wb_dbg_cti_i        (wb_m2s_dbg_cti),
    .wb_dbg_bte_i        (wb_m2s_dbg_bte),
    .wb_dbg_dat_o        (wb_s2m_dbg_dat),
    .wb_dbg_ack_o        (wb_s2m_dbg_ack),
    .wb_dbg_err_o        (wb_s2m_dbg_err),
    .wb_dbg_rty_o        (wb_s2m_dbg_rty),
    .wb_sdc_master_adr_i (wb_m2s_sdc_master_adr),
    .wb_sdc_master_dat_i (wb_m2s_sdc_master_dat),
    .wb_sdc_master_sel_i (wb_m2s_sdc_master_sel),
    .wb_sdc_master_we_i  (wb_m2s_sdc_master_we),
    .wb_sdc_master_cyc_i (wb_m2s_sdc_master_cyc),
    .wb_sdc_master_stb_i (wb_m2s_sdc_master_stb),
    .wb_sdc_master_cti_i (wb_m2s_sdc_master_cti),
    .wb_sdc_master_bte_i (wb_m2s_sdc_master_bte),
    .wb_sdc_master_dat_o (wb_s2m_sdc_master_dat),
    .wb_sdc_master_ack_o (wb_s2m_sdc_master_ack),
    .wb_sdc_master_err_o (wb_s2m_sdc_master_err),
    .wb_sdc_master_rty_o (wb_s2m_sdc_master_rty),
    .wb_mem32_sdc_adr_o  (wb_m2s_mem32_sdc_adr),
    .wb_mem32_sdc_dat_o  (wb_m2s_mem32_sdc_dat),
    .wb_mem32_sdc_sel_o  (wb_m2s_mem32_sdc_sel),
    .wb_mem32_sdc_we_o   (wb_m2s_mem32_sdc_we),
    .wb_mem32_sdc_cyc_o  (wb_m2s_mem32_sdc_cyc),
    .wb_mem32_sdc_stb_o  (wb_m2s_mem32_sdc_stb),
    .wb_mem32_sdc_cti_o  (wb_m2s_mem32_sdc_cti),
    .wb_mem32_sdc_bte_o  (wb_m2s_mem32_sdc_bte),
    .wb_mem32_sdc_dat_i  (wb_s2m_mem32_sdc_dat),
    .wb_mem32_sdc_ack_i  (wb_s2m_mem32_sdc_ack),
    .wb_mem32_sdc_err_i  (wb_s2m_mem32_sdc_err),
    .wb_mem32_sdc_rty_i  (wb_s2m_mem32_sdc_rty),
    .wb_rom0_adr_o       (wb_m2s_rom0_adr),
    .wb_rom0_dat_o       (wb_m2s_rom0_dat),
    .wb_rom0_sel_o       (wb_m2s_rom0_sel),
    .wb_rom0_we_o        (wb_m2s_rom0_we),
    .wb_rom0_cyc_o       (wb_m2s_rom0_cyc),
    .wb_rom0_stb_o       (wb_m2s_rom0_stb),
    .wb_rom0_cti_o       (wb_m2s_rom0_cti),
    .wb_rom0_bte_o       (wb_m2s_rom0_bte),
    .wb_rom0_dat_i       (wb_s2m_rom0_dat),
    .wb_rom0_ack_i       (wb_s2m_rom0_ack),
    .wb_rom0_err_i       (wb_s2m_rom0_err),
    .wb_rom0_rty_i       (wb_s2m_rom0_rty),
    .wb_mem32_dbus_adr_o (wb_m2s_mem32_dbus_adr),
    .wb_mem32_dbus_dat_o (wb_m2s_mem32_dbus_dat),
    .wb_mem32_dbus_sel_o (wb_m2s_mem32_dbus_sel),
    .wb_mem32_dbus_we_o  (wb_m2s_mem32_dbus_we),
    .wb_mem32_dbus_cyc_o (wb_m2s_mem32_dbus_cyc),
    .wb_mem32_dbus_stb_o (wb_m2s_mem32_dbus_stb),
    .wb_mem32_dbus_cti_o (wb_m2s_mem32_dbus_cti),
    .wb_mem32_dbus_bte_o (wb_m2s_mem32_dbus_bte),
    .wb_mem32_dbus_dat_i (wb_s2m_mem32_dbus_dat),
    .wb_mem32_dbus_ack_i (wb_s2m_mem32_dbus_ack),
    .wb_mem32_dbus_err_i (wb_s2m_mem32_dbus_err),
    .wb_mem32_dbus_rty_i (wb_s2m_mem32_dbus_rty),
    .wb_mem32_ibus_adr_o (wb_m2s_mem32_ibus_adr),
    .wb_mem32_ibus_dat_o (wb_m2s_mem32_ibus_dat),
    .wb_mem32_ibus_sel_o (wb_m2s_mem32_ibus_sel),
    .wb_mem32_ibus_we_o  (wb_m2s_mem32_ibus_we),
    .wb_mem32_ibus_cyc_o (wb_m2s_mem32_ibus_cyc),
    .wb_mem32_ibus_stb_o (wb_m2s_mem32_ibus_stb),
    .wb_mem32_ibus_cti_o (wb_m2s_mem32_ibus_cti),
    .wb_mem32_ibus_bte_o (wb_m2s_mem32_ibus_bte),
    .wb_mem32_ibus_dat_i (wb_s2m_mem32_ibus_dat),
    .wb_mem32_ibus_ack_i (wb_s2m_mem32_ibus_ack),
    .wb_mem32_ibus_err_i (wb_s2m_mem32_ibus_err),
    .wb_mem32_ibus_rty_i (wb_s2m_mem32_ibus_rty),
    .wb_uart0_adr_o      (wb_m2s_uart0_adr),
    .wb_uart0_dat_o      (wb_m2s_uart0_dat),
    .wb_uart0_sel_o      (wb_m2s_uart0_sel),
    .wb_uart0_we_o       (wb_m2s_uart0_we),
    .wb_uart0_cyc_o      (wb_m2s_uart0_cyc),
    .wb_uart0_stb_o      (wb_m2s_uart0_stb),
    .wb_uart0_cti_o      (wb_m2s_uart0_cti),
    .wb_uart0_bte_o      (wb_m2s_uart0_bte),
    .wb_uart0_dat_i      (wb_s2m_uart0_dat),
    .wb_uart0_ack_i      (wb_s2m_uart0_ack),
    .wb_uart0_err_i      (wb_s2m_uart0_err),
    .wb_uart0_rty_i      (wb_s2m_uart0_rty),
    .wb_sdc_adr_o        (wb_m2s_sdc_adr),
    .wb_sdc_dat_o        (wb_m2s_sdc_dat),
    .wb_sdc_sel_o        (wb_m2s_sdc_sel),
    .wb_sdc_we_o         (wb_m2s_sdc_we),
    .wb_sdc_cyc_o        (wb_m2s_sdc_cyc),
    .wb_sdc_stb_o        (wb_m2s_sdc_stb),
    .wb_sdc_cti_o        (wb_m2s_sdc_cti),
    .wb_sdc_bte_o        (wb_m2s_sdc_bte),
    .wb_sdc_dat_i        (wb_s2m_sdc_dat),
    .wb_sdc_ack_i        (wb_s2m_sdc_ack),
    .wb_sdc_err_i        (wb_s2m_sdc_err),
    .wb_sdc_rty_i        (wb_s2m_sdc_rty));

