Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6C87F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 02:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686623488; x=1718159488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OLacDd/WZDK+wobVB8Ma1+BlnIQGBur79aUel3FibgU=;
  b=lx6Q5yL28PnR1mlIejM5J4/nAnVUVi3bnaElpW6yOIo4eaZwh1RIKE1a
   UJnhQBWNG+VdTB6Vg+LXrOZ/L7GmJNwffAb1yLSS0bZ41SZgECYpsxEAT
   +ozKHV9I08BzkhLo2V/zWN031Nuyga2UAvHbXyIax3qAqnL4jrjtcjqbL
   eWVzp7bXgCwqZM5X9yBFkrp3rvra9Ou3u0QVsVfATN83DAtC/EifSWuky
   fNHqAtxgp/FGg5dVJQY1Dk53ltLlGMfZeMDyX8Lv8Ol8AwAc83tGwSH5B
   +AnI2q8TwOYY+V0fruz5pPpw4SUl9ABNFahEfoKem0C+v5dLqu4QhGwO0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="424093782"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="424093782"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 19:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="714613245"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="714613245"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jun 2023 19:31:26 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8toc-0000w4-0V;
	Tue, 13 Jun 2023 02:31:26 +0000
Date: Tue, 13 Jun 2023 10:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm64:devel/kmalloc-minalign 1/17]
 arch/powerpc/include/asm/page_32.h:16: warning: "ARCH_DMA_MINALIGN"
 redefined
Message-ID: <202306131011.OGbdy4PK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git devel/kmalloc-minalign
head:   b862c01a97ef575e8d5f018e542dbd30ddc524b9
commit: 9c5a142fe1e2aeb1a1821eb79b39edd09bbb0078 [1/17] mm/slab: Decouple ARCH_KMALLOC_MINALIGN from ARCH_DMA_MINALIGN
config: powerpc-rainier_defconfig (https://download.01.org/0day-ci/archive/20230613/202306131011.OGbdy4PK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=9c5a142fe1e2aeb1a1821eb79b39edd09bbb0078
        git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
        git fetch --no-tags arm64 devel/kmalloc-minalign
        git checkout 9c5a142fe1e2aeb1a1821eb79b39edd09bbb0078
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131011.OGbdy4PK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/page.h:247,
                    from arch/powerpc/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:12:
>> arch/powerpc/include/asm/page_32.h:16: warning: "ARCH_DMA_MINALIGN" redefined
      16 | #define ARCH_DMA_MINALIGN       L1_CACHE_BYTES
         | 
   In file included from include/linux/time.h:5,
                    from include/linux/compat.h:10:
   include/linux/cache.h:104: note: this is the location of the previous definition
     104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
         | 
--
   In file included from arch/powerpc/include/asm/page.h:247,
                    from arch/powerpc/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:12:
>> arch/powerpc/include/asm/page_32.h:16: warning: "ARCH_DMA_MINALIGN" redefined
      16 | #define ARCH_DMA_MINALIGN       L1_CACHE_BYTES
         | 
   In file included from include/linux/time.h:5,
                    from include/linux/compat.h:10:
   include/linux/cache.h:104: note: this is the location of the previous definition
     104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
         | 


vim +/ARCH_DMA_MINALIGN +16 arch/powerpc/include/asm/page_32.h

5cd16ee934eafc include/asm-powerpc/page_32.h      Michael Ellerman       2005-11-11  14  
52142e756e9bf6 include/asm-powerpc/page_32.h      Benjamin Herrenschmidt 2007-11-19  15  #ifdef CONFIG_NOT_COHERENT_CACHE
a6eb9fe105d5de arch/powerpc/include/asm/page_32.h FUJITA Tomonori        2010-08-10 @16  #define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
52142e756e9bf6 include/asm-powerpc/page_32.h      Benjamin Herrenschmidt 2007-11-19  17  #endif
52142e756e9bf6 include/asm-powerpc/page_32.h      Benjamin Herrenschmidt 2007-11-19  18  

:::::: The code at line 16 was first introduced by commit
:::::: a6eb9fe105d5de0053b261148cee56c94b4720ca dma-mapping: rename ARCH_KMALLOC_MINALIGN to ARCH_DMA_MINALIGN

:::::: TO: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
