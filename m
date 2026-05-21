Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB09346FA7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 23:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779404810; cv=none; b=JfnDGG3IYZ139uJxH+EFzoqCO4L2EcKoEaed/2xvdYdKr6Bdi/HxndipBUtwLB9qAyJT8OvpKSS1mHnHzKshHzvSN+ZLCw5/cDNx0qYkLhsc15TF0PuqVvXJdgjTlXZdViL6ZT1jOE1d8iDJEg5lX9yHlUi1Ocwe7H8Dv28kth8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779404810; c=relaxed/simple;
	bh=otVoOgKSQ/Np46AONXSJYabQptTlQ3jd4Mu8OXAeySc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hpuxZOQD6EEK+w8V/XvDtEYJHgV4LhHdnwPprq4d6XkhCIPCS2l4NBCX8VHbY9ebcPqUi44rqfB39v37CZx7Ih0KCI2NjtEF9JHw7V8IkvLujmVH/3ux4XJ92KX7Aie5WTDiKPvYfbUfCUV3IcC0+xFdCldgKGjn2UBUpFkCQ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlimHxAa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlimHxAa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779404809; x=1810940809;
  h=date:from:to:cc:subject:message-id;
  bh=otVoOgKSQ/Np46AONXSJYabQptTlQ3jd4Mu8OXAeySc=;
  b=QlimHxAagxAhl/OUG3kAsbIffGrXYUpGErEbbAsXc3k2I601alDB/Dcw
   sOSXhHSImHmv78v82GKhvINPGBRGe0L7ft4H6t3+kPaemo81R4KxQIJRK
   KARcSB47pwsmi2Jmo8DEeJqZ9RMmx/cAN9jR73kkjxbj/2zsec28Og242
   k8BwAs2qjj1iWG3IGGESsRGos1NbkgwgJnFXo/j5QrFnRO0P10AQqUZvR
   olLBUWuFMzqmCOGK76Ni9mJ/QEWfx/tg1jbwk8tFEtQzSjaC43wun4mX6
   vJEawqRcxDOhVH9dE4JvO3NSsQVZdj1A/gKN7h+pGGxDqrGjLUR8jYpVZ
   g==;
X-CSE-ConnectionGUID: ZkByT3XtQIy2j/AGuHjqdA==
X-CSE-MsgGUID: zzRHCX+wRxKUQlUAw/5Pzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91026037"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="91026037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 16:06:48 -0700
X-CSE-ConnectionGUID: 4h3w98HMSl6U//hAB1YxuA==
X-CSE-MsgGUID: EhEyub7rTZueQoa2aia3Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="271045510"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2026 16:06:47 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQCTU-000000001KT-1Udk;
	Thu, 21 May 2026 23:06:44 +0000
Date: Fri, 22 May 2026 07:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:canaan-clk 2/2] drivers/clk/clk-k230.c:273:1: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202605220724.j4ZeM3KI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git canaan-clk
head:   68af6bc36debec10de593b53e789841df1b6cfc0
commit: 68af6bc36debec10de593b53e789841df1b6cfc0 [2/2] clk: canaan: Add clock driver for Canaan K230
config: microblaze-randconfig-r132-20260522 (https://download.01.org/0day-ci/archive/20260522/202605220724.j4ZeM3KI-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220724.j4ZeM3KI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/clk-k230.c:273:1: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/clk-k230.c:274:1: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/clk-k230.c:275:1: sparse: sparse: Using plain integer as NULL pointer
   drivers/clk/clk-k230.c:276:1: sparse: sparse: Using plain integer as NULL pointer
>> drivers/clk/clk-k230.c:278:17: sparse: sparse: symbol 'k230_plls' was not declared. Should it be static?
>> drivers/clk/clk-k230.c:299:25: sparse: sparse: symbol 'k230_pll_divs' was not declared. Should it be static?

vim +273 drivers/clk/clk-k230.c

   272	
 > 273	K230_CLK_PLL_FORMAT(pll0, 0, CLK_IS_CRITICAL, 0);
   274	K230_CLK_PLL_FORMAT(pll1, 1, CLK_IS_CRITICAL, 0);
   275	K230_CLK_PLL_FORMAT(pll2, 2, CLK_IS_CRITICAL, 0);
   276	K230_CLK_PLL_FORMAT(pll3, 3, CLK_IS_CRITICAL, 0);
   277	
 > 278	struct k230_pll *k230_plls[] = {
   279		&pll0,
   280		&pll1,
   281		&pll2,
   282		&pll3,
   283	};
   284	
   285	K230_CLK_FIXED_FACTOR_FORMAT(pll0_div2, 1, 2, 0, &pll0.hw);
   286	K230_CLK_FIXED_FACTOR_FORMAT(pll0_div3, 1, 3, 0, &pll0.hw);
   287	K230_CLK_FIXED_FACTOR_FORMAT(pll0_div4, 1, 4, 0, &pll0.hw);
   288	K230_CLK_FIXED_FACTOR_FORMAT(pll0_div16, 1, 16, 0, &pll0.hw);
   289	K230_CLK_FIXED_FACTOR_FORMAT(pll1_div2, 1, 2, 0, &pll1.hw);
   290	K230_CLK_FIXED_FACTOR_FORMAT(pll1_div3, 1, 3, 0, &pll1.hw);
   291	K230_CLK_FIXED_FACTOR_FORMAT(pll1_div4, 1, 4, 0, &pll1.hw);
   292	K230_CLK_FIXED_FACTOR_FORMAT(pll2_div2, 1, 2, 0, &pll2.hw);
   293	K230_CLK_FIXED_FACTOR_FORMAT(pll2_div3, 1, 3, 0, &pll2.hw);
   294	K230_CLK_FIXED_FACTOR_FORMAT(pll2_div4, 1, 4, 0, &pll2.hw);
   295	K230_CLK_FIXED_FACTOR_FORMAT(pll3_div2, 1, 2, 0, &pll3.hw);
   296	K230_CLK_FIXED_FACTOR_FORMAT(pll3_div3, 1, 3, 0, &pll3.hw);
   297	K230_CLK_FIXED_FACTOR_FORMAT(pll3_div4, 1, 4, 0, &pll3.hw);
   298	
 > 299	struct clk_fixed_factor *k230_pll_divs[] = {
   300		&pll0_div2,
   301		&pll0_div3,
   302		&pll0_div4,
   303		&pll0_div16,
   304		&pll1_div2,
   305		&pll1_div3,
   306		&pll1_div4,
   307		&pll2_div2,
   308		&pll2_div3,
   309		&pll2_div4,
   310		&pll3_div2,
   311		&pll3_div3,
   312		&pll3_div4,
   313	};
   314	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
