Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7D4328256
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762867660; cv=none; b=Oiy8s4XzAo6i0rXCkI+kFpS5rFInF6g161h4dFjaOwGgKm8hUuvjAqCeuJwmWB12WD9XOJPKFrfPC17toXAB4H1EoUMY/fwIdVlEGugh8Mm4IEur/OYenvplFgNmLxr4gb9Buxz/Hr4D+s+ZDy8LQzTOXZBGnrjzeDBGBO1xmuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762867660; c=relaxed/simple;
	bh=9G3uHXxhzqG3hPgDQN+4rBJDx+qG0DIBhI4DpkNrabk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bVz/IaqLydOtc2w2YIRwKnlZ31rXgRsSCW2gfjcDGcqs54hcS4o9EWhsPAOqJxF1T+JlH3OZdCpMHhJMiVPxj0iC8EqFCljJUjTMJuqyg1I5DMqXj9sCvd4gIJPobnDHfteAkijo9xMpOemUv7AZxzy2VYtYlVYZdPIZdJO7QG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkqJLsxW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkqJLsxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762867659; x=1794403659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9G3uHXxhzqG3hPgDQN+4rBJDx+qG0DIBhI4DpkNrabk=;
  b=gkqJLsxWugveeV+GDhWExzBHwY/yA0yOSz/WIwOiH7QGzySR8+EQXKfz
   hdFSKjoxN24z13FLhkhluCCGvcHihGOQHp77ofg9LuIixMZMg0cfCC07+
   xrQNHj485PC4SRp0StJrB1HV/S3Uqy9B9wA/9NeHs8fR9b3MMePleuBGX
   7j5AauQYQ5RAMBaoEOB5dqsKuZr2b/rzHhld5RlhponSQd+aiDhyoMQQ7
   VzPPEHAbgAXQVt08eqZjA4IjangxwalJeUkt8tk7HVLBG+yvqThBRcu8k
   LrBZGXgCUs6V6Snk+m0WLpaaIGrB4xuzhCHlBV6ebTJfLA3t3CNkl0A6i
   A==;
X-CSE-ConnectionGUID: GwW814lCRfC7ynqaNO08pA==
X-CSE-MsgGUID: bkjpzWXnSOG0z1RC2YseHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64845526"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64845526"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 05:27:37 -0800
X-CSE-ConnectionGUID: HQ4n+RL2RVC56YRf0+ulLg==
X-CSE-MsgGUID: DRg0RBaJQIaDC3bDxR8uxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="219613806"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Nov 2025 05:27:36 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIoPF-0003B2-1n;
	Tue, 11 Nov 2025 13:27:33 +0000
Date: Tue, 11 Nov 2025 21:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:sched/core 8/10] kernel/sched/deadline.c:1441:23: error: 'd_se'
 undeclared; did you mean 'dl_se'?
Message-ID: <202511112143.jHhs83lL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   46f61fb2e7678daae743d601efac3b957041ed56
commit: b75a19b9d73e0deb5f761884228b8b15694e2858 [8/10] sched/deadline: Document dl_server
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251111/202511112143.jHhs83lL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511112143.jHhs83lL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511112143.jHhs83lL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:58:
   kernel/sched/deadline.c: In function 'update_curr_dl_se':
>> kernel/sched/deadline.c:1441:23: error: 'd_se' undeclared (first use in this function); did you mean 'dl_se'?
    1441 |         if (dl_server(d_se) && dl_se->dl_throttled && !dl_se->dl_defer)
         |                       ^~~~
         |                       dl_se
   kernel/sched/deadline.c:1441:23: note: each undeclared identifier is reported only once for each function it appears in


vim +1441 kernel/sched/deadline.c

  1429	
  1430	static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64 delta_exec)
  1431	{
  1432		bool idle = rq->curr == rq->idle;
  1433		s64 scaled_delta_exec;
  1434	
  1435		if (unlikely(delta_exec <= 0)) {
  1436			if (unlikely(dl_se->dl_yielded))
  1437				goto throttle;
  1438			return;
  1439		}
  1440	
> 1441		if (dl_server(d_se) && dl_se->dl_throttled && !dl_se->dl_defer)
  1442			return;
  1443	
  1444		if (dl_entity_is_special(dl_se))
  1445			return;
  1446	
  1447		scaled_delta_exec = delta_exec;
  1448		if (!dl_server(dl_se))
  1449			scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
  1450	
  1451		dl_se->runtime -= scaled_delta_exec;
  1452	
  1453		if (dl_se->dl_defer_idle && !idle)
  1454			dl_se->dl_defer_idle = 0;
  1455	
  1456		/*
  1457		 * The fair server can consume its runtime while throttled (not queued/
  1458		 * running as regular CFS).
  1459		 *
  1460		 * If the server consumes its entire runtime in this state. The server
  1461		 * is not required for the current period. Thus, reset the server by
  1462		 * starting a new period, pushing the activation.
  1463		 */
  1464		if (dl_se->dl_defer && dl_se->dl_throttled && dl_runtime_exceeded(dl_se)) {
  1465			/*
  1466			 * Non-servers would never get time accounted while throttled.
  1467			 */
  1468			WARN_ON_ONCE(!dl_server(dl_se));
  1469	
  1470			/*
  1471			 * While the server is marked idle, do not push out the
  1472			 * activation further, instead wait for the period timer
  1473			 * to lapse and stop the server.
  1474			 */
  1475			if (dl_se->dl_defer_idle && idle) {
  1476				/*
  1477				 * The timer is at the zero-laxity point, this means
  1478				 * dl_server_stop() / dl_server_start() can happen
  1479				 * while now < deadline. This means update_dl_entity()
  1480				 * will not replenish. Additionally start_dl_timer()
  1481				 * will be set for 'deadline - runtime'. Negative
  1482				 * runtime will not do.
  1483				 */
  1484				dl_se->runtime = 0;
  1485				return;
  1486			}
  1487	
  1488			/*
  1489			 * If the server was previously activated - the starving condition
  1490			 * took place, it this point it went away because the fair scheduler
  1491			 * was able to get runtime in background. So return to the initial
  1492			 * state.
  1493			 */
  1494			dl_se->dl_defer_running = 0;
  1495	
  1496			hrtimer_try_to_cancel(&dl_se->dl_timer);
  1497	
  1498			replenish_dl_new_period(dl_se, dl_se->rq);
  1499	
  1500			if (idle)
  1501				dl_se->dl_defer_idle = 1;
  1502	
  1503			/*
  1504			 * Not being able to start the timer seems problematic. If it could not
  1505			 * be started for whatever reason, we need to "unthrottle" the DL server
  1506			 * and queue right away. Otherwise nothing might queue it. That's similar
  1507			 * to what enqueue_dl_entity() does on start_dl_timer==0. For now, just warn.
  1508			 */
  1509			WARN_ON_ONCE(!start_dl_timer(dl_se));
  1510	
  1511			return;
  1512		}
  1513	
  1514	throttle:
  1515		if (dl_runtime_exceeded(dl_se) || dl_se->dl_yielded) {
  1516			dl_se->dl_throttled = 1;
  1517	
  1518			/* If requested, inform the user about runtime overruns. */
  1519			if (dl_runtime_exceeded(dl_se) &&
  1520			    (dl_se->flags & SCHED_FLAG_DL_OVERRUN))
  1521				dl_se->dl_overrun = 1;
  1522	
  1523			dequeue_dl_entity(dl_se, 0);
  1524			if (!dl_server(dl_se)) {
  1525				update_stats_dequeue_dl(&rq->dl, dl_se, 0);
  1526				dequeue_pushable_dl_task(rq, dl_task_of(dl_se));
  1527			}
  1528	
  1529			if (unlikely(is_dl_boosted(dl_se) || !start_dl_timer(dl_se))) {
  1530				if (dl_server(dl_se)) {
  1531					replenish_dl_new_period(dl_se, rq);
  1532					start_dl_timer(dl_se);
  1533				} else {
  1534					enqueue_task_dl(rq, dl_task_of(dl_se), ENQUEUE_REPLENISH);
  1535				}
  1536			}
  1537	
  1538			if (!is_leftmost(dl_se, &rq->dl))
  1539				resched_curr(rq);
  1540		}
  1541	
  1542		/*
  1543		 * The fair server (sole dl_server) does not account for real-time
  1544		 * workload because it is running fair work.
  1545		 */
  1546		if (dl_se == &rq->fair_server)
  1547			return;
  1548	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
