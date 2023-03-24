Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7774210B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 14:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679668341; x=1711204341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iss6ZZCyK2nkk17pJKVbsmbvgd8SvoQv3pUkA9mNt+8=;
  b=My22QzTBVH+jdIwLLSIlrMufifU/QWSQQQnOlLgFBglLnv/Vg+blY2V8
   OOcBQQlkJBKa5m8KBTNTbB+/OYg9bUo4TzIpb0U4u4252XqC2lRiKr/Ah
   ld+MQW5lhaZDSma0juCEavCEd2b+9gZHbfleSM7d1f3jmZ5HvOqQkWzKc
   P21WTMsV+Bccw3gtVW8q+gShU2isMPhytOQGZ6E+5wOfma1UDUa5kXhcc
   YOzSzN7sSmagw4ivPrqTd5duGdJ1RmKgVDxZxC27Dhu7Iewu0FxzH2KAL
   iitdIFP8N5MCyyNlO6uN8srbFUJrgbq25Ct4GhzL967yVLoLfQ9KPupZp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="404707370"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="404707370"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 07:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="826276319"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="826276319"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2023 07:32:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfiSn-000FMu-1i;
	Fri, 24 Mar 2023 14:32:17 +0000
Date: Fri, 24 Mar 2023 22:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org
Subject: [arnd-asm-generic:dma-sync-rework 20/20]
 arch/openrisc/kernel/dma.c:126:9: warning: this 'for' clause does not
 guard...
Message-ID: <202303242205.5V2cu64T-lkp@intel.com>
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
config: openrisc-randconfig-r002-20230322 (https://download.01.org/0day-ci/archive/20230324/202303242205.5V2cu64T-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash arch/openrisc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303242205.5V2cu64T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/openrisc/kernel/dma.c: In function 'arch_dma_cache_inv':
   arch/openrisc/kernel/dma.c:115:19: error: 'addr' undeclared (first use in this function); did you mean 'paddr'?
     115 |         for (cl = addr; cl < addr + size;
         |                   ^~~~
         |                   paddr
   arch/openrisc/kernel/dma.c:115:19: note: each undeclared identifier is reported only once for each function it appears in
   arch/openrisc/kernel/dma.c: In function 'arch_dma_cache_wback_inv':
   arch/openrisc/kernel/dma.c:126:19: error: 'addr' undeclared (first use in this function); did you mean 'paddr'?
     126 |         for (cl = addr; cl < addr + size;
         |                   ^~~~
         |                   paddr
>> arch/openrisc/kernel/dma.c:126:9: warning: this 'for' clause does not guard... [-Wmisleading-indentation]
     126 |         for (cl = addr; cl < addr + size;
         |         ^~~
   arch/openrisc/kernel/dma.c:129:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'for'
     129 |                 break;
         |                 ^~~~~
   arch/openrisc/kernel/dma.c:129:17: error: break statement not within loop or switch


vim +/for +126 arch/openrisc/kernel/dma.c

9a711fbea373208 Arnd Bergmann 2023-03-22  119  
9a711fbea373208 Arnd Bergmann 2023-03-22  120  static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
9a711fbea373208 Arnd Bergmann 2023-03-22  121  {
9a711fbea373208 Arnd Bergmann 2023-03-22  122  	unsigned long cl;
9a711fbea373208 Arnd Bergmann 2023-03-22  123  	struct cpuinfo_or1k *cpuinfo = &cpuinfo_or1k[smp_processor_id()];
9a711fbea373208 Arnd Bergmann 2023-03-22  124  
586fa29b78e5976 Arnd Bergmann 2023-03-21  125  	/* Flush the dcache for the requested range */
586fa29b78e5976 Arnd Bergmann 2023-03-21 @126  	for (cl = addr; cl < addr + size;
586fa29b78e5976 Arnd Bergmann 2023-03-21  127  	     cl += cpuinfo->dcache_block_size)
586fa29b78e5976 Arnd Bergmann 2023-03-21  128  		mtspr(SPR_DCBFR, cl);
586fa29b78e5976 Arnd Bergmann 2023-03-21  129  		break;
a39af6f7b806f2a Jonas Bonn    2011-06-04  130  }
9a711fbea373208 Arnd Bergmann 2023-03-22  131  

:::::: The code at line 126 was first introduced by commit
:::::: 586fa29b78e59767a0a6d19e82c81e469bae6e08 openrisc: dma-mapping: flush bidirectional mappings

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
