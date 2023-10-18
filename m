Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3144C1EB24
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 20:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJMlMPl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697659424; x=1729195424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b3rUgJhxkDZ4uAQ9XRF/57xvLKXosBdQ2xHr36+EEBA=;
  b=KJMlMPl8Dk6i8yv0grA+97uwitmBq2oG3AVdCJIOuc8OIds3JqEHl9f4
   QhxfvDP3NKeVqk5S/5sM9b1m9sTz/LF7SX3mzcDAnKA5Ie+VgIOUwzaxp
   xdFt22PNKDetr5qZITcnIX3cgd88lB+GIVSHIA+rbocQqTOqYje0ngchq
   g+z5vVD7OChUE6Y5+5vi6Kcuj8e9FffG3kBFNDZ6euUWEiKL8M10PwjPN
   gQRn8KZCDDr7SUtt8IHQv/+xhCDW0VoqlZJFnT1MyWEhZXYqz5J5r8aQ7
   H7l0YUHMpv2a5mIETaOJOTh9nktFHfkkduyZcY7i8fr+UwjACEXDeSqio
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389979122"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="389979122"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 13:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="880365743"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="880365743"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Oct 2023 13:03:20 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtClC-0000xV-1l;
	Wed, 18 Oct 2023 20:03:18 +0000
Date: Thu, 19 Oct 2023 04:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Rongwei Wang <rongwei.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/5] mm/numa: move numa emulation APIs into generic
 files
Message-ID: <202310190319.9EvnrjP3-lkp@intel.com>
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
[cannot apply to akpm-mm/mm-everything next-20231018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rongwei-Wang/mm-percpu-fix-variable-type-of-cpu/20231017-102250
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231012024842.99703-2-rongwei.wang%40linux.alibaba.com
patch subject: [PATCH RFC 1/5] mm/numa: move numa emulation APIs into generic files
config: sh-defconfig (https://download.01.org/0day-ci/archive/20231019/202310190319.9EvnrjP3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190319.9EvnrjP3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190319.9EvnrjP3-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   In file included from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14:
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
   mm/numa.c:257:19: warning: no previous prototype for 'numa_register_memblks' [-Wmissing-prototypes]
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
>> include/linux/kern_levels.h:5:25: warning: format '%Lu' expects argument of type 'long long unsigned int', but argument 2 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_WARNING'
     508 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   mm/numa.c:290:25: note: in expansion of macro 'pr_warn'
     290 |                         pr_warn("Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
         |                         ^~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%Lu' expects argument of type 'long long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:508:9: note: in expansion of macro 'printk'
     508 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:508:16: note: in expansion of macro 'KERN_WARNING'
     508 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   mm/numa.c:290:25: note: in expansion of macro 'pr_warn'
     290 |                         pr_warn("Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
         |                         ^~~~~~~
   mm/numa.c: At top level:
   mm/numa.c:16:21: error: storage size of 'numa_meminfo' isn't known
      16 | struct numa_meminfo numa_meminfo __initdata_or_meminfo;
         |                     ^~~~~~~~~~~~
   mm/numa.c:17:21: error: storage size of 'numa_reserved_meminfo' isn't known
      17 | struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
         |                     ^~~~~~~~~~~~~~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
