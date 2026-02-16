Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB701D95A3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239700; cv=none; b=VwVYRj0LcB314WzPOD7XP3CCMftLpyEMxYd6N+yF4ySNgf1vdOgwzSqFudcgo0n/NMZrgDxExtusKJCOzvX/ssgdUhnw2jr+BzTPdFrBVeVc6ySrjCo7MK8W4MG+ibcV5c1HxpFx9KLhXXC32iqOJoMcqZc/UBGTHfc3ys398PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239700; c=relaxed/simple;
	bh=+CAt25O2dbVUtvH/Z57qBNKMxX3Y+FeSpLDCG2QBiZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dhTnpuyPM+iOLdsPxva4/P4tpRSb4cikld2NLrBXgeKsFuiIb7geH3RKxBT+W6ROBM583Ss4oug/Irwy/dblnDeC3jZzKSkksuKLYecmdkxumqUfUxqTqgRS7Wz1IwqiVApXyYe7OSH97iq/Qv8gL5ID9ADA/OzDhougcHUTOrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4XsMGDh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4XsMGDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771239699; x=1802775699;
  h=date:from:to:cc:subject:message-id;
  bh=+CAt25O2dbVUtvH/Z57qBNKMxX3Y+FeSpLDCG2QBiZw=;
  b=e4XsMGDhV2Z1EsA2Uv1KBODzZEmskW7z6ssFfaJptQwcHROH/xnTPbIC
   +MAKUTKJy5SOjeyaUXtRiKsC7SrOGQg1fbCUDeWCCUxP/wzgWUINIhIr+
   7I+kP7sdE0sim/J+5OKbuOVjGn/pEUieRetUCEvtl65NZgr8mai6ZV+As
   XMhw1nMO5QwvWzQeVwuPt9L6gnUs0mIuYzHd5kLanOcPDoZHIFj+BOxZ/
   rPnzMREtFCBulT/iLaeq2+zSKxy9XZUmYmWZR9oYChoTnaoeXtsUZtqoK
   BozyIBxSCBjbg5zo5Yni5/zojfYz0vvtuu1zbOfk1GzOyqhXq7L8u712m
   g==;
X-CSE-ConnectionGUID: NmtszbQZQcOP6ROM+uwkIA==
X-CSE-MsgGUID: PdIUNoJzQFSuIsvQxf1BKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="97778862"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="97778862"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 03:01:38 -0800
X-CSE-ConnectionGUID: pltW4mZlRxihMro9moeJqA==
X-CSE-MsgGUID: wBKmhTgOQrivsdzB5h0CaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212568513"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Feb 2026 03:01:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrwMA-00000000zbo-0aH1;
	Mon, 16 Feb 2026 11:01:34 +0000
Date: Mon, 16 Feb 2026 19:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: kernel/sched/fair.c:1201:33: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202602161810.4BUc7i88-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: aa4f74dfd42ba4399f785fb9c460a11bd1756f0a sched: Fix runtime accounting w/ split exec & sched contexts
date:   7 months ago
config: i386-randconfig-063-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161810.4BUc7i88-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161810.4BUc7i88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161810.4BUc7i88-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1167:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1167:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1167:49: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/fair.c:1201:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1201:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1201:33: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:1259:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1259:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1259:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12744:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12744:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12744:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6920:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6920:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6920:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8302:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8302:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8302:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8506:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8506:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8506:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8648:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8648:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8648:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8680:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8680:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8680:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8900:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8900:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8900:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9917:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9917:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9917:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10545:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10545:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10545:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11990:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11990:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11990:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11640:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11640:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11640:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12105:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12105:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12105:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6637:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2462:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *

vim +1201 kernel/sched/fair.c

  1154	
  1155	static s64 update_se(struct rq *rq, struct sched_entity *se)
  1156	{
  1157		u64 now = rq_clock_task(rq);
  1158		s64 delta_exec;
  1159	
  1160		delta_exec = now - se->exec_start;
  1161		if (unlikely(delta_exec <= 0))
  1162			return delta_exec;
  1163	
  1164		se->exec_start = now;
  1165		if (entity_is_task(se)) {
  1166			struct task_struct *donor = task_of(se);
> 1167			struct task_struct *running = rq->curr;
  1168			/*
  1169			 * If se is a task, we account the time against the running
  1170			 * task, as w/ proxy-exec they may not be the same.
  1171			 */
  1172			running->se.exec_start = now;
  1173			running->se.sum_exec_runtime += delta_exec;
  1174	
  1175			trace_sched_stat_runtime(running, delta_exec);
  1176			account_group_exec_runtime(running, delta_exec);
  1177	
  1178			/* cgroup time is always accounted against the donor */
  1179			cgroup_account_cputime(donor, delta_exec);
  1180		} else {
  1181			/* If not task, account the time against donor se  */
  1182			se->sum_exec_runtime += delta_exec;
  1183		}
  1184	
  1185		if (schedstat_enabled()) {
  1186			struct sched_statistics *stats;
  1187	
  1188			stats = __schedstats_from_se(se);
  1189			__schedstat_set(stats->exec_max,
  1190					max(delta_exec, stats->exec_max));
  1191		}
  1192	
  1193		return delta_exec;
  1194	}
  1195	
  1196	/*
  1197	 * Used by other classes to account runtime.
  1198	 */
  1199	s64 update_curr_common(struct rq *rq)
  1200	{
> 1201		return update_se(rq, &rq->donor->se);
  1202	}
  1203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
