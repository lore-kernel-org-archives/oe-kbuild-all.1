Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6BF23762
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 20:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBkBQvpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699043755; x=1730579755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fKAsYhrHKSpr69L5ydbmu9t1v9UJxzxdZxUAlwhfxDE=;
  b=bBkBQvpBWZb2CnZkiY0zP3S5IFQ6+Km26LZg4NKCjpbTiVey5QhZ3YE/
   AiGrrFK5WOJKtxWlLsk1ePr91Dp9cbWC1Vlkmej5mwmDnu8tKHi7nuYOB
   1ODEm19a2s5wvb7DqwMR3XkVphAtjCQ389Bv6ZzpRvk/SMB02Kay5DuSU
   3Dv36ZretlLa+NtU7UDVu2BDuUNS4URHg/VhhO9oRWKEczni54sssC3mx
   f3ETtWlFUd6DPpcN+vEIwl4RVm5CWrZg9PXxaKetL3sDnoCYuJycPTdtl
   zIq2QdJBrv3S9TfB2NkX+sBUNFrvWBU3bzM5kp6jxGYHw9n43yJpf5Y/3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="455506732"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="455506732"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 13:35:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="905453024"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="905453024"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Nov 2023 13:35:51 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz0tR-0002vA-27;
	Fri, 03 Nov 2023 20:35:49 +0000
Date: Sat, 4 Nov 2023 04:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Lindgren <tony@atomide.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: drivers/clocksource/timer-ti-dm.c:82: warning: Excess function
 parameter 'value' description in 'dmtimer_write'
Message-ID: <202311040403.DzIiBuwU-lkp@intel.com>
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
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: 49cd16bb573e43dc2ee64d734b9b545475dbb35f clocksource/drivers/timer-ti-dm: Simplify register writes with dmtimer_write()
date:   1 year, 1 month ago
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311040403.DzIiBuwU-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040403.DzIiBuwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040403.DzIiBuwU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clocksource/timer-ti-dm.c:82: warning: Function parameter or member 'val' not described in 'dmtimer_write'
>> drivers/clocksource/timer-ti-dm.c:82: warning: Excess function parameter 'value' description in 'dmtimer_write'


vim +82 drivers/clocksource/timer-ti-dm.c

41e79b1d4584772 Tony Lindgren 2022-04-08  70  
49cd16bb573e43d Tony Lindgren 2022-08-15  71  /**
49cd16bb573e43d Tony Lindgren 2022-08-15  72   * dmtimer_write - write timer registers in posted and non-posted mode
49cd16bb573e43d Tony Lindgren 2022-08-15  73   * @timer:      timer pointer over which write operation is to perform
49cd16bb573e43d Tony Lindgren 2022-08-15  74   * @reg:        lowest byte holds the register offset
49cd16bb573e43d Tony Lindgren 2022-08-15  75   * @value:      data to write into the register
49cd16bb573e43d Tony Lindgren 2022-08-15  76   *
49cd16bb573e43d Tony Lindgren 2022-08-15  77   * The posted mode bit is encoded in reg. Note that in posted mode, the write
49cd16bb573e43d Tony Lindgren 2022-08-15  78   * pending bit must be checked. Otherwise a write on a register which has a
49cd16bb573e43d Tony Lindgren 2022-08-15  79   * pending write will be lost.
49cd16bb573e43d Tony Lindgren 2022-08-15  80   */
49cd16bb573e43d Tony Lindgren 2022-08-15  81  static inline void dmtimer_write(struct omap_dm_timer *timer, u32 reg, u32 val)
41e79b1d4584772 Tony Lindgren 2022-04-08 @82  {
49cd16bb573e43d Tony Lindgren 2022-08-15  83  	u16 wp, offset;
49cd16bb573e43d Tony Lindgren 2022-08-15  84  
49cd16bb573e43d Tony Lindgren 2022-08-15  85  	wp = reg >> WPSHIFT;
49cd16bb573e43d Tony Lindgren 2022-08-15  86  	offset = reg & 0xff;
49cd16bb573e43d Tony Lindgren 2022-08-15  87  
49cd16bb573e43d Tony Lindgren 2022-08-15  88  	/* Wait for a possible write pending bit in posted mode */
49cd16bb573e43d Tony Lindgren 2022-08-15  89  	if (wp && timer->posted)
49cd16bb573e43d Tony Lindgren 2022-08-15  90  		while (readl_relaxed(timer->pend) & wp)
41e79b1d4584772 Tony Lindgren 2022-04-08  91  			cpu_relax();
41e79b1d4584772 Tony Lindgren 2022-04-08  92  
49cd16bb573e43d Tony Lindgren 2022-08-15  93  	writel_relaxed(val, timer->func_base + offset);
41e79b1d4584772 Tony Lindgren 2022-04-08  94  }
41e79b1d4584772 Tony Lindgren 2022-04-08  95  

:::::: The code at line 82 was first introduced by commit
:::::: 41e79b1d458477212d0a880c87622bcaa69ab3ea clocksource/drivers/timer-ti-dm: Move inline functions to driver for am6

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
