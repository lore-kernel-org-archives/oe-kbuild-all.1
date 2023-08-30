Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BFA10EE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 06:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693377373; x=1724913373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZuaZ6UZTEFJAcLU22uyaJT6hI93ievaSj2mOII2ZIJQ=;
  b=KgC5r9c+eFMvGqnGrQHus3pDith7ofesP0vhdxXbUKMCEy72+G4QsSfw
   16Y/g7qUS5tBCEvqrb3KYaXZFhTUNW5DCn5M4/oIfg1BT41DfUMAYvX5h
   +Pneh0wsZNeCXe3Vf9qcgLO6XamQIMwUw2xz1JocUq2Zz+lo4a4luH5jY
   Ffj1d/d5u4CFnPV66RsxGch9uN/Cu8u1HCokAD2ZeTiZbO7rsk0fEQyjR
   iNlWPS4ke4zhlc/I1Mec+EW+5yE3kmkCZyvJyQwVYUNVIRljgBhAkuHd0
   o+hcEukQ/px9g87C2atZJsFvkBXDWQ1nxWjqf0/t1AQK6xwmo5xCftDSl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406560073"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="406560073"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 23:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912678434"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="912678434"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Aug 2023 23:36:10 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbEoE-0009W1-0D;
	Wed, 30 Aug 2023 06:36:10 +0000
Date: Wed, 30 Aug 2023 14:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 34/46] mm/damon/core.c:1622:14: warning: no previous
 prototype for 'damon_moving_average'
Message-ID: <202308301445.rW2NJlWP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   15d82784a3f9e2e8a4c635de097a86ddc744845d
commit: 567e50270a93eccf0faaef76ec6e5443d7adb4b0 [34/46] mm/damon/core: implement a pseudo-moving average calculation function
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308301445.rW2NJlWP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301445.rW2NJlWP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301445.rW2NJlWP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.c:1622:14: warning: no previous prototype for 'damon_moving_average' [-Wmissing-prototypes]
    1622 | unsigned int damon_moving_average(unsigned int mvavg, unsigned int new_value,
         |              ^~~~~~~~~~~~~~~~~~~~


vim +/damon_moving_average +1622 mm/damon/core.c

  1600	
  1601	/*
  1602	 * damon_moving_average() - Calculate a pseudo-moving average value.
  1603	 * @mvavg:	Current value of the pseudo moving average.
  1604	 * @new_value:	New value that will be added to the pseudo moving average.
  1605	 * @len_widnow:	The length of the window of the moving average.
  1606	 *
  1607	 * Moving average is good for handling noise, but the cost of keeping the past
  1608	 * window values can be high for arbitrary window size.  This function
  1609	 * implements a lightweight pseudo moving average function that doesn't keep
  1610	 * the past window values.
  1611	 *
  1612	 * It simply assumes there was no noise in the past.  For example, if the
  1613	 * window length is 10 and current moving average value is 5, the last 10
  1614	 * values for the last window could be vary, e.g., 0, 10, 0, 10, 0, 10, 0, 10,
  1615	 * 0, 10.  This function simply assumes it got value 5 for each of the last ten
  1616	 * times.  Based on the assumption, when the next value is measured, it drops
  1617	 * 5/10 from the average value and add the new value divided by the window
  1618	 * length to get the updated pseduo-moving average.
  1619	 *
  1620	 * Return: Pseudo-moving average after getting the @new_value.
  1621	 */
> 1622	unsigned int damon_moving_average(unsigned int mvavg, unsigned int new_value,
  1623			unsigned int len_window)
  1624	{
  1625		return mvavg - mvavg / len_window + new_value / len_window;
  1626	}
  1627	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
