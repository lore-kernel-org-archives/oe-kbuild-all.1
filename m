Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2543816FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295267; cv=none; b=VgR0Lf0Z5phPSERI2CAHmHU2hzSzHRpW7nxHuUwv4wH4HeO68SQYlGXgU0xI6WpBhHLzALy61Cyvv4jGUwcwxjT7j1big40a3wlji/KaUenr3oviYewdL9QEyP5UXxxuL3IJfclyuWwOYOGSWs9tKc166T0v/++d4935YDWsyWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295267; c=relaxed/simple;
	bh=5N8tHKhfU7fGPpnC1P/wzUmdhvgVCt1FFzJKTKISGkQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mXR6+2D9/n0nl6zZdpVEF3UDPxU1YzeYSt9hFSh+3hI7bUSPGw7mB73GOGTwwErJvY3gsBySkuDkByvypxNcdxo06aJSaA+YEBIJOcp0oCyY0Apgc2humvRRQjHHh5/rfMw4VUY42m4ijE0fJwWkBBFi+PIvGd4kArTi9hMi1CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eO6XT+Tn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eO6XT+Tn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768295265; x=1799831265;
  h=date:from:to:cc:subject:message-id;
  bh=5N8tHKhfU7fGPpnC1P/wzUmdhvgVCt1FFzJKTKISGkQ=;
  b=eO6XT+TnQiw5rCMicFURLxIyKuZuFq8k+cSU8BMcxdzOQZkuh8jknTYR
   TSnk4ejqlaZIYWGUKuRh6uV1+ByDobWi+7iM/DrSDEW45ISBwrIGlgxYB
   MQ4pRbvZDGLIOvsan5JdqKCbZiswZLP//pErfNhbPS0jUnQC/0ubHasYD
   cxjMAVPjjakeHkzMY+/fFeZ9lnh+rYwumhZrZYVeCFB2stsXU6mVf2cZs
   mtHcn5RoVd6XqTs/ofQ6nOwTJXfnyKLWkprCsp96J7tk/LL40a0PGshh3
   920VVLtIgdSQ3uoNk6Ew27KYhNuDJCZwRpLJ5I7s+662vnIL0SLvoIJOd
   g==;
X-CSE-ConnectionGUID: bBDT5IpRTSWlJ5hJs5mubA==
X-CSE-MsgGUID: qoftNi4fRKSTwT/dUiISLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69558942"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69558942"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 01:07:43 -0800
X-CSE-ConnectionGUID: DpC3NIXTQNCorpITh/0vIg==
X-CSE-MsgGUID: MeNYv0fXQIOEa5JqP/xGnw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 01:07:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfaNG-00000000EVi-36b0;
	Tue, 13 Jan 2026 09:07:38 +0000
Date: Tue, 13 Jan 2026 17:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: kernel/time/sched_clock.c:219:13: sparse: sparse:
 dereference of noderef expression
Message-ID: <202601131713.KsxhXQ0M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 04257da0c99c9d4ff7c5bb93046482e1f7d34938 hrtimers: Make callback function pointer private
date:   9 months ago
config: arm64-randconfig-r121-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131713.KsxhXQ0M-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131713.KsxhXQ0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131713.KsxhXQ0M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/sched_clock.c:219:13: sparse: sparse: dereference of noderef expression

vim +219 kernel/time/sched_clock.c

112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  176  
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  177  void __init
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  178  sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  179  {
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  180  	u64 res, wrap, new_mask, new_epoch, cyc, ns;
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  181  	u32 new_mult, new_shift;
2707745533d6d3 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  182  	unsigned long r, flags;
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  183  	char r_unit;
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  184  	struct clock_read_data rd;
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  185  
c115739da801ea arch/arm/kernel/sched_clock.c Rob Herring       2013-02-08  186  	if (cd.rate > rate)
c115739da801ea arch/arm/kernel/sched_clock.c Rob Herring       2013-02-08  187  		return;
c115739da801ea arch/arm/kernel/sched_clock.c Rob Herring       2013-02-08  188  
2707745533d6d3 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  189  	/* Cannot register a sched_clock with interrupts on */
2707745533d6d3 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  190  	local_irq_save(flags);
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  191  
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  192  	/* Calculate the mult/shift to convert counter ticks to ns. */
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  193  	clocks_calc_mult_shift(&new_mult, &new_shift, rate, NSEC_PER_SEC, 3600);
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  194  
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  195  	new_mask = CLOCKSOURCE_MASK(bits);
8710e914027e4f kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  196  	cd.rate = rate;
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  197  
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  198  	/* Calculate how many nanosecs until we risk wrapping */
fb82fe2fe85887 kernel/time/sched_clock.c     John Stultz       2015-03-11  199  	wrap = clocks_calc_max_nsecs(new_mult, new_shift, 0, new_mask, NULL);
8710e914027e4f kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  200  	cd.wrap_kt = ns_to_ktime(wrap);
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  201  
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  202  	rd = cd.read_data[0];
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  203  
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  204  	/* Update epoch for new counter and update 'epoch_ns' from old counter*/
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  205  	new_epoch = read();
13dbeb384d2d3a kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  206  	cyc = cd.actual_read_sched_clock();
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  207  	ns = rd.epoch_ns + cyc_to_ns((cyc - rd.epoch_cyc) & rd.sched_clock_mask, rd.mult, rd.shift);
13dbeb384d2d3a kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  208  	cd.actual_read_sched_clock = read;
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  209  
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  210  	rd.read_sched_clock	= read;
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  211  	rd.sched_clock_mask	= new_mask;
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  212  	rd.mult			= new_mult;
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  213  	rd.shift		= new_shift;
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  214  	rd.epoch_cyc		= new_epoch;
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  215  	rd.epoch_ns		= ns;
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  216  
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  217  	update_clock_read_data(&rd);
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  218  
1b8955bc5ac575 kernel/time/sched_clock.c     David Engraf      2017-02-17 @219  	if (sched_clock_timer.function != NULL) {
1b8955bc5ac575 kernel/time/sched_clock.c     David Engraf      2017-02-17  220  		/* update timeout for clock wrap */
2c8bd58812ee3d kernel/time/sched_clock.c     Ahmed S. Darwish  2020-03-09  221  		hrtimer_start(&sched_clock_timer, cd.wrap_kt,
2c8bd58812ee3d kernel/time/sched_clock.c     Ahmed S. Darwish  2020-03-09  222  			      HRTIMER_MODE_REL_HARD);
1b8955bc5ac575 kernel/time/sched_clock.c     David Engraf      2017-02-17  223  	}
1b8955bc5ac575 kernel/time/sched_clock.c     David Engraf      2017-02-17  224  
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  225  	r = rate;
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  226  	if (r >= 4000000) {
92067440f1311d kernel/time/sched_clock.c     Maciej W. Rozycki 2022-04-24  227  		r = DIV_ROUND_CLOSEST(r, 1000000);
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  228  		r_unit = 'M';
f4b62e1e113750 kernel/time/sched_clock.c     Maciej W. Rozycki 2022-04-24  229  	} else if (r >= 4000) {
92067440f1311d kernel/time/sched_clock.c     Maciej W. Rozycki 2022-04-24  230  		r = DIV_ROUND_CLOSEST(r, 1000);
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  231  		r_unit = 'k';
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  232  	} else {
2f0778afac79bd arch/arm/kernel/sched_clock.c Marc Zyngier      2011-12-15  233  		r_unit = ' ';
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  234  	}
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  235  
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  236  	/* Calculate the ns resolution of this counter */
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  237  	res = cyc_to_ns(1ULL, new_mult, new_shift);
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  238  
a08ca5d1089da0 kernel/time/sched_clock.c     Stephen Boyd      2013-07-18  239  	pr_info("sched_clock: %u bits at %lu%cHz, resolution %lluns, wraps every %lluns\n",
a08ca5d1089da0 kernel/time/sched_clock.c     Stephen Boyd      2013-07-18  240  		bits, r, r_unit, res, wrap);
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  241  
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  242  	/* Enable IRQ time accounting if we have a fast enough sched_clock() */
a42c362980430b arch/arm/kernel/sched_clock.c Russell King      2012-09-09  243  	if (irqtime > 0 || (irqtime == -1 && rate >= 1000000))
a42c362980430b arch/arm/kernel/sched_clock.c Russell King      2012-09-09  244  		enable_sched_clock_irqtime();
a42c362980430b arch/arm/kernel/sched_clock.c Russell King      2012-09-09  245  
2707745533d6d3 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  246  	local_irq_restore(flags);
2707745533d6d3 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  247  
d75f773c86a2b8 kernel/time/sched_clock.c     Sakari Ailus      2019-03-25  248  	pr_debug("Registered %pS as sched_clock source\n", read);
2f0778afac79bd arch/arm/kernel/sched_clock.c Marc Zyngier      2011-12-15  249  }
2f0778afac79bd arch/arm/kernel/sched_clock.c Marc Zyngier      2011-12-15  250  

:::::: The code at line 219 was first introduced by commit
:::::: 1b8955bc5ac575009835e371ae55e7f3af2197a9 timers, sched_clock: Update timeout for clock wrap

:::::: TO: David Engraf <david.engraf@sysgo.com>
:::::: CC: John Stultz <john.stultz@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
