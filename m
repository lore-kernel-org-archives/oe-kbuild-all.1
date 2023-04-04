Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65567F3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680593763; x=1712129763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hIBQuVs1IK4JVrR4CDBVenh29yBNmKR6RHLMW9FXVTQ=;
  b=Fms4w6KGdNxbecf6ai8O744lyFGF1rjp6tFuOpyvR84dZqQsEiaM5yjK
   JaVl3/94vnNuwJCKLoou7ywK9Nq3TLwR26UNQFg02tyXe7a2iLD7xKf78
   V00YXnql9bRYkgrO7aM2gt/F3/FzwbF5BQTJjYTluMAfdUwYLT6sileQT
   SgDEC0ZJOR4Ez9M5ciOBtf3RK2b0crzv5QIvvW7NWMFbqLZlYDcymg91t
   iny0ugOmdLykxz+gTaCrxwoyXOWn8sq5pkXqSh6Vdb8A3s8yrUH7VjEKA
   JBcZ8HE1XLwWWLNjbTZAu6XLYevPA6Qq8SZpNLZV7rLHOBHU9OIThNQF0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330697420"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="330697420"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 00:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="810132304"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="810132304"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Apr 2023 00:36:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjbCz-000PNT-0F;
	Tue, 04 Apr 2023 07:36:01 +0000
Date: Tue, 4 Apr 2023 15:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.3-rc3-redux 8/13]
 arch/m68k/include/asm/mcf_pgtable.h:118:26: warning: passing argument 1 of
 'virt_to_pfn' makes pointer from integer without a cast
Message-ID: <202304041519.tEISA7xh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.3-rc3-redux
head:   7d33661b279f9c364c4f70b3fee41a450afdadd1
commit: c0d397d78efcbc5a04a5a831f9ec5f355598ab76 [8/13] m68k/mm: Make pfn accessors static inlines
config: m68k-randconfig-r016-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041519.tEISA7xh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=c0d397d78efcbc5a04a5a831f9ec5f355598ab76
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.3-rc3-redux
        git checkout c0d397d78efcbc5a04a5a831f9ec5f355598ab76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash arch/m68k/mm/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041519.tEISA7xh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/page.h:66,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from mm/gup.c:5:
   mm/gup.c: In function 'follow_page_pte':
>> arch/m68k/include/asm/mcf_pgtable.h:118:26: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     118 | #define __pte_page(pte) ((unsigned long) (pte_val(pte) & PAGE_MASK))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          |
         |                          long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/m68k/include/asm/mcf_pgtable.h:138:25: note: in expansion of macro 'virt_to_page'
     138 | #define pte_page(pte)   virt_to_page(__pte_page(pte))
         |                         ^~~~~~~~~~~~
   arch/m68k/include/asm/mcf_pgtable.h:138:38: note: in expansion of macro '__pte_page'
     138 | #define pte_page(pte)   virt_to_page(__pte_page(pte))
         |                                      ^~~~~~~~~~
   mm/gup.c:577:32: note: in expansion of macro 'pte_page'
     577 |                         page = pte_page(pte);
         |                                ^~~~~~~~
   In file included from arch/m68k/include/asm/page.h:60:
   arch/m68k/include/asm/page_mm.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
>> arch/m68k/include/asm/mcf_pgtable.h:118:26: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     118 | #define __pte_page(pte) ((unsigned long) (pte_val(pte) & PAGE_MASK))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          |
         |                          long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/m68k/include/asm/mcf_pgtable.h:138:25: note: in expansion of macro 'virt_to_page'
     138 | #define pte_page(pte)   virt_to_page(__pte_page(pte))
         |                         ^~~~~~~~~~~~
   arch/m68k/include/asm/mcf_pgtable.h:138:38: note: in expansion of macro '__pte_page'
     138 | #define pte_page(pte)   virt_to_page(__pte_page(pte))
         |                                      ^~~~~~~~~~
   mm/gup.c:588:32: note: in expansion of macro 'pte_page'
     588 |                         page = pte_page(pte);
         |                                ^~~~~~~~
   arch/m68k/include/asm/page_mm.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   mm/gup.c: In function 'get_gate_page':
>> arch/m68k/include/asm/mcf_pgtable.h:118:26: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     118 | #define __pte_page(pte) ((unsigned long) (pte_val(pte) & PAGE_MASK))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          |
         |                          long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/m68k/include/asm/mcf_pgtable.h:138:25: note: in expansion of macro 'virt_to_page'
     138 | #define pte_page(pte)   virt_to_page(__pte_page(pte))
         |                         ^~~~~~~~~~~~
   arch/m68k/include/asm/mcf_pgtable.h:138:38: note: in expansion of macro '__pte_page'
     138 | #define pte_page(pte)   virt_to_page(__pte_page(pte))
         |                                      ^~~~~~~~~~
   mm/gup.c:869:25: note: in expansion of macro 'pte_page'
     869 |                 *page = pte_page(*pte);
         |                         ^~~~~~~~
   arch/m68k/include/asm/page_mm.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
--
   In file included from arch/m68k/include/asm/page.h:66,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/vmalloc.h:5,
                    from mm/vmalloc.c:11:
   mm/vmalloc.c: In function 'vmalloc_to_page':
>> arch/m68k/include/asm/mcf_pgtable.h:118:26: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     118 | #define __pte_page(pte) ((unsigned long) (pte_val(pte) & PAGE_MASK))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          |
         |                          long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/m68k/include/asm/mcf_pgtable.h:138:25: note: in expansion of macro 'virt_to_page'
     138 | #define pte_page(pte)   virt_to_page(__pte_page(pte))
         |                         ^~~~~~~~~~~~
   arch/m68k/include/asm/mcf_pgtable.h:138:38: note: in expansion of macro '__pte_page'
     138 | #define pte_page(pte)   virt_to_page(__pte_page(pte))
         |                                      ^~~~~~~~~~
   mm/vmalloc.c:705:24: note: in expansion of macro 'pte_page'
     705 |                 page = pte_page(pte);
         |                        ^~~~~~~~
   In file included from arch/m68k/include/asm/page.h:60:
   arch/m68k/include/asm/page_mm.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
--
   arch/m68k/mm/mcfmmu.c:36:13: warning: no previous prototype for 'paging_init' [-Wmissing-prototypes]
      36 | void __init paging_init(void)
         |             ^~~~~~~~~~~
   In file included from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/m68k/mm/mcfmmu.c:13:
   arch/m68k/mm/mcfmmu.c: In function 'paging_init':
>> arch/m68k/mm/mcfmmu.c:72:57: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
      72 |                         pte_t pte = pfn_pte(virt_to_pfn(address), PAGE_INIT);
         |                                                         ^~~~~~~
         |                                                         |
         |                                                         long unsigned int
   arch/m68k/include/asm/page.h:49:37: note: in definition of macro '__pte'
      49 | #define __pte(x)        ((pte_t) { (x) } )
         |                                     ^
   arch/m68k/mm/mcfmmu.c:72:37: note: in expansion of macro 'pfn_pte'
      72 |                         pte_t pte = pfn_pte(virt_to_pfn(address), PAGE_INIT);
         |                                     ^~~~~~~
   In file included from arch/m68k/include/asm/page.h:60:
   arch/m68k/include/asm/page_mm.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   arch/m68k/mm/mcfmmu.c:41:37: warning: variable 'bootmem_end' set but not used [-Wunused-but-set-variable]
      41 |         unsigned long next_pgtable, bootmem_end;
         |                                     ^~~~~~~~~~~


vim +/virt_to_pfn +118 arch/m68k/include/asm/mcf_pgtable.h

91521c2ea6e3d5a Greg Ungerer  2011-10-14  117  
91521c2ea6e3d5a Greg Ungerer  2011-10-14 @118  #define __pte_page(pte)	((unsigned long) (pte_val(pte) & PAGE_MASK))
974b9b2c68f3d35 Mike Rapoport 2020-06-08  119  #define pmd_page_vaddr(pmd)	((unsigned long) (pmd_val(pmd)))
91521c2ea6e3d5a Greg Ungerer  2011-10-14  120  

:::::: The code at line 118 was first introduced by commit
:::::: 91521c2ea6e3d5a790df40988101ad099ddbf7c8 m68k: page table support definitions and code for ColdFire MMU

:::::: TO: Greg Ungerer <gerg@uclinux.org>
:::::: CC: Greg Ungerer <gerg@uclinux.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
