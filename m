Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AF419F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679569359; x=1711105359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xk/1XJUDPQZLBkdC07Mm91QEIRL8yFt+vSSjGQmaH9g=;
  b=FGjaDY/kQXYQgYQ7EdqiZsvewQypb2DMr6GmSswv8qKJafPs8Co+vku5
   5x7lg21iuZtgWlP6md2CaovlE12iUX6JgQCGNlMcBQQ1/nrW+F6acRWz0
   rXLSSeZb4zH2oLmIZApk8GUQRECjQeZj2Dn4cUnIEx/zaQelgS8JGGcCw
   dYkEsWcK8V34MTAqj0lXZDhOmEwBpgd17GJetjne/vhSMDBDJQGPAiC9G
   U98GfNXingq2I1NUOXJDr0ixOBuB0t343wko7Mhh2i4yFMUp9VNwFO9jP
   zQSCzGbs/GtPHy0QeH6s35F2j9RpYYdMr1mmhEEtbEUATAuQxNqSaVknI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="367194514"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="367194514"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 04:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="712617064"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="712617064"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 04:02:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfIi6-000EGW-0b;
	Thu, 23 Mar 2023 11:02:22 +0000
Date: Thu, 23 Mar 2023 19:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 269/293] mm/mm_init.c:1386:33: warning: right
 shift count is negative
Message-ID: <202303231850.ZgGa5u2h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   51551d71edbc998fd8c8afa7312db3d270f5998e
commit: a37d26b620530076879100bb6e3953458bf069fe [269/293] mm: move most of core MM initialization to mm/mm_init.c
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230323/202303231850.ZgGa5u2h-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=a37d26b620530076879100bb6e3953458bf069fe
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout a37d26b620530076879100bb6e3953458bf069fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231850.ZgGa5u2h-lkp@intel.com/

All warnings (new ones prefixed by >>):

      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                         ^~~~~~~~~~
   include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   mm/mm_init.c:787:32: note: in expansion of macro 'pageblock_start_pfn'
     787 |                 if (!pfn_valid(pageblock_start_pfn(pfn))) {
         |                                ^~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                         ^~~~~~~~~~
   include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
      58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
         |                                                           ^~~~~~~~~~~~~~~~~~
   mm/mm_init.c:787:32: note: in expansion of macro 'pageblock_start_pfn'
     787 |                 if (!pfn_valid(pageblock_start_pfn(pfn))) {
         |                                ^~~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:59:41: note: in expansion of macro 'ALIGN'
      59 | #define pageblock_end_pfn(pfn)          ALIGN((pfn) + 1, pageblock_nr_pages)
         |                                         ^~~~~
   include/linux/pageblock-flags.h:59:58: note: in expansion of macro 'pageblock_nr_pages'
      59 | #define pageblock_end_pfn(pfn)          ALIGN((pfn) + 1, pageblock_nr_pages)
         |                                                          ^~~~~~~~~~~~~~~~~~
   mm/mm_init.c:788:31: note: in expansion of macro 'pageblock_end_pfn'
     788 |                         pfn = pageblock_end_pfn(pfn) - 1;
         |                               ^~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:59:41: note: in expansion of macro 'ALIGN'
      59 | #define pageblock_end_pfn(pfn)          ALIGN((pfn) + 1, pageblock_nr_pages)
         |                                         ^~~~~
   include/linux/pageblock-flags.h:59:58: note: in expansion of macro 'pageblock_nr_pages'
      59 | #define pageblock_end_pfn(pfn)          ALIGN((pfn) + 1, pageblock_nr_pages)
         |                                                          ^~~~~~~~~~~~~~~~~~
   mm/mm_init.c:788:31: note: in expansion of macro 'pageblock_end_pfn'
     788 |                         pfn = pageblock_end_pfn(pfn) - 1;
         |                               ^~~~~~~~~~~~~~~~~
   mm/mm_init.c: In function 'memmap_init_range':
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/linux/align.h:13:62: note: in definition of macro 'IS_ALIGNED'
      13 | #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
         |                                                              ^
   include/linux/pageblock-flags.h:57:51: note: in expansion of macro 'pageblock_nr_pages'
      57 | #define pageblock_aligned(pfn)  IS_ALIGNED((pfn), pageblock_nr_pages)
         |                                                   ^~~~~~~~~~~~~~~~~~
   mm/mm_init.c:863:21: note: in expansion of macro 'pageblock_aligned'
     863 |                 if (pageblock_aligned(pfn)) {
         |                     ^~~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:19,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from mm/mm_init.c:11:
   mm/mm_init.c: In function 'usemap_size':
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   mm/mm_init.c:1384:39: note: in expansion of macro 'pageblock_nr_pages'
    1384 |         zonesize += zone_start_pfn & (pageblock_nr_pages-1);
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
      55 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                      ^~
   include/linux/math.h:61:25: note: in definition of macro 'roundup'
      61 |         typeof(y) __y = y;                              \
         |                         ^
   mm/mm_init.c:1385:40: note: in expansion of macro 'pageblock_nr_pages'
    1385 |         usemapsize = roundup(zonesize, pageblock_nr_pages);
         |                                        ^~~~~~~~~~~~~~~~~~
>> mm/mm_init.c:1386:33: warning: right shift count is negative [-Wshift-count-negative]
    1386 |         usemapsize = usemapsize >> pageblock_order;
         |                                 ^~
   mm/mm_init.c: In function 'alloc_node_mem_map':
   include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   mm/mm_init.c:1587:43: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
    1587 |         start = pgdat->node_start_pfn & ~(MAX_ORDER_NR_PAGES - 1);
         |                                           ^~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/mm_init.c:1600:23: note: in expansion of macro 'ALIGN'
    1600 |                 end = ALIGN(end, MAX_ORDER_NR_PAGES);
         |                       ^~~~~
   mm/mm_init.c:1600:34: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
    1600 |                 end = ALIGN(end, MAX_ORDER_NR_PAGES);
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/mm_init.c:1600:23: note: in expansion of macro 'ALIGN'
    1600 |                 end = ALIGN(end, MAX_ORDER_NR_PAGES);
         |                       ^~~~~
   mm/mm_init.c:1600:34: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
    1600 |                 end = ALIGN(end, MAX_ORDER_NR_PAGES);
         |                                  ^~~~~~~~~~~~~~~~~~


vim +1386 mm/mm_init.c

  1371	
  1372	#ifndef CONFIG_SPARSEMEM
  1373	/*
  1374	 * Calculate the size of the zone->blockflags rounded to an unsigned long
  1375	 * Start by making sure zonesize is a multiple of pageblock_order by rounding
  1376	 * up. Then use 1 NR_PAGEBLOCK_BITS worth of bits per pageblock, finally
  1377	 * round what is now in bits to nearest long in bits, then return it in
  1378	 * bytes.
  1379	 */
  1380	static unsigned long __init usemap_size(unsigned long zone_start_pfn, unsigned long zonesize)
  1381	{
  1382		unsigned long usemapsize;
  1383	
  1384		zonesize += zone_start_pfn & (pageblock_nr_pages-1);
  1385		usemapsize = roundup(zonesize, pageblock_nr_pages);
> 1386		usemapsize = usemapsize >> pageblock_order;
  1387		usemapsize *= NR_PAGEBLOCK_BITS;
  1388		usemapsize = roundup(usemapsize, 8 * sizeof(unsigned long));
  1389	
  1390		return usemapsize / 8;
  1391	}
  1392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
