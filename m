Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998D111A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708713284; cv=none; b=X0rJnX2Dt0mUiPDnqKIsngqq3MG4kOoVPMpmwx5HoWC0hzaWVTDibA9/Eu595wBuTeWRmBtF+XJWeHK1oTXK4agBmT+7J++aHMF+J4myZ30FZoDSXRq4mh+VmUCQ0VWu7zS7mJExzQdL7f2z77VyhkVFhXqrU2dtS/5AgWMtna8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708713284; c=relaxed/simple;
	bh=2vW+wqkTtSTygDvDdGHYydaRb0IsdHVOSEpipxfkzbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0w665pU9AsQdkAexIcHf734AT9XCPUnlnBFXF/zVzFl6OChgv9P0kqL0gHwvjT7kMYf3184VkVvEhnmswUgK2BcZYUv9ckXGPQgJRbK8J7TvOyzfPYgYfjnAoi1R8iyFsD94Nq3QzQOlowK4H/jY2SoEbhYL8iXCTdUDzKw20Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyOpk0lF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyOpk0lF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708713282; x=1740249282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2vW+wqkTtSTygDvDdGHYydaRb0IsdHVOSEpipxfkzbE=;
  b=QyOpk0lFXqCOj7CtwHts+RE/tMsHWQERJ4JW27dS1xP/BKtSSV4Hy5d5
   yS8Z6A+Y8aqY5ON3TtoOpwKl8WNINlbMMeep2pn5q9eGiQByrBOId6YOQ
   a9ZbNL2D2TIYeWbQGuasDcytxJN6KdwxCzBu6C1kIwu6FYOBz+dDWo4fc
   oXHm6Sfj8QJDKccbIgWeHurHrGQV1muYwlHLoe2153kQjuyhO9bYR1xWQ
   GZB0ExQJSYWU2gwDUoGeOD2bccGn5xrnfAaktpVU4Zt97zAflq89mHOq1
   2S9CbKl1Pzb6EMvynPVUZZOAc0BI8a7iAPVgnv18mp5zZUCIQQ6CZnPTP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="5991169"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5991169"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 10:34:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6466115"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Feb 2024 10:34:38 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdaNX-0007m8-0r;
	Fri, 23 Feb 2024 18:34:35 +0000
Date: Sat, 24 Feb 2024 02:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: mm/memcontrol.c:5301:5: warning: no previous prototype for function
 'mem_cgroupfs_meminfo_show'
Message-ID: <202402240234.AUBnmLzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: b80247552b030b427e8483f5f566b86d3b8d3ec1 cgroupfs: support for proc and sys
date:   2 years, 4 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240224/202402240234.AUBnmLzY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240234.AUBnmLzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240234.AUBnmLzY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memcontrol.c:3443:73: warning: variable 'pre_used' set but not used [-Wunused-but-set-variable]
    3443 |         unsigned long pages_used, pages_max, pages_reclaimed, goal_pages_used, pre_used;
         |                                                                                ^
   mm/memcontrol.c:3557:15: warning: no previous prototype for function 'mem_cgroup_pagecache_get_reclaim_pages' [-Wmissing-prototypes]
    3557 | unsigned long mem_cgroup_pagecache_get_reclaim_pages(struct mem_cgroup *memcg)
         |               ^
   mm/memcontrol.c:3557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3557 | unsigned long mem_cgroup_pagecache_get_reclaim_pages(struct mem_cgroup *memcg)
         | ^
         | static 
   mm/memcontrol.c:3580:21: warning: unused variable 'pre' [-Wunused-variable]
    3580 |         unsigned long max, pre, pages_max;
         |                            ^~~
   mm/memcontrol.c:3595:6: warning: unused variable 'err' [-Wunused-variable]
    3595 |         int err, ret = 0;
         |             ^~~
   mm/memcontrol.c:3601:30: warning: variable 'max' is uninitialized when used here [-Wuninitialized]
    3601 |         xchg(&memcg->pagecache.max, max);
         |                                     ^~~
   include/asm-generic/atomic-instrumented.h:1648:22: note: expanded from macro 'xchg'
    1648 |         arch_xchg(__ai_ptr, __VA_ARGS__);                               \
         |                             ^~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:45: note: expanded from macro 'arch_xchg'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                                   ^
   arch/x86/include/asm/cmpxchg.h:44:39: note: expanded from macro '__xchg_op'
      44 |                 __typeof__ (*(ptr)) __ret = (arg);                      \
         |                                              ^~~
   mm/memcontrol.c:3594:19: note: initialize the variable 'max' to silence this warning
    3594 |         unsigned long max, pages_reclaimed;
         |                          ^
         |                           = 0
>> mm/memcontrol.c:5301:5: warning: no previous prototype for function 'mem_cgroupfs_meminfo_show' [-Wmissing-prototypes]
    5301 | int mem_cgroupfs_meminfo_show(struct seq_file *m, void *v)
         |     ^
   mm/memcontrol.c:5301:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5301 | int mem_cgroupfs_meminfo_show(struct seq_file *m, void *v)
         | ^
         | static 
>> mm/memcontrol.c:5399:5: warning: no previous prototype for function 'mem_cgroupfs_vmstat_show' [-Wmissing-prototypes]
    5399 | int mem_cgroupfs_vmstat_show(struct seq_file *m, void *v)
         |     ^
   mm/memcontrol.c:5399:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5399 | int mem_cgroupfs_vmstat_show(struct seq_file *m, void *v)
         | ^
         | static 
   7 warnings generated.
--
>> block/blk-cgroup.c:826:5: warning: no previous prototype for function 'blkcg_cgroupfs_dkstats_show' [-Wmissing-prototypes]
     826 | int blkcg_cgroupfs_dkstats_show(struct seq_file *m, void *v)
         |     ^
   block/blk-cgroup.c:826:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     826 | int blkcg_cgroupfs_dkstats_show(struct seq_file *m, void *v)
         | ^
         | static 
   1 warning generated.
--
>> kernel/cgroup/cpuset.c:2697:5: warning: no previous prototype for function 'cpuset_cgroupfs_stat_show' [-Wmissing-prototypes]
    2697 | int cpuset_cgroupfs_stat_show(struct seq_file *m, void *v)
         |     ^
   kernel/cgroup/cpuset.c:2697:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2697 | int cpuset_cgroupfs_stat_show(struct seq_file *m, void *v)
         | ^
         | static 
>> kernel/cgroup/cpuset.c:2860:5: warning: no previous prototype for function 'cpuset_cgroups_cpu_allowed' [-Wmissing-prototypes]
    2860 | int cpuset_cgroups_cpu_allowed(struct task_struct *task, int cpu, int once)
         |     ^
   kernel/cgroup/cpuset.c:2860:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2860 | int cpuset_cgroups_cpu_allowed(struct task_struct *task, int cpu, int once)
         | ^
         | static 
>> kernel/cgroup/cpuset.c:2879:5: warning: no previous prototype for function 'cpuset_cgroupfs_cpuinfo_show' [-Wmissing-prototypes]
    2879 | int cpuset_cgroupfs_cpuinfo_show(struct seq_file *m, void *v)
         |     ^
   kernel/cgroup/cpuset.c:2879:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2879 | int cpuset_cgroupfs_cpuinfo_show(struct seq_file *m, void *v)
         | ^
         | static 
   kernel/cgroup/cpuset.c:4082:6: warning: no previous prototype for function 'cgroup_cpuset_calc_load' [-Wmissing-prototypes]
    4082 | void cgroup_cpuset_calc_load(void)
         |      ^
   kernel/cgroup/cpuset.c:4082:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4082 | void cgroup_cpuset_calc_load(void)
         | ^
         | static 
>> kernel/cgroup/cpuset.c:4184:5: warning: no previous prototype for function 'cpuset_cgroupfs_loadavg_show' [-Wmissing-prototypes]
    4184 | int cpuset_cgroupfs_loadavg_show(struct seq_file *m, void *v)
         |     ^
   kernel/cgroup/cpuset.c:4184:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4184 | int cpuset_cgroupfs_loadavg_show(struct seq_file *m, void *v)
         | ^
         | static 
   5 warnings generated.
--
   In file included from kernel/sched/cpuacct.c:8:
   kernel/sched/sched.h:1333:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1333 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/cpuacct.c:340:5: warning: no previous prototype for function 'cpuacct_cgroupfs_uptime_show' [-Wmissing-prototypes]
     340 | int cpuacct_cgroupfs_uptime_show(struct seq_file *m, void *v)
         |     ^
   kernel/sched/cpuacct.c:340:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     340 | int cpuacct_cgroupfs_uptime_show(struct seq_file *m, void *v)
         | ^
         | static 
   2 warnings generated.


vim +/mem_cgroupfs_meminfo_show +5301 mm/memcontrol.c

  5300	
> 5301	int mem_cgroupfs_meminfo_show(struct seq_file *m, void *v)
  5302	{
  5303		struct mem_cgroup *memcg = mem_cgroup_from_task(current);
  5304		return mem_cgroup_meminfo_read_comm(m, v, memcg);
  5305	}
  5306	
  5307	static int mem_cgroup_meminfo_read(struct seq_file *m, void *v)
  5308	{
  5309		struct mem_cgroup *memcg = mem_cgroup_from_css(seq_css(m));
  5310		return mem_cgroup_meminfo_read_comm(m, v, memcg);
  5311	}
  5312	
  5313	#define NR_VM_WRITEBACK_STAT_ITEMS	2
  5314	extern const char * const vmstat_text[];
  5315	extern unsigned int vmstat_text_size;
  5316	
  5317	static int mem_cgroup_vmstat_read_comm(struct seq_file *m, void *vv, struct mem_cgroup *memcg)
  5318	{
  5319		unsigned long *v1, *v;
  5320		int i, stat_items_size;
  5321		u64 mem_limit, mem_usage;
  5322	
  5323		mem_limit = memcg->memory.max;
  5324		if (mem_limit == PAGE_COUNTER_MAX)
  5325			mem_limit = totalram_pages() *PAGE_SIZE;
  5326		else
  5327			mem_limit = mem_limit * PAGE_SIZE;
  5328		mem_usage = (u64)mem_cgroup_usage(memcg, false) * PAGE_SIZE;
  5329	
  5330		stat_items_size = vmstat_text_size * sizeof(unsigned long);
  5331	
  5332	#ifdef CONFIG_VM_EVENT_COUNTERS
  5333		stat_items_size += sizeof(struct vm_event_state);
  5334	#endif
  5335	
  5336		v1 = v = kzalloc(stat_items_size, GFP_KERNEL);
  5337		if (!v)
  5338			return -ENOMEM;
  5339	
  5340		v[NR_FREE_PAGES] = (mem_limit - mem_usage) >> PAGE_SHIFT;
  5341		v[NR_ZONE_INACTIVE_ANON] = mem_cgroup_nr_lru_pages(memcg, BIT(LRU_INACTIVE_ANON));
  5342		v[NR_ZONE_ACTIVE_ANON] = mem_cgroup_nr_lru_pages(memcg, BIT(LRU_ACTIVE_ANON));
  5343		v[NR_ZONE_INACTIVE_FILE] = mem_cgroup_nr_lru_pages(memcg, BIT(LRU_INACTIVE_FILE));
  5344		v[NR_ZONE_ACTIVE_FILE] = mem_cgroup_nr_lru_pages(memcg, BIT(LRU_ACTIVE_FILE));
  5345		v[NR_ZONE_UNEVICTABLE] = mem_cgroup_nr_lru_pages(memcg, BIT(LRU_UNEVICTABLE));
  5346		v[NR_MLOCK] = 0;
  5347	#if 0
  5348		v[NR_ANON_PAGES] = v[NR_INACTIVE_ANON] + v[NR_ACTIVE_ANON];
  5349		v[NR_FILE_MAPPED] = memcg_page_state(memcg, memcg1_stats[4]);
  5350		v[NR_FILE_PAGES] = memcg_page_state(memcg, memcg1_stats[0]);
  5351		v[NR_FILE_DIRTY] = 0;
  5352		v[NR_WRITEBACK] = 0;
  5353		v[NR_SLAB_RECLAIMABLE] = 0;
  5354		v[NR_SLAB_UNRECLAIMABLE] = 0;
  5355		v[NR_PAGETABLE] = 0;
  5356		v[NR_KERNEL_STACK] = 0;
  5357		v[NR_UNSTABLE_NFS] = 0;
  5358	#endif
  5359	
  5360		v += NR_VM_ZONE_STAT_ITEMS;
  5361	#if IS_ENABLED(CONFIG_ZSMALLOC)
  5362		v += 1;
  5363	#endif
  5364		v += NR_VM_NUMA_STAT_ITEMS;
  5365		v += NR_VM_NODE_STAT_ITEMS;
  5366		v += NR_VM_WRITEBACK_STAT_ITEMS;
  5367	
  5368	#ifdef CONFIG_VM_EVENT_COUNTERS
  5369		//all_vm_events(v);
  5370		v[PGPGIN] = memcg_events_local(memcg, memcg1_events[0]) * (PAGE_SIZE / 1024);		/* sectors -> kbytes */
  5371		v[PGPGOUT] = memcg_events_local(memcg, memcg1_events[1]) * (PAGE_SIZE / 1024);
  5372	#endif
  5373		for ( i = 0; i < vmstat_text_size; i++ )
  5374		{
  5375			seq_printf(m, "%s %lu\n", vmstat_text[i], v1[i]);
  5376		}
  5377		kfree(v1);
  5378		return 0;
  5379	}
  5380	
  5381	static int mem_cgroup_sli_max_show(struct seq_file *m, void *v)
  5382	{
  5383		struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
  5384		struct cgroup *cgrp;
  5385		cgrp = memcg->css.cgroup;
  5386	
  5387		return sli_memlat_max_show(m, cgrp);
  5388	}
  5389	
  5390	static int mem_cgroup_sli_show(struct seq_file *m, void *v)
  5391	{
  5392		struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
  5393		struct cgroup *cgrp;
  5394		cgrp = memcg->css.cgroup;
  5395	
  5396		return sli_memlat_stat_show(m, cgrp);
  5397	}
  5398	
> 5399	int mem_cgroupfs_vmstat_show(struct seq_file *m, void *v)
  5400	{
  5401		struct mem_cgroup *memcg = mem_cgroup_from_task(current);
  5402		return mem_cgroup_vmstat_read_comm(m, v, memcg);
  5403	}
  5404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
