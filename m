Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960E423C506
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769269585; cv=none; b=gCgaKzQ8qGYwJBcFf+vHiR2MsVBkm2cpSL3/koW5Rcoi7cKvKB+JjEIo6KlJsJcNzFnGrF0/EMifQkPR06DT2mqaMi08osULUfEbj6wQxdonHxnHAMqie3bGCSo5Yt/QxHgHs7pXY23460P+k+hY+X2OCMyenh4+Wg2YvFsP6dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769269585; c=relaxed/simple;
	bh=OjDBUuQaNsKfnZ91iW9uGLOexwiIQioI2HJNQOf9uy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EhVqBfJT0YBTby5+Y67tbpBNLFWqJw7yaIsZnyTTbFD/PMUqnIjLlteWaDBJP8hFksJsFeEDxNzVBVe8oNK8lwmYgbwIzDb81BQo2C8N4y2E0wJv+gAjvmUjIrI2Hhtu6xww7C/RfGRUOllMqSzpoqJl64zALyc34goz5oynFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VES/ehsR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VES/ehsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769269581; x=1800805581;
  h=date:from:to:cc:subject:message-id;
  bh=OjDBUuQaNsKfnZ91iW9uGLOexwiIQioI2HJNQOf9uy4=;
  b=VES/ehsR/GOo2QYrO28fTc6OsNjop/Jpohd8i4HgRpDEiCdRHvuFYMSw
   HpEWMlod/5jyR21lQq1VGEWSHttSchvjBbb90MSN6eDOZU/k3EYB1IbkV
   Qzo7bMEXfrBp/qy9VL6RkZSAY6tI6GJezWXZA0CEwqTQBJa5GBWUafI1z
   k3eF7abz46JHjalpy9Nvw1xdL+D3+XK8lCTKdX2blx8/XVQSAgg34WNm3
   cxLr9awUlzVhX1elwXuObofKcY5Q5DUMNSsK30ZX2W5btr3TahyvtEfHr
   4IgMOLnDN/UYycD0enzLQMq2E8rWP8J3GGR882cF5kdpz+oHNN6Unr6Xt
   Q==;
X-CSE-ConnectionGUID: 1ALX+tA5Q6SKX0QoxVw0ww==
X-CSE-MsgGUID: TpwBah+gT7e1vsChuA3g2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="80801637"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="80801637"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 07:46:21 -0800
X-CSE-ConnectionGUID: VAxQ6lEkQ2mrwgFrTbaDmQ==
X-CSE-MsgGUID: 4g7U4SRkTKiXyaKWi6D1MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="211391621"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Jan 2026 07:46:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjfq4-00000000VHq-3pCk;
	Sat, 24 Jan 2026 15:46:16 +0000
Date: Sat, 24 Jan 2026 23:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 38/38] kernel/sched/fair.c:1295:38:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202601242324.p2giVoPt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   8be5679c6e850b7d501a6cf9edf1aa8305e6da28
commit: 8be5679c6e850b7d501a6cf9edf1aa8305e6da28 [38/38] sched/eevdf: Move to a single runqueue
config: um-randconfig-r133-20260124 (https://download.01.org/0day-ci/archive/20260124/202601242324.p2giVoPt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601242324.p2giVoPt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601242324.p2giVoPt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1202:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1202:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1202:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1236:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1236:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1236:33: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair.c:1295:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1295:38: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1295:38: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12813:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12813:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12813:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5977:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5977:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5977:22: sparse:    struct task_struct *
   kernel/sched/fair.c:8319:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8319:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8319:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8521:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8521:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8521:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8696:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8696:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8696:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8729:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8729:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8729:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8927:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8927:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8927:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9962:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9962:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9962:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10590:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10590:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10590:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12061:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12061:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12061:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11699:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11699:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11699:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12174:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12174:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12174:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2371:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2371:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2371:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1392:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1392:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1392:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1392:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1392:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1392:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1392:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1392:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1392:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1392:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1392:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1392:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1392:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2371:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2371:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2371:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2360:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2360:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2360:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2371:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2371:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2371:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2371:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2371:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2371:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2371:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2371:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2371:26: sparse:    struct task_struct *

vim +1295 kernel/sched/fair.c

  1189	
  1190	static s64 update_se(struct rq *rq, struct sched_entity *se)
  1191	{
  1192		u64 now = rq_clock_task(rq);
  1193		s64 delta_exec;
  1194	
  1195		delta_exec = now - se->exec_start;
  1196		if (unlikely(delta_exec <= 0))
  1197			return delta_exec;
  1198	
  1199		se->exec_start = now;
  1200		if (entity_is_task(se)) {
  1201			struct task_struct *donor = task_of(se);
> 1202			struct task_struct *running = rq->curr;
  1203			/*
  1204			 * If se is a task, we account the time against the running
  1205			 * task, as w/ proxy-exec they may not be the same.
  1206			 */
  1207			running->se.exec_start = now;
  1208			running->se.sum_exec_runtime += delta_exec;
  1209	
  1210			trace_sched_stat_runtime(running, delta_exec);
  1211			account_group_exec_runtime(running, delta_exec);
  1212	
  1213			/* cgroup time is always accounted against the donor */
  1214			cgroup_account_cputime(donor, delta_exec);
  1215		} else {
  1216			/* If not task, account the time against donor se  */
  1217			se->sum_exec_runtime += delta_exec;
  1218		}
  1219	
  1220		if (schedstat_enabled()) {
  1221			struct sched_statistics *stats;
  1222	
  1223			stats = __schedstats_from_se(se);
  1224			__schedstat_set(stats->exec_max,
  1225					max(delta_exec, stats->exec_max));
  1226		}
  1227	
  1228		return delta_exec;
  1229	}
  1230	
  1231	/*
  1232	 * Used by other classes to account runtime.
  1233	 */
  1234	s64 update_curr_common(struct rq *rq)
  1235	{
  1236		return update_se(rq, &rq->donor->se);
  1237	}
  1238	
  1239	/*
  1240	 * Update the current task's runtime statistics.
  1241	 */
  1242	static void update_curr(struct cfs_rq *cfs_rq)
  1243	{
  1244		/*
  1245		 * Note: cfs_rq->curr corresponds to the task picked to
  1246		 * run (ie: rq->donor.se) which due to proxy-exec may
  1247		 * not necessarily be the actual task running
  1248		 * (rq->curr.se). This is easy to confuse!
  1249		 */
  1250		struct sched_entity *curr = cfs_rq->h_curr;
  1251		struct rq *rq = rq_of(cfs_rq);
  1252		s64 delta_exec;
  1253		bool resched;
  1254	
  1255		if (unlikely(!curr))
  1256			return;
  1257	
  1258		delta_exec = update_se(rq, curr);
  1259		if (unlikely(delta_exec <= 0))
  1260			return;
  1261	
  1262		account_cfs_rq_runtime(cfs_rq, delta_exec);
  1263	
  1264		if (!entity_is_task(curr))
  1265			return;
  1266	
  1267		cfs_rq = &rq->cfs;
  1268	
  1269		curr->vruntime += calc_delta_fair(delta_exec, curr);
  1270		resched = update_deadline(cfs_rq, curr);
  1271	
  1272		/*
  1273		 * If the fair_server is active, we need to account for the
  1274		 * fair_server time whether or not the task is running on
  1275		 * behalf of fair_server or not:
  1276		 *  - If the task is running on behalf of fair_server, we need
  1277		 *    to limit its time based on the assigned runtime.
  1278		 *  - Fair task that runs outside of fair_server should account
  1279		 *    against fair_server such that it can account for this time
  1280		 *    and possibly avoid running this period.
  1281		 */
  1282		dl_server_update(&rq->fair_server, delta_exec);
  1283	
  1284		if (cfs_rq->h_nr_queued == 1)
  1285			return;
  1286	
  1287		if (resched || !protect_slice(curr)) {
  1288			resched_curr_lazy(rq);
  1289			clear_buddies(cfs_rq, curr);
  1290		}
  1291	}
  1292	
  1293	static void update_curr_fair(struct rq *rq)
  1294	{
> 1295		struct sched_entity *se = &rq->donor->se;
  1296	
  1297		for_each_sched_entity(se)
  1298			update_curr(cfs_rq_of(se));
  1299	}
  1300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
