Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE401DFD99
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 23:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733183484; cv=none; b=FJ7XnsDgAfnXpD3nNeJvJLE5tHAKUZkFhsgoOEu6F8rA5s6ppSWilh5EsCr5Xq7lkdnAgGRoCJ+gQq+o9f/VWKcsAuOVsvz7RvndX7K8fwIaORKRrGU/efJ7IJg3Pmx4Br4qUjErJmqdjNLC3vHU6+a/kB9RJp8kqUYv1DIyka8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733183484; c=relaxed/simple;
	bh=q1lhwoJwtXD+U/7J90kpNMqvEmgDaTU1RRg70Epp3kM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BTsNWNxVgvyKoMkcaHEg4Z6Vzflaycbb0z+hQ42a76nCnNvVNLOsq8tV/vKqF1Am6eTOMJNcqUICi0q1w4QcB6W28vK0VDc/9hwQNwr1qebxNdSeol0gBM3VQKfgZr/ZKUQ5GWKFUHlMp7BQ1eAxM6LL3naxNca54mgZeE3A/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0OKDsXG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0OKDsXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733183482; x=1764719482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1lhwoJwtXD+U/7J90kpNMqvEmgDaTU1RRg70Epp3kM=;
  b=A0OKDsXGTMpmFEFs4ErQVKidonvo32kWrmYjGCHEjuayDu1pm40yr6+C
   oMXNB5hemfrqwEKG8k/s/LnlNpUMRK0vYaM5IEo64z0/X2t1HZq0LP/qw
   RmBDnd8i0Fc/7Qf31MLWU/AIyaU/AfDETwfYbm5h4FCan6QX9oM642nTU
   474vamD+XD71jZVcaZdYkscvBdMYLRe2kUGLOloKw+/PlhWQrUUv+lTLI
   w+yqw/V/Sui07rRlGX19KwaH3z8h443DL+brHIRZEaH49jfLovtlU7xj6
   oCcSQw+Nu6foTFfVRPM+YUDVqePuE2vfBaGWBNAMP3oCkgQ5TSOS5kqee
   g==;
X-CSE-ConnectionGUID: G8Uj9Y6UQ1uIKlp7L7M3ug==
X-CSE-MsgGUID: tmoxQFogS3uHCboiVPMI7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37313895"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="37313895"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 15:51:19 -0800
X-CSE-ConnectionGUID: 64/7J9igS62EeVgOMbUcpA==
X-CSE-MsgGUID: LOPlHdqITQWvWW/+tx5JkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="97325708"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 15:51:18 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIGCC-00031v-0N;
	Mon, 02 Dec 2024 23:51:16 +0000
Date: Tue, 3 Dec 2024 07:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Song Zhang <zhangsong34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1455/1455] kernel/sched/fair.c:3612:36: error: no
 member named 'cfs_offline_tasks' in 'struct rq'
Message-ID: <202412030733.746Ood8y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9809e40d1abbcdf278f3db91f03a94507bdbb442
commit: 89bf80a4d6d5ba852b9042480e0be23c2c4a628c [1455/1455] sched: Introduce priority load balance for qos scheduler
config: x86_64-randconfig-005-20241112 (https://download.01.org/0day-ci/archive/20241203/202412030733.746Ood8y-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030733.746Ood8y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030733.746Ood8y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:25:
   In file included from include/linux/hugetlb_inline.h:7:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/sched/fair.c:3612:36: error: no member named 'cfs_offline_tasks' in 'struct rq'
    3612 |                 (*list_op)(&se->group_node, &rq->cfs_offline_tasks);
         |                                              ~~  ^
>> kernel/sched/fair.c:3614:36: error: no member named 'cfs_tasks' in 'struct rq'
    3614 |                 (*list_op)(&se->group_node, &rq->cfs_tasks);
         |                                              ~~  ^
   kernel/sched/fair.c:8678:9: error: call to undeclared function 'sched_idle_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    8678 |                      !sched_idle_cpu(smp_processor_id()) &&
         |                       ^
   kernel/sched/fair.c:8678:9: note: did you mean 'sched_idle_rq'?
   kernel/sched/fair.c:6707:12: note: 'sched_idle_rq' declared here
    6707 | static int sched_idle_rq(struct rq *rq)
         |            ^
   kernel/sched/fair.c:8681:23: error: no member named 'online' in 'struct rq'
    8681 |                 if (!rq_of(cfs_rq)->online)
         |                      ~~~~~~~~~~~~~  ^
   kernel/sched/fair.c:8960:7: error: no member named 'idle_stamp' in 'struct rq'; did you mean 'idle_state'?
    8960 |                 rq->idle_stamp = 0;
         |                     ^~~~~~~~~~
         |                     idle_state
   kernel/sched/sched.h:1146:24: note: 'idle_state' declared here
    1146 |         struct cpuidle_state    *idle_state;
         |                                  ^
   1 warning and 5 errors generated.


vim +3612 kernel/sched/fair.c

  3602	
  3603	#ifdef CONFIG_QOS_SCHED_PRIO_LB
  3604	static void
  3605	adjust_rq_cfs_tasks(void (*list_op)(struct list_head *, struct list_head *),
  3606		struct rq *rq,
  3607		struct sched_entity *se)
  3608	{
  3609		struct task_group *tg = task_group(task_of(se));
  3610	
  3611		if (sysctl_sched_prio_load_balance_enabled && tg->qos_level == -1)
> 3612			(*list_op)(&se->group_node, &rq->cfs_offline_tasks);
  3613		else
> 3614			(*list_op)(&se->group_node, &rq->cfs_tasks);
  3615	}
  3616	#endif
  3617	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
