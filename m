Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67428246327
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 12:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739017256; cv=none; b=KfDcD0zRwknQ9O0cO4LBQWy3L+hXOONicZmt8ivo2J8HntrlLdp29TzIKizox42rQ0B1OKqU4+z5dXyHE3IRS6u62VSY6Qj+TeGEkXRWB5AbloNQ2eVfUK4t7xh1iETda07B0Vw6QlUaqIkNjpwW8lcGe9hvXqI2fJ/Oy3l5uyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739017256; c=relaxed/simple;
	bh=FTdvkkRV0Rd4CzhdJShk62qVVYX45nrSZsw4czQg5KM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HgFLsV6oEy+dYU1AC0E8vEoc63uOwhQfNfXU1cw929Jm+9usFce3DOy2ILgPFiQfTzlE1BP/LP4jR4CnrRglQViOnK70EbsOVY4PnomEWs4Ru5SVD13Ylxwzc8HaDHmuHrVWwscXCvQk80CqqT/gEq+3Ui3TPB9BlE/dxFAADFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJLSOikg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJLSOikg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739017254; x=1770553254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FTdvkkRV0Rd4CzhdJShk62qVVYX45nrSZsw4czQg5KM=;
  b=QJLSOikgIl3tV4U+HAKcW98Nm1ihO3XrSY7hgf4zTU3P6zubfdYhLn2W
   mTP6hc1AKOHL5seHuL8htK3cIFix3+IWd/mCErNFKys69kx1seevVcogY
   dYtQ0/QvBt2cXdDYSVolEWChNZjn4m3cF0EM+ICzMrRt5LEGU9Kzj+o2k
   waoWYOE7YesV4AFycvHXZIg9j5078nfGJeyuecq5xLCHK0cMmJnp8JKhe
   NBOOFVEZNAFrY6dSrOe+W4WeocTTPUlR8+hzenZnNAlK3QwxEHWC+Q0dO
   pf7b2OyRDZ08vcEyXAxZU0ELa/MKiW3mGIbFdTrOGo/w138P6R/L7r6zy
   g==;
X-CSE-ConnectionGUID: Hq0rBvzBRj2Obtg4sgEQHw==
X-CSE-MsgGUID: LVaO8j6dRX2PZmiIvuZsmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50289938"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="50289938"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 04:20:52 -0800
X-CSE-ConnectionGUID: SdZzRJ4MTwe72mgbPTr9lQ==
X-CSE-MsgGUID: HeF3119pTj6rnRCX9PVLOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112200072"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2025 04:20:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgjpI-000zww-0G;
	Sat, 08 Feb 2025 12:20:48 +0000
Date: Sat, 8 Feb 2025 20:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1418/1418] mm/memcontrol.c:432:54:
 warning: array subscript nid is outside array bounds of 'struct
 mem_cgroup_per_node *[0]'
Message-ID: <202502082031.V2tZWUQg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: fae91d6d8be5e20c47e459dbeb3d43bd5f9486f4 [1418/1418] mm/list_lru.c: set bit in memcg shrinker bitmap on first list_lru item appearance
config: arm64-randconfig-002-20250207 (https://download.01.org/0day-ci/archive/20250208/202502082031.V2tZWUQg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082031.V2tZWUQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082031.V2tZWUQg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/page_counter.h:6,
                    from mm/memcontrol.c:34:
   mm/memcontrol.c: In function 'mem_cgroup_get_max':
   include/linux/kernel.h:845:45: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     845 | #define min(x, y)       __careful_cmp(x, y, <)
         |                                             ^
   include/linux/kernel.h:828:30: note: in definition of macro '__cmp'
     828 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                              ^~
   include/linux/kernel.h:845:25: note: in expansion of macro '__careful_cmp'
     845 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   mm/memcontrol.c:1365:28: note: in expansion of macro 'min'
    1365 |                 swap_max = min(swap_max, (unsigned long)total_swap_pages);
         |                            ^~~
   In file included from mm/memcontrol.c:35:
   In function 'mem_cgroup_nodeinfo',
       inlined from 'invalidate_reclaim_iterators' at mm/memcontrol.c:1042:9,
       inlined from 'mem_cgroup_css_released' at mm/memcontrol.c:4526:2:
   include/linux/memcontrol.h:352:31: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     352 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_css_released':
   include/linux/memcontrol.h:309:37: note: while referencing 'nodeinfo'
     309 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'free_mem_cgroup_per_node_info',
       inlined from '__mem_cgroup_free' at mm/memcontrol.c:4353:3:
   mm/memcontrol.c:4339:57: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
    4339 |         struct mem_cgroup_per_node *pn = memcg->nodeinfo[node];
         |                                          ~~~~~~~~~~~~~~~^~~~~~
   include/linux/memcontrol.h: In function '__mem_cgroup_free':
   include/linux/memcontrol.h:309:37: note: while referencing 'nodeinfo'
     309 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'alloc_mem_cgroup_per_node_info',
       inlined from 'mem_cgroup_alloc' at mm/memcontrol.c:4388:7:
   mm/memcontrol.c:4333:24: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
    4333 |         memcg->nodeinfo[node] = pn;
         |         ~~~~~~~~~~~~~~~^~~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_alloc':
   include/linux/memcontrol.h:309:37: note: while referencing 'nodeinfo'
     309 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In file included from include/linux/compiler.h:245,
                    from arch/arm64/include/asm/atomic.h:23,
                    from include/linux/atomic.h:7,
                    from include/linux/page_counter.h:5:
   In function 'memcg_alloc_shrinker_maps',
       inlined from 'mem_cgroup_css_online' at mm/memcontrol.c:4485:6:
   mm/memcontrol.c:391:51: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     391 |                 rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_map, map);
         |                                    ~~~~~~~~~~~~~~~^~~~~
   arch/arm64/include/asm/barrier.h:95:42: note: in definition of macro '__smp_store_release'
      95 |                                 : "=Q" (*p)                             \
         |                                          ^
   include/linux/rcupdate.h:411:17: note: in expansion of macro 'smp_store_release'
     411 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
         |                 ^~~~~~~~~~~~~~~~~
   mm/memcontrol.c:391:17: note: in expansion of macro 'rcu_assign_pointer'
     391 |                 rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_map, map);
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_css_online':
   include/linux/memcontrol.h:309:37: note: while referencing 'nodeinfo'
     309 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   mm/memcontrol.c: In function 'memcg_set_shrinker_bit':
>> mm/memcontrol.c:432:54: warning: array subscript nid is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     432 |                 map = rcu_dereference(memcg->nodeinfo[nid]->shrinker_map);
         |                                       ~~~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:252:36: note: in definition of macro '__READ_ONCE'
     252 |                 __read_once_size(&(x), __u.__c, sizeof(x));             \
         |                                    ^
   include/linux/rcupdate.h:349:55: note: in expansion of macro 'READ_ONCE'
     349 |         typeof(*p) *________p1 = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                       ^~~~~~~~~
   include/linux/rcupdate.h:486:9: note: in expansion of macro '__rcu_dereference_check'
     486 |         __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:544:28: note: in expansion of macro 'rcu_dereference_check'
     544 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:432:23: note: in expansion of macro 'rcu_dereference'
     432 |                 map = rcu_dereference(memcg->nodeinfo[nid]->shrinker_map);
         |                       ^~~~~~~~~~~~~~~
   include/linux/memcontrol.h:309:37: note: while referencing 'nodeinfo'
     309 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from 'mem_cgroup_lruvec' at include/linux/memcontrol.h:375:7,
       inlined from 'mem_cgroup_node_nr_lru_pages' at mm/memcontrol.c:722:26:
   include/linux/memcontrol.h:352:31: warning: array subscript <unknown> is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     352 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_node_nr_lru_pages':
   include/linux/memcontrol.h:309:37: note: while referencing 'nodeinfo'
     309 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   In function 'mem_cgroup_nodeinfo',
       inlined from 'mem_cgroup_iter' at mm/memcontrol.c:937:8:
   include/linux/memcontrol.h:352:31: warning: array subscript <unknown> is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     352 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h: In function 'mem_cgroup_iter':
   include/linux/memcontrol.h:309:37: note: while referencing 'nodeinfo'
     309 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   mm/memcontrol.c: In function '__mem_cgroup_threshold':
   mm/memcontrol.c:3473:45: warning: array subscript i is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    3473 |         for (; i >= 0 && unlikely(t->entries[i].threshold > usage); i--)
         |                                   ~~~~~~~~~~^~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/memcontrol.h:162:37: note: while referencing 'entries'
     162 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c:3474:42: warning: array subscript i is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    3474 |                 eventfd_signal(t->entries[i].eventfd, 1);
         |                                ~~~~~~~~~~^~~
   include/linux/memcontrol.h:162:37: note: while referencing 'entries'
     162 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c:3485:50: warning: array subscript i is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    3485 |         for (; i < t->size && unlikely(t->entries[i].threshold <= usage); i++)
         |                                        ~~~~~~~~~~^~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/memcontrol.h:162:37: note: while referencing 'entries'
     162 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c:3486:42: warning: array subscript i is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    3486 |                 eventfd_signal(t->entries[i].eventfd, 1);
         |                                ~~~~~~~~~~^~~
   include/linux/memcontrol.h:162:37: note: while referencing 'entries'
     162 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c: In function 'memcg_check_events.isra':
   mm/memcontrol.c:502:31: warning: array subscript 0 is outside array bounds of 'struct mem_cgroup_per_node *[0]' [-Warray-bounds=]
     502 |         return memcg->nodeinfo[nid];
         |                ~~~~~~~~~~~~~~~^~~~~
   include/linux/memcontrol.h:309:37: note: while referencing 'nodeinfo'
     309 |         struct mem_cgroup_per_node *nodeinfo[0];
         |                                     ^~~~~~~~
   mm/memcontrol.c: In function '__mem_cgroup_usage_unregister_event':
   mm/memcontrol.c:3680:49: warning: array subscript i is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    3680 |                 if (thresholds->primary->entries[i].eventfd == eventfd)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/memcontrol.h:162:37: note: while referencing 'entries'
     162 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c:3683:63: warning: array subscript i is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    3683 |                 new->entries[j] = thresholds->primary->entries[i];
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/memcontrol.h:162:37: note: while referencing 'entries'
     162 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c:3683:29: warning: array subscript j is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    3683 |                 new->entries[j] = thresholds->primary->entries[i];
         |                 ~~~~~~~~~~~~^~~
   include/linux/memcontrol.h:162:37: note: while referencing 'entries'
     162 |         struct mem_cgroup_threshold entries[0];
         |                                     ^~~~~~~
   mm/memcontrol.c:3684:33: warning: array subscript j is outside array bounds of 'struct mem_cgroup_threshold[0]' [-Warray-bounds=]
    3684 |                 if (new->entries[j].threshold <= usage) {
         |                     ~~~~~~~~~~~~^~~
   include/linux/memcontrol.h:162:37: note: while referencing 'entries'


vim +432 mm/memcontrol.c

   373	
   374	static int memcg_alloc_shrinker_maps(struct mem_cgroup *memcg)
   375	{
   376		struct memcg_shrinker_map *map;
   377		int nid, size, ret = 0;
   378	
   379		if (mem_cgroup_is_root(memcg))
   380			return 0;
   381	
   382		mutex_lock(&memcg_shrinker_map_mutex);
   383		size = memcg_shrinker_map_size;
   384		for_each_node(nid) {
   385			map = kvzalloc(sizeof(*map) + size, GFP_KERNEL);
   386			if (!map) {
   387				memcg_free_shrinker_maps(memcg);
   388				ret = -ENOMEM;
   389				break;
   390			}
 > 391			rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_map, map);
   392		}
   393		mutex_unlock(&memcg_shrinker_map_mutex);
   394	
   395		return ret;
   396	}
   397	
   398	int memcg_expand_shrinker_maps(int new_id)
   399	{
   400		int size, old_size, ret = 0;
   401		struct mem_cgroup *memcg;
   402	
   403		size = DIV_ROUND_UP(new_id + 1, BITS_PER_LONG) * sizeof(unsigned long);
   404		old_size = memcg_shrinker_map_size;
   405		if (size <= old_size)
   406			return 0;
   407	
   408		mutex_lock(&memcg_shrinker_map_mutex);
   409		if (!root_mem_cgroup)
   410			goto unlock;
   411	
   412		for_each_mem_cgroup(memcg) {
   413			if (mem_cgroup_is_root(memcg))
   414				continue;
   415			ret = memcg_expand_one_shrinker_map(memcg, size, old_size);
   416			if (ret)
   417				goto unlock;
   418		}
   419	unlock:
   420		if (!ret)
   421			memcg_shrinker_map_size = size;
   422		mutex_unlock(&memcg_shrinker_map_mutex);
   423		return ret;
   424	}
   425	
   426	void memcg_set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
   427	{
   428		if (shrinker_id >= 0 && memcg && !mem_cgroup_is_root(memcg)) {
   429			struct memcg_shrinker_map *map;
   430	
   431			rcu_read_lock();
 > 432			map = rcu_dereference(memcg->nodeinfo[nid]->shrinker_map);
   433			set_bit(shrinker_id, map->map);
   434			rcu_read_unlock();
   435		}
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
