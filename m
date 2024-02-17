Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9349425757
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 19:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708197929; cv=none; b=cvIA1Xux1PopSIg+RVUt8CbipeN/e1+jL4xqmqTtz+FJSnM5sIm9hi6N7yAFZrB+78VeFXlFfN9b9wxTL6pGWU8VEJLBcg4t/sYglPQpfQmt364HMktzpMdzLe79y4ef/8kEwr6ag7f7mhr2Z4zUk8mDjRknI1jwrP02hYVlfXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708197929; c=relaxed/simple;
	bh=N7RW0LCHY28o76+vSnPUT3Oiej8k9h2Gd4o+C0ZcoGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnIuv19kNbJGg3wCh6cuS8xKS27cR1mhnY2i9XM4Qi1Yvih/g6f2mQVPCci06qEQ6vWg8Q23rH6Ca96CZqMtzTnKU3KZfF4X7kzWKtiA9nDRSXyw/GknuRQbBdEA0uV5mTv5fZedhnzumLfAyc/+E0i+v+9SonfsTyVFtDGs2vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfiC1jlk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfiC1jlk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708197928; x=1739733928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N7RW0LCHY28o76+vSnPUT3Oiej8k9h2Gd4o+C0ZcoGM=;
  b=KfiC1jlkCV7BP3byUqrUau/7sSMy6TBvFvGmbb/3QCr++qnJXXoqKvM8
   3Yyg+MjwziDBktm73vDHmq4Svm6Sfn8U9IZMEX7IUdTEFVToyv02XLh/Y
   BIi0YvGfpBa49W6kiRjHnMd2eWiZTbYT7AQjKxQl4G98m30MJa316/j7w
   OTfKx4i1UWlTZnDkLhFy2TkG6PKS97cLzC3A9US2PI3IVGnYsyp4AYFgw
   1lMC0k6FkaRWXo1VPSZHabtn4a8B4F3w+zsHb2M9xFI+0Dprn+TIIhXAK
   q1iGZPZTlEvDroEuaSvlYsyjPGfbdJjPtzIx5y+TB76JTEEEEdptFVkaZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2175164"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2175164"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 11:25:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="826750232"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="826750232"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Feb 2024 11:25:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbQJO-0002Ru-33;
	Sat, 17 Feb 2024 19:25:22 +0000
Date: Sun, 18 Feb 2024 03:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/4] clk: hisilicon: add CRG driver for Hi3798MV200
 SoC
Message-ID: <202402180302.v3sQLlUW-lkp@intel.com>
References: <20240216-clk-mv200-v1-2-a29ace29e636@outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216-clk-mv200-v1-2-a29ace29e636@outlook.com>

Hi Yang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 8d3dea210042f54b952b481838c1e7dfc4ec751d]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Xiwen-via-B4-Relay/dt-binding-clock-histb-clock-Add-missing-common-clock-and-Hi3798MV200-specific-clock-definition/20240216-193926
base:   8d3dea210042f54b952b481838c1e7dfc4ec751d
patch link:    https://lore.kernel.org/r/20240216-clk-mv200-v1-2-a29ace29e636%40outlook.com
patch subject: [PATCH RFC 2/4] clk: hisilicon: add CRG driver for Hi3798MV200 SoC
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240218/202402180302.v3sQLlUW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180302.v3sQLlUW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180302.v3sQLlUW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/hisilicon/crg-hi3798mv200.c:189:11: error: 'HI3798MV200_USB3_REF_CLK' undeclared here (not in a function); did you mean 'HI3798MV200_GMACIF_CLK'?
     189 |         { HI3798MV200_USB3_REF_CLK, "clk_u3_ref", "125m",
         |           ^~~~~~~~~~~~~~~~~~~~~~~~
         |           HI3798MV200_GMACIF_CLK


vim +189 drivers/clk/hisilicon/crg-hi3798mv200.c

   116	
   117	static const struct hisi_gate_clock hi3798mv200_gate_clks[] = {
   118		/* UART */
   119		{ HISTB_UART2_CLK, "clk_uart2", "75m",
   120			CLK_SET_RATE_PARENT, 0x68, 4, 0, },
   121		{ HISTB_UART3_CLK, "clk_uart3", "75m",
   122			CLK_SET_RATE_PARENT, 0x68, 6, 0, },
   123		/* I2C */
   124		{ HISTB_I2C0_CLK, "clk_i2c0", NULL,
   125			CLK_SET_RATE_PARENT, 0x6c, 4, 0, },
   126		{ HISTB_I2C1_CLK, "clk_i2c1", NULL,
   127			CLK_SET_RATE_PARENT, 0x6c, 8, 0, },
   128		{ HISTB_I2C2_CLK, "clk_i2c2", NULL,
   129			CLK_SET_RATE_PARENT, 0x6c, 12, 0, },
   130		/* SDIO */
   131		{ HISTB_SDIO0_BIU_CLK, "clk_sdio0_biu", "200m",
   132			CLK_SET_RATE_PARENT, 0x9c, 0, 0, },
   133		{ HISTB_SDIO0_CIU_CLK, "clk_sdio0_ciu", "sdio0_mux",
   134			CLK_SET_RATE_PARENT, 0x9c, 1, 0, },
   135		{ HISTB_SDIO1_BIU_CLK, "clk_sdio1_biu", "200m",
   136			CLK_SET_RATE_PARENT, 0x28c, 0, 0, },
   137		{ HISTB_SDIO1_CIU_CLK, "clk_sdio1_ciu", "sdio1_mux",
   138			CLK_SET_RATE_PARENT, 0x28c, 1, 0, },
   139		/* EMMC */
   140		{ HISTB_MMC_BIU_CLK, "clk_mmc_biu", "200m",
   141			CLK_SET_RATE_PARENT, 0xa0, 0, 0, },
   142		{ HISTB_MMC_CIU_CLK, "clk_mmc_ciu", "mmc_mux",
   143			CLK_SET_RATE_PARENT, 0xa0, 1, 0, },
   144		/* Ethernet */
   145		{ HI3798MV200_GMAC_CLK, "clk_gmac", NULL,
   146			CLK_SET_RATE_PARENT, 0xcc, 2, 0, },
   147		{ HI3798MV200_GMACIF_CLK, "clk_gmacif", NULL,
   148			CLK_SET_RATE_PARENT, 0xcc, 0, 0, },
   149		{ HI3798MV200_FEMAC_CLK, "clk_femac", NULL,
   150			CLK_SET_RATE_PARENT, 0xd0, 1, 0, },
   151		{ HI3798MV200_FEMACIF_CLK, "clk_femacif", NULL,
   152			CLK_SET_RATE_PARENT, 0xd0, 0, 0, },
   153		{ HI3798MV200_FEPHY_CLK, "clk_fephy", NULL,
   154			CLK_SET_RATE_PARENT, 0x388, 0, 0, },
   155		/* COMBPHY0 */
   156		{ HISTB_COMBPHY0_CLK, "clk_combphy0", "combphy0_mux",
   157			CLK_SET_RATE_PARENT, 0x188, 0, 0, },
   158		/* USB2 */
   159		{ HISTB_USB2_BUS_CLK, "clk_u2_bus", "clk_ahb",
   160			CLK_SET_RATE_PARENT, 0xb8, 0, 0, },
   161		{ HISTB_USB2_PHY_CLK, "clk_u2_phy", "60m",
   162			CLK_SET_RATE_PARENT, 0xb8, 4, 0, },
   163		{ HISTB_USB2_12M_CLK, "clk_u2_12m", "12m",
   164			CLK_SET_RATE_PARENT, 0xb8, 2, 0 },
   165		{ HISTB_USB2_48M_CLK, "clk_u2_48m", "48m",
   166			CLK_SET_RATE_PARENT, 0xb8, 1, 0 },
   167		{ HISTB_USB2_UTMI0_CLK, "clk_u2_utmi0", "60m",
   168			CLK_SET_RATE_PARENT, 0xb8, 5, 0 },
   169		{ HISTB_USB2_UTMI1_CLK, "clk_u2_utmi1", "60m",
   170			CLK_SET_RATE_PARENT, 0xb8, 6, 0 },
   171		{ HISTB_USB2_OTG_UTMI_CLK, "clk_u2_otg_utmi", "60m",
   172			CLK_SET_RATE_PARENT, 0xb8, 3, 0 },
   173		{ HISTB_USB2_PHY1_REF_CLK, "clk_u2_phy1_ref", "24m",
   174			CLK_SET_RATE_PARENT, 0xbc, 0, 0 },
   175		{ HISTB_USB2_PHY2_REF_CLK, "clk_u2_phy2_ref", "24m",
   176			CLK_SET_RATE_PARENT, 0xbc, 2, 0 },
   177		/* USB3 bus */
   178		{ HISTB_USB3_GM_CLK, "clk_u3_gm", "clk_ahb",
   179			CLK_SET_RATE_PARENT, 0xb0, 6, 0 },
   180		{ HISTB_USB3_GS_CLK, "clk_u3_gs", "clk_ahb",
   181			CLK_SET_RATE_PARENT, 0xb0, 5, 0 },
   182		{ HISTB_USB3_BUS_CLK, "clk_u3_bus", "clk_ahb",
   183			CLK_SET_RATE_PARENT, 0xb0, 0, 0 },
   184		/* USB3 ctrl */
   185		{ HISTB_USB3_SUSPEND_CLK, "clk_u3_suspend", NULL,
   186			CLK_SET_RATE_PARENT, 0xb0, 2, 0 },
   187		{ HISTB_USB3_PIPE_CLK, "clk_u3_pipe", NULL,
   188			CLK_SET_RATE_PARENT, 0xb0, 3, 0 },
 > 189		{ HI3798MV200_USB3_REF_CLK, "clk_u3_ref", "125m",
   190			CLK_SET_RATE_PARENT, 0xb0, 1, 0 },
   191		{ HISTB_USB3_UTMI_CLK, "clk_u3_utmi", "60m",
   192			CLK_SET_RATE_PARENT, 0xb0, 4, 0 },
   193		/* Watchdog */
   194		{ HISTB_WDG0_CLK, "clk_wdg0", "24m",
   195			CLK_SET_RATE_PARENT, 0x178, 0, 0 },
   196	};
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
