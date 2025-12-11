Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB712DAFA1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440536; cv=none; b=VWXVpRBuR0z4sbp3wgQncBaf7RS6LWzEBOGx7Ss8rvVt0VWNynkBC+fhtOz3GqD799CN5Urxk7jMd2///FAKAOFUBE7IFzVFHugAZVIjLHDoQPNV2R1wCwm9hqTN5dVoydKZOt56hBKHUFo2zwgN+I+lUxRSA5nmCGK1Y/tBleo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440536; c=relaxed/simple;
	bh=enJXO6YE/7xYsFZB22rV9CQeiioXWI3z5fEUFQ3kZbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k25EK+PFsUVZRVJVDlfg1bQkhlHZMe2FygmW7kWrwK6SvYkM4yTKkaGbX1sFCzBRgoP0CeHNGisOgW7HOLbPtZScAxm51V2+h6K/MW1SeZf6ZHcoVAV9+HrCUhuRai5CCqXX6lzrxNrQB98k755pqdJ+nQaEIDh8MwkI46/yXhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYFgktQJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYFgktQJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765440531; x=1796976531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=enJXO6YE/7xYsFZB22rV9CQeiioXWI3z5fEUFQ3kZbY=;
  b=aYFgktQJZ4JwcVdnFqRcxZcdz7k7K5crxSSm0vu67nds7XsQHNyTpkWC
   WIT1xtmmtw8pGit0Gmsg+4AtNFuZUyo7LIVF9XHLRllzv5xvtSa443c/L
   +qWm2xC6cAn8uWFk4HPJli0gA0rjfFJQlDfETUIFMn4HS3GXqgfGzgy9o
   xGDD28830W+VZ1U//wMxCFqKy1bi3lbkYS3c/6g9dLiLPfT6G7ojE9AGw
   RzJkKaekuqWprSxaOURyPfCfBA9Kbd1zNI9oqguXN2WC8YI4fmTToJcfi
   MjX8DqgiL6rszHJMEp7citeE9OA2EV7EtaAJDR3JEl9UYVxZrtYuQ1ESK
   g==;
X-CSE-ConnectionGUID: avsCtEeoSGGLJQ7XXAXuRg==
X-CSE-MsgGUID: Oa1wgzYwQLKhqdFRaTwnjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="77732135"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="77732135"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 00:08:49 -0800
X-CSE-ConnectionGUID: pTuA1je5SV+96Q3t/z/SNA==
X-CSE-MsgGUID: u4emtEmkSQesJrSkIkflaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="220090933"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Dec 2025 00:08:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTbjB-000000004OL-2t6k;
	Thu, 11 Dec 2025 08:08:45 +0000
Date: Thu, 11 Dec 2025 16:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 39/39] kernel/sched/pelt.c:180:1:
 warning: no previous prototype for '___update_load_sum'
Message-ID: <202512111646.bUj7fxo2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   dd79c421671d7417fa9ad8465ca823298cd5fa14
commit: eb9686932be35a47b6d621cc033a861b51e42741 [39/39] ANDROID: sched: Export symbols needed for vendor hooks
config: i386-randconfig-052-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111646.bUj7fxo2-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111646.bUj7fxo2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111646.bUj7fxo2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:49:
>> kernel/sched/pelt.c:180:1: warning: no previous prototype for '___update_load_sum' [-Wmissing-prototypes]
     180 | ___update_load_sum(u64 now, struct sched_avg *sa,
         | ^~~~~~~~~~~~~~~~~~
   kernel/sched/pelt.c:258:1: warning: no previous prototype for '___update_load_avg' [-Wmissing-prototypes]
     258 | ___update_load_avg(struct sched_avg *sa, unsigned long load)
         | ^~~~~~~~~~~~~~~~~~
   kernel/sched/pelt.c:480:5: warning: no previous prototype for 'sched_pelt_multiplier' [-Wmissing-prototypes]
     480 | int sched_pelt_multiplier(struct ctl_table *table, int write, void *buffer,
         |     ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


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

:::::: The code at line 180 was first introduced by commit
:::::: 23127296889fe84b0762b191b5d041e8ba6f2599 sched/fair: Update scale invariance of PELT

:::::: TO: Vincent Guittot <vincent.guittot@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
