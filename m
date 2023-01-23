Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F267C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 19:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674500539; x=1706036539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xs/vY61uBBaXdr+55i9lg8bcWq5YkQwtlnJNW4UOHyo=;
  b=PYv9BP0mo3Y8Dc07ANO+VxeWPf9aTEJ3GZPpy5kiqc+PGCnzJsa44+E3
   aYVTY4pK8BgAftsO1ZXvo7hcguTZe5oyFBYCvHsCanHH4xmLwiJGD30n7
   JO8yvX1APNLTENuq3vX8Z2rQhNUPoe7JxHg++PtN6zi8N+a1+dTkgNA/M
   JLHVWxhP5IfRMx8Gd0OzTkzcKh4bbSCbmd+BKNEjDFl0fWFJcdclvu/q3
   RS2DGQ1n08l3989XFtrnz7+IZGgJ81IFrOOi4VFywCTFHocJf2bHpMQri
   q0iVKPQybKgUW1aI5/KP02k3mq5JYKguLMzWw7yo3Cw+CAWu9pScoWE7C
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305784209"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="305784209"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 11:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750544153"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="750544153"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2023 11:02:17 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK25A-0005pk-2B;
	Mon, 23 Jan 2023 19:02:16 +0000
Date: Tue, 24 Jan 2023 03:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:misc/pfn_valid/v0 1/1] arch/m68k/include/asm/page_mm.h:140:
 warning: "pfn_valid" redefined
Message-ID: <202301240241.MDPhAhsH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git misc/pfn_valid/v0
head:   80b44d294c92a4d3645936e12178b4d2c475a641
commit: 2cb3404accfc161b66866cd03c42953f57700677 [1/1] mm, arch: add generic implementation of pfn_valid() for FLATMEM
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230124/202301240241.MDPhAhsH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=2cb3404accfc161b66866cd03c42953f57700677
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt misc/pfn_valid/v0
        git checkout 2cb3404accfc161b66866cd03c42953f57700677
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from drivers/staging/r8188eu/hal/../include/osdep_service.h:7,
                    from drivers/staging/r8188eu/hal/../include/rtw_iol.h:7,
                    from drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c:4:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:30: note: this is the location of the previous definition
      30 | #define pfn_valid pfn_valid
         | 
   In file included from arch/m68k/include/asm/cacheflush_mm.h:5,
                    from arch/m68k/include/asm/cacheflush.h:5,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/staging/r8188eu/hal/../include/osdep_service.h:21:
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
   In file included from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from drivers/staging/r8188eu/hal/../include/osdep_service.h:18:
   include/linux/mm.h: In function 'is_longterm_pinnable_page':
   include/linux/mmzone.h:103:56: error: expected expression before ',' token
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                                        ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:103:56: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                                        ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1714:49: error: expected ')' before ';' token
    1714 |         int mt = get_pageblock_migratetype(page);
         |                                                 ^
   include/linux/mmzone.h:103:32: note: to match this '('
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:103:9: error: too few arguments to function 'get_pfnblock_flags_mask'
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:18:
   include/linux/pageblock-flags.h:64:15: note: declared here
      64 | unsigned long get_pfnblock_flags_mask(const struct page *page,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c:212:1: error: expected declaration or statement at end of input
     212 | }
         | ^
   include/linux/mm.h:1714:13: warning: unused variable 'mt' [-Wunused-variable]
    1714 |         int mt = get_pageblock_migratetype(page);
         |             ^~
   drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c:212:1: error: no return statement in function returning non-void [-Werror=return-type]
     212 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from drivers/staging/r8188eu/hal/../include/osdep_service.h:7,
                    from drivers/staging/r8188eu/hal/../include/rtw_iol.h:7,
                    from drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c:4:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:30: note: this is the location of the previous definition
      30 | #define pfn_valid pfn_valid
         | 
   In file included from arch/m68k/include/asm/cacheflush_mm.h:5,
                    from arch/m68k/include/asm/cacheflush.h:5,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/staging/r8188eu/hal/../include/osdep_service.h:21:
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
   In file included from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from drivers/staging/r8188eu/hal/../include/osdep_service.h:18:
   include/linux/mm.h: In function 'is_longterm_pinnable_page':
   include/linux/mmzone.h:103:56: error: expected expression before ',' token
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                                        ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:103:56: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                                        ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1714:49: error: expected ')' before ';' token
    1714 |         int mt = get_pageblock_migratetype(page);
         |                                                 ^
   include/linux/mmzone.h:103:32: note: to match this '('
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:103:9: error: too few arguments to function 'get_pfnblock_flags_mask'
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:18:
   include/linux/pageblock-flags.h:64:15: note: declared here
      64 | unsigned long get_pfnblock_flags_mask(const struct page *page,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c:733:1: error: expected declaration or statement at end of input
     733 | }
         | ^
   include/linux/mm.h:1714:13: warning: unused variable 'mt' [-Wunused-variable]
    1714 |         int mt = get_pageblock_migratetype(page);
         |             ^~
   drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c:733:1: error: no return statement in function returning non-void [-Werror=return-type]
     733 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from drivers/staging/r8188eu/hal/../include/osdep_service.h:7,
                    from drivers/staging/r8188eu/hal/../include/rtw_iol.h:7,
                    from drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c:4:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:30: note: this is the location of the previous definition
      30 | #define pfn_valid pfn_valid
         | 
   In file included from arch/m68k/include/asm/cacheflush_mm.h:5,
                    from arch/m68k/include/asm/cacheflush.h:5,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/staging/r8188eu/hal/../include/osdep_service.h:21:
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
   In file included from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from drivers/staging/r8188eu/hal/../include/osdep_service.h:18:
   include/linux/mm.h: In function 'is_longterm_pinnable_page':
   include/linux/mmzone.h:103:56: error: expected expression before ',' token
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                                        ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:103:56: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                                        ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1714:49: error: expected ')' before ';' token
    1714 |         int mt = get_pageblock_migratetype(page);
         |                                                 ^
   include/linux/mmzone.h:103:32: note: to match this '('
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:103:9: error: too few arguments to function 'get_pfnblock_flags_mask'
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:18:
   include/linux/pageblock-flags.h:64:15: note: declared here
      64 | unsigned long get_pfnblock_flags_mask(const struct page *page,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c:269:1: error: expected declaration or statement at end of input
     269 | }
         | ^
   include/linux/mm.h:1714:13: warning: unused variable 'mt' [-Wunused-variable]
    1714 |         int mt = get_pageblock_migratetype(page);
         |             ^~
   drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c:269:1: error: no return statement in function returning non-void [-Werror=return-type]
     269 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from arch/m68k/include/asm/page.h:60,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from drivers/staging/r8188eu/hal/../include/osdep_service.h:7,
                    from drivers/staging/r8188eu/hal/../include/drv_types.h:13,
                    from drivers/staging/r8188eu/hal/HalPhyRf_8188e.c:4:
>> arch/m68k/include/asm/page_mm.h:140: warning: "pfn_valid" redefined
     140 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         | 
   In file included from arch/m68k/include/asm/page_mm.h:137:
   include/asm-generic/memory_model.h:30: note: this is the location of the previous definition
      30 | #define pfn_valid pfn_valid
         | 
   In file included from arch/m68k/include/asm/cacheflush_mm.h:5,
                    from arch/m68k/include/asm/cacheflush.h:5,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/staging/r8188eu/hal/../include/osdep_service.h:21:
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
   In file included from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from drivers/staging/r8188eu/hal/../include/osdep_service.h:18:
   include/linux/mm.h: In function 'is_longterm_pinnable_page':
   include/linux/mmzone.h:103:56: error: expected expression before ',' token
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                                        ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:103:56: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                                        ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1714:49: error: expected ')' before ';' token
    1714 |         int mt = get_pageblock_migratetype(page);
         |                                                 ^
   include/linux/mmzone.h:103:32: note: to match this '('
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:103:9: error: too few arguments to function 'get_pfnblock_flags_mask'
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:18:
   include/linux/pageblock-flags.h:64:15: note: declared here
      64 | unsigned long get_pfnblock_flags_mask(const struct page *page,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/r8188eu/hal/HalPhyRf_8188e.c:900:1: error: expected declaration or statement at end of input
     900 | }
         | ^
   include/linux/mm.h:1714:13: warning: unused variable 'mt' [-Wunused-variable]
    1714 |         int mt = get_pageblock_migratetype(page);
         |             ^~
   drivers/staging/r8188eu/hal/HalPhyRf_8188e.c:900:1: error: no return statement in function returning non-void [-Werror=return-type]
     900 | }
         | ^
   cc1: some warnings being treated as errors
..


vim +/pfn_valid +140 arch/m68k/include/asm/page_mm.h

^1da177e4c3f41 include/asm-m68k/page.h         Linus Torvalds     2005-04-16  138  
a65a802aadba07 arch/m68k/include/asm/page_mm.h Geert Uytterhoeven 2021-03-05  139  #define virt_addr_valid(kaddr)	((unsigned long)(kaddr) >= PAGE_OFFSET && (unsigned long)(kaddr) < (unsigned long)high_memory)
^1da177e4c3f41 include/asm-m68k/page.h         Linus Torvalds     2005-04-16 @140  #define pfn_valid(pfn)		virt_addr_valid(pfn_to_virt(pfn))
^1da177e4c3f41 include/asm-m68k/page.h         Linus Torvalds     2005-04-16  141  

:::::: The code at line 140 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
