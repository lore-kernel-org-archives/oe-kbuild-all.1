Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C2E171C6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOFm3RAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697819028; x=1729355028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ETKh2e1NV3fV071YxsF79/n5uavxl8lIErNpSfToGtg=;
  b=GOFm3RAWFmOjpLKT8jhACC/0Y5sdrQ0b58G84AvfMj3V8219Gc42VXPh
   1qn0pZ+J5ZcpIPn0yay3HgzZemxFukWbEWNRPBNcxtI3K+7ELjSw8+eCU
   WQMkXS/0XKZWnMZ77COKD1PLJhoxCIfcAba5l2RD83xVs9tK4wbdfUEEI
   g5bv8p9VYyaD6f3ccPU9ZnS7Psp7RwGqy5hXgEM/KZmlVzrBCHIV3mn8k
   FIFmHVQai0SsSfoTFRi1kTuBKTHlsJfhLyokny8eOAuRNRFAXfPwaquLD
   4C8h78f5+IusENQ3zTp1hY4N9PdgYrBrPb21YXDabxXS1hICF75lt4p4f
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="390415062"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="390415062"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 09:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="761099832"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="761099832"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Oct 2023 09:23:19 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtsHM-0003l4-2d;
	Fri, 20 Oct 2023 16:23:16 +0000
Date: Sat, 21 Oct 2023 00:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: Rongwei Wang <rongwei.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/5] mm/numa: migrate leftover numa emulation into
 mm/numa.c
Message-ID: <202310210022.7eFUCB2b-lkp@intel.com>
References: <20231012024842.99703-6-rongwei.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012024842.99703-6-rongwei.wang@linux.alibaba.com>

Hi Rongwei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.6-rc6]
[cannot apply to akpm-mm/mm-everything tip/x86/mm next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rongwei-Wang/mm-numa-move-numa-emulation-APIs-into-generic-files/20231017-143037
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231012024842.99703-6-rongwei.wang%40linux.alibaba.com
patch subject: [PATCH RFC 5/5] mm/numa: migrate leftover numa emulation into mm/numa.c
config: x86_64-buildonly-randconfig-002-20231020 (https://download.01.org/0day-ci/archive/20231021/202310210022.7eFUCB2b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210022.7eFUCB2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210022.7eFUCB2b-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

     339 |         struct numa_memblk *eb = &ei->blk[ei->nr_blks];
         |                                     ^~
   mm/numa.c:339:45: error: invalid use of undefined type 'struct numa_meminfo'
     339 |         struct numa_memblk *eb = &ei->blk[ei->nr_blks];
         |                                             ^~
   mm/numa.c:340:37: error: invalid use of undefined type 'struct numa_meminfo'
     340 |         struct numa_memblk *pb = &pi->blk[phys_blk];
         |                                     ^~
   mm/numa.c:342:15: error: invalid use of undefined type 'struct numa_meminfo'
     342 |         if (ei->nr_blks >= NR_NODE_MEMBLKS) {
         |               ^~
   mm/numa.c:342:28: error: 'NR_NODE_MEMBLKS' undeclared (first use in this function)
     342 |         if (ei->nr_blks >= NR_NODE_MEMBLKS) {
         |                            ^~~~~~~~~~~~~~~
   mm/numa.c:347:11: error: invalid use of undefined type 'struct numa_meminfo'
     347 |         ei->nr_blks++;
         |           ^~
   mm/numa.c:348:11: error: invalid use of undefined type 'struct numa_memblk'
     348 |         eb->start = pb->start;
         |           ^~
   mm/numa.c:348:23: error: invalid use of undefined type 'struct numa_memblk'
     348 |         eb->start = pb->start;
         |                       ^~
   mm/numa.c:349:11: error: invalid use of undefined type 'struct numa_memblk'
     349 |         eb->end = pb->start + size;
         |           ^~
   mm/numa.c:349:21: error: invalid use of undefined type 'struct numa_memblk'
     349 |         eb->end = pb->start + size;
         |                     ^~
   mm/numa.c:350:11: error: invalid use of undefined type 'struct numa_memblk'
     350 |         eb->nid = nid;
         |           ^~
   mm/numa.c:353:42: error: invalid use of undefined type 'struct numa_memblk'
     353 |                 emu_nid_to_phys[nid] = pb->nid;
         |                                          ^~
   mm/numa.c:355:11: error: invalid use of undefined type 'struct numa_memblk'
     355 |         pb->start += size;
         |           ^~
   mm/numa.c:356:15: error: invalid use of undefined type 'struct numa_memblk'
     356 |         if (pb->start >= pb->end) {
         |               ^~
   mm/numa.c:356:28: error: invalid use of undefined type 'struct numa_memblk'
     356 |         if (pb->start >= pb->end) {
         |                            ^~
   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13:
   mm/numa.c:357:32: error: invalid use of undefined type 'struct numa_memblk'
     357 |                 WARN_ON_ONCE(pb->start > pb->end);
         |                                ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/numa.c:357:44: error: invalid use of undefined type 'struct numa_memblk'
     357 |                 WARN_ON_ONCE(pb->start > pb->end);
         |                                            ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   mm/numa.c:362:23: error: invalid use of undefined type 'struct numa_memblk'
     362 |                nid, eb->start, eb->end - 1, (eb->end - eb->start) >> 20);
         |                       ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   mm/numa.c:361:9: note: in expansion of macro 'printk'
     361 |         printk(KERN_INFO "Faking node %d at [mem %#018Lx-%#018Lx] (%LuMB)\n",
         |         ^~~~~~
   mm/numa.c:362:34: error: invalid use of undefined type 'struct numa_memblk'
     362 |                nid, eb->start, eb->end - 1, (eb->end - eb->start) >> 20);
         |                                  ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   mm/numa.c:361:9: note: in expansion of macro 'printk'
     361 |         printk(KERN_INFO "Faking node %d at [mem %#018Lx-%#018Lx] (%LuMB)\n",
         |         ^~~~~~
   mm/numa.c:362:48: error: invalid use of undefined type 'struct numa_memblk'
     362 |                nid, eb->start, eb->end - 1, (eb->end - eb->start) >> 20);
         |                                                ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   mm/numa.c:361:9: note: in expansion of macro 'printk'
     361 |         printk(KERN_INFO "Faking node %d at [mem %#018Lx-%#018Lx] (%LuMB)\n",
         |         ^~~~~~
   mm/numa.c:362:58: error: invalid use of undefined type 'struct numa_memblk'
     362 |                nid, eb->start, eb->end - 1, (eb->end - eb->start) >> 20);
         |                                                          ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   mm/numa.c:361:9: note: in expansion of macro 'printk'
     361 |         printk(KERN_INFO "Faking node %d at [mem %#018Lx-%#018Lx] (%LuMB)\n",
         |         ^~~~~~
   mm/numa.c: In function 'split_nodes_interleave':
   mm/numa.c:376:36: error: 'numa_nodes_parsed' undeclared (first use in this function); did you mean 'numa_node_id'?
     376 |         nodemask_t physnode_mask = numa_nodes_parsed;
         |                                    ^~~~~~~~~~~~~~~~~
         |                                    numa_node_id
>> mm/numa.c:401:25: error: 'FAKE_NODE_MIN_HASH_MASK' undeclared (first use in this function)
     401 |         big = ((size & ~FAKE_NODE_MIN_HASH_MASK) * nr_nodes) /
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
>> mm/numa.c:402:17: error: 'FAKE_NODE_MIN_SIZE' undeclared (first use in this function)
     402 |                 FAKE_NODE_MIN_SIZE;
         |                 ^~~~~~~~~~~~~~~~~~
   mm/numa.c:428:35: error: invalid use of undefined type 'struct numa_meminfo'
     428 |                         start = pi->blk[phys_blk].start;
         |                                   ^~
   mm/numa.c:429:35: error: invalid use of undefined type 'struct numa_meminfo'
     429 |                         limit = pi->blk[phys_blk].end;
         |                                   ^~
   mm/numa.c: In function 'find_end_of_node':
   mm/numa.c:485:24: error: 'FAKE_NODE_MIN_SIZE' undeclared (first use in this function)
     485 |                 end += FAKE_NODE_MIN_SIZE;
         |                        ^~~~~~~~~~~~~~~~~~
   mm/numa.c: At top level:
   mm/numa.c:512:68: warning: 'struct numa_memblk' declared inside parameter list will not be visible outside of this definition or declaration
     512 |                                               int nr_nodes, struct numa_memblk *pblk,
         |                                                                    ^~~~~~~~~~~
   mm/numa.c: In function 'split_nodes_size_interleave_uniform':
   mm/numa.c:515:36: error: 'numa_nodes_parsed' undeclared (first use in this function); did you mean 'numa_node_id'?
     515 |         nodemask_t physnode_mask = numa_nodes_parsed;
         |                                    ^~~~~~~~~~~~~~~~~
         |                                    numa_node_id
   mm/numa.c:536:30: error: invalid use of undefined type 'struct numa_memblk'
     536 |                 node_set(pblk->nid, physnode_mask);
         |                              ^~
   include/linux/nodemask.h:128:41: note: in definition of macro 'node_set'
     128 | #define node_set(node, dst) __node_set((node), &(dst))
         |                                         ^~~~
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4:
   mm/numa.c:554:40: error: 'FAKE_NODE_MIN_SIZE' undeclared (first use in this function)
     554 |         min_size = ALIGN(max(min_size, FAKE_NODE_MIN_SIZE), FAKE_NODE_MIN_SIZE);
         |                                        ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:32:44: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                            ^
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/numa.c:554:20: note: in expansion of macro 'ALIGN'
     554 |         min_size = ALIGN(max(min_size, FAKE_NODE_MIN_SIZE), FAKE_NODE_MIN_SIZE);
         |                    ^~~~~
   include/linux/minmax.h:27:18: note: in expansion of macro '__typecheck'
      27 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/minmax.h:37:31: note: in expansion of macro '__safe_cmp'
      37 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:75:25: note: in expansion of macro '__careful_cmp'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/numa.c:554:26: note: in expansion of macro 'max'
     554 |         min_size = ALIGN(max(min_size, FAKE_NODE_MIN_SIZE), FAKE_NODE_MIN_SIZE);
         |                          ^~~
   include/linux/minmax.h:37:9: error: first argument to '__builtin_choose_expr' not a constant
      37 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:32:44: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                            ^
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/numa.c:554:20: note: in expansion of macro 'ALIGN'
     554 |         min_size = ALIGN(max(min_size, FAKE_NODE_MIN_SIZE), FAKE_NODE_MIN_SIZE);
         |                    ^~~~~
   include/linux/minmax.h:75:25: note: in expansion of macro '__careful_cmp'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/numa.c:554:26: note: in expansion of macro 'max'
     554 |         min_size = ALIGN(max(min_size, FAKE_NODE_MIN_SIZE), FAKE_NODE_MIN_SIZE);
         |                          ^~~
   include/linux/minmax.h:37:9: error: first argument to '__builtin_choose_expr' not a constant
      37 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/numa.c:554:20: note: in expansion of macro 'ALIGN'
     554 |         min_size = ALIGN(max(min_size, FAKE_NODE_MIN_SIZE), FAKE_NODE_MIN_SIZE);
         |                    ^~~~~
   include/linux/minmax.h:75:25: note: in expansion of macro '__careful_cmp'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/numa.c:554:26: note: in expansion of macro 'max'
     554 |         min_size = ALIGN(max(min_size, FAKE_NODE_MIN_SIZE), FAKE_NODE_MIN_SIZE);
         |                          ^~~
   include/linux/minmax.h:37:9: error: first argument to '__builtin_choose_expr' not a constant
      37 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/numa.c:554:20: note: in expansion of macro 'ALIGN'
     554 |         min_size = ALIGN(max(min_size, FAKE_NODE_MIN_SIZE), FAKE_NODE_MIN_SIZE);
         |                    ^~~~~
   include/linux/minmax.h:75:25: note: in expansion of macro '__careful_cmp'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/numa.c:554:26: note: in expansion of macro 'max'
     554 |         min_size = ALIGN(max(min_size, FAKE_NODE_MIN_SIZE), FAKE_NODE_MIN_SIZE);
         |                          ^~~
   mm/numa.c:580:35: error: invalid use of undefined type 'struct numa_meminfo'
     580 |                         start = pi->blk[phys_blk].start;
         |                                   ^~
   mm/numa.c:581:35: error: invalid use of undefined type 'struct numa_meminfo'
     581 |                         limit = pi->blk[phys_blk].end;
         |                                   ^~
   mm/numa.c: At top level:
   mm/numa.c:669:13: warning: no previous prototype for 'numa_emulation' [-Wmissing-prototypes]
     669 | void __init numa_emulation(struct numa_meminfo *numa_meminfo, int numa_dist_cnt)
         |             ^~~~~~~~~~~~~~
   mm/numa.c: In function 'numa_emulation':
   mm/numa.c:671:36: error: storage size of 'ei' isn't known
     671 |         static struct numa_meminfo ei __initdata;
         |                                    ^~
   mm/numa.c:672:36: error: storage size of 'pi' isn't known
     672 |         static struct numa_meminfo pi __initdata;
         |                                    ^~
   include/linux/fortify-string.h:515:65: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     515 |         fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
         |                                                                 ^
   include/linux/fortify-string.h:524:25: note: in expansion of macro '__fortify_memset_chk'
     524 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ^~~~~~~~~~~~~~~~~~~~
   mm/numa.c:682:9: note: in expansion of macro 'memset'
     682 |         memset(&ei, 0, sizeof(ei));
         |         ^~~~~~
   mm/numa.c:683:14: error: invalid use of undefined type 'struct numa_meminfo'
     683 |         pi = *numa_meminfo;
         |              ^
   mm/numa.c:694:44: error: 'numa_nodes_parsed' undeclared (first use in this function); did you mean 'numa_node_id'?
     694 |                 nodemask_t physnode_mask = numa_nodes_parsed;
         |                                            ^~~~~~~~~~~~~~~~~
         |                                            numa_node_id
   mm/numa.c:769:23: error: invalid use of undefined type 'struct numa_meminfo'
     769 |         *numa_meminfo = ei;
         |                       ^
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   mm/numa.c:773:25: note: in expansion of macro 'ARRAY_SIZE'
     773 |         for (i = 0; i < ARRAY_SIZE(ei.blk); i++)
         |                         ^~~~~~~~~~
>> mm/numa.c:784:36: error: '__apicid_to_node' undeclared (first use in this function)
     784 |         for (i = 0; i < ARRAY_SIZE(__apicid_to_node); i++) {
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:33: note: in definition of macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   mm/numa.c:784:25: note: in expansion of macro 'ARRAY_SIZE'
     784 |         for (i = 0; i < ARRAY_SIZE(__apicid_to_node); i++) {
         |                         ^~~~~~~~~~
   mm/numa.c:800:9: error: implicit declaration of function 'numa_free_distance' [-Werror=implicit-function-declaration]
     800 |         numa_free_distance();
         |         ^~~~~~~~~~~~~~~~~~
>> mm/numa.c:815:25: error: implicit declaration of function 'numa_set_distance'; did you mean 'node_distance'? [-Werror=implicit-function-declaration]
     815 |                         numa_set_distance(i, j, dist);
         |                         ^~~~~~~~~~~~~~~~~
         |                         node_distance
   mm/numa.c:672:36: warning: unused variable 'pi' [-Wunused-variable]
     672 |         static struct numa_meminfo pi __initdata;
         |                                    ^~
   mm/numa.c:671:36: warning: unused variable 'ei' [-Wunused-variable]
     671 |         static struct numa_meminfo ei __initdata;
         |                                    ^~
   mm/numa.c: At top level:
   mm/numa.c:830:12: error: conflicting types for 'early_cpu_to_node'; have 'int(unsigned int)'
     830 | extern int early_cpu_to_node(unsigned int cpu);
         |            ^~~~~~~~~~~~~~~~~
   In file included from include/linux/topology.h:36,
                    from include/linux/gfp.h:8:
   arch/x86/include/asm/topology.h:56:19: note: previous definition of 'early_cpu_to_node' with type 'int(int)'
      56 | static inline int early_cpu_to_node(int cpu)
         |                   ^~~~~~~~~~~~~~~~~
>> mm/numa.c:832:6: warning: no previous prototype for 'numa_add_cpu' [-Wmissing-prototypes]
     832 | void numa_add_cpu(unsigned int cpu)
         |      ^~~~~~~~~~~~
>> mm/numa.c:850:6: warning: no previous prototype for 'numa_remove_cpu' [-Wmissing-prototypes]
     850 | void numa_remove_cpu(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~
   mm/numa.c:17:21: error: storage size of 'numa_meminfo' isn't known
      17 | struct numa_meminfo numa_meminfo __initdata_or_meminfo;
         |                     ^~~~~~~~~~~~
   mm/numa.c:18:21: error: storage size of 'numa_reserved_meminfo' isn't known
      18 | struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
         |                     ^~~~~~~~~~~~~~~~~~~~~
   mm/numa.c:672:36: warning: 'pi' defined but not used [-Wunused-variable]
     672 |         static struct numa_meminfo pi __initdata;
         |                                    ^~
   mm/numa.c:671:36: warning: 'ei' defined but not used [-Wunused-variable]
     671 |         static struct numa_meminfo ei __initdata;
         |                                    ^~
   cc1: some warnings being treated as errors


vim +/FAKE_NODE_MIN_HASH_MASK +401 mm/numa.c

   365	
   366	/*
   367	 * Sets up nr_nodes fake nodes interleaved over physical nodes ranging from addr
   368	 * to max_addr.
   369	 *
   370	 * Returns zero on success or negative on error.
   371	 */
   372	static int __init split_nodes_interleave(struct numa_meminfo *ei,
   373						 struct numa_meminfo *pi,
   374						 u64 addr, u64 max_addr, int nr_nodes)
   375	{
   376		nodemask_t physnode_mask = numa_nodes_parsed;
   377		u64 size;
   378		int big;
   379		int nid = 0;
   380		int i, ret;
   381	
   382		if (nr_nodes <= 0)
   383			return -1;
   384		if (nr_nodes > MAX_NUMNODES) {
   385			pr_info("numa=fake=%d too large, reducing to %d\n",
   386				nr_nodes, MAX_NUMNODES);
   387			nr_nodes = MAX_NUMNODES;
   388		}
   389	
   390		/*
   391		 * Calculate target node size.  x86_32 freaks on __udivdi3() so do
   392		 * the division in ulong number of pages and convert back.
   393		 */
   394		size = max_addr - addr - mem_hole_size(addr, max_addr);
   395		size = PFN_PHYS((unsigned long)(size >> PAGE_SHIFT) / nr_nodes);
   396	
   397		/*
   398		 * Calculate the number of big nodes that can be allocated as a result
   399		 * of consolidating the remainder.
   400		 */
 > 401		big = ((size & ~FAKE_NODE_MIN_HASH_MASK) * nr_nodes) /
 > 402			FAKE_NODE_MIN_SIZE;
   403	
   404		size &= FAKE_NODE_MIN_HASH_MASK;
   405		if (!size) {
   406			pr_err("Not enough memory for each node.  "
   407				"NUMA emulation disabled.\n");
   408			return -1;
   409		}
   410	
   411		/*
   412		 * Continue to fill physical nodes with fake nodes until there is no
   413		 * memory left on any of them.
   414		 */
   415		while (!nodes_empty(physnode_mask)) {
   416			for_each_node_mask(i, physnode_mask) {
   417	#ifdef CONFIG_X86
   418				u64 dma32_end = PFN_PHYS(MAX_DMA32_PFN);
   419	#endif
   420				u64 start, limit, end;
   421				int phys_blk;
   422	
   423				phys_blk = emu_find_memblk_by_nid(i, pi);
   424				if (phys_blk < 0) {
   425					node_clear(i, physnode_mask);
   426					continue;
   427				}
   428				start = pi->blk[phys_blk].start;
   429				limit = pi->blk[phys_blk].end;
   430				end = start + size;
   431	
   432				if (nid < big)
   433					end += FAKE_NODE_MIN_SIZE;
   434	
   435				/*
   436				 * Continue to add memory to this fake node if its
   437				 * non-reserved memory is less than the per-node size.
   438				 */
   439				while (end - start - mem_hole_size(start, end) < size) {
   440					end += FAKE_NODE_MIN_SIZE;
   441					if (end > limit) {
   442						end = limit;
   443						break;
   444					}
   445				}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
