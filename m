Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0DE1EB2D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 23:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/4vsyHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704323653; x=1735859653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=plZeIuxXcjQXBMXLXjnZ6OH4NEKvQkKInLKFmsSo5Jw=;
  b=P/4vsyHrRJ+xSIOu+kTPwwpSqkwXIigWuqqI09x+Xq7iljB94+5SmZHT
   EO3NCEotAJTnKKOWYup212+WT+GkMY5urN+BcEgfst4tVT5sS+Syeatuw
   wCJebCChqoNvzDw9vOcsoSaICgbNMhnLLbmBVd4ahekjqe4BfJM3ZNKXf
   KI5wzW+bxPndDSuXs1sYalON632bWXG36V7NyCUBbIhtbZPOgHMpsSilf
   BF2f0tTCxaM0VK1soMh8kJ/CfcqsQ74gkSLWXSibAkc+0r2w3u/1SsL6B
   Hq/+qFGjZ/3Cu50iTg2SkUHvCcevcE/jJiD5Q6TvhVThgzRbsToL63Zu8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="483264857"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="483264857"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 15:14:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
   d="scan'208";a="22255549"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jan 2024 15:14:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLAQx-000Mfm-32;
	Wed, 03 Jan 2024 23:13:59 +0000
Date: Thu, 4 Jan 2024 07:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 13/15] kernel/time/tick-sched.c:1537:
 warning: Function parameter or member 'hrtimer' not described in
 'tick_setup_sched_timer'
Message-ID: <202401040712.LqLl1lS1-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240104/202401040712.LqLl1lS1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040712.LqLl1lS1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040712.LqLl1lS1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/tick-sched.c:702: warning: Function parameter or member 'now' not described in 'tick_nohz_update_jiffies'
   kernel/time/tick-sched.c:1333: warning: Function parameter or member 'cpu' not described in 'tick_nohz_get_idle_calls_cpu'
>> kernel/time/tick-sched.c:1537: warning: Function parameter or member 'hrtimer' not described in 'tick_setup_sched_timer'
>> kernel/time/tick-sched.c:1537: warning: Excess function parameter 'mode' description in 'tick_setup_sched_timer'


vim +1537 kernel/time/tick-sched.c

62cf20b32aee4a Thomas Gleixner           2012-05-25  1531  
79bf2bb335b85d Thomas Gleixner           2007-02-16  1532  /**
79bf2bb335b85d Thomas Gleixner           2007-02-16  1533   * tick_setup_sched_timer - setup the tick emulation timer
b95366bab40852 Peng Liu                  2023-11-29  1534   * @mode: tick_nohz_mode to setup for
79bf2bb335b85d Thomas Gleixner           2007-02-16  1535   */
003b9fd66c1eeb Frederic Weisbecker       2024-01-02  1536  void tick_setup_sched_timer(bool hrtimer)
79bf2bb335b85d Thomas Gleixner           2007-02-16 @1537  {
22127e93c587af Christoph Lameter         2014-08-17  1538  	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
79bf2bb335b85d Thomas Gleixner           2007-02-16  1539  
6c774377359923 Ingo Molnar               2023-09-28  1540  	/* Emulate tick processing via per-CPU hrtimers: */
902a9f9c509053 Sebastian Andrzej Siewior 2019-07-26  1541  	hrtimer_init(&ts->sched_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_HARD);
003b9fd66c1eeb Frederic Weisbecker       2024-01-02  1542  	if (hrtimer) {
003b9fd66c1eeb Frederic Weisbecker       2024-01-02  1543  		tick_sched_flag_set(ts, TS_FLAG_HIGHRES);
dba428a678c726 Frederic Weisbecker       2023-09-12  1544  		ts->sched_timer.function = tick_nohz_highres_handler;
003b9fd66c1eeb Frederic Weisbecker       2024-01-02  1545  	}
79bf2bb335b85d Thomas Gleixner           2007-02-16  1546  
0de7611a1031f2 Ingo Molnar               2016-07-01  1547  	/* Get the next period (per-CPU) */
cc584b213f252b Arjan van de Ven          2008-09-01  1548  	hrtimer_set_expires(&ts->sched_timer, tick_init_jiffy_update());
79bf2bb335b85d Thomas Gleixner           2007-02-16  1549  
6c774377359923 Ingo Molnar               2023-09-28  1550  	/* Offset the tick to avert 'jiffies_lock' contention. */
5307c9556bc17e Mike Galbraith            2012-05-08  1551  	if (sched_skew_tick) {
b9965449164299 Thomas Gleixner           2020-11-17  1552  		u64 offset = TICK_NSEC >> 1;
5307c9556bc17e Mike Galbraith            2012-05-08  1553  		do_div(offset, num_possible_cpus());
5307c9556bc17e Mike Galbraith            2012-05-08  1554  		offset *= smp_processor_id();
5307c9556bc17e Mike Galbraith            2012-05-08  1555  		hrtimer_add_expires_ns(&ts->sched_timer, offset);
5307c9556bc17e Mike Galbraith            2012-05-08  1556  	}
5307c9556bc17e Mike Galbraith            2012-05-08  1557  
b95366bab40852 Peng Liu                  2023-11-29  1558  	hrtimer_forward_now(&ts->sched_timer, TICK_NSEC);
003b9fd66c1eeb Frederic Weisbecker       2024-01-02  1559  	if (hrtimer)
902a9f9c509053 Sebastian Andrzej Siewior 2019-07-26  1560  		hrtimer_start_expires(&ts->sched_timer, HRTIMER_MODE_ABS_PINNED_HARD);
b95366bab40852 Peng Liu                  2023-11-29  1561  	else
b95366bab40852 Peng Liu                  2023-11-29  1562  		tick_program_event(hrtimer_get_expires(&ts->sched_timer), 1);
003b9fd66c1eeb Frederic Weisbecker       2024-01-02  1563  	tick_nohz_activate(ts);
79bf2bb335b85d Thomas Gleixner           2007-02-16  1564  }
79bf2bb335b85d Thomas Gleixner           2007-02-16  1565  

:::::: The code at line 1537 was first introduced by commit
:::::: 79bf2bb335b85db25d27421c798595a2fa2a0e82 [PATCH] tick-management: dyntick / highres functionality

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
