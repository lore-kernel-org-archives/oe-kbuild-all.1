Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75405C85
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686384686; x=1717920686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l4KdBH0e0M/m+C+NNK1t4DCnmrZ9BIgTp/LlDYlBVGo=;
  b=AwbzuBrazvcKlzPGD9ygjCtMXBf71kH0TkEj4vDhdwhSDLxSIwOXEmTE
   NBbfxiZkqUjEC3CIx7QR666d2WF0kd/j6mlmfXVdrVpvh4DXmxO9RCPxG
   M7rlS3db36Jld1P/2eZPbuD0cNtc3KMZ+UY/TQWVA0rnNQQxke0nqPur1
   2v1BYRF2uV7lWLC2zMfNO7MWQ0AMxYV8IuWNQ1B49EpFwVfJE8ATM5hc6
   uznz9iC3v41mhqwtvxCv83LVdBmweujMNAeR7+HOO/wXMOCZ8d3QQJr3A
   TnqOt3T7wMWfF6CeBAv6jVK//ekDPYFgAnRXO33KuPAYw8ya9xVTIoVOC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="421335893"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="421335893"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 01:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="775759394"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="775759394"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jun 2023 01:11:24 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7tgx-0009tS-18;
	Sat, 10 Jun 2023 08:11:23 +0000
Date: Sat, 10 Jun 2023 16:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm64:devel/kmalloc-minalign 18/18] include/linux/cache.h:104:38:
 error: missing binary operator before token "("
Message-ID: <202306101526.kiwBY0Xr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git devel/kmalloc-minalign
head:   e5bbe79231baf5cad690c6fc9de3910ad14a2aa6
commit: e5bbe79231baf5cad690c6fc9de3910ad14a2aa6 [18/18] fixup! mm/slab: Decouple ARCH_KMALLOC_MINALIGN from ARCH_DMA_MINALIGN
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230610/202306101526.kiwBY0Xr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=e5bbe79231baf5cad690c6fc9de3910ad14a2aa6
        git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
        git fetch --no-tags arm64 devel/kmalloc-minalign
        git checkout e5bbe79231baf5cad690c6fc9de3910ad14a2aa6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101526.kiwBY0Xr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/current.h:9,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
>> include/linux/cache.h:104:38: error: missing binary operator before token "("
     104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
         |                                      ^
   include/linux/slab.h:239:39: note: in expansion of macro 'ARCH_DMA_MINALIGN'
     239 | #if defined(ARCH_HAS_DMA_MINALIGN) && ARCH_DMA_MINALIGN > 8 && \
         |                                       ^~~~~~~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +104 include/linux/cache.h

   100	
   101	#ifdef ARCH_DMA_MINALIGN
   102	#define ARCH_HAS_DMA_MINALIGN
   103	#else
 > 104	#define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
   105	#endif
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
