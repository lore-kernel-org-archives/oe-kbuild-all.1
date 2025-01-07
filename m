Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9897B7083C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 00:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736211571; cv=none; b=jbj0DQ8BvG5YhxGMB9UhZqs0iLPgxaLJEYCBRzHUMnecGONjZ+jfsk/s2/BxkXkbX+i29/R1t63GlPfQdIcVwjsNlEnxSY0MtmuV/KZdQqY7dOuYt68zJgvHqQGgLrD3fCgCrsHHs2t4ieSZ8W7PNqksegu4+3b1rjcrlZryOJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736211571; c=relaxed/simple;
	bh=v/DkF3l8jQhumYrmxQW5z5n3+3GeqmudKqe0p3zQOoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qsKSFAVbuAnXdifuH9a2Tx+r7jOLirNCPAkiIvkpp/6o/HHt1HNwIdO1j0AUEs9w8AAH/pIsjBb5aoXKFH856Gmn/bcH4X/VaE+MoIPtlmqJ/UvldexwMfww9CmfSbkSy4FD/RKE+/oVavEeVvALDZAh+0FCHqDeoL6zkGmDRJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IW4EbBmR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IW4EbBmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736211569; x=1767747569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v/DkF3l8jQhumYrmxQW5z5n3+3GeqmudKqe0p3zQOoA=;
  b=IW4EbBmRuvu0V5LdZHtOhYY36JdpjAlzXlw6dOUqJnkq+YQti2s2ddJG
   9/eSrs4yK/TU6DwFODrg8I4fs8MyWEWH5dK/Jar7gIBjli7oQcYFktwXO
   /Pdl+gl3em9m+rASOt01CU4er2mjtm5Bz7e2iE4wQ54lYrwzMJUdhlnn4
   UPyWdnwuqM/4EMuLzzdrGt2lFlNKONksm2O830oP10Tb7O2SHqPlck4pS
   s+1V3KPSxi4lnBZCo40MjaPzs6jrwvt0HXfMeXUq+3OXZE6XTsEOTFjI6
   k9A7589N8J+vhyCLazu+egxx/jG/I4xFd41jEz9nZHHONWwGYdugnmXrD
   A==;
X-CSE-ConnectionGUID: Rv4qcLJ8QQW2iLmrNvPWbg==
X-CSE-MsgGUID: fS+S6nJWTaWVqlTzs5ajBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36073047"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36073047"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 16:59:28 -0800
X-CSE-ConnectionGUID: 1t4W/t3wRCS4+Lp+6NgxvA==
X-CSE-MsgGUID: x3SlJXMbTriuyuPbV59Vbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125884934"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2025 16:59:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUxwK-000E4x-20;
	Tue, 07 Jan 2025 00:59:24 +0000
Date: Tue, 7 Jan 2025 08:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-01 1/1]
 drivers/clocksource/timer-ti-dm.c:82: warning: Function parameter or member
 'val' not described in 'dmtimer_write'
Message-ID: <202501070813.iLTdXM7S-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-01
head:   bd15ae767bd293b77e31786ef49abaee8cc016d8
commit: 49cd16bb573e43dc2ee64d734b9b545475dbb35f [1/1] clocksource/drivers/timer-ti-dm: Simplify register writes with dmtimer_write()
config: i386-buildonly-randconfig-002-20250107 (https://download.01.org/0day-ci/archive/20250107/202501070813.iLTdXM7S-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070813.iLTdXM7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070813.iLTdXM7S-lkp@intel.com/

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
