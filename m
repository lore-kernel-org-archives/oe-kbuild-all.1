Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A5038756E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600694; cv=none; b=cnkxcs6PY9S9+rYtDmt21qh7jijdkaWXiBEKoXmpsdaXi9XBHqqNj8RRxQPD/HMy+SjzKfKVCch71A7jvZggsp9GApCa+5VsM2VKlSV5kG6tcC8sUg2JMgVFviH0DMyv1fWZDcWpJoJJovI46+MFNkTkXSXgutbMx9m9K2jC390=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600694; c=relaxed/simple;
	bh=qYyYYZRyKKvK8s2ZHd8Vn+TBl3QSniYcQn9ZYiOnmv0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kK5P1P+Rre1HnWQH69gIfdCzQg4p3t5xmmlIh8MBIBhxtrSw4OK7BPk8tHKqiP9qgJjnKmpJcNc7Y9sDvQg0p+uHM4igHRXIBtbqsVh/ZM0d/YuIpk1KC/+pP6DzE6WgSe331MNGFwdP663KqJyet5lZzPrQk+MmQCsuD+yAB2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGaidxj9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGaidxj9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783600692; x=1815136692;
  h=date:from:to:cc:subject:message-id;
  bh=qYyYYZRyKKvK8s2ZHd8Vn+TBl3QSniYcQn9ZYiOnmv0=;
  b=EGaidxj9zNXqZ0vW6qp3bcH2M2Jpk/yOOtQkodjLcKmz7ZuonE+jmkte
   U5Dhfy13qcqIi1BF3qLhnrNGdSGKWGcLLGU5BY3wzvso6kNptS/a/tjRG
   /xl3l9bYiD3S/WE3iI0DU5+2k6Snt7SLVPjivCvQNabXw+DswjY+lNo3R
   5RtiouAic8HRfPBbIRkcSPpcFO9DaL6rywSQvR1d1iqRg+UeObgpIIcmP
   nJnMJglcPAnXDU7MLFiHI9sIC2BMT5JEEtaAdIcb6UOh6gE2pZc7gQlXw
   KTVf+tVSatC6KtEl5fFovBvupJd+CUYxtHsMyftaYngjOKE8+/uY+kfXJ
   Q==;
X-CSE-ConnectionGUID: adnVAzs3SJKtbHoq5PSW6Q==
X-CSE-MsgGUID: lVCRGtGWTia0UNv3QFlnBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109826258"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="109826258"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 05:38:10 -0700
X-CSE-ConnectionGUID: N5nd4vbJSiSh1kVMn0IVgg==
X-CSE-MsgGUID: 0MCcE2hgTc6XdLPumi2tjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253480714"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 09 Jul 2026 05:38:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1who0z-00000000HgR-3sWC;
	Thu, 09 Jul 2026 12:38:05 +0000
Date: Thu, 09 Jul 2026 20:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [bod:qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4 93/121]
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c:95:2-3: Unneeded semicolon
Message-ID: <202607092026.NvVOGEmF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4
head:   ebd1e440443121d18f730ab2aeea5586a754f36f
commit: d7952be2f35aa9609bdcb72055e2410f4754a056 [93/121] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
config: powerpc-randconfig-r052-20260708 (https://download.01.org/0day-ci/archive/20260709/202607092026.NvVOGEmF-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607092026.NvVOGEmF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c:95:2-3: Unneeded semicolon

vim +95 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c

    32	
    33	static int
    34	phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
    35					   s64 link_freq)
    36	{
    37		const struct mipi_csi2phy_soc_cfg *soc_cfg = csi2phy->soc_cfg;
    38		unsigned long rates[MAX_CSI2PHY_CLKS] = {0};
    39		struct device *dev = csi2phy->dev;
    40		unsigned long max_opp_level;
    41		unsigned long vote_freq;
    42		struct dev_pm_opp *opp;
    43		int i, j;
    44		int ret;
    45	
    46		for (i = 0; i < soc_cfg->num_clk; i++) {
    47			const struct mipi_csi2phy_clk_freq *clk_freq = &soc_cfg->clk_freq[i];
    48			const char *clk_name = soc_cfg->clk_names[i];
    49			struct clk *clk = csi2phy->clks[i].clk;
    50			u64 min_rate = link_freq / 4;
    51			long round_rate;
    52	
    53			phy_qcom_mipi_csi2_add_clock_margin(&min_rate);
    54	
    55			/* This clock should be enabled only not set */
    56			if (!clk_freq->num_freq)
    57				continue;
    58	
    59			for (j = 0; j < clk_freq->num_freq; j++)
    60				if (min_rate < clk_freq->freq[j])
    61					break;
    62	
    63			if (j == clk_freq->num_freq) {
    64				dev_err(dev,
    65					"Pixel clock %llu is too high for %s\n",
    66					min_rate, clk_name);
    67				return -EINVAL;
    68			}
    69	
    70			/* if sensor pixel clock is not available
    71			 * set highest possible CSIPHY clock rate
    72			 */
    73			if (min_rate == 0)
    74				j = clk_freq->num_freq - 1;
    75	
    76			round_rate = clk_round_rate(clk, clk_freq->freq[j]);
    77			if (round_rate < 0) {
    78				dev_err(dev, "clk round rate failed: %ld\n",
    79					round_rate);
    80				return -EINVAL;
    81			}
    82	
    83			rates[i] = round_rate;
    84	
    85			if (!strcmp(clk_name, "csiphy_timer"))
    86				csi2phy->timer_clk_rate = round_rate;
    87	
    88			if (!strcmp(clk_name, "csiphy"))
    89				vote_freq = round_rate;
    90		}
    91	
    92		if (!vote_freq) {
    93			dev_err(dev, "Unable to find operating point frequency\n");
    94			return -ENODEV;
  > 95		};
    96	
    97		dev_dbg(dev, "OPP freq: %lu Hz\n", vote_freq);
    98	
    99		ret = dev_pm_opp_set_rate(dev, vote_freq);
   100		if (ret < 0) {
   101			dev_err(dev, "Failed to set OPP rate: %d\n", ret);
   102			return ret;
   103		}
   104	
   105		for (i = 0; i < soc_cfg->num_clk; i++) {
   106			if (rates[i] == 0)
   107				continue;
   108	
   109			dev_dbg(dev, "Setting clk %s to %lu Hz\n",
   110				soc_cfg->clk_names[i], rates[i]);
   111	
   112			ret = clk_set_rate(csi2phy->clks[i].clk, rates[i]);
   113			if (ret < 0) {
   114				dev_err(dev, "clk_set_rate failed for %s: %d\n",
   115					soc_cfg->clk_names[i], ret);
   116				return ret;
   117			}
   118		}
   119	
   120		return 0;
   121	}
   122	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
