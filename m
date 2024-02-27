Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC37634
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 03:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709003170; cv=none; b=US7K/lOS8aV5RinzAjDsAy6Sh534KoJQ3HwoKji02IIIzViAirvCymVdBny86ulALQYe0uwLtDimOQEKEhEAoNAKC19kiy6xby1dCJlpk+usnblOUeg8zPBfJsVhvgCyfwUmBOFCi6EsCI+TVQ/CRV0mkijiHgOqVgUbSG+YG4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709003170; c=relaxed/simple;
	bh=Wtn7F0kZoHcGrmxIVo+zHMcJJLBtMUEHLdtVY0utpHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QK8BMSDgTC+1zde0sRchX1pCpBZ3GZhcA1+lpBtjTNLN1njWmIY1L8fhMSrEMwbK17bx4muNRPb0jvRH5u2880SpBMVmtV+myXaQ+kw+Sc1fnd70nAJ/tidEJunznbd8DYQgD1h85gH39+maD6pPM3NAsvkwpxo7twnnyuyL3TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avB9KG2H; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avB9KG2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709003169; x=1740539169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wtn7F0kZoHcGrmxIVo+zHMcJJLBtMUEHLdtVY0utpHw=;
  b=avB9KG2H0MZNkfMWR14+P51RwrDG/LPm6wTwatEIWtKrOuRO4VYMkgQ+
   zDGOD1nxQ0DiueVcf36E3N6dqXCxB4bxjA8MZKl0reFBWVjt8abiU6EAs
   J0b3J3oVbXvteAywq8Ea/X2vwKU59gpLxl4MtqkFtlfOdncY0/EiNeweq
   pAp8Q9I9aOoFqFf9qbjeK0qlo4Ssa1jeRr80t9ecumxIKXrEC5L0L0SQZ
   kzqcM6uHbr8WAcbonujyWgdGr34BCRTDIH/91yLlpwkS4jiA7NjmQrC/A
   K9Y0WTEABZYzzOK66Q7zgtxmAN8T2uJhkdoZUWs+t6/FcEibhcdKwo8cv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="7141286"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7141286"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 19:06:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7294405"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2024 19:06:06 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rennA-000AtH-0g;
	Tue, 27 Feb 2024 03:06:04 +0000
Date: Tue, 27 Feb 2024 11:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] clk: hisilicon: add support for PLL
Message-ID: <202402271033.7ZfyJJyz-lkp@intel.com>
References: <20240225-pll-v1-2-fad6511479c6@outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240225-pll-v1-2-fad6511479c6@outlook.com>

Hi Yang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 8d3dea210042f54b952b481838c1e7dfc4ec751d]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Xiwen-via-B4-Relay/clk-hisilicon-rename-hi3519-PLL-registration-function/20240225-005759
base:   8d3dea210042f54b952b481838c1e7dfc4ec751d
patch link:    https://lore.kernel.org/r/20240225-pll-v1-2-fad6511479c6%40outlook.com
patch subject: [PATCH RFC 2/2] clk: hisilicon: add support for PLL
config: arm-randconfig-002-20240227 (https://download.01.org/0day-ci/archive/20240227/202402271033.7ZfyJJyz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402271033.7ZfyJJyz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402271033.7ZfyJJyz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/hisilicon/clk-pll.c: In function 'hisi_pll_prepare':
>> drivers/clk/hisilicon/clk-pll.c:59:25: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      59 |         pll->postdiv1 = FIELD_GET(HISI_PLL_POSTDIV1, reg);
         |                         ^~~~~~~~~
   drivers/clk/hisilicon/clk-pll.c: In function 'hisi_pll_set_rate':
>> drivers/clk/hisilicon/clk-pll.c:89:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      89 |         reg |= FIELD_PREP(HISI_PLL_FBDIV, fbdiv);
         |                ^~~~~~~~~~
   In file included from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:10,
                    from include/linux/sched.h:16,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/clk/hisilicon/clk-pll.c:9:
   drivers/clk/hisilicon/clk-pll.c: In function 'hisi_pll_recalc_rate':
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/clk/hisilicon/clk-pll.c:126:9: note: in expansion of macro 'do_div'
     126 |         do_div(parent_rate, pll->divisor);
         |         ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/bitops.h:6,
                    from drivers/clk/hisilicon/clk-pll.c:8:
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/clk/hisilicon/clk-pll.c:126:9: note: in expansion of macro 'do_div'
     126 |         do_div(parent_rate, pll->divisor);
         |         ^~~~~~
   include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    ulong * {aka long unsigned int *}
   drivers/clk/hisilicon/clk-pll.c:126:9: note: in expansion of macro 'do_div'
     126 |         do_div(parent_rate, pll->divisor);
         |         ^~~~~~
   arch/arm/include/asm/div64.h:24:45: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'ulong *' {aka 'long unsigned int *'}
      24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
         |                                   ~~~~~~~~~~^
   cc1: some warnings being treated as errors


vim +/FIELD_GET +59 drivers/clk/hisilicon/clk-pll.c

    52	
    53	static int hisi_pll_prepare(struct clk_hw *hw)
    54	{
    55		struct hisi_pll *pll = to_hisi_pll(hw);
    56		u32 reg;
    57	
    58		reg = readl(pll->base + HISI_PLL_CFG(0));
  > 59		pll->postdiv1 = FIELD_GET(HISI_PLL_POSTDIV1, reg);
    60		pll->postdiv2 = FIELD_GET(HISI_PLL_POSTDIV2, reg);
    61		// We don't use frac, clear it
    62		reg &= ~HISI_PLL_FRAC;
    63		writel(reg, pll->base + HISI_PLL_CFG(0));
    64	
    65		reg = readl(pll->base + HISI_PLL_CFG(1));
    66		pll->refdiv = FIELD_GET(HISI_PLL_REFDIV, reg);
    67	
    68		pll->divisor = pll->refdiv * pll->postdiv1 * pll->postdiv2;
    69	
    70		// return -EINVAL if boot loader does not init PLL correctly
    71		if (pll->divisor == 0) {
    72			pr_err("%s: PLLs are not initialized by boot loader correctly!\n", __func__);
    73			return -EINVAL;
    74		}
    75	
    76		return 0;
    77	}
    78	
    79	static int hisi_pll_set_rate(struct clk_hw *hw, ulong rate, ulong parent_rate)
    80	{
    81		struct hisi_pll *pll = to_hisi_pll(hw);
    82		u64 fbdiv = rate * pll->divisor;
    83		u32 reg;
    84	
    85		do_div(fbdiv, parent_rate);
    86	
    87		reg = readl(pll->base + HISI_PLL_CFG(1));
    88		reg &= ~HISI_PLL_FBDIV;
  > 89		reg |= FIELD_PREP(HISI_PLL_FBDIV, fbdiv);
    90		writel(reg, pll->base + HISI_PLL_CFG(1));
    91	
    92		/* TODO: wait for PLL lock? */
    93	
    94		return 0;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
