Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B37395
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 04:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686025324; x=1717561324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWyNvnsaMuB6YC99F+bpm6nJnscDmckb/L/H4wMhJpk=;
  b=akdRk5sRbRHlpMkb9hZOo86qwALPzeLsNLdAySqnZvXMbEYfrsvrVsH/
   Ux7VOY2f//MmOGICd8HjYsQ2smZc+diYxXdgYbznHRP2wks9ufGRF9I1o
   5F7/FgAJnL1n1eZb3fqSe0gEdPp5JkVwtrOTiVW4jZVfO2zZB6OPl9B8D
   xWqW77IQKbGa8kUlYN74/rcdF8naP0pz1HbbwyKFn1uI4Kg4i/W2DYbAc
   kSYh3vUW/FFhIqpyWqWlWfU1dYE+RGX9Hor5J7vi2xH3u/pKL0a8JaCgy
   QAYTCIlTlasGvRScs7F7DDNyrqbscm2v7Rv5slxO9kCdw1ZXu0a6E3lRq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="384865463"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="384865463"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 21:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738606177"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="738606177"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 21:21:56 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6OCh-0004qH-12;
	Tue, 06 Jun 2023 04:21:55 +0000
Date: Tue, 6 Jun 2023 12:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <keescook@chromium.org>
Subject: [mark:atomics/fallback-rework 20/27]
 drivers/iommu/io-pgtable-arm.c:330:13: error: void value not ignored as it
 ought to be
Message-ID: <202306061212.UJZL2RTO-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git atomics/fallback-rework
head:   2700b7ea21189285722abd14018e17712a602c55
commit: 0111dce0dd79ba9060a8bae5af61d195f6d8570c [20/27] locking/atomic: scripts: restructure fallback ifdeffery
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230606/202306061212.UJZL2RTO-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=0111dce0dd79ba9060a8bae5af61d195f6d8570c
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark atomics/fallback-rework
        git checkout 0111dce0dd79ba9060a8bae5af61d195f6d8570c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061212.UJZL2RTO-lkp@intel.com/

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
