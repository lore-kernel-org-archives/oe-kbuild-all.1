Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BC5196C7C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 19:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783193774; cv=none; b=fJHQVLl/pbhCwdtF1IAvgYoSAaOar2ZZ96VJjp/7BhKvYG5h4nsDDIrXhHe3kFpBbx8K7aCPf8pp8xGdP1Ib1RRcxp3CVxS9hr4n6XCq+4LHb0N3SdvoIU4gTDCwgzWrt7syWMhBRVMs8dj/wSwVSZO2IKMqZ0kKVYoGxQzQpYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783193774; c=relaxed/simple;
	bh=At05fT7k+T6/Nq+331Tt/mOR434tnSVu4OVlWK6sjBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=brwAsKhcAFMGYildJhNlLmFwxiI0EQ5m/a61dYuxg5krUNUWM308ON51VEJzzIdIxNV8HEFZSPB/PN74vihyITMPiNaS+8xOgRvcFLffcV2a9eWpV98uGILaKRXwu8/Top6FCgUiQs7RhOa7eKlESZA3ukHaorixthZ+GLdLO3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OT2tvypd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OT2tvypd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783193771; x=1814729771;
  h=date:from:to:cc:subject:message-id;
  bh=At05fT7k+T6/Nq+331Tt/mOR434tnSVu4OVlWK6sjBM=;
  b=OT2tvypd58hqzcV1cX7dzto+p/7pvToVQbf3Kmt8l2CADb4KTtrX/ZYd
   8yLb0CTTAUqupW9IA2+hpt+Gt8pnMYdH0tAMNmgDlnmOEZ20qHgdcJh+z
   F1ToAmF5acmlsO5bcaodKCGcdWd6MevF54l8b7LF91hnahoSP+qGis3fF
   bVY5XC4z+u/MFmUxGxYLVrSiKnGQlvConliRBKL3HaWNOg2sXKpkPR3nZ
   SMWgtaYcIy7wLtCCFdoqQQEjjLI2RXSuj7zBZGJ9aTBPFzfsS8gAAcULY
   hnnyJKr/NvhvMUUPVG6M5nvsZbGfAj/lLEL0rGlgFz8E3L0IxGmmwH6kk
   w==;
X-CSE-ConnectionGUID: t4dKe+1uThKvHTpQSwu42g==
X-CSE-MsgGUID: cDiOZDOyQKixsmEfF5CEqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="84016058"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="84016058"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 12:36:10 -0700
X-CSE-ConnectionGUID: hV9aa4kISDCO0rDhL8QLuQ==
X-CSE-MsgGUID: Gl3rtEZRQEKBZknIIFsMwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="251617688"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Jul 2026 12:36:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wg69m-00000000DEx-0wWg;
	Sat, 04 Jul 2026 19:36:06 +0000
Date: Sun, 05 Jul 2026 03:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [bod:qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4 93/121]
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c:42:28: warning: unused
 variable 'opp'
Message-ID: <202607050307.vJLqgrcA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4
head:   ebd1e440443121d18f730ab2aeea5586a754f36f
commit: d7952be2f35aa9609bdcb72055e2410f4754a056 [93/121] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260705/202607050307.vJLqgrcA-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260705/202607050307.vJLqgrcA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607050307.vJLqgrcA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c: In function 'phy_qcom_mipi_csi2_set_clock_rates':
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c:42:28: warning: unused variable 'opp' [-Wunused-variable]
      42 |         struct dev_pm_opp *opp;
         |                            ^~~
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c:40:23: warning: unused variable 'max_opp_level' [-Wunused-variable]
      40 |         unsigned long max_opp_level;
         |                       ^~~~~~~~~~~~~
--
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:295:13: warning: 'phy_qcom_mipi_csi2_gen1_config_lanes' defined but not used [-Wunused-function]
     295 | static void phy_qcom_mipi_csi2_gen1_config_lanes(struct mipi_csi2phy_device *csi2phy,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/opp +42 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c

    32	
    33	static int
    34	phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
    35					   s64 link_freq)
    36	{
    37		const struct mipi_csi2phy_soc_cfg *soc_cfg = csi2phy->soc_cfg;
    38		unsigned long rates[MAX_CSI2PHY_CLKS] = {0};
    39		struct device *dev = csi2phy->dev;
  > 40		unsigned long max_opp_level;
    41		unsigned long vote_freq;
  > 42		struct dev_pm_opp *opp;
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
    95		};
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
