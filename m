Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D10A20298D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765458065; cv=none; b=JiQxwjwgEP0VCTgRTLGCePaaYaafDRCj4UMxwFBT0NWHYRAO3tB/GgPGoc8qX0X+rN1Ms74qdemSzGcclNr7GB6RBd6kMD1kF7MRMKpCxi6wwvTCYLnfpTZ1JfGLK5cxuPahug4gSX/6eiZWF7fcHnLVZcfTTB66NDzCholdBUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765458065; c=relaxed/simple;
	bh=211EtAkCTGn8YHBYmlVRukNXj9eI2Zmco8CEy04R3QU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QIU4AkHeNW6/WhMdrUm09dkYGdRNuQEz1ezPc1b8qTLrPc+9URVsfhKFoHMlfDB9mMyYdeIPt8Re08GdGf6VcYfihob+BwcYFDSZCWf07FmrqipJm7RxyPEANZlJAG1HIMVruhH55L2xNukT0PaOUqWBsVFn4EZ4nBffDaMs/cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzS3MUT1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzS3MUT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765458063; x=1796994063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=211EtAkCTGn8YHBYmlVRukNXj9eI2Zmco8CEy04R3QU=;
  b=GzS3MUT1stlKzYKkdzgZ451E5R7hgw4MVK7hY5oVkPmgoWhR62YoJjH6
   3xXrxxR7ucbzJSWwwbZU77iVavYjVm76/R1WHskpolY87mRCpxJG+uzvE
   iz3FOmkSJbAYM8JxEzw2Ls3408e6wRwYedAw5SrI+OJmehXR2GwNAnPEm
   qXrX/Xk+I87GbS19Rwxy3QjJrLBPcx6k3vnGfrRDFBcvIMWHOl/BmflX8
   KdCS1493ws3a4Rz/LtUPuOFbN/D3XVZvNZ6lpo+KExYmYj5vTaTQFQszb
   xyehQzHfgc0vbYty7xPzUi9qcR//HWyT0vpmFSGLF45KSJPD630jjaROq
   w==;
X-CSE-ConnectionGUID: S6TU+f+JRWmX+BXPs6114w==
X-CSE-MsgGUID: p5yG/cQZSx+JwVUPrtNg/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78549466"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="78549466"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:01:02 -0800
X-CSE-ConnectionGUID: euuSb3CSTUGdDmEZ/0+Ydg==
X-CSE-MsgGUID: 1OU7uXu0QH2dCet4Hh8exg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="227853289"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2025 05:01:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTgHy-000000004fe-48dq;
	Thu, 11 Dec 2025 13:00:58 +0000
Date: Thu, 11 Dec 2025 21:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/stats.c:136:17: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202512112047.qgtNTiEN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 9d9af2372f2a46242fd5e827973235f40f31a706 sched/smp: Use the SMP version of schedstats
date:   6 months ago
config: arm-randconfig-r111-20251211 (https://download.01.org/0day-ci/archive/20251211/202512112047.qgtNTiEN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112047.qgtNTiEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112047.qgtNTiEN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/debug.c:626:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:626:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/debug.c:626:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/debug.c:954:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:954:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:954:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/debug.c:954:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:954:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:954:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/stats.c:136:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/stats.c:136:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/stats.c:136:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/topology.c:115:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:115:56: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:115:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:134:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:134:60: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:134:60: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:157:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:157:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:157:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:468:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:468:19: sparse:     expected struct perf_domain *pd
   kernel/sched/topology.c:468:19: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:638:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:638:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:638:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:723:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:723:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:723:50: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:731:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:731:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:731:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:744:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:744:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:744:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:749:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:749:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:749:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:770:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:770:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:770:13: sparse:     got struct sched_domain [noderef] __rcu *sd
   kernel/sched/topology.c:932:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:932:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:932:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:961:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:961:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:961:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1007:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1007:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1007:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1009:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1009:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1009:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1017:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1017:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1017:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1019:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1019:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1019:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1089:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1089:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1089:62: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1193:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1193:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1193:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1677:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1677:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1677:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:2372:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2372:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2372:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2491:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2491:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2491:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2512:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:2512:56: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:2512:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:2511:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2511:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2511:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2566:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2566:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2566:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2235:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:25: sparse:    struct task_struct *

vim +136 kernel/sched/stats.c

029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  108  
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  109  static int show_schedstat(struct seq_file *seq, void *v)
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  110  {
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  111  	int cpu;
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  112  
cb152ff2671796 kernel/sched/stats.c Nathan Zimmer   2013-02-21  113  	if (v == (void *)1) {
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  114  		seq_printf(seq, "version %d\n", SCHEDSTAT_VERSION);
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  115  		seq_printf(seq, "timestamp %lu\n", jiffies);
cb152ff2671796 kernel/sched/stats.c Nathan Zimmer   2013-02-21  116  	} else {
cb152ff2671796 kernel/sched/stats.c Nathan Zimmer   2013-02-21  117  		struct rq *rq;
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  118  		struct sched_domain *sd;
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  119  		int dcount = 0;
cb152ff2671796 kernel/sched/stats.c Nathan Zimmer   2013-02-21  120  		cpu = (unsigned long)(v - 2);
cb152ff2671796 kernel/sched/stats.c Nathan Zimmer   2013-02-21  121  		rq = cpu_rq(cpu);
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  122  
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  123  		/* runqueue-specific stats */
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  124  		seq_printf(seq,
30fd049afcfed5 kernel/sched/stats.c Rakib Mullick   2012-01-24  125  		    "cpu%d %u 0 %u %u %u %u %llu %llu %lu",
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  126  		    cpu, rq->yld_count,
30fd049afcfed5 kernel/sched/stats.c Rakib Mullick   2012-01-24  127  		    rq->sched_count, rq->sched_goidle,
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  128  		    rq->ttwu_count, rq->ttwu_local,
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  129  		    rq->rq_cpu_time,
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  130  		    rq->rq_sched_info.run_delay, rq->rq_sched_info.pcount);
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  131  
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  132  		seq_printf(seq, "\n");
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  133  
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  134  		/* domain-specific stats */
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  135  		rcu_read_lock();
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25 @136  		for_each_domain(cpu, sd) {
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  137  			enum cpu_idle_type itype;
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  138  
011b3a14dc66c4 kernel/sched/stats.c K Prateek Nayak 2024-12-20  139  			seq_printf(seq, "domain%d %s %*pb", dcount++, sd->name,
333470ee46b685 kernel/sched/stats.c Tejun Heo       2015-02-13  140  				   cpumask_pr_args(sched_domain_span(sd)));
02a61f325a8e62 kernel/sched/stats.c Shrikanth Hegde 2024-03-08  141  			for (itype = 0; itype < CPU_MAX_IDLE_TYPES; itype++) {
3b2a793ea70fd1 kernel/sched/stats.c Swapnil Sapkal  2024-12-20  142  				seq_printf(seq, " %u %u %u %u %u %u %u %u %u %u %u",
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  143  				    sd->lb_count[itype],
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  144  				    sd->lb_balanced[itype],
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  145  				    sd->lb_failed[itype],
3b2a793ea70fd1 kernel/sched/stats.c Swapnil Sapkal  2024-12-20  146  				    sd->lb_imbalance_load[itype],
3b2a793ea70fd1 kernel/sched/stats.c Swapnil Sapkal  2024-12-20  147  				    sd->lb_imbalance_util[itype],
3b2a793ea70fd1 kernel/sched/stats.c Swapnil Sapkal  2024-12-20  148  				    sd->lb_imbalance_task[itype],
3b2a793ea70fd1 kernel/sched/stats.c Swapnil Sapkal  2024-12-20  149  				    sd->lb_imbalance_misfit[itype],
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  150  				    sd->lb_gained[itype],
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  151  				    sd->lb_hot_gained[itype],
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  152  				    sd->lb_nobusyq[itype],
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  153  				    sd->lb_nobusyg[itype]);
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  154  			}
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  155  			seq_printf(seq,
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  156  				   " %u %u %u %u %u %u %u %u %u %u %u %u\n",
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  157  			    sd->alb_count, sd->alb_failed, sd->alb_pushed,
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  158  			    sd->sbe_count, sd->sbe_balanced, sd->sbe_pushed,
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  159  			    sd->sbf_count, sd->sbf_balanced, sd->sbf_pushed,
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  160  			    sd->ttwu_wake_remote, sd->ttwu_move_affine,
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  161  			    sd->ttwu_move_balance);
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  162  		}
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  163  		rcu_read_unlock();
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  164  	}
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  165  	return 0;
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  166  }
029632fbb7b7c9 kernel/sched_stats.c Peter Zijlstra  2011-10-25  167  

:::::: The code at line 136 was first introduced by commit
:::::: 029632fbb7b7c9d85063cc9eb470de6c54873df3 sched: Make separate sched*.c translation units

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
