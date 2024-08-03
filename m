Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0156514E2E9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 11:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722684344; cv=none; b=ovkDx/QBsYwmSMt2/nJuQcw2Gx3u3l75d+7mf0OgWQOf56leaE/vk5L68iIUPqEX/462ASeVTotVc8qdwic6QeMgFM4Tk3yhEkBQ63H1/I3qgDC8zHvwJ9hFHaEjat09Y/olJtImuR4xHhoUG+OrtUUEi9mu8seqPYNpsQRsn5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722684344; c=relaxed/simple;
	bh=IPuHjCqQZy+QJ51KTBQrcXVgTvxo+Y3QLu47eRJWPiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KaQ+nDa9g5kiYLVoGikTgPxfnvVc+Ah8mvHkbGdDqKuOetgoLLzVXn1mq8PR2ddmlH7MX3t8APo6l06JVWqDLTG1HVk0WDPvAXKSZ8SqeIrsX+MFgL+zIJFh3EWk5STqZkXocTE7dZdZ9SpCEAIOh3aBBCxAaqU6KoHL/toLx0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPJHkk3i; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPJHkk3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722684342; x=1754220342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IPuHjCqQZy+QJ51KTBQrcXVgTvxo+Y3QLu47eRJWPiI=;
  b=RPJHkk3iyQFpeXwzMRnrZsUysu/2XaYd5uALYDdAUj8ssa5HtNiMdGZb
   O+o4Bw7qQ2y+m+IO2cVRyurqQ130mtbufB8HtLIt6tOx2IWdY+f/8FxXk
   31tyUAhaY3w6810QaJaHLEhYcWkw6HvMJwogKInAaQFFFkQ+BPJVq5GL2
   BJ9oUcxcV/yKKF4d6b9IKbFp2rC9ZBFWQGBjtFFySmhr8ius7jwVwXHAW
   ZmofLhhj0tsPkFBfCzvfvpZBnkS0xHX10tXUIp5slRcWpxOYmZADqSnSe
   fid0mtdnDqTqRwx3iJTcEEpjjSECBHBlp2DIBeFudR2JC7rQ0k9KC7ZrM
   w==;
X-CSE-ConnectionGUID: DKrJaEolTpS7IxD9n8Ubxw==
X-CSE-MsgGUID: /nNzvzMgRx2N/oI3Ni+gUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20816455"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20816455"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 04:25:39 -0700
X-CSE-ConnectionGUID: 2gG0yxuJRJm7cwiu/MwIKQ==
X-CSE-MsgGUID: lJdHd0SARw26vii2KfoWew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="86275230"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Aug 2024 04:25:37 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saCtD-0000Pa-1o;
	Sat, 03 Aug 2024 11:25:35 +0000
Date: Sat, 3 Aug 2024 19:24:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/platforms/85xx/smp.c:252:19: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202408031916.rl8Y5JWw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hari,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   17712b7ea0756799635ba159cc773082230ed028
commit: 7b090b6ff51b9a9f002139660672f662b95f0630 powerpc/85xx: fix compile error without CONFIG_CRASH_DUMP
date:   3 months ago
config: powerpc64-randconfig-r121-20240802 (https://download.01.org/0day-ci/archive/20240803/202408031916.rl8Y5JWw-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20240803/202408031916.rl8Y5JWw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031916.rl8Y5JWw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/powerpc/platforms/85xx/smp.c:218:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@     got void * @@
   arch/powerpc/platforms/85xx/smp.c:218:28: sparse:     expected struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:218:28: sparse:     got void *
   arch/powerpc/platforms/85xx/smp.c:227:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:227:36: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:227:36: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:249:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:249:26: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:249:26: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
>> arch/powerpc/platforms/85xx/smp.c:252:19: sparse: sparse: cast removes address space '__iomem' of expression
>> arch/powerpc/platforms/85xx/smp.c:252:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long volatile [noderef] [usertype] __iomem *addr @@     got unsigned long long [usertype] * @@
   arch/powerpc/platforms/85xx/smp.c:252:19: sparse:     expected unsigned long long volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/85xx/smp.c:252:19: sparse:     got unsigned long long [usertype] *
   arch/powerpc/platforms/85xx/smp.c:266:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:266:26: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:266:26: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got unsigned int * @@
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     got unsigned int *
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got unsigned int * @@
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     got unsigned int *
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got unsigned int * @@
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     got unsigned int *
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got unsigned int * @@
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     got unsigned int *

vim +/__iomem +252 arch/powerpc/platforms/85xx/smp.c

e16c8765533a15 Andy Fleming     2011-12-08  187  
2f4f1f815bc6d0 chenhui zhao     2015-11-20  188  static int smp_85xx_start_cpu(int cpu)
d5b26db2cfcf09 Kumar Gala       2008-11-19  189  {
2f4f1f815bc6d0 chenhui zhao     2015-11-20  190  	int ret = 0;
d5b26db2cfcf09 Kumar Gala       2008-11-19  191  	struct device_node *np;
2f4f1f815bc6d0 chenhui zhao     2015-11-20  192  	const u64 *cpu_rel_addr;
2f4f1f815bc6d0 chenhui zhao     2015-11-20  193  	unsigned long flags;
d1d47ec6e62ab0 Peter Tyser      2009-12-18  194  	int ioremappable;
2f4f1f815bc6d0 chenhui zhao     2015-11-20  195  	int hw_cpu = get_hard_smp_processor_id(cpu);
2f4f1f815bc6d0 chenhui zhao     2015-11-20  196  	struct epapr_spin_table __iomem *spin_table;
e16c8765533a15 Andy Fleming     2011-12-08  197  
2f4f1f815bc6d0 chenhui zhao     2015-11-20  198  	np = of_get_cpu_node(cpu, NULL);
d5b26db2cfcf09 Kumar Gala       2008-11-19  199  	cpu_rel_addr = of_get_property(np, "cpu-release-addr", NULL);
2f4f1f815bc6d0 chenhui zhao     2015-11-20  200  	if (!cpu_rel_addr) {
2f4f1f815bc6d0 chenhui zhao     2015-11-20  201  		pr_err("No cpu-release-addr for cpu %d\n", cpu);
de300974761d92 Michael Ellerman 2011-04-11  202  		return -ENOENT;
d5b26db2cfcf09 Kumar Gala       2008-11-19  203  	}
d5b26db2cfcf09 Kumar Gala       2008-11-19  204  
d1d47ec6e62ab0 Peter Tyser      2009-12-18  205  	/*
d1d47ec6e62ab0 Peter Tyser      2009-12-18  206  	 * A secondary core could be in a spinloop in the bootpage
d1d47ec6e62ab0 Peter Tyser      2009-12-18  207  	 * (0xfffff000), somewhere in highmem, or somewhere in lowmem.
d1d47ec6e62ab0 Peter Tyser      2009-12-18  208  	 * The bootpage and highmem can be accessed via ioremap(), but
d1d47ec6e62ab0 Peter Tyser      2009-12-18  209  	 * we need to directly access the spinloop if its in lowmem.
d1d47ec6e62ab0 Peter Tyser      2009-12-18  210  	 */
0d897255e79e26 Michael Ellerman 2022-04-07  211  	ioremappable = *cpu_rel_addr > virt_to_phys(high_memory - 1);
d1d47ec6e62ab0 Peter Tyser      2009-12-18  212  
d5b26db2cfcf09 Kumar Gala       2008-11-19  213  	/* Map the spin table */
d1d47ec6e62ab0 Peter Tyser      2009-12-18  214  	if (ioremappable)
aa91796ec46339 Christophe Leroy 2018-10-09  215  		spin_table = ioremap_coherent(*cpu_rel_addr,
aa91796ec46339 Christophe Leroy 2018-10-09  216  					      sizeof(struct epapr_spin_table));
d1d47ec6e62ab0 Peter Tyser      2009-12-18  217  	else
15f34eb12340b2 Zhao Chenhui     2012-07-20  218  		spin_table = phys_to_virt(*cpu_rel_addr);
d5b26db2cfcf09 Kumar Gala       2008-11-19  219  
cb1ffb6204712b Kumar Gala       2009-06-19  220  	local_irq_save(flags);
2f4f1f815bc6d0 chenhui zhao     2015-11-20  221  	hard_irq_disable();
d0832a75075b11 Zhao Chenhui     2012-07-20  222  
3dc709e518b473 Xiaoming Ni      2021-11-26  223  	if (qoriq_pm_ops && qoriq_pm_ops->cpu_up_prepare)
2f4f1f815bc6d0 chenhui zhao     2015-11-20  224  		qoriq_pm_ops->cpu_up_prepare(cpu);
cb1ffb6204712b Kumar Gala       2009-06-19  225  
2f4f1f815bc6d0 chenhui zhao     2015-11-20  226  	/* if cpu is not spinning, reset it */
2f4f1f815bc6d0 chenhui zhao     2015-11-20  227  	if (read_spin_table_addr_l(spin_table) != 1) {
d0832a75075b11 Zhao Chenhui     2012-07-20  228  		/*
d0832a75075b11 Zhao Chenhui     2012-07-20  229  		 * We don't set the BPTR register here since it already points
d0832a75075b11 Zhao Chenhui     2012-07-20  230  		 * to the boot page properly.
d0832a75075b11 Zhao Chenhui     2012-07-20  231  		 */
2f4f1f815bc6d0 chenhui zhao     2015-11-20  232  		mpic_reset_core(cpu);
d0832a75075b11 Zhao Chenhui     2012-07-20  233  
bc15236fbed1e0 York Sun         2012-09-29  234  		/*
bc15236fbed1e0 York Sun         2012-09-29  235  		 * wait until core is ready...
bc15236fbed1e0 York Sun         2012-09-29  236  		 * We need to invalidate the stale data, in case the boot
bc15236fbed1e0 York Sun         2012-09-29  237  		 * loader uses a cache-inhibited spin table.
bc15236fbed1e0 York Sun         2012-09-29  238  		 */
bc15236fbed1e0 York Sun         2012-09-29  239  		if (!spin_event_timeout(
bc15236fbed1e0 York Sun         2012-09-29  240  				read_spin_table_addr_l(spin_table) == 1,
d0832a75075b11 Zhao Chenhui     2012-07-20  241  				10000, 100)) {
2f4f1f815bc6d0 chenhui zhao     2015-11-20  242  			pr_err("timeout waiting for cpu %d to reset\n",
2f4f1f815bc6d0 chenhui zhao     2015-11-20  243  				hw_cpu);
2f4f1f815bc6d0 chenhui zhao     2015-11-20  244  			ret = -EAGAIN;
2f4f1f815bc6d0 chenhui zhao     2015-11-20  245  			goto err;
d0832a75075b11 Zhao Chenhui     2012-07-20  246  		}
d0832a75075b11 Zhao Chenhui     2012-07-20  247  	}
decbb280bb8e3b Kumar Gala       2011-02-14  248  
bc15236fbed1e0 York Sun         2012-09-29  249  	flush_spin_table(spin_table);
d0832a75075b11 Zhao Chenhui     2012-07-20  250  	out_be32(&spin_table->pir, hw_cpu);
2f4f1f815bc6d0 chenhui zhao     2015-11-20  251  #ifdef CONFIG_PPC64
15f34eb12340b2 Zhao Chenhui     2012-07-20 @252  	out_be64((u64 *)(&spin_table->addr_h),
2751b628c97e66 Anton Blanchard  2014-03-11  253  		__pa(ppc_function_entry(generic_secondary_smp_init)));
2f4f1f815bc6d0 chenhui zhao     2015-11-20  254  #else
eeb09917c138cc Bai Yingjie      2020-01-06  255  #ifdef CONFIG_PHYS_ADDR_T_64BIT
eeb09917c138cc Bai Yingjie      2020-01-06  256  	/*
eeb09917c138cc Bai Yingjie      2020-01-06  257  	 * We need also to write addr_h to spin table for systems
eeb09917c138cc Bai Yingjie      2020-01-06  258  	 * in which their physical memory start address was configured
eeb09917c138cc Bai Yingjie      2020-01-06  259  	 * to above 4G, otherwise the secondary core can not get
eeb09917c138cc Bai Yingjie      2020-01-06  260  	 * correct entry to start from.
eeb09917c138cc Bai Yingjie      2020-01-06  261  	 */
eeb09917c138cc Bai Yingjie      2020-01-06  262  	out_be32(&spin_table->addr_h, __pa(__early_start) >> 32);
eeb09917c138cc Bai Yingjie      2020-01-06  263  #endif
2f4f1f815bc6d0 chenhui zhao     2015-11-20  264  	out_be32(&spin_table->addr_l, __pa(__early_start));
5b8544c38e6fde Kumar Gala       2010-10-08  265  #endif
2f4f1f815bc6d0 chenhui zhao     2015-11-20  266  	flush_spin_table(spin_table);
2f4f1f815bc6d0 chenhui zhao     2015-11-20  267  err:
d5b26db2cfcf09 Kumar Gala       2008-11-19  268  	local_irq_restore(flags);
d5b26db2cfcf09 Kumar Gala       2008-11-19  269  
d1d47ec6e62ab0 Peter Tyser      2009-12-18  270  	if (ioremappable)
15f34eb12340b2 Zhao Chenhui     2012-07-20  271  		iounmap(spin_table);
cb1ffb6204712b Kumar Gala       2009-06-19  272  
d0832a75075b11 Zhao Chenhui     2012-07-20  273  	return ret;
d5b26db2cfcf09 Kumar Gala       2008-11-19  274  }
d5b26db2cfcf09 Kumar Gala       2008-11-19  275  

:::::: The code at line 252 was first introduced by commit
:::::: 15f34eb12340b2c2e0cd90c5987ad6b5f73b79b7 powerpc/85xx: Replace epapr spin table macros/defines with a struct

:::::: TO: Zhao Chenhui <chenhui.zhao@freescale.com>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
