Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A897C15B97D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732529080; cv=none; b=rnL0VEzldWg9uXx05/LdlPxI8aNK0XQ91LWuA4uXl1gvzJYer+slff0hzoU5gBmzh10W6pxdosEmkNxop4u/iW9BjaI9M4iT1rfYC6seaCTujOF0uZn59gZqldjx0Pqe6RGKBoxjtQ+MMM32nUDziws/iUDqO1ZPZLhMwGIdUfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732529080; c=relaxed/simple;
	bh=kMoaI9CWzvG5z64ILUob16iOUvXzbJbbssgKSN1QV90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GtPKil3Gqlh2N5i/9bCuVtH6ENxtRjHp2H3WHwG87Vh6vhqgXQkSV9cbgLCNOE9vVgnyxoAhCraD5cn2IZR4aUFLXu29cjVFnfztCVYre1hc0HV1zTZlWlVabGa2yejlvUcsAaKauX0Np/ROXkVcH8X3bqc53lDAr6wXkJFSilA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3VGihcQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3VGihcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732529078; x=1764065078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kMoaI9CWzvG5z64ILUob16iOUvXzbJbbssgKSN1QV90=;
  b=U3VGihcQp7zrlMdVDeXWOS1I5v5bqyxYXSjF3L/OzAicMNEdiYYJM+0w
   B9wCGbueAsRL4lKUVXyJiGQvBH56SGFqObrKSKtgaQ60UaRN1XIbZTI5G
   J+5xPDY2t2u4uJpzcMRdrDP+RHtk8x7kA5dlhYJJJsLF1dWjb05wx4Qrf
   uSmQVIv57ejdoeAsc0jSmWFr4c0a1tNiKnFCzZj5HQhaxdBix9lv4sNsE
   NMjFPVZH+/5TTNg57jhCmZ8a/NqRduE6VbiAGT1wOu61J3S+fjZIQdcJ4
   kD8jvn6w54PTfmvzK0p1jCkyjLOpsZievswB0CcqXtS8OEOsC65luT6u6
   Q==;
X-CSE-ConnectionGUID: RHbJUHUfQXC7RDY3O4cEcA==
X-CSE-MsgGUID: g06nN+ZkSbGieCrWWIYt1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32680489"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="32680489"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 02:04:38 -0800
X-CSE-ConnectionGUID: PrHYcqqhQmysVP1NXndTBw==
X-CSE-MsgGUID: 1YK6DtqeTPiyB4VWqoQmZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91654614"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Nov 2024 02:04:36 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFVxJ-00068F-21;
	Mon, 25 Nov 2024 10:04:33 +0000
Date: Mon, 25 Nov 2024 18:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangchangzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1290/1290]
 kernel/sched/grid/qos.c:84:31: error: 'struct mempolicy' has no member named
 'v'
Message-ID: <202411251710.OUFik4Mp-lkp@intel.com>
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
head:   48fd60600c1344806a27e3bb33ab33ec5a9fea7c
commit: ce35ded5d5774f055f6850b15032066ff4936414 [1290/1290] sched: smart grid: init sched_grid_qos structure on QOS purpose
config: arm64-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241125/202411251710.OUFik4Mp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251710.OUFik4Mp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251710.OUFik4Mp-lkp@intel.com/

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
