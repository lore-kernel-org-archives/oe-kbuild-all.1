Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C2CD517
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 02:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714445770; cv=none; b=ftN5jTCy8e0ngWU6AXwDrngF/U43boT2qPMDDI0/cJa+kRNRvPKDJ+2HTOQV3VOLpboxG9DSOPG/Bg2/5tgdnGmxhbvs9fmB+9Qtd/M4fsRDVqGePZuawMeMVEwQ/Dntm+6C/R8H+qdbA21J72Xdn9Rcn7JTv5KagPI0mii7xbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714445770; c=relaxed/simple;
	bh=9tpPNE43X6wrILSUTTB6NWADosqHCNwp2ftqWwj6VFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MszJvtuo7CiDCiO+rFoT23fl09dLVirl8GqHnuT+1zbGY48zAWVC12q3w83crJcJo6k1qQcNbN1WQi0QBeCRJh9GXsbNrwsJdawMPgVNuHjCm5HOR+0X4Qash5Grs3otns55Us+44EQXRfyNZ4eD6xaSGP0VoaXGeiAetpOYjiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nru/hqgi; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nru/hqgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714445768; x=1745981768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9tpPNE43X6wrILSUTTB6NWADosqHCNwp2ftqWwj6VFY=;
  b=nru/hqgiYTJAymRO4P+HDMIn7vRzoyg83y3+sE0uPhPhfxyF9+1VTE+g
   MKN3cVxc50CE9paVu+oCAtvYoRHTpjavqBbA+EeXjqURWydhah5VpBicp
   kO9llBUyjYslZx4+/ygCfCzMr2rec1htnSvpL7/k89XH4xyEgy2CmIqwl
   y2F7vbvew7ZXtcb7PYNw9U3iDoSkNXtBMi05Ehvw/urlMxzBCr7JYj2q4
   xDRn3Hnwox3ib/HcJ4zmI0agokksCCUcqrE7+aq1Y0+F3Md9W1JzxE/cG
   Ek0DjKWH05BU7DFPdDZKWfhhFakFDXynYnKWopeVfnXc0e6hOFE08FjVC
   Q==;
X-CSE-ConnectionGUID: d3jrsqC8RxO0qqaQWjmdjA==
X-CSE-MsgGUID: p+2rSpLiQXC2KhrWNT4c3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13061530"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="13061530"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 19:56:07 -0700
X-CSE-ConnectionGUID: eSlSEheMQ5aqzP+PJi7UPA==
X-CSE-MsgGUID: AhJ5iLU2Q/ukbLMLXCe6oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="31108052"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Apr 2024 19:56:06 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1df2-0007eK-11;
	Tue, 30 Apr 2024 02:56:04 +0000
Date: Tue, 30 Apr 2024 10:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5908/11728]
 drivers/mmc/host/sdhci-esdhc-imx.c:1614:13: warning:
 'sdhc_esdhc_tuning_restore' defined but not used
Message-ID: <202404301029.pnh51KTi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: d375f90163a479979df3e3e9606c15bf77c1f3e4 [5908/11728] Merge branch 'sdhc/next' into next
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240430/202404301029.pnh51KTi-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301029.pnh51KTi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301029.pnh51KTi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-esdhc-imx.c:1614:13: warning: 'sdhc_esdhc_tuning_restore' defined but not used [-Wunused-function]
    1614 | static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/sdhci-esdhc-imx.c:1591:13: warning: 'sdhc_esdhc_tuning_save' defined but not used [-Wunused-function]
    1591 | static void sdhc_esdhc_tuning_save(struct sdhci_host *host)
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/sdhc_esdhc_tuning_restore +1614 drivers/mmc/host/sdhci-esdhc-imx.c

f3f5cf3dfc3a1b Dong Aisheng 2016-07-12  1590  
2f466a57a66f8d Haibo Chen   2023-11-10 @1591  static void sdhc_esdhc_tuning_save(struct sdhci_host *host)
2f466a57a66f8d Haibo Chen   2023-11-10  1592  {
2f466a57a66f8d Haibo Chen   2023-11-10  1593  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
2f466a57a66f8d Haibo Chen   2023-11-10  1594  	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
2f466a57a66f8d Haibo Chen   2023-11-10  1595  	u32 reg;
2f466a57a66f8d Haibo Chen   2023-11-10  1596  
2f466a57a66f8d Haibo Chen   2023-11-10  1597  	/*
2f466a57a66f8d Haibo Chen   2023-11-10  1598  	 * SD/eMMC do not need this tuning save because it will re-init
2f466a57a66f8d Haibo Chen   2023-11-10  1599  	 * after system resume back.
2f466a57a66f8d Haibo Chen   2023-11-10  1600  	 * Here save the tuning delay value for SDIO device since it may
2f466a57a66f8d Haibo Chen   2023-11-10  1601  	 * keep power during system PM. And for usdhc, only SDR50 and
2f466a57a66f8d Haibo Chen   2023-11-10  1602  	 * SDR104 mode for SDIO devide need to do tuning, and need to
2f466a57a66f8d Haibo Chen   2023-11-10  1603  	 * save/restore.
2f466a57a66f8d Haibo Chen   2023-11-10  1604  	 */
2f466a57a66f8d Haibo Chen   2023-11-10  1605  	if ((host->timing == MMC_TIMING_UHS_SDR50) |
2f466a57a66f8d Haibo Chen   2023-11-10  1606  			(host->timing == MMC_TIMING_UHS_SDR104)) {
2f466a57a66f8d Haibo Chen   2023-11-10  1607  		reg = readl(host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
2f466a57a66f8d Haibo Chen   2023-11-10  1608  		reg = (reg & ESDHC_TUNE_CTRL_STATUS_TAP_SEL_PRE_MASK) >>
2f466a57a66f8d Haibo Chen   2023-11-10  1609  				ESDHC_TUNE_CTRL_STATUS_TAP_SEL_PRE_SHIFT;
2f466a57a66f8d Haibo Chen   2023-11-10  1610  		imx_data->boarddata.saved_tuning_delay_cell = reg;
2f466a57a66f8d Haibo Chen   2023-11-10  1611  	}
2f466a57a66f8d Haibo Chen   2023-11-10  1612  }
2f466a57a66f8d Haibo Chen   2023-11-10  1613  
2f466a57a66f8d Haibo Chen   2023-11-10 @1614  static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
2f466a57a66f8d Haibo Chen   2023-11-10  1615  {
2f466a57a66f8d Haibo Chen   2023-11-10  1616  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
2f466a57a66f8d Haibo Chen   2023-11-10  1617  	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
2f466a57a66f8d Haibo Chen   2023-11-10  1618  	u32 reg;
2f466a57a66f8d Haibo Chen   2023-11-10  1619  
2f466a57a66f8d Haibo Chen   2023-11-10  1620  	if ((host->timing == MMC_TIMING_UHS_SDR50) |
2f466a57a66f8d Haibo Chen   2023-11-10  1621  			(host->timing == MMC_TIMING_UHS_SDR104)) {
2f466a57a66f8d Haibo Chen   2023-11-10  1622  		/*
2f466a57a66f8d Haibo Chen   2023-11-10  1623  		 * restore the tuning delay value actually is a
2f466a57a66f8d Haibo Chen   2023-11-10  1624  		 * manual tuning method, so clear the standard
2f466a57a66f8d Haibo Chen   2023-11-10  1625  		 * tuning enable bit here. Will set back this
2f466a57a66f8d Haibo Chen   2023-11-10  1626  		 * ESDHC_STD_TUNING_EN in esdhc_reset_tuning()
2f466a57a66f8d Haibo Chen   2023-11-10  1627  		 * when trigger re-tuning.
2f466a57a66f8d Haibo Chen   2023-11-10  1628  		 */
2f466a57a66f8d Haibo Chen   2023-11-10  1629  		reg = readl(host->ioaddr + ESDHC_TUNING_CTRL);
2f466a57a66f8d Haibo Chen   2023-11-10  1630  		reg &= ~ESDHC_STD_TUNING_EN;
2f466a57a66f8d Haibo Chen   2023-11-10  1631  		writel(reg, host->ioaddr + ESDHC_TUNING_CTRL);
2f466a57a66f8d Haibo Chen   2023-11-10  1632  
2f466a57a66f8d Haibo Chen   2023-11-10  1633  		reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
2f466a57a66f8d Haibo Chen   2023-11-10  1634  		reg |= ESDHC_MIX_CTRL_SMPCLK_SEL | ESDHC_MIX_CTRL_FBCLK_SEL;
2f466a57a66f8d Haibo Chen   2023-11-10  1635  		writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
2f466a57a66f8d Haibo Chen   2023-11-10  1636  
2f466a57a66f8d Haibo Chen   2023-11-10  1637  		writel(imx_data->boarddata.saved_tuning_delay_cell <<
2f466a57a66f8d Haibo Chen   2023-11-10  1638  				ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_SHIFT,
2f466a57a66f8d Haibo Chen   2023-11-10  1639  				host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
2f466a57a66f8d Haibo Chen   2023-11-10  1640  	}
2f466a57a66f8d Haibo Chen   2023-11-10  1641  }
2f466a57a66f8d Haibo Chen   2023-11-10  1642  

:::::: The code at line 1614 was first introduced by commit
:::::: 2f466a57a66f8d0b5ba8aa9d93fb8fa45cebfdc7 LF-10534-2 mmc: host: sdhci-esdhc-imx: save tuning value for the card which keep power in suspend

:::::: TO: Haibo Chen <haibo.chen@nxp.com>
:::::: CC: Haibo Chen <haibo.chen@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
