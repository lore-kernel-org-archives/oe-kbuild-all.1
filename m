Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657A2100BE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 22:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690238658; x=1721774658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1NV52sKnefJZ5RYJNwIEwgBKGeUL3qVqXStivumro6o=;
  b=VrBjqDrt2urpPXcvMWfcOoCpREBtq0RVpJjvXVsCkFfiWWfAC7FuT7JJ
   +rz1I8JcX05PK6K6Wml5KkHNol7rKgaEh5k8BJ/IJ3hp27FbeD535/hQF
   SUJV6XXOGROfn9lROnAW1aoNQb55nVzZFPcAzoCd+JxtYMRq5loo5d+J/
   q+6mPViPRN+XFgpKL52oFbUDqtb2qtqW0dJAy0R54yhtacyCIwXBdM73y
   BDYltemElYo92Nu1oGZHBCNGFnJyP/LDJGzfMVfzwxwwNp9DlvH6yjjNC
   ngZCCIgbfZx7sYokbVr0p9jVMmgwQa676KXXMTwJ3KY1vGboI5lO/akYQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367592165"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="367592165"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 15:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="795915654"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="795915654"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 24 Jul 2023 15:44:15 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO4Hn-000A5I-0N;
	Mon, 24 Jul 2023 22:44:15 +0000
Date: Tue, 25 Jul 2023 06:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <keescook@chromium.org>
Subject: drivers/iommu/io-pgtable-arm.c:330:13: error: void value not ignored
 as it ought to be
Message-ID: <202307250657.MeXQwmSN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   20ea1e7d13c1b544fe67c4a8dc3943bb1ab33e6f
commit: 9257959a6e5b4fca6fc8e985790bff62c2046f20 locking/atomic: scripts: restructure fallback ifdeffery
date:   7 weeks ago
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230725/202307250657.MeXQwmSN-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250657.MeXQwmSN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250657.MeXQwmSN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/io-pgtable-arm.c: In function 'arm_lpae_install_table':
>> drivers/iommu/io-pgtable-arm.c:330:13: error: void value not ignored as it ought to be
     330 |         old = cmpxchg64_relaxed(ptep, curr, new);
         |             ^
--
   drivers/iommu/io-pgtable-dart.c: In function 'dart_install_table':
>> drivers/iommu/io-pgtable-dart.c:168:13: error: void value not ignored as it ought to be
     168 |         old = cmpxchg64_relaxed(ptep, curr, new);
         |             ^
   drivers/iommu/io-pgtable-dart.c:157:25: warning: variable 'new' set but not used [-Wunused-but-set-variable]
     157 |         dart_iopte old, new;
         |                         ^~~


vim +330 drivers/iommu/io-pgtable-arm.c

c896c132b01895 Laurent Pinchart   2014-12-14  310  
fb3a95795da53d Robin Murphy       2017-06-22  311  static arm_lpae_iopte arm_lpae_install_table(arm_lpae_iopte *table,
fb3a95795da53d Robin Murphy       2017-06-22  312  					     arm_lpae_iopte *ptep,
2c3d273eabe8b1 Robin Murphy       2017-06-22  313  					     arm_lpae_iopte curr,
9abe2ac834851a Hector Martin      2021-11-20  314  					     struct arm_lpae_io_pgtable *data)
fb3a95795da53d Robin Murphy       2017-06-22  315  {
2c3d273eabe8b1 Robin Murphy       2017-06-22  316  	arm_lpae_iopte old, new;
9abe2ac834851a Hector Martin      2021-11-20  317  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
e1d3c0fd701df8 Will Deacon        2014-11-14  318  
9abe2ac834851a Hector Martin      2021-11-20  319  	new = paddr_to_iopte(__pa(table), data) | ARM_LPAE_PTE_TYPE_TABLE;
fb3a95795da53d Robin Murphy       2017-06-22  320  	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS)
fb3a95795da53d Robin Murphy       2017-06-22  321  		new |= ARM_LPAE_PTE_NSTABLE;
e1d3c0fd701df8 Will Deacon        2014-11-14  322  
77f3445866c39d Will Deacon        2017-06-23  323  	/*
77f3445866c39d Will Deacon        2017-06-23  324  	 * Ensure the table itself is visible before its PTE can be.
77f3445866c39d Will Deacon        2017-06-23  325  	 * Whilst we could get away with cmpxchg64_release below, this
77f3445866c39d Will Deacon        2017-06-23  326  	 * doesn't have any ordering semantics when !CONFIG_SMP.
77f3445866c39d Will Deacon        2017-06-23  327  	 */
77f3445866c39d Will Deacon        2017-06-23  328  	dma_wmb();
2c3d273eabe8b1 Robin Murphy       2017-06-22  329  
2c3d273eabe8b1 Robin Murphy       2017-06-22 @330  	old = cmpxchg64_relaxed(ptep, curr, new);
2c3d273eabe8b1 Robin Murphy       2017-06-22  331  
4f41845b340783 Will Deacon        2019-06-25  332  	if (cfg->coherent_walk || (old & ARM_LPAE_PTE_SW_SYNC))
2c3d273eabe8b1 Robin Murphy       2017-06-22  333  		return old;
2c3d273eabe8b1 Robin Murphy       2017-06-22  334  
2c3d273eabe8b1 Robin Murphy       2017-06-22  335  	/* Even if it's not ours, there's no point waiting; just kick it */
41e1eb2546e9c8 Isaac J. Manjarres 2021-06-16  336  	__arm_lpae_sync_pte(ptep, 1, cfg);
2c3d273eabe8b1 Robin Murphy       2017-06-22  337  	if (old == curr)
2c3d273eabe8b1 Robin Murphy       2017-06-22  338  		WRITE_ONCE(*ptep, new | ARM_LPAE_PTE_SW_SYNC);
2c3d273eabe8b1 Robin Murphy       2017-06-22  339  
2c3d273eabe8b1 Robin Murphy       2017-06-22  340  	return old;
e1d3c0fd701df8 Will Deacon        2014-11-14  341  }
e1d3c0fd701df8 Will Deacon        2014-11-14  342  

:::::: The code at line 330 was first introduced by commit
:::::: 2c3d273eabe8b1ed3b3cffe2c79643b1bf7e2d4a iommu/io-pgtable-arm: Support lockless operation

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
