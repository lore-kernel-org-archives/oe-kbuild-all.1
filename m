Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D085E19885D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718875333; cv=none; b=gQlRF8nGPCF3AZc9SbECTBwiSWgq/+sDi7FgjGK6g2reiHFWpkoRiakZdEPNZEyJjEJNIRiYZ/nzZOB6bR5EZpfs4HI3z/XrE6hHYbdHpo+xaUhkjc0xPFa1iG7oxeWk5961YmKpnzkQQQvrFkbmL2GWbFWL+ZyX45KH7h1/qX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718875333; c=relaxed/simple;
	bh=1GBPgFzYQp6lWZESE9UQTqcz8c6MOAA9mFMbrUr1QOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fz9QRQL8y51K0M22aHPU/91K/sDhZW3TAGVpfnglDzvKuP2kWwwDIwOqGeMvYIGezrSmV2wOZaV2es2Wv9q5wph38I60cuNLPyUpzTZQVIVdQQQfurNIy+wyKkD3QbfJGf95YLejnBTHdyobCphX0KUNJCMLLHQu5tTmuusrKzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBbNkc7/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBbNkc7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718875331; x=1750411331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1GBPgFzYQp6lWZESE9UQTqcz8c6MOAA9mFMbrUr1QOk=;
  b=TBbNkc7/i7K5FKkgSQl0MMHbkS5HucqVcRAtwJ+CZsN5TkSGe8pk/b9o
   BcBgwqTKzCy+kvA10zuSh4us0UE73oFqKTtNxHvUSM4HZDsIULezmcPip
   RvPgCtvACRZouvqbFHXeLlk37TYHluQFziuj74cMfkv94Z7dzNzd1wLV8
   MwOFIH8x3JtIvyV0Yx3ua649K/V4UZ0G2/yEssV3lAlLwjmbRkc5H6ZPZ
   co8Ar6MfEjPGRctGHE3hhHJPl8JbVavjBG7cpfdCTM+5uTYqQS6ySZu9R
   wkil5fi+Z+WHV90LWh7PC3WM2NMmH/mnT13MoiD2LdftRp0QbcB+WAvT0
   A==;
X-CSE-ConnectionGUID: k5eJJLfDQrCqLc0Z8wC4Zw==
X-CSE-MsgGUID: S1Km33boQEycVsxW5LapkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26962450"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="26962450"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 02:22:10 -0700
X-CSE-ConnectionGUID: VqKn6pIXQ2Cmc04jufAMRw==
X-CSE-MsgGUID: 9d1819oJQg2gwo/eDgRo9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42128231"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jun 2024 02:21:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKDzC-0007Tu-1p;
	Thu, 20 Jun 2024 09:21:42 +0000
Date: Thu, 20 Jun 2024 17:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/next-20240618/kmem_buckets-v5 1/6]
 include/linux/slab.h:662:78: error: subscripted value is neither array nor
 pointer nor vector
Message-ID: <202406201723.BsMQJXcF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/next-20240618/kmem_buckets-v5
head:   c823e15736071e9b694fc62be0c80cbda6a4e344
commit: ac6eb1f5df288a356e73ab40d393a52cc2ec3ed1 [1/6] mm/slab: Introduce kmem_buckets typedef
config: m68k-alldefconfig (https://download.01.org/0day-ci/archive/20240620/202406201723.BsMQJXcF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201723.BsMQJXcF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201723.BsMQJXcF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/include/asm/page.h:10:25: error: 'CONFIG_PAGE_SHIFT' undeclared here (not in a function); did you mean 'CONFIG_LOG_BUF_SHIFT'?
      10 | #define PAGE_SHIFT      CONFIG_PAGE_SHIFT
         |                         ^~~~~~~~~~~~~~~~~
   arch/m68k/include/asm/page.h:11:40: note: in expansion of macro 'PAGE_SHIFT'
      11 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         |                                        ^~~~~~~~~~
   arch/m68k/include/asm/thread_info.h:23:26: note: in expansion of macro 'PAGE_SIZE'
      23 | #define THREAD_SIZE     (PAGE_SIZE << THREAD_SIZE_ORDER)
         |                          ^~~~~~~~~
   include/linux/sched.h:1851:29: note: in expansion of macro 'THREAD_SIZE'
    1851 |         unsigned long stack[THREAD_SIZE/sizeof(long)];
         |                             ^~~~~~~~~~~
   arch/m68k/include/asm/page.h:10:25: warning: "CONFIG_PAGE_SHIFT" is not defined, evaluates to 0 [-Wundef]
      10 | #define PAGE_SHIFT      CONFIG_PAGE_SHIFT
         |                         ^~~~~~~~~~~~~~~~~
   arch/m68k/include/asm/page.h:11:40: note: in expansion of macro 'PAGE_SHIFT'
      11 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         |                                        ^~~~~~~~~~
   include/linux/mm_types.h:531:6: note: in expansion of macro 'PAGE_SIZE'
     531 | #if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
         |      ^~~~~~~~~
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13:
   arch/m68k/include/asm/page.h:10:25: warning: "CONFIG_PAGE_SHIFT" is not defined, evaluates to 0 [-Wundef]
      10 | #define PAGE_SHIFT      CONFIG_PAGE_SHIFT
         |                         ^~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/mm_types.h:508:41: note: in expansion of macro '__ALIGN_MASK'
     508 | #define PAGE_FRAG_CACHE_MAX_SIZE        __ALIGN_MASK(32768, ~PAGE_MASK)
         |                                         ^~~~~~~~~~~~
   arch/m68k/include/asm/page.h:11:40: note: in expansion of macro 'PAGE_SHIFT'
      11 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         |                                        ^~~~~~~~~~
   arch/m68k/include/asm/page.h:12:28: note: in expansion of macro 'PAGE_SIZE'
      12 | #define PAGE_MASK       (~(PAGE_SIZE-1))
         |                            ^~~~~~~~~
   include/linux/mm_types.h:508:62: note: in expansion of macro 'PAGE_MASK'
     508 | #define PAGE_FRAG_CACHE_MAX_SIZE        __ALIGN_MASK(32768, ~PAGE_MASK)
         |                                                              ^~~~~~~~~
   include/linux/mm_types.h:531:18: note: in expansion of macro 'PAGE_FRAG_CACHE_MAX_SIZE'
     531 | #if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/m68k/include/asm/page.h:10:25: warning: "CONFIG_PAGE_SHIFT" is not defined, evaluates to 0 [-Wundef]
      10 | #define PAGE_SHIFT      CONFIG_PAGE_SHIFT
         |                         ^~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/mm_types.h:508:41: note: in expansion of macro '__ALIGN_MASK'
     508 | #define PAGE_FRAG_CACHE_MAX_SIZE        __ALIGN_MASK(32768, ~PAGE_MASK)
         |                                         ^~~~~~~~~~~~
   arch/m68k/include/asm/page.h:11:40: note: in expansion of macro 'PAGE_SHIFT'
      11 | #define PAGE_SIZE       (_AC(1, UL) << PAGE_SHIFT)
         |                                        ^~~~~~~~~~
   arch/m68k/include/asm/page.h:12:28: note: in expansion of macro 'PAGE_SIZE'
      12 | #define PAGE_MASK       (~(PAGE_SIZE-1))
         |                            ^~~~~~~~~
   include/linux/mm_types.h:508:62: note: in expansion of macro 'PAGE_MASK'
     508 | #define PAGE_FRAG_CACHE_MAX_SIZE        __ALIGN_MASK(32768, ~PAGE_MASK)
         |                                                              ^~~~~~~~~
   include/linux/mm_types.h:531:18: note: in expansion of macro 'PAGE_FRAG_CACHE_MAX_SIZE'
     531 | #if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6:
   arch/m68k/include/asm/page.h:10:25: error: expression in static assertion is not an integer
      10 | #define PAGE_SHIFT      CONFIG_PAGE_SHIFT
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/slab.h:527:1: note: in expansion of macro 'static_assert'
     527 | static_assert(PAGE_SHIFT <= 20);
         | ^~~~~~~~~~~~~
   include/linux/slab.h:527:15: note: in expansion of macro 'PAGE_SHIFT'
     527 | static_assert(PAGE_SHIFT <= 20);
         |               ^~~~~~~~~~
   In file included from include/linux/irq.h:21,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from arch/m68k/kernel/asm-offsets.c:16:
   include/linux/slab.h:593:33: warning: 'assume_aligned' attribute argument <erroneous-expression> is not an integer constant [-Wattributes]
     593 |                                 __assume_page_alignment __alloc_size(1);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:596:33: warning: 'assume_aligned' attribute argument <erroneous-expression> is not an integer constant [-Wattributes]
     596 |                                 __assume_page_alignment __alloc_size(1);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h: In function 'kmalloc_noprof':
>> include/linux/slab.h:662:78: error: subscripted value is neither array nor pointer nor vector
     662 |                                 kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
         |                                                                              ^
   include/linux/slab.h:655:30: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     655 |                 unsigned int index;
         |                              ^~~~~
   include/linux/slab.h: In function 'kmalloc_node_noprof':
   include/linux/slab.h:679:78: error: subscripted value is neither array nor pointer nor vector
     679 |                                 kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
         |                                                                              ^
   include/linux/slab.h:672:30: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     672 |                 unsigned int index;
         |                              ^~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/m68k/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +662 include/linux/slab.h

f1b6eb6e6be149 Christoph Lameter     2013-09-04  572  
a0a44d9175b349 Vlastimil Babka       2024-05-27  573  /*
a0a44d9175b349 Vlastimil Babka       2024-05-27  574   * The following functions are not to be used directly and are intended only
a0a44d9175b349 Vlastimil Babka       2024-05-27  575   * for internal use from kmalloc() and kmalloc_node()
a0a44d9175b349 Vlastimil Babka       2024-05-27  576   * with the exception of kunit tests
a0a44d9175b349 Vlastimil Babka       2024-05-27  577   */
a0a44d9175b349 Vlastimil Babka       2024-05-27  578  
a0a44d9175b349 Vlastimil Babka       2024-05-27  579  void *__kmalloc_noprof(size_t size, gfp_t flags)
a0a44d9175b349 Vlastimil Babka       2024-05-27  580  				__assume_kmalloc_alignment __alloc_size(1);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  581  
a0a44d9175b349 Vlastimil Babka       2024-05-27  582  void *__kmalloc_node_noprof(size_t size, gfp_t flags, int node)
a0a44d9175b349 Vlastimil Babka       2024-05-27  583  				__assume_kmalloc_alignment __alloc_size(1);
a0a44d9175b349 Vlastimil Babka       2024-05-27  584  
a0a44d9175b349 Vlastimil Babka       2024-05-27  585  void *__kmalloc_cache_noprof(struct kmem_cache *s, gfp_t flags, size_t size)
a0a44d9175b349 Vlastimil Babka       2024-05-27  586  				__assume_kmalloc_alignment __alloc_size(3);
7bd230a26648ac Suren Baghdasaryan    2024-03-21  587  
a0a44d9175b349 Vlastimil Babka       2024-05-27  588  void *__kmalloc_cache_node_noprof(struct kmem_cache *s, gfp_t gfpflags,
a0a44d9175b349 Vlastimil Babka       2024-05-27  589  				  int node, size_t size)
a0a44d9175b349 Vlastimil Babka       2024-05-27  590  				__assume_kmalloc_alignment __alloc_size(4);
7bd230a26648ac Suren Baghdasaryan    2024-03-21  591  
a0a44d9175b349 Vlastimil Babka       2024-05-27  592  void *__kmalloc_large_noprof(size_t size, gfp_t flags)
a0a44d9175b349 Vlastimil Babka       2024-05-27  593  				__assume_page_alignment __alloc_size(1);
a0c3b940023eef Hyeonggon Yoo         2022-08-17  594  
a0a44d9175b349 Vlastimil Babka       2024-05-27  595  void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
a0a44d9175b349 Vlastimil Babka       2024-05-27  596  				__assume_page_alignment __alloc_size(1);
a0c3b940023eef Hyeonggon Yoo         2022-08-17  597  
f1b6eb6e6be149 Christoph Lameter     2013-09-04  598  /**
838de63b101147 Vlastimil Babka       2022-11-10  599   * kmalloc - allocate kernel memory
f1b6eb6e6be149 Christoph Lameter     2013-09-04  600   * @size: how many bytes of memory are required.
838de63b101147 Vlastimil Babka       2022-11-10  601   * @flags: describe the allocation context
f1b6eb6e6be149 Christoph Lameter     2013-09-04  602   *
f1b6eb6e6be149 Christoph Lameter     2013-09-04  603   * kmalloc is the normal method of allocating memory
f1b6eb6e6be149 Christoph Lameter     2013-09-04  604   * for objects smaller than page size in the kernel.
7e3528c3660a2e Randy Dunlap          2013-11-22  605   *
59bb47985c1db2 Vlastimil Babka       2019-10-06  606   * The allocated object address is aligned to at least ARCH_KMALLOC_MINALIGN
59bb47985c1db2 Vlastimil Babka       2019-10-06  607   * bytes. For @size of power of two bytes, the alignment is also guaranteed
59bb47985c1db2 Vlastimil Babka       2019-10-06  608   * to be at least to the size.
59bb47985c1db2 Vlastimil Babka       2019-10-06  609   *
01598ba6b1a863 Mike Rapoport         2018-11-11  610   * The @flags argument may be one of the GFP flags defined at
e9d198f2be851f Thorsten Scherer      2023-03-12  611   * include/linux/gfp_types.h and described at
01598ba6b1a863 Mike Rapoport         2018-11-11  612   * :ref:`Documentation/core-api/mm-api.rst <mm-api-gfp-flags>`
7e3528c3660a2e Randy Dunlap          2013-11-22  613   *
01598ba6b1a863 Mike Rapoport         2018-11-11  614   * The recommended usage of the @flags is described at
2370ae4b1d5aa7 Mauro Carvalho Chehab 2020-04-10  615   * :ref:`Documentation/core-api/memory-allocation.rst <memory_allocation>`
7e3528c3660a2e Randy Dunlap          2013-11-22  616   *
01598ba6b1a863 Mike Rapoport         2018-11-11  617   * Below is a brief outline of the most useful GFP flags
7e3528c3660a2e Randy Dunlap          2013-11-22  618   *
01598ba6b1a863 Mike Rapoport         2018-11-11  619   * %GFP_KERNEL
01598ba6b1a863 Mike Rapoport         2018-11-11  620   *	Allocate normal kernel ram. May sleep.
7e3528c3660a2e Randy Dunlap          2013-11-22  621   *
01598ba6b1a863 Mike Rapoport         2018-11-11  622   * %GFP_NOWAIT
01598ba6b1a863 Mike Rapoport         2018-11-11  623   *	Allocation will not sleep.
7e3528c3660a2e Randy Dunlap          2013-11-22  624   *
01598ba6b1a863 Mike Rapoport         2018-11-11  625   * %GFP_ATOMIC
01598ba6b1a863 Mike Rapoport         2018-11-11  626   *	Allocation will not sleep.  May use emergency pools.
7e3528c3660a2e Randy Dunlap          2013-11-22  627   *
7e3528c3660a2e Randy Dunlap          2013-11-22  628   * Also it is possible to set different flags by OR'ing
7e3528c3660a2e Randy Dunlap          2013-11-22  629   * in one or more of the following additional @flags:
7e3528c3660a2e Randy Dunlap          2013-11-22  630   *
838de63b101147 Vlastimil Babka       2022-11-10  631   * %__GFP_ZERO
838de63b101147 Vlastimil Babka       2022-11-10  632   *	Zero the allocated memory before returning. Also see kzalloc().
838de63b101147 Vlastimil Babka       2022-11-10  633   *
01598ba6b1a863 Mike Rapoport         2018-11-11  634   * %__GFP_HIGH
01598ba6b1a863 Mike Rapoport         2018-11-11  635   *	This allocation has high priority and may use emergency pools.
7e3528c3660a2e Randy Dunlap          2013-11-22  636   *
01598ba6b1a863 Mike Rapoport         2018-11-11  637   * %__GFP_NOFAIL
01598ba6b1a863 Mike Rapoport         2018-11-11  638   *	Indicate that this allocation is in no way allowed to fail
7e3528c3660a2e Randy Dunlap          2013-11-22  639   *	(think twice before using).
7e3528c3660a2e Randy Dunlap          2013-11-22  640   *
01598ba6b1a863 Mike Rapoport         2018-11-11  641   * %__GFP_NORETRY
01598ba6b1a863 Mike Rapoport         2018-11-11  642   *	If memory is not immediately available,
7e3528c3660a2e Randy Dunlap          2013-11-22  643   *	then give up at once.
7e3528c3660a2e Randy Dunlap          2013-11-22  644   *
01598ba6b1a863 Mike Rapoport         2018-11-11  645   * %__GFP_NOWARN
01598ba6b1a863 Mike Rapoport         2018-11-11  646   *	If allocation fails, don't issue any warnings.
7e3528c3660a2e Randy Dunlap          2013-11-22  647   *
01598ba6b1a863 Mike Rapoport         2018-11-11  648   * %__GFP_RETRY_MAYFAIL
01598ba6b1a863 Mike Rapoport         2018-11-11  649   *	Try really hard to succeed the allocation but fail
dcda9b04713c3f Michal Hocko          2017-07-12  650   *	eventually.
f1b6eb6e6be149 Christoph Lameter     2013-09-04  651   */
7bd230a26648ac Suren Baghdasaryan    2024-03-21  652  static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
f1b6eb6e6be149 Christoph Lameter     2013-09-04  653  {
6fa57d78aa7f21 Kees Cook             2022-11-17  654  	if (__builtin_constant_p(size) && size) {
cc252eae85e095 Vlastimil Babka       2018-10-26  655  		unsigned int index;
3bf019334fbbb5 Kees Cook             2022-11-17  656  
f1b6eb6e6be149 Christoph Lameter     2013-09-04  657  		if (size > KMALLOC_MAX_CACHE_SIZE)
a0a44d9175b349 Vlastimil Babka       2024-05-27  658  			return __kmalloc_large_noprof(size, flags);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  659  
cc252eae85e095 Vlastimil Babka       2018-10-26  660  		index = kmalloc_index(size);
a0a44d9175b349 Vlastimil Babka       2024-05-27  661  		return __kmalloc_cache_noprof(
3c615294058429 GONG, Ruiqi           2023-07-14 @662  				kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
f1b6eb6e6be149 Christoph Lameter     2013-09-04  663  				flags, size);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  664  	}
7bd230a26648ac Suren Baghdasaryan    2024-03-21  665  	return __kmalloc_noprof(size, flags);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  666  }
7bd230a26648ac Suren Baghdasaryan    2024-03-21  667  #define kmalloc(...)				alloc_hooks(kmalloc_noprof(__VA_ARGS__))
ce6a50263d4dde Christoph Lameter     2013-01-10  668  

:::::: The code at line 662 was first introduced by commit
:::::: 3c6152940584290668b35fa0800026f6a1ae05fe Randomized slab caches for kmalloc()

:::::: TO: GONG, Ruiqi <gongruiqi@huaweicloud.com>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
