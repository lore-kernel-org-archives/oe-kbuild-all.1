Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957052572
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 05:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730612838; cv=none; b=oVHxwHJWvqfendViYkbemyQbP8jNeEUmGVBM3HVDgaV2eYrWPt2X+Hm60sNjG1rWc5lVXJ2EmpfNOgeK+mOq836DDG6jDTRbs7AJ0Vfk6b20Nk6eVR2B+BI7GeJjMRTYrznWa+8gJjIV9bpWS7oNVZPp8DW1eRoeUaZMwMnwKuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730612838; c=relaxed/simple;
	bh=1LWUQ9zNepbUZK5hdYPD5/V1aiH9IlpO+lMmur93a8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6kD050jv06gY4kECHJffJ6cY8dqCjeEc5oeCyT6bYwza3r70Ug/u0NUmjm0IHdMgZYj1Ty2WDfe4krm0BktQ2MtHqzdKMgIhLabQWXqVqA1wl4MJemjIKHShI8X7wrOyln8UA15Ela6f2py197duT7ZBc/todCfzDztq8sWSBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/H0ndy2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/H0ndy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730612837; x=1762148837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1LWUQ9zNepbUZK5hdYPD5/V1aiH9IlpO+lMmur93a8o=;
  b=K/H0ndy21RVOW143Wi0nAjZ85vWAU4KnWGuEyNKr+jAtx6kKM4XiD2kq
   awNjO/hEmd8sh55eJyIMqDB2moVnUKPc6fF7baj+QW9/VmVgVBeNdfPhu
   pf3/ACd2rIkzfXBdMQ3//PZKjiZ0qejdW7hyfGoIp8TG/rFfnClQXB+kz
   h3omWid+DZaLR1Bz48J5doniovk2y+kY0iUneT+p6yAttUsaBacNlBsce
   UaXOrTdNmUz4STzl3JSLcTgbtwA5RlZWCTpYjjNIFbvojzhXHVADCNq8G
   gCE75YjSHFItrPCoKDJqMLBgVqqJNAIwBxoHGzBtec1ECP6JnI6JzXPsF
   w==;
X-CSE-ConnectionGUID: VTtI7JqjRs6UJM6uldH1uQ==
X-CSE-MsgGUID: lh1jCcTPQUum44i6kmP0/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34026204"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34026204"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 22:47:17 -0700
X-CSE-ConnectionGUID: //fUEPYHQFuLzCEGROWrJQ==
X-CSE-MsgGUID: xtd9Ek83TOyvXfagoRnXqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="83218288"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Nov 2024 22:47:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7TSC-000jjd-32;
	Sun, 03 Nov 2024 05:47:12 +0000
Date: Sun, 3 Nov 2024 13:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] phy: dphy: Fix Unit Interval(UI) calculation formula
Message-ID: <202411031304.yVRemIyp-lkp@intel.com>
References: <20241031123643.272111-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031123643.272111-1-changhuang.liang@starfivetech.com>

Hi Changhuang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Changhuang-Liang/phy-dphy-Fix-Unit-Interval-UI-calculation-formula/20241031-203920
base:   linus/master
patch link:    https://lore.kernel.org/r/20241031123643.272111-1-changhuang.liang%40starfivetech.com
patch subject: [RFC PATCH] phy: dphy: Fix Unit Interval(UI) calculation formula
config: i386-buildonly-randconfig-001-20241103 (https://download.01.org/0day-ci/archive/20241103/202411031304.yVRemIyp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031304.yVRemIyp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031304.yVRemIyp-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/phy/phy-core-mipi-dphy.o: in function `phy_mipi_dphy_calc_config':
>> drivers/phy/phy-core-mipi-dphy.c:36: undefined reference to `__udivdi3'
   ld: drivers/phy/phy-core-mipi-dphy.o: in function `phy_mipi_dphy_config_validate':
>> drivers/phy/phy-core-mipi-dphy.c:113: undefined reference to `__divdi3'


vim +36 drivers/phy/phy-core-mipi-dphy.c

    14	
    15	/*
    16	 * Minimum D-PHY timings based on MIPI D-PHY specification. Derived
    17	 * from the valid ranges specified in Section 6.9, Table 14, Page 41
    18	 * of the D-PHY specification (v1.2).
    19	 */
    20	static int phy_mipi_dphy_calc_config(unsigned long pixel_clock,
    21					     unsigned int bpp,
    22					     unsigned int lanes,
    23					     unsigned long long hs_clk_rate,
    24					     struct phy_configure_opts_mipi_dphy *cfg)
    25	{
    26		unsigned long long ui;
    27	
    28		if (!cfg)
    29			return -EINVAL;
    30	
    31		if (!hs_clk_rate) {
    32			hs_clk_rate = pixel_clock * bpp;
    33			do_div(hs_clk_rate, lanes);
    34		}
    35	
  > 36		ui = DIV_ROUND_UP(PSEC_PER_SEC, hs_clk_rate);
    37	
    38		cfg->clk_miss = 0;
    39		cfg->clk_post = 60000 + 52 * ui;
    40		cfg->clk_pre = 8;
    41		cfg->clk_prepare = 38000;
    42		cfg->clk_settle = 95000;
    43		cfg->clk_term_en = 0;
    44		cfg->clk_trail = 60000;
    45		cfg->clk_zero = 262000;
    46		cfg->d_term_en = 0;
    47		cfg->eot = 0;
    48		cfg->hs_exit = 100000;
    49		cfg->hs_prepare = 40000 + 4 * ui;
    50		cfg->hs_zero = 105000 + 6 * ui;
    51		cfg->hs_settle = 85000 + 6 * ui;
    52		cfg->hs_skip = 40000;
    53	
    54		/*
    55		 * The MIPI D-PHY specification (Section 6.9, v1.2, Table 14, Page 40)
    56		 * contains this formula as:
    57		 *
    58		 *     T_HS-TRAIL = max(n * 8 * ui, 60 + n * 4 * ui)
    59		 *
    60		 * where n = 1 for forward-direction HS mode and n = 4 for reverse-
    61		 * direction HS mode. There's only one setting and this function does
    62		 * not parameterize on anything other that ui, so this code will
    63		 * assumes that reverse-direction HS mode is supported and uses n = 4.
    64		 */
    65		cfg->hs_trail = max(4 * 8 * ui, 60000 + 4 * 4 * ui);
    66	
    67		cfg->init = 100;
    68		cfg->lpx = 50000;
    69		cfg->ta_get = 5 * cfg->lpx;
    70		cfg->ta_go = 4 * cfg->lpx;
    71		cfg->ta_sure = cfg->lpx;
    72		cfg->wakeup = 1000;
    73	
    74		cfg->hs_clk_rate = hs_clk_rate;
    75		cfg->lanes = lanes;
    76	
    77		return 0;
    78	}
    79	
    80	int phy_mipi_dphy_get_default_config(unsigned long pixel_clock,
    81					     unsigned int bpp,
    82					     unsigned int lanes,
    83					     struct phy_configure_opts_mipi_dphy *cfg)
    84	{
    85		return phy_mipi_dphy_calc_config(pixel_clock, bpp, lanes, 0, cfg);
    86	
    87	}
    88	EXPORT_SYMBOL(phy_mipi_dphy_get_default_config);
    89	
    90	int phy_mipi_dphy_get_default_config_for_hsclk(unsigned long long hs_clk_rate,
    91						       unsigned int lanes,
    92						       struct phy_configure_opts_mipi_dphy *cfg)
    93	{
    94		if (!hs_clk_rate)
    95			return -EINVAL;
    96	
    97		return phy_mipi_dphy_calc_config(0, 0, lanes, hs_clk_rate, cfg);
    98	
    99	}
   100	EXPORT_SYMBOL(phy_mipi_dphy_get_default_config_for_hsclk);
   101	
   102	/*
   103	 * Validate D-PHY configuration according to MIPI D-PHY specification
   104	 * (v1.2, Section Section 6.9 "Global Operation Timing Parameters").
   105	 */
   106	int phy_mipi_dphy_config_validate(struct phy_configure_opts_mipi_dphy *cfg)
   107	{
   108		unsigned long long ui;
   109	
   110		if (!cfg)
   111			return -EINVAL;
   112	
 > 113		ui = DIV_ROUND_UP(PSEC_PER_SEC, cfg->hs_clk_rate);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
