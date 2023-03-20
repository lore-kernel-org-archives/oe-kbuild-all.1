Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE461104
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679299596; x=1710835596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2y660K73axQypapjTATVarVaazpbAj43NhTQoPtVkc=;
  b=Cllr66ZIyq6o2AH4YZNQZtpSSw5rU2+8UJsBW4YcKGfqAhfscd7geKeB
   Kx8CP9X9c8cSY2Qrka5vDmpCurvgLW3Q+8PfDuZkj3dvvnb0X4lpmVKPK
   mnRP5UZsgPqYqY45vkexh3y1YdCqeximc4fAhU6EWjAJ2o+oiDxFMulZR
   k7f8BjB0LySnhu+F7TenceDftqc8x7j9pomFiQjlPQwFIHjddngpDf8Bv
   /dDiqk9gTRxtfc6zFKoV9xbbd+TT2CbtOch66UUev7NHYrX6BC6yoEXhp
   96R7SeYgRtyaCDosW8Ktmwg0wEoYmRQKQW7bp3Mz0p0z+UBl0Zjblk9kD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="337316768"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="337316768"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 01:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="711244695"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="711244695"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Mar 2023 01:06:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peAXJ-000AuA-39;
	Mon, 20 Mar 2023 08:06:33 +0000
Date: Mon, 20 Mar 2023 16:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 3778/4413] include/linux/mmzone.h:1749:2: error:
 #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <202303201615.Qfu18nWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   73f2c2a7e1d2b31fdd5faa6dfa151c437a6c0a5a
commit: af8daebdbc0833b8095767ccef7ddce55e9fdf32 [3778/4413] mm, treewide: redefine MAX_ORDER sanely
config: loongarch-buildonly-randconfig-r003-20230320 (https://download.01.org/0day-ci/archive/20230320/202303201615.Qfu18nWV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=af8daebdbc0833b8095767ccef7ddce55e9fdf32
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout af8daebdbc0833b8095767ccef7ddce55e9fdf32
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303201615.Qfu18nWV-lkp@intel.com/

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
af8daebdbc0833 Kirill A. Shutemov 2023-03-15  1748  #if (MAX_ORDER + PAGE_SHIFT) > SECTION_SIZE_BITS
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
