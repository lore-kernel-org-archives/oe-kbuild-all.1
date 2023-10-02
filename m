Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7662C2C0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696239235; x=1727775235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tXhzcRlDo1Bh8wR7BGX7MNKgGcZplPRkZEYCfRMpLBA=;
  b=PGeXsoch7yLkkZWoR/OTO4nQZvP8v3/BJWvwxknVmItiLbe3tIXj+vUe
   ZsPUXFRRgU1sxpkyb6+U0SNhkjK37FhC4RjhB6iI92w+Nj+bVh7Lq9xIX
   9hKr0pPdMmqPQNMaF0yzdJXgEUZqG+6V1XSqtRPUvAggwBMLBbJods8r5
   p/1chJ5fbW2OQgUMYE4hxAgl7LEsg2kWaofBJHMMeiE9VhS5h23FGft+r
   sXfElLKn2VS3oESoFmHAqaRVFa27x0w3rk2tVlZRrFCht7fBciWC6wqeW
   SJFvf9IZ3FWhjOpHXj+S02Baz1pzkPIJM/H+5nU+mfGgxL9Aj0RgrP1BE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="361987248"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="361987248"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 02:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="997573352"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="997573352"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2023 02:33:46 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnFJA-0005v7-08;
	Mon, 02 Oct 2023 09:33:44 +0000
Date: Mon, 2 Oct 2023 17:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Lindgren <tony@atomide.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: drivers/clocksource/timer-ti-dm.c:82: warning: Function parameter or
 member 'val' not described in 'dmtimer_write'
Message-ID: <202310021747.wKAwfhnx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tony,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
commit: 49cd16bb573e43dc2ee64d734b9b545475dbb35f clocksource/drivers/timer-ti-dm: Simplify register writes with dmtimer_write()
date:   1 year ago
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231002/202310021747.wKAwfhnx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310021747.wKAwfhnx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310021747.wKAwfhnx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clocksource/timer-ti-dm.c:82: warning: Function parameter or member 'val' not described in 'dmtimer_write'
>> drivers/clocksource/timer-ti-dm.c:82: warning: Excess function parameter 'value' description in 'dmtimer_write'


vim +82 drivers/clocksource/timer-ti-dm.c

41e79b1d458477 Tony Lindgren 2022-04-08  70  
49cd16bb573e43 Tony Lindgren 2022-08-15  71  /**
49cd16bb573e43 Tony Lindgren 2022-08-15  72   * dmtimer_write - write timer registers in posted and non-posted mode
49cd16bb573e43 Tony Lindgren 2022-08-15  73   * @timer:      timer pointer over which write operation is to perform
49cd16bb573e43 Tony Lindgren 2022-08-15  74   * @reg:        lowest byte holds the register offset
49cd16bb573e43 Tony Lindgren 2022-08-15  75   * @value:      data to write into the register
49cd16bb573e43 Tony Lindgren 2022-08-15  76   *
49cd16bb573e43 Tony Lindgren 2022-08-15  77   * The posted mode bit is encoded in reg. Note that in posted mode, the write
49cd16bb573e43 Tony Lindgren 2022-08-15  78   * pending bit must be checked. Otherwise a write on a register which has a
49cd16bb573e43 Tony Lindgren 2022-08-15  79   * pending write will be lost.
49cd16bb573e43 Tony Lindgren 2022-08-15  80   */
49cd16bb573e43 Tony Lindgren 2022-08-15  81  static inline void dmtimer_write(struct omap_dm_timer *timer, u32 reg, u32 val)
41e79b1d458477 Tony Lindgren 2022-04-08 @82  {
49cd16bb573e43 Tony Lindgren 2022-08-15  83  	u16 wp, offset;
49cd16bb573e43 Tony Lindgren 2022-08-15  84  
49cd16bb573e43 Tony Lindgren 2022-08-15  85  	wp = reg >> WPSHIFT;
49cd16bb573e43 Tony Lindgren 2022-08-15  86  	offset = reg & 0xff;
49cd16bb573e43 Tony Lindgren 2022-08-15  87  
49cd16bb573e43 Tony Lindgren 2022-08-15  88  	/* Wait for a possible write pending bit in posted mode */
49cd16bb573e43 Tony Lindgren 2022-08-15  89  	if (wp && timer->posted)
49cd16bb573e43 Tony Lindgren 2022-08-15  90  		while (readl_relaxed(timer->pend) & wp)
41e79b1d458477 Tony Lindgren 2022-04-08  91  			cpu_relax();
41e79b1d458477 Tony Lindgren 2022-04-08  92  
49cd16bb573e43 Tony Lindgren 2022-08-15  93  	writel_relaxed(val, timer->func_base + offset);
41e79b1d458477 Tony Lindgren 2022-04-08  94  }
41e79b1d458477 Tony Lindgren 2022-04-08  95  

:::::: The code at line 82 was first introduced by commit
:::::: 41e79b1d458477212d0a880c87622bcaa69ab3ea clocksource/drivers/timer-ti-dm: Move inline functions to driver for am6

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
