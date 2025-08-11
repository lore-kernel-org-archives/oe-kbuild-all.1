Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308491C1F05
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754907057; cv=none; b=D0ZxsO1zlgrTPxi5sU5GhVEr7XXjbhin4Nhjql8KZcJUz7Ewx8+qh0lrvSV4k7SLL4iyVpcVd5ClRZcGh+XZGvPNA7nbcCmLwBixg4+EIkmCJ+LPkMHNyPUePPI7RMf5LaezL+t5rDH45bT3nJ741eSlNk6v79GhN81+prU+BK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754907057; c=relaxed/simple;
	bh=N4AvJPX9nni245AFp5QJI6/5b4toxeTIY5y6bx/QVOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qelfjx4lRqwNH+rxZ9MiALO3/9pVcRtcqx6ahsqsNDmfYTJAkQDUq3fuhIYOFS6I9tUDINw3FNkLiQYOf0qw5mK2wIlnfqDbcTRNw4/7Aw1xagzmEniYiXwN2+4Cw0XMswl1pZxJW0h6uNydHCdkXenQX6SdNiVwEgBbSltJQGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UI1u+srT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UI1u+srT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754907055; x=1786443055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N4AvJPX9nni245AFp5QJI6/5b4toxeTIY5y6bx/QVOI=;
  b=UI1u+srT9H0WjY54rq7MeXgG3a6LP9nI/dZ+Ob6feJRl/M9aTrEdY9tg
   UB+zhgVpoCn8W5X4gXvbEawc4oq68y5iGxDT9ChCzzEJL29qxDDTqJyRh
   9b5JDXMzwm+FDzDU6Jp9DuY0QwDg39eJ5jL2cyxe/msyy6xck2RD59T1F
   wQlsTUozmr8b+aSpKqy2Unc5tSjXlWY/aHHCH/yd1R22lbtrwiEWdw+Dk
   DHGkIBQy3LRDnD/LX/+/3CCYS2xg2v4EzEXn1e5foRMbip0paiLViJjqL
   RwZvYyBd8LLieyuMc041BrPqaz2OVuSC9vkGoAk2xH6VWY67R3YTJeHIf
   A==;
X-CSE-ConnectionGUID: nqkr+NyRTheNwbRfPkk9Ww==
X-CSE-MsgGUID: BRrYCGOBToOP7x18SumIqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57297871"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57297871"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 03:10:55 -0700
X-CSE-ConnectionGUID: lCGYvy+SThuEJADl1iEOKw==
X-CSE-MsgGUID: +999q2iCQ/ayZEXAQlkGCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165868813"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 03:10:54 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulPUR-00033P-1D;
	Mon, 11 Aug 2025 10:10:51 +0000
Date: Mon, 11 Aug 2025 12:10:04 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kernel/sched/pelt.c:182:1:
 warning: no previous prototype for function '___update_load_sum'
Message-ID: <202508111224.8e9xjwHX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   f66b79911ed8ccb29c3129f3b35fbb418395f189
commit: ed558fd9d86374c50519532cd86fe40771f0532c [1/1] ANDROID: sched: Export symbols needed for vendor hooks
config: arm-milbeaut_m10v_defconfig (https://download.01.org/0day-ci/archive/20250811/202508111224.8e9xjwHX-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111224.8e9xjwHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508111224.8e9xjwHX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:24:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/sched/build_policy.c:49:
>> kernel/sched/pelt.c:182:1: warning: no previous prototype for function '___update_load_sum' [-Wmissing-prototypes]
     182 | ___update_load_sum(u64 now, struct sched_avg *sa,
         | ^
   kernel/sched/pelt.c:181:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     181 | int
         | ^
         | static 
>> kernel/sched/pelt.c:262:1: warning: no previous prototype for function '___update_load_avg' [-Wmissing-prototypes]
     262 | ___update_load_avg(struct sched_avg *sa, unsigned long load)
         | ^
   kernel/sched/pelt.c:261:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     261 | void
         | ^
         | static 
   kernel/sched/pelt.c:484:5: warning: no previous prototype for function 'sched_pelt_multiplier' [-Wmissing-prototypes]
     484 | int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
         |     ^
   kernel/sched/pelt.c:484:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     484 | int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
         | ^
         | static 
   4 warnings generated.


vim +/___update_load_sum +182 kernel/sched/pelt.c

c079629862b20c Vincent Guittot 2018-06-28  152  
c079629862b20c Vincent Guittot 2018-06-28  153  /*
c079629862b20c Vincent Guittot 2018-06-28  154   * We can represent the historical contribution to runnable average as the
c079629862b20c Vincent Guittot 2018-06-28  155   * coefficients of a geometric series.  To do this we sub-divide our runnable
c079629862b20c Vincent Guittot 2018-06-28  156   * history into segments of approximately 1ms (1024us); label the segment that
c079629862b20c Vincent Guittot 2018-06-28  157   * occurred N-ms ago p_N, with p_0 corresponding to the current period, e.g.
c079629862b20c Vincent Guittot 2018-06-28  158   *
c079629862b20c Vincent Guittot 2018-06-28  159   * [<- 1024us ->|<- 1024us ->|<- 1024us ->| ...
c079629862b20c Vincent Guittot 2018-06-28  160   *      p0            p1           p2
c079629862b20c Vincent Guittot 2018-06-28  161   *     (now)       (~1ms ago)  (~2ms ago)
c079629862b20c Vincent Guittot 2018-06-28  162   *
c079629862b20c Vincent Guittot 2018-06-28  163   * Let u_i denote the fraction of p_i that the entity was runnable.
c079629862b20c Vincent Guittot 2018-06-28  164   *
c079629862b20c Vincent Guittot 2018-06-28  165   * We then designate the fractions u_i as our co-efficients, yielding the
c079629862b20c Vincent Guittot 2018-06-28  166   * following representation of historical load:
c079629862b20c Vincent Guittot 2018-06-28  167   *   u_0 + u_1*y + u_2*y^2 + u_3*y^3 + ...
c079629862b20c Vincent Guittot 2018-06-28  168   *
c079629862b20c Vincent Guittot 2018-06-28  169   * We choose y based on the with of a reasonably scheduling period, fixing:
c079629862b20c Vincent Guittot 2018-06-28  170   *   y^32 = 0.5
c079629862b20c Vincent Guittot 2018-06-28  171   *
c079629862b20c Vincent Guittot 2018-06-28  172   * This means that the contribution to load ~32ms ago (u_32) will be weighted
c079629862b20c Vincent Guittot 2018-06-28  173   * approximately half as much as the contribution to load within the last ms
c079629862b20c Vincent Guittot 2018-06-28  174   * (u_0).
c079629862b20c Vincent Guittot 2018-06-28  175   *
c079629862b20c Vincent Guittot 2018-06-28  176   * When a period "rolls over" and we have new u_0`, multiplying the previous
c079629862b20c Vincent Guittot 2018-06-28  177   * sum again by y is sufficient to update:
c079629862b20c Vincent Guittot 2018-06-28  178   *   load_avg = u_0` + y*(u_0 + u_1*y + u_2*y^2 + ... )
c079629862b20c Vincent Guittot 2018-06-28  179   *            = u_0 + u_1*y + u_2*y^2 + ... [re-labeling u_i --> u_{i+1}]
c079629862b20c Vincent Guittot 2018-06-28  180   */
ed558fd9d86374 Rick Yiu        2023-08-28  181  int
23127296889fe8 Vincent Guittot 2019-01-23 @182  ___update_load_sum(u64 now, struct sched_avg *sa,
9f68395333ad7f Vincent Guittot 2020-02-24  183  		  unsigned long load, unsigned long runnable, int running)
c079629862b20c Vincent Guittot 2018-06-28  184  {
c079629862b20c Vincent Guittot 2018-06-28  185  	u64 delta;
c079629862b20c Vincent Guittot 2018-06-28  186  
c079629862b20c Vincent Guittot 2018-06-28  187  	delta = now - sa->last_update_time;
c079629862b20c Vincent Guittot 2018-06-28  188  	/*
c079629862b20c Vincent Guittot 2018-06-28  189  	 * This should only happen when time goes backwards, which it
c079629862b20c Vincent Guittot 2018-06-28  190  	 * unfortunately does during sched clock init when we swap over to TSC.
c079629862b20c Vincent Guittot 2018-06-28  191  	 */
c079629862b20c Vincent Guittot 2018-06-28  192  	if ((s64)delta < 0) {
c079629862b20c Vincent Guittot 2018-06-28  193  		sa->last_update_time = now;
c079629862b20c Vincent Guittot 2018-06-28  194  		return 0;
c079629862b20c Vincent Guittot 2018-06-28  195  	}
c079629862b20c Vincent Guittot 2018-06-28  196  
c079629862b20c Vincent Guittot 2018-06-28  197  	/*
c079629862b20c Vincent Guittot 2018-06-28  198  	 * Use 1024ns as the unit of measurement since it's a reasonable
c079629862b20c Vincent Guittot 2018-06-28  199  	 * approximation of 1us and fast to compute.
c079629862b20c Vincent Guittot 2018-06-28  200  	 */
c079629862b20c Vincent Guittot 2018-06-28  201  	delta >>= 10;
c079629862b20c Vincent Guittot 2018-06-28  202  	if (!delta)
c079629862b20c Vincent Guittot 2018-06-28  203  		return 0;
c079629862b20c Vincent Guittot 2018-06-28  204  
c079629862b20c Vincent Guittot 2018-06-28  205  	sa->last_update_time += delta << 10;
c079629862b20c Vincent Guittot 2018-06-28  206  
5cb12b53e12eb6 Chungkai Mei    2023-11-02  207  	trace_android_rvh_update_load_sum(sa, &delta, &sched_pelt_lshift);
5cb12b53e12eb6 Chungkai Mei    2023-11-02  208  
c079629862b20c Vincent Guittot 2018-06-28  209  	/*
c079629862b20c Vincent Guittot 2018-06-28  210  	 * running is a subset of runnable (weight) so running can't be set if
c079629862b20c Vincent Guittot 2018-06-28  211  	 * runnable is clear. But there are some corner cases where the current
c079629862b20c Vincent Guittot 2018-06-28  212  	 * se has been already dequeued but cfs_rq->curr still points to it.
c079629862b20c Vincent Guittot 2018-06-28  213  	 * This means that weight will be 0 but not running for a sched_entity
c079629862b20c Vincent Guittot 2018-06-28  214  	 * but also for a cfs_rq if the latter becomes idle. As an example,
c079629862b20c Vincent Guittot 2018-06-28  215  	 * this happens during idle_balance() which calls
d040e0734fb3de Peng Wang       2019-12-13  216  	 * update_blocked_averages().
d040e0734fb3de Peng Wang       2019-12-13  217  	 *
d040e0734fb3de Peng Wang       2019-12-13  218  	 * Also see the comment in accumulate_sum().
c079629862b20c Vincent Guittot 2018-06-28  219  	 */
c079629862b20c Vincent Guittot 2018-06-28  220  	if (!load)
9f68395333ad7f Vincent Guittot 2020-02-24  221  		runnable = running = 0;
c079629862b20c Vincent Guittot 2018-06-28  222  
c079629862b20c Vincent Guittot 2018-06-28  223  	/*
c079629862b20c Vincent Guittot 2018-06-28  224  	 * Now we know we crossed measurement unit boundaries. The *_avg
c079629862b20c Vincent Guittot 2018-06-28  225  	 * accrues by two steps:
c079629862b20c Vincent Guittot 2018-06-28  226  	 *
c079629862b20c Vincent Guittot 2018-06-28  227  	 * Step 1: accumulate *_sum since last_update_time. If we haven't
c079629862b20c Vincent Guittot 2018-06-28  228  	 * crossed period boundaries, finish.
c079629862b20c Vincent Guittot 2018-06-28  229  	 */
9f68395333ad7f Vincent Guittot 2020-02-24  230  	if (!accumulate_sum(delta, sa, load, runnable, running))
c079629862b20c Vincent Guittot 2018-06-28  231  		return 0;
c079629862b20c Vincent Guittot 2018-06-28  232  
c079629862b20c Vincent Guittot 2018-06-28  233  	return 1;
c079629862b20c Vincent Guittot 2018-06-28  234  }
ed558fd9d86374 Rick Yiu        2023-08-28  235  EXPORT_SYMBOL_GPL(___update_load_sum);
c079629862b20c Vincent Guittot 2018-06-28  236  
95d685935a2edf Vincent Guittot 2020-05-06  237  /*
95d685935a2edf Vincent Guittot 2020-05-06  238   * When syncing *_avg with *_sum, we must take into account the current
95d685935a2edf Vincent Guittot 2020-05-06  239   * position in the PELT segment otherwise the remaining part of the segment
95d685935a2edf Vincent Guittot 2020-05-06  240   * will be considered as idle time whereas it's not yet elapsed and this will
95d685935a2edf Vincent Guittot 2020-05-06  241   * generate unwanted oscillation in the range [1002..1024[.
95d685935a2edf Vincent Guittot 2020-05-06  242   *
95d685935a2edf Vincent Guittot 2020-05-06  243   * The max value of *_sum varies with the position in the time segment and is
95d685935a2edf Vincent Guittot 2020-05-06  244   * equals to :
95d685935a2edf Vincent Guittot 2020-05-06  245   *
95d685935a2edf Vincent Guittot 2020-05-06  246   *   LOAD_AVG_MAX*y + sa->period_contrib
95d685935a2edf Vincent Guittot 2020-05-06  247   *
95d685935a2edf Vincent Guittot 2020-05-06  248   * which can be simplified into:
95d685935a2edf Vincent Guittot 2020-05-06  249   *
95d685935a2edf Vincent Guittot 2020-05-06  250   *   LOAD_AVG_MAX - 1024 + sa->period_contrib
95d685935a2edf Vincent Guittot 2020-05-06  251   *
95d685935a2edf Vincent Guittot 2020-05-06  252   * because LOAD_AVG_MAX*y == LOAD_AVG_MAX-1024
95d685935a2edf Vincent Guittot 2020-05-06  253   *
95d685935a2edf Vincent Guittot 2020-05-06  254   * The same care must be taken when a sched entity is added, updated or
95d685935a2edf Vincent Guittot 2020-05-06  255   * removed from a cfs_rq and we need to update sched_avg. Scheduler entities
95d685935a2edf Vincent Guittot 2020-05-06  256   * and the cfs rq, to which they are attached, have the same position in the
95d685935a2edf Vincent Guittot 2020-05-06  257   * time segment because they use the same clock. This means that we can use
95d685935a2edf Vincent Guittot 2020-05-06  258   * the period_contrib of cfs_rq when updating the sched_avg of a sched_entity
95d685935a2edf Vincent Guittot 2020-05-06  259   * if it's more convenient.
95d685935a2edf Vincent Guittot 2020-05-06  260   */
ed558fd9d86374 Rick Yiu        2023-08-28  261  void
0dacee1bfa70e1 Vincent Guittot 2020-02-24 @262  ___update_load_avg(struct sched_avg *sa, unsigned long load)
c079629862b20c Vincent Guittot 2018-06-28  263  {
87e867b4269f29 Vincent Guittot 2020-06-12  264  	u32 divider = get_pelt_divider(sa);
c079629862b20c Vincent Guittot 2018-06-28  265  
c079629862b20c Vincent Guittot 2018-06-28  266  	/*
c079629862b20c Vincent Guittot 2018-06-28  267  	 * Step 2: update *_avg.
c079629862b20c Vincent Guittot 2018-06-28  268  	 */
c079629862b20c Vincent Guittot 2018-06-28  269  	sa->load_avg = div_u64(load * sa->load_sum, divider);
9f68395333ad7f Vincent Guittot 2020-02-24  270  	sa->runnable_avg = div_u64(sa->runnable_sum, divider);
523e979d316481 Vincent Guittot 2018-06-28  271  	WRITE_ONCE(sa->util_avg, sa->util_sum / divider);
c079629862b20c Vincent Guittot 2018-06-28  272  }
ed558fd9d86374 Rick Yiu        2023-08-28  273  EXPORT_SYMBOL_GPL(___update_load_avg);
c079629862b20c Vincent Guittot 2018-06-28  274  

:::::: The code at line 182 was first introduced by commit
:::::: 23127296889fe84b0762b191b5d041e8ba6f2599 sched/fair: Update scale invariance of PELT

:::::: TO: Vincent Guittot <vincent.guittot@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
