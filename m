Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25C8272803
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 04:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765429059; cv=none; b=aKh372FyLyiSzSzr8xjSIYhLNLMr5dJt37Pqr9US/OThF5pwuq3saIHg9ZCyOT81+Mz2H1u5NoKZ6Ia0K+bGbxGGFTIsgqXUlaTWlM5qpJ/AnbwPTHnGtLCEcEneEwc3Mn+pZDmcbj+etvB8BLkdWO5Vj4nB1OFLxJVGEeilis8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765429059; c=relaxed/simple;
	bh=MDFsxle5aDRf4IM1vvy4q90qL8AIjTX5fFYQFk1Ee9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q69b/HwJpSqPTQQVUZTO0+8NgsVyhz+rp+28JQaWRRAyicVBu+P/+SXUW+edKNoptnreicG8AwTfCV69QUgOzI+cIUXeYgiHbTncpK7l2nCtS/cVl7wM59hRD+AaC7+AikURkMWiPhWeOMa4Sty8nK/jXNtrqF4FjbHiMVOKM3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdEeNDpo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdEeNDpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765429058; x=1796965058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDFsxle5aDRf4IM1vvy4q90qL8AIjTX5fFYQFk1Ee9Y=;
  b=CdEeNDpoexBFLr7H3XLXdEht2d3pjuYNq7CdCqpRwf+rzDOZzD0KrFFd
   A97AqJaureImD+p9WKZ2BR8zeQ7vxDCveImiHWQdbAUiHd3nZxxu+lcIY
   pxWBHmTyEVb4SZW72amzdEHNdt7Z6GsncRLiH1KDszLC1MkDTNM0ZHDQ4
   Scfsr5owNjAYT9XuBX89YQ5I1EgFMX5CblRk6q61tTbXQ3LCMEv0UaQUg
   MVws5eILjZ7e/iYJbyI4Sech0d5Cu4N+MX1tBKZq6Sld7lTPnOYiC7JD6
   6NWbgklaCbqAFWANs1HVKLRVG8rL2hSCFoJvuKnIDcKKx0scjJDTjQOlC
   w==;
X-CSE-ConnectionGUID: QJg1UyI2SfGVoLbCqXSiLA==
X-CSE-MsgGUID: 4GHsMmbhT5Wn+192/PtV4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67292940"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67292940"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 20:57:38 -0800
X-CSE-ConnectionGUID: Pw/LhtQFTK+6Uji6UsRBtg==
X-CSE-MsgGUID: sLtyJGKTS0+s5hRZkf1wTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="227760024"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Dec 2025 20:57:35 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTYk9-000000004Ai-0eWQ;
	Thu, 11 Dec 2025 04:57:33 +0000
Date: Thu, 11 Dec 2025 12:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: kernel/time/sched_clock.c:219:13: sparse: sparse: dereference of
 noderef expression
Message-ID: <202512111251.xMUT4l7V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 04257da0c99c9d4ff7c5bb93046482e1f7d34938 hrtimers: Make callback function pointer private
date:   8 months ago
config: arc-randconfig-r122-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111251.xMUT4l7V-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111251.xMUT4l7V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111251.xMUT4l7V-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/sched_clock.c:219:13: sparse: sparse: dereference of noderef expression

vim +219 kernel/time/sched_clock.c

112f38a4a31668e arch/arm/kernel/sched_clock.c Russell King      2010-12-15  176  
32fea568aec5b73 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  177  void __init
32fea568aec5b73 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  178  sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
112f38a4a31668e arch/arm/kernel/sched_clock.c Russell King      2010-12-15  179  {
5ae8aabeaec3fe6 kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  180  	u64 res, wrap, new_mask, new_epoch, cyc, ns;
5ae8aabeaec3fe6 kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  181  	u32 new_mult, new_shift;
2707745533d6d38 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  182  	unsigned long r, flags;
112f38a4a31668e arch/arm/kernel/sched_clock.c Russell King      2010-12-15  183  	char r_unit;
1809bfa44e1019e kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  184  	struct clock_read_data rd;
112f38a4a31668e arch/arm/kernel/sched_clock.c Russell King      2010-12-15  185  
c115739da801ea1 arch/arm/kernel/sched_clock.c Rob Herring       2013-02-08  186  	if (cd.rate > rate)
c115739da801ea1 arch/arm/kernel/sched_clock.c Rob Herring       2013-02-08  187  		return;
c115739da801ea1 arch/arm/kernel/sched_clock.c Rob Herring       2013-02-08  188  
2707745533d6d38 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  189  	/* Cannot register a sched_clock with interrupts on */
2707745533d6d38 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  190  	local_irq_save(flags);
112f38a4a31668e arch/arm/kernel/sched_clock.c Russell King      2010-12-15  191  
32fea568aec5b73 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  192  	/* Calculate the mult/shift to convert counter ticks to ns. */
5ae8aabeaec3fe6 kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  193  	clocks_calc_mult_shift(&new_mult, &new_shift, rate, NSEC_PER_SEC, 3600);
5ae8aabeaec3fe6 kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  194  
5ae8aabeaec3fe6 kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  195  	new_mask = CLOCKSOURCE_MASK(bits);
8710e914027e4f6 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  196  	cd.rate = rate;
5ae8aabeaec3fe6 kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  197  
32fea568aec5b73 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  198  	/* Calculate how many nanosecs until we risk wrapping */
fb82fe2fe858874 kernel/time/sched_clock.c     John Stultz       2015-03-11  199  	wrap = clocks_calc_max_nsecs(new_mult, new_shift, 0, new_mask, NULL);
8710e914027e4f6 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  200  	cd.wrap_kt = ns_to_ktime(wrap);
5ae8aabeaec3fe6 kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  201  
1809bfa44e1019e kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  202  	rd = cd.read_data[0];
1809bfa44e1019e kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  203  
32fea568aec5b73 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  204  	/* Update epoch for new counter and update 'epoch_ns' from old counter*/
5ae8aabeaec3fe6 kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  205  	new_epoch = read();
13dbeb384d2d3aa kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  206  	cyc = cd.actual_read_sched_clock();
32fea568aec5b73 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  207  	ns = rd.epoch_ns + cyc_to_ns((cyc - rd.epoch_cyc) & rd.sched_clock_mask, rd.mult, rd.shift);
13dbeb384d2d3aa kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  208  	cd.actual_read_sched_clock = read;
5ae8aabeaec3fe6 kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  209  
1809bfa44e1019e kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  210  	rd.read_sched_clock	= read;
1809bfa44e1019e kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  211  	rd.sched_clock_mask	= new_mask;
1809bfa44e1019e kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  212  	rd.mult			= new_mult;
1809bfa44e1019e kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  213  	rd.shift		= new_shift;
1809bfa44e1019e kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  214  	rd.epoch_cyc		= new_epoch;
1809bfa44e1019e kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  215  	rd.epoch_ns		= ns;
32fea568aec5b73 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  216  
1809bfa44e1019e kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  217  	update_clock_read_data(&rd);
112f38a4a31668e arch/arm/kernel/sched_clock.c Russell King      2010-12-15  218  
1b8955bc5ac5750 kernel/time/sched_clock.c     David Engraf      2017-02-17 @219  	if (sched_clock_timer.function != NULL) {
1b8955bc5ac5750 kernel/time/sched_clock.c     David Engraf      2017-02-17  220  		/* update timeout for clock wrap */
2c8bd58812ee3db kernel/time/sched_clock.c     Ahmed S. Darwish  2020-03-09  221  		hrtimer_start(&sched_clock_timer, cd.wrap_kt,
2c8bd58812ee3db kernel/time/sched_clock.c     Ahmed S. Darwish  2020-03-09  222  			      HRTIMER_MODE_REL_HARD);
1b8955bc5ac5750 kernel/time/sched_clock.c     David Engraf      2017-02-17  223  	}
1b8955bc5ac5750 kernel/time/sched_clock.c     David Engraf      2017-02-17  224  
112f38a4a31668e arch/arm/kernel/sched_clock.c Russell King      2010-12-15  225  	r = rate;
112f38a4a31668e arch/arm/kernel/sched_clock.c Russell King      2010-12-15  226  	if (r >= 4000000) {
92067440f1311df kernel/time/sched_clock.c     Maciej W. Rozycki 2022-04-24  227  		r = DIV_ROUND_CLOSEST(r, 1000000);
112f38a4a31668e arch/arm/kernel/sched_clock.c Russell King      2010-12-15  228  		r_unit = 'M';
f4b62e1e1137507 kernel/time/sched_clock.c     Maciej W. Rozycki 2022-04-24  229  	} else if (r >= 4000) {
92067440f1311df kernel/time/sched_clock.c     Maciej W. Rozycki 2022-04-24  230  		r = DIV_ROUND_CLOSEST(r, 1000);
112f38a4a31668e arch/arm/kernel/sched_clock.c Russell King      2010-12-15  231  		r_unit = 'k';
32fea568aec5b73 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  232  	} else {
2f0778afac79bd8 arch/arm/kernel/sched_clock.c Marc Zyngier      2011-12-15  233  		r_unit = ' ';
32fea568aec5b73 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  234  	}
112f38a4a31668e arch/arm/kernel/sched_clock.c Russell King      2010-12-15  235  
32fea568aec5b73 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  236  	/* Calculate the ns resolution of this counter */
5ae8aabeaec3fe6 kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  237  	res = cyc_to_ns(1ULL, new_mult, new_shift);
5ae8aabeaec3fe6 kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  238  
a08ca5d1089da03 kernel/time/sched_clock.c     Stephen Boyd      2013-07-18  239  	pr_info("sched_clock: %u bits at %lu%cHz, resolution %lluns, wraps every %lluns\n",
a08ca5d1089da03 kernel/time/sched_clock.c     Stephen Boyd      2013-07-18  240  		bits, r, r_unit, res, wrap);
112f38a4a31668e arch/arm/kernel/sched_clock.c Russell King      2010-12-15  241  
32fea568aec5b73 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  242  	/* Enable IRQ time accounting if we have a fast enough sched_clock() */
a42c362980430be arch/arm/kernel/sched_clock.c Russell King      2012-09-09  243  	if (irqtime > 0 || (irqtime == -1 && rate >= 1000000))
a42c362980430be arch/arm/kernel/sched_clock.c Russell King      2012-09-09  244  		enable_sched_clock_irqtime();
a42c362980430be arch/arm/kernel/sched_clock.c Russell King      2012-09-09  245  
2707745533d6d38 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  246  	local_irq_restore(flags);
2707745533d6d38 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  247  
d75f773c86a2b8b kernel/time/sched_clock.c     Sakari Ailus      2019-03-25  248  	pr_debug("Registered %pS as sched_clock source\n", read);
2f0778afac79bd8 arch/arm/kernel/sched_clock.c Marc Zyngier      2011-12-15  249  }
2f0778afac79bd8 arch/arm/kernel/sched_clock.c Marc Zyngier      2011-12-15  250  

:::::: The code at line 219 was first introduced by commit
:::::: 1b8955bc5ac575009835e371ae55e7f3af2197a9 timers, sched_clock: Update timeout for clock wrap

:::::: TO: David Engraf <david.engraf@sysgo.com>
:::::: CC: John Stultz <john.stultz@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
