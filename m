Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34FD3E7164
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 16:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516442; cv=none; b=ChcMr0CU5nR6wg38HRUDu26CvpFlYXDDaEgezshvC24nGvjI5+0uKOBZbf7EiazmKPFKDOGr2oIXGVN7B/Jb5ka3+RA+acUKTbRbPBvfe6nsG2ohPYkafVQN3v+onjY8E9hA0r/LkTSMmUghK9nYREKbg/7yHeoYef/xd1zcdZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516442; c=relaxed/simple;
	bh=XY2hxCSEUyZDatq747olh0ke0E29dkU0/zua2Gn2Gus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LY2Dz2eB/MwS4Y2+B3GmxXKviK09YqPezBq2bY92MYHwboaz18jNBnp3w9wD9+G/AOYShbh9TZ5fpJxZLNAuwEOTAvSeN8yexO+p/a/zznM2tjDYYsqIBZW4ZrcP1lvIUGuiJ7hNVaThhIafoZbwXl+6SZFjeW03PSVreGicspw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mt2zbViv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mt2zbViv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778516440; x=1810052440;
  h=date:from:to:cc:subject:message-id;
  bh=XY2hxCSEUyZDatq747olh0ke0E29dkU0/zua2Gn2Gus=;
  b=mt2zbVivTuwnRn56QLyfhSHi1BeZFo2gW9MFnU+447T7mH3/xM6+XDil
   wS42t6khcVm2NMurQkNz8dsUM8BIu+KA1MUmIKqKgxnDEnMJqcY0oUy6x
   8qv418uKtZMdfC1Nbt2IC1bx0P0FbOsfAugbfJcRaeC+Ey6MqWu7xOvI4
   kFy6Glmuavx9m/m5GHv6ArAOo/2CbOdEywTAujAhkoDlchmSSos1QSCeA
   hhVj83ldyMDUNm0SoC/KxVwXKCE+H/eK6FBVpoxX3N4Ng0amu4XHkuvRO
   cu7e+IiSeRcQDqLjpijZu98x99HUOdBGbLFExTMdTs40czVDB8PTv6Tde
   g==;
X-CSE-ConnectionGUID: tqdmAy6cQY2gIfjWlb2k2Q==
X-CSE-MsgGUID: YSFLnOH/SrOSnE1FrmgY9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79591506"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79591506"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 09:20:40 -0700
X-CSE-ConnectionGUID: Z44RkNotRamXyhL0usGV7w==
X-CSE-MsgGUID: w+Y7ZU+STmS0ctL4+Lf03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="231102822"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 May 2026 09:20:39 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMTMy-000000000qL-3FXd;
	Mon, 11 May 2026 16:20:36 +0000
Date: Tue, 12 May 2026 00:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-lts 2/2]
 kernel/sched/idle.c:179: warning: Function parameter or member 'stop_tick'
 not described in 'cpuidle_idle_call'
Message-ID: <202605120013.f0unIcjn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10-lts
head:   386b98b3c152660ef7ed6987b73dad60a922cfd6
commit: 39c0d422f501d8000e9e1257b0783a43bd2249a7 [2/2] sched: idle: Consolidate the handling of two special cases
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260512/202605120013.f0unIcjn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120013.f0unIcjn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120013.f0unIcjn-lkp@intel.com/

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
