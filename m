Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415CA57860
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 22:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710195006; cv=none; b=IHUQ7mp+XbTfcItSpEF4Hsek4AesB9W4BePs4jOhMIVSVDsGMMlEC4ahRVlvsHKxNR2dBIry2Y7DQi3GHHNjnSryO+vobms98NQjgqtsSipb0u1NeUa2pk316CYfBHTlm5IPZpzIlVfYycoivns2Mo5Hxmx+dWy/7U0dU3PQGkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710195006; c=relaxed/simple;
	bh=IfffagpF3HWJEjt4CBL3qFpSRFcrFNppEqF/5L0acIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i7BBbRQBg5Jwsi1L5kFNW9tz6XO3dzmG0fWSSYbjq9RD1gsuO3ljswtVmDgzG2R1iGh/0xN7KWm+y1aMaEBU9pTgv/yzhZhBKH60cLl36SUGi2MrgavGqlTlv+ZQJ7g/SVAxWzcymCVtKv+5wZPkY5v+3AA4IOVPejnWbKy+3es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFmVueYW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFmVueYW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710195003; x=1741731003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IfffagpF3HWJEjt4CBL3qFpSRFcrFNppEqF/5L0acIk=;
  b=mFmVueYWrF45VodpRI4PMLUGLR2x9i0fQbMo2GcBrgQ4coqV2MUYnG8/
   MYIQ864ifCfB7SuZLJ/fFxcGVz60+wbIcXLKplsl/h1BMhmkVh9leUGYs
   V24E43Dfw/G3CrnS0cV4Z2VwcUWmaSIEnbE3pwjuOKj57kbs2d+PA+spy
   15dxFiMOGcrh8h5IdVrccK/hcigBwKZ39wzzAjSZB0pr+gY9FYftRATPV
   IkIzQ/+wllsB0pc0nLgrxOp8TnSYehpZLWvtakMCaQl94sWYTCgsGUVrv
   bINfB2equ1st4I09ry7boG8z3Z0hJiuG0XJP/XYPhf3iUqcO39SYMh9Tp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16325746"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="16325746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 15:10:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="15805103"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2024 15:10:01 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjnqI-0009Uq-2F;
	Mon, 11 Mar 2024 22:09:58 +0000
Date: Tue, 12 Mar 2024 06:09:09 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Suleiman Souhlal <suleiman@google.com>
Subject: [jfern:sched/dlserver.debug.mar3.2024 29987/30000]
 kernel/sched/deadline.c:1385:36: sparse: sparse: dereference of noderef
 expression
Message-ID: <202403120638.HuOdsadP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/dlserver.debug.mar3.2024
head:   6890cea305eadbebc9f3fcf8d31c6672af797ee5
commit: 9711072dc8002713616f71f8235b337aea9b3db8 [29987/30000] BACKPORT: FROMGIT: sched/deadline: Account idle time for deferred server
config: x86_64-randconfig-123-20240311 (https://download.01.org/0day-ci/archive/20240312/202403120638.HuOdsadP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120638.HuOdsadP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120638.HuOdsadP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/deadline.c:2076:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2076:42: sparse:     expected struct sched_dl_entity *b
   kernel/sched/deadline.c:2076:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1229:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1229:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1229:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1573:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1573:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1573:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2796:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2796:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2796:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:1131:29: sparse: sparse: context imbalance in 'dl_task_timer' - different lock contexts for basic block
>> kernel/sched/deadline.c:1385:36: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c: note: in included file:
   kernel/sched/sched.h:1604:9: sparse: sparse: context imbalance in 'inactive_task_timer' - unexpected unlock
   kernel/sched/sched.h:2075:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2075:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2075:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2075:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2075:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2075:25: sparse:    struct task_struct *

vim +1385 kernel/sched/deadline.c

  1361	
  1362	static inline void
  1363	update_stats_dequeue_dl(struct dl_rq *dl_rq, struct sched_dl_entity *dl_se,
  1364				int flags);
  1365	static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64 delta_exec)
  1366	{
  1367		s64 scaled_delta_exec;
  1368	
  1369		if (unlikely(delta_exec <= 0)) {
  1370			if (unlikely(dl_se->dl_yielded))
  1371				goto throttle;
  1372			return;
  1373		}
  1374	
  1375		if (dl_server(dl_se) && dl_se->dl_throttled && !dl_se->dl_defer)
  1376			return;
  1377	
  1378		if (dl_entity_is_special(dl_se))
  1379			return;
  1380	
  1381		scaled_delta_exec = dl_scalled_delta_exec(rq, dl_se, delta_exec);
  1382	
  1383		dl_se->runtime -= scaled_delta_exec;
  1384	
> 1385		if (dl_server(dl_se) && !rq->curr->pid)
  1386			return;
  1387	
  1388		/*
  1389		 * The fair server can consume its runtime while throttled (not queued).
  1390		 *
  1391		 * If the server consumes its entire runtime in this state. The server
  1392		 * is not required for the current period. Thus, reset the server by
  1393		 * starting a new period, pushing the activation to the zero-lax time.
  1394		 */
  1395		if (dl_se->dl_defer && dl_se->dl_throttled && dl_runtime_exceeded(dl_se)) {
  1396			s64 runtime_diff = dl_se->runtime + dl_se->dl_runtime;
  1397	
  1398			/*
  1399			 * If this is a regular throttling case, let it run negative until
  1400			 * the dl_runtime - runtime > 0. The reason being is that the next
  1401			 * replenishment will result in a positive runtime one period ahead.
  1402			 *
  1403			 * Otherwise, the deadline will be pushed more than one period, not
  1404			 * providing runtime/period anymore.
  1405			 *
  1406			 * If the dl_runtime - runtime < 0, then the server was able to get
  1407			 * the runtime/period before the replenishment. So it is safe
  1408			 * to start a new deffered period.
  1409			 */
  1410			if (!dl_se->dl_defer_armed && runtime_diff > 0)
  1411				return;
  1412	
  1413			hrtimer_try_to_cancel(&dl_se->dl_timer);
  1414	
  1415			replenish_dl_new_period(dl_se, dl_se->rq);
  1416			start_dl_timer(dl_se);
  1417	
  1418			return;
  1419		}
  1420	
  1421	throttle:
  1422		if (dl_runtime_exceeded(dl_se) || dl_se->dl_yielded) {
  1423			dl_se->dl_throttled = 1;
  1424	
  1425			/* If requested, inform the user about runtime overruns. */
  1426			if (dl_runtime_exceeded(dl_se) &&
  1427			    (dl_se->flags & SCHED_FLAG_DL_OVERRUN))
  1428				dl_se->dl_overrun = 1;
  1429	
  1430			dequeue_dl_entity(dl_se, 0);
  1431			if (!dl_server(dl_se))
  1432				dequeue_pushable_dl_task(rq, dl_task_of(dl_se));
  1433	
  1434			if (unlikely(is_dl_boosted(dl_se) || !start_dl_timer(dl_se))) {
  1435				if (dl_server(dl_se))
  1436					enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
  1437				else
  1438					enqueue_task_dl(rq, dl_task_of(dl_se), ENQUEUE_REPLENISH);
  1439			}
  1440	
  1441			if (!is_leftmost(dl_se, &rq->dl))
  1442				resched_curr(rq);
  1443		}
  1444	
  1445		/*
  1446		 * The fair server (sole dl_server) does not account for real-time
  1447		 * workload because it is running fair work.
  1448		 */
  1449		if (dl_se == &rq->fair_server)
  1450			return;
  1451	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
