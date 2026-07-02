Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C752842B319
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993009; cv=none; b=FEs2w2qbHpSX+PQ8ZZmDt21FAiz7YshRqhhB+1wPedLii++QIHyMa4GBZWNvwnk5tL/ooUwzUqeMqP+9/HVRshKn3mZlLu5t5cR00kTGuWkQWNkwQK46y8QUJHnt9SN3QaJ4aX1SnY4K+fg4KxIPIrtZum8ty5ygBov/4MwPe2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993009; c=relaxed/simple;
	bh=soWUIvTMkgG92EN9rY/7N/uA3gb0HA/Vd+fYbEmgl4M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rqBX6TMoIO0bQr4KytjczqcG13kZn4G6Q7AIE2YPPTCFy2tS4iAGMxlEAwq9+/U5lh71Hh+NcBtZ+8oIk1Ywc51oB2bKkEfasA9xg35kLnfrmdrJtT4ofrw1VjmpEzraUzzYIAdmjtEMulHDAlWQQOaTVs9j3TDy2fzcLNYENSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAT1jbVe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAT1jbVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782993007; x=1814529007;
  h=date:from:to:cc:subject:message-id;
  bh=soWUIvTMkgG92EN9rY/7N/uA3gb0HA/Vd+fYbEmgl4M=;
  b=fAT1jbVeIDY91jupPXpcifG8e4rglGNmkB42+hncbtfHzvzeOk4GpgLE
   u841MATOafEsF5DzIgWNzTMiP5wlHSu5N0i5wKC9Za3OCylrlQ39+v2T5
   4Kaq7bsDjQ5PZPIVnqXRw99BD/CN3a/DvHkJxJd3uUM/Uu0X09lrII8sM
   rEPThBt864MtU0DFRo/cknOnvAh+2a0yWE4ECLDJtNtlQOJ+DC/p4qrMp
   Iukc92DAVIn7gQ/PjiF6KtOaQe6GZe6SDbS1Wt7aXh1hp0Q4xzOTCu8Sg
   YxkGJ5wJZzO7VJySL1lbL1FikuFziIWEDv9nv6s/SH+tqderwzXsSNRi5
   g==;
X-CSE-ConnectionGUID: hDcvG6qaRDierAm3Sq4V6Q==
X-CSE-MsgGUID: jnc9xnzYQNKeqW6XJnsBig==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83938137"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83938137"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 04:50:05 -0700
X-CSE-ConnectionGUID: pjmwS/NcRmGOsYJIFgia0g==
X-CSE-MsgGUID: 4N3+3+GpSwyUHAD0q8zbOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="257183737"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Jul 2026 04:50:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfFvd-00000000AkZ-0LgE;
	Thu, 02 Jul 2026 11:50:01 +0000
Date: Thu, 02 Jul 2026 19:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 166/166]
 kernel/sched/pelt.c:180:1: warning: no previous prototype for function
 '___update_load_sum'
Message-ID: <202607021907.SLt4sGGE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2a9e8b82544e3c1e2678c2c07bef3d3706156ee4
commit: eb9686932be35a47b6d621cc033a861b51e42741 [166/166] ANDROID: sched: Export symbols needed for vendor hooks
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260702/202607021907.SLt4sGGE-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021907.SLt4sGGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021907.SLt4sGGE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from kernel/sched/build_policy.c:49:
>> kernel/sched/pelt.c:180:1: warning: no previous prototype for function '___update_load_sum' [-Wmissing-prototypes]
     180 | ___update_load_sum(u64 now, struct sched_avg *sa,
         | ^
   kernel/sched/pelt.c:179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     179 | int
         | ^
         | static 
>> kernel/sched/pelt.c:258:1: warning: no previous prototype for function '___update_load_avg' [-Wmissing-prototypes]
     258 | ___update_load_avg(struct sched_avg *sa, unsigned long load)
         | ^
   kernel/sched/pelt.c:257:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     257 | void
         | ^
         | static 
   kernel/sched/pelt.c:480:5: warning: no previous prototype for function 'sched_pelt_multiplier' [-Wmissing-prototypes]
     480 | int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
         |     ^
   kernel/sched/pelt.c:480:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     480 | int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
         | ^
         | static 
   4 warnings generated.


vim +/___update_load_sum +180 kernel/sched/pelt.c

c079629862b20c Vincent Guittot 2018-06-28  150  
c079629862b20c Vincent Guittot 2018-06-28  151  /*
c079629862b20c Vincent Guittot 2018-06-28  152   * We can represent the historical contribution to runnable average as the
c079629862b20c Vincent Guittot 2018-06-28  153   * coefficients of a geometric series.  To do this we sub-divide our runnable
c079629862b20c Vincent Guittot 2018-06-28  154   * history into segments of approximately 1ms (1024us); label the segment that
c079629862b20c Vincent Guittot 2018-06-28  155   * occurred N-ms ago p_N, with p_0 corresponding to the current period, e.g.
c079629862b20c Vincent Guittot 2018-06-28  156   *
c079629862b20c Vincent Guittot 2018-06-28  157   * [<- 1024us ->|<- 1024us ->|<- 1024us ->| ...
c079629862b20c Vincent Guittot 2018-06-28  158   *      p0            p1           p2
c079629862b20c Vincent Guittot 2018-06-28  159   *     (now)       (~1ms ago)  (~2ms ago)
c079629862b20c Vincent Guittot 2018-06-28  160   *
c079629862b20c Vincent Guittot 2018-06-28  161   * Let u_i denote the fraction of p_i that the entity was runnable.
c079629862b20c Vincent Guittot 2018-06-28  162   *
c079629862b20c Vincent Guittot 2018-06-28  163   * We then designate the fractions u_i as our co-efficients, yielding the
c079629862b20c Vincent Guittot 2018-06-28  164   * following representation of historical load:
c079629862b20c Vincent Guittot 2018-06-28  165   *   u_0 + u_1*y + u_2*y^2 + u_3*y^3 + ...
c079629862b20c Vincent Guittot 2018-06-28  166   *
c079629862b20c Vincent Guittot 2018-06-28  167   * We choose y based on the with of a reasonably scheduling period, fixing:
c079629862b20c Vincent Guittot 2018-06-28  168   *   y^32 = 0.5
c079629862b20c Vincent Guittot 2018-06-28  169   *
c079629862b20c Vincent Guittot 2018-06-28  170   * This means that the contribution to load ~32ms ago (u_32) will be weighted
c079629862b20c Vincent Guittot 2018-06-28  171   * approximately half as much as the contribution to load within the last ms
c079629862b20c Vincent Guittot 2018-06-28  172   * (u_0).
c079629862b20c Vincent Guittot 2018-06-28  173   *
c079629862b20c Vincent Guittot 2018-06-28  174   * When a period "rolls over" and we have new u_0`, multiplying the previous
c079629862b20c Vincent Guittot 2018-06-28  175   * sum again by y is sufficient to update:
c079629862b20c Vincent Guittot 2018-06-28  176   *   load_avg = u_0` + y*(u_0 + u_1*y + u_2*y^2 + ... )
c079629862b20c Vincent Guittot 2018-06-28  177   *            = u_0 + u_1*y + u_2*y^2 + ... [re-labeling u_i --> u_{i+1}]
c079629862b20c Vincent Guittot 2018-06-28  178   */
eb9686932be35a Rick Yiu        2023-08-28  179  int
23127296889fe8 Vincent Guittot 2019-01-23 @180  ___update_load_sum(u64 now, struct sched_avg *sa,
9f68395333ad7f Vincent Guittot 2020-02-24  181  		  unsigned long load, unsigned long runnable, int running)
c079629862b20c Vincent Guittot 2018-06-28  182  {
c079629862b20c Vincent Guittot 2018-06-28  183  	u64 delta;
c079629862b20c Vincent Guittot 2018-06-28  184  
c079629862b20c Vincent Guittot 2018-06-28  185  	delta = now - sa->last_update_time;
c079629862b20c Vincent Guittot 2018-06-28  186  	/*
c079629862b20c Vincent Guittot 2018-06-28  187  	 * This should only happen when time goes backwards, which it
c079629862b20c Vincent Guittot 2018-06-28  188  	 * unfortunately does during sched clock init when we swap over to TSC.
c079629862b20c Vincent Guittot 2018-06-28  189  	 */
c079629862b20c Vincent Guittot 2018-06-28  190  	if ((s64)delta < 0) {
c079629862b20c Vincent Guittot 2018-06-28  191  		sa->last_update_time = now;
c079629862b20c Vincent Guittot 2018-06-28  192  		return 0;
c079629862b20c Vincent Guittot 2018-06-28  193  	}
c079629862b20c Vincent Guittot 2018-06-28  194  
c079629862b20c Vincent Guittot 2018-06-28  195  	/*
c079629862b20c Vincent Guittot 2018-06-28  196  	 * Use 1024ns as the unit of measurement since it's a reasonable
c079629862b20c Vincent Guittot 2018-06-28  197  	 * approximation of 1us and fast to compute.
c079629862b20c Vincent Guittot 2018-06-28  198  	 */
c079629862b20c Vincent Guittot 2018-06-28  199  	delta >>= 10;
c079629862b20c Vincent Guittot 2018-06-28  200  	if (!delta)
c079629862b20c Vincent Guittot 2018-06-28  201  		return 0;
c079629862b20c Vincent Guittot 2018-06-28  202  
c079629862b20c Vincent Guittot 2018-06-28  203  	sa->last_update_time += delta << 10;
c079629862b20c Vincent Guittot 2018-06-28  204  
c079629862b20c Vincent Guittot 2018-06-28  205  	/*
c079629862b20c Vincent Guittot 2018-06-28  206  	 * running is a subset of runnable (weight) so running can't be set if
c079629862b20c Vincent Guittot 2018-06-28  207  	 * runnable is clear. But there are some corner cases where the current
c079629862b20c Vincent Guittot 2018-06-28  208  	 * se has been already dequeued but cfs_rq->curr still points to it.
c079629862b20c Vincent Guittot 2018-06-28  209  	 * This means that weight will be 0 but not running for a sched_entity
c079629862b20c Vincent Guittot 2018-06-28  210  	 * but also for a cfs_rq if the latter becomes idle. As an example,
c079629862b20c Vincent Guittot 2018-06-28  211  	 * this happens during idle_balance() which calls
d040e0734fb3de Peng Wang       2019-12-13  212  	 * update_blocked_averages().
d040e0734fb3de Peng Wang       2019-12-13  213  	 *
d040e0734fb3de Peng Wang       2019-12-13  214  	 * Also see the comment in accumulate_sum().
c079629862b20c Vincent Guittot 2018-06-28  215  	 */
c079629862b20c Vincent Guittot 2018-06-28  216  	if (!load)
9f68395333ad7f Vincent Guittot 2020-02-24  217  		runnable = running = 0;
c079629862b20c Vincent Guittot 2018-06-28  218  
c079629862b20c Vincent Guittot 2018-06-28  219  	/*
c079629862b20c Vincent Guittot 2018-06-28  220  	 * Now we know we crossed measurement unit boundaries. The *_avg
c079629862b20c Vincent Guittot 2018-06-28  221  	 * accrues by two steps:
c079629862b20c Vincent Guittot 2018-06-28  222  	 *
c079629862b20c Vincent Guittot 2018-06-28  223  	 * Step 1: accumulate *_sum since last_update_time. If we haven't
c079629862b20c Vincent Guittot 2018-06-28  224  	 * crossed period boundaries, finish.
c079629862b20c Vincent Guittot 2018-06-28  225  	 */
9f68395333ad7f Vincent Guittot 2020-02-24  226  	if (!accumulate_sum(delta, sa, load, runnable, running))
c079629862b20c Vincent Guittot 2018-06-28  227  		return 0;
c079629862b20c Vincent Guittot 2018-06-28  228  
c079629862b20c Vincent Guittot 2018-06-28  229  	return 1;
c079629862b20c Vincent Guittot 2018-06-28  230  }
eb9686932be35a Rick Yiu        2023-08-28  231  EXPORT_SYMBOL_GPL(___update_load_sum);
c079629862b20c Vincent Guittot 2018-06-28  232  
95d685935a2edf Vincent Guittot 2020-05-06  233  /*
95d685935a2edf Vincent Guittot 2020-05-06  234   * When syncing *_avg with *_sum, we must take into account the current
95d685935a2edf Vincent Guittot 2020-05-06  235   * position in the PELT segment otherwise the remaining part of the segment
95d685935a2edf Vincent Guittot 2020-05-06  236   * will be considered as idle time whereas it's not yet elapsed and this will
95d685935a2edf Vincent Guittot 2020-05-06  237   * generate unwanted oscillation in the range [1002..1024[.
95d685935a2edf Vincent Guittot 2020-05-06  238   *
95d685935a2edf Vincent Guittot 2020-05-06  239   * The max value of *_sum varies with the position in the time segment and is
95d685935a2edf Vincent Guittot 2020-05-06  240   * equals to :
95d685935a2edf Vincent Guittot 2020-05-06  241   *
95d685935a2edf Vincent Guittot 2020-05-06  242   *   LOAD_AVG_MAX*y + sa->period_contrib
95d685935a2edf Vincent Guittot 2020-05-06  243   *
95d685935a2edf Vincent Guittot 2020-05-06  244   * which can be simplified into:
95d685935a2edf Vincent Guittot 2020-05-06  245   *
95d685935a2edf Vincent Guittot 2020-05-06  246   *   LOAD_AVG_MAX - 1024 + sa->period_contrib
95d685935a2edf Vincent Guittot 2020-05-06  247   *
95d685935a2edf Vincent Guittot 2020-05-06  248   * because LOAD_AVG_MAX*y == LOAD_AVG_MAX-1024
95d685935a2edf Vincent Guittot 2020-05-06  249   *
95d685935a2edf Vincent Guittot 2020-05-06  250   * The same care must be taken when a sched entity is added, updated or
95d685935a2edf Vincent Guittot 2020-05-06  251   * removed from a cfs_rq and we need to update sched_avg. Scheduler entities
95d685935a2edf Vincent Guittot 2020-05-06  252   * and the cfs rq, to which they are attached, have the same position in the
95d685935a2edf Vincent Guittot 2020-05-06  253   * time segment because they use the same clock. This means that we can use
95d685935a2edf Vincent Guittot 2020-05-06  254   * the period_contrib of cfs_rq when updating the sched_avg of a sched_entity
95d685935a2edf Vincent Guittot 2020-05-06  255   * if it's more convenient.
95d685935a2edf Vincent Guittot 2020-05-06  256   */
eb9686932be35a Rick Yiu        2023-08-28  257  void
0dacee1bfa70e1 Vincent Guittot 2020-02-24 @258  ___update_load_avg(struct sched_avg *sa, unsigned long load)
c079629862b20c Vincent Guittot 2018-06-28  259  {
87e867b4269f29 Vincent Guittot 2020-06-12  260  	u32 divider = get_pelt_divider(sa);
c079629862b20c Vincent Guittot 2018-06-28  261  
c079629862b20c Vincent Guittot 2018-06-28  262  	/*
c079629862b20c Vincent Guittot 2018-06-28  263  	 * Step 2: update *_avg.
c079629862b20c Vincent Guittot 2018-06-28  264  	 */
c079629862b20c Vincent Guittot 2018-06-28  265  	sa->load_avg = div_u64(load * sa->load_sum, divider);
9f68395333ad7f Vincent Guittot 2020-02-24  266  	sa->runnable_avg = div_u64(sa->runnable_sum, divider);
523e979d316481 Vincent Guittot 2018-06-28  267  	WRITE_ONCE(sa->util_avg, sa->util_sum / divider);
c079629862b20c Vincent Guittot 2018-06-28  268  }
eb9686932be35a Rick Yiu        2023-08-28  269  EXPORT_SYMBOL_GPL(___update_load_avg);
c079629862b20c Vincent Guittot 2018-06-28  270  

:::::: The code at line 180 was first introduced by commit
:::::: 23127296889fe84b0762b191b5d041e8ba6f2599 sched/fair: Update scale invariance of PELT

:::::: TO: Vincent Guittot <vincent.guittot@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
