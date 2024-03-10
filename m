Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE4E3A1DC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 23:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710112998; cv=none; b=QYTqV+gxtwHbFdJaAdl21l64am+7aeIDpr/M/m8jwKv3No7mZnbLQX4zc5zcQD2bpWSJV134RqAjiHJ1LZwdXLkH7FdZDCFKmY6lIT/mWtk5r1z9NW/pTJ8ZQlIH4pWhw9zT8GiXIm7o89CJ2sI+Cs/XAvFBxBZGrd+X9mC/+P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710112998; c=relaxed/simple;
	bh=n2lhfIniZgSseydw62D50APnszGboOEbLjsI5KjNaWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/wkTJc1m8S2/PKWJprbmNcvZh5P0OZ9d9HJLQavkMfeQA11oU7Mbeo63vi4vJZO60758vF334YKCAmtRB7dk0l7YgWGMpMMf7v0siIDo75YHRBW4iE1FZh6cKg/iWkv2TabK1e01V9Wwy6wE5MwnFonC9KEwICl8yyRyVGS7aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSSUhBy9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSSUhBy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710112995; x=1741648995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n2lhfIniZgSseydw62D50APnszGboOEbLjsI5KjNaWw=;
  b=TSSUhBy90E4lcl1DgOw5sH6u2ILwjCjSGkJOoVRCQyZKokkhwrDjCCIU
   Fle0pTUK8gmno/ZN0LoFbe1IjGxiht0QQTYW7iekZRz/xeXu4VlCWke+W
   MtLIFnNG8IRg9LJM+PiGFSnRAbokCSZG6pIaY3Qq4Be37s66f7c+GtXKW
   xggjOWDV3f9ty6QBmLJypT+E2RRdbxzgYCUDdM5rvdxZRsggZO6Bww66E
   L2bVs/MGVMrQ3huOhcikD6WBj5xctHEBvBw5q/XxrUY0qmZMyBZFxYQ43
   cmU6ZwlY/ASceqhYIAGCUm7Cv0s/hWWlGlm5a0BnKZMMv8aP9xPkI8C3X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8516163"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="8516163"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 16:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="10894099"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Mar 2024 16:23:13 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjSVb-0008hd-0c;
	Sun, 10 Mar 2024 23:23:11 +0000
Date: Mon, 11 Mar 2024 07:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 84/29558] mm/memcontrol.c:98:30:
 warning: 'event_lock' defined but not used
Message-ID: <202403110741.klpUMGS4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: 890617e4e8b335564cdfae4a50909ef420bed9b7 [84/29558] mm/memcontrol: Replace local_irq_disable with local locks
config: arc-randconfig-001-20240303 (https://download.01.org/0day-ci/archive/20240311/202403110741.klpUMGS4-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110741.klpUMGS4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110741.klpUMGS4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arc/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/linux/page_counter.h:5,
                    from mm/memcontrol.c:34:
   mm/memcontrol.c: In function 'invalidate_reclaim_iterators':
   arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not used [-Wunused-value]
      95 | #define cmpxchg(ptr, o, n) ((typeof(*(ptr)))__cmpxchg((ptr), \
         |                            ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      96 |                                 (unsigned long)(o), (unsigned long)(n)))
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:1050:33: note: in expansion of macro 'cmpxchg'
    1050 |                                 cmpxchg(&iter->position,
         |                                 ^~~~~~~
   In file included from include/linux/page_counter.h:6:
   mm/memcontrol.c: In function 'mem_cgroup_get_max':
   include/linux/kernel.h:878:45: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     878 | #define min(x, y)       __careful_cmp(x, y, <)
         |                                             ^
   include/linux/kernel.h:861:30: note: in definition of macro '__cmp'
     861 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                              ^~
   include/linux/kernel.h:878:25: note: in expansion of macro '__careful_cmp'
     878 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   mm/memcontrol.c:1370:28: note: in expansion of macro 'min'
    1370 |                 swap_max = min(swap_max, (unsigned long)total_swap_pages);
         |                            ^~~
   In file included from include/linux/swap.h:15,
                    from include/linux/shmem_fs.h:6,
                    from mm/memcontrol.c:39:
   mm/memcontrol.c: At top level:
>> mm/memcontrol.c:98:30: warning: 'event_lock' defined but not used [-Wunused-const-variable=]
      98 | static DEFINE_LOCAL_IRQ_LOCK(event_lock);
         |                              ^~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~
   In file included from mm/memcontrol.c:35:
   In function 'mem_cgroup_nodeinfo',
       inlined from 'invalidate_reclaim_iterators' at mm/memcontrol.c:1047:9,
       inlined from 'mem_cgroup_css_released' at mm/memcontrol.c:4586:2:
   include/linux/memcontrol.h:357:31: warning: array subscript nid is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     357 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_css_released':
   include/linux/memcontrol.h:314:37: note: while referencing 'nodeinfo'
     314 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In file included from arch/arc/include/asm/atomic.h:15:
   In function 'memcg_alloc_shrinker_maps',
       inlined from 'mem_cgroup_css_online' at mm/memcontrol.c:4545:6:
   mm/memcontrol.c:394:51: warning: array subscript nid is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     394 |                 rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_map, map);
         |                                    ~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:280:29: note: in definition of macro 'WRITE_ONCE'
     280 |         __write_once_size(&(x), __u.__c, sizeof(x));    \
         |                             ^
   include/asm-generic/barrier.h:157:33: note: in expansion of macro '__smp_store_release'
     157 | #define smp_store_release(p, v) __smp_store_release(p, v)
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:412:17: note: in expansion of macro 'smp_store_release'
     412 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
         |                 ^~~~~~~~~~~~~~~~~
   mm/memcontrol.c:394:17: note: in expansion of macro 'rcu_assign_pointer'
     394 |                 rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_map, map);
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_css_online':
   include/linux/memcontrol.h:314:37: note: while referencing 'nodeinfo'
     314 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from 'memcg_free_shrinker_maps' at mm/memcontrol.c:369:8,
       inlined from 'memcg_free_shrinker_maps' at mm/memcontrol.c:359:13,
       inlined from 'memcg_alloc_shrinker_maps' at mm/memcontrol.c:390:4,
       inlined from 'mem_cgroup_css_online' at mm/memcontrol.c:4545:6:
   include/linux/memcontrol.h:357:31: warning: array subscript nid is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     357 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_css_online':
   include/linux/memcontrol.h:314:37: note: while referencing 'nodeinfo'
     314 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from 'memcg_hotplug_cpu_dead' at mm/memcontrol.c:2091:10:
   include/linux/memcontrol.h:357:31: warning: array subscript nid is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     357 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'memcg_hotplug_cpu_dead':
   include/linux/memcontrol.h:314:37: note: while referencing 'nodeinfo'
     314 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from 'mem_cgroup_lruvec' at include/linux/memcontrol.h:380:7,
       inlined from 'mem_cgroup_node_nr_lru_pages' at mm/memcontrol.c:727:26,
       inlined from 'mem_cgroup_nr_lru_pages' at mm/memcontrol.c:748:9,
       inlined from 'accumulate_memcg_tree' at mm/memcontrol.c:2986:5:
   include/linux/memcontrol.h:357:31: warning: array subscript <unknown> is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     357 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'accumulate_memcg_tree':
   include/linux/memcontrol.h:314:37: note: while referencing 'nodeinfo'
     314 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from 'memcg_stat_show' at mm/memcontrol.c:3461:9:
   include/linux/memcontrol.h:357:31: warning: array subscript <unknown> is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     357 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'memcg_stat_show':
   include/linux/memcontrol.h:314:37: note: while referencing 'nodeinfo'
     314 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from 'mem_cgroup_lruvec' at include/linux/memcontrol.h:380:7,
       inlined from 'mem_cgroup_node_nr_lru_pages' at mm/memcontrol.c:727:26,
       inlined from 'mem_cgroup_nr_lru_pages' at mm/memcontrol.c:748:9,
       inlined from 'memcg_stat_show' at mm/memcontrol.c:3416:7:
   include/linux/memcontrol.h:357:31: warning: array subscript <unknown> is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     357 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'memcg_stat_show':
   include/linux/memcontrol.h:314:37: note: while referencing 'nodeinfo'
     314 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from 'memcg_free_shrinker_maps' at mm/memcontrol.c:369:8,
       inlined from 'memcg_free_shrinker_maps' at mm/memcontrol.c:359:13,
       inlined from 'mem_cgroup_css_free' at mm/memcontrol.c:4602:2:
   include/linux/memcontrol.h:357:31: warning: array subscript nid is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     357 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_css_free':


vim +/event_lock +98 mm/memcontrol.c

    97	
  > 98	static DEFINE_LOCAL_IRQ_LOCK(event_lock);
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
