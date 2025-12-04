Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D7532C931
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 22:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764886549; cv=none; b=dEn0QhC0sggiqVvqT9xPmCARGFYtIhqtjOW7YvG+hfb07B9Gm2A/HeaIM8dWbRlJiTSy323nX9N9jaIpTMG0JXlwyvrK2FNDPmTtEVocItAX2j0UdJdxizoj2EePChjS8xnXUhwrpVBAl+sSKIl59oKHVLNJSYPcz57CXSla0KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764886549; c=relaxed/simple;
	bh=QdSRcY8BrPno/xUfa4B3Hwt+7kmeX+p7ZlhyIB/M558=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WCJYDq9LAaYv5ZmYHPjFWg0C3+UQgsQDkmO+YpvLzb3ApyWWxT8vC8cLq4CvMch9WXk3mFHjaIXp5O2L/9uUEwTh2IDF/5IcHG+1dM66S6KPcAuZRNU/O8jcPsuIzKfMMqVXeiE+lrpaofwtbXJP7HqNfz77oc8Ye0BSx9v7Ngs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWVfggmR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWVfggmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764886545; x=1796422545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdSRcY8BrPno/xUfa4B3Hwt+7kmeX+p7ZlhyIB/M558=;
  b=gWVfggmRm15A5pEC2+acxMDpAeBfQhRKoBpojIeEUPYa4I7asEugZP4J
   PsvByI3YkRwwoX0+2PkIBgyFonpTnYLfTRCANln9qtI3ThATQMExyABb2
   Tup9vUT0E1JEuTTVjYpsTBpyngOzSBcVX91sHV4Ltpa0nfTOeUa7D2y9H
   vTIgsiw4xxb48wCAq41ac+S1hIMIfsLA3aSJolCFojLce8lNVia8B2Jct
   nQgd6uipf/bEcR18VMWMO1WgAI47qNI5dXcKKyohU7rCStE8ibDQQ2F8g
   f2QPPbamz9an7VQgwdXvXJJyeYtKvtQA/KcBzG8u+gD8OxehLqhtatqSi
   A==;
X-CSE-ConnectionGUID: LbbfMp9fQn2FkCqS5MsF/Q==
X-CSE-MsgGUID: 67wxUhXwSNeCj0n3Ozvwew==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70769243"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="70769243"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 14:15:38 -0800
X-CSE-ConnectionGUID: Nu8AJmVSQq2njjpOCgvyFw==
X-CSE-MsgGUID: 7grg76YIQ7CnIHltKA0ewA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Dec 2025 14:15:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRHbr-00000000EIb-2KXW;
	Thu, 04 Dec 2025 22:15:35 +0000
Date: Fri, 5 Dec 2025 06:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 22/22] kernel/sched/fair.c:1210:38: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202512050605.KqhW1pE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   eaad49852269b521e02cff73adc8b8a432fda88e
commit: eaad49852269b521e02cff73adc8b8a432fda88e [22/22] sched/eevdf: Move to a single runqueue
config: loongarch-randconfig-r133-20251130 (https://download.01.org/0day-ci/archive/20251205/202512050605.KqhW1pE5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050605.KqhW1pE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512050605.KqhW1pE5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1117:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1117:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1117:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1151:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1151:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1151:33: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair.c:1210:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1210:38: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1210:38: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12722:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12722:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12722:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8225:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8225:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8225:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8429:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8429:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8429:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8604:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8604:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8604:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8637:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8637:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8637:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8843:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8843:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8843:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9878:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9878:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9878:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10506:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10506:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10506:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11978:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11978:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11978:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11616:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11616:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11616:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12091:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12091:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12091:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6536:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2303:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2303:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2303:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2303:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct *

vim +1210 kernel/sched/fair.c

  1104	
  1105	static s64 update_se(struct rq *rq, struct sched_entity *se)
  1106	{
  1107		u64 now = rq_clock_task(rq);
  1108		s64 delta_exec;
  1109	
  1110		delta_exec = now - se->exec_start;
  1111		if (unlikely(delta_exec <= 0))
  1112			return delta_exec;
  1113	
  1114		se->exec_start = now;
  1115		if (entity_is_task(se)) {
  1116			struct task_struct *donor = task_of(se);
> 1117			struct task_struct *running = rq->curr;
  1118			/*
  1119			 * If se is a task, we account the time against the running
  1120			 * task, as w/ proxy-exec they may not be the same.
  1121			 */
  1122			running->se.exec_start = now;
  1123			running->se.sum_exec_runtime += delta_exec;
  1124	
  1125			trace_sched_stat_runtime(running, delta_exec);
  1126			account_group_exec_runtime(running, delta_exec);
  1127	
  1128			/* cgroup time is always accounted against the donor */
  1129			cgroup_account_cputime(donor, delta_exec);
  1130		} else {
  1131			/* If not task, account the time against donor se  */
  1132			se->sum_exec_runtime += delta_exec;
  1133		}
  1134	
  1135		if (schedstat_enabled()) {
  1136			struct sched_statistics *stats;
  1137	
  1138			stats = __schedstats_from_se(se);
  1139			__schedstat_set(stats->exec_max,
  1140					max(delta_exec, stats->exec_max));
  1141		}
  1142	
  1143		return delta_exec;
  1144	}
  1145	
  1146	/*
  1147	 * Used by other classes to account runtime.
  1148	 */
  1149	s64 update_curr_common(struct rq *rq)
  1150	{
  1151		return update_se(rq, &rq->donor->se);
  1152	}
  1153	
  1154	/*
  1155	 * Update the current task's runtime statistics.
  1156	 */
  1157	static void update_curr(struct cfs_rq *cfs_rq)
  1158	{
  1159		/*
  1160		 * Note: cfs_rq->curr corresponds to the task picked to
  1161		 * run (ie: rq->donor.se) which due to proxy-exec may
  1162		 * not necessarily be the actual task running
  1163		 * (rq->curr.se). This is easy to confuse!
  1164		 */
  1165		struct sched_entity *curr = cfs_rq->h_curr;
  1166		struct rq *rq = rq_of(cfs_rq);
  1167		s64 delta_exec;
  1168		bool resched;
  1169	
  1170		if (unlikely(!curr))
  1171			return;
  1172	
  1173		delta_exec = update_se(rq, curr);
  1174		if (unlikely(delta_exec <= 0))
  1175			return;
  1176	
  1177		account_cfs_rq_runtime(cfs_rq, delta_exec);
  1178	
  1179		if (!entity_is_task(curr))
  1180			return;
  1181	
  1182		cfs_rq = &rq->cfs;
  1183	
  1184		curr->vruntime += calc_delta_fair(delta_exec, curr);
  1185		resched = update_deadline(cfs_rq, curr);
  1186	
  1187		/*
  1188		 * If the fair_server is active, we need to account for the
  1189		 * fair_server time whether or not the task is running on
  1190		 * behalf of fair_server or not:
  1191		 *  - If the task is running on behalf of fair_server, we need
  1192		 *    to limit its time based on the assigned runtime.
  1193		 *  - Fair task that runs outside of fair_server should account
  1194		 *    against fair_server such that it can account for this time
  1195		 *    and possibly avoid running this period.
  1196		 */
  1197		dl_server_update(&rq->fair_server, delta_exec);
  1198	
  1199		if (cfs_rq->h_nr_queued == 1)
  1200			return;
  1201	
  1202		if (resched || !protect_slice(curr)) {
  1203			resched_curr_lazy(rq);
  1204			clear_buddies(cfs_rq, curr);
  1205		}
  1206	}
  1207	
  1208	static void update_curr_fair(struct rq *rq)
  1209	{
> 1210		struct sched_entity *se = &rq->donor->se;
  1211	
  1212		for_each_sched_entity(se)
  1213			update_curr(cfs_rq_of(se));
  1214	}
  1215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
