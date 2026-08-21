Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAA949362B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329679; cv=none; b=I1KBebn6Qaqrk1lRhbXEQ2asreqN1kNW5B5tFcxdg+laYtE/5eAE5Iv6lkAsM/ZEA2TMZmgTuNzmpGppATuFt3EErWlXSfJ3ztNy7qbE6pQ8uokGo6PNLMzjEcDbRn3OBSaDnBxND1xtVPktOS5MUU/Nctm+flal54DXcfMiwSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329679; c=relaxed/simple;
	bh=zByslpLcrXWlM8olCU5/nUSKQueAzxfRwIC/AZWlB5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fe2njawXRxct1fGWqdXQs0PqDlbMbtndzT99IKBLzdXFyX8JtZdBqEzlmAl3QJdEgKZEzvlJgodoD28uZb+IfK4oEBLrAf7l+bcTgy4bzBEQ18KrK2hZMaGm4Ojaz+dLWXao2I7eKKyiNbPffw+e+8uQbp/hPdXhnHNM8Rf8zWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jB+0vrMp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jB+0vrMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787329677; x=1818865677;
  h=date:from:to:cc:subject:message-id;
  bh=zByslpLcrXWlM8olCU5/nUSKQueAzxfRwIC/AZWlB5Q=;
  b=jB+0vrMpOCOqph/ywbSGozHjWEcPo9sOuBIvA4unZXXqfk0ulnx1/msy
   fRzmJ/SgBMtmKFb3E50f9EHe1YJN9aeCIarmCsPDwN6/FyKG/F4t2mR0S
   CuyLqZcfynFW8inXEqD04ThzAzzBl0KP3fFCV6MezrHks0LIEmEcPt91D
   ikxtoAK/nlbVDZ8r47yUjNbgv8it6jTt4JnXcS1jNt1V/pU9sztTuZ/vr
   y0H/d+BuevA1Hvac46Z0TCxHtOc9daHZHVuuT3Nt4JjdVb5jRPb/KUOa1
   Xd2HqYuofAZO/+Qn8OmOgb5DiFDJCWb9YfC1D7nAB7lkCxkpKClQ9yT9l
   A==;
X-CSE-ConnectionGUID: JVftfbDZR72Dqs6hHQPjjg==
X-CSE-MsgGUID: Ksm0kvR4TbC92kbcrhBQzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87739162"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87739162"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 09:27:57 -0700
X-CSE-ConnectionGUID: C7a8+m5BQ3Gzbt5rxyx2ZA==
X-CSE-MsgGUID: 3ruTVvoFSTCC9VC6P8lfCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="264624482"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Aug 2026 09:27:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxS5v-00000000qCj-2D7j;
	Fri, 21 Aug 2026 16:27:51 +0000
Date: Sat, 22 Aug 2026 00:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2/2] kernel/sched/idle.c:179:
 warning: Function parameter or member 'stop_tick' not described in
 'cpuidle_idle_call'
Message-ID: <202608220252.nTDXJoDN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Rafael,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   e165496edc1142154adde5a5f0335042db432c41
commit: 39c0d422f501d8000e9e1257b0783a43bd2249a7 [2/2] sched: idle: Consolidate the handling of two special cases
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260822/202608220252.nTDXJoDN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220252.nTDXJoDN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220252.nTDXJoDN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/idle.c:179: warning: Function parameter or member 'stop_tick' not described in 'cpuidle_idle_call'


vim +179 kernel/sched/idle.c

39c0d422f501d80 Rafael J. Wysocki 2026-03-13  168  
30cdd69e2a26650 Daniel Lezcano    2014-03-03  169  /**
30cdd69e2a26650 Daniel Lezcano    2014-03-03  170   * cpuidle_idle_call - the main idle function
30cdd69e2a26650 Daniel Lezcano    2014-03-03  171   *
30cdd69e2a26650 Daniel Lezcano    2014-03-03  172   * NOTE: no locks or semaphores should be used here
82c65d60d64401a Andy Lutomirski   2014-06-04  173   *
82c65d60d64401a Andy Lutomirski   2014-06-04  174   * On archs that support TIF_POLLING_NRFLAG, is called with polling
82c65d60d64401a Andy Lutomirski   2014-06-04  175   * set, and it returns with polling set.  If it ever stops polling, it
82c65d60d64401a Andy Lutomirski   2014-06-04  176   * must clear the polling bit.
30cdd69e2a26650 Daniel Lezcano    2014-03-03  177   */
39c0d422f501d80 Rafael J. Wysocki 2026-03-13  178  static void cpuidle_idle_call(bool stop_tick)
30cdd69e2a26650 Daniel Lezcano    2014-03-03 @179  {
9bd616e3dbedfc1 Catalin Marinas   2016-06-01  180  	struct cpuidle_device *dev = cpuidle_get_device();
30cdd69e2a26650 Daniel Lezcano    2014-03-03  181  	struct cpuidle_driver *drv = cpuidle_get_cpu_driver(dev);
37352273ad48f2d Peter Zijlstra    2014-04-11  182  	int next_state, entered_state;
30cdd69e2a26650 Daniel Lezcano    2014-03-03  183  
a1d028bd6d2b778 Daniel Lezcano    2014-03-03  184  	/*
a1d028bd6d2b778 Daniel Lezcano    2014-03-03  185  	 * Check if the idle task must be rescheduled. If it is the
c444117f0f39d59 Peter Zijlstra    2014-04-11  186  	 * case, exit the function after re-enabling the local irq.
a1d028bd6d2b778 Daniel Lezcano    2014-03-03  187  	 */
c444117f0f39d59 Peter Zijlstra    2014-04-11  188  	if (need_resched()) {
8ca3c6424f4988f Daniel Lezcano    2014-03-03  189  		local_irq_enable();
08c373e5123b459 Rafael J. Wysocki 2014-04-21  190  		return;
8ca3c6424f4988f Daniel Lezcano    2014-03-03  191  	}
8ca3c6424f4988f Daniel Lezcano    2014-03-03  192  
a1d028bd6d2b778 Daniel Lezcano    2014-03-03  193  	/*
ed98c34919985a9 Rafael J. Wysocki 2018-03-15  194  	 * The RCU framework needs to be told that we are entering an idle
ed98c34919985a9 Rafael J. Wysocki 2018-03-15  195  	 * section, so no more rcu read side critical sections and one more
a1d028bd6d2b778 Daniel Lezcano    2014-03-03  196  	 * step to the grace period
a1d028bd6d2b778 Daniel Lezcano    2014-03-03  197  	 */
c8cc7d4de7a4f2f Daniel Lezcano    2014-03-03  198  
82f663277d0db85 Rafael J. Wysocki 2015-05-04  199  	if (cpuidle_not_available(drv, dev)) {
39c0d422f501d80 Rafael J. Wysocki 2026-03-13  200  		idle_call_stop_or_retain_tick(stop_tick);
ed98c34919985a9 Rafael J. Wysocki 2018-03-15  201  
82f663277d0db85 Rafael J. Wysocki 2015-05-04  202  		default_idle_call();
82f663277d0db85 Rafael J. Wysocki 2015-05-04  203  		goto exit_idle;
82f663277d0db85 Rafael J. Wysocki 2015-05-04  204  	}
ef2b22ac540c018 Rafael J. Wysocki 2015-03-02  205  
3810631332465d9 Rafael J. Wysocki 2015-02-12  206  	/*
f02f4f9d826590f Rafael J. Wysocki 2017-08-10  207  	 * Suspend-to-idle ("s2idle") is a system state in which all user space
3810631332465d9 Rafael J. Wysocki 2015-02-12  208  	 * has been frozen, all I/O devices have been suspended and the only
3e0de271fff77ab Hewenliang        2020-01-09  209  	 * activity happens here and in interrupts (if any). In that case bypass
3810631332465d9 Rafael J. Wysocki 2015-02-12  210  	 * the cpuidle governor and go stratight for the deepest idle state
3810631332465d9 Rafael J. Wysocki 2015-02-12  211  	 * available.  Possibly also suspend the local tick and the entire
3810631332465d9 Rafael J. Wysocki 2015-02-12  212  	 * timekeeping to prevent timer interrupts from kicking us out of idle
3810631332465d9 Rafael J. Wysocki 2015-02-12  213  	 * until a proper wakeup interrupt happens.
3810631332465d9 Rafael J. Wysocki 2015-02-12  214  	 */
bb8313b603eb8fd Jacob Pan         2016-11-28  215  
c55b51a06b01d67 Daniel Lezcano    2019-11-16  216  	if (idle_should_enter_s2idle() || dev->forced_idle_latency_limit_ns) {
5aa9ba6312e36c1 Daniel Lezcano    2019-11-16  217  		u64 max_latency_ns;
5aa9ba6312e36c1 Daniel Lezcano    2019-11-16  218  
f02f4f9d826590f Rafael J. Wysocki 2017-08-10  219  		if (idle_should_enter_s2idle()) {
ed98c34919985a9 Rafael J. Wysocki 2018-03-15  220  
10e8b11eb3195e1 Rafael J. Wysocki 2020-06-25  221  			entered_state = call_cpuidle_s2idle(drv, dev);
10e8b11eb3195e1 Rafael J. Wysocki 2020-06-25  222  			if (entered_state > 0)
3810631332465d9 Rafael J. Wysocki 2015-02-12  223  				goto exit_idle;
ed98c34919985a9 Rafael J. Wysocki 2018-03-15  224  
5aa9ba6312e36c1 Daniel Lezcano    2019-11-16  225  			max_latency_ns = U64_MAX;
5aa9ba6312e36c1 Daniel Lezcano    2019-11-16  226  		} else {
5aa9ba6312e36c1 Daniel Lezcano    2019-11-16  227  			max_latency_ns = dev->forced_idle_latency_limit_ns;
bb8313b603eb8fd Jacob Pan         2016-11-28  228  		}
3810631332465d9 Rafael J. Wysocki 2015-02-12  229  
ed98c34919985a9 Rafael J. Wysocki 2018-03-15  230  		tick_nohz_idle_stop_tick();
ed98c34919985a9 Rafael J. Wysocki 2018-03-15  231  
5aa9ba6312e36c1 Daniel Lezcano    2019-11-16  232  		next_state = cpuidle_find_deepest_state(drv, dev, max_latency_ns);
bcf6ad8a4a3d002 Rafael J. Wysocki 2015-05-04  233  		call_cpuidle(drv, dev, next_state);
3e84116d45a2f35 Rafael J. Wysocki 2026-03-07  234  	} else if (drv->state_count > 1) {
39c0d422f501d80 Rafael J. Wysocki 2026-03-13  235  		/*
39c0d422f501d80 Rafael J. Wysocki 2026-03-13  236  		 * stop_tick is expected to be true by default by cpuidle
39c0d422f501d80 Rafael J. Wysocki 2026-03-13  237  		 * governors, which allows them to select idle states with
39c0d422f501d80 Rafael J. Wysocki 2026-03-13  238  		 * target residency above the tick period length.
39c0d422f501d80 Rafael J. Wysocki 2026-03-13  239  		 */
39c0d422f501d80 Rafael J. Wysocki 2026-03-13  240  		stop_tick = true;
45f1ff59e27ca59 Rafael J. Wysocki 2018-03-22  241  
a1d028bd6d2b778 Daniel Lezcano    2014-03-03  242  		/*
52c324f8a87b336 Rafael J. Wysocki 2014-05-01  243  		 * Ask the cpuidle framework to choose a convenient idle state.
a1d028bd6d2b778 Daniel Lezcano    2014-03-03  244  		 */
45f1ff59e27ca59 Rafael J. Wysocki 2018-03-22  245  		next_state = cpuidle_select(drv, dev, &stop_tick);
554c8aa8ecade21 Rafael J. Wysocki 2018-04-03  246  
39c0d422f501d80 Rafael J. Wysocki 2026-03-13  247  		idle_call_stop_or_retain_tick(stop_tick);
554c8aa8ecade21 Rafael J. Wysocki 2018-04-03  248  
bcf6ad8a4a3d002 Rafael J. Wysocki 2015-05-04  249  		entered_state = call_cpuidle(drv, dev, next_state);
a1d028bd6d2b778 Daniel Lezcano    2014-03-03  250  		/*
37352273ad48f2d Peter Zijlstra    2014-04-11  251  		 * Give the governor an opportunity to reflect on the outcome
a1d028bd6d2b778 Daniel Lezcano    2014-03-03  252  		 */
30cdd69e2a26650 Daniel Lezcano    2014-03-03  253  		cpuidle_reflect(dev, entered_state);
3e84116d45a2f35 Rafael J. Wysocki 2026-03-07  254  	} else {
39c0d422f501d80 Rafael J. Wysocki 2026-03-13  255  		idle_call_stop_or_retain_tick(stop_tick);
3e84116d45a2f35 Rafael J. Wysocki 2026-03-07  256  
3e84116d45a2f35 Rafael J. Wysocki 2026-03-07  257  		/*
3e84116d45a2f35 Rafael J. Wysocki 2026-03-07  258  		 * If there is only a single idle state (or none), there is
3e84116d45a2f35 Rafael J. Wysocki 2026-03-07  259  		 * nothing meaningful for the governor to choose.  Skip the
3e84116d45a2f35 Rafael J. Wysocki 2026-03-07  260  		 * governor and always use state 0.
3e84116d45a2f35 Rafael J. Wysocki 2026-03-07  261  		 */
3e84116d45a2f35 Rafael J. Wysocki 2026-03-07  262  		call_cpuidle(drv, dev, 0);
bcf6ad8a4a3d002 Rafael J. Wysocki 2015-05-04  263  	}
8ca3c6424f4988f Daniel Lezcano    2014-03-03  264  
37352273ad48f2d Peter Zijlstra    2014-04-11  265  exit_idle:
8ca3c6424f4988f Daniel Lezcano    2014-03-03  266  	__current_set_polling();
8ca3c6424f4988f Daniel Lezcano    2014-03-03  267  
a1d028bd6d2b778 Daniel Lezcano    2014-03-03  268  	/*
37352273ad48f2d Peter Zijlstra    2014-04-11  269  	 * It is up to the idle functions to reenable local interrupts
a1d028bd6d2b778 Daniel Lezcano    2014-03-03  270  	 */
c8cc7d4de7a4f2f Daniel Lezcano    2014-03-03  271  	if (WARN_ON_ONCE(irqs_disabled()))
c8cc7d4de7a4f2f Daniel Lezcano    2014-03-03  272  		local_irq_enable();
30cdd69e2a26650 Daniel Lezcano    2014-03-03  273  }
30cdd69e2a26650 Daniel Lezcano    2014-03-03  274  

:::::: The code at line 179 was first introduced by commit
:::::: 30cdd69e2a266505ca8229c944d361ff350a6959 cpuidle/idle: Move the cpuidle_idle_call function to idle.c

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
