Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3E8189BA0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 22:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731535726; cv=none; b=YanZcTcFQ8DHhfiyEfOlAE4ZY3L8aZl4Wvifyfk0XHbXKJMJLDP/qHpBj0mpizGeRqEYy6Sfi/M88lvUGjnaawyMpiRbgvrREuoJCuWvtKzE1PtkiSiUL53pOut2SFW/a1+UmYVMKO6lYLigJ2itpcxR+4jQttlOsFsLJdkZSQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731535726; c=relaxed/simple;
	bh=lWGd6n1ZKmJBZTFsUmsTM2C/JoPZYpnk4u8oORl8Bkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZZlsVruvhiKxbda+7hqqE5zWWjXs5zRUx2sFLkPfoQ9vL6+98mA5YLkSo8NAzDjM8yCmjjCpThTDn8mFNHURfzMSp+XLz/n9keliixfcbOOVZMBpXcz+Y+AukbU1AREeMt+L/s6sH5NF/9tgiHZGkM4s/Kto5d06Z3appG6qSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M13zMkhn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M13zMkhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731535724; x=1763071724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lWGd6n1ZKmJBZTFsUmsTM2C/JoPZYpnk4u8oORl8Bkw=;
  b=M13zMkhncwtp0rbF6nKDCNLNbhDBxt1VsN2jZRc5X4dL/P2zE8c8/ja1
   mFaBnWUUN8KYaVKOALdfyV2pU23uwgkD1S1SMmFhM2t435NpCqZ/buwv7
   WdY0knVE4ddqdfyk4p+nf6pVsUiIWCYq77a8DNwOUhPrQ6LhyYrQzQ2O5
   5ibjofZkTHye6QGTj5UECeJ+NHo6hJzfN0qyFyGNCj0jQ2zIRu9ERth5A
   Q0xcgIL2Vz00rQEHBMs2yXv8VNaariJ0oErNoSVHq14Mj9ZQB1C2m4cHz
   OP+woBGfaFpDS4+s7abxq/fPOmO3y3dtQTgXu9AH/LGRr8Ldoo4YjrOSH
   Q==;
X-CSE-ConnectionGUID: jbrDygSoTT6bh9r7RE7vyQ==
X-CSE-MsgGUID: 7ydrxgBPQmCD4BoHcTNHoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42077981"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="42077981"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 14:08:43 -0800
X-CSE-ConnectionGUID: 7kZX/ofUTJGpa0QF7ZBtmw==
X-CSE-MsgGUID: D1J5GHk3Tniu30VhhB1N+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88397160"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2024 14:08:42 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBLXT-0000lh-1Q;
	Wed, 13 Nov 2024 22:08:39 +0000
Date: Thu, 14 Nov 2024 06:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2417/2417] kernel/sched/debug.c:600:12: error:
 no member named 'steal_h_nr_running' in 'struct cfs_rq'; did you mean
 'idle_h_nr_running'?
Message-ID: <202411140630.1uNaS6Yg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   53677a494016919c9c6715a90a425dc771e5ae26
commit: 1f9456c873b7bad5a2e394b692e85febe92244a3 [2417/2417] sched/debug: Add h_nr_running/steal_h_nr_running in sched_debug
config: x86_64-randconfig-015-20241112 (https://download.01.org/0day-ci/archive/20241114/202411140630.1uNaS6Yg-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140630.1uNaS6Yg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140630.1uNaS6Yg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/debug.c:9:
   In file included from kernel/sched/sched.h:39:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/genhd.h:20:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/bvec.h:14:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/debug.c:9:
   kernel/sched/sched.h:1864:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1864 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/debug.c:600:12: error: no member named 'steal_h_nr_running' in 'struct cfs_rq'; did you mean 'idle_h_nr_running'?
     600 |                         cfs_rq->steal_h_nr_running);
         |                                 ^~~~~~~~~~~~~~~~~~
         |                                 idle_h_nr_running
   kernel/sched/debug.c:18:17: note: expanded from macro 'SEQ_printf'
      18 |                 seq_printf(m, x);               \
         |                               ^
   kernel/sched/sched.h:632:16: note: 'idle_h_nr_running' declared here
     632 |         unsigned int            idle_h_nr_running; /* SCHED_IDLE */
         |                                 ^
>> kernel/sched/debug.c:600:12: error: no member named 'steal_h_nr_running' in 'struct cfs_rq'; did you mean 'idle_h_nr_running'?
     600 |                         cfs_rq->steal_h_nr_running);
         |                                 ^~~~~~~~~~~~~~~~~~
         |                                 idle_h_nr_running
   kernel/sched/debug.c:20:11: note: expanded from macro 'SEQ_printf'
      20 |                 pr_cont(x);                     \
         |                         ^
   include/linux/printk.h:434:26: note: expanded from macro 'pr_cont'
     434 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^
   kernel/sched/sched.h:632:16: note: 'idle_h_nr_running' declared here
     632 |         unsigned int            idle_h_nr_running; /* SCHED_IDLE */
         |                                 ^
   6 warnings and 2 errors generated.


vim +600 kernel/sched/debug.c

   554	
   555	void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
   556	{
   557		s64 MIN_vruntime = -1, min_vruntime, max_vruntime = -1,
   558			spread, rq0_min_vruntime, spread0;
   559		struct rq *rq = cpu_rq(cpu);
   560		struct sched_entity *last;
   561		unsigned long flags;
   562	
   563	#ifdef CONFIG_FAIR_GROUP_SCHED
   564		SEQ_printf(m, "\n");
   565		SEQ_printf_task_group_path(m, cfs_rq->tg, "cfs_rq[%d]:%s\n", cpu);
   566	#else
   567		SEQ_printf(m, "\n");
   568		SEQ_printf(m, "cfs_rq[%d]:\n", cpu);
   569	#endif
   570		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "exec_clock",
   571				SPLIT_NS(cfs_rq->exec_clock));
   572	
   573		raw_spin_rq_lock_irqsave(rq, flags);
   574		if (rb_first_cached(&cfs_rq->tasks_timeline))
   575			MIN_vruntime = (__pick_first_entity(cfs_rq))->vruntime;
   576		last = __pick_last_entity(cfs_rq);
   577		if (last)
   578			max_vruntime = last->vruntime;
   579		min_vruntime = cfs_rq->min_vruntime;
   580		rq0_min_vruntime = cpu_rq(0)->cfs.min_vruntime;
   581		raw_spin_rq_unlock_irqrestore(rq, flags);
   582		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "MIN_vruntime",
   583				SPLIT_NS(MIN_vruntime));
   584		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "min_vruntime",
   585				SPLIT_NS(min_vruntime));
   586		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "max_vruntime",
   587				SPLIT_NS(max_vruntime));
   588		spread = max_vruntime - MIN_vruntime;
   589		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "spread",
   590				SPLIT_NS(spread));
   591		spread0 = min_vruntime - rq0_min_vruntime;
   592		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "spread0",
   593				SPLIT_NS(spread0));
   594		SEQ_printf(m, "  .%-30s: %d\n", "nr_spread_over",
   595				cfs_rq->nr_spread_over);
   596		SEQ_printf(m, "  .%-30s: %d\n", "nr_running", cfs_rq->nr_running);
   597	#ifdef CONFIG_SCHED_STEAL
   598		SEQ_printf(m, "  .%-30s: %d\n", "h_nr_running", cfs_rq->h_nr_running);
   599		SEQ_printf(m, "  .%-30s: %ld\n", "steal_h_nr_running",
 > 600				cfs_rq->steal_h_nr_running);
   601	#endif
   602		SEQ_printf(m, "  .%-30s: %ld\n", "load", cfs_rq->load.weight);
   603	#ifdef CONFIG_SMP
   604		SEQ_printf(m, "  .%-30s: %lu\n", "load_avg",
   605				cfs_rq->avg.load_avg);
   606		SEQ_printf(m, "  .%-30s: %lu\n", "runnable_avg",
   607				cfs_rq->avg.runnable_avg);
   608		SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
   609				cfs_rq->avg.util_avg);
   610		SEQ_printf(m, "  .%-30s: %u\n", "util_est_enqueued",
   611				cfs_rq->avg.util_est.enqueued);
   612		SEQ_printf(m, "  .%-30s: %ld\n", "removed.load_avg",
   613				cfs_rq->removed.load_avg);
   614		SEQ_printf(m, "  .%-30s: %ld\n", "removed.util_avg",
   615				cfs_rq->removed.util_avg);
   616		SEQ_printf(m, "  .%-30s: %ld\n", "removed.runnable_avg",
   617				cfs_rq->removed.runnable_avg);
   618	#ifdef CONFIG_FAIR_GROUP_SCHED
   619		SEQ_printf(m, "  .%-30s: %lu\n", "tg_load_avg_contrib",
   620				cfs_rq->tg_load_avg_contrib);
   621		SEQ_printf(m, "  .%-30s: %ld\n", "tg_load_avg",
   622				atomic_long_read(&cfs_rq->tg->load_avg));
   623	#endif
   624	#endif
   625	#ifdef CONFIG_CFS_BANDWIDTH
   626		SEQ_printf(m, "  .%-30s: %d\n", "throttled",
   627				cfs_rq->throttled);
   628		SEQ_printf(m, "  .%-30s: %d\n", "throttle_count",
   629				cfs_rq->throttle_count);
   630	#endif
   631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
