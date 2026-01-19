Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CF93587BE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 10:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819840; cv=none; b=c0G1ySyyAnn1hoRwBglqEF2Y94Cei5Jo/SB/IMihWgKXTKsoCIVn02QDxp8C3UCOgKSl6aI8aCrzDtjdAEDd7fRzz8ayrA77z1dGU1U7pPrUztoVfD8Yul6DJpgymvE3lynQ/Vt0JIrZ/AqZ6tZpqFFyInstnYtBmY0JahU/5Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819840; c=relaxed/simple;
	bh=20tywZ0qhtkSuzCyv0kQK93SxQxFifYdQsg46DNEdYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MtPRB/dGzK97zCq9uiWKTnvWjXiJjTx/5yrdOfAcViORIoSSlewojBxc83F6VMCzhSqyMl5VBCtzIfkT8V9V9GJCPwWLRNNXm6fjgfgOCEjMaNheQcH014P1OOZ9DR6YfFViEdRIP97MW53j9F9/orrQLBmh9RgDmY0BNc0neds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cx269/d8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cx269/d8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768819826; x=1800355826;
  h=date:from:to:cc:subject:message-id;
  bh=20tywZ0qhtkSuzCyv0kQK93SxQxFifYdQsg46DNEdYE=;
  b=Cx269/d8l1174b6Bp+o52bSaV4XWTsF7NFiZTXjQAF68zgIaD6EdXmwk
   3mrVEth+RgyKSSXcKoWR+GsJbQib6IhZf3l8WjNETYVxT1sOW+qXU++he
   iox2Ef/4kBBeo3m6HS9nNrHKbJ25M/p99kYR3Qp64NBpB857lqRo0tMcZ
   mgHRLM/+HMHVrizEkhVBiGuY2URmzy+z0NyILFXDb8PP8Vbr18dHa+Ya7
   pPpicw7i4DfF5M8seyUYlQyT2opWEdUAQlEBcXkXpSwhZiZXEQq+top2d
   67TboyIQkEqJXSxlRzPlyEvBNg7Mv6/gq2Bhood2c/HaLcXKS6f95iyWR
   w==;
X-CSE-ConnectionGUID: L6ZvSYzWQiSYmKbV7orAtA==
X-CSE-MsgGUID: Co5/MeNBT6yGejBqaOSuGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70077581"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70077581"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:50:26 -0800
X-CSE-ConnectionGUID: F1JRxvmwSxyMdsnt5Vm9Ww==
X-CSE-MsgGUID: vEiIw1XJTkKD1I/uREz8pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210854617"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jan 2026 02:50:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhmpx-00000000Nhd-2jxH;
	Mon, 19 Jan 2026 10:50:21 +0000
Date: Mon, 19 Jan 2026 18:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Wanner <Ryan.Wanner@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: arch/arm/mach-at91/pm.c:1005:30: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202601191830.UT3aY6bo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ryan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 452d18c78a469cd18b3f7bc7bc9427f9af390f7e ARM: at91: add new SoC sama7d65
date:   1 year, 1 month ago
config: arm-randconfig-r112-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191830.UT3aY6bo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191830.UT3aY6bo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191830.UT3aY6bo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mach-at91/pm.c:1005:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void ( *static [assigned] [toplevel] at91_suspend_sram_fn )( ... ) @@     got void [noderef] __iomem * @@
   arch/arm/mach-at91/pm.c:1005:30: sparse:     expected void ( *static [assigned] [toplevel] at91_suspend_sram_fn )( ... )
   arch/arm/mach-at91/pm.c:1005:30: sparse:     got void [noderef] __iomem *

vim +1005 arch/arm/mach-at91/pm.c

fbc7edca5a7dd4 Alexandre Belloni  2015-09-30   970  
d2e46790559676 Alexandre Belloni  2015-01-15   971  static void __init at91_pm_sram_init(void)
d2e46790559676 Alexandre Belloni  2015-01-15   972  {
d2e46790559676 Alexandre Belloni  2015-01-15   973  	struct gen_pool *sram_pool;
d2e46790559676 Alexandre Belloni  2015-01-15   974  	phys_addr_t sram_pbase;
d2e46790559676 Alexandre Belloni  2015-01-15   975  	unsigned long sram_base;
d2e46790559676 Alexandre Belloni  2015-01-15   976  	struct device_node *node;
4a031f7dbe497a Alexandre Belloni  2015-03-03   977  	struct platform_device *pdev = NULL;
d2e46790559676 Alexandre Belloni  2015-01-15   978  
4a031f7dbe497a Alexandre Belloni  2015-03-03   979  	for_each_compatible_node(node, NULL, "mmio-sram") {
4a031f7dbe497a Alexandre Belloni  2015-03-03   980  		pdev = of_find_device_by_node(node);
4a031f7dbe497a Alexandre Belloni  2015-03-03   981  		if (pdev) {
4a031f7dbe497a Alexandre Belloni  2015-03-03   982  			of_node_put(node);
4a031f7dbe497a Alexandre Belloni  2015-03-03   983  			break;
4a031f7dbe497a Alexandre Belloni  2015-03-03   984  		}
d2e46790559676 Alexandre Belloni  2015-01-15   985  	}
d2e46790559676 Alexandre Belloni  2015-01-15   986  
d2e46790559676 Alexandre Belloni  2015-01-15   987  	if (!pdev) {
d2e46790559676 Alexandre Belloni  2015-01-15   988  		pr_warn("%s: failed to find sram device!\n", __func__);
4a031f7dbe497a Alexandre Belloni  2015-03-03   989  		return;
d2e46790559676 Alexandre Belloni  2015-01-15   990  	}
d2e46790559676 Alexandre Belloni  2015-01-15   991  
73858173593c31 Vladimir Zapolskiy 2015-09-04   992  	sram_pool = gen_pool_get(&pdev->dev, NULL);
d2e46790559676 Alexandre Belloni  2015-01-15   993  	if (!sram_pool) {
d2e46790559676 Alexandre Belloni  2015-01-15   994  		pr_warn("%s: sram pool unavailable!\n", __func__);
f87a4f022c44e5 yu kuai            2020-06-04   995  		goto out_put_device;
d2e46790559676 Alexandre Belloni  2015-01-15   996  	}
d2e46790559676 Alexandre Belloni  2015-01-15   997  
5726a8b9686348 Wenyou Yang        2015-03-09   998  	sram_base = gen_pool_alloc(sram_pool, at91_pm_suspend_in_sram_sz);
d2e46790559676 Alexandre Belloni  2015-01-15   999  	if (!sram_base) {
5726a8b9686348 Wenyou Yang        2015-03-09  1000  		pr_warn("%s: unable to alloc sram!\n", __func__);
f87a4f022c44e5 yu kuai            2020-06-04  1001  		goto out_put_device;
d2e46790559676 Alexandre Belloni  2015-01-15  1002  	}
d2e46790559676 Alexandre Belloni  2015-01-15  1003  
d2e46790559676 Alexandre Belloni  2015-01-15  1004  	sram_pbase = gen_pool_virt_to_phys(sram_pool, sram_base);
5726a8b9686348 Wenyou Yang        2015-03-09 @1005  	at91_suspend_sram_fn = __arm_ioremap_exec(sram_pbase,
5726a8b9686348 Wenyou Yang        2015-03-09  1006  					at91_pm_suspend_in_sram_sz, false);
5726a8b9686348 Wenyou Yang        2015-03-09  1007  	if (!at91_suspend_sram_fn) {
d94e688cae5661 Wenyou Yang        2015-03-09  1008  		pr_warn("SRAM: Could not map\n");
f87a4f022c44e5 yu kuai            2020-06-04  1009  		goto out_put_device;
d94e688cae5661 Wenyou Yang        2015-03-09  1010  	}
d94e688cae5661 Wenyou Yang        2015-03-09  1011  
5726a8b9686348 Wenyou Yang        2015-03-09  1012  	/* Copy the pm suspend handler to SRAM */
5726a8b9686348 Wenyou Yang        2015-03-09  1013  	at91_suspend_sram_fn = fncpy(at91_suspend_sram_fn,
5726a8b9686348 Wenyou Yang        2015-03-09  1014  			&at91_pm_suspend_in_sram, at91_pm_suspend_in_sram_sz);
f87a4f022c44e5 yu kuai            2020-06-04  1015  	return;
f87a4f022c44e5 yu kuai            2020-06-04  1016  
f87a4f022c44e5 yu kuai            2020-06-04  1017  out_put_device:
f87a4f022c44e5 yu kuai            2020-06-04  1018  	put_device(&pdev->dev);
f87a4f022c44e5 yu kuai            2020-06-04  1019  	return;
d2e46790559676 Alexandre Belloni  2015-01-15  1020  }
d2e46790559676 Alexandre Belloni  2015-01-15  1021  

:::::: The code at line 1005 was first introduced by commit
:::::: 5726a8b9686348e8d203f1bbf9d5fc1bb5899518 ARM: at91/pm: rename function name: at91_slow_clock() --> at91_pm_suspend_sram_fn()

:::::: TO: Wenyou Yang <wenyou.yang@atmel.com>
:::::: CC: Nicolas Ferre <nicolas.ferre@atmel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
