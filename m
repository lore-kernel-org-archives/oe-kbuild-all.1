Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D135695
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 00:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670231; cv=none; b=N46xZsHlsocMbkW6bW/n+PTkn5lu08CHjZFFqMbOYT+WCmvdMVqiuSa19vBibVWs8oGQnSmNo9qzJD8jy86DCAKCGJO48xoKUEF+iNs2qcaJgDHCwNyDwz3WYyUF3g6bs3tVJ1QKTK7S7cTyB0utognVUPr+l1UlRMPGIuSP3r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670231; c=relaxed/simple;
	bh=gFiJgei9kzVtHFdY6C1mSm4BYpqpqBI+XmrXd7Jm0VQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iwq/2QstL9AnWlOrCzS03mh+b2PtQqMDjHHCZw1FCPjUygP4kjRePEyxG1jo16XfsTT7/AIqYD+c6OYKfvZ/5N5hoo+cQUMOsMN7m8WuFaX6MCfbjeIHJAy9bCI038KJ3tHTzmHE/duH2oBcI5NIK+qSVyVzTBIpcNINFMm837U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6IjXvPf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6IjXvPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772670230; x=1804206230;
  h=date:from:to:cc:subject:message-id;
  bh=gFiJgei9kzVtHFdY6C1mSm4BYpqpqBI+XmrXd7Jm0VQ=;
  b=W6IjXvPfo1M2+cDj7eEatG2lG8d8GRorY8kACScR6isVUmVwPVrXuIh1
   oqVXP8PUSbTuZEQszjCdCk6qu9j7ZEgvf76yQtRtvIZGkfJ8PaA/V4WOK
   ZxnvAEGgXkgnBN30XQthRtu/zgrtlQCUDL+zBoQDLSAO10KKghbfAxqrB
   H5JG6913mcI1dnb9ggIWEVdiYpGc+PhdOLhmH8XQ+07OUcCGNnRGIASz8
   Dq1xk33dpwnUAawoR49/K7W091QHFWXPwqtL5nniVFZk58Anrat/a2DLA
   eHrGZdRyCgOPpihFTdCIWRdpx+ona/R+IO+kl8WdyX5toO8SLBvNtKK3R
   g==;
X-CSE-ConnectionGUID: q1V7A136Q0enPryLzEcaTQ==
X-CSE-MsgGUID: /QQrstbTRjeB7qgkFLX9VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73445722"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73445722"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 16:23:50 -0800
X-CSE-ConnectionGUID: Mq1BPbaPRVqWvHrPbntZUw==
X-CSE-MsgGUID: BMyK6c+PQRyw/3zKRFyZVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="215383108"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Mar 2026 16:23:47 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxwVF-000000004nu-212I;
	Thu, 05 Mar 2026 00:23:45 +0000
Date: Thu, 05 Mar 2026 08:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 7/15]
 drivers/hwspinlock/sprd_hwspinlock.c:75:30: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202603050852.A6WYAQG7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
head:   f2fc589840b1a727d4318cd5e9fc99d23fb3a35c
commit: a2e0dd64061bc41ef377813e9a1626e8b1fa54c7 [7/15] hwspinlock: sprd: use new callback to initialize hwspinlock priv
config: microblaze-randconfig-r121-20260304 (https://download.01.org/0day-ci/archive/20260305/202603050852.A6WYAQG7-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050852.A6WYAQG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050852.A6WYAQG7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hwspinlock/sprd_hwspinlock.c:44:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/hwspinlock/sprd_hwspinlock.c:44:50: sparse:     expected void [noderef] __iomem *addr
   drivers/hwspinlock/sprd_hwspinlock.c:44:50: sparse:     got void *
   drivers/hwspinlock/sprd_hwspinlock.c:62:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void * @@
   drivers/hwspinlock/sprd_hwspinlock.c:62:55: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/sprd_hwspinlock.c:62:55: sparse:     got void *
>> drivers/hwspinlock/sprd_hwspinlock.c:75:30: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got void *init_data @@
   drivers/hwspinlock/sprd_hwspinlock.c:75:30: sparse:     expected void [noderef] __iomem *base
   drivers/hwspinlock/sprd_hwspinlock.c:75:30: sparse:     got void *init_data
>> drivers/hwspinlock/sprd_hwspinlock.c:77:21: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/sprd_hwspinlock.c:77:21: sparse:     expected void *
   drivers/hwspinlock/sprd_hwspinlock.c:77:21: sparse:     got void [noderef] __iomem *
>> drivers/hwspinlock/sprd_hwspinlock.c:137:71: sparse: sparse: incorrect type in argument 6 (different address spaces) @@     expected void *init_data @@     got void [noderef] __iomem *base @@
   drivers/hwspinlock/sprd_hwspinlock.c:137:71: sparse:     expected void *init_data
   drivers/hwspinlock/sprd_hwspinlock.c:137:71: sparse:     got void [noderef] __iomem *base

vim +75 drivers/hwspinlock/sprd_hwspinlock.c

    72	
    73	static void *sprd_hwspinlock_init_priv(int local_id, void *init_data)
    74	{
  > 75		void __iomem *base = init_data;
    76	
  > 77		return base + HWSPINLOCK_TOKEN(local_id);
    78	}
    79	
    80	static const struct hwspinlock_ops sprd_hwspinlock_ops = {
    81		.trylock = sprd_hwspinlock_trylock,
    82		.unlock = sprd_hwspinlock_unlock,
    83		.relax = sprd_hwspinlock_relax,
    84		.init_priv = sprd_hwspinlock_init_priv,
    85	};
    86	
    87	static void sprd_hwspinlock_disable(void *data)
    88	{
    89		struct sprd_hwspinlock_dev *sprd_hwlock = data;
    90	
    91		clk_disable_unprepare(sprd_hwlock->clk);
    92	}
    93	
    94	static int sprd_hwspinlock_probe(struct platform_device *pdev)
    95	{
    96		struct sprd_hwspinlock_dev *sprd_hwlock;
    97		int ret;
    98	
    99		if (!pdev->dev.of_node)
   100			return -ENODEV;
   101	
   102		sprd_hwlock = devm_kzalloc(&pdev->dev,
   103					   struct_size(sprd_hwlock, bank.lock, SPRD_HWLOCKS_NUM),
   104					   GFP_KERNEL);
   105		if (!sprd_hwlock)
   106			return -ENOMEM;
   107	
   108		sprd_hwlock->base = devm_platform_ioremap_resource(pdev, 0);
   109		if (IS_ERR(sprd_hwlock->base))
   110			return PTR_ERR(sprd_hwlock->base);
   111	
   112		sprd_hwlock->clk = devm_clk_get(&pdev->dev, "enable");
   113		if (IS_ERR(sprd_hwlock->clk)) {
   114			dev_err(&pdev->dev, "get hwspinlock clock failed!\n");
   115			return PTR_ERR(sprd_hwlock->clk);
   116		}
   117	
   118		ret = clk_prepare_enable(sprd_hwlock->clk);
   119		if (ret)
   120			return ret;
   121	
   122		ret = devm_add_action_or_reset(&pdev->dev, sprd_hwspinlock_disable,
   123					       sprd_hwlock);
   124		if (ret) {
   125			dev_err(&pdev->dev,
   126				"Failed to add hwspinlock disable action\n");
   127			return ret;
   128		}
   129	
   130		/* set the hwspinlock to record user id to identify subsystems */
   131		writel(HWSPINLOCK_USER_BITS, sprd_hwlock->base + HWSPINLOCK_RECCTRL);
   132	
   133		platform_set_drvdata(pdev, sprd_hwlock);
   134	
   135		return devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
   136						 &sprd_hwspinlock_ops, 0,
 > 137						 SPRD_HWLOCKS_NUM, sprd_hwlock->base);
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
