Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7627EC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 01:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9nIkdn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702171216; x=1733707216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aGvzfT9spUsqBH0TtiFd9nyLofG3wdVzD2aGdzuxnfc=;
  b=E9nIkdn/6EBR87c3SmVrUix+QD6q1TftxwW9bNuqfVGA4hcN7IEHbcBt
   wHTnz0+aLBWAQJUTxHyyTdpfWc466LJqeiphIIhTRazrSCr3CWRQ8fovj
   NL8RVAxHjw1roeEwXAFNEkg/truZazhFWitGUteHVV8hO71pvNRcAUdfP
   UfCunMAa+8yKvshSw7ErBxVo7WPVwNXq8pawvn7Zyt9Qkmf/iKSqudIXj
   FUFABFY2foLLvtZDIL1kFNP7LiBk6EuxVleyXe9F6MqVyByrNq/E/19MC
   lTjOQRK7r0QsfdCHF9lbwisyDTtROCVnoSaIBoJAxnfWqgz0u80rSkMif
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="480724285"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="480724285"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 17:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="890612241"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="890612241"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2023 17:20:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC8UN-000GDp-2E;
	Sun, 10 Dec 2023 01:20:11 +0000
Date: Sun, 10 Dec 2023 09:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will.deacon@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: arch/alpha/kernel/io.c:425:46: sparse: sparse: cast removes address
 space '__iomem' of expression
Message-ID: <202312100904.XepiU7RJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21b73ffcc62ab772bc06e3e90bd87eff5e9e8ed4
commit: d15155824c5014803d91b829736d249c500bdda6 linux/compiler.h: Split into compiler.h and compiler_types.h
date:   6 years ago
config: alpha-randconfig-r113-20231116 (https://download.01.org/0day-ci/archive/20231210/202312100904.XepiU7RJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312100904.XepiU7RJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312100904.XepiU7RJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/alpha/kernel/io.c:620:14: sparse: sparse: multiple definitions for function 'ioport_map'
   arch/alpha/kernel/io.c: note: in included file:
   arch/alpha/include/asm/io.h:276:28: sparse:  the previous one is here
   arch/alpha/kernel/io.c:625:6: sparse: sparse: multiple definitions for function 'ioport_unmap'
   arch/alpha/include/asm/io.h:281:20: sparse:  the previous one is here
>> arch/alpha/kernel/io.c:425:46: sparse: sparse: cast removes address space '__iomem' of expression
   arch/alpha/kernel/io.c:436:46: sparse: sparse: cast removes address space '__iomem' of expression
   arch/alpha/kernel/io.c:447:46: sparse: sparse: cast removes address space '__iomem' of expression
   arch/alpha/kernel/io.c:480:29: sparse: sparse: cast removes address space '__iomem' of expression
   arch/alpha/kernel/io.c:491:29: sparse: sparse: cast removes address space '__iomem' of expression
   arch/alpha/kernel/io.c:502:29: sparse: sparse: cast removes address space '__iomem' of expression
   arch/alpha/kernel/io.c:531:28: sparse: sparse: cast removes address space '__iomem' of expression
   arch/alpha/kernel/io.c:538:29: sparse: sparse: cast removes address space '__iomem' of expression
   arch/alpha/kernel/io.c:545:29: sparse: sparse: cast removes address space '__iomem' of expression
   In file included from include/linux/workqueue.h:8,
                    from include/linux/srcu.h:34,
                    from include/linux/notifier.h:15,
                    from include/linux/memory_hotplug.h:6,
                    from include/linux/mmzone.h:779,
                    from include/linux/gfp.h:5,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from arch/alpha/kernel/io.c:8:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:178:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     178 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:143:39: note: in definition of macro '__setup_timer'
     143 |                 (_timer)->function = (_fn);                             32-      |                                       ^~~
   arch/alpha/kernel/io.c: At top level:
   arch/alpha/kernel/io.c:590:1: warning: no previous prototype for 'scr_memcpyw' [-Wmissing-prototypes]
     590 | scr_memcpyw(u16 *d, const u16 *s, unsigned int count)
         | ^~~~~~~~~~~

vim +/__iomem +425 arch/alpha/kernel/io.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  414  
^1da177e4c3f41 Linus Torvalds 2005-04-16  415  
^1da177e4c3f41 Linus Torvalds 2005-04-16  416  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  417   * Copy data from IO memory space to "real" memory space.
^1da177e4c3f41 Linus Torvalds 2005-04-16  418   * This needs to be optimized.
^1da177e4c3f41 Linus Torvalds 2005-04-16  419   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  420  void memcpy_fromio(void *to, const volatile void __iomem *from, long count)
^1da177e4c3f41 Linus Torvalds 2005-04-16  421  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  422  	/* Optimize co-aligned transfers.  Everything else gets handled
^1da177e4c3f41 Linus Torvalds 2005-04-16  423  	   a byte at a time. */
^1da177e4c3f41 Linus Torvalds 2005-04-16  424  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @425  	if (count >= 8 && ((u64)to & 7) == ((u64)from & 7)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  426  		count -= 8;
^1da177e4c3f41 Linus Torvalds 2005-04-16  427  		do {
^1da177e4c3f41 Linus Torvalds 2005-04-16  428  			*(u64 *)to = __raw_readq(from);
^1da177e4c3f41 Linus Torvalds 2005-04-16  429  			count -= 8;
^1da177e4c3f41 Linus Torvalds 2005-04-16  430  			to += 8;
^1da177e4c3f41 Linus Torvalds 2005-04-16  431  			from += 8;
^1da177e4c3f41 Linus Torvalds 2005-04-16  432  		} while (count >= 0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  433  		count += 8;
^1da177e4c3f41 Linus Torvalds 2005-04-16  434  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  435  
^1da177e4c3f41 Linus Torvalds 2005-04-16  436  	if (count >= 4 && ((u64)to & 3) == ((u64)from & 3)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  437  		count -= 4;
^1da177e4c3f41 Linus Torvalds 2005-04-16  438  		do {
^1da177e4c3f41 Linus Torvalds 2005-04-16  439  			*(u32 *)to = __raw_readl(from);
^1da177e4c3f41 Linus Torvalds 2005-04-16  440  			count -= 4;
^1da177e4c3f41 Linus Torvalds 2005-04-16  441  			to += 4;
^1da177e4c3f41 Linus Torvalds 2005-04-16  442  			from += 4;
^1da177e4c3f41 Linus Torvalds 2005-04-16  443  		} while (count >= 0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  444  		count += 4;
^1da177e4c3f41 Linus Torvalds 2005-04-16  445  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  446  
^1da177e4c3f41 Linus Torvalds 2005-04-16  447  	if (count >= 2 && ((u64)to & 1) == ((u64)from & 1)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  448  		count -= 2;
^1da177e4c3f41 Linus Torvalds 2005-04-16  449  		do {
^1da177e4c3f41 Linus Torvalds 2005-04-16  450  			*(u16 *)to = __raw_readw(from);
^1da177e4c3f41 Linus Torvalds 2005-04-16  451  			count -= 2;
^1da177e4c3f41 Linus Torvalds 2005-04-16  452  			to += 2;
^1da177e4c3f41 Linus Torvalds 2005-04-16  453  			from += 2;
^1da177e4c3f41 Linus Torvalds 2005-04-16  454  		} while (count >= 0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  455  		count += 2;
^1da177e4c3f41 Linus Torvalds 2005-04-16  456  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  457  
^1da177e4c3f41 Linus Torvalds 2005-04-16  458  	while (count > 0) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  459  		*(u8 *) to = __raw_readb(from);
^1da177e4c3f41 Linus Torvalds 2005-04-16  460  		count--;
^1da177e4c3f41 Linus Torvalds 2005-04-16  461  		to++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  462  		from++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  463  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  464  	mb();
^1da177e4c3f41 Linus Torvalds 2005-04-16  465  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  466  

:::::: The code at line 425 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
