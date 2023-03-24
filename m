Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBB2747E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679674040; x=1711210040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cgypw8LJFVvriG1X9vCmnopQyzL+hfDNnV2LTeexVfw=;
  b=QoiWGsk8M9LAiiKl4bVCk6N0VOpCOKI7nTpiUflQlSHjKpdqGcw9mjuz
   Gpvrknkp6Z/u4fhuhWQiKekldkgtp448ZbLAk+mE99ZwDdsmvFMIWIPS1
   4EuW4UgXNmLGvLoERUDDp4KmwyVwAeV1C3kmGMI1rELb/e4GQS8z5J8Uw
   c6L6dG43TRU0H9cJdQg2EhFERoSlgiSIZM29bOXXE7zcPFEWlepAVvdie
   HFvnfTKNXCFn33fsQjqgIsuGzajFIQHY6V0YaGgt47m9Q1ZyWWpwvbCtx
   CCC1ogsUiu2yPkxrgr+Mm/bqDSLT1MlmEsrGG2YowBtTxOn6uy1zXv+b6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="338535321"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="338535321"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 09:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="747192492"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="747192492"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Mar 2023 09:04:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfjtt-000FRW-0j;
	Fri, 24 Mar 2023 16:04:21 +0000
Date: Sat, 25 Mar 2023 00:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org
Subject: [arnd-asm-generic:dma-sync-rework 20/20]
 arch/openrisc/kernel/dma.c:115:19: error: 'addr' undeclared; did you mean
 'paddr'?
Message-ID: <202303242328.VY7INnaA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git dma-sync-rework
head:   9a711fbea373208c1eeb2fafb0c744bc23a79a43
commit: 9a711fbea373208c1eeb2fafb0c744bc23a79a43 [20/20] dma-mapping: replace custom code with generic implementation
config: openrisc-randconfig-r002-20230322 (https://download.01.org/0day-ci/archive/20230324/202303242328.VY7INnaA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/commit/?id=9a711fbea373208c1eeb2fafb0c744bc23a79a43
        git remote add arnd-asm-generic https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
        git fetch --no-tags arnd-asm-generic dma-sync-rework
        git checkout 9a711fbea373208c1eeb2fafb0c744bc23a79a43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303242328.VY7INnaA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/openrisc/kernel/dma.c: In function 'arch_dma_cache_inv':
>> arch/openrisc/kernel/dma.c:115:19: error: 'addr' undeclared (first use in this function); did you mean 'paddr'?
     115 |         for (cl = addr; cl < addr + size;
         |                   ^~~~
         |                   paddr
   arch/openrisc/kernel/dma.c:115:19: note: each undeclared identifier is reported only once for each function it appears in
   arch/openrisc/kernel/dma.c: In function 'arch_dma_cache_wback_inv':
   arch/openrisc/kernel/dma.c:126:19: error: 'addr' undeclared (first use in this function); did you mean 'paddr'?
     126 |         for (cl = addr; cl < addr + size;
         |                   ^~~~
         |                   paddr
   arch/openrisc/kernel/dma.c:126:9: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
     126 |         for (cl = addr; cl < addr + size;
         |         ^~~
   arch/openrisc/kernel/dma.c:129:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'for'
     129 |                 break;
         |                 ^~~~~
>> arch/openrisc/kernel/dma.c:129:17: error: break statement not within loop or switch


vim +115 arch/openrisc/kernel/dma.c

9a711fbea37320 Arnd Bergmann       2023-03-22  108  
9a711fbea37320 Arnd Bergmann       2023-03-22  109  static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
9a711fbea37320 Arnd Bergmann       2023-03-22  110  {
9a711fbea37320 Arnd Bergmann       2023-03-22  111  	unsigned long cl;
9a711fbea37320 Arnd Bergmann       2023-03-22  112  	struct cpuinfo_or1k *cpuinfo = &cpuinfo_or1k[smp_processor_id()];
9a711fbea37320 Arnd Bergmann       2023-03-22  113  
a39af6f7b806f2 Jonas Bonn          2011-06-04  114  	/* Invalidate the dcache for the requested range */
a39af6f7b806f2 Jonas Bonn          2011-06-04 @115  	for (cl = addr; cl < addr + size;
8e6d08e0a15e7d Stefan Kristiansson 2014-05-11  116  	     cl += cpuinfo->dcache_block_size)
a39af6f7b806f2 Jonas Bonn          2011-06-04  117  		mtspr(SPR_DCBIR, cl);
9a711fbea37320 Arnd Bergmann       2023-03-22  118  }
9a711fbea37320 Arnd Bergmann       2023-03-22  119  
9a711fbea37320 Arnd Bergmann       2023-03-22  120  static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
9a711fbea37320 Arnd Bergmann       2023-03-22  121  {
9a711fbea37320 Arnd Bergmann       2023-03-22  122  	unsigned long cl;
9a711fbea37320 Arnd Bergmann       2023-03-22  123  	struct cpuinfo_or1k *cpuinfo = &cpuinfo_or1k[smp_processor_id()];
9a711fbea37320 Arnd Bergmann       2023-03-22  124  
586fa29b78e597 Arnd Bergmann       2023-03-21  125  	/* Flush the dcache for the requested range */
586fa29b78e597 Arnd Bergmann       2023-03-21  126  	for (cl = addr; cl < addr + size;
586fa29b78e597 Arnd Bergmann       2023-03-21  127  	     cl += cpuinfo->dcache_block_size)
586fa29b78e597 Arnd Bergmann       2023-03-21  128  		mtspr(SPR_DCBFR, cl);
586fa29b78e597 Arnd Bergmann       2023-03-21 @129  		break;
a39af6f7b806f2 Jonas Bonn          2011-06-04  130  }
9a711fbea37320 Arnd Bergmann       2023-03-22  131  

:::::: The code at line 115 was first introduced by commit
:::::: a39af6f7b806f2a52962254ea8dc635b4c240810 OpenRISC: DMA

:::::: TO: Jonas Bonn <jonas@southpole.se>
:::::: CC: Jonas Bonn <jonas@southpole.se>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
