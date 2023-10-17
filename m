Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC3436AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqqZ1UCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697554043; x=1729090043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3/DGHFU1pGOMs1+v+Sm5axgxMZrY+zo/I1KR1Ujh0Z0=;
  b=SqqZ1UCsSlTD37XnqprMiFblHKCJpt/uE2nNOsPB2AVwn7QoluQssGdn
   wmGFiwsCo9d9sbm2UQPz2kkiC4W7Gz1W6Ue4OW+fA5zTrltTkOwzY1pUi
   HpWjsXVpsT+nEIw6Al+RxkV+kOEXsrxXSMhsjK0CD6cSFmYkqM9ZFwFqm
   C85/D0VPWumDUonilHTUJU91CG0DODdExQD6PqMDAEwHvl6917HfRxhQi
   9lt309TUrxssdqg1jLpFv56spvsOlSBPKYKF+0dH5izAYqlQ29/zk3AMI
   VqtyeqZFW3T/AbPw/JaTrAdh7wIXEaV2jwKDgSOa8FTQ7HQD816UUc4JY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="416879624"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="416879624"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 07:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="929795892"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="929795892"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Oct 2023 07:47:20 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qslLp-0009gl-33;
	Tue, 17 Oct 2023 14:47:17 +0000
Date: Tue, 17 Oct 2023 22:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rongwei Wang <rongwei.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/5] mm/numa: move numa emulation APIs into generic
 files
Message-ID: <202310172217.pGMtLtfD-lkp@intel.com>
References: <20231012024842.99703-2-rongwei.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012024842.99703-2-rongwei.wang@linux.alibaba.com>

Hi Rongwei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus tip/x86/mm linus/master v6.6-rc6]
[cannot apply to akpm-mm/mm-everything next-20231017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rongwei-Wang/mm-percpu-fix-variable-type-of-cpu/20231017-102250
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231012024842.99703-2-rongwei.wang%40linux.alibaba.com
patch subject: [PATCH RFC 1/5] mm/numa: move numa emulation APIs into generic files
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310172217.pGMtLtfD-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310172217.pGMtLtfD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172217.pGMtLtfD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/numa.c:22:13: warning: no previous prototype for 'numa_nodemask_from_meminfo' [-Wmissing-prototypes]
      22 | void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from mm/numa.c:2:
   mm/numa.c: In function 'numa_nodemask_from_meminfo':
   mm/numa.c:27:38: error: invalid use of undefined type 'const struct numa_meminfo'
      27 |         for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
         |                                      ^~
   include/linux/kernel.h:57:33: note: in definition of macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   mm/numa.c:27:38: error: invalid use of undefined type 'const struct numa_meminfo'
      27 |         for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
         |                                      ^~
   include/linux/kernel.h:57:48: note: in definition of macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                ^~~
   In file included from include/linux/bits.h:21,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12:
   mm/numa.c:27:38: error: invalid use of undefined type 'const struct numa_meminfo'
      27 |         for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
         |                                      ^~
   include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   include/linux/compiler.h:231:51: note: in expansion of macro '__same_type'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                                   ^~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   mm/numa.c:27:25: note: in expansion of macro 'ARRAY_SIZE'
      27 |         for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
         |                         ^~~~~~~~~~
   mm/numa.c:27:38: error: invalid use of undefined type 'const struct numa_meminfo'
      27 |         for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
         |                                      ^~
   include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   include/linux/compiler.h:231:51: note: in expansion of macro '__same_type'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                                   ^~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   mm/numa.c:27:25: note: in expansion of macro 'ARRAY_SIZE'
      27 |         for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
         |                         ^~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   mm/numa.c:27:25: note: in expansion of macro 'ARRAY_SIZE'
      27 |         for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
         |                         ^~~~~~~~~~
   mm/numa.c:28:23: error: invalid use of undefined type 'const struct numa_meminfo'
      28 |                 if (mi->blk[i].start != mi->blk[i].end &&
         |                       ^~
   mm/numa.c:28:43: error: invalid use of undefined type 'const struct numa_meminfo'
      28 |                 if (mi->blk[i].start != mi->blk[i].end &&
         |                                           ^~
   mm/numa.c:29:23: error: invalid use of undefined type 'const struct numa_meminfo'
      29 |                     mi->blk[i].nid != NUMA_NO_NODE)
         |                       ^~
   In file included from include/linux/mmzone.h:18:
   mm/numa.c:30:36: error: invalid use of undefined type 'const struct numa_meminfo'
      30 |                         node_set(mi->blk[i].nid, *nodemask);
         |                                    ^~
   include/linux/nodemask.h:128:41: note: in definition of macro 'node_set'
     128 | #define node_set(node, dst) __node_set((node), &(dst))
         |                                         ^~~~
   mm/numa.c: In function 'numa_remove_memblk_from':
   mm/numa.c:43:11: error: invalid use of undefined type 'struct numa_meminfo'
      43 |         mi->nr_blks--;
         |           ^~
   mm/numa.c:44:20: error: invalid use of undefined type 'struct numa_meminfo'
      44 |         memmove(&mi->blk[idx], &mi->blk[idx + 1],
         |                    ^~
   mm/numa.c:44:35: error: invalid use of undefined type 'struct numa_meminfo'
      44 |         memmove(&mi->blk[idx], &mi->blk[idx + 1],
         |                                   ^~
   mm/numa.c:45:20: error: invalid use of undefined type 'struct numa_meminfo'
      45 |                 (mi->nr_blks - idx) * sizeof(mi->blk[0]));
         |                    ^~
   mm/numa.c:45:48: error: invalid use of undefined type 'struct numa_meminfo'
      45 |                 (mi->nr_blks - idx) * sizeof(mi->blk[0]));
         |                                                ^~
   mm/numa.c: In function 'numa_move_tail_memblk':
   mm/numa.c:57:12: error: invalid use of undefined type 'struct numa_meminfo'
      57 |         dst->blk[dst->nr_blks++] = src->blk[idx];
         |            ^~
   mm/numa.c:57:21: error: invalid use of undefined type 'struct numa_meminfo'
      57 |         dst->blk[dst->nr_blks++] = src->blk[idx];
         |                     ^~
   mm/numa.c:57:39: error: invalid use of undefined type 'struct numa_meminfo'
      57 |         dst->blk[dst->nr_blks++] = src->blk[idx];
         |                                       ^~
   mm/numa.c: At top level:
>> mm/numa.c:61:12: warning: no previous prototype for 'numa_add_memblk_to' [-Wmissing-prototypes]
      61 | int __init numa_add_memblk_to(int nid, u64 start, u64 end,
         |            ^~~~~~~~~~~~~~~~~~
   mm/numa.c: In function 'numa_add_memblk_to':
   mm/numa.c:75:15: error: invalid use of undefined type 'struct numa_meminfo'
      75 |         if (mi->nr_blks >= NR_NODE_MEMBLKS) {
         |               ^~
   mm/numa.c:75:28: error: 'NR_NODE_MEMBLKS' undeclared (first use in this function)
      75 |         if (mi->nr_blks >= NR_NODE_MEMBLKS) {
         |                            ^~~~~~~~~~~~~~~
   mm/numa.c:75:28: note: each undeclared identifier is reported only once for each function it appears in
   mm/numa.c:80:11: error: invalid use of undefined type 'struct numa_meminfo'
      80 |         mi->blk[mi->nr_blks].start = start;
         |           ^~
   mm/numa.c:80:19: error: invalid use of undefined type 'struct numa_meminfo'
      80 |         mi->blk[mi->nr_blks].start = start;
         |                   ^~
   mm/numa.c:81:11: error: invalid use of undefined type 'struct numa_meminfo'
      81 |         mi->blk[mi->nr_blks].end = end;
         |           ^~
   mm/numa.c:81:19: error: invalid use of undefined type 'struct numa_meminfo'
      81 |         mi->blk[mi->nr_blks].end = end;
         |                   ^~
   mm/numa.c:82:11: error: invalid use of undefined type 'struct numa_meminfo'
      82 |         mi->blk[mi->nr_blks].nid = nid;
         |           ^~
   mm/numa.c:82:19: error: invalid use of undefined type 'struct numa_meminfo'
      82 |         mi->blk[mi->nr_blks].nid = nid;
         |                   ^~
   mm/numa.c:83:11: error: invalid use of undefined type 'struct numa_meminfo'
      83 |         mi->nr_blks++;
         |           ^~
   mm/numa.c: At top level:
>> mm/numa.c:97:12: warning: no previous prototype for 'numa_cleanup_meminfo' [-Wmissing-prototypes]
      97 | int __init numa_cleanup_meminfo(struct numa_meminfo *mi)
         |            ^~~~~~~~~~~~~~~~~~~~
   mm/numa.c: In function 'numa_cleanup_meminfo':
   mm/numa.c:104:27: error: invalid use of undefined type 'struct numa_meminfo'
     104 |         for (i = 0; i < mi->nr_blks; i++) {
         |                           ^~
   mm/numa.c:105:45: error: invalid use of undefined type 'struct numa_meminfo'
     105 |                 struct numa_memblk *bi = &mi->blk[i];
         |                                             ^~
   mm/numa.c:109:43: error: invalid use of undefined type 'struct numa_memblk'
     109 |                                         bi->start, bi->end - bi->start)) {
         |                                           ^~
   mm/numa.c:109:54: error: invalid use of undefined type 'struct numa_memblk'
     109 |                                         bi->start, bi->end - bi->start)) {
         |                                                      ^~
   mm/numa.c:109:64: error: invalid use of undefined type 'struct numa_memblk'
     109 |                                         bi->start, bi->end - bi->start)) {
         |                                                                ^~
   mm/numa.c:115:19: error: invalid use of undefined type 'struct numa_memblk'
     115 |                 bi->start = max(bi->start, low);
         |                   ^~
   In file included from include/linux/ioport.h:15:
   mm/numa.c:115:35: error: invalid use of undefined type 'struct numa_memblk'
     115 |                 bi->start = max(bi->start, low);
         |                                   ^~
   include/linux/minmax.h:21:28: note: in definition of macro '__typecheck'
      21 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                            ^
   include/linux/minmax.h:37:31: note: in expansion of macro '__safe_cmp'
      37 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:75:25: note: in expansion of macro '__careful_cmp'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/numa.c:115:29: note: in expansion of macro 'max'
     115 |                 bi->start = max(bi->start, low);
         |                             ^~~
   In file included from include/linux/bits.h:5:
   mm/numa.c:115:35: error: invalid use of undefined type 'struct numa_memblk'
     115 |                 bi->start = max(bi->start, low);
         |                                   ^~
   include/linux/const.h:12:55: note: in definition of macro '__is_constexpr'
      12 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/minmax.h:27:39: note: in expansion of macro '__no_side_effects'
      27 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                                       ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:31: note: in expansion of macro '__safe_cmp'
      37 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:75:25: note: in expansion of macro '__careful_cmp'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/numa.c:115:29: note: in expansion of macro 'max'
     115 |                 bi->start = max(bi->start, low);
         |                             ^~~
   mm/numa.c:115:35: error: invalid use of undefined type 'struct numa_memblk'
     115 |                 bi->start = max(bi->start, low);
         |                                   ^~
   include/linux/minmax.h:29:27: note: in definition of macro '__cmp'
      29 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                           ^
   include/linux/minmax.h:75:25: note: in expansion of macro '__careful_cmp'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/numa.c:115:29: note: in expansion of macro 'max'
     115 |                 bi->start = max(bi->start, low);
         |                             ^~~
   mm/numa.c:115:35: error: invalid use of undefined type 'struct numa_memblk'
     115 |                 bi->start = max(bi->start, low);
         |                                   ^~
   include/linux/minmax.h:29:40: note: in definition of macro '__cmp'
      29 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                        ^
   include/linux/minmax.h:75:25: note: in expansion of macro '__careful_cmp'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/numa.c:115:29: note: in expansion of macro 'max'
     115 |                 bi->start = max(bi->start, low);
         |                             ^~~
   mm/numa.c:115:35: error: invalid use of undefined type 'struct numa_memblk'
     115 |                 bi->start = max(bi->start, low);
         |                                   ^~
   include/linux/minmax.h:32:24: note: in definition of macro '__cmp_once'
      32 |                 typeof(x) unique_x = (x);               \
         |                        ^
   include/linux/minmax.h:75:25: note: in expansion of macro '__careful_cmp'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/numa.c:115:29: note: in expansion of macro 'max'
     115 |                 bi->start = max(bi->start, low);
         |                             ^~~
   mm/numa.c:115:35: error: invalid use of undefined type 'struct numa_memblk'
     115 |                 bi->start = max(bi->start, low);
         |                                   ^~
   include/linux/minmax.h:32:39: note: in definition of macro '__cmp_once'
      32 |                 typeof(x) unique_x = (x);               \
         |                                       ^
   include/linux/minmax.h:75:25: note: in expansion of macro '__careful_cmp'
      75 | #define max(x, y)       __careful_cmp(x, y, >)
--
         |                                                   ^~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   mm/numa.c:183:35: note: in expansion of macro 'ARRAY_SIZE'
     183 |         for (i = mi->nr_blks; i < ARRAY_SIZE(mi->blk); i++) {
         |                                   ^~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:59: note: in expansion of macro '__must_be_array'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   mm/numa.c:183:35: note: in expansion of macro 'ARRAY_SIZE'
     183 |         for (i = mi->nr_blks; i < ARRAY_SIZE(mi->blk); i++) {
         |                                   ^~~~~~~~~~
   mm/numa.c:184:19: error: invalid use of undefined type 'struct numa_meminfo'
     184 |                 mi->blk[i].start = mi->blk[i].end = 0;
         |                   ^~
   mm/numa.c:184:38: error: invalid use of undefined type 'struct numa_meminfo'
     184 |                 mi->blk[i].start = mi->blk[i].end = 0;
         |                                      ^~
   mm/numa.c:185:19: error: invalid use of undefined type 'struct numa_meminfo'
     185 |                 mi->blk[i].nid = NUMA_NO_NODE;
         |                   ^~
   mm/numa.c: In function 'numa_clear_kernel_node_hotplug':
   mm/numa.c:215:37: error: invalid use of undefined type 'struct numa_meminfo'
     215 |         for (i = 0; i < numa_meminfo.nr_blks; i++) {
         |                                     ^
   mm/numa.c:216:54: error: invalid use of undefined type 'struct numa_meminfo'
     216 |                 struct numa_memblk *mb = numa_meminfo.blk + i;
         |                                                      ^
   mm/numa.c:219:43: error: invalid use of undefined type 'struct numa_memblk'
     219 |                 ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
         |                                           ^~
   mm/numa.c:219:54: error: invalid use of undefined type 'struct numa_memblk'
     219 |                 ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
         |                                                      ^~
   mm/numa.c:219:64: error: invalid use of undefined type 'struct numa_memblk'
     219 |                 ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
         |                                                                ^~
   mm/numa.c:219:95: error: invalid use of undefined type 'struct numa_memblk'
     219 |                 ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
         |                                                                                               ^~
   mm/numa.c:247:37: error: invalid use of undefined type 'struct numa_meminfo'
     247 |         for (i = 0; i < numa_meminfo.nr_blks; i++) {
         |                                     ^
   mm/numa.c:248:54: error: invalid use of undefined type 'struct numa_meminfo'
     248 |                 struct numa_memblk *mb = numa_meminfo.blk + i;
         |                                                      ^
   In file included from include/linux/thread_info.h:27:
   mm/numa.c:250:35: error: invalid use of undefined type 'struct numa_memblk'
     250 |                 if (!node_isset(mb->nid, reserved_nodemask))
         |                                   ^~
   include/linux/bitops.h:49:32: note: in definition of macro 'bitop'
      49 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/nodemask.h:153:36: note: in expansion of macro 'test_bit'
     153 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/numa.c:250:22: note: in expansion of macro 'node_isset'
     250 |                 if (!node_isset(mb->nid, reserved_nodemask))
         |                      ^~~~~~~~~~
   mm/numa.c:250:35: error: invalid use of undefined type 'struct numa_memblk'
     250 |                 if (!node_isset(mb->nid, reserved_nodemask))
         |                                   ^~
   include/linux/bitops.h:53:20: note: in definition of macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/nodemask.h:153:36: note: in expansion of macro 'test_bit'
     153 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/numa.c:250:22: note: in expansion of macro 'node_isset'
     250 |                 if (!node_isset(mb->nid, reserved_nodemask))
         |                      ^~~~~~~~~~
   mm/numa.c:250:35: error: invalid use of undefined type 'struct numa_memblk'
     250 |                 if (!node_isset(mb->nid, reserved_nodemask))
         |                                   ^~
   include/linux/bitops.h:53:35: note: in definition of macro 'bitop'
      53 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^~
   include/linux/nodemask.h:153:36: note: in expansion of macro 'test_bit'
     153 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/numa.c:250:22: note: in expansion of macro 'node_isset'
     250 |                 if (!node_isset(mb->nid, reserved_nodemask))
         |                      ^~~~~~~~~~
   mm/numa.c:253:42: error: invalid use of undefined type 'struct numa_memblk'
     253 |                 memblock_clear_hotplug(mb->start, mb->end - mb->start);
         |                                          ^~
   mm/numa.c:253:53: error: invalid use of undefined type 'struct numa_memblk'
     253 |                 memblock_clear_hotplug(mb->start, mb->end - mb->start);
         |                                                     ^~
   mm/numa.c:253:63: error: invalid use of undefined type 'struct numa_memblk'
     253 |                 memblock_clear_hotplug(mb->start, mb->end - mb->start);
         |                                                               ^~
   mm/numa.c: At top level:
>> mm/numa.c:257:19: warning: no previous prototype for 'numa_register_memblks' [-Wmissing-prototypes]
     257 | int __weak __init numa_register_memblks(struct numa_meminfo *mi)
         |                   ^~~~~~~~~~~~~~~~~~~~~
   mm/numa.c: In function 'numa_register_memblks':
   mm/numa.c:262:29: error: 'numa_nodes_parsed' undeclared (first use in this function); did you mean 'numa_node_id'?
     262 |         node_possible_map = numa_nodes_parsed;
         |                             ^~~~~~~~~~~~~~~~~
         |                             numa_node_id
   mm/numa.c:267:27: error: invalid use of undefined type 'struct numa_meminfo'
     267 |         for (i = 0; i < mi->nr_blks; i++) {
         |                           ^~
   mm/numa.c:268:45: error: invalid use of undefined type 'struct numa_meminfo'
     268 |                 struct numa_memblk *mb = &mi->blk[i];
         |                                             ^~
   mm/numa.c:269:37: error: invalid use of undefined type 'struct numa_memblk'
     269 |                 memblock_set_node(mb->start, mb->end - mb->start,
         |                                     ^~
   mm/numa.c:269:48: error: invalid use of undefined type 'struct numa_memblk'
     269 |                 memblock_set_node(mb->start, mb->end - mb->start,
         |                                                ^~
   mm/numa.c:269:58: error: invalid use of undefined type 'struct numa_memblk'
     269 |                 memblock_set_node(mb->start, mb->end - mb->start,
         |                                                          ^~
   mm/numa.c:270:55: error: invalid use of undefined type 'struct numa_memblk'
     270 |                                   &memblock.memory, mb->nid);
         |                                                       ^~
   mm/numa.c: At top level:
   mm/numa.c:16:21: error: storage size of 'numa_meminfo' isn't known
      16 | struct numa_meminfo numa_meminfo __initdata_or_meminfo;
         |                     ^~~~~~~~~~~~
   mm/numa.c:17:21: error: storage size of 'numa_reserved_meminfo' isn't known
      17 | struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
         |                     ^~~~~~~~~~~~~~~~~~~~~


vim +/numa_nodemask_from_meminfo +22 mm/numa.c

    18	
    19	/*
    20	 * Set nodes, which have memory in @mi, in *@nodemask.
    21	 */
  > 22	void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
    23						      const struct numa_meminfo *mi)
    24	{
    25		int i;
    26	
    27		for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
    28			if (mi->blk[i].start != mi->blk[i].end &&
    29			    mi->blk[i].nid != NUMA_NO_NODE)
    30				node_set(mi->blk[i].nid, *nodemask);
    31	}
    32	
    33	/**
    34	 * numa_remove_memblk_from - Remove one numa_memblk from a numa_meminfo
    35	 * @idx: Index of memblk to remove
    36	 * @mi: numa_meminfo to remove memblk from
    37	 *
    38	 * Remove @idx'th numa_memblk from @mi by shifting @mi->blk[] and
    39	 * decrementing @mi->nr_blks.
    40	 */
    41	static void __init numa_remove_memblk_from(int idx, struct numa_meminfo *mi)
    42	{
    43		mi->nr_blks--;
    44		memmove(&mi->blk[idx], &mi->blk[idx + 1],
    45			(mi->nr_blks - idx) * sizeof(mi->blk[0]));
    46	}
    47	
    48	/**
    49	 * numa_move_tail_memblk - Move a numa_memblk from one numa_meminfo to another
    50	 * @dst: numa_meminfo to append block to
    51	 * @idx: Index of memblk to remove
    52	 * @src: numa_meminfo to remove memblk from
    53	 */
    54	static void __init numa_move_tail_memblk(struct numa_meminfo *dst, int idx,
    55						 struct numa_meminfo *src)
    56	{
    57		dst->blk[dst->nr_blks++] = src->blk[idx];
    58		numa_remove_memblk_from(idx, src);
    59	}
    60	
  > 61	int __init numa_add_memblk_to(int nid, u64 start, u64 end,
    62					     struct numa_meminfo *mi)
    63	{
    64		/* ignore zero length blks */
    65		if (start == end)
    66			return 0;
    67	
    68		/* whine about and ignore invalid blks */
    69		if (start > end || nid < 0 || nid >= MAX_NUMNODES) {
    70			pr_warn("Warning: invalid memblk node %d [mem %#010Lx-%#010Lx]\n",
    71				nid, start, end - 1);
    72			return 0;
    73		}
    74	
    75		if (mi->nr_blks >= NR_NODE_MEMBLKS) {
    76			pr_err("too many memblk ranges\n");
    77			return -EINVAL;
    78		}
    79	
    80		mi->blk[mi->nr_blks].start = start;
    81		mi->blk[mi->nr_blks].end = end;
    82		mi->blk[mi->nr_blks].nid = nid;
    83		mi->nr_blks++;
    84		return 0;
    85	}
    86	
    87	/**
    88	 * numa_cleanup_meminfo - Cleanup a numa_meminfo
    89	 * @mi: numa_meminfo to clean up
    90	 *
    91	 * Sanitize @mi by merging and removing unnecessary memblks.  Also check for
    92	 * conflicts and clear unused memblks.
    93	 *
    94	 * RETURNS:
    95	 * 0 on success, -errno on failure.
    96	 */
  > 97	int __init numa_cleanup_meminfo(struct numa_meminfo *mi)
    98	{
    99		const u64 low = 0;
   100		const u64 high = PFN_PHYS(max_pfn);
   101		int i, j, k;
   102	
   103		/* first, trim all entries */
   104		for (i = 0; i < mi->nr_blks; i++) {
   105			struct numa_memblk *bi = &mi->blk[i];
   106	
   107			/* move / save reserved memory ranges */
   108			if (!memblock_overlaps_region(&memblock.memory,
   109						bi->start, bi->end - bi->start)) {
   110				numa_move_tail_memblk(&numa_reserved_meminfo, i--, mi);
   111				continue;
   112			}
   113	
   114			/* make sure all non-reserved blocks are inside the limits */
   115			bi->start = max(bi->start, low);
   116	
   117			/* preserve info for non-RAM areas above 'max_pfn': */
   118			if (bi->end > high) {
   119				numa_add_memblk_to(bi->nid, high, bi->end,
   120						   &numa_reserved_meminfo);
   121				bi->end = high;
   122			}
   123	
   124			/* and there's no empty block */
   125			if (bi->start >= bi->end)
   126				numa_remove_memblk_from(i--, mi);
   127		}
   128	
   129		/* merge neighboring / overlapping entries */
   130		for (i = 0; i < mi->nr_blks; i++) {
   131			struct numa_memblk *bi = &mi->blk[i];
   132	
   133			for (j = i + 1; j < mi->nr_blks; j++) {
   134				struct numa_memblk *bj = &mi->blk[j];
   135				u64 start, end;
   136	
   137				/*
   138				 * See whether there are overlapping blocks.  Whine
   139				 * about but allow overlaps of the same nid.  They
   140				 * will be merged below.
   141				 */
   142				if (bi->end > bj->start && bi->start < bj->end) {
   143					if (bi->nid != bj->nid) {
   144						pr_err("node %d [mem %#010Lx-%#010Lx] overlaps with node %d [mem %#010Lx-%#010Lx]\n",
   145						       bi->nid, bi->start, bi->end - 1,
   146						       bj->nid, bj->start, bj->end - 1);
   147						return -EINVAL;
   148					}
   149					pr_warn("Warning: node %d [mem %#010Lx-%#010Lx] overlaps with itself [mem %#010Lx-%#010Lx]\n",
   150						bi->nid, bi->start, bi->end - 1,
   151						bj->start, bj->end - 1);
   152				}
   153	
   154				/*
   155				 * Join together blocks on the same node, holes
   156				 * between which don't overlap with memory on other
   157				 * nodes.
   158				 */
   159				if (bi->nid != bj->nid)
   160					continue;
   161				start = min(bi->start, bj->start);
   162				end = max(bi->end, bj->end);
   163				for (k = 0; k < mi->nr_blks; k++) {
   164					struct numa_memblk *bk = &mi->blk[k];
   165	
   166					if (bi->nid == bk->nid)
   167						continue;
   168					if (start < bk->end && end > bk->start)
   169						break;
   170				}
   171				if (k < mi->nr_blks)
   172					continue;
   173				printk(KERN_INFO "NUMA: Node %d [mem %#010Lx-%#010Lx] + [mem %#010Lx-%#010Lx] -> [mem %#010Lx-%#010Lx]\n",
   174				       bi->nid, bi->start, bi->end - 1, bj->start,
   175				       bj->end - 1, start, end - 1);
   176				bi->start = start;
   177				bi->end = end;
   178				numa_remove_memblk_from(j--, mi);
   179			}
   180		}
   181	
   182		/* clear unused ones */
   183		for (i = mi->nr_blks; i < ARRAY_SIZE(mi->blk); i++) {
   184			mi->blk[i].start = mi->blk[i].end = 0;
   185			mi->blk[i].nid = NUMA_NO_NODE;
   186		}
   187	
   188		return 0;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
