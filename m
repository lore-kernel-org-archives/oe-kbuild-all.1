Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DA243172
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731507882; cv=none; b=hb6yFXyOYFtCI9bwq4Og7pO64GUjUOsAzErNweXo8IoCp5Yzba/bI6s35xm8KjuQr530/1vDlg6DX6y1hH/luT7MmD387MNC7ZarlBvDvzNk5MawIXpsHsbiHf2X01I2IYlGhPq3gatgUIdXV0oGU9T3J4WzXu8Lh/8OIOqbL5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731507882; c=relaxed/simple;
	bh=ws7Ey+lJkmVFdE1AlrpzTJv+jGOv0M/DhiGA1wiru90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r1WkMAaWvPhiTK6Dx83rOgbYqj5eDr7MP/GtcySr698nxxKGHuNrUfB1c4TGj1EBNV23XHunsTc1kAPahtvjfgTom9WWzgDDhaJCQOGlqRiJagLY9kPlqWliwq1OHdLZdTQ4Wm6waP1aMavbnLBwS98WRBjxDVlc4TiXdQ9pzdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EB2l4uwe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EB2l4uwe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731507880; x=1763043880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ws7Ey+lJkmVFdE1AlrpzTJv+jGOv0M/DhiGA1wiru90=;
  b=EB2l4uwe99hibMEtTvoiDMGmAwMqQ2nSg34Xw4ggqG9hKHqG8GxQBrdL
   VkrbpjQxagLj7cDJ+rwfWkXdSXhYHxsGdb3Ougp4G78RZEjQ9n9fysgfo
   si+sq9PbSANV56qyc0vexDP1SMvK9AK8eBLbu1SasIK4Jc76DZX+QqbWC
   0T8MCY+wxbTPYHyB25WumJkQewvTIwKpCY1ksdUv6zPYnea1mB/n2+isb
   8KAkVijm6z1pN6aOMMhEyX8mRxoXYN/+4ZZ7m3MqLQs/5EP9nOiNLdpjN
   Q3OR7XEAVWWGnRHW5UIZ7mUi+qRhZD2jmWKGHcCPzw3MvldEGFcpEr/Jq
   Q==;
X-CSE-ConnectionGUID: wkVxeJJlRumdKPXzxaMVMg==
X-CSE-MsgGUID: 4lo/+9n/TLO5dkvZGeqkxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31512120"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="31512120"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 06:24:39 -0800
X-CSE-ConnectionGUID: 17wKxF5oTAWI0jU5vmlpIQ==
X-CSE-MsgGUID: wgwkm5TWRmaGqymWIJx7lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="87786355"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Nov 2024 06:24:38 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBEIN-0000SL-3D;
	Wed, 13 Nov 2024 14:24:35 +0000
Date: Wed, 13 Nov 2024 22:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangchangzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1290/1290]
 kernel/sched/grid/qos.c:84:31: error: 'struct mempolicy' has no member named
 'v'
Message-ID: <202411132206.ErjpyMwe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a81d020c58c2c6a55ebaf15846470a9ecb69bd1a
commit: ce35ded5d5774f055f6850b15032066ff4936414 [1290/1290] sched: smart grid: init sched_grid_qos structure on QOS purpose
config: arm64-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241113/202411132206.ErjpyMwe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411132206.ErjpyMwe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411132206.ErjpyMwe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/grid/qos.c:19:
   kernel/sched/grid/qos.c: In function 'sched_grid_preferred_interleave_nid':
>> kernel/sched/grid/qos.c:84:31: error: 'struct mempolicy' has no member named 'v'
      84 |         if (nodes_equal(policy->v.nodes, *preferred_nmask))
         |                               ^~
   include/linux/nodemask.h:202:41: note: in definition of macro 'nodes_equal'
     202 |                         __nodes_equal(&(src1), &(src2), MAX_NUMNODES)
         |                                         ^~~~
   kernel/sched/grid/qos.c:91:32: error: 'struct mempolicy' has no member named 'v'
      91 |         nodes_and(nmask, policy->v.nodes, *preferred_nmask);
         |                                ^~
   include/linux/nodemask.h:162:47: note: in definition of macro 'nodes_and'
     162 |                         __nodes_and(&(dst), &(src1), &(src2), MAX_NUMNODES)
         |                                               ^~~~
>> kernel/sched/grid/qos.c:95:31: error: 'struct task_struct' has no member named 'il_prev'
      95 |         next = next_node_in(me->il_prev, nmask);
         |                               ^~
   include/linux/nodemask.h:278:46: note: in definition of macro 'next_node_in'
     278 | #define next_node_in(n, src) __next_node_in((n), &(src))
         |                                              ^
   kernel/sched/grid/qos.c:97:19: error: 'struct task_struct' has no member named 'il_prev'
      97 |                 me->il_prev = next;
         |                   ^~
   In file included from kernel/sched/grid/qos.c:20:
   include/linux/mempolicy.h: At top level:
   include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~


vim +84 kernel/sched/grid/qos.c

  > 19	#include <linux/nodemask.h>
    20	#include <linux/mempolicy.h>
    21	#include <linux/slab.h>
    22	#include <linux/sched.h>
    23	#include <linux/sched/grid_qos.h>
    24	#include "internal.h"
    25	
    26	static int qos_affinity_set(struct task_struct *p)
    27	{
    28		int n;
    29		struct sched_grid_qos_affinity *affinity = &p->grid_qos->affinity;
    30	
    31		nodes_clear(affinity->mem_preferred_node_mask);
    32		/*
    33		 * We want the memory allocation to be as close to the CPU
    34		 * as possible, and adjust after getting memory bandwidth usage.
    35		 */
    36		for (n = 0; n < nr_node_ids; n++)
    37			if (cpumask_intersects(cpumask_of_node(n), p->prefer_cpus))
    38				node_set(n, affinity->mem_preferred_node_mask);
    39	
    40		return 0;
    41	}
    42	
    43	int sched_grid_qos_fork(struct task_struct *p, struct task_struct *orig)
    44	{
    45		struct sched_grid_qos *qos;
    46	
    47		qos = kzalloc(sizeof(*qos), GFP_KERNEL);
    48		if (!qos)
    49			return -ENOMEM;
    50	
    51		qos_power_init(&qos->power);
    52		qos_stat_init(&qos->stat);
    53	
    54		nodes_clear(qos->affinity.mem_preferred_node_mask);
    55		if (likely(orig->grid_qos))
    56			qos->affinity = orig->grid_qos->affinity;
    57		qos->affinity_set = qos_affinity_set;
    58		p->grid_qos = qos;
    59	
    60		return 0;
    61	}
    62	
    63	void sched_grid_qos_free(struct task_struct *p)
    64	{
    65		kfree(p->grid_qos);
    66		p->grid_qos = NULL;
    67	}
    68	
    69	/* dynamic select a more appropriate preferred interleave nid for process */
    70	int sched_grid_preferred_interleave_nid(struct mempolicy *policy)
    71	{
    72		nodemask_t nmask;
    73		unsigned int next;
    74		struct task_struct *me = current;
    75		nodemask_t *preferred_nmask = NULL;
    76	
    77		if (likely(me->grid_qos))
    78			preferred_nmask =
    79				&me->grid_qos->affinity.mem_preferred_node_mask;
    80	
    81		if (!preferred_nmask || !policy)
    82			return NUMA_NO_NODE;
    83	
  > 84		if (nodes_equal(policy->v.nodes, *preferred_nmask))
    85			return NUMA_NO_NODE;
    86		/*
    87		 * We perceive the actual consumption of memory bandwidth
    88		 * in each node and post a preferred interleave nid in
    89		 * more appropriate range.
    90		 */
  > 91		nodes_and(nmask, policy->v.nodes, *preferred_nmask);
    92		if (nodes_empty(nmask))
    93			return NUMA_NO_NODE;
    94	
  > 95		next = next_node_in(me->il_prev, nmask);
    96		if (next < MAX_NUMNODES)
    97			me->il_prev = next;
    98		return next;
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
