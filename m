Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BC912D1F1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 07:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777792110; cv=none; b=i13lKv9kAtSfJP4Wl34I9u9i53fAwnPgX8ygB1LTzkwYDYhy4q7zoTHYJGRVoLgGNHiUO7jzGwP9vw3h5YMzw0pfbR20n+nU1QoIpmWemwM3jbAp7eQ+iUpwHKOrY2yECPVo0Vaj5w/4cP1BHv7IHVBoVS5WeHuWqMq0uW2XPYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777792110; c=relaxed/simple;
	bh=w7Otdbm43gnmQeUCvJhUSeO8yUuT4dVg6roMz0F8HmA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ifiNYwMfDNdp1f7u4wfbCDank3JttTrmEuOzx7SXRvkjvDqwSY0h96llLDPK1HIjYf7M8w1OyPzShZruPz6bFfWDePeQPd1CpZIPDccvqvSEVwSSKk9zJRUjMt/+NA7XqlUjivA9AOU2rEOtJArJarD22Q+JE9EiEjBxGiFJ85E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kweYNyh0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kweYNyh0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777792109; x=1809328109;
  h=date:from:to:cc:subject:message-id;
  bh=w7Otdbm43gnmQeUCvJhUSeO8yUuT4dVg6roMz0F8HmA=;
  b=kweYNyh0zP8tUEFSbMQvw08NLbvAjhvp7R+fw9GJF1PmD7VKi+mfQFvz
   a7A6o3/jFlFWxcvl5VLHqbPv6Eqyx9zstYXs2dmkRmvWr+IYEI14yoHVN
   HCtPTkeZwMoKL1iVFh1tlYh2vBZBdddUd0YMm8mjo63h4pRoQjg38MeQU
   DfvFq3s/op0bnSHwyluxoOewDKheGIMx39P3s0iuwZTA+n/h3Bix5gISa
   EbfYXrTZJFR0Yn+qc5/ZA3K9BvzC05lNWjHwSQkWAvhCY4pGV4DXO7nG4
   eMg+rqDxlJYavi9Idmg47FDA5eUU3rtxlv7X2jhYkZc7es8do6NMFdHnx
   Q==;
X-CSE-ConnectionGUID: wVbabwwoTaOkT10skW3Qvg==
X-CSE-MsgGUID: 0V5UCRPuSSqPCcdTixJoWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82299202"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="82299202"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 00:08:28 -0700
X-CSE-ConnectionGUID: bQnTnaWSSauIQ/70xJ+xsw==
X-CSE-MsgGUID: loqX5ptuQnCFxv2xx5T3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="237013649"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 May 2026 00:08:25 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJQwB-000000002I9-0829;
	Sun, 03 May 2026 07:08:23 +0000
Date: Sun, 03 May 2026 15:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 8/69] arch/sh/include/asm/page.h:13:9:
 warning: 'PTE_MASK' redefined
Message-ID: <202605031533.ru7yzIpv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3453a5ad954365409373c2762ba237c7e31a623b
commit: 7445c40244aacfd71c931e23818d81c246dcd0dd [8/69] mm: Introduce PTE_SIZE, PTE_SHIFT and PTE_MASK
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605031533.ru7yzIpv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031533.ru7yzIpv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031533.ru7yzIpv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sh/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from arch/sh/kernel/asm-offsets.c:15:
>> arch/sh/include/asm/page.h:13:9: warning: 'PTE_MASK' redefined
      13 | #define PTE_MASK        PAGE_MASK
         |         ^~~~~~~~
   In file included from arch/sh/include/asm/page.h:11:
   include/vdso/page.h:26:9: note: this is the location of the previous definition
      26 | #define PTE_MASK        (~((1 << CONFIG_PTE_SHIFT) - 1))
         |         ^~~~~~~~
   In file included from include/vdso/const.h:5,
                    from include/vdso/bits.h:5,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7:
   arch/sh/include/asm/page.h:13:25: warning: 'PAGE_MASK' is not defined, evaluates to '0' [-Wundef]
      13 | #define PTE_MASK        PAGE_MASK
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:49:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      49 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/mm_types_task.h:47:41: note: in expansion of macro '__ALIGN_MASK'
      47 | #define PAGE_FRAG_CACHE_MAX_SIZE        __ALIGN_MASK(32768, ~PAGE_MASK)
         |                                         ^~~~~~~~~~~~
   include/vdso/page.h:33:25: note: in expansion of macro 'PTE_MASK'
      33 | #define PAGE_MASK       PTE_MASK
         |                         ^~~~~~~~
   include/linux/mm_types_task.h:47:62: note: in expansion of macro 'PAGE_MASK'
      47 | #define PAGE_FRAG_CACHE_MAX_SIZE        __ALIGN_MASK(32768, ~PAGE_MASK)
         |                                                              ^~~~~~~~~
   include/linux/mm_types_task.h:58:18: note: in expansion of macro 'PAGE_FRAG_CACHE_MAX_SIZE'
      58 | #if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE) && (BITS_PER_LONG <= 32)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/sh/include/asm/page.h:13:25: warning: 'PAGE_MASK' is not defined, evaluates to '0' [-Wundef]
      13 | #define PTE_MASK        PAGE_MASK
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:49:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      49 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/mm_types_task.h:47:41: note: in expansion of macro '__ALIGN_MASK'
      47 | #define PAGE_FRAG_CACHE_MAX_SIZE        __ALIGN_MASK(32768, ~PAGE_MASK)
         |                                         ^~~~~~~~~~~~
   include/vdso/page.h:33:25: note: in expansion of macro 'PTE_MASK'
      33 | #define PAGE_MASK       PTE_MASK
         |                         ^~~~~~~~
   include/linux/mm_types_task.h:47:62: note: in expansion of macro 'PAGE_MASK'
      47 | #define PAGE_FRAG_CACHE_MAX_SIZE        __ALIGN_MASK(32768, ~PAGE_MASK)
         |                                                              ^~~~~~~~~
   include/linux/mm_types_task.h:58:18: note: in expansion of macro 'PAGE_FRAG_CACHE_MAX_SIZE'
      58 | #if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE) && (BITS_PER_LONG <= 32)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h: In function 'virt_to_fix':
   arch/sh/include/asm/page.h:13:25: error: 'PAGE_MASK' undeclared (first use in this function)
      13 | #define PTE_MASK        PAGE_MASK
         |                         ^~~~~~~~~
   include/vdso/page.h:33:25: note: in expansion of macro 'PTE_MASK'
      33 | #define PAGE_MASK       PTE_MASK
         |                         ^~~~~~~~
   include/asm-generic/fixmap.h:22:54: note: in expansion of macro 'PAGE_MASK'
      22 | #define __virt_to_fix(x)        ((FIXADDR_TOP - ((x)&PAGE_MASK)) >> PAGE_SHIFT)
         |                                                      ^~~~~~~~~
   include/asm-generic/fixmap.h:39:16: note: in expansion of macro '__virt_to_fix'
      39 |         return __virt_to_fix(vaddr);
         |                ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:13:25: note: each undeclared identifier is reported only once for each function it appears in
      13 | #define PTE_MASK        PAGE_MASK
         |                         ^~~~~~~~~
   include/vdso/page.h:33:25: note: in expansion of macro 'PTE_MASK'
      33 | #define PAGE_MASK       PTE_MASK
         |                         ^~~~~~~~
   include/asm-generic/fixmap.h:22:54: note: in expansion of macro 'PAGE_MASK'
      22 | #define __virt_to_fix(x)        ((FIXADDR_TOP - ((x)&PAGE_MASK)) >> PAGE_SHIFT)
         |                                                      ^~~~~~~~~
   include/asm-generic/fixmap.h:39:16: note: in expansion of macro '__virt_to_fix'
      39 |         return __virt_to_fix(vaddr);
         |                ^~~~~~~~~~~~~
   arch/sh/include/asm/pgtable_32.h: In function 'pte_modify':
   include/vdso/page.h:33:25: error: 'PTE_MASK' undeclared (first use in this function)
      33 | #define PAGE_MASK       PTE_MASK
         |                         ^~~~~~~~
   arch/sh/include/asm/page.h:13:25: note: in expansion of macro 'PAGE_MASK'
      13 | #define PTE_MASK        PAGE_MASK
         |                         ^~~~~~~~~
   arch/sh/include/asm/pgtable_32.h:170:10: note: in expansion of macro 'PTE_MASK'
     170 |         (PTE_MASK | _PAGE_ACCESSED | _PAGE_CACHABLE | \
         |          ^~~~~~~~
   arch/sh/include/asm/pgtable_32.h:385:24: note: in expansion of macro '_PAGE_CHG_MASK'
     385 |         pte.pte_low &= _PAGE_CHG_MASK;
         |                        ^~~~~~~~~~~~~~
   include/linux/highmem.h: In function 'memcpy_folio':
   arch/sh/include/asm/page.h:13:25: error: 'PAGE_MASK' undeclared (first use in this function)
      13 | #define PTE_MASK        PAGE_MASK
         |                         ^~~~~~~~~
   include/vdso/page.h:33:25: note: in expansion of macro 'PTE_MASK'
      33 | #define PAGE_MASK       PTE_MASK
         |                         ^~~~~~~~
   include/linux/mm.h:2793:56: note: in expansion of macro 'PAGE_MASK'
    2793 | #define offset_in_page(p)       ((unsigned long)(p) & ~PAGE_MASK)
         |                                                        ^~~~~~~~~


vim +/PTE_MASK +13 arch/sh/include/asm/page.h

efe8419ae78d65 arch/sh/include/asm/page.h Vincenzo Frascino 2024-10-14  12  
^1da177e4c3f41 include/asm-sh/page.h      Linus Torvalds    2005-04-16 @13  #define PTE_MASK	PAGE_MASK
^1da177e4c3f41 include/asm-sh/page.h      Linus Torvalds    2005-04-16  14  

:::::: The code at line 13 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
