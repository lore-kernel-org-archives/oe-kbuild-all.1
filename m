Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351F23C872A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 19:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776715186; cv=none; b=JdsT6thxwt5TNLz1eebO5J4iCR02YuliwcaBusyw3wX2H1yJ+2Nzoas+SOnzrmCL4Ok8s31FvZnG6hHXBrrOZ3RtlL/IGvagGVK9Ly+86TzkT8e+ewxsOW44h4R8TsKKp4moNhWAoM5Rrn+YtEQRYt9y6EhlWTSSXMaupoJdBPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776715186; c=relaxed/simple;
	bh=p9TvV7x5IXflsxaF8pn4mvVQ1YosUoixdVCaxHya8Rk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AfhAlOXdwk6rd7XkM7diSkTvDkm++lR/KYCduNg1gnzuRrZM0P3ggoDClRQElkPk7sjub61Nsyp+ga0Ag/jlSNVyrYRLKPrYW1SF86kMBvPGedfOp8P1ZcUccVlNhuKRwcRAAn6hJHYx+QCQm6bZgynma/msnvzt1pwDwt1kc+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJgUbKWP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJgUbKWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776715184; x=1808251184;
  h=date:from:to:cc:subject:message-id;
  bh=p9TvV7x5IXflsxaF8pn4mvVQ1YosUoixdVCaxHya8Rk=;
  b=PJgUbKWPzn8Jdnhm6W45UwMxJ+RPPt6rF+9wxfdNrFRfqtft71OC2iBR
   6Y8dQ7UdtCQbZ213VFwwfpQOL1WoIiRMp4MovtJQ6jO9bVy4dgVpD9bLm
   TreZNDMSJjp6qLszDLyK7oFqFWNduOO2j6R4FmUrDZkvWrIGAXOOWD9gg
   mtM+xGannhwaTX7KEJAe5Vho18x/MgIUOBdWOvKZW2Guqt2gr+9PVQV7N
   hzspXh9gLzvdMweycmR9Px80cg3iGS21k7kQvzgZFNVm+2Is01FjWaNQY
   rDjYQpC8K5RVioheoSPIv456FpHm6g4jBB6BLvXM6hn8bUU/xWU6/n/dR
   w==;
X-CSE-ConnectionGUID: BYKl9L7GQ4W3iuNvVZYDmA==
X-CSE-MsgGUID: 1MV2LvxxQUOZpBaOQB6gOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77552744"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="77552744"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 12:59:41 -0700
X-CSE-ConnectionGUID: pFtrI6kbTAuBo2U4hYNsvw==
X-CSE-MsgGUID: qQHcuKT+S+qwY//yo0vSeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="236804855"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Apr 2026 12:59:40 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEumP-000000002og-111t;
	Mon, 20 Apr 2026 19:59:37 +0000
Date: Tue, 21 Apr 2026 03:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
Cc: oe-kbuild-all@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>
Subject: [dinguyen:socfpga_sdhc_v2 6/7]
 drivers/mmc/host/sdhci-cadence6.c:762:16: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202604210357.bTNEhW54-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_sdhc_v2
head:   974099b9e02f16aac84a51eb58fa25523e9d2319
commit: 497f87d1c1cc1e533e7067ee845b7a58539930a3 [6/7] mmc: sdhci-cadence: add Cadence SD6HC support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260421/202604210357.bTNEhW54-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604210357.bTNEhW54-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604210357.bTNEhW54-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mmc/host/sdhci-cadence6.c: In function 'sdhci_cdns6_phy_init':
>> drivers/mmc/host/sdhci-cadence6.c:762:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     762 |         reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DQS_TIMING_USE_EXT_LPBK_DQS,
         |                ^~~~~~~~~~


vim +/FIELD_PREP +762 drivers/mmc/host/sdhci-cadence6.c

   748	
   749	int sdhci_cdns6_phy_init(struct sdhci_cdns_priv *priv)
   750	{
   751		int ret;
   752		u32 reg;
   753		struct sdhci_cdns6_phy *phy = priv->phy;
   754	
   755		sdhci_cdns6_dll_reset(priv, true);
   756	
   757		reg = sdhci_cdns6_read_phy_reg(priv, SDHCI_CDNS6_PHY_DQS_TIMING_REG);
   758		reg &= ~SDHCI_CDNS6_PHY_DQS_TIMING_USE_EXT_LPBK_DQS;
   759		reg &= ~SDHCI_CDNS6_PHY_DQS_TIMING_USE_LPBK_DQS;
   760		reg &= ~SDHCI_CDNS6_PHY_DQS_TIMING_USE_PHONY_DQS;
   761		reg &= ~SDHCI_CDNS6_PHY_DQS_TIMING_USE_PHONY_DQS_CMD;
 > 762		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DQS_TIMING_USE_EXT_LPBK_DQS,
   763				phy->cp_use_ext_lpbk_dqs);
   764		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DQS_TIMING_USE_LPBK_DQS,
   765				phy->cp_use_lpbk_dqs);
   766		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DQS_TIMING_USE_PHONY_DQS,
   767				  phy->cp_use_phony_dqs);
   768		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DQS_TIMING_USE_PHONY_DQS_CMD,
   769				  phy->cp_use_phony_dqs_cmd);
   770		sdhci_cdns6_write_phy_reg(priv, SDHCI_CDNS6_PHY_DQS_TIMING_REG, reg);
   771	
   772		reg = sdhci_cdns6_read_phy_reg(priv, SDHCI_CDNS6_PHY_GATE_LPBK_CTRL_REG);
   773		reg &= ~SDHCI_CDNS6_PHY_GATE_LPBK_CTRL_SYNC_METHOD;
   774		reg &= ~SDHCI_CDNS6_PHY_GATE_LPBK_CTRL_SW_HALF_CYCLE_SHIFT;
   775		reg &= ~SDHCI_CDNS6_PHY_GATE_LPBK_CTRL_RD_DEL_SEL;
   776		reg &= ~SDHCI_CDNS6_PHY_GATE_LPBK_CTRL_UNDERRUN_SUPPRESS;
   777		reg &= ~SDHCI_CDNS6_PHY_GATE_LPBK_CTRL_GATE_CFG_ALWAYS_ON;
   778		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_GATE_LPBK_CTRL_SYNC_METHOD,
   779				phy->cp_sync_method);
   780		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_GATE_LPBK_CTRL_SW_HALF_CYCLE_SHIFT,
   781				phy->cp_sw_half_cycle_shift);
   782		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_GATE_LPBK_CTRL_RD_DEL_SEL,
   783				phy->cp_rd_del_sel);
   784		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_GATE_LPBK_CTRL_UNDERRUN_SUPPRESS,
   785				phy->cp_underrun_suppress);
   786		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_GATE_LPBK_CTRL_GATE_CFG_ALWAYS_ON,
   787				phy->cp_gate_cfg_always_on);
   788		sdhci_cdns6_write_phy_reg(priv, SDHCI_CDNS6_PHY_GATE_LPBK_CTRL_REG, reg);
   789	
   790		reg = FIELD_PREP(SDHCI_CDNS6_PHY_DLL_MASTER_CTRL_BYPASS_MODE,
   791				 phy->cp_dll_bypass_mode);
   792		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DLL_MASTER_CTRL_PHASE_DETECT_SEL, 2);
   793		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DLL_MASTER_CTRL_DLL_LOCK_NUM, 0);
   794		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DLL_MASTER_CTRL_DLL_START_POINT,
   795				phy->cp_dll_start_point);
   796		sdhci_cdns6_write_phy_reg(priv, SDHCI_CDNS6_PHY_DLL_MASTER_CTRL_REG, reg);
   797	
   798		reg = FIELD_PREP(SDHCI_CDNS6_PHY_DLL_SLAVE_CTRL_READ_DQS_CMD_DELAY,
   799				 phy->cp_read_dqs_cmd_delay);
   800		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DLL_SLAVE_CTRL_CLK_WRDQS_DELAY,
   801				  phy->cp_clk_wrdqs_delay);
   802		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DLL_SLAVE_CTRL_CLK_WR_DELAY,
   803				  phy->cp_clk_wr_delay);
   804		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DLL_SLAVE_CTRL_READ_DQS_DELAY,
   805				  phy->cp_read_dqs_delay);
   806		sdhci_cdns6_write_phy_reg(priv, SDHCI_CDNS6_PHY_DLL_SLAVE_CTRL_REG, reg);
   807	
   808		reg = sdhci_cdns6_read_phy_reg(priv, SDHCI_CDNS6_PHY_CTRL_REG);
   809		reg &= ~SDHCI_CDNS6_PHY_CTRL_PHONY_DQS_TIMING;
   810		sdhci_cdns6_write_phy_reg(priv, SDHCI_CDNS6_PHY_CTRL_REG, reg);
   811	
   812		smp_wmb(); /* drain writebuffer */
   813	
   814		ret = sdhci_cdns6_dll_reset(priv, false);
   815		if (ret)
   816			return ret;
   817	
   818		reg = sdhci_cdns6_read_phy_reg(priv, SDHCI_CDNS6_PHY_DQ_TIMING_REG);
   819		reg &= ~SDHCI_CDNS6_PHY_DQ_TIMING_IO_MASK_ALWAYS_ON;
   820		reg &= ~SDHCI_CDNS6_PHY_DQ_TIMING_IO_MASK_END;
   821		reg &= ~SDHCI_CDNS6_PHY_DQ_TIMING_IO_MASK_START;
   822		reg &= ~SDHCI_CDNS6_PHY_DQ_TIMING_DATA_SELECT_OE_END;
   823		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DQ_TIMING_IO_MASK_ALWAYS_ON,
   824				phy->cp_io_mask_always_on);
   825		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DQ_TIMING_IO_MASK_END,
   826				  phy->cp_io_mask_end);
   827		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DQ_TIMING_IO_MASK_START,
   828				  phy->cp_io_mask_start);
   829		reg |= FIELD_PREP(SDHCI_CDNS6_PHY_DQ_TIMING_DATA_SELECT_OE_END,
   830				phy->cp_data_select_oe_end);
   831		sdhci_cdns6_write_phy_reg(priv, SDHCI_CDNS6_PHY_DQ_TIMING_REG, reg);
   832	
   833		smp_wmb(); /* drain writebuffer */
   834	
   835		reg = readl(priv->hrs_addr + SDHCI_CDNS_HRS09);
   836		if (phy->sdhc_extended_wr_mode)
   837			reg |= SDHCI_CDNS_HRS09_EXTENDED_WR_MODE;
   838		else
   839			reg &= ~SDHCI_CDNS_HRS09_EXTENDED_WR_MODE;
   840	
   841		if (phy->sdhc_extended_rd_mode)
   842			reg |= SDHCI_CDNS_HRS09_EXTENDED_RD_MODE;
   843		else
   844			reg &= ~SDHCI_CDNS_HRS09_EXTENDED_RD_MODE;
   845	
   846		if (phy->sdhc_rddata_en)
   847			reg |= SDHCI_CDNS_HRS09_RDDATA_EN;
   848		else
   849			reg &= ~SDHCI_CDNS_HRS09_RDDATA_EN;
   850	
   851		if (phy->sdhc_rdcmd_en)
   852			reg |= SDHCI_CDNS_HRS09_RDCMD_EN;
   853		else
   854			reg &= ~SDHCI_CDNS_HRS09_RDCMD_EN;
   855	
   856		writel(reg, priv->hrs_addr + SDHCI_CDNS_HRS09);
   857	
   858		reg = FIELD_PREP(SDHCI_CDNS_HRS10_HCSDCLKADJ, phy->sdhc_hcsdclkadj);
   859		writel(reg, priv->hrs_addr + SDHCI_CDNS_HRS10);
   860	
   861		reg = FIELD_PREP(SDHCI_CDNS_HRS16_WRDATA1_SDCLK_DLY,
   862				 phy->sdhc_wrdata1_sdclk_dly);
   863		reg |= FIELD_PREP(SDHCI_CDNS_HRS16_WRDATA0_SDCLK_DLY,
   864				  phy->sdhc_wrdata0_sdclk_dly);
   865		reg |= FIELD_PREP(SDHCI_CDNS_HRS16_WRCMD1_SDCLK_DLY,
   866				  phy->sdhc_wrcmd1_sdclk_dly);
   867		reg |= FIELD_PREP(SDHCI_CDNS_HRS16_WRCMD0_SDCLK_DLY,
   868				  phy->sdhc_wrcmd0_sdclk_dly);
   869		reg |= FIELD_PREP(SDHCI_CDNS_HRS16_WRDATA1_DLY,
   870				  phy->sdhc_wrdata1_dly);
   871		reg |= FIELD_PREP(SDHCI_CDNS_HRS16_WRDATA0_DLY,
   872				  phy->sdhc_wrdata0_dly);
   873		reg |= FIELD_PREP(SDHCI_CDNS_HRS16_WRCMD1_DLY,
   874				  phy->sdhc_wrcmd1_dly);
   875		reg |= FIELD_PREP(SDHCI_CDNS_HRS16_WRCMD0_DLY,
   876				  phy->sdhc_wrcmd0_dly);
   877		writel(reg, priv->hrs_addr + SDHCI_CDNS_HRS16);
   878	
   879		reg = FIELD_PREP(SDHCI_CDNS_HRS07_RW_COMPENSATE,
   880				 phy->sdhc_rw_compensate);
   881		reg |= FIELD_PREP(SDHCI_CDNS_HRS07_IDELAY_VAL,
   882				  phy->sdhc_idelay_val);
   883		writel(reg, priv->hrs_addr + SDHCI_CDNS_HRS07);
   884	
   885		/* Allow 5ms for clock and PHY signals to stabilize after configuration */
   886		usleep_range(5000, 5500);
   887	
   888		return 0;
   889	}
   890	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
