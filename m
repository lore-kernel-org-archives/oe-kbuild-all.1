Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09DC1DED5C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754559715; cv=none; b=S7Bkho4IUKI8ZsuKLFQp7WKF5Qok8jJ2cIESmXosEtXRrmJDkgyzYI1PVDQulAB7jsxLPAkI7l+/+w2VC+n3KiA1wdeKUoGEXkXMLEks8Q/+HIyEqJR7GyMpQKAo8KrItsOcMlcDoaJoqOJc+KAodl3Qmi2qBfbNFkPVUvUncdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754559715; c=relaxed/simple;
	bh=35S/gsX8Z70RMuSMWutufUE27zaSM9HYCo4CaXqoGik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amfHMdPy2WT6L1qpFYAEAH3w4eZ8XrIZaJtBcLcRTQnNTm/QT5cyqEAdXYvZiaA6VyGpAfOJk2FBHQMhl2taNgzaRnmpTVPz9C79J2+xQx1d9wE7R3NIyhP98zXWxMxnVi8pZPPqAwY9yDE65wn93zhKpoqf+k5WH+J3N1GROeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5EiV1WU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5EiV1WU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754559714; x=1786095714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=35S/gsX8Z70RMuSMWutufUE27zaSM9HYCo4CaXqoGik=;
  b=M5EiV1WU1+XGO0VYSecKL9gW8P4AgkFBUjHr8cR+I0vVPiNPX5c6SD8N
   I4DHy6qpnJH+ij4TEEPciGwDjGyaudynsarMxyTdsOzoDOU4xxkbQj52A
   DQ5+MZiRy/3oO3huWZrf5PDE2BjRo5eMXI/8Pd+th2L4tYRsbvObrmnvo
   dc1uZgb90RUDvsTVoov9Wt0fFstHjFYsrPskjWKvVZMP4b0sbnZEZH42k
   v3l/SRhPtFXkNLXmjjeFDHyYP84mx27SUM9PUjCjRTj4+NbNXUsRaik5V
   dZIyc4fA6+hVVIjZXJb2vjstpO+PIzSwaGd4LcVipXqXRGotd7PK39LuX
   w==;
X-CSE-ConnectionGUID: 0PduxbaBRtKKYgrSMdMG3Q==
X-CSE-MsgGUID: 7fIIrrlwQhq3VyCuXq8vPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67157353"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67157353"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 02:41:53 -0700
X-CSE-ConnectionGUID: DDuQgtmMTM6llMYHEIFtlA==
X-CSE-MsgGUID: /aMJA6gzSpG2VULEozKqtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164669162"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 07 Aug 2025 02:41:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujx7b-0002ce-2K;
	Thu, 07 Aug 2025 09:41:29 +0000
Date: Thu, 7 Aug 2025 17:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>
Subject: [xilinx-xlnx:lkp_test 3/4]
 drivers/ufs/host/ufs-amd-versal2.c:251:23: error: implicit declaration of
 function 'zynqmp_pm_sec_read_reg'; did you mean 'zynqmp_pm_read_pggs'?
Message-ID: <202508071714.6m6wFxNc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   bf02b5ab30f349d173dd098be46a5a01493670b3
commit: 2a574c8da24fba5d98b9b6c5adc266ef3e3f2c2e [3/4] ufs: amd-versal2: Add AMD Versal Gen 2 UFS support
config: arc-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071714.6m6wFxNc-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071714.6m6wFxNc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071714.6m6wFxNc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ufs/host/ufs-amd-versal2.c: In function 'ufs_versal2_phy_init':
>> drivers/ufs/host/ufs-amd-versal2.c:251:23: error: implicit declaration of function 'zynqmp_pm_sec_read_reg'; did you mean 'zynqmp_pm_read_pggs'? [-Werror=implicit-function-declaration]
     251 |                 ret = zynqmp_pm_sec_read_reg(PM_REGNODE_PMC_IOU_SLCR, TXRX_CFGRDY_OFFSET, &reg);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       zynqmp_pm_read_pggs
   drivers/ufs/host/ufs-amd-versal2.c: In function 'ufs_versal2_hce_enable_notify':
>> drivers/ufs/host/ufs-amd-versal2.c:388:23: error: implicit declaration of function 'zynqmp_pm_sec_mask_write_reg' [-Werror=implicit-function-declaration]
     388 |                 ret = zynqmp_pm_sec_mask_write_reg(PM_REGNODE_PMC_IOU_SLCR, SRAM_CSR_OFFSET,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/host/ufs-amd-versal2.c: At top level:
>> drivers/ufs/host/ufs-amd-versal2.c:558:35: error: initialization of 'int (*)(struct ufs_hba *, enum ufs_notify_change_status,  const struct ufs_pa_layer_attr *, struct ufs_pa_layer_attr *)' from incompatible pointer type 'int (*)(struct ufs_hba *, enum ufs_notify_change_status,  struct ufs_pa_layer_attr *, struct ufs_pa_layer_attr *)' [-Werror=incompatible-pointer-types]
     558 |         .pwr_change_notify      = ufs_versal2_pwr_change_notify,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/host/ufs-amd-versal2.c:558:35: note: (near initialization for 'ufs_versal2_hba_vops.pwr_change_notify')
   cc1: some warnings being treated as errors


vim +251 drivers/ufs/host/ufs-amd-versal2.c

   234	
   235	static int ufs_versal2_phy_init(struct ufs_hba *hba)
   236	{
   237		struct ufs_versal2_host *host = ufshcd_get_variant(hba);
   238		u32 reg, time_left;
   239		int ret;
   240		static const struct ufshcd_dme_attr_val rmmi_attrs[] = {
   241			{ UIC_ARG_MIB(CBREFCLKCTRL2), CBREFREFCLK_GATE_OVR_EN, DME_LOCAL },
   242			{ UIC_ARG_MIB(CBCRCTRL), 1, DME_LOCAL },
   243			{ UIC_ARG_MIB(CBC10DIRECTCONF2), 1, DME_LOCAL },
   244			{ UIC_ARG_MIB(VS_MPHYCFGUPDT), 1, DME_LOCAL }
   245		};
   246	
   247		/* Wait for Tx/Rx config_rdy */
   248		time_left = TIMEOUT_MICROSEC;
   249		do {
   250			time_left--;
 > 251			ret = zynqmp_pm_sec_read_reg(PM_REGNODE_PMC_IOU_SLCR, TXRX_CFGRDY_OFFSET, &reg);
   252			if (ret)
   253				return ret;
   254	
   255			reg &= TX_RX_CFG_RDY_MASK;
   256			if (!reg)
   257				break;
   258	
   259			usleep_range(1, 5);
   260		} while (time_left);
   261	
   262		if (!time_left) {
   263			dev_err(hba->dev, "Tx/Rx configuration signal busy.\n");
   264			return -ETIMEDOUT;
   265		}
   266	
   267		ret = ufshcd_dwc_dme_set_attrs(hba, rmmi_attrs, ARRAY_SIZE(rmmi_attrs));
   268		if (ret)
   269			return ret;
   270	
   271		ret = reset_control_deassert(host->rstphy);
   272		if (ret) {
   273			dev_err(hba->dev, "ufsphy reset deassert failed, err = %d\n", ret);
   274			return ret;
   275		}
   276	
   277		/* Wait for SRAM init done */
   278		time_left = TIMEOUT_MICROSEC;
   279		do {
   280			time_left--;
   281			ret = zynqmp_pm_sec_read_reg(PM_REGNODE_PMC_IOU_SLCR, SRAM_CSR_OFFSET, &reg);
   282			if (ret)
   283				return ret;
   284	
   285			reg &= SRAM_CSR_INIT_DONE_MASK;
   286			if (reg)
   287				break;
   288	
   289			usleep_range(1, 5);
   290		} while (time_left);
   291	
   292		if (!time_left) {
   293			dev_err(hba->dev, "SRAM initialization failed.\n");
   294			return -ETIMEDOUT;
   295		}
   296	
   297		ret = ufs_versal2_setup_phy(hba);
   298		if (ret)
   299			return ret;
   300	
   301		return ufs_versal2_enable_phy(hba);
   302	}
   303	
   304	static int ufs_versal2_init(struct ufs_hba *hba)
   305	{
   306		struct ufs_versal2_host *host;
   307		struct device *dev = hba->dev;
   308		struct ufs_clk_info *clki;
   309		int ret;
   310		u32 cal;
   311	
   312		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
   313		if (!host)
   314			return -ENOMEM;
   315	
   316		host->hba = hba;
   317		ufshcd_set_variant(hba, host);
   318	
   319		host->phy_mode = UFSHCD_DWC_PHY_MODE_ROM;
   320	
   321		list_for_each_entry(clki, &hba->clk_list_head, list) {
   322			if (!strcmp(clki->name, "core"))
   323				host->host_clk = clk_get_rate(clki->clk);
   324		}
   325	
   326		host->rstc = devm_reset_control_get_exclusive(dev, "ufshc");
   327		if (IS_ERR(host->rstc)) {
   328			dev_err(dev, "failed to get reset ctrl: ufshc\n");
   329			return PTR_ERR(host->rstc);
   330		}
   331	
   332		host->rstphy = devm_reset_control_get_exclusive(dev, "ufsphy");
   333		if (IS_ERR(host->rstphy)) {
   334			dev_err(dev, "failed to get reset ctrl: ufsphy\n");
   335			return PTR_ERR(host->rstphy);
   336		}
   337	
   338		ret = zynqmp_pm_sec_read_reg(PM_REGNODE_EFUSE_CACHE, UFS_CAL_1_OFFSET, &cal);
   339		if (ret) {
   340			dev_err(dev, "failed to read calibration values\n");
   341			return ret;
   342		}
   343	
   344		host->attcompval0 = (u8)cal;
   345		host->attcompval1 = (u8)(cal >> 8);
   346		host->ctlecompval0 = (u8)(cal >> 16);
   347		host->ctlecompval1 = (u8)(cal >> 24);
   348	
   349		hba->quirks |= UFSHCD_QUIRK_SKIP_DEF_UNIPRO_TIMEOUT_SETTING;
   350	
   351		return 0;
   352	}
   353	
   354	static int ufs_versal2_hce_enable_notify(struct ufs_hba *hba,
   355						 enum ufs_notify_change_status status)
   356	{
   357		struct ufs_versal2_host *host = ufshcd_get_variant(hba);
   358		struct device *dev = hba->dev;
   359		u32 sram_csr;
   360		int ret;
   361	
   362		switch (status) {
   363		case PRE_CHANGE:
   364			ret = reset_control_assert(host->rstc);
   365			if (ret) {
   366				dev_err(hba->dev, "ufshc reset assert failed, err = %d\n", ret);
   367				return ret;
   368			}
   369	
   370			ret = reset_control_assert(host->rstphy);
   371			if (ret) {
   372				dev_err(hba->dev, "ufsphy reset assert failed, err = %d\n", ret);
   373				return ret;
   374			}
   375	
   376			ret = zynqmp_pm_sec_read_reg(PM_REGNODE_PMC_IOU_SLCR, SRAM_CSR_OFFSET, &sram_csr);
   377			if (ret)
   378				return ret;
   379	
   380			if (!host->phy_mode) {
   381				sram_csr &= ~SRAM_CSR_EXT_LD_DONE_MASK;
   382				sram_csr |= SRAM_CSR_BYPASS_MASK;
   383			} else {
   384				dev_err(dev, "Invalid phy-mode %d.\n", host->phy_mode);
   385				return -EINVAL;
   386			}
   387	
 > 388			ret = zynqmp_pm_sec_mask_write_reg(PM_REGNODE_PMC_IOU_SLCR, SRAM_CSR_OFFSET,
   389							   GENMASK(2, 1), sram_csr);
   390			if (ret)
   391				return ret;
   392	
   393			ret = reset_control_deassert(host->rstc);
   394			if (ret)
   395				dev_err(hba->dev, "ufshc reset deassert failed, err = %d\n", ret);
   396	
   397			break;
   398		case POST_CHANGE:
   399			ret = ufs_versal2_phy_init(hba);
   400			if (ret)
   401				dev_err(hba->dev, "Phy init failed (%d)\n", ret);
   402	
   403			break;
   404		default:
   405			ret = -EINVAL;
   406			break;
   407		}
   408	
   409		return ret;
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
