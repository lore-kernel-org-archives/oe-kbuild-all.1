Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DD2EC1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674470349; x=1706006349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xmokt2opw73Ybn3Sr0/RjdFQOLLWY9BrG03xOe9X9Ao=;
  b=RjtGpAFYjPDY5jx3m0m+Xn8/E7gbiuDiOPC/2OKh5Ra9vR7jQUI841GQ
   0dNvtCJ0N4wBeVmGtjpmBYVZI/Zk2YFbUifmBhKKAHCddkUgzGByg2ktJ
   bSJPssWmZJvX8W9Bdyk+6iyAGTKGsEpfLeM+CeGgMMAsAjOI9sNi64rRX
   UISRVV1GZXkQH5xYCs61dLK1743yF9Cv0vGfdyrGmd7quxki02bIrRCaO
   T7F7ndKemOxUmIhxwTO5nygxmj7jzc12QhC7jXg4zZj+TGdi8Cgg4pL2U
   8G8NF1zOLBMMosOhsooj4IfptmhadZ/Fbc3Bv0LLSoiLu4W4HPd7kV1zo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="309588885"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="309588885"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 02:39:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="804038770"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="804038770"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2023 02:39:04 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJuEB-0005a4-2T;
	Mon, 23 Jan 2023 10:39:03 +0000
Date: Mon, 23 Jan 2023 18:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:misc/pfn_valid/v0 1/1] arch/xtensa/include/asm/page.h:194:56:
 error: expected expression before '<<' token
Message-ID: <202301231855.31pAVGMD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git misc/pfn_valid/v0
head:   2cb3404accfc161b66866cd03c42953f57700677
commit: 2cb3404accfc161b66866cd03c42953f57700677 [1/1] mm, arch: add generic implementation of pfn_valid() for FLATMEM
config: xtensa-randconfig-r001-20230123 (https://download.01.org/0day-ci/archive/20230123/202301231855.31pAVGMD-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=2cb3404accfc161b66866cd03c42953f57700677
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt misc/pfn_valid/v0
        git checkout 2cb3404accfc161b66866cd03c42953f57700677
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/xtensa/kernel/asm-offsets.c:21:
   include/linux/mm.h: In function 'folio_pfn':
   include/linux/mm.h:1632:41: error: expected expression before ';' token
    1632 |         return page_to_pfn(&folio->page);
         |                                         ^
   include/linux/mm.h:1632:42: error: expected ';' before '}' token
    1632 |         return page_to_pfn(&folio->page);
         |                                          ^
         |                                          ;
    1633 | }
         | ~                                         
   include/linux/mm.h: In function 'is_longterm_pinnable_page':
   include/linux/mm.h:1720:42: error: expected expression before ')' token
    1720 |         if (is_zero_pfn(page_to_pfn(page)))
         |                                          ^
   include/linux/mm.h:1729:1: error: expected expression before '}' token
    1729 | }
         | ^
   include/linux/mm.h:1729:1: error: no return statement in function returning non-void [-Werror=return-type]
   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:16,
                    from include/linux/ptrace.h:6:
   include/linux/mm.h: In function 'lowmem_page_address':
>> arch/xtensa/include/asm/page.h:194:56: error: expected expression before '<<' token
     194 | #define page_to_virt(page)      __va(page_to_pfn(page) << PAGE_SHIFT)
         |                                                        ^~
   arch/xtensa/include/asm/page.h:191:36: note: in definition of macro '__va'
     191 |         ((void *)((unsigned long) (x) - PHYS_OFFSET + PAGE_OFFSET))
         |                                    ^
   include/linux/mm.h:1860:16: note: in expansion of macro 'page_to_virt'
    1860 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   include/linux/mm.h:1860:34: error: expected ')' before ';' token
    1860 |         return page_to_virt(page);
         |                                  ^
   arch/xtensa/include/asm/page.h:191:9: note: to match this '('
     191 |         ((void *)((unsigned long) (x) - PHYS_OFFSET + PAGE_OFFSET))
         |         ^
   arch/xtensa/include/asm/page.h:194:33: note: in expansion of macro '__va'
     194 | #define page_to_virt(page)      __va(page_to_pfn(page) << PAGE_SHIFT)
         |                                 ^~~~
   include/linux/mm.h:1860:16: note: in expansion of macro 'page_to_virt'
    1860 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   include/linux/mm.h:1860:35: error: expected ';' before '}' token
    1860 |         return page_to_virt(page);
         |                                   ^
         |                                   ;
    1861 | }
         | ~                                  
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/xtensa/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1298: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +194 arch/xtensa/include/asm/page.h

c947a585ab13f3 arch/xtensa/include/asm/page.h Johannes Weiner 2009-03-04  163  
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  164  #ifdef CONFIG_MMU
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  165  static inline unsigned long ___pa(unsigned long va)
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  166  {
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  167  	unsigned long off = va - PAGE_OFFSET;
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  168  
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  169  	if (off >= XCHAL_KSEG_SIZE)
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  170  		off -= XCHAL_KSEG_SIZE;
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  171  
7af710d988775a arch/xtensa/include/asm/page.h Max Filippov    2017-01-03  172  #ifndef CONFIG_XIP_KERNEL
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  173  	return off + PHYS_OFFSET;
7af710d988775a arch/xtensa/include/asm/page.h Max Filippov    2017-01-03  174  #else
7af710d988775a arch/xtensa/include/asm/page.h Max Filippov    2017-01-03  175  	if (off < XCHAL_KSEG_SIZE)
7af710d988775a arch/xtensa/include/asm/page.h Max Filippov    2017-01-03  176  		return off + PHYS_OFFSET;
7af710d988775a arch/xtensa/include/asm/page.h Max Filippov    2017-01-03  177  
7af710d988775a arch/xtensa/include/asm/page.h Max Filippov    2017-01-03  178  	off -= XCHAL_KSEG_SIZE;
7af710d988775a arch/xtensa/include/asm/page.h Max Filippov    2017-01-03  179  	if (off >= XCHAL_KIO_SIZE)
7af710d988775a arch/xtensa/include/asm/page.h Max Filippov    2017-01-03  180  		off -= XCHAL_KIO_SIZE;
7af710d988775a arch/xtensa/include/asm/page.h Max Filippov    2017-01-03  181  
7af710d988775a arch/xtensa/include/asm/page.h Max Filippov    2017-01-03  182  	return off + XCHAL_KIO_PADDR;
7af710d988775a arch/xtensa/include/asm/page.h Max Filippov    2017-01-03  183  #endif
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  184  }
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  185  #define __pa(x)	___pa((unsigned long)(x))
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  186  #else
a9f2fc628e3a26 arch/xtensa/include/asm/page.h Max Filippov    2016-04-13  187  #define __pa(x)	\
a9f2fc628e3a26 arch/xtensa/include/asm/page.h Max Filippov    2016-04-13  188  	((unsigned long) (x) - PAGE_OFFSET + PHYS_OFFSET)
2b83878dd74a7c arch/xtensa/include/asm/page.h Max Filippov    2017-03-29  189  #endif
a9f2fc628e3a26 arch/xtensa/include/asm/page.h Max Filippov    2016-04-13  190  #define __va(x)	\
a9f2fc628e3a26 arch/xtensa/include/asm/page.h Max Filippov    2016-04-13  191  	((void *)((unsigned long) (x) - PHYS_OFFSET + PAGE_OFFSET))
c4c4594b005d89 arch/xtensa/include/asm/page.h Chris Zankel    2012-11-28  192  
9a8fd558990215 include/asm-xtensa/page.h      Chris Zankel    2005-06-23  193  #define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
9a8fd558990215 include/asm-xtensa/page.h      Chris Zankel    2005-06-23 @194  #define page_to_virt(page)	__va(page_to_pfn(page) << PAGE_SHIFT)
9a8fd558990215 include/asm-xtensa/page.h      Chris Zankel    2005-06-23  195  #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
9a8fd558990215 include/asm-xtensa/page.h      Chris Zankel    2005-06-23  196  #define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
9a8fd558990215 include/asm-xtensa/page.h      Chris Zankel    2005-06-23  197  

:::::: The code at line 194 was first introduced by commit
:::::: 9a8fd5589902153a134111ed7a40f9cca1f83254 [PATCH] xtensa: Architecture support for Tensilica Xtensa Part 6

:::::: TO: Chris Zankel <czankel@tensilica.com>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
