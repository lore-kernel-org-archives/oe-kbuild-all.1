Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FFB11CBC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 22:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693607402; x=1725143402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7x5HmR4hCKXqP5DXm7wxeb60o4Vzlt9TLMN3OwWRsnM=;
  b=Ws7gG6kFtUVcA7QDua7lbjLC1xoXebSurou4girqBRMfr6KFeiC2u2xK
   Akx1Co/P/w+2fP9shl4KZjSh0FMfrtafFa1Bvw4zwBFudD52vZM66rgLF
   ILJDWfWKt+MJwAIFPt+hyoMDFhGmKgrVtomEOl/pNb4xA6scwBBjacYPl
   7wd3TEiFmIE8P31tFMl3dQE7uKa5bKFg2S92YfjgshvVSyccqKFHu1WNO
   lvHmPiu38gQSAIzOCs/vpIbC1h5vyjkfnuzLoqMDsyj2Y0VifGlvatMvO
   YyqxErxafw+vncG21RPNd/GHLvxLkA3mVMEIUb8A9GqTHm36lOg2UGqja
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440292583"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="440292583"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 15:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689906532"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="689906532"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Sep 2023 15:29:57 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcCeJ-0001hz-15;
	Fri, 01 Sep 2023 22:29:55 +0000
Date: Sat, 2 Sep 2023 06:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6160/24603]
 drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c:1362:1: warning: the
 frame size of 1632 bytes is larger than 1536 bytes
Message-ID: <202309020622.HFUisX1L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: f23cd0bfe50f8652d6b8932f3bf4ab8d792ae759 [6160/24603] Merge branch 'display/next' into next
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20230902/202309020622.HFUisX1L-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020622.HFUisX1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020622.HFUisX1L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c:88:5: warning: no previous prototype for 'inside_i' [-Wmissing-prototypes]
      88 | u16 inside_i(u16 value, u16 left_sharp_corner,
         |     ^~~~~~~~
   drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c:98:5: warning: no previous prototype for 'inside_f' [-Wmissing-prototypes]
      98 | u16 inside_f(u32 value, u32 left_sharp_corner, u32 right_sharp_corner)
         |     ^~~~~~~~
   drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c: In function 'pre_data_rate_change':
   drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c:198:13: warning: variable 'ret_val' set but not used [-Wunused-but-set-variable]
     198 |         int ret_val;
         |             ^~~~~~~
   drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c: In function 'pma_pll_config':
   drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c:545:21: warning: variable 'xcvr_power_state_ack' set but not used [-Wunused-but-set-variable]
     545 |         reg_field_t xcvr_power_state_ack;
         |                     ^~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c:1362:1: warning: the frame size of 1632 bytes is larger than 1536 bytes [-Wframe-larger-than=]
    1362 | }
         | ^


vim +1362 drivers/staging/media/imx/hdmirx/cdns-hdmirx-phy.c

4830fa96893226 Sandor Yu 2020-12-09   492  
4830fa96893226 Sandor Yu 2020-12-09   493  int pma_pll_config(struct cdns_hdmirx_device *hdmirx,
4830fa96893226 Sandor Yu 2020-12-09   494  		    u32 rx_clk_freq,
4830fa96893226 Sandor Yu 2020-12-09   495  		    u32 clk_ratio,
4830fa96893226 Sandor Yu 2020-12-09   496  		    u32 tmds_bit_clk_ratio,
4830fa96893226 Sandor Yu 2020-12-09   497  		    u8 data_rate_change)
4830fa96893226 Sandor Yu 2020-12-09   498  {
4830fa96893226 Sandor Yu 2020-12-09   499  	int i, loop;
4830fa96893226 Sandor Yu 2020-12-09   500  	u16 reg_val;
4830fa96893226 Sandor Yu 2020-12-09   501  	u64 vco_freq_khz;
6bc956a00c07e8 Sandor Yu 2020-12-17   502  	const ktime_t timeout = ktime_timeout_ms(1000);
4830fa96893226 Sandor Yu 2020-12-09   503  
4830fa96893226 Sandor Yu 2020-12-09   504  	reg_field_t cmnda_pll0_ip_div;
4830fa96893226 Sandor Yu 2020-12-09   505  	reg_field_t cmnda_pll0_hs_sym_div_sel;
4830fa96893226 Sandor Yu 2020-12-09   506  	reg_field_t cmn_pll0_fb_div_high_ovrd_en;
4830fa96893226 Sandor Yu 2020-12-09   507  	reg_field_t cmnda_pll0_fb_div_high_out;
4830fa96893226 Sandor Yu 2020-12-09   508  	reg_field_t cmn_pll0_fb_div_low_ovrd_en;
4830fa96893226 Sandor Yu 2020-12-09   509  	reg_field_t cmnda_pll0_fb_div_low_out;
4830fa96893226 Sandor Yu 2020-12-09   510  	reg_field_t cmn_pll_clk_osr;
4830fa96893226 Sandor Yu 2020-12-09   511  	reg_field_t cmn_pll_clk_div2_ratio;
4830fa96893226 Sandor Yu 2020-12-09   512  	reg_field_t cmn_pll_clk_div2_sel;
4830fa96893226 Sandor Yu 2020-12-09   513  	reg_field_t rx_diag_smplr_osr;
4830fa96893226 Sandor Yu 2020-12-09   514  	reg_field_t rx_psc_a0;
4830fa96893226 Sandor Yu 2020-12-09   515  	reg_field_t rx_ree_pergcsm_eqenm_ph1;
4830fa96893226 Sandor Yu 2020-12-09   516  	reg_field_t rx_ree_pergcsm_eqenm_ph2;
4830fa96893226 Sandor Yu 2020-12-09   517  	reg_field_t vga_gain_accum_override_en;
4830fa96893226 Sandor Yu 2020-12-09   518  	reg_field_t vga_gain_accum_override;
4830fa96893226 Sandor Yu 2020-12-09   519  	reg_field_t vga_gain_tgt_adj_override_en;
4830fa96893226 Sandor Yu 2020-12-09   520  	reg_field_t vga_gain_tgt_adj_override;
4830fa96893226 Sandor Yu 2020-12-09   521  	reg_field_t ree_gen_sm_en_usb;
4830fa96893226 Sandor Yu 2020-12-09   522  	reg_field_t ree_gen_sm_en_periodic;
4830fa96893226 Sandor Yu 2020-12-09   523  	reg_field_t ana_en_epath_gen_ctrl_sm_usb;
4830fa96893226 Sandor Yu 2020-12-09   524  	reg_field_t ana_en_epath_gen_ctrl_sm_periodic;
4830fa96893226 Sandor Yu 2020-12-09   525  	reg_field_t rxda_eq_range_sel;
4830fa96893226 Sandor Yu 2020-12-09   526  	reg_field_t rxda_vga_sa_range_sel;
4830fa96893226 Sandor Yu 2020-12-09   527  	reg_field_t vco_ring_select;
4830fa96893226 Sandor Yu 2020-12-09   528  	reg_field_t cmnda_pll0_v2i_prog;
4830fa96893226 Sandor Yu 2020-12-09   529  	reg_field_t cmnda_pll0_coarse_prog;
4830fa96893226 Sandor Yu 2020-12-09   530  	reg_field_t cmnda_pll0_cp_gain;
4830fa96893226 Sandor Yu 2020-12-09   531  	reg_field_t cmnda_pll0_const_ndac_cntrl;
4830fa96893226 Sandor Yu 2020-12-09   532  	reg_field_t cmnda_pll0_const_pmos_cntrl;
4830fa96893226 Sandor Yu 2020-12-09   533  	reg_field_t cmnda_pll0_ptat_ndac_cntrl;
4830fa96893226 Sandor Yu 2020-12-09   534  	reg_field_t rxda_pi_iq_bias_trim;
4830fa96893226 Sandor Yu 2020-12-09   535  	reg_field_t rxda_pi_iq_pload_bias_trim;
4830fa96893226 Sandor Yu 2020-12-09   536  	reg_field_t rxda_pi_iq_pload_trim;
4830fa96893226 Sandor Yu 2020-12-09   537  	reg_field_t rxda_pi_e_bias_trim;
4830fa96893226 Sandor Yu 2020-12-09   538  	reg_field_t rxda_pi_e_pload_bias_trim;
4830fa96893226 Sandor Yu 2020-12-09   539  	reg_field_t rxda_pi_e_pload_trim;
4830fa96893226 Sandor Yu 2020-12-09   540  	reg_field_t rxda_pi_range_sel;
4830fa96893226 Sandor Yu 2020-12-09   541  	reg_field_t rxda_pi_cal_cm_trim;
4830fa96893226 Sandor Yu 2020-12-09   542  	reg_field_t xcvr_pll_en;
4830fa96893226 Sandor Yu 2020-12-09   543  	reg_field_t xcvr_link_reset_n;
4830fa96893226 Sandor Yu 2020-12-09   544  	reg_field_t xcvr_power_state_req;
4830fa96893226 Sandor Yu 2020-12-09   545  	reg_field_t xcvr_power_state_ack;
4830fa96893226 Sandor Yu 2020-12-09   546  	reg_field_t iso_pma_cmn_pll0_clk_datart1_div;
4830fa96893226 Sandor Yu 2020-12-09   547  	reg_field_t iso_pma_cmn_pll0_clk_datart0_div;
4830fa96893226 Sandor Yu 2020-12-09   548  	reg_field_t iso_pma_cmn_pll0_clk_en;
4830fa96893226 Sandor Yu 2020-12-09   549  
4830fa96893226 Sandor Yu 2020-12-09   550  	/* Set fields' labels */
4830fa96893226 Sandor Yu 2020-12-09   551  	cmnda_pll0_ip_div.label = "cmnda_pll0_ip_div";
4830fa96893226 Sandor Yu 2020-12-09   552  	cmnda_pll0_hs_sym_div_sel.label = "cmnda_pll0_hs_sym_div_sel";
4830fa96893226 Sandor Yu 2020-12-09   553  	cmn_pll0_fb_div_high_ovrd_en.label = "cmn_pll0_fb_div_high_ovrd_en";
4830fa96893226 Sandor Yu 2020-12-09   554  	cmnda_pll0_fb_div_high_out.label = "cmnda_pll0_fb_div_high_out";
4830fa96893226 Sandor Yu 2020-12-09   555  	cmn_pll0_fb_div_low_ovrd_en.label = "cmn_pll0_fb_div_low_ovrd_en";
4830fa96893226 Sandor Yu 2020-12-09   556  	cmnda_pll0_fb_div_low_out.label = "cmnda_pll0_fb_div_low_out";
4830fa96893226 Sandor Yu 2020-12-09   557  	cmn_pll_clk_osr.label = "cmn_pll_clk_osr";
4830fa96893226 Sandor Yu 2020-12-09   558  	cmn_pll_clk_div2_ratio.label = "cmn_pll_clk_div2_ratio";
4830fa96893226 Sandor Yu 2020-12-09   559  	cmn_pll_clk_div2_sel.label = "cmn_pll_clk_div2_sel";
4830fa96893226 Sandor Yu 2020-12-09   560  	rx_diag_smplr_osr.label = "rx_diag_smplr_osr";
4830fa96893226 Sandor Yu 2020-12-09   561  	rx_psc_a0.label = "rx_psc_a0";
4830fa96893226 Sandor Yu 2020-12-09   562  	rx_ree_pergcsm_eqenm_ph1.label = "rx_ree_pergcsm_eqenm_ph1";
4830fa96893226 Sandor Yu 2020-12-09   563  	rx_ree_pergcsm_eqenm_ph2.label = "rx_ree_pergcsm_eqenm_ph2";
4830fa96893226 Sandor Yu 2020-12-09   564  	vga_gain_accum_override_en.label = "vga_gain_accum_override_en";
4830fa96893226 Sandor Yu 2020-12-09   565  	vga_gain_accum_override.label = "vga_gain_accum_override";
4830fa96893226 Sandor Yu 2020-12-09   566  	vga_gain_tgt_adj_override_en.label = "vga_gain_tgt_adj_override_en";
4830fa96893226 Sandor Yu 2020-12-09   567  	vga_gain_tgt_adj_override.label = "vga_gain_tgt_adj_override";
4830fa96893226 Sandor Yu 2020-12-09   568  	ree_gen_sm_en_usb.label = "ree_gen_sm_en_usb";
4830fa96893226 Sandor Yu 2020-12-09   569  	ree_gen_sm_en_periodic.label = "ree_gen_sm_en_periodic";
4830fa96893226 Sandor Yu 2020-12-09   570  	ana_en_epath_gen_ctrl_sm_usb.label = "ana_en_epath_gen_ctrl_sm_usb";
4830fa96893226 Sandor Yu 2020-12-09   571  	ana_en_epath_gen_ctrl_sm_periodic.label =
4830fa96893226 Sandor Yu 2020-12-09   572  	    "ana_en_epath_gen_ctrl_sm_periodic";
4830fa96893226 Sandor Yu 2020-12-09   573  	rxda_eq_range_sel.label = "rxda_eq_range_sel";
4830fa96893226 Sandor Yu 2020-12-09   574  	rxda_vga_sa_range_sel.label = "rxda_vga_sa_range_sel";
4830fa96893226 Sandor Yu 2020-12-09   575  	vco_ring_select.label = "vco_ring_select";
4830fa96893226 Sandor Yu 2020-12-09   576  	cmnda_pll0_v2i_prog.label = "cmnda_pll0_v2i_prog";
4830fa96893226 Sandor Yu 2020-12-09   577  	cmnda_pll0_coarse_prog.label = "cmnda_pll0_coarse_prog";
4830fa96893226 Sandor Yu 2020-12-09   578  	cmnda_pll0_cp_gain.label = "cmnda_pll0_cp_gain";
4830fa96893226 Sandor Yu 2020-12-09   579  	cmnda_pll0_const_ndac_cntrl.label = "cmnda_pll0_const_ndac_cntrl";
4830fa96893226 Sandor Yu 2020-12-09   580  	cmnda_pll0_const_pmos_cntrl.label = "cmnda_pll0_const_pmos_cntrl";
4830fa96893226 Sandor Yu 2020-12-09   581  	cmnda_pll0_ptat_ndac_cntrl.label = "cmnda_pll0_ptat_ndac_cntrl";
4830fa96893226 Sandor Yu 2020-12-09   582  	rxda_pi_iq_bias_trim.label = "rxda_pi_iq_bias_trim";
4830fa96893226 Sandor Yu 2020-12-09   583  	rxda_pi_iq_pload_bias_trim.label = "rxda_pi_iq_pload_bias_trim";
4830fa96893226 Sandor Yu 2020-12-09   584  	rxda_pi_iq_pload_trim.label = "rxda_pi_iq_pload_trim";
4830fa96893226 Sandor Yu 2020-12-09   585  	rxda_pi_e_bias_trim.label = "rxda_pi_e_bias_trim";
4830fa96893226 Sandor Yu 2020-12-09   586  	rxda_pi_e_pload_bias_trim.label = "rxda_pi_e_pload_bias_trim";
4830fa96893226 Sandor Yu 2020-12-09   587  	rxda_pi_e_pload_trim.label = "rxda_pi_e_pload_trim";
4830fa96893226 Sandor Yu 2020-12-09   588  	rxda_pi_range_sel.label = "rxda_pi_range_sel";
4830fa96893226 Sandor Yu 2020-12-09   589  	rxda_pi_cal_cm_trim.label = "rxda_pi_cal_cm_trim";
4830fa96893226 Sandor Yu 2020-12-09   590  	xcvr_pll_en.label = "xcvr_pll_en";
4830fa96893226 Sandor Yu 2020-12-09   591  	xcvr_link_reset_n.label = "xcvr_link_reset_n";
4830fa96893226 Sandor Yu 2020-12-09   592  	xcvr_power_state_req.label = "xcvr_power_state_req";
4830fa96893226 Sandor Yu 2020-12-09   593  	xcvr_power_state_ack.label = "xcvr_power_state_ack";
4830fa96893226 Sandor Yu 2020-12-09   594  	iso_pma_cmn_pll0_clk_datart1_div.label = "iso_pma_cmn_pll0_clk_datart1_div";
4830fa96893226 Sandor Yu 2020-12-09   595  	iso_pma_cmn_pll0_clk_datart0_div.label = "iso_pma_cmn_pll0_clk_datart0_div";
4830fa96893226 Sandor Yu 2020-12-09   596  	iso_pma_cmn_pll0_clk_en.label = "iso_pma_cmn_pll0_clk_en";
4830fa96893226 Sandor Yu 2020-12-09   597  
4830fa96893226 Sandor Yu 2020-12-09   598  	/* Set field position in a target register */
4830fa96893226 Sandor Yu 2020-12-09   599  	cmnda_pll0_ip_div.msb = 7;
4830fa96893226 Sandor Yu 2020-12-09   600  	cmnda_pll0_ip_div.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   601  	cmnda_pll0_hs_sym_div_sel.msb = 9;
4830fa96893226 Sandor Yu 2020-12-09   602  	cmnda_pll0_hs_sym_div_sel.lsb = 8;
4830fa96893226 Sandor Yu 2020-12-09   603  	cmn_pll0_fb_div_high_ovrd_en.msb = 15;
4830fa96893226 Sandor Yu 2020-12-09   604  	cmn_pll0_fb_div_high_ovrd_en.lsb = 15;
4830fa96893226 Sandor Yu 2020-12-09   605  	cmnda_pll0_fb_div_high_out.msb = 9;
4830fa96893226 Sandor Yu 2020-12-09   606  	cmnda_pll0_fb_div_high_out.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   607  	cmn_pll0_fb_div_low_ovrd_en.msb = 15;
4830fa96893226 Sandor Yu 2020-12-09   608  	cmn_pll0_fb_div_low_ovrd_en.lsb = 15;
4830fa96893226 Sandor Yu 2020-12-09   609  	cmnda_pll0_fb_div_low_out.msb = 9;
4830fa96893226 Sandor Yu 2020-12-09   610  	cmnda_pll0_fb_div_low_out.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   611  	cmn_pll_clk_osr.msb = 2;
4830fa96893226 Sandor Yu 2020-12-09   612  	cmn_pll_clk_osr.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   613  	cmn_pll_clk_div2_ratio.msb = 6;
4830fa96893226 Sandor Yu 2020-12-09   614  	cmn_pll_clk_div2_ratio.lsb = 4;
4830fa96893226 Sandor Yu 2020-12-09   615  	cmn_pll_clk_div2_sel.msb = 9;
4830fa96893226 Sandor Yu 2020-12-09   616  	cmn_pll_clk_div2_sel.lsb = 8;
4830fa96893226 Sandor Yu 2020-12-09   617  	rx_diag_smplr_osr.msb = 2;
4830fa96893226 Sandor Yu 2020-12-09   618  	rx_diag_smplr_osr.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   619  	rx_psc_a0.msb = 15;
4830fa96893226 Sandor Yu 2020-12-09   620  	rx_psc_a0.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   621  	rx_ree_pergcsm_eqenm_ph1.msb = 15;
4830fa96893226 Sandor Yu 2020-12-09   622  	rx_ree_pergcsm_eqenm_ph1.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   623  	rx_ree_pergcsm_eqenm_ph2.msb = 15;
4830fa96893226 Sandor Yu 2020-12-09   624  	rx_ree_pergcsm_eqenm_ph2.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   625  	vga_gain_accum_override_en.msb = 7;
4830fa96893226 Sandor Yu 2020-12-09   626  	vga_gain_accum_override_en.lsb = 7;
4830fa96893226 Sandor Yu 2020-12-09   627  	vga_gain_accum_override.msb = 4;
4830fa96893226 Sandor Yu 2020-12-09   628  	vga_gain_accum_override.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   629  	vga_gain_tgt_adj_override_en.msb = 15;
4830fa96893226 Sandor Yu 2020-12-09   630  	vga_gain_tgt_adj_override_en.lsb = 15;
4830fa96893226 Sandor Yu 2020-12-09   631  	vga_gain_tgt_adj_override.msb = 12;
4830fa96893226 Sandor Yu 2020-12-09   632  	vga_gain_tgt_adj_override.lsb = 8;
4830fa96893226 Sandor Yu 2020-12-09   633  	ree_gen_sm_en_usb.msb = 3;
4830fa96893226 Sandor Yu 2020-12-09   634  	ree_gen_sm_en_usb.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   635  	ree_gen_sm_en_periodic.msb = 11;
4830fa96893226 Sandor Yu 2020-12-09   636  	ree_gen_sm_en_periodic.lsb = 8;
4830fa96893226 Sandor Yu 2020-12-09   637  	ana_en_epath_gen_ctrl_sm_usb.msb = 7;
4830fa96893226 Sandor Yu 2020-12-09   638  	ana_en_epath_gen_ctrl_sm_usb.lsb = 4;
4830fa96893226 Sandor Yu 2020-12-09   639  	ana_en_epath_gen_ctrl_sm_periodic.msb = 15;
4830fa96893226 Sandor Yu 2020-12-09   640  	ana_en_epath_gen_ctrl_sm_periodic.lsb = 12;
4830fa96893226 Sandor Yu 2020-12-09   641  	rxda_eq_range_sel.msb = 2;
4830fa96893226 Sandor Yu 2020-12-09   642  	rxda_eq_range_sel.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   643  	rxda_vga_sa_range_sel.msb = 6;
4830fa96893226 Sandor Yu 2020-12-09   644  	rxda_vga_sa_range_sel.lsb = 4;
4830fa96893226 Sandor Yu 2020-12-09   645  	vco_ring_select.msb = 12;
4830fa96893226 Sandor Yu 2020-12-09   646  	vco_ring_select.lsb = 12;
4830fa96893226 Sandor Yu 2020-12-09   647  	cmnda_pll0_v2i_prog.msb = 5;
4830fa96893226 Sandor Yu 2020-12-09   648  	cmnda_pll0_v2i_prog.lsb = 4;
4830fa96893226 Sandor Yu 2020-12-09   649  	cmnda_pll0_coarse_prog.msb = 2;
4830fa96893226 Sandor Yu 2020-12-09   650  	cmnda_pll0_coarse_prog.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   651  	cmnda_pll0_cp_gain.msb = 8;
4830fa96893226 Sandor Yu 2020-12-09   652  	cmnda_pll0_cp_gain.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   653  	cmnda_pll0_const_ndac_cntrl.msb = 11;
4830fa96893226 Sandor Yu 2020-12-09   654  	cmnda_pll0_const_ndac_cntrl.lsb = 8;
4830fa96893226 Sandor Yu 2020-12-09   655  	cmnda_pll0_const_pmos_cntrl.msb = 7;
4830fa96893226 Sandor Yu 2020-12-09   656  	cmnda_pll0_const_pmos_cntrl.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   657  	cmnda_pll0_ptat_ndac_cntrl.msb = 5;
4830fa96893226 Sandor Yu 2020-12-09   658  	cmnda_pll0_ptat_ndac_cntrl.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   659  	rxda_pi_iq_bias_trim.msb = 14;
4830fa96893226 Sandor Yu 2020-12-09   660  	rxda_pi_iq_bias_trim.lsb = 12;
4830fa96893226 Sandor Yu 2020-12-09   661  	rxda_pi_iq_pload_bias_trim.msb = 10;
4830fa96893226 Sandor Yu 2020-12-09   662  	rxda_pi_iq_pload_bias_trim.lsb = 8;
4830fa96893226 Sandor Yu 2020-12-09   663  	rxda_pi_iq_pload_trim.msb = 7;
4830fa96893226 Sandor Yu 2020-12-09   664  	rxda_pi_iq_pload_trim.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   665  	rxda_pi_e_bias_trim.msb = 14;
4830fa96893226 Sandor Yu 2020-12-09   666  	rxda_pi_e_bias_trim.lsb = 12;
4830fa96893226 Sandor Yu 2020-12-09   667  	rxda_pi_e_pload_bias_trim.msb = 10;
4830fa96893226 Sandor Yu 2020-12-09   668  	rxda_pi_e_pload_bias_trim.lsb = 8;
4830fa96893226 Sandor Yu 2020-12-09   669  	rxda_pi_e_pload_trim.msb = 7;
4830fa96893226 Sandor Yu 2020-12-09   670  	rxda_pi_e_pload_trim.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   671  	rxda_pi_range_sel.msb = 11;
4830fa96893226 Sandor Yu 2020-12-09   672  	rxda_pi_range_sel.lsb = 8;
4830fa96893226 Sandor Yu 2020-12-09   673  	rxda_pi_cal_cm_trim.msb = 7;
4830fa96893226 Sandor Yu 2020-12-09   674  	rxda_pi_cal_cm_trim.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   675  	xcvr_pll_en.msb = 12;
4830fa96893226 Sandor Yu 2020-12-09   676  	xcvr_pll_en.lsb = 12;
4830fa96893226 Sandor Yu 2020-12-09   677  	xcvr_link_reset_n.msb = 13;
4830fa96893226 Sandor Yu 2020-12-09   678  	xcvr_link_reset_n.lsb = 13;
4830fa96893226 Sandor Yu 2020-12-09   679  	xcvr_power_state_req.msb = 3;
4830fa96893226 Sandor Yu 2020-12-09   680  	xcvr_power_state_req.lsb = 0;
4830fa96893226 Sandor Yu 2020-12-09   681  	xcvr_power_state_ack.msb = 7;
4830fa96893226 Sandor Yu 2020-12-09   682  	xcvr_power_state_ack.lsb = 4;
4830fa96893226 Sandor Yu 2020-12-09   683  	iso_pma_cmn_pll0_clk_datart1_div.msb = 14;
4830fa96893226 Sandor Yu 2020-12-09   684  	iso_pma_cmn_pll0_clk_datart1_div.lsb = 11;
4830fa96893226 Sandor Yu 2020-12-09   685  	iso_pma_cmn_pll0_clk_datart0_div.msb = 10;
4830fa96893226 Sandor Yu 2020-12-09   686  	iso_pma_cmn_pll0_clk_datart0_div.lsb = 7;
4830fa96893226 Sandor Yu 2020-12-09   687  	iso_pma_cmn_pll0_clk_en.msb = 5;
4830fa96893226 Sandor Yu 2020-12-09   688  	iso_pma_cmn_pll0_clk_en.lsb = 5;
4830fa96893226 Sandor Yu 2020-12-09   689  
4830fa96893226 Sandor Yu 2020-12-09   690  	dev_dbg(&hdmirx->pdev->dev, "pma_pll_config() Configuring PLL0 ...\n");
4830fa96893226 Sandor Yu 2020-12-09   691  
4830fa96893226 Sandor Yu 2020-12-09   692  	if (tmds_bit_clk_ratio == TMDS_BIT_CLOCK_RATIO_1_10) {
4830fa96893226 Sandor Yu 2020-12-09   693  		if (inside_f(rx_clk_freq, 18750, 37500)) {
4830fa96893226 Sandor Yu 2020-12-09   694  			set_field_value(&cmnda_pll0_ip_div, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   695  			set_field_value(&cmnda_pll0_hs_sym_div_sel, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   696  			set_field_value(&cmn_pll0_fb_div_high_ovrd_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   697  			set_field_value(&cmnda_pll0_fb_div_high_out, 0x1E);
4830fa96893226 Sandor Yu 2020-12-09   698  			set_field_value(&cmn_pll0_fb_div_low_ovrd_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   699  			set_field_value(&cmnda_pll0_fb_div_low_out, 0x7E);
4830fa96893226 Sandor Yu 2020-12-09   700  			set_field_value(&rx_diag_smplr_osr, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   701  			set_field_value(&rx_psc_a0, 0x8BF5);
4830fa96893226 Sandor Yu 2020-12-09   702  			set_field_value(&rx_ree_pergcsm_eqenm_ph1, 0x0080);
4830fa96893226 Sandor Yu 2020-12-09   703  			set_field_value(&rx_ree_pergcsm_eqenm_ph2, 0x0080);
4830fa96893226 Sandor Yu 2020-12-09   704  			set_field_value(&vga_gain_accum_override_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   705  			set_field_value(&vga_gain_accum_override, 0x1A);
4830fa96893226 Sandor Yu 2020-12-09   706  			set_field_value(&vga_gain_tgt_adj_override_en, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   707  			set_field_value(&vga_gain_tgt_adj_override, 0x00);
4830fa96893226 Sandor Yu 2020-12-09   708  			set_field_value(&ree_gen_sm_en_usb, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   709  			set_field_value(&ree_gen_sm_en_periodic, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   710  			set_field_value(&ana_en_epath_gen_ctrl_sm_usb, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   711  			set_field_value(&ana_en_epath_gen_ctrl_sm_periodic,
4830fa96893226 Sandor Yu 2020-12-09   712  					0x0);
4830fa96893226 Sandor Yu 2020-12-09   713  			set_field_value(&rxda_eq_range_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   714  			set_field_value(&rxda_vga_sa_range_sel, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   715  			switch (clk_ratio) {
4830fa96893226 Sandor Yu 2020-12-09   716  			case CLK_RATIO_1_1:
4830fa96893226 Sandor Yu 2020-12-09   717  				set_field_value(&cmn_pll_clk_osr, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   718  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   719  				set_field_value(&cmn_pll_clk_div2_sel, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   720  				break;
4830fa96893226 Sandor Yu 2020-12-09   721  			case CLK_RATIO_5_4:
4830fa96893226 Sandor Yu 2020-12-09   722  				set_field_value(&cmn_pll_clk_osr, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   723  				set_field_value(&cmn_pll_clk_div2_ratio, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   724  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   725  				break;
4830fa96893226 Sandor Yu 2020-12-09   726  			case CLK_RATIO_3_2:
4830fa96893226 Sandor Yu 2020-12-09   727  				set_field_value(&cmn_pll_clk_osr, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   728  				set_field_value(&cmn_pll_clk_div2_ratio, 0x5);
4830fa96893226 Sandor Yu 2020-12-09   729  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   730  				break;
4830fa96893226 Sandor Yu 2020-12-09   731  			case CLK_RATIO_2_1:
4830fa96893226 Sandor Yu 2020-12-09   732  				set_field_value(&cmn_pll_clk_osr, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   733  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   734  				set_field_value(&cmn_pll_clk_div2_sel, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   735  				break;
4830fa96893226 Sandor Yu 2020-12-09   736  			case CLK_RATIO_1_2:
4830fa96893226 Sandor Yu 2020-12-09   737  				set_field_value(&cmn_pll_clk_osr, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   738  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   739  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   740  				break;
4830fa96893226 Sandor Yu 2020-12-09   741  			case CLK_RATIO_5_8:
4830fa96893226 Sandor Yu 2020-12-09   742  				set_field_value(&cmn_pll_clk_osr, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   743  				set_field_value(&cmn_pll_clk_div2_ratio, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   744  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   745  				break;
4830fa96893226 Sandor Yu 2020-12-09   746  			case CLK_RATIO_3_4:
4830fa96893226 Sandor Yu 2020-12-09   747  				set_field_value(&cmn_pll_clk_osr, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   748  				set_field_value(&cmn_pll_clk_div2_ratio, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   749  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   750  				break;
4830fa96893226 Sandor Yu 2020-12-09   751  			}
4830fa96893226 Sandor Yu 2020-12-09   752  		} else if (inside_f(rx_clk_freq, 37500, 75000)) {
4830fa96893226 Sandor Yu 2020-12-09   753  			set_field_value(&cmnda_pll0_ip_div, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   754  			set_field_value(&cmnda_pll0_hs_sym_div_sel, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   755  			set_field_value(&cmn_pll0_fb_div_high_ovrd_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   756  			set_field_value(&cmnda_pll0_fb_div_high_out, 0x0E);
4830fa96893226 Sandor Yu 2020-12-09   757  			set_field_value(&cmn_pll0_fb_div_low_ovrd_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   758  			set_field_value(&cmnda_pll0_fb_div_low_out, 0x3E);
4830fa96893226 Sandor Yu 2020-12-09   759  			set_field_value(&rx_diag_smplr_osr, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   760  			set_field_value(&rx_psc_a0, 0x8BF5);
4830fa96893226 Sandor Yu 2020-12-09   761  			set_field_value(&rx_ree_pergcsm_eqenm_ph1, 0x0080);
4830fa96893226 Sandor Yu 2020-12-09   762  			set_field_value(&rx_ree_pergcsm_eqenm_ph2, 0x0080);
4830fa96893226 Sandor Yu 2020-12-09   763  			set_field_value(&vga_gain_accum_override_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   764  			set_field_value(&vga_gain_accum_override, 0x1A);
4830fa96893226 Sandor Yu 2020-12-09   765  			set_field_value(&vga_gain_tgt_adj_override_en, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   766  			set_field_value(&vga_gain_tgt_adj_override, 0x00);
4830fa96893226 Sandor Yu 2020-12-09   767  			set_field_value(&ree_gen_sm_en_usb, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   768  			set_field_value(&ree_gen_sm_en_periodic, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   769  			set_field_value(&ana_en_epath_gen_ctrl_sm_usb, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   770  			set_field_value(&ana_en_epath_gen_ctrl_sm_periodic,
4830fa96893226 Sandor Yu 2020-12-09   771  					0x0);
4830fa96893226 Sandor Yu 2020-12-09   772  			set_field_value(&rxda_eq_range_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   773  			set_field_value(&rxda_vga_sa_range_sel, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   774  			switch (clk_ratio) {
4830fa96893226 Sandor Yu 2020-12-09   775  			case CLK_RATIO_1_1:
4830fa96893226 Sandor Yu 2020-12-09   776  				set_field_value(&cmn_pll_clk_osr, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   777  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   778  				set_field_value(&cmn_pll_clk_div2_sel, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   779  				break;
4830fa96893226 Sandor Yu 2020-12-09   780  			case CLK_RATIO_5_4:
4830fa96893226 Sandor Yu 2020-12-09   781  				set_field_value(&cmn_pll_clk_osr, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   782  				set_field_value(&cmn_pll_clk_div2_ratio, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   783  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   784  				break;
4830fa96893226 Sandor Yu 2020-12-09   785  			case CLK_RATIO_3_2:
4830fa96893226 Sandor Yu 2020-12-09   786  				set_field_value(&cmn_pll_clk_osr, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   787  				set_field_value(&cmn_pll_clk_div2_ratio, 0x5);
4830fa96893226 Sandor Yu 2020-12-09   788  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   789  				break;
4830fa96893226 Sandor Yu 2020-12-09   790  			case CLK_RATIO_2_1:
4830fa96893226 Sandor Yu 2020-12-09   791  				set_field_value(&cmn_pll_clk_osr, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   792  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   793  				set_field_value(&cmn_pll_clk_div2_sel, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   794  				break;
4830fa96893226 Sandor Yu 2020-12-09   795  			case CLK_RATIO_1_2:
4830fa96893226 Sandor Yu 2020-12-09   796  				set_field_value(&cmn_pll_clk_osr, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   797  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   798  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   799  				break;
4830fa96893226 Sandor Yu 2020-12-09   800  			case CLK_RATIO_5_8:
4830fa96893226 Sandor Yu 2020-12-09   801  				set_field_value(&cmn_pll_clk_osr, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   802  				set_field_value(&cmn_pll_clk_div2_ratio, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   803  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   804  				break;
4830fa96893226 Sandor Yu 2020-12-09   805  			case CLK_RATIO_3_4:
4830fa96893226 Sandor Yu 2020-12-09   806  				set_field_value(&cmn_pll_clk_osr, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   807  				set_field_value(&cmn_pll_clk_div2_ratio, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   808  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   809  				break;
4830fa96893226 Sandor Yu 2020-12-09   810  			}
4830fa96893226 Sandor Yu 2020-12-09   811  		} else if (inside_f(rx_clk_freq, 75000, 150000)) {
4830fa96893226 Sandor Yu 2020-12-09   812  			set_field_value(&cmnda_pll0_ip_div, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   813  			set_field_value(&cmnda_pll0_hs_sym_div_sel, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   814  			set_field_value(&cmn_pll0_fb_div_high_ovrd_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   815  			set_field_value(&cmnda_pll0_fb_div_high_out, 0x0A);
4830fa96893226 Sandor Yu 2020-12-09   816  			set_field_value(&cmn_pll0_fb_div_low_ovrd_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   817  			set_field_value(&cmnda_pll0_fb_div_low_out, 0x1A);
4830fa96893226 Sandor Yu 2020-12-09   818  			set_field_value(&rx_diag_smplr_osr, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   819  			set_field_value(&rx_psc_a0, 0x8BF5);
4830fa96893226 Sandor Yu 2020-12-09   820  			set_field_value(&rx_ree_pergcsm_eqenm_ph1, 0x0080);
4830fa96893226 Sandor Yu 2020-12-09   821  			set_field_value(&rx_ree_pergcsm_eqenm_ph2, 0x0080);
4830fa96893226 Sandor Yu 2020-12-09   822  			set_field_value(&vga_gain_accum_override_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   823  			set_field_value(&vga_gain_accum_override, 0x1A);
4830fa96893226 Sandor Yu 2020-12-09   824  			set_field_value(&vga_gain_tgt_adj_override_en, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   825  			set_field_value(&vga_gain_tgt_adj_override, 0x00);
4830fa96893226 Sandor Yu 2020-12-09   826  			set_field_value(&ree_gen_sm_en_usb, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   827  			set_field_value(&ree_gen_sm_en_periodic, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   828  			set_field_value(&ana_en_epath_gen_ctrl_sm_usb, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   829  			set_field_value(&ana_en_epath_gen_ctrl_sm_periodic,
4830fa96893226 Sandor Yu 2020-12-09   830  					0x0);
4830fa96893226 Sandor Yu 2020-12-09   831  			set_field_value(&rxda_eq_range_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   832  			set_field_value(&rxda_vga_sa_range_sel, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   833  			switch (clk_ratio) {
4830fa96893226 Sandor Yu 2020-12-09   834  			case CLK_RATIO_1_1:
4830fa96893226 Sandor Yu 2020-12-09   835  				set_field_value(&cmn_pll_clk_osr, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   836  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   837  				set_field_value(&cmn_pll_clk_div2_sel, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   838  				break;
4830fa96893226 Sandor Yu 2020-12-09   839  			case CLK_RATIO_5_4:
4830fa96893226 Sandor Yu 2020-12-09   840  				set_field_value(&cmn_pll_clk_osr, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   841  				set_field_value(&cmn_pll_clk_div2_ratio, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   842  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   843  				break;
4830fa96893226 Sandor Yu 2020-12-09   844  			case CLK_RATIO_3_2:
4830fa96893226 Sandor Yu 2020-12-09   845  				set_field_value(&cmn_pll_clk_osr, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   846  				set_field_value(&cmn_pll_clk_div2_ratio, 0x5);
4830fa96893226 Sandor Yu 2020-12-09   847  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   848  				break;
4830fa96893226 Sandor Yu 2020-12-09   849  			case CLK_RATIO_2_1:
4830fa96893226 Sandor Yu 2020-12-09   850  				set_field_value(&cmn_pll_clk_osr, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   851  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   852  				set_field_value(&cmn_pll_clk_div2_sel, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   853  				break;
4830fa96893226 Sandor Yu 2020-12-09   854  			case CLK_RATIO_1_2:
4830fa96893226 Sandor Yu 2020-12-09   855  				set_field_value(&cmn_pll_clk_osr, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   856  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   857  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   858  				break;
4830fa96893226 Sandor Yu 2020-12-09   859  			case CLK_RATIO_5_8:
4830fa96893226 Sandor Yu 2020-12-09   860  				set_field_value(&cmn_pll_clk_osr, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   861  				set_field_value(&cmn_pll_clk_div2_ratio, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   862  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   863  				break;
4830fa96893226 Sandor Yu 2020-12-09   864  			case CLK_RATIO_3_4:
4830fa96893226 Sandor Yu 2020-12-09   865  				set_field_value(&cmn_pll_clk_osr, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   866  				set_field_value(&cmn_pll_clk_div2_ratio, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   867  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   868  				break;
4830fa96893226 Sandor Yu 2020-12-09   869  			}
4830fa96893226 Sandor Yu 2020-12-09   870  		} else if (inside_f(rx_clk_freq, 150000, 300000)) {
4830fa96893226 Sandor Yu 2020-12-09   871  			set_field_value(&cmnda_pll0_ip_div, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   872  			set_field_value(&cmnda_pll0_hs_sym_div_sel, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   873  			set_field_value(&cmn_pll0_fb_div_high_ovrd_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   874  			set_field_value(&cmnda_pll0_fb_div_high_out, 0x0A);
4830fa96893226 Sandor Yu 2020-12-09   875  			set_field_value(&cmn_pll0_fb_div_low_ovrd_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   876  			set_field_value(&cmnda_pll0_fb_div_low_out, 0x1A);
4830fa96893226 Sandor Yu 2020-12-09   877  			set_field_value(&rx_diag_smplr_osr, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   878  			set_field_value(&rx_psc_a0, 0x8BF5);
4830fa96893226 Sandor Yu 2020-12-09   879  			set_field_value(&rx_ree_pergcsm_eqenm_ph1, 0x0080);
4830fa96893226 Sandor Yu 2020-12-09   880  			set_field_value(&rx_ree_pergcsm_eqenm_ph2, 0x0080);
4830fa96893226 Sandor Yu 2020-12-09   881  			set_field_value(&vga_gain_accum_override_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   882  			set_field_value(&vga_gain_accum_override, 0x1A);
4830fa96893226 Sandor Yu 2020-12-09   883  			set_field_value(&vga_gain_tgt_adj_override_en, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   884  			set_field_value(&vga_gain_tgt_adj_override, 0x00);
4830fa96893226 Sandor Yu 2020-12-09   885  			set_field_value(&ree_gen_sm_en_usb, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   886  			set_field_value(&ree_gen_sm_en_periodic, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   887  			set_field_value(&ana_en_epath_gen_ctrl_sm_usb, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   888  			set_field_value(&ana_en_epath_gen_ctrl_sm_periodic,
4830fa96893226 Sandor Yu 2020-12-09   889  					0x0);
4830fa96893226 Sandor Yu 2020-12-09   890  			set_field_value(&rxda_eq_range_sel, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   891  			set_field_value(&rxda_vga_sa_range_sel, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   892  			switch (clk_ratio) {
4830fa96893226 Sandor Yu 2020-12-09   893  			case CLK_RATIO_1_1:
4830fa96893226 Sandor Yu 2020-12-09   894  				set_field_value(&cmn_pll_clk_osr, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   895  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   896  				set_field_value(&cmn_pll_clk_div2_sel, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   897  				break;
4830fa96893226 Sandor Yu 2020-12-09   898  			case CLK_RATIO_5_4:
4830fa96893226 Sandor Yu 2020-12-09   899  				set_field_value(&cmn_pll_clk_osr, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   900  				set_field_value(&cmn_pll_clk_div2_ratio, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   901  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   902  				break;
4830fa96893226 Sandor Yu 2020-12-09   903  			case CLK_RATIO_3_2:
4830fa96893226 Sandor Yu 2020-12-09   904  				set_field_value(&cmn_pll_clk_osr, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   905  				set_field_value(&cmn_pll_clk_div2_ratio, 0x5);
4830fa96893226 Sandor Yu 2020-12-09   906  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   907  				break;
4830fa96893226 Sandor Yu 2020-12-09   908  			case CLK_RATIO_2_1:
4830fa96893226 Sandor Yu 2020-12-09   909  				set_field_value(&cmn_pll_clk_osr, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   910  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   911  				set_field_value(&cmn_pll_clk_div2_sel, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   912  				break;
4830fa96893226 Sandor Yu 2020-12-09   913  			case CLK_RATIO_1_2:
4830fa96893226 Sandor Yu 2020-12-09   914  				set_field_value(&cmn_pll_clk_osr, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   915  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   916  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   917  				break;
4830fa96893226 Sandor Yu 2020-12-09   918  			case CLK_RATIO_5_8:
4830fa96893226 Sandor Yu 2020-12-09   919  				set_field_value(&cmn_pll_clk_osr, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   920  				set_field_value(&cmn_pll_clk_div2_ratio, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   921  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   922  				break;
4830fa96893226 Sandor Yu 2020-12-09   923  			case CLK_RATIO_3_4:
4830fa96893226 Sandor Yu 2020-12-09   924  				set_field_value(&cmn_pll_clk_osr, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   925  				set_field_value(&cmn_pll_clk_div2_ratio, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   926  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   927  				break;
4830fa96893226 Sandor Yu 2020-12-09   928  			}
4830fa96893226 Sandor Yu 2020-12-09   929  		} else if (inside_f(rx_clk_freq, 300000, 340000)) {
4830fa96893226 Sandor Yu 2020-12-09   930  			set_field_value(&cmnda_pll0_ip_div, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   931  			set_field_value(&cmnda_pll0_hs_sym_div_sel, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   932  			set_field_value(&cmn_pll0_fb_div_high_ovrd_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   933  			set_field_value(&cmnda_pll0_fb_div_high_out, 0x0A);
4830fa96893226 Sandor Yu 2020-12-09   934  			set_field_value(&cmn_pll0_fb_div_low_ovrd_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   935  			set_field_value(&cmnda_pll0_fb_div_low_out, 0x10);
4830fa96893226 Sandor Yu 2020-12-09   936  			set_field_value(&rx_diag_smplr_osr, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   937  			set_field_value(&rx_psc_a0, 0x8BF5);
4830fa96893226 Sandor Yu 2020-12-09   938  			set_field_value(&rx_ree_pergcsm_eqenm_ph1, 0x0080);
4830fa96893226 Sandor Yu 2020-12-09   939  			set_field_value(&rx_ree_pergcsm_eqenm_ph2, 0x0080);
4830fa96893226 Sandor Yu 2020-12-09   940  			set_field_value(&vga_gain_accum_override_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   941  			set_field_value(&vga_gain_accum_override, 0x1A);
4830fa96893226 Sandor Yu 2020-12-09   942  			set_field_value(&vga_gain_tgt_adj_override_en, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   943  			set_field_value(&vga_gain_tgt_adj_override, 0x00);
4830fa96893226 Sandor Yu 2020-12-09   944  			set_field_value(&ree_gen_sm_en_usb, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   945  			set_field_value(&ree_gen_sm_en_periodic, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   946  			set_field_value(&ana_en_epath_gen_ctrl_sm_usb, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   947  			set_field_value(&ana_en_epath_gen_ctrl_sm_periodic,
4830fa96893226 Sandor Yu 2020-12-09   948  					0x0);
4830fa96893226 Sandor Yu 2020-12-09   949  			set_field_value(&rxda_eq_range_sel, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   950  			set_field_value(&rxda_vga_sa_range_sel, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   951  			switch (clk_ratio) {
4830fa96893226 Sandor Yu 2020-12-09   952  			case CLK_RATIO_1_1:
4830fa96893226 Sandor Yu 2020-12-09   953  				set_field_value(&cmn_pll_clk_osr, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   954  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   955  				set_field_value(&cmn_pll_clk_div2_sel, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   956  				break;
4830fa96893226 Sandor Yu 2020-12-09   957  			case CLK_RATIO_5_4:
4830fa96893226 Sandor Yu 2020-12-09   958  				set_field_value(&cmn_pll_clk_osr, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   959  				set_field_value(&cmn_pll_clk_div2_ratio, 0x4);
4830fa96893226 Sandor Yu 2020-12-09   960  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   961  				break;
4830fa96893226 Sandor Yu 2020-12-09   962  			case CLK_RATIO_3_2:
4830fa96893226 Sandor Yu 2020-12-09   963  				set_field_value(&cmn_pll_clk_osr, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   964  				set_field_value(&cmn_pll_clk_div2_ratio, 0x5);
4830fa96893226 Sandor Yu 2020-12-09   965  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   966  				break;
4830fa96893226 Sandor Yu 2020-12-09   967  			case CLK_RATIO_2_1:
4830fa96893226 Sandor Yu 2020-12-09   968  				set_field_value(&cmn_pll_clk_osr, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   969  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   970  				set_field_value(&cmn_pll_clk_div2_sel, 0x3);
4830fa96893226 Sandor Yu 2020-12-09   971  				break;
4830fa96893226 Sandor Yu 2020-12-09   972  			case CLK_RATIO_1_2:
4830fa96893226 Sandor Yu 2020-12-09   973  				set_field_value(&cmn_pll_clk_osr, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   974  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   975  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   976  				break;
4830fa96893226 Sandor Yu 2020-12-09   977  			case CLK_RATIO_5_8:
4830fa96893226 Sandor Yu 2020-12-09   978  				set_field_value(&cmn_pll_clk_osr, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   979  				set_field_value(&cmn_pll_clk_div2_ratio, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   980  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   981  				break;
4830fa96893226 Sandor Yu 2020-12-09   982  			case CLK_RATIO_3_4:
4830fa96893226 Sandor Yu 2020-12-09   983  				set_field_value(&cmn_pll_clk_osr, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   984  				set_field_value(&cmn_pll_clk_div2_ratio, 0x2);
4830fa96893226 Sandor Yu 2020-12-09   985  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   986  				break;
4830fa96893226 Sandor Yu 2020-12-09   987  			}
4830fa96893226 Sandor Yu 2020-12-09   988  		} else {
4830fa96893226 Sandor Yu 2020-12-09   989  			dev_err(&hdmirx->pdev->dev, "TMDS clock frequency (%d KHz) is out of range\n", rx_clk_freq);
4830fa96893226 Sandor Yu 2020-12-09   990  			return -1;
4830fa96893226 Sandor Yu 2020-12-09   991  		}
4830fa96893226 Sandor Yu 2020-12-09   992  
4830fa96893226 Sandor Yu 2020-12-09   993  	} else {		/* TMDS_BIT_CLOCK_RATIO_1_40 */
4830fa96893226 Sandor Yu 2020-12-09   994  		if (inside_f(rx_clk_freq, 85000, 150000)) {
4830fa96893226 Sandor Yu 2020-12-09   995  			set_field_value(&cmnda_pll0_ip_div, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   996  			set_field_value(&cmnda_pll0_hs_sym_div_sel, 0x0);
4830fa96893226 Sandor Yu 2020-12-09   997  			set_field_value(&cmn_pll0_fb_div_high_ovrd_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09   998  			set_field_value(&cmnda_pll0_fb_div_high_out, 0x0A);
4830fa96893226 Sandor Yu 2020-12-09   999  			set_field_value(&cmn_pll0_fb_div_low_ovrd_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1000  			set_field_value(&cmnda_pll0_fb_div_low_out, 0x1A);
4830fa96893226 Sandor Yu 2020-12-09  1001  			set_field_value(&rx_diag_smplr_osr, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1002  			set_field_value(&rx_psc_a0, 0x8BFD);
4830fa96893226 Sandor Yu 2020-12-09  1003  			set_field_value(&rx_ree_pergcsm_eqenm_ph1, 0x019F);
4830fa96893226 Sandor Yu 2020-12-09  1004  			set_field_value(&rx_ree_pergcsm_eqenm_ph2, 0x019F);
4830fa96893226 Sandor Yu 2020-12-09  1005  			set_field_value(&vga_gain_accum_override_en, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1006  			set_field_value(&vga_gain_accum_override, 0x01);
4830fa96893226 Sandor Yu 2020-12-09  1007  			set_field_value(&vga_gain_tgt_adj_override_en, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1008  			set_field_value(&vga_gain_tgt_adj_override, 0x1F);
4830fa96893226 Sandor Yu 2020-12-09  1009  			set_field_value(&ree_gen_sm_en_usb, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1010  			set_field_value(&ree_gen_sm_en_periodic, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1011  			set_field_value(&ana_en_epath_gen_ctrl_sm_usb, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1012  			set_field_value(&ana_en_epath_gen_ctrl_sm_periodic, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1013  			set_field_value(&rxda_eq_range_sel, 0x3);
4830fa96893226 Sandor Yu 2020-12-09  1014  			set_field_value(&rxda_vga_sa_range_sel, 0x3);
4830fa96893226 Sandor Yu 2020-12-09  1015  			switch (clk_ratio) {
4830fa96893226 Sandor Yu 2020-12-09  1016  			case CLK_RATIO_1_1:
4830fa96893226 Sandor Yu 2020-12-09  1017  				set_field_value(&cmn_pll_clk_osr, 0x00);
4830fa96893226 Sandor Yu 2020-12-09  1018  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1019  				set_field_value(&cmn_pll_clk_div2_sel, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1020  				break;
4830fa96893226 Sandor Yu 2020-12-09  1021  			case CLK_RATIO_5_4:
4830fa96893226 Sandor Yu 2020-12-09  1022  				set_field_value(&cmn_pll_clk_osr, 0x00);
4830fa96893226 Sandor Yu 2020-12-09  1023  				set_field_value(&cmn_pll_clk_div2_ratio, 0x4);
4830fa96893226 Sandor Yu 2020-12-09  1024  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1025  				break;
4830fa96893226 Sandor Yu 2020-12-09  1026  			case CLK_RATIO_3_2:
4830fa96893226 Sandor Yu 2020-12-09  1027  				set_field_value(&cmn_pll_clk_osr, 0x00);
4830fa96893226 Sandor Yu 2020-12-09  1028  				set_field_value(&cmn_pll_clk_div2_ratio, 0x5);
4830fa96893226 Sandor Yu 2020-12-09  1029  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1030  				break;
4830fa96893226 Sandor Yu 2020-12-09  1031  			case CLK_RATIO_2_1:
4830fa96893226 Sandor Yu 2020-12-09  1032  				set_field_value(&cmn_pll_clk_osr, 0x00);
4830fa96893226 Sandor Yu 2020-12-09  1033  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1034  				set_field_value(&cmn_pll_clk_div2_sel, 0x3);
4830fa96893226 Sandor Yu 2020-12-09  1035  				break;
4830fa96893226 Sandor Yu 2020-12-09  1036  			case CLK_RATIO_1_2:
4830fa96893226 Sandor Yu 2020-12-09  1037  				set_field_value(&cmn_pll_clk_osr, 0x00);
4830fa96893226 Sandor Yu 2020-12-09  1038  				set_field_value(&cmn_pll_clk_div2_ratio, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1039  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1040  				break;
4830fa96893226 Sandor Yu 2020-12-09  1041  			case CLK_RATIO_5_8:
4830fa96893226 Sandor Yu 2020-12-09  1042  				set_field_value(&cmn_pll_clk_osr, 0x00);
4830fa96893226 Sandor Yu 2020-12-09  1043  				set_field_value(&cmn_pll_clk_div2_ratio, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1044  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1045  				break;
4830fa96893226 Sandor Yu 2020-12-09  1046  			case CLK_RATIO_3_4:
4830fa96893226 Sandor Yu 2020-12-09  1047  				set_field_value(&cmn_pll_clk_osr, 0x00);
4830fa96893226 Sandor Yu 2020-12-09  1048  				set_field_value(&cmn_pll_clk_div2_ratio, 0x2);
4830fa96893226 Sandor Yu 2020-12-09  1049  				set_field_value(&cmn_pll_clk_div2_sel, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1050  				break;
4830fa96893226 Sandor Yu 2020-12-09  1051  			}
4830fa96893226 Sandor Yu 2020-12-09  1052  		} else {
4830fa96893226 Sandor Yu 2020-12-09  1053  			dev_err(&hdmirx->pdev->dev, "pma_pll_config() *E: TMDS clock frequency (%d kHz) is out of range\n",
4830fa96893226 Sandor Yu 2020-12-09  1054  			     rx_clk_freq);
4830fa96893226 Sandor Yu 2020-12-09  1055  			return -1;
4830fa96893226 Sandor Yu 2020-12-09  1056  		}
4830fa96893226 Sandor Yu 2020-12-09  1057  	}
4830fa96893226 Sandor Yu 2020-12-09  1058  
4830fa96893226 Sandor Yu 2020-12-09  1059  	vco_freq_khz =
4830fa96893226 Sandor Yu 2020-12-09  1060  	    (2048 * (u64) rx_clk_freq * (1 << cmn_pll_clk_osr.value) * tmds_bit_clk_ratio) / 2047;
4830fa96893226 Sandor Yu 2020-12-09  1061  
4830fa96893226 Sandor Yu 2020-12-09  1062  	dev_info(&hdmirx->pdev->dev, "VCO frequency (refclk: %d kHz, TMDS clk: %d kHz, OSR: %0d, tmds_bit_clk_ratio: %d) equals %llu kHz\n",
4830fa96893226 Sandor Yu 2020-12-09  1063  	     REFCLK_FREQ_KHZ, rx_clk_freq, 1 << cmn_pll_clk_osr.value,
4830fa96893226 Sandor Yu 2020-12-09  1064  	     tmds_bit_clk_ratio, vco_freq_khz);
4830fa96893226 Sandor Yu 2020-12-09  1065  
4830fa96893226 Sandor Yu 2020-12-09  1066  	if (inside_f(vco_freq_khz, 3000000, 3400000 - 1000)) {
4830fa96893226 Sandor Yu 2020-12-09  1067  		set_field_value(&vco_ring_select, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1068  		set_field_value(&cmnda_pll0_v2i_prog, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1069  		set_field_value(&cmnda_pll0_coarse_prog, 0x3);
4830fa96893226 Sandor Yu 2020-12-09  1070  		switch (cmnda_pll0_fb_div_low_out.value) {
4830fa96893226 Sandor Yu 2020-12-09  1071  		case 0x7E:
4830fa96893226 Sandor Yu 2020-12-09  1072  			set_field_value(&cmnda_pll0_cp_gain, 0x78);
4830fa96893226 Sandor Yu 2020-12-09  1073  			break;
4830fa96893226 Sandor Yu 2020-12-09  1074  		case 0x3E:
4830fa96893226 Sandor Yu 2020-12-09  1075  			set_field_value(&cmnda_pll0_cp_gain, 0x78);
4830fa96893226 Sandor Yu 2020-12-09  1076  			break;
4830fa96893226 Sandor Yu 2020-12-09  1077  		case 0x10:
4830fa96893226 Sandor Yu 2020-12-09  1078  			set_field_value(&cmnda_pll0_cp_gain, 0x58);
4830fa96893226 Sandor Yu 2020-12-09  1079  			break;
4830fa96893226 Sandor Yu 2020-12-09  1080  		default:
4830fa96893226 Sandor Yu 2020-12-09  1081  			set_field_value(&cmnda_pll0_cp_gain, 0x78);
4830fa96893226 Sandor Yu 2020-12-09  1082  		}
4830fa96893226 Sandor Yu 2020-12-09  1083  		set_field_value(&cmnda_pll0_const_ndac_cntrl, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1084  		set_field_value(&cmnda_pll0_const_pmos_cntrl, 0x04);
4830fa96893226 Sandor Yu 2020-12-09  1085  		set_field_value(&cmnda_pll0_ptat_ndac_cntrl, 0x0D);
4830fa96893226 Sandor Yu 2020-12-09  1086  	} else if (inside_f(vco_freq_khz, 3400000, 3687000 - 1000)) {
4830fa96893226 Sandor Yu 2020-12-09  1087  		set_field_value(&vco_ring_select, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1088  		set_field_value(&cmnda_pll0_v2i_prog, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1089  		set_field_value(&cmnda_pll0_coarse_prog, 0x7);
4830fa96893226 Sandor Yu 2020-12-09  1090  		switch (cmnda_pll0_fb_div_low_out.value) {
4830fa96893226 Sandor Yu 2020-12-09  1091  		case 0x7E:
4830fa96893226 Sandor Yu 2020-12-09  1092  			set_field_value(&cmnda_pll0_cp_gain, 0x68);
4830fa96893226 Sandor Yu 2020-12-09  1093  			break;
4830fa96893226 Sandor Yu 2020-12-09  1094  		case 0x3E:
4830fa96893226 Sandor Yu 2020-12-09  1095  			set_field_value(&cmnda_pll0_cp_gain, 0x68);
4830fa96893226 Sandor Yu 2020-12-09  1096  			break;
4830fa96893226 Sandor Yu 2020-12-09  1097  		case 0x10:
4830fa96893226 Sandor Yu 2020-12-09  1098  			set_field_value(&cmnda_pll0_cp_gain, 0x59);
4830fa96893226 Sandor Yu 2020-12-09  1099  			break;
4830fa96893226 Sandor Yu 2020-12-09  1100  		default:
4830fa96893226 Sandor Yu 2020-12-09  1101  			set_field_value(&cmnda_pll0_cp_gain, 0x68);
4830fa96893226 Sandor Yu 2020-12-09  1102  		}
4830fa96893226 Sandor Yu 2020-12-09  1103  		set_field_value(&cmnda_pll0_const_ndac_cntrl, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1104  		set_field_value(&cmnda_pll0_const_pmos_cntrl, 0x8E);
4830fa96893226 Sandor Yu 2020-12-09  1105  		set_field_value(&cmnda_pll0_ptat_ndac_cntrl, 0x2F);
4830fa96893226 Sandor Yu 2020-12-09  1106  	} else if (inside_f(vco_freq_khz, 3687000, 3999000 - 1000)) {
4830fa96893226 Sandor Yu 2020-12-09  1107  		set_field_value(&vco_ring_select, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1108  		set_field_value(&cmnda_pll0_v2i_prog, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1109  		set_field_value(&cmnda_pll0_coarse_prog, 0x7);
4830fa96893226 Sandor Yu 2020-12-09  1110  		set_field_value(&cmnda_pll0_cp_gain, 0x64);
4830fa96893226 Sandor Yu 2020-12-09  1111  		set_field_value(&cmnda_pll0_const_ndac_cntrl, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1112  		set_field_value(&cmnda_pll0_const_pmos_cntrl, 0x8E);
4830fa96893226 Sandor Yu 2020-12-09  1113  		set_field_value(&cmnda_pll0_ptat_ndac_cntrl, 0x2F);
4830fa96893226 Sandor Yu 2020-12-09  1114  	} else if (inside_f(vco_freq_khz, 3999000, 4337000 - 1000)) {
4830fa96893226 Sandor Yu 2020-12-09  1115  		set_field_value(&vco_ring_select, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1116  		set_field_value(&cmnda_pll0_v2i_prog, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1117  		set_field_value(&cmnda_pll0_coarse_prog, 0x7);
4830fa96893226 Sandor Yu 2020-12-09  1118  		set_field_value(&cmnda_pll0_cp_gain, 0x56);
4830fa96893226 Sandor Yu 2020-12-09  1119  		set_field_value(&cmnda_pll0_const_ndac_cntrl, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1120  		set_field_value(&cmnda_pll0_const_pmos_cntrl, 0x8E);
4830fa96893226 Sandor Yu 2020-12-09  1121  		set_field_value(&cmnda_pll0_ptat_ndac_cntrl, 0x2F);
4830fa96893226 Sandor Yu 2020-12-09  1122  	} else if (inside_f(vco_freq_khz, 4337000, 4703000 - 1000)) {
4830fa96893226 Sandor Yu 2020-12-09  1123  		set_field_value(&vco_ring_select, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1124  		set_field_value(&cmnda_pll0_v2i_prog, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1125  		set_field_value(&cmnda_pll0_coarse_prog, 0x7);
4830fa96893226 Sandor Yu 2020-12-09  1126  		set_field_value(&cmnda_pll0_cp_gain, 0x58);
4830fa96893226 Sandor Yu 2020-12-09  1127  		set_field_value(&cmnda_pll0_const_ndac_cntrl, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1128  		set_field_value(&cmnda_pll0_const_pmos_cntrl, 0x8E);
4830fa96893226 Sandor Yu 2020-12-09  1129  		set_field_value(&cmnda_pll0_ptat_ndac_cntrl, 0x2F);
4830fa96893226 Sandor Yu 2020-12-09  1130  	} else if (inside_f(vco_freq_khz, 4703000, 5101000 - 1000)) {
4830fa96893226 Sandor Yu 2020-12-09  1131  		set_field_value(&vco_ring_select, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1132  		set_field_value(&cmnda_pll0_v2i_prog, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1133  		set_field_value(&cmnda_pll0_coarse_prog, 0x7);
4830fa96893226 Sandor Yu 2020-12-09  1134  		set_field_value(&cmnda_pll0_cp_gain, 0x54);
4830fa96893226 Sandor Yu 2020-12-09  1135  		set_field_value(&cmnda_pll0_const_ndac_cntrl, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1136  		set_field_value(&cmnda_pll0_const_pmos_cntrl, 0x04);
4830fa96893226 Sandor Yu 2020-12-09  1137  		set_field_value(&cmnda_pll0_ptat_ndac_cntrl, 0x0D);
4830fa96893226 Sandor Yu 2020-12-09  1138  	} else if (inside_f(vco_freq_khz, 5101000, 5532000 - 1000)) {
4830fa96893226 Sandor Yu 2020-12-09  1139  		set_field_value(&vco_ring_select, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1140  		set_field_value(&cmnda_pll0_v2i_prog, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1141  		set_field_value(&cmnda_pll0_coarse_prog, 0x7);
4830fa96893226 Sandor Yu 2020-12-09  1142  		set_field_value(&cmnda_pll0_cp_gain, 0x49);
4830fa96893226 Sandor Yu 2020-12-09  1143  		set_field_value(&cmnda_pll0_const_ndac_cntrl, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1144  		set_field_value(&cmnda_pll0_const_pmos_cntrl, 0x04);
4830fa96893226 Sandor Yu 2020-12-09  1145  		set_field_value(&cmnda_pll0_ptat_ndac_cntrl, 0x0D);
4830fa96893226 Sandor Yu 2020-12-09  1146  	} else if (inside_f(vco_freq_khz, 5532000, 6000000 - 1000)) {
4830fa96893226 Sandor Yu 2020-12-09  1147  		set_field_value(&vco_ring_select, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1148  		set_field_value(&cmnda_pll0_v2i_prog, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1149  		set_field_value(&cmnda_pll0_coarse_prog, 0x7);
4830fa96893226 Sandor Yu 2020-12-09  1150  		set_field_value(&cmnda_pll0_cp_gain, 0x3E);
4830fa96893226 Sandor Yu 2020-12-09  1151  		set_field_value(&cmnda_pll0_const_ndac_cntrl, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1152  		set_field_value(&cmnda_pll0_const_pmos_cntrl, 0x04);
4830fa96893226 Sandor Yu 2020-12-09  1153  		set_field_value(&cmnda_pll0_ptat_ndac_cntrl, 0x0D);
4830fa96893226 Sandor Yu 2020-12-09  1154  	} else {
4830fa96893226 Sandor Yu 2020-12-09  1155  		dev_err(&hdmirx->pdev->dev, "%s VCO frequency (%llu KHz) is out of range\n", __func__, vco_freq_khz);
4830fa96893226 Sandor Yu 2020-12-09  1156  		return -1;
4830fa96893226 Sandor Yu 2020-12-09  1157  	}
4830fa96893226 Sandor Yu 2020-12-09  1158  
4830fa96893226 Sandor Yu 2020-12-09  1159  	if (inside_f(vco_freq_khz, 3000000, 4000000)) {
4830fa96893226 Sandor Yu 2020-12-09  1160  		set_field_value(&rxda_pi_iq_bias_trim, 0x5);
4830fa96893226 Sandor Yu 2020-12-09  1161  		set_field_value(&rxda_pi_iq_pload_bias_trim, 0x2);
4830fa96893226 Sandor Yu 2020-12-09  1162  		set_field_value(&rxda_pi_iq_pload_trim, 0x3F);
4830fa96893226 Sandor Yu 2020-12-09  1163  		set_field_value(&rxda_pi_e_bias_trim, 0x5);
4830fa96893226 Sandor Yu 2020-12-09  1164  		set_field_value(&rxda_pi_e_pload_bias_trim, 0x2);
4830fa96893226 Sandor Yu 2020-12-09  1165  		set_field_value(&rxda_pi_e_pload_trim, 0x3F);
4830fa96893226 Sandor Yu 2020-12-09  1166  		set_field_value(&rxda_pi_range_sel, 0x2);
4830fa96893226 Sandor Yu 2020-12-09  1167  		set_field_value(&rxda_pi_cal_cm_trim, 0x00);
4830fa96893226 Sandor Yu 2020-12-09  1168  	} else if (inside_f(vco_freq_khz, 4000000, 6000000)) {
4830fa96893226 Sandor Yu 2020-12-09  1169  		set_field_value(&rxda_pi_iq_bias_trim, 0x5);
4830fa96893226 Sandor Yu 2020-12-09  1170  		set_field_value(&rxda_pi_iq_pload_bias_trim, 0x4);
4830fa96893226 Sandor Yu 2020-12-09  1171  		set_field_value(&rxda_pi_iq_pload_trim, 0x3F);
4830fa96893226 Sandor Yu 2020-12-09  1172  		set_field_value(&rxda_pi_e_bias_trim, 0x5);
4830fa96893226 Sandor Yu 2020-12-09  1173  		set_field_value(&rxda_pi_e_pload_bias_trim, 0x4);
4830fa96893226 Sandor Yu 2020-12-09  1174  		set_field_value(&rxda_pi_e_pload_trim, 0x3F);
4830fa96893226 Sandor Yu 2020-12-09  1175  		set_field_value(&rxda_pi_range_sel, 0x3);
4830fa96893226 Sandor Yu 2020-12-09  1176  		set_field_value(&rxda_pi_cal_cm_trim, 0x00);
4830fa96893226 Sandor Yu 2020-12-09  1177  	}
4830fa96893226 Sandor Yu 2020-12-09  1178  	set_field_value(&xcvr_pll_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1179  	set_field_value(&xcvr_link_reset_n, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1180  	set_field_value(&xcvr_power_state_req, 0x0);
4830fa96893226 Sandor Yu 2020-12-09  1181  	set_field_value(&iso_pma_cmn_pll0_clk_datart1_div, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1182  	set_field_value(&iso_pma_cmn_pll0_clk_datart0_div, 0x2);
4830fa96893226 Sandor Yu 2020-12-09  1183  	set_field_value(&iso_pma_cmn_pll0_clk_en, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1184  
4830fa96893226 Sandor Yu 2020-12-09  1185  	/*******************************************************
4830fa96893226 Sandor Yu 2020-12-09  1186  	* Register setting
4830fa96893226 Sandor Yu 2020-12-09  1187  	********************************************************/
4830fa96893226 Sandor Yu 2020-12-09  1188  
4830fa96893226 Sandor Yu 2020-12-09  1189  	/* CMN_DIAG_PLL0_INCLK_CTRL */
4830fa96893226 Sandor Yu 2020-12-09  1190  	reg_val = set_reg_value(cmnda_pll0_ip_div);
4830fa96893226 Sandor Yu 2020-12-09  1191  	reg_val |= set_reg_value(cmnda_pll0_hs_sym_div_sel);
4830fa96893226 Sandor Yu 2020-12-09  1192  	write16(hdmirx, CMN_DIAG_PLL0_INCLK_CTRL_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1193  
4830fa96893226 Sandor Yu 2020-12-09  1194  	/* CMN_DIAG_PLL0_FBH_OVRD */
4830fa96893226 Sandor Yu 2020-12-09  1195  	reg_val = set_reg_value(cmn_pll0_fb_div_high_ovrd_en);
4830fa96893226 Sandor Yu 2020-12-09  1196  	reg_val |= set_reg_value(cmnda_pll0_fb_div_high_out);
4830fa96893226 Sandor Yu 2020-12-09  1197  	write16(hdmirx, CMN_DIAG_PLL0_FBH_OVRD_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1198  
4830fa96893226 Sandor Yu 2020-12-09  1199  	/* CMN_DIAG_PLL0_FBL_OVRD */
4830fa96893226 Sandor Yu 2020-12-09  1200  	reg_val = set_reg_value(cmn_pll0_fb_div_low_ovrd_en);
4830fa96893226 Sandor Yu 2020-12-09  1201  	reg_val |= set_reg_value(cmnda_pll0_fb_div_low_out);
4830fa96893226 Sandor Yu 2020-12-09  1202  	write16(hdmirx, CMN_DIAG_PLL0_FBL_OVRD_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1203  
4830fa96893226 Sandor Yu 2020-12-09  1204  	/* CMN_PLL0_DIV2SEL_OSR_CTRL */
4830fa96893226 Sandor Yu 2020-12-09  1205  	reg_val = set_reg_value(cmn_pll_clk_osr);
4830fa96893226 Sandor Yu 2020-12-09  1206  	reg_val |= set_reg_value(cmn_pll_clk_div2_ratio);
4830fa96893226 Sandor Yu 2020-12-09  1207  	reg_val |= set_reg_value(cmn_pll_clk_div2_sel);
4830fa96893226 Sandor Yu 2020-12-09  1208  	write16(hdmirx, CMN_PLL0_DIV2SEL_OSR_CTRL_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1209  
4830fa96893226 Sandor Yu 2020-12-09  1210  	/* RX_DIAG_SMPLR_OSR */
4830fa96893226 Sandor Yu 2020-12-09  1211  	reg_val = set_reg_value(rx_diag_smplr_osr);
4830fa96893226 Sandor Yu 2020-12-09  1212  	multi_write16(hdmirx, RX_DIAG_SMPLR_OSR_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1213  
4830fa96893226 Sandor Yu 2020-12-09  1214  	/* RX_PSC_A0 */
4830fa96893226 Sandor Yu 2020-12-09  1215  	reg_val = set_reg_value(rx_psc_a0);
4830fa96893226 Sandor Yu 2020-12-09  1216  	multi_write16(hdmirx, RX_PSC_A0_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1217  
4830fa96893226 Sandor Yu 2020-12-09  1218  	/* RX_REE_PERGCSM_EQENM_PH1 */
4830fa96893226 Sandor Yu 2020-12-09  1219  	reg_val = set_reg_value(rx_ree_pergcsm_eqenm_ph1);
4830fa96893226 Sandor Yu 2020-12-09  1220  	multi_write16(hdmirx, RX_REE_PERGCSM_EQENM_PH1_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1221  
4830fa96893226 Sandor Yu 2020-12-09  1222  	/* RX_REE_PERGCSM_EQENM_PH1 */
4830fa96893226 Sandor Yu 2020-12-09  1223  	reg_val = set_reg_value(rx_ree_pergcsm_eqenm_ph2);
4830fa96893226 Sandor Yu 2020-12-09  1224  	multi_write16(hdmirx, RX_REE_PERGCSM_EQENM_PH2_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1225  
4830fa96893226 Sandor Yu 2020-12-09  1226  	/* RX_REE_VGA_GAIN_OVRD */
4830fa96893226 Sandor Yu 2020-12-09  1227  	reg_val = set_reg_value(vga_gain_accum_override_en);
4830fa96893226 Sandor Yu 2020-12-09  1228  	reg_val |= set_reg_value(vga_gain_accum_override);
4830fa96893226 Sandor Yu 2020-12-09  1229  	reg_val |= set_reg_value(vga_gain_tgt_adj_override_en);
4830fa96893226 Sandor Yu 2020-12-09  1230  	reg_val |= set_reg_value(vga_gain_tgt_adj_override);
4830fa96893226 Sandor Yu 2020-12-09  1231  	multi_write16(hdmirx, RX_REE_VGA_GAIN_OVRD_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1232  
4830fa96893226 Sandor Yu 2020-12-09  1233  	/* RX_REE_SMGM_CTRL1 */
4830fa96893226 Sandor Yu 2020-12-09  1234  	reg_val = set_reg_value(ree_gen_sm_en_usb);
4830fa96893226 Sandor Yu 2020-12-09  1235  	reg_val |= set_reg_value(ree_gen_sm_en_periodic);
4830fa96893226 Sandor Yu 2020-12-09  1236  	reg_val |= set_reg_value(ana_en_epath_gen_ctrl_sm_usb);
4830fa96893226 Sandor Yu 2020-12-09  1237  	reg_val |= set_reg_value(ana_en_epath_gen_ctrl_sm_periodic);
4830fa96893226 Sandor Yu 2020-12-09  1238  	multi_write16(hdmirx, RX_REE_SMGM_CTRL1_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1239  
4830fa96893226 Sandor Yu 2020-12-09  1240  	/* RX_DIAG_DFE_CTRL2 */
4830fa96893226 Sandor Yu 2020-12-09  1241  	reg_val = set_reg_value(rxda_eq_range_sel);
4830fa96893226 Sandor Yu 2020-12-09  1242  	reg_val |= set_reg_value(rxda_vga_sa_range_sel);
4830fa96893226 Sandor Yu 2020-12-09  1243  	multi_write16(hdmirx, RX_DIAG_DFE_CTRL2_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1244  
4830fa96893226 Sandor Yu 2020-12-09  1245  	/* CMN_PLLSM0_USER_DEF_CTRL */
4830fa96893226 Sandor Yu 2020-12-09  1246  	reg_val = set_reg_value(vco_ring_select);
4830fa96893226 Sandor Yu 2020-12-09  1247  	write16(hdmirx, CMN_PLLSM0_USER_DEF_CTRL_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1248  
4830fa96893226 Sandor Yu 2020-12-09  1249  	/* CMN_DIAG_PLL0_V2I_TUNE */
4830fa96893226 Sandor Yu 2020-12-09  1250  	reg_val = set_reg_value(cmnda_pll0_v2i_prog);
4830fa96893226 Sandor Yu 2020-12-09  1251  	reg_val |= set_reg_value(cmnda_pll0_coarse_prog);
4830fa96893226 Sandor Yu 2020-12-09  1252  	write16(hdmirx, CMN_DIAG_PLL0_V2I_TUNE_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1253  
4830fa96893226 Sandor Yu 2020-12-09  1254  	/* CMN_DIAG_PLL0_CP_TUNE */
4830fa96893226 Sandor Yu 2020-12-09  1255  	reg_val = set_reg_value(cmnda_pll0_cp_gain);
4830fa96893226 Sandor Yu 2020-12-09  1256  	write16(hdmirx, CMN_DIAG_PLL0_CP_TUNE_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1257  
4830fa96893226 Sandor Yu 2020-12-09  1258  	/* CMN_DIAG_PLL0_PTATIS_TUNE1 */
4830fa96893226 Sandor Yu 2020-12-09  1259  	reg_val = set_reg_value(cmnda_pll0_const_ndac_cntrl);
4830fa96893226 Sandor Yu 2020-12-09  1260  	reg_val |= set_reg_value(cmnda_pll0_const_pmos_cntrl);
4830fa96893226 Sandor Yu 2020-12-09  1261  	write16(hdmirx, CMN_DIAG_PLL0_PTATIS_TUNE1_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1262  
4830fa96893226 Sandor Yu 2020-12-09  1263  	/* CMN_DIAG_PLL0_PTATIS_TUNE2 */
4830fa96893226 Sandor Yu 2020-12-09  1264  	reg_val = set_reg_value(cmnda_pll0_ptat_ndac_cntrl);
4830fa96893226 Sandor Yu 2020-12-09  1265  	write16(hdmirx, CMN_DIAG_PLL0_PTATIS_TUNE2_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1266  
4830fa96893226 Sandor Yu 2020-12-09  1267  	/* RX_DIAG_ILL_IQ_TRIM0 */
4830fa96893226 Sandor Yu 2020-12-09  1268  	reg_val = set_reg_value(rxda_pi_iq_bias_trim);
4830fa96893226 Sandor Yu 2020-12-09  1269  	reg_val |= set_reg_value(rxda_pi_iq_pload_bias_trim);
4830fa96893226 Sandor Yu 2020-12-09  1270  	reg_val |= set_reg_value(rxda_pi_iq_pload_trim);
4830fa96893226 Sandor Yu 2020-12-09  1271  	write16(hdmirx, RX_DIAG_ILL_IQ_TRIM0_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1272  
4830fa96893226 Sandor Yu 2020-12-09  1273  	/* RX_DIAG_ILL_E_TRIM0 */
4830fa96893226 Sandor Yu 2020-12-09  1274  	reg_val = set_reg_value(rxda_pi_e_bias_trim);
4830fa96893226 Sandor Yu 2020-12-09  1275  	reg_val |= set_reg_value(rxda_pi_e_pload_bias_trim);
4830fa96893226 Sandor Yu 2020-12-09  1276  	reg_val |= set_reg_value(rxda_pi_e_pload_trim);
4830fa96893226 Sandor Yu 2020-12-09  1277  	write16(hdmirx, RX_DIAG_ILL_E_TRIM0_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1278  
4830fa96893226 Sandor Yu 2020-12-09  1279  	/* RX_DIAG_ILL_IQE_TRIM2 */
4830fa96893226 Sandor Yu 2020-12-09  1280  	reg_val = set_reg_value(rxda_pi_range_sel);
4830fa96893226 Sandor Yu 2020-12-09  1281  	reg_val |= set_reg_value(rxda_pi_cal_cm_trim);
4830fa96893226 Sandor Yu 2020-12-09  1282  	write16(hdmirx, RX_DIAG_ILL_IQE_TRIM2_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1283  
4830fa96893226 Sandor Yu 2020-12-09  1284  	/* Enable PLL */
4830fa96893226 Sandor Yu 2020-12-09  1285  	/* PHY_MODE_CTL */
4830fa96893226 Sandor Yu 2020-12-09  1286  	reg_val = set_reg_value(xcvr_pll_en);
4830fa96893226 Sandor Yu 2020-12-09  1287  	reg_val |= set_reg_value(xcvr_link_reset_n);
4830fa96893226 Sandor Yu 2020-12-09  1288  	reg_val |= set_reg_value(xcvr_power_state_req);
4830fa96893226 Sandor Yu 2020-12-09  1289  	write16(hdmirx, PHY_MODE_CTL_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1290  
4830fa96893226 Sandor Yu 2020-12-09  1291  	/* Wait for PLL0 ready: */
4830fa96893226 Sandor Yu 2020-12-09  1292  	/* PHY_PMA_CMN_CTRL2 */
4830fa96893226 Sandor Yu 2020-12-09  1293  	do {
4830fa96893226 Sandor Yu 2020-12-09  1294  		if (ktime_after(ktime_get(), timeout))
4830fa96893226 Sandor Yu 2020-12-09  1295  			goto timeout_err;
4830fa96893226 Sandor Yu 2020-12-09  1296  		udelay(10);
4830fa96893226 Sandor Yu 2020-12-09  1297  	} while ((read16(hdmirx, PHY_PMA_CMN_CTRL2_ADDR) & (1 << 0)) == 0);
4830fa96893226 Sandor Yu 2020-12-09  1298  
4830fa96893226 Sandor Yu 2020-12-09  1299  	/* Turn on output clocks: */
4830fa96893226 Sandor Yu 2020-12-09  1300  	/* PHY_PMA_CMN_CTRL2 */
4830fa96893226 Sandor Yu 2020-12-09  1301  	reg_val = set_reg_value(iso_pma_cmn_pll0_clk_datart1_div);
4830fa96893226 Sandor Yu 2020-12-09  1302  	reg_val |= set_reg_value(iso_pma_cmn_pll0_clk_datart0_div);
4830fa96893226 Sandor Yu 2020-12-09  1303  	reg_val |= set_reg_value(iso_pma_cmn_pll0_clk_en);
4830fa96893226 Sandor Yu 2020-12-09  1304  	write16(hdmirx, PHY_PMA_CMN_CTRL2_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1305  
4830fa96893226 Sandor Yu 2020-12-09  1306  	dev_dbg(&hdmirx->pdev->dev, "pma_pll_config() Disable Rx Eq Training\n");
4830fa96893226 Sandor Yu 2020-12-09  1307  	for (i = 0; i < 3; i++) {
4830fa96893226 Sandor Yu 2020-12-09  1308  		reg_val =
4830fa96893226 Sandor Yu 2020-12-09  1309  		    read16(hdmirx, PHY_PMA_XCVR_CTRL_ADDR | (i << 6));
4830fa96893226 Sandor Yu 2020-12-09  1310  		reg_val &= 0xFFEF;
4830fa96893226 Sandor Yu 2020-12-09  1311  		write16(hdmirx, PHY_PMA_XCVR_CTRL_ADDR | (i << 6), reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1312  	}
4830fa96893226 Sandor Yu 2020-12-09  1313  
4830fa96893226 Sandor Yu 2020-12-09  1314  	/* Get current power state: */
4830fa96893226 Sandor Yu 2020-12-09  1315  	/* PHY_MODE_CTL */
4830fa96893226 Sandor Yu 2020-12-09  1316  	reg_val = read16(hdmirx, PHY_MODE_CTL_ADDR);
4830fa96893226 Sandor Yu 2020-12-09  1317  	dev_dbg(&hdmirx->pdev->dev, "pma_pll_config() PHY_MODE_CTL: 0x%04X\n", reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1318  
4830fa96893226 Sandor Yu 2020-12-09  1319  	reg_val &= 0x00F0;
4830fa96893226 Sandor Yu 2020-12-09  1320  	dev_dbg(&hdmirx->pdev->dev, "pma_pll_config() Current power state: 0x%02X\n", (reg_val >> 4));
4830fa96893226 Sandor Yu 2020-12-09  1321  
4830fa96893226 Sandor Yu 2020-12-09  1322  	/* Deassert link reset: */
4830fa96893226 Sandor Yu 2020-12-09  1323  	/* PHY_MODE_CTL */
4830fa96893226 Sandor Yu 2020-12-09  1324  	dev_dbg(&hdmirx->pdev->dev, "pma_pll_config() Deassert link reset\n");
4830fa96893226 Sandor Yu 2020-12-09  1325  	set_field_value(&xcvr_link_reset_n, 0x1);
4830fa96893226 Sandor Yu 2020-12-09  1326  	reg_val |= set_reg_value(xcvr_pll_en);
4830fa96893226 Sandor Yu 2020-12-09  1327  	reg_val |= set_reg_value(xcvr_link_reset_n);
4830fa96893226 Sandor Yu 2020-12-09  1328  	write16(hdmirx, PHY_MODE_CTL_ADDR, reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1329  
4830fa96893226 Sandor Yu 2020-12-09  1330  	/* Wait for xcvr_psm_ready for all the lanes */
4830fa96893226 Sandor Yu 2020-12-09  1331  	loop = 0;
4830fa96893226 Sandor Yu 2020-12-09  1332  	do {
4830fa96893226 Sandor Yu 2020-12-09  1333  		reg_val = (1 << 13);
4830fa96893226 Sandor Yu 2020-12-09  1334  		if (ktime_after(ktime_get(), timeout))
4830fa96893226 Sandor Yu 2020-12-09  1335  			goto timeout_err;
4830fa96893226 Sandor Yu 2020-12-09  1336  
4830fa96893226 Sandor Yu 2020-12-09  1337  		for (i = 0; i < 3; i++) {
4830fa96893226 Sandor Yu 2020-12-09  1338  			reg_val &= read16(hdmirx, PHY_PMA_XCVR_CTRL_ADDR | (i << 6)) & (1 << 13);
4830fa96893226 Sandor Yu 2020-12-09  1339  			dev_dbg(&hdmirx->pdev->dev, "pma_pll_config() xcvr_psm_ready(%0d): 0x%0X\n", i, reg_val >> 13);
4830fa96893226 Sandor Yu 2020-12-09  1340  		}
4830fa96893226 Sandor Yu 2020-12-09  1341  	} while (!reg_val && loop < 20);
4830fa96893226 Sandor Yu 2020-12-09  1342  
4830fa96893226 Sandor Yu 2020-12-09  1343  	/* Set A0 power state: */
4830fa96893226 Sandor Yu 2020-12-09  1344  	/* PHY_MODE_CTL */
4830fa96893226 Sandor Yu 2020-12-09  1345  	if (pma_power_state_chng(hdmirx, 0x1))
4830fa96893226 Sandor Yu 2020-12-09  1346  		goto timeout_err;
4830fa96893226 Sandor Yu 2020-12-09  1347  
4830fa96893226 Sandor Yu 2020-12-09  1348  	dev_dbg(&hdmirx->pdev->dev, "pma_pll_config() Enable Rx Eq Training\n");
4830fa96893226 Sandor Yu 2020-12-09  1349  	for (i = 0; i < 3; i++) {
4830fa96893226 Sandor Yu 2020-12-09  1350  		reg_val =
4830fa96893226 Sandor Yu 2020-12-09  1351  		    read16(hdmirx, PHY_PMA_XCVR_CTRL_ADDR | (i << 6));
4830fa96893226 Sandor Yu 2020-12-09  1352  		reg_val |= 0x0010;
4830fa96893226 Sandor Yu 2020-12-09  1353  		write16(hdmirx, PHY_PMA_XCVR_CTRL_ADDR | (i << 6), reg_val);
4830fa96893226 Sandor Yu 2020-12-09  1354  	}
4830fa96893226 Sandor Yu 2020-12-09  1355  
4830fa96893226 Sandor Yu 2020-12-09  1356  	return 0;
4830fa96893226 Sandor Yu 2020-12-09  1357  
4830fa96893226 Sandor Yu 2020-12-09  1358  timeout_err:
4830fa96893226 Sandor Yu 2020-12-09  1359  	dev_err(&hdmirx->pdev->dev, "pma_pll_config() Timeout error!\n");
4830fa96893226 Sandor Yu 2020-12-09  1360  	return -1;
4830fa96893226 Sandor Yu 2020-12-09  1361  
4830fa96893226 Sandor Yu 2020-12-09 @1362  }
4830fa96893226 Sandor Yu 2020-12-09  1363  

:::::: The code at line 1362 was first introduced by commit
:::::: 4830fa96893226afb8f79e763acef0fa8197fd9b MLK-24081-06: staging: media: imx: Add hdmi rx driver

:::::: TO: Sandor Yu <Sandor.yu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
