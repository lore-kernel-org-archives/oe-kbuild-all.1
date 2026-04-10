Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0946B38F658
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838963; cv=none; b=SnWLnaF3w1pFk+JtglKxn3i9dNITT25/QQwsECRA0GToAEf4yQXvRBQ07cK5cuhZPxS8CZcpdLxwx7IIovNi11IfxGiG4TNXmUjHqc9rDOuzv9aGsrVj/yAehfnAqMRvKJFyMtQW9mRLH5vgiMaTyvPxNlYMxNBlLbUCRtl9WKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838963; c=relaxed/simple;
	bh=zNPJG+cbq6mfEZmnmIuJXMMhf6dNc4K7Q/bxmJwRukI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SEbDvLDHFC1WygVpWR0J2qD2z4GbEmNCzQZtX62mZU3FP2m190ttF4DV5gBDS3AD6wJRl83He8EctlUCCFvP0R/JBARyYz0XDHDRAovc8oKaJP3rST9alvgi1qV51WXLjWXcoiwgsh0jrIS3kD8PtdLZFBBxykCMGI2U8mLrUng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBsrUllI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBsrUllI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775838962; x=1807374962;
  h=date:from:to:cc:subject:message-id;
  bh=zNPJG+cbq6mfEZmnmIuJXMMhf6dNc4K7Q/bxmJwRukI=;
  b=hBsrUllIRm6t1xfC0CXFM9BPGnfkXThDUVfSIZsEtkNJm/FG9QGSAJpW
   sTTNKBls2qzLE6LYXbuW3I+dn9xniKhqqHfl3/quaEGhit6G6BuUhaee8
   0T8ig1paBnsjJgfawb38Un7Nc+88hNBN1Z+so1oVwVtD/88cEIsiG/bHu
   42twgwQGAm/ZvSY0ddx08729xUaaaqB0GTaxcTja5ISjQTv7U2OoU0RKS
   JLAMFRoMja1K8pLpfuEOoho619xLmvWs+Fe1R6oMrkgxbQhYqcJyOjHuu
   Yky8Xr9uHIN6DXCqsuCjSPZdHsXSgwC1vb58uk0fzujv57Yjs7NoOdqPW
   Q==;
X-CSE-ConnectionGUID: oH9+PzPIRvSEjfxkmuWDrQ==
X-CSE-MsgGUID: VxFzilZNStCvB0wJWOoXhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="102320087"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="102320087"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:36:01 -0700
X-CSE-ConnectionGUID: Vf9xMPCmSECT2IQllivJwA==
X-CSE-MsgGUID: U+6hWcb0ROuOd1y4hb0vPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="226399821"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2026 09:35:59 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBEpp-000000003zF-29mv;
	Fri, 10 Apr 2026 16:35:57 +0000
Date: Sat, 11 Apr 2026 00:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Chen Yu <yu.c.chen@intel.com>,
 Tim Chen <tim.c.chen@linux.intel.com>
Subject: [peterz-queue:sched/cache 19/35]
 kernel/sched/fair.c:1551:51: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202604110049.kk5gTLLJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/cache
head:   067a3135814334a8ea7241faef364cc48c6340bc
commit: df0d98475954d655571979aa061ecb07d7e00392 [19/35] sched/cache: Introduce infrastructure for cache-aware load balancing
config: csky-randconfig-r112-20260410 (https://download.01.org/0day-ci/archive/20260411/202604110049.kk5gTLLJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110049.kk5gTLLJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110049.kk5gTLLJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1338:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1338:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1338:49: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/fair.c:1551:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu * @@
   kernel/sched/fair.c:1551:51: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:1551:51: sparse:     got struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:1636:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1636:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1636:33: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:1692:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1692:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1692:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:13457:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13457:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13457:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8888:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8888:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8888:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9083:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9083:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:9083:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9281:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9281:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:9281:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9314:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9314:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:9314:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9563:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9563:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:9563:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:10578:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10578:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10578:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:11211:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:11211:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:11211:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12682:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12682:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12682:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12320:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12320:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:12320:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12818:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12818:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12818:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7218:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:1402:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1402:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1402:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1402:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1402:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1402:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1402:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1402:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1402:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1402:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1402:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1402:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1402:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1402:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1402:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2702:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2702:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2702:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2391:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2391:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2391:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2380:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2380:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2380:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2391:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2391:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2391:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2391:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2391:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2391:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2391:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2391:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2391:26: sparse:    struct task_struct *

vim +1551 kernel/sched/fair.c

  1524	
  1525	static void task_cache_work(struct callback_head *work)
  1526	{
  1527		struct task_struct *p = current;
  1528		struct mm_struct *mm = p->mm;
  1529		unsigned long m_a_occ = 0;
  1530		unsigned long curr_m_a_occ = 0;
  1531		int cpu, m_a_cpu = -1;
  1532		cpumask_var_t cpus;
  1533	
  1534		WARN_ON_ONCE(work != &p->cache_work);
  1535	
  1536		work->next = work;
  1537	
  1538		if (p->flags & PF_EXITING)
  1539			return;
  1540	
  1541		if (!zalloc_cpumask_var(&cpus, GFP_KERNEL))
  1542			return;
  1543	
  1544		scoped_guard (cpus_read_lock) {
  1545			guard(rcu)();
  1546	
  1547			cpumask_copy(cpus, cpu_online_mask);
  1548	
  1549			for_each_cpu(cpu, cpus) {
  1550				/* XXX sched_cluster_active */
> 1551				struct sched_domain *sd = per_cpu(sd_llc, cpu);
  1552				unsigned long occ, m_occ = 0, a_occ = 0;
  1553				int m_cpu = -1, i;
  1554	
  1555				if (!sd)
  1556					continue;
  1557	
  1558				for_each_cpu(i, sched_domain_span(sd)) {
  1559					occ = fraction_mm_sched(cpu_rq(i),
  1560								per_cpu_ptr(mm->sc_stat.pcpu_sched, i));
  1561					a_occ += occ;
  1562					if (occ > m_occ) {
  1563						m_occ = occ;
  1564						m_cpu = i;
  1565					}
  1566				}
  1567	
  1568				/*
  1569				 * Compare the accumulated occupancy of each LLC. The
  1570				 * reason for using accumulated occupancy rather than average
  1571				 * per CPU occupancy is that it works better in asymmetric LLC
  1572				 * scenarios.
  1573				 * For example, if there are 2 threads in a 4CPU LLC and 3
  1574				 * threads in an 8CPU LLC, it might be better to choose the one
  1575				 * with 3 threads. However, this would not be the case if the
  1576				 * occupancy is divided by the number of CPUs in an LLC (i.e.,
  1577				 * if average per CPU occupancy is used).
  1578				 * Besides, NUMA balancing fault statistics behave similarly:
  1579				 * the total number of faults per node is compared rather than
  1580				 * the average number of faults per CPU. This strategy is also
  1581				 * followed here.
  1582				 */
  1583				if (a_occ > m_a_occ) {
  1584					m_a_occ = a_occ;
  1585					m_a_cpu = m_cpu;
  1586				}
  1587	
  1588				if (llc_id(cpu) == llc_id(mm->sc_stat.cpu))
  1589					curr_m_a_occ = a_occ;
  1590	
  1591				cpumask_andnot(cpus, cpus, sched_domain_span(sd));
  1592			}
  1593		}
  1594	
  1595		if (m_a_occ > (2 * curr_m_a_occ)) {
  1596			/*
  1597			 * Avoid switching sc_stat.cpu too fast.
  1598			 * The reason to choose 2X is because:
  1599			 * 1. It is better to keep the preferred LLC stable,
  1600			 *    rather than changing it frequently and cause migrations
  1601			 * 2. 2X means the new preferred LLC has at least 1 more
  1602			 *    busy CPU than the old one(200% vs 100%, eg)
  1603			 * 3. 2X is chosen based on test results, as it delivers
  1604			 *    the optimal performance gain so far.
  1605			 */
  1606			mm->sc_stat.cpu = m_a_cpu;
  1607		}
  1608	
  1609		free_cpumask_var(cpus);
  1610	}
  1611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
