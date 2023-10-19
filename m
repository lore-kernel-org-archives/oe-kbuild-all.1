Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB219354F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 21:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6Kos0Rv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697752173; x=1729288173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FQauk2a2kZupu9YaGbPDwsxrvgGCJGrPWeSr6iXguy8=;
  b=h6Kos0RvGCiBWn4ym74Z4zOHCVaaJuKUj0V+UP5yU8A7TzXffs+XPV66
   W5LHpfI0FsEASVGQRVDzt0HDFPkAKfSWgbDtrxXKufWhQvF7mGoEp/xIV
   5auC3MnAalIZ515MixM23Ip6pM27zQUvNV3latudVFYEgAvJfufh6aKpk
   rFbwcdF6P4XN+6N6d1FWz259F4TsDb84ViRO8qMpDVbhqHLrdsYQpA/Qf
   l1HRgMgyJT0orVWbeNLraixmpzGXf7ZRXCm8hSzqxxjAPRYNwPRcOVKkq
   vkWiCjsOh6BL9Cuv4i4T0r8KSG84NKW9wCAkZGPNnwzlPaN7h5MIZw9FO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="383591379"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="383591379"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 14:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="900908409"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="900908409"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2023 14:47:24 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtatV-0002d4-2O;
	Thu, 19 Oct 2023 21:49:29 +0000
Date: Fri, 20 Oct 2023 05:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/9] dma-debug: Add dma_debug_ helpers for mapping
 bio_vec arrays
Message-ID: <202310200500.S3lG80My-lkp@intel.com>
References: <169772915215.5232.10127407258544978465.stgit@klimt.1015granger.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169772915215.5232.10127407258544978465.stgit@klimt.1015granger.net>

Hi Chuck,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on rdma/for-next linus/master v6.6-rc6 next-20231019]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/dma-debug-Fix-a-typo-in-a-debugging-eye-catcher/20231020-032859
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/169772915215.5232.10127407258544978465.stgit%40klimt.1015granger.net
patch subject: [PATCH RFC 3/9] dma-debug: Add dma_debug_ helpers for mapping bio_vec arrays
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310200500.S3lG80My-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200500.S3lG80My-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200500.S3lG80My-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/dma/debug.c: In function 'check_bv_segment':
   kernel/dma/debug.c:1204:15: error: 'struct bio_vec' has no member named 'length'
    1204 |         if (bv->length > max_seg)
         |               ^~
   In file included from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/sched/task_stack.h:9,
                    from kernel/dma/debug.c:10:
   kernel/dma/debug.c:1206:30: error: 'struct bio_vec' has no member named 'length'
    1206 |                            bv->length, max_seg);
         |                              ^~
   include/asm-generic/bug.h:99:62: note: in definition of macro '__WARN_printf'
      99 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   kernel/dma/debug.c:224:25: note: in expansion of macro 'WARN'
     224 |                         WARN(1, pr_fmt("%s %s: ") format,               \
         |                         ^~~~
   kernel/dma/debug.c:1205:17: note: in expansion of macro 'err_printk'
    1205 |                 err_printk(dev, NULL, "mapping bv entry longer than device claims to support [len=%u] [max=%u]\n",
         |                 ^~~~~~~~~~
   kernel/dma/debug.c: In function 'debug_dma_map_bvecs':
   kernel/dma/debug.c:1377:38: error: implicit declaration of function 'bv_page'; did you mean 'sg_page'? [-Werror=implicit-function-declaration]
    1377 |                 check_for_stack(dev, bv_page(bv), bv->offset);
         |                                      ^~~~~~~
         |                                      sg_page
   kernel/dma/debug.c:1377:55: error: 'struct bio_vec' has no member named 'offset'; did you mean 'bv_offset'?
    1377 |                 check_for_stack(dev, bv_page(bv), bv->offset);
         |                                                       ^~~~~~
         |                                                       bv_offset
   kernel/dma/debug.c:1377:38: warning: passing argument 2 of 'check_for_stack' makes pointer from integer without a cast [-Wint-conversion]
    1377 |                 check_for_stack(dev, bv_page(bv), bv->offset);
         |                                      ^~~~~~~~~~~
         |                                      |
         |                                      int
   kernel/dma/debug.c:1059:42: note: expected 'struct page *' but argument is of type 'int'
    1059 |                             struct page *page, size_t offset)
         |                             ~~~~~~~~~~~~~^~~~
   kernel/dma/debug.c:1378:34: warning: passing argument 1 of 'PageHighMem' makes pointer from integer without a cast [-Wint-conversion]
    1378 |                 if (!PageHighMem(bv_page(bv)))
         |                                  ^~~~~~~~~~~
         |                                  |
         |                                  int
   In file included from include/linux/mmzone.h:23,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/scatterlist.h:8,
                    from kernel/dma/debug.c:11:
   include/linux/page-flags.h:437:50: note: expected 'const struct page *' but argument is of type 'int'
     437 | static inline int Page##uname(const struct page *page) { return 0; }
         |                               ~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/page-flags.h:461:38: note: in expansion of macro 'TESTPAGEFLAG_FALSE'
     461 | #define PAGEFLAG_FALSE(uname, lname) TESTPAGEFLAG_FALSE(uname, lname)   \
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:531:1: note: in expansion of macro 'PAGEFLAG_FALSE'
     531 | PAGEFLAG_FALSE(HighMem, highmem)
         | ^~~~~~~~~~~~~~
   kernel/dma/debug.c:1379:68: error: 'struct bio_vec' has no member named 'length'
    1379 |                         check_for_illegal_area(dev, bv_virt(bv), bv->length);
         |                                                                    ^~
   In file included from arch/alpha/include/asm/page.h:89,
                    from include/linux/shm.h:6,
                    from include/linux/sched.h:16:
>> include/asm-generic/memory_model.h:46:35: warning: initialization of 'const struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      46 | ({      const struct page *__pg = (pg);                         \
         |                                   ^
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   kernel/dma/debug.c:1391:41: note: in expansion of macro 'page_to_pfn'
    1391 |                 entry->pfn            = page_to_pfn(bv_page(bv));
         |                                         ^~~~~~~~~~~
   kernel/dma/debug.c:1392:45: error: 'struct bio_vec' has no member named 'offset'; did you mean 'bv_offset'?
    1392 |                 entry->offset         = bv->offset;
         |                                             ^~~~~~
         |                                             bv_offset
   kernel/dma/debug.c: In function 'debug_dma_unmap_bvecs':
   kernel/dma/debug.c:1464:25: error: 'nents' undeclared (first use in this function); did you mean 'net'?
    1464 |         for (i = 0; i < nents; i++) {
         |                         ^~~~~
         |                         net
   kernel/dma/debug.c:1464:25: note: each undeclared identifier is reported only once for each function it appears in
>> include/asm-generic/memory_model.h:46:35: warning: initialization of 'const struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      46 | ({      const struct page *__pg = (pg);                         \
         |                                   ^
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   kernel/dma/debug.c:1469:43: note: in expansion of macro 'page_to_pfn'
    1469 |                         .pfn            = page_to_pfn(bv_page(bv)),
         |                                           ^~~~~~~~~~~
   include/asm-generic/memory_model.h:46:35: note: (near initialization for 'ref')
      46 | ({      const struct page *__pg = (pg);                         \
         |                                   ^
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   kernel/dma/debug.c:1469:43: note: in expansion of macro 'page_to_pfn'
    1469 |                         .pfn            = page_to_pfn(bv_page(bv)),
         |                                           ^~~~~~~~~~~
   kernel/dma/debug.c:1470:47: error: 'struct bio_vec' has no member named 'offset'; did you mean 'bv_offset'?
    1470 |                         .offset         = bv->offset,
         |                                               ^~~~~~
         |                                               bv_offset
   kernel/dma/debug.c: In function 'debug_dma_sync_bvecs_for_cpu':
   kernel/dma/debug.c:1700:25: error: 'nents' undeclared (first use in this function); did you mean 'net'?
    1700 |         for (i = 0; i < nents; i++) {
         |                         ^~~~~
         |                         net
   kernel/dma/debug.c:1695:25: warning: unused variable 'bv' [-Wunused-variable]
    1695 |         struct bio_vec *bv;
         |                         ^~
   kernel/dma/debug.c: In function 'debug_dma_sync_bvecs_for_device':
   kernel/dma/debug.c:1732:25: error: 'nents' undeclared (first use in this function); did you mean 'net'?
    1732 |         for (i = 0; i < nents; i++) {
         |                         ^~~~~
         |                         net
   kernel/dma/debug.c:1727:25: warning: unused variable 'bv' [-Wunused-variable]
    1727 |         struct bio_vec *bv;
         |                         ^~
   cc1: some warnings being treated as errors


vim +46 include/asm-generic/memory_model.h

8f6aac419bd590 Christoph Lameter 2007-10-16  39  
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  40  #elif defined(CONFIG_SPARSEMEM)
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  41  /*
1a49123b343461 Zhang Yanfei      2013-10-03  42   * Note: section's mem_map is encoded to reflect its start_pfn.
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  43   * section[i].section_mem_map == mem_map's address - start_pfn;
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  44   */
67de648211fa04 Andy Whitcroft    2006-06-23  45  #define __page_to_pfn(pg)					\
aa462abe8aaf21 Ian Campbell      2011-08-17 @46  ({	const struct page *__pg = (pg);				\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  47  	int __sec = page_to_section(__pg);			\
f05b6284ee5d3b Randy Dunlap      2007-02-10  48  	(unsigned long)(__pg - __section_mem_map_addr(__nr_to_section(__sec)));	\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  49  })
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
