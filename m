Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB8B212B0A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 19:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765655439; cv=none; b=ZZj47kyADDt/gK8eCvjeL3kA+ZJ2csmq4TmDX+EYeEqdg3G50/cr5+VRaQpE7IhNF+Ho0VndjoUVLbSqirOhUpSxniMfEA9Na9uU9CHG0HYLTrNYI5L6mAruauzGcgjzUWgIvdNpG2e1uhiwVlK7ty/RDSZ79HzPfhrEoHYqLCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765655439; c=relaxed/simple;
	bh=2ZpDO6ftpX0X4eC7MDDCMCoEFlgusULRdPJvQ/ktDvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVKYdeOhxJXvSt4yh8tD4pQyu/M66oZkEDvGF8RurfdDqXvDP24psvZIt3d2IaolApmmuFUOcXC6WE9+lvcMT+9Yqv3vymtBOk1oSr9T79GL/viJo1739i9q/vr04YUomCTWlQgGKu8sJf/SignngJoBt/bX37plDoedbDI2y9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+w3tA+x; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+w3tA+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765655437; x=1797191437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ZpDO6ftpX0X4eC7MDDCMCoEFlgusULRdPJvQ/ktDvU=;
  b=f+w3tA+x7f7DH7bw2wZKBd9AItOMBhcCJ24v1kmL+okBkEaOLVXboEeH
   inficlLFasTxOy8h8ZuLB3NH/V7FYQCo8JMGwbiNGTT0CN2aKo+HbaG1w
   qDjeO0JJsPcS3S0AP4RUr/tznXhiuJjVzpbT+L+VlS3qndLxRfobdCsWZ
   DaD3NO83gIwNIenNnuDKqU9kJcAkNnxHJdFNdfpBp21XY2tQF8UYGkory
   uX+jOXBsWJ5GNrLmFl4GNFEqyd8+GkSXwezoDG86CSZcyQBKBB/Xx2YjM
   9o9E05DEvh/oKHw+7Gh8C1zIsZhcFOcTP8eHsUVj+i/O5DFgCoiNJUV05
   g==;
X-CSE-ConnectionGUID: vLXUgSEkTdmM+5F08uSj3Q==
X-CSE-MsgGUID: +fGteXgqTfmg4V41YitgNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67581163"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67581163"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:50:36 -0800
X-CSE-ConnectionGUID: +Zp1yQ8HSHWg15VVmBBsEw==
X-CSE-MsgGUID: bKjRsCvISXew51k5PpLAWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196641384"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 11:50:35 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUVdQ-000000002A8-3arS;
	Sat, 13 Dec 2025 19:50:32 +0000
Date: Sat, 13 Dec 2025 20:50:04 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40] kernel/sched/pelt.c:180:1:
 warning: no previous prototype for '___update_load_sum'
Message-ID: <202512132036.e7yUkOVv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: eb9686932be35a47b6d621cc033a861b51e42741 [40/40] ANDROID: sched: Export symbols needed for vendor hooks
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512132036.e7yUkOVv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132036.e7yUkOVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132036.e7yUkOVv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:49:
>> kernel/sched/pelt.c:180:1: warning: no previous prototype for '___update_load_sum' [-Wmissing-prototypes]
     180 | ___update_load_sum(u64 now, struct sched_avg *sa,
         | ^~~~~~~~~~~~~~~~~~
>> kernel/sched/pelt.c:258:1: warning: no previous prototype for '___update_load_avg' [-Wmissing-prototypes]
     258 | ___update_load_avg(struct sched_avg *sa, unsigned long load)
         | ^~~~~~~~~~~~~~~~~~
   kernel/sched/pelt.c:480:5: warning: no previous prototype for 'sched_pelt_multiplier' [-Wmissing-prototypes]
     480 | int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
         |     ^~~~~~~~~~~~~~~~~~~~~


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
