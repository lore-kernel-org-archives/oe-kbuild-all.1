Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B72A342C80
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 23:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355902; cv=none; b=Fye3dh+VGvvxSK77tMZbXLboNxNwUZPiVmHyETwaxeqS/wThvreuXmsQR7jfXnBUK0u3/3D3hPzYo1qExUPwTjuekA+zKyNg3Rcpf6no5n6rInCmSMib3pteQhItKdMsZZ8nww8weYzFSorHjDBGITu7reTQ5RAdrZYD6PAabtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355902; c=relaxed/simple;
	bh=5aETE8uSHB6H4rE016/xpkyJr20x0Gu1hLIxEOG7Ffg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BWmu6/v+Jbsr9OnGlyVsf8yxvPJPJ7PfzIDkOuOGNeuLuawJnWNKD1TGA5tuQ7GEg3CAOAIn2ovOrQKCEjHkVbJayUpFkQD/zHsu6WqYN0Iwo8emps7pdjgjEHg6e2uyDEA4uBdcxCZVUGfYtzVTEYUnwGYNHH+Lzjtcw7LAZ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byYMz1wz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byYMz1wz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780355901; x=1811891901;
  h=date:from:to:cc:subject:message-id;
  bh=5aETE8uSHB6H4rE016/xpkyJr20x0Gu1hLIxEOG7Ffg=;
  b=byYMz1wzPqY5iG+V7Eqd3Jw2F1x+E3hoBGdEyYWh46dYkHrVH8oPRh7Z
   VMhS6ggu9jzHiGMfwPxabcQ1pardweC7gF3XXtndxVddR5IpLnHLGB5p2
   0st2lUozvz49CR61OY7vYE3nS43V/9v18vtxMupu2PCbtV2pa+ngsrgRT
   P+bLWkpwLqzvaafWh/r3gE4EY+uAzDvXMCLN+ZuJ6tLaZv7nsaEhjg2Oi
   eRZiswASHIUAVCKd34QLk+e5CbGi6D2fGLYQyidxiE9hGTJQye9MGJDFk
   XtePYd4fTmR/uIQ505zlrgqdRDW8QqEWnocCMvzyRvj+nJPt8fZLFaHaE
   Q==;
X-CSE-ConnectionGUID: 6r8XPUHQS2S9SaTnmI/vyQ==
X-CSE-MsgGUID: Rplc4YE2Rq+O6sTHUs/QDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106574807"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="106574807"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 16:18:21 -0700
X-CSE-ConnectionGUID: DD0oSWeDRDWhMNZ8/9U+WQ==
X-CSE-MsgGUID: PgNpHY8zSsm1M6ppvtrSlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="240722197"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jun 2026 16:18:19 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUBth-000000001fF-1rv0;
	Mon, 01 Jun 2026 23:18:17 +0000
Date: Tue, 02 Jun 2026 01:17:45 +0200
From: kernel test robot <lkp@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 53/55] kernel/sched/core.c:9862:17:
 error: too few arguments to function 'update_rq_clock'
Message-ID: <202606020119.qlzyZYgy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   3a9f55cc6febc28a79812ccea577e49e6292c272
commit: f01680da9d51010caa60b7f534bbae7eeed904d3 [53/55] sched/fair: Call update_curr() before unthrottling the hierarchy
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260602/202606020119.qlzyZYgy-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020119.qlzyZYgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020119.qlzyZYgy-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'tg_set_cfs_bandwidth':
>> kernel/sched/core.c:9862:17: error: too few arguments to function 'update_rq_clock'
    9862 |                 update_rq_clock();
         |                 ^~~~~~~~~~~~~~~
   kernel/sched/core.c:860:6: note: declared here
     860 | void update_rq_clock(struct rq *rq)
         |      ^~~~~~~~~~~~~~~


vim +/update_rq_clock +9862 kernel/sched/core.c

  9805	
  9806	static int tg_set_cfs_bandwidth(struct task_group *tg,
  9807					u64 period_us, u64 quota_us, u64 burst_us)
  9808	{
  9809		int i, ret = 0, runtime_enabled, runtime_was_enabled;
  9810		struct cfs_bandwidth *cfs_b = &tg->cfs_bandwidth;
  9811		u64 period, quota, burst;
  9812	
  9813		period = (u64)period_us * NSEC_PER_USEC;
  9814	
  9815		if (quota_us == RUNTIME_INF)
  9816			quota = RUNTIME_INF;
  9817		else
  9818			quota = (u64)quota_us * NSEC_PER_USEC;
  9819	
  9820		burst = (u64)burst_us * NSEC_PER_USEC;
  9821	
  9822		/*
  9823		 * Prevent race between setting of cfs_rq->runtime_enabled and
  9824		 * unthrottle_offline_cfs_rqs().
  9825		 */
  9826		guard(cpus_read_lock)();
  9827		guard(mutex)(&cfs_constraints_mutex);
  9828	
  9829		ret = __cfs_schedulable(tg, period, quota);
  9830		if (ret)
  9831			return ret;
  9832	
  9833		runtime_enabled = quota != RUNTIME_INF;
  9834		runtime_was_enabled = cfs_b->quota != RUNTIME_INF;
  9835		/*
  9836		 * If we need to toggle cfs_bandwidth_used, off->on must occur
  9837		 * before making related changes, and on->off must occur afterwards
  9838		 */
  9839		if (runtime_enabled && !runtime_was_enabled)
  9840			cfs_bandwidth_usage_inc();
  9841	
  9842		scoped_guard (raw_spinlock_irq, &cfs_b->lock) {
  9843			cfs_b->period = ns_to_ktime(period);
  9844			cfs_b->quota = quota;
  9845			cfs_b->burst = burst;
  9846	
  9847			__refill_cfs_bandwidth_runtime(cfs_b);
  9848	
  9849			/*
  9850			 * Restart the period timer (if active) to handle new
  9851			 * period expiry:
  9852			 */
  9853			if (runtime_enabled)
  9854				start_cfs_bandwidth(cfs_b);
  9855		}
  9856	
  9857		for_each_online_cpu(i) {
  9858			struct cfs_rq *cfs_rq = tg_cfs_rq(tg, i);
  9859			struct rq *rq = cfs_rq->rq;
  9860	
  9861			guard(rq_lock_irq)(rq);
> 9862			update_rq_clock();
  9863			cfs_rq->runtime_enabled = runtime_enabled;
  9864			cfs_rq->runtime_remaining = 1;
  9865	
  9866			if (cfs_rq->throttled)
  9867				unthrottle_cfs_rq(cfs_rq);
  9868		}
  9869	
  9870		if (runtime_was_enabled && !runtime_enabled)
  9871			cfs_bandwidth_usage_dec();
  9872	
  9873		return 0;
  9874	}
  9875	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
