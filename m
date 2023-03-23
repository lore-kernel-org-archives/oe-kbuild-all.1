Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBE220E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 05:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679550193; x=1711086193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctF1tAAp1DTcTBFoFdcU1+hqLs9TWDIA629kb+GXG/U=;
  b=nT6DoBtwog7KqrFHGIs1qtbWrzKPKkCR1wtN7NJfNDcEA02jbjXAGQmD
   OA76qU49ERSrJYWXFtUpL3M5sSSB8REzDpwzeUXFycyitqTAsiTB7zyQV
   do6wKxuwuQhYYyLndEfJ1naMfCSlOkAuAmXzFaU0xJfXr3IGb0oAA0szd
   ZoxU0fRU9n9X6S6FxcNhLX0rTzGePrjovCwTZlaXhh1IENn4vUeDpjbSH
   QXQ/iEZXrNUsFoD/1Byycm/RWa8/hSnK+BV5KjwPJbSOmv7QqDOjagV/x
   /feCyubK+4ZZMqJ0cotE2loHfSqPAIYPIZZCPXvgCu4VZr7CluFUszzpU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="323248778"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="323248778"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 22:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684575869"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="684575869"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Mar 2023 22:43:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfDjC-000E0h-33;
	Thu, 23 Mar 2023 05:43:10 +0000
Date: Thu, 23 Mar 2023 13:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 5432/6100] include/linux/mmzone.h:1749:2: error:
 #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <202303231302.iY6qIfXA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7c4a254d78f89546d0e74a40617ef24c6151c8d1
commit: 68b8ff1ef897ca529447dac52b18b242f8f6620a [5432/6100] mm, treewide: redefine MAX_ORDER sanely
config: loongarch-randconfig-r006-20230322 (https://download.01.org/0day-ci/archive/20230323/202303231302.iY6qIfXA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=68b8ff1ef897ca529447dac52b18b242f8f6620a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 68b8ff1ef897ca529447dac52b18b242f8f6620a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231302.iY6qIfXA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/loongarch/kernel/asm-offsets.c:9:
>> include/linux/mmzone.h:1749:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
    1749 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
         |  ^~~~~
   arch/loongarch/kernel/asm-offsets.c:16:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      16 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:63:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      63 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:78:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      78 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:94:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      94 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:137:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     137 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:177:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     177 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:209:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     209 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:217:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     217 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:255:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     255 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:114: arch/loongarch/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1749 include/linux/mmzone.h

d41dee369bff3b Andy Whitcroft     2005-06-23  1744  
835c134ec4dd75 Mel Gorman         2007-10-16  1745  #define SECTION_BLOCKFLAGS_BITS \
d9c2340052278d Mel Gorman         2007-10-16  1746  	((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
835c134ec4dd75 Mel Gorman         2007-10-16  1747  
68b8ff1ef897ca Kirill A. Shutemov 2023-03-15  1748  #if (MAX_ORDER + PAGE_SHIFT) > SECTION_SIZE_BITS
d41dee369bff3b Andy Whitcroft     2005-06-23 @1749  #error Allocator MAX_ORDER exceeds SECTION_SIZE
d41dee369bff3b Andy Whitcroft     2005-06-23  1750  #endif
d41dee369bff3b Andy Whitcroft     2005-06-23  1751  

:::::: The code at line 1749 was first introduced by commit
:::::: d41dee369bff3b9dcb6328d4d822926c28cc2594 [PATCH] sparsemem memory model

:::::: TO: Andy Whitcroft <apw@shadowen.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
