Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2FE3385B6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 23:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654239; cv=none; b=BBbCwetN/vIAbEe3r/SJkQ1+cPSDiJO/QtxyqOQvLTNdaxUXdRwxK6Yu5+miUDfh+VoGG1JoZf/+qwthXnWSK3oBBYqja19HPuDxzv7GYKOFWlgZsq2/91MLflhLCAPYsXZZvSOZImM6nsKamCCt1zn7h2i5W2HcmmjjfZkld0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654239; c=relaxed/simple;
	bh=dQ5mTwcPIsSLZTUhuC12yXV3yR6IOGdTweffbg5fEHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=udzSDFv0jZKSGjQrP6/GW7T/AJaorXqAWlS/6MFyCAf0JyASo9eLRSGqZDjrvDoG8fMSF+3GpZW1vP4MDTdeUv3f3YBzDwM+pSk8pO+BHCtHZG1eDIywv5ufKEfZYmcLAa8MTlTdbf98Q+/D23bQVYKYiJflJXWT3UWEcLtQnQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8g7bFi4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8g7bFi4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774654238; x=1806190238;
  h=date:from:to:cc:subject:message-id;
  bh=dQ5mTwcPIsSLZTUhuC12yXV3yR6IOGdTweffbg5fEHE=;
  b=k8g7bFi49vtpfGajtlm8MtAbl3QGhKM7CXTFWd+3TSpwaM+5MjpJBtwo
   jZoeHqiJ0louZQ4PqlEimHvfoKfOqCEnPXevJL5h++m/lJlb+muxkfSxj
   JWlHhK61UxUanLYCXS4UcDjmz52jvVaoKGtrHg5Ni2xC5mfnzgN5j15F9
   h4EWpoiVTvlnu7QYc4dbZWsVoYTYuYcr7zCPyTJ/zgVVDIsjhRZ9ZZwKk
   cKeDlbEntwOXQwnoy274TNaRUInbiSealNmzPvkgahiNNWWRK9GE2XHH5
   Pb/Ejr6Jb0Dp4w0EarU6JAJuJ3/1xzLU4wcLBe+C9GxLto5xEKTBtq8il
   A==;
X-CSE-ConnectionGUID: 8QFkJ6scSxm5zfCrGLlAfQ==
X-CSE-MsgGUID: A0n0OFmsRVOi3QRobz6x+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63287591"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="63287591"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 16:30:36 -0700
X-CSE-ConnectionGUID: KFHjCU7wQ1yM3FztPQTF7g==
X-CSE-MsgGUID: sN1SCk6ARTeWQTjghOresA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="230235250"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 16:30:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6GdM-00000000Asf-25PT;
	Fri, 27 Mar 2026 23:30:32 +0000
Date: Sat, 28 Mar 2026 07:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 7/7]
 drivers/clocksource/timer-of.c:29:46: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202603280737.DV2s1lX5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2cc75ea7f8fdc24a939ebc7ad3b7c4c6b4224c93
commit: 7e62fb828f8eb6e383970de29594d8080aabe58a [7/7] FROMLIST: clocksource/drivers/timer-mediatek: Make timer-mediatek become loadable module
config: x86_64-randconfig-r112-20260324 (https://download.01.org/0day-ci/archive/20260328/202603280737.DV2s1lX5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280737.DV2s1lX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280737.DV2s1lX5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/timer-of.c:29:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __percpu * @@     got struct clock_event_device *clkevt @@
   drivers/clocksource/timer-of.c:29:46: sparse:     expected void [noderef] __percpu *
   drivers/clocksource/timer-of.c:29:46: sparse:     got struct clock_event_device *clkevt
   drivers/clocksource/timer-of.c:74:51: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void [noderef] __percpu *percpu_dev_id @@     got struct clock_event_device *clkevt @@
   drivers/clocksource/timer-of.c:74:51: sparse:     expected void [noderef] __percpu *percpu_dev_id
   drivers/clocksource/timer-of.c:74:51: sparse:     got struct clock_event_device *clkevt

vim +29 drivers/clocksource/timer-of.c

dc11bae78529526 Daniel Lezcano 2017-06-05  15  
cf7f46b9b12269d Daniel Lezcano 2018-01-08  16  /**
cf7f46b9b12269d Daniel Lezcano 2018-01-08  17   * timer_of_irq_exit - Release the interrupt
cf7f46b9b12269d Daniel Lezcano 2018-01-08  18   * @of_irq: an of_timer_irq structure pointer
cf7f46b9b12269d Daniel Lezcano 2018-01-08  19   *
cf7f46b9b12269d Daniel Lezcano 2018-01-08  20   * Free the irq resource
cf7f46b9b12269d Daniel Lezcano 2018-01-08  21   */
4625c2b6021552c Chun-Hung Wu   2023-02-14  22  static void timer_of_irq_exit(struct of_timer_irq *of_irq)
dc11bae78529526 Daniel Lezcano 2017-06-05  23  {
dc11bae78529526 Daniel Lezcano 2017-06-05  24  	struct timer_of *to = container_of(of_irq, struct timer_of, of_irq);
dc11bae78529526 Daniel Lezcano 2017-06-05  25  
dc11bae78529526 Daniel Lezcano 2017-06-05  26  	struct clock_event_device *clkevt = &to->clkevt;
dc11bae78529526 Daniel Lezcano 2017-06-05  27  
0f1a7b3fac05830 Linus Torvalds 2019-10-02  28  	if (of_irq->percpu)
0f1a7b3fac05830 Linus Torvalds 2019-10-02 @29  		free_percpu_irq(of_irq->irq, clkevt);
0f1a7b3fac05830 Linus Torvalds 2019-10-02  30  	else
dc11bae78529526 Daniel Lezcano 2017-06-05  31  		free_irq(of_irq->irq, clkevt);
dc11bae78529526 Daniel Lezcano 2017-06-05  32  }
dc11bae78529526 Daniel Lezcano 2017-06-05  33  

:::::: The code at line 29 was first introduced by commit
:::::: 0f1a7b3fac0583083ca19d4de47403511ced3521 timer-of: don't use conditional expression with mixed 'void' types

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
