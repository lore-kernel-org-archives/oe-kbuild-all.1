Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE5E6A031
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714846308; cv=none; b=qKpzc+mJw5zaX099wXc6M2zWYyD5N3hxm7BdK9SBqYIEzwiJj3JRxQCdPDejrXs4QFGiHG8SGQWfGzt2j5Ekrt5C9p6gJlv2/5SU1IGPZ4CTgPDO+RcixUQ4apYSxJwQ7ANVZZHuNNV5k0EMJUodnzfHjq7LSbGF74Jg8cLGKIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714846308; c=relaxed/simple;
	bh=kSX14u98PuraA6JYu9s6f7q0SI88g3OncA+DZqKpJms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q67Bs4VI3rkBWyMI8RMPSC2gtCQugPLtcl4qVCZin7M/65NcGDfh6SF4OFNH3ok8SFmquaPf1TauQzxbAK8pMQ1NJKTLrSzgSZMw0f5p8PTa4zv0msYP7JirWvz+I6jaqGEfb/KM97fMqUWxMhGs55pSbiooUu6Mafs7PKsAN5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZIxKtGF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZIxKtGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714846307; x=1746382307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kSX14u98PuraA6JYu9s6f7q0SI88g3OncA+DZqKpJms=;
  b=BZIxKtGFfJAWrXbi5p6JL2/FX/ydyujI3IWVhuL9YdKye+tHaNoTQKA8
   77uaN7+EkkYLVaiypKWRTRfM61lI7iwofA7QhpOtVXAOkag/F9hJAQtbb
   CBXyYRq17iYUSJjo5UStOaUr/hEuIUWzTNnTxCSyOrWNrqfjfrvjfeZSO
   8UKovfx3ErwPZr9ZqoQl9jsdI6xeKuONW2gBWt0PMUtCkhs44TNBfhG5a
   I8GwFfOjZSRWyomG0pTmSGCCagEiOX9JZEPZKS94AT3FkBElW0rnLcZMc
   juzr0pb8Xm+OVjJyvv+AL2lOwjtCb2Xt1L2ZJ9/xccMYyiy9+TVE4N0Yd
   A==;
X-CSE-ConnectionGUID: PyeWEfVSQPaO3zTHqxvDiw==
X-CSE-MsgGUID: m7kr4VqtSuKDNgsatpToxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21251089"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="21251089"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 11:11:44 -0700
X-CSE-ConnectionGUID: nxcQyc5GR8OmAtPeSl5oUw==
X-CSE-MsgGUID: 63a4BMYJRWyDIKddpCNehQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="32563475"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 May 2024 11:11:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3JrI-000D3H-1C;
	Sat, 04 May 2024 18:11:40 +0000
Date: Sun, 5 May 2024 02:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm-ppc@vger.kernel.org
Subject: [agraf-2.6:kvm-kho-gmem-test 25/27]
 kernel/time/sched_clock.c:166:50: warning: variable 'ns' set but not used
Message-ID: <202405050234.5uAIYHNR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/agraf/linux-2.6.git kvm-kho-gmem-test
head:   9a58862a298a63bad21d05191e28b857063bb9dc
commit: 85a88d907dbaefe323ceb6c077042b1149a93de9 [25/27] XXX Make ARM clock contiguous across kexec
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240505/202405050234.5uAIYHNR-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050234.5uAIYHNR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050234.5uAIYHNR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/sched_clock.c: In function 'sched_clock_register':
>> kernel/time/sched_clock.c:166:50: warning: variable 'ns' set but not used [-Wunused-but-set-variable]
     166 |         u64 res, wrap, new_mask, new_epoch, cyc, ns;
         |                                                  ^~
>> kernel/time/sched_clock.c:166:34: warning: variable 'new_epoch' set but not used [-Wunused-but-set-variable]
     166 |         u64 res, wrap, new_mask, new_epoch, cyc, ns;
         |                                  ^~~~~~~~~


vim +/ns +166 kernel/time/sched_clock.c

112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  162  
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  163  void __init
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  164  sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  165  {
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17 @166  	u64 res, wrap, new_mask, new_epoch, cyc, ns;
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  167  	u32 new_mult, new_shift;
2707745533d6d3 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  168  	unsigned long r, flags;
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  169  	char r_unit;
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  170  	struct clock_read_data rd;
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  171  
c115739da801ea arch/arm/kernel/sched_clock.c Rob Herring       2013-02-08  172  	if (cd.rate > rate)
c115739da801ea arch/arm/kernel/sched_clock.c Rob Herring       2013-02-08  173  		return;
c115739da801ea arch/arm/kernel/sched_clock.c Rob Herring       2013-02-08  174  
2707745533d6d3 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  175  	/* Cannot register a sched_clock with interrupts on */
2707745533d6d3 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  176  	local_irq_save(flags);
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  177  
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  178  	/* Calculate the mult/shift to convert counter ticks to ns. */
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  179  	clocks_calc_mult_shift(&new_mult, &new_shift, rate, NSEC_PER_SEC, 3600);
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  180  
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  181  	new_mask = CLOCKSOURCE_MASK(bits);
8710e914027e4f kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  182  	cd.rate = rate;
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  183  
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  184  	/* Calculate how many nanosecs until we risk wrapping */
fb82fe2fe85887 kernel/time/sched_clock.c     John Stultz       2015-03-11  185  	wrap = clocks_calc_max_nsecs(new_mult, new_shift, 0, new_mask, NULL);
8710e914027e4f kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  186  	cd.wrap_kt = ns_to_ktime(wrap);
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  187  
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  188  	rd = cd.read_data[0];
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  189  
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  190  	/* Update epoch for new counter and update 'epoch_ns' from old counter*/
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  191  	new_epoch = read();
13dbeb384d2d3a kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  192  	cyc = cd.actual_read_sched_clock();
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  193  	ns = rd.epoch_ns + cyc_to_ns((cyc - rd.epoch_cyc) & rd.sched_clock_mask, rd.mult, rd.shift);
13dbeb384d2d3a kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  194  	cd.actual_read_sched_clock = read;
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  195  
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  196  	rd.read_sched_clock	= read;
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  197  	rd.sched_clock_mask	= new_mask;
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  198  	rd.mult			= new_mult;
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  199  	rd.shift		= new_shift;
85a88d907dbaef kernel/time/sched_clock.c     Alexander Graf    2024-04-30  200  	rd.epoch_cyc		= 0; //new_epoch;
85a88d907dbaef kernel/time/sched_clock.c     Alexander Graf    2024-04-30  201  	rd.epoch_ns		= 0; //ns;
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  202  
1809bfa44e1019 kernel/time/sched_clock.c     Daniel Thompson   2015-03-26  203  	update_clock_read_data(&rd);
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  204  
1b8955bc5ac575 kernel/time/sched_clock.c     David Engraf      2017-02-17  205  	if (sched_clock_timer.function != NULL) {
1b8955bc5ac575 kernel/time/sched_clock.c     David Engraf      2017-02-17  206  		/* update timeout for clock wrap */
2c8bd58812ee3d kernel/time/sched_clock.c     Ahmed S. Darwish  2020-03-09  207  		hrtimer_start(&sched_clock_timer, cd.wrap_kt,
2c8bd58812ee3d kernel/time/sched_clock.c     Ahmed S. Darwish  2020-03-09  208  			      HRTIMER_MODE_REL_HARD);
1b8955bc5ac575 kernel/time/sched_clock.c     David Engraf      2017-02-17  209  	}
1b8955bc5ac575 kernel/time/sched_clock.c     David Engraf      2017-02-17  210  
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  211  	r = rate;
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  212  	if (r >= 4000000) {
92067440f1311d kernel/time/sched_clock.c     Maciej W. Rozycki 2022-04-24  213  		r = DIV_ROUND_CLOSEST(r, 1000000);
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  214  		r_unit = 'M';
f4b62e1e113750 kernel/time/sched_clock.c     Maciej W. Rozycki 2022-04-24  215  	} else if (r >= 4000) {
92067440f1311d kernel/time/sched_clock.c     Maciej W. Rozycki 2022-04-24  216  		r = DIV_ROUND_CLOSEST(r, 1000);
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  217  		r_unit = 'k';
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  218  	} else {
2f0778afac79bd arch/arm/kernel/sched_clock.c Marc Zyngier      2011-12-15  219  		r_unit = ' ';
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  220  	}
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  221  
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  222  	/* Calculate the ns resolution of this counter */
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  223  	res = cyc_to_ns(1ULL, new_mult, new_shift);
5ae8aabeaec3fe kernel/time/sched_clock.c     Stephen Boyd      2014-02-17  224  
a08ca5d1089da0 kernel/time/sched_clock.c     Stephen Boyd      2013-07-18  225  	pr_info("sched_clock: %u bits at %lu%cHz, resolution %lluns, wraps every %lluns\n",
a08ca5d1089da0 kernel/time/sched_clock.c     Stephen Boyd      2013-07-18  226  		bits, r, r_unit, res, wrap);
112f38a4a31668 arch/arm/kernel/sched_clock.c Russell King      2010-12-15  227  
32fea568aec5b7 kernel/time/sched_clock.c     Ingo Molnar       2015-03-27  228  	/* Enable IRQ time accounting if we have a fast enough sched_clock() */
a42c362980430b arch/arm/kernel/sched_clock.c Russell King      2012-09-09  229  	if (irqtime > 0 || (irqtime == -1 && rate >= 1000000))
a42c362980430b arch/arm/kernel/sched_clock.c Russell King      2012-09-09  230  		enable_sched_clock_irqtime();
a42c362980430b arch/arm/kernel/sched_clock.c Russell King      2012-09-09  231  
2707745533d6d3 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  232  	local_irq_restore(flags);
2707745533d6d3 kernel/time/sched_clock.c     Paul Cercueil     2020-01-07  233  
d75f773c86a2b8 kernel/time/sched_clock.c     Sakari Ailus      2019-03-25  234  	pr_debug("Registered %pS as sched_clock source\n", read);
2f0778afac79bd arch/arm/kernel/sched_clock.c Marc Zyngier      2011-12-15  235  }
2f0778afac79bd arch/arm/kernel/sched_clock.c Marc Zyngier      2011-12-15  236  

:::::: The code at line 166 was first introduced by commit
:::::: 5ae8aabeaec3fe69c4fb21cbe5b17b72b35b5892 sched_clock: Prevent callers from seeing half-updated data

:::::: TO: Stephen Boyd <sboyd@codeaurora.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
