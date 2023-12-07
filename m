Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949B83FB04
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrnJfQUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701955069; x=1733491069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9mxn5+h9Vvw+tq1Epw4XXTi5tw+WM5Y9d8obx0lk5Q=;
  b=TrnJfQUDeXazSGLQhypj351une7+gIv4XJW6YUaz537mUyDNo+C8R+Ym
   Rh7Mh7AiAITFZYqOGCn31oXFD+VCwOHNuXry534F3txJ6VC4GbuFKHzYE
   MDLYhtvzuk8clIVO7d/z5vl/L7Z2TcWPW+h/O7L5JdkH7zeL9ZxzEs7TB
   E+G3XUMTefNkGEdqfRJncXaVDjRzPR5n+Yk0I6oAaOTmMFuuUnhf6sSYf
   cmXNMgrEuzzI7DKeKWhr+s7AFSx6xxN27GQ06/g5R2U4AmeT6x7L94Wrv
   Oknos9g2+NmjSle+lgqgthOLdxveszKWdwmIP7oRpDHmGJu5D+g2Pug6H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="458550094"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="458550094"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 05:17:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837714417"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="837714417"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2023 05:17:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBEG7-000CHK-06;
	Thu, 07 Dec 2023 13:17:43 +0000
Date: Thu, 7 Dec 2023 21:17:34 +0800
From: kernel test robot <lkp@intel.com>
To: ixgbe01 <yangwang@njis.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, Han Gao <gaohan@iscas.ac.cn>
Subject: [esmil:th1520 38/52] drivers/clk/thead/clk.c:171:2-3: Unneeded
 semicolon
Message-ID: <202312072129.P5RWBMFa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux th1520
head:   64731462dd62508162241c28bd319829df635524
commit: 851266b8b6ef516302144607a424a7986e950822 [38/52] add TH1520 cpu frequency driver
config: riscv-randconfig-r062-20231207 (https://download.01.org/0day-ci/archive/20231207/202312072129.P5RWBMFa-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312072129.P5RWBMFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072129.P5RWBMFa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/thead/clk.c:171:2-3: Unneeded semicolon
   drivers/clk/thead/clk.c:487:2-3: Unneeded semicolon

vim +171 drivers/clk/thead/clk.c

    93	
    94	static void clk_light_pll_cfg_init(struct clk_lightpll *pll)
    95	{
    96		switch (pll->clk_type) {
    97		case LIGHT_AUDIO_PLL:
    98			pll->cfg0_reg_off = 0x0;
    99			pll->pll_sts_off = 0x90;
   100			pll->pll_lock_bit = BIT(0);
   101			pll->pll_bypass_bit = BIT(31);
   102			pll->pll_rst_bit = BIT(30);
   103			pll->pll_mode = PLL_MODE_FRAC;
   104			break;
   105		case LIGHT_SYS_PLL:
   106			pll->cfg0_reg_off = 0x10;
   107			pll->pll_sts_off = 0x90;
   108			pll->pll_lock_bit = BIT(1);
   109			pll->pll_bypass_bit = BIT(31);
   110			pll->pll_rst_bit = BIT(30);
   111			pll->pll_mode = PLL_MODE_FRAC;
   112			break;
   113		case LIGHT_CPU_PLL0:
   114			pll->cfg0_reg_off = 0x0;
   115			pll->pll_sts_off = 0x80;
   116			pll->pll_lock_bit = BIT(1);
   117			pll->pll_bypass_bit = BIT(30);
   118			pll->pll_rst_bit = BIT(29);
   119			pll->pll_mode = PLL_MODE_INT;
   120			break;
   121		case LIGHT_CPU_PLL1:
   122			pll->cfg0_reg_off = 0x10;
   123			pll->pll_sts_off = 0x80;
   124			pll->pll_lock_bit = BIT(4);
   125			pll->pll_bypass_bit = BIT(30);
   126			pll->pll_rst_bit = BIT(29);
   127			pll->pll_mode = PLL_MODE_INT;
   128			break;
   129		case LIGHT_GMAC_PLL:
   130			pll->cfg0_reg_off = 0x20;
   131			pll->pll_sts_off = 0x80;
   132			pll->pll_lock_bit = BIT(3);
   133			pll->pll_bypass_bit = BIT(30);
   134			pll->pll_rst_bit = BIT(29);
   135			pll->pll_mode = PLL_MODE_INT;
   136			break;
   137		case LIGHT_VIDEO_PLL:
   138			pll->cfg0_reg_off = 0x30;
   139			pll->pll_sts_off = 0x80;
   140			pll->pll_lock_bit = BIT(7);
   141			pll->pll_bypass_bit = BIT(30);
   142			pll->pll_rst_bit = BIT(29);
   143			pll->pll_mode = PLL_MODE_INT;
   144			break;
   145		case LIGHT_DDR_PLL:
   146			pll->cfg0_reg_off = 0x8;
   147			pll->pll_sts_off = 0x18;
   148			pll->pll_lock_bit = BIT(0);
   149			pll->pll_bypass_bit = BIT(31);
   150			pll->pll_rst_bit = BIT(30);
   151			pll->pll_mode = PLL_MODE_INT;
   152			break;
   153		case LIGHT_DPU0_PLL:
   154			pll->cfg0_reg_off = 0x40;
   155			pll->pll_sts_off = 0x80;
   156			pll->pll_lock_bit = BIT(8);
   157			pll->pll_bypass_bit = BIT(30);
   158			pll->pll_rst_bit = BIT(29);
   159			pll->pll_mode = PLL_MODE_INT;
   160			break;
   161		case LIGHT_DPU1_PLL:
   162			pll->cfg0_reg_off = 0x50;
   163			pll->pll_sts_off = 0x80;
   164			pll->pll_lock_bit = BIT(9);
   165			pll->pll_bypass_bit = BIT(30);
   166			pll->pll_rst_bit = BIT(29);
   167			pll->pll_mode = PLL_MODE_INT;
   168			break;
   169		default:
   170			pr_err("%s: Unknown pll type\n", __func__);
 > 171		};
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
