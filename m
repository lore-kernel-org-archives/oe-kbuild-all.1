Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B49A13959D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 03:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736219686; cv=none; b=Wh8u1KJk9+gXooI3spctiVBNz/rWr1pNFOOpzRSgnRt8Kvq54HJ/4ZYVey8bICSKZ2udaVq6LyOG5R2q8Zo2jQq+znaykW89R3sEx9nB5TuB11zo3s1qPEVL20m4nE60guiIHi/VpDDzDB9i32CF4skmDu3GFpcmWvLvMOiRBMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736219686; c=relaxed/simple;
	bh=2uZkBXy+AvS40+KB3cSLwl3IaLaBjnkiQI1H7vkGLxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nDtEpZqKOsYzfCxfqIUZsS9G2E1hGE0eJ4/oVJbDbd05xExEFrpt4Mb1mqVMt67HOaWz7mJ30NjONdT4v0XpjXH779q2M60Z6wBE7ZvxQ3dDzGk+bxrwSoPuybda+Qfn9vJpsNaXbqRrZIdowQq6K1eUk9lqZXKPhhZ5P1tnxy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RN1sduNe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RN1sduNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736219684; x=1767755684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2uZkBXy+AvS40+KB3cSLwl3IaLaBjnkiQI1H7vkGLxU=;
  b=RN1sduNeBdwOTMhexahxRS6jiWFNiDRqGt2pzpO6gSYNexB9TcPfconh
   EyJzs0fdJLiYVMMq7eoaqJmDhGEV04kvO8YCsKw5B9HtG6cbfP/9zqKT/
   gFx57yxmU/BoDJmVhJiSCKKLeVMh63879JzC5ulvDkevqA3uVd6T7cw0q
   i/C0X0DWfag4WPkiiVhBY3cHYn6nKIl49CI4Z6KOJtocby/Q0Rs2ag9hB
   /XGhxtBRH112vJ2JP9xpNNJjeYBCkXrt9wLo/aNHM0+GkS9n+sWD5jXFd
   ooNqpp+JUpmnPCZhNOt0vDyN4bDP+Ni2RBVjgkibZMwksruBGSnzR2nAh
   Q==;
X-CSE-ConnectionGUID: udX+T51FTSKsXlrsrgdqzQ==
X-CSE-MsgGUID: sQ6QoMGEQzaIqC9f2gYSGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="35684500"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="35684500"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 19:14:43 -0800
X-CSE-ConnectionGUID: ioE6BULlR1qn9OlNtfWgMw==
X-CSE-MsgGUID: i0WuVp5MTcmnH+m+PzIS0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103489562"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Jan 2025 19:14:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV03D-000EAL-1t;
	Tue, 07 Jan 2025 03:14:39 +0000
Date: Tue, 7 Jan 2025 11:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-01 1/1]
 drivers/clocksource/timer-ti-dm.c:947: warning: Function parameter or member
 'cookie' not described in 'omap_dm_timer_set_int_disable'
Message-ID: <202501071136.MayU2Qlb-lkp@intel.com>
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
commit: a6e543f61531b63bfc8d43053c6ec6f65117f627 [1/1] clocksource/drivers/timer-ti-dm: Move struct omap_dm_timer fields to driver
config: i386-buildonly-randconfig-002-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071136.MayU2Qlb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071136.MayU2Qlb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071136.MayU2Qlb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clocksource/timer-ti-dm.c:191: warning: Function parameter or member 'val' not described in 'dmtimer_write'
   drivers/clocksource/timer-ti-dm.c:191: warning: Excess function parameter 'value' description in 'dmtimer_write'
>> drivers/clocksource/timer-ti-dm.c:947: warning: Function parameter or member 'cookie' not described in 'omap_dm_timer_set_int_disable'
>> drivers/clocksource/timer-ti-dm.c:947: warning: Excess function parameter 'timer' description in 'omap_dm_timer_set_int_disable'


vim +947 drivers/clocksource/timer-ti-dm.c

92105bb70634ab arch/arm/plat-omap/dmtimer.c      Tony Lindgren 2005-09-07  938  
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  939  /**
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  940   * omap_dm_timer_set_int_disable - disable timer interrupts
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  941   * @timer:	pointer to timer handle
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  942   * @mask:	bit mask of interrupts to be disabled
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  943   *
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  944   * Disables the specified timer interrupts for a timer.
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  945   */
a6e543f61531b6 drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  946  static int omap_dm_timer_set_int_disable(struct omap_dm_timer *cookie, u32 mask)
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13 @947  {
a6e543f61531b6 drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  948  	struct dmtimer *timer;
bd351f1aee21ca drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  949  	struct device *dev;
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  950  	u32 l = mask;
bd351f1aee21ca drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  951  	int rc;
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  952  
a6e543f61531b6 drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  953  	timer = to_dmtimer(cookie);
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  954  	if (unlikely(!timer))
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  955  		return -EINVAL;
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  956  
bd351f1aee21ca drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  957  	dev = &timer->pdev->dev;
bd351f1aee21ca drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  958  	rc = pm_runtime_resume_and_get(dev);
bd351f1aee21ca drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  959  	if (rc)
bd351f1aee21ca drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  960  		return rc;
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  961  
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  962  	if (timer->revision == 1)
f32bdac10cb5f4 drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  963  		l = dmtimer_read(timer, timer->irq_ena) & ~mask;
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  964  
f32bdac10cb5f4 drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  965  	dmtimer_write(timer, timer->irq_dis, l);
90c9aada19606a drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  966  	l = dmtimer_read(timer, OMAP_TIMER_WAKEUP_EN_REG) & ~mask;
49cd16bb573e43 drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  967  	dmtimer_write(timer, OMAP_TIMER_WAKEUP_EN_REG, l);
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  968  
bd351f1aee21ca drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  969  	pm_runtime_put_sync(dev);
bd351f1aee21ca drivers/clocksource/timer-ti-dm.c Tony Lindgren 2022-08-15  970  
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  971  	return 0;
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  972  }
4249d96ca35a76 arch/arm/plat-omap/dmtimer.c      Jon Hunter    2012-07-13  973  

:::::: The code at line 947 was first introduced by commit
:::::: 4249d96ca35a765c25a70b7d29df5b6d80987c7f ARM: OMAP: Add dmtimer interrupt disable function

:::::: TO: Jon Hunter <jon-hunter@ti.com>
:::::: CC: Jon Hunter <jon-hunter@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
