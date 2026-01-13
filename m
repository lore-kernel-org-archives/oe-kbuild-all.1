Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E243310636
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298705; cv=none; b=tu00BWvapD6yrMRZWWHg/Of2MuI9Ja0MhoE4d93oNfTgYvDKUt+KZFoDMivhwply7LGu7COoD5LiipiB+PqxUP3OEGsq7heKyqWvwdQAYH3l6KWMGDE9NNdqb8nhMqlUto2EiWK364BXr8/157kM6ss8U5Q6DnB02tAopVMfPso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298705; c=relaxed/simple;
	bh=MZaAdT0ByGolM/uHJXx/QA8luVmt3N8t6whGHYqOpdM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BfSY+xMevLD4B/h9HkcSy7gnjVLfksMEBBC7SY6h6m5OQ17JSdru60MJeKNtFuejubedINBLVWhZ4A679wTwfDsxQJDzBkJR8IHlYOFW6KJf5d3aP3ZZiEO/Exk31e0Ao4lQ53hb2PsKcdRunhc3BcP+4luW/g53O8rYX43JllA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5Ftg87t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5Ftg87t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768298704; x=1799834704;
  h=date:from:to:cc:subject:message-id;
  bh=MZaAdT0ByGolM/uHJXx/QA8luVmt3N8t6whGHYqOpdM=;
  b=C5Ftg87tCV4zkAr8/GceyiuQ14kYP0FMpA80hH+cSF1VOEKgjrz/4SLi
   I5eR0WOfZvzcoGAfvYuo5pvIEtMoQIggOl5qHrZJQrf3WbwOiDr5vwYOO
   AjrMHVee92DDgyQ7SJdbBccxq/usQxSbyeL7XE4yxnmOIxT1d938SHcqZ
   6dRcVhg80WvHBsRVGqPYW1MVqXiMbIAyWQwyGBhz4BJJVG2oqi355CJJG
   o2+/I6YIAZkY4HTA3j91px02gru9l9VzKvLtjihqAIFpQRNkF9Hx8Pn9f
   RMzSizNLfESFcE1Dv5pH19eNAR4DJEtDXg1LCevVNR5ltiQWmI/2Vk1pO
   g==;
X-CSE-ConnectionGUID: j6c2MbNyTxiRVRdYsQd78g==
X-CSE-MsgGUID: 0QzHJWkhSRK2jl1IUkGTyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79876990"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="79876990"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:04:57 -0800
X-CSE-ConnectionGUID: Q6tC5LryRImT9CQpXVfnqg==
X-CSE-MsgGUID: n2qbCbH5RPWwizgW/Q2tTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204623370"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 02:04:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfbGb-00000000EZw-3MnK;
	Tue, 13 Jan 2026 10:04:49 +0000
Date: Tue, 13 Jan 2026 18:04:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/topology.c:744:29: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202601131712.6kt0EBmN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ingo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 sched/smp: Make SMP unconditional
date:   7 months ago
config: sparc64-randconfig-r112-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131712.6kt0EBmN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131712.6kt0EBmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131712.6kt0EBmN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/debug.c:632:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:632:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/debug.c:632:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/debug.c:964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:964:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:964:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/debug.c:964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:964:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:964:9: sparse:     got struct task_struct [noderef] __rcu *curr
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
>> kernel/sched/topology.c:744:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
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
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *

vim +744 kernel/sched/topology.c

f2cb13609d5397 Ingo Molnar    2017-02-01  710  
f2cb13609d5397 Ingo Molnar    2017-02-01  711  /*
f2cb13609d5397 Ingo Molnar    2017-02-01  712   * Attach the domain 'sd' to 'cpu' as its base domain. Callers must
f2cb13609d5397 Ingo Molnar    2017-02-01  713   * hold the hotplug lock.
f2cb13609d5397 Ingo Molnar    2017-02-01  714   */
f2cb13609d5397 Ingo Molnar    2017-02-01  715  static void
f2cb13609d5397 Ingo Molnar    2017-02-01  716  cpu_attach_domain(struct sched_domain *sd, struct root_domain *rd, int cpu)
f2cb13609d5397 Ingo Molnar    2017-02-01  717  {
f2cb13609d5397 Ingo Molnar    2017-02-01  718  	struct rq *rq = cpu_rq(cpu);
f2cb13609d5397 Ingo Molnar    2017-02-01  719  	struct sched_domain *tmp;
f2cb13609d5397 Ingo Molnar    2017-02-01  720  
f2cb13609d5397 Ingo Molnar    2017-02-01  721  	/* Remove the sched domains which do not contribute to scheduling. */
f2cb13609d5397 Ingo Molnar    2017-02-01  722  	for (tmp = sd; tmp; ) {
f2cb13609d5397 Ingo Molnar    2017-02-01  723  		struct sched_domain *parent = tmp->parent;
f2cb13609d5397 Ingo Molnar    2017-02-01  724  		if (!parent)
f2cb13609d5397 Ingo Molnar    2017-02-01  725  			break;
f2cb13609d5397 Ingo Molnar    2017-02-01  726  
f2cb13609d5397 Ingo Molnar    2017-02-01  727  		if (sd_parent_degenerate(tmp, parent)) {
f2cb13609d5397 Ingo Molnar    2017-02-01  728  			tmp->parent = parent->parent;
bf2dc42d6beb89 Tim C Chen     2023-05-04  729  
bf2dc42d6beb89 Tim C Chen     2023-05-04  730  			if (parent->parent) {
f2cb13609d5397 Ingo Molnar    2017-02-01  731  				parent->parent->child = tmp;
4efcc8bc7e08c0 Chen Yu        2023-07-13  732  				parent->parent->groups->flags = tmp->flags;
bf2dc42d6beb89 Tim C Chen     2023-05-04  733  			}
bf2dc42d6beb89 Tim C Chen     2023-05-04  734  
f2cb13609d5397 Ingo Molnar    2017-02-01  735  			/*
f2cb13609d5397 Ingo Molnar    2017-02-01  736  			 * Transfer SD_PREFER_SIBLING down in case of a
f2cb13609d5397 Ingo Molnar    2017-02-01  737  			 * degenerate parent; the spans match for this
f2cb13609d5397 Ingo Molnar    2017-02-01  738  			 * so the property transfers.
f2cb13609d5397 Ingo Molnar    2017-02-01  739  			 */
f2cb13609d5397 Ingo Molnar    2017-02-01  740  			if (parent->flags & SD_PREFER_SIBLING)
f2cb13609d5397 Ingo Molnar    2017-02-01  741  				tmp->flags |= SD_PREFER_SIBLING;
f2cb13609d5397 Ingo Molnar    2017-02-01  742  			destroy_sched_domain(parent);
f2cb13609d5397 Ingo Molnar    2017-02-01  743  		} else
f2cb13609d5397 Ingo Molnar    2017-02-01 @744  			tmp = tmp->parent;
f2cb13609d5397 Ingo Molnar    2017-02-01  745  	}
f2cb13609d5397 Ingo Molnar    2017-02-01  746  
f2cb13609d5397 Ingo Molnar    2017-02-01  747  	if (sd && sd_degenerate(sd)) {
f2cb13609d5397 Ingo Molnar    2017-02-01  748  		tmp = sd;
f2cb13609d5397 Ingo Molnar    2017-02-01  749  		sd = sd->parent;
f2cb13609d5397 Ingo Molnar    2017-02-01  750  		destroy_sched_domain(tmp);
16d364ba6ef2aa Ricardo Neri   2021-09-10  751  		if (sd) {
16d364ba6ef2aa Ricardo Neri   2021-09-10  752  			struct sched_group *sg = sd->groups;
16d364ba6ef2aa Ricardo Neri   2021-09-10  753  
16d364ba6ef2aa Ricardo Neri   2021-09-10  754  			/*
16d364ba6ef2aa Ricardo Neri   2021-09-10  755  			 * sched groups hold the flags of the child sched
16d364ba6ef2aa Ricardo Neri   2021-09-10  756  			 * domain for convenience. Clear such flags since
16d364ba6ef2aa Ricardo Neri   2021-09-10  757  			 * the child is being destroyed.
16d364ba6ef2aa Ricardo Neri   2021-09-10  758  			 */
16d364ba6ef2aa Ricardo Neri   2021-09-10  759  			do {
16d364ba6ef2aa Ricardo Neri   2021-09-10  760  				sg->flags = 0;
16d364ba6ef2aa Ricardo Neri   2021-09-10  761  			} while (sg != sd->groups);
16d364ba6ef2aa Ricardo Neri   2021-09-10  762  
f2cb13609d5397 Ingo Molnar    2017-02-01  763  			sd->child = NULL;
f2cb13609d5397 Ingo Molnar    2017-02-01  764  		}
16d364ba6ef2aa Ricardo Neri   2021-09-10  765  	}
f2cb13609d5397 Ingo Molnar    2017-02-01  766  
f2cb13609d5397 Ingo Molnar    2017-02-01  767  	sched_domain_debug(sd, cpu);
f2cb13609d5397 Ingo Molnar    2017-02-01  768  
f2cb13609d5397 Ingo Molnar    2017-02-01  769  	rq_attach_root(rq, rd);
f2cb13609d5397 Ingo Molnar    2017-02-01  770  	tmp = rq->sd;
f2cb13609d5397 Ingo Molnar    2017-02-01  771  	rcu_assign_pointer(rq->sd, sd);
bbdacdfed2f5fa Peter Zijlstra 2017-08-10  772  	dirty_sched_domain_sysctl(cpu);
f2cb13609d5397 Ingo Molnar    2017-02-01  773  	destroy_sched_domains(tmp);
f2cb13609d5397 Ingo Molnar    2017-02-01  774  
f2cb13609d5397 Ingo Molnar    2017-02-01  775  	update_top_cache_domain(cpu);
f2cb13609d5397 Ingo Molnar    2017-02-01  776  }
f2cb13609d5397 Ingo Molnar    2017-02-01  777  

:::::: The code at line 744 was first introduced by commit
:::::: f2cb13609d5397cdd747f3ed6fb651233851717d sched/topology: Split out scheduler topology code from core.c into topology.c

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
