Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3984E1DA2A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 22:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EERouLKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704322383; x=1735858383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c9rVaBcxpxwTpJKv2dRlQu+Vbc3JVTEQQqTYSs6+Syw=;
  b=EERouLKoBSvS3Ux3ABLHm6YFCiFp6YWpJLWamtZ0/0kyrzKhbUr9jLui
   MGwojLyRyu7ZfWEAqWReFZWvUHuPzGcYO4EI7pES2Aah3LtPolqr3PnRz
   EY7FQckPSi9olXeufQMn/QeTXQEfg63B7qW0KMn3X8+tqZxYlxO1EIS7X
   2zbFUD7nAfhzGVlVG9qZ7E0dEmTqj1Cf81Gs9f+0fltHuA4EsSebkolxk
   z276uqEURJa40+N6As+8nkHQ1kIpnZW/q+4uKp4nxlutj0CP+z3QqxRQ6
   sulo1Surk3Eqma2pBXer6YOzCP8/6ebYErlIfx0iAgGinZs01ya/gAGXW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="387544387"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="387544387"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 14:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="923712777"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="923712777"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2024 14:53:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLA6d-000MeU-0i;
	Wed, 03 Jan 2024 22:52:59 +0000
Date: Thu, 4 Jan 2024 06:52:45 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 13/15]
 kernel/time/tick-sched.c:1563:9: error: too few arguments to function
 'tick_nohz_activate'
Message-ID: <202401040610.qpOJkfRI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   0597d80e45327e79c48f36f941bad088404dc746
commit: 003b9fd66c1eebaa2d362901c1907fe69e8fe2ca [13/15] tick: Split nohz and highres features from nohz_mode
config: arc-randconfig-002-20240104 (https://download.01.org/0day-ci/archive/20240104/202401040610.qpOJkfRI-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040610.qpOJkfRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040610.qpOJkfRI-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/tick-sched.c: In function 'tick_setup_sched_timer':
>> kernel/time/tick-sched.c:1563:9: error: too few arguments to function 'tick_nohz_activate'
    1563 |         tick_nohz_activate(ts);
         |         ^~~~~~~~~~~~~~~~~~
   kernel/time/tick-sched.c:1509:20: note: declared here
    1509 | static inline void tick_nohz_activate(struct tick_sched *ts, int mode) { }
         |                    ^~~~~~~~~~~~~~~~~~


vim +/tick_nohz_activate +1563 kernel/time/tick-sched.c

  1531	
  1532	/**
  1533	 * tick_setup_sched_timer - setup the tick emulation timer
  1534	 * @mode: tick_nohz_mode to setup for
  1535	 */
  1536	void tick_setup_sched_timer(bool hrtimer)
  1537	{
  1538		struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
  1539	
  1540		/* Emulate tick processing via per-CPU hrtimers: */
  1541		hrtimer_init(&ts->sched_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
  1542		if (hrtimer) {
  1543			tick_sched_flag_set(ts, TS_FLAG_HIGHRES);
  1544			ts->sched_timer.function = tick_nohz_highres_handler;
  1545		}
  1546	
  1547		/* Get the next period (per-CPU) */
  1548		hrtimer_set_expires(&ts->sched_timer, tick_init_jiffy_update());
  1549	
  1550		/* Offset the tick to avert 'jiffies_lock' contention. */
  1551		if (sched_skew_tick) {
  1552			u64 offset = TICK_NSEC >> 1;
  1553			do_div(offset, num_possible_cpus());
  1554			offset *= smp_processor_id();
  1555			hrtimer_add_expires_ns(&ts->sched_timer, offset);
  1556		}
  1557	
  1558		hrtimer_forward_now(&ts->sched_timer, TICK_NSEC);
  1559		if (hrtimer)
  1560			hrtimer_start_expires(&ts->sched_timer, HRTIMER_MODE_ABS_PINNED_HARD);
  1561		else
  1562			tick_program_event(hrtimer_get_expires(&ts->sched_timer), 1);
> 1563		tick_nohz_activate(ts);
  1564	}
  1565	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
