Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0127635E1C3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207863; cv=none; b=U/ZUbx00YsBNY/4qv+TnEttCzs9hpukQ/W/1XZaP7hOurvfvN+Jj2EN4y3dtW0W1vdq24XbfTOXdz7xJvJeAs7t/LRnkNZ0AvD/72KApStKsszGRwGdZOfkBdHPG3xSP4gxSxeJLyJJBKTjqlbgBu0z9/TsnUh81eNIWRqk4FKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207863; c=relaxed/simple;
	bh=sgCY0uUTuc6pPR5LhlMngW+nlfQ0h5MIZ3tH6L1i8uI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZRNA3b/mlDhOexC9unHi8GzvDtNSNXKSDalvLoWYJV0rJyuJSWUdi0VULLJpAFdnVqUUDzd6n4qJXqU4OKHSzMCUwh1BA3PpS0m3Y/S1L7SMy8MfuHyR7HTtqtHeV49RuEQizkaX+BdtPjo2+wcRSD3CxV+5lihExZhQOpsI938=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQyFP45F; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQyFP45F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781207860; x=1812743860;
  h=date:from:to:cc:subject:message-id;
  bh=sgCY0uUTuc6pPR5LhlMngW+nlfQ0h5MIZ3tH6L1i8uI=;
  b=MQyFP45F693McwAqfos2Pgso1mHdID5gIlEp4UDM70xodIzUHkenZlHG
   pHbApZIU4a7mIMuRtyLEbBsYThzV3p4M8GYfDg2HDvJka2kGRd3jPK4Pw
   hGHUbI2AY/fY02wDkD0OlHVCLiBHJGr7uT8omGExhkb/EB6MfFsFLbdfZ
   XaIM63eei80rCFjp0JPPIiTMm+vspqL5tGYR9SXZ/gaBDB6IQ15+EJJh4
   k62qexcKEfazHZ4m1B/81YhsJIoTs4/6REumnvs41nqfeAZ0hbqYloMlR
   2ZXi1bbb3gLk5GTIZnQR5+DE688T0plye2FT+8aSXIxPeEtikcjQghdT6
   w==;
X-CSE-ConnectionGUID: 69BdPLBBTUyLwL5UVwTu0Q==
X-CSE-MsgGUID: cN5HUyrXT9ylQtTxcHkKSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93521930"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93521930"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:57:40 -0700
X-CSE-ConnectionGUID: bY9f/6ehQ1CPMMpEnUPa+g==
X-CSE-MsgGUID: z+PGKqSkRgeBf7QNLhVMrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="242462953"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jun 2026 12:57:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXlWx-00000000Nnl-1GTz;
	Thu, 11 Jun 2026 19:57:35 +0000
Date: Fri, 12 Jun 2026 03:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/topology.c:744:29: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202606120329.Fzd9e539-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 sched/smp: Make SMP unconditional
date:   12 months ago
config: x86_64-randconfig-123-20260610 (https://download.01.org/0day-ci/archive/20260612/202606120329.Fzd9e539-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120329.Fzd9e539-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cac5cefbade9 ("sched/smp: Make SMP unconditional")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120329.Fzd9e539-lkp@intel.com/

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
