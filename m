Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B27D6130
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690201055; x=1721737055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OmaEreBGWx4M/zjvAF9MtWKJKyKV3ycKcvVAStMgqCQ=;
  b=LF4rO+8hvepVt97WFI7lZ0r58R34+TKcs9LiiIX6mj+YX4X8trSxfCyA
   BzhHzHlTWvsMS+A7gEWETJLo4Nunu55k18jM7WDy5hv/SCFviTQfmPhnA
   kcG8h+mhFI3yzJVzmY2ikxpuDEeTl1Z4Ky22pKICTtRXOzvmdTfIf52qh
   OCiCwYd1QDP4BazJXuHIT/fWDVU9UqRPICA1mZ0oCKki0Ncjsmk/Uw/9v
   BuBswd8FLLznRRFnCmC5royRzfcNLTFXc2QduKaiN8XG62LawtyO34XHr
   CtEYE0VeGxs6weFcOJBCdeviBNHz98MWKO8+xQX4lIcN5KUF4JLAGObjR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="453801282"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="453801282"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 05:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="972238570"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="972238570"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jul 2023 05:17:16 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNuUa-0009iR-2y;
	Mon, 24 Jul 2023 12:17:07 +0000
Date: Mon, 24 Jul 2023 20:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [tnguy-next-queue:dev-queue 44/51]
 arch/mips/include/asm/page.h:35:25: warning: conversion from 'long unsigned
 int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0'
Message-ID: <202307242017.3f4YsHnA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   57fdab1d44c1c14e211323a8f4c674ee0fb18e88
commit: 67faf1179b9bc657536050a5381e540ca651b9cb [44/51] ice: add ability to read FW log data and configure the number of log buffers
config: mips-randconfig-r021-20230724 (https://download.01.org/0day-ci/archive/20230724/202307242017.3f4YsHnA-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307242017.3f4YsHnA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307242017.3f4YsHnA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/include/asm/io.h:29,
                    from arch/mips/include/asm/mmiowb.h:5,
                    from include/linux/spinlock.h:66,
                    from include/linux/vmalloc.h:5,
                    from drivers/net/ethernet/intel/ice/ice_fwlog.c:4:
   drivers/net/ethernet/intel/ice/ice_fwlog.c: In function 'ice_fwlog_alloc_ring_buffs':
>> arch/mips/include/asm/page.h:35:25: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Woverflow]
      35 | #define PAGE_SIZE       (_AC(1,UL) << PAGE_SHIFT)
         |                         ^
   drivers/net/ethernet/intel/ice/ice_fwlog.c:41:35: note: in expansion of macro 'PAGE_SIZE'
      41 |                 ring->data_size = PAGE_SIZE;
         |                                   ^~~~~~~~~


vim +35 arch/mips/include/asm/page.h

^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  16  
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  17  /*
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  18   * PAGE_SHIFT determines the page size
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  19   */
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  20  #ifdef CONFIG_PAGE_SIZE_4KB
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  21  #define PAGE_SHIFT	12
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  22  #endif
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  23  #ifdef CONFIG_PAGE_SIZE_8KB
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  24  #define PAGE_SHIFT	13
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  25  #endif
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  26  #ifdef CONFIG_PAGE_SIZE_16KB
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  27  #define PAGE_SHIFT	14
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  28  #endif
c52399bece85cd arch/mips/include/asm/page.h Ralf Baechle   2009-04-02  29  #ifdef CONFIG_PAGE_SIZE_32KB
c52399bece85cd arch/mips/include/asm/page.h Ralf Baechle   2009-04-02  30  #define PAGE_SHIFT	15
c52399bece85cd arch/mips/include/asm/page.h Ralf Baechle   2009-04-02  31  #endif
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  32  #ifdef CONFIG_PAGE_SIZE_64KB
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  33  #define PAGE_SHIFT	16
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  34  #endif
99502d94c3649c arch/mips/include/asm/page.h Nelson Elhage  2009-07-31 @35  #define PAGE_SIZE	(_AC(1,UL) << PAGE_SHIFT)
800dc4f49cc002 arch/mips/include/asm/page.h Dan Williams   2016-01-22  36  #define PAGE_MASK	(~((1 << PAGE_SHIFT) - 1))
^1da177e4c3f41 include/asm-mips/page.h      Linus Torvalds 2005-04-16  37  

:::::: The code at line 35 was first introduced by commit
:::::: 99502d94c3649c5c5e6e81e323caf422a2f1591c MIPS: make page.h constants available to assembly.

:::::: TO: Nelson Elhage <nelhage@ksplice.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
