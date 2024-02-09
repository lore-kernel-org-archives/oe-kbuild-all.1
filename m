Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3272169D25
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488502; cv=none; b=YOOAvCY1GpRMc/6K7WzG72OO3PsqJAXcQFvSKwN24txgxyMT/q3ZWeMguyeyZGK0s7NejjDph+VaFqEDLtkBO/7IZN6aVkNuis46PSRrjd40vXRqzp8dqBDHiKuS8n4aiGDwfhUnaYCCCi45gJnU1UB/YEGovzvzkMTXHKBjR34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488502; c=relaxed/simple;
	bh=syWhBX517J+XUXmuU5gMe1ovOlvV1TyZVDh/AeqK1gI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GvsC85E1m2wHomho3rjl8RHEwS54ZGL2/qY99HqUVMYyopWIuT5hli5FjmyxgvBi640DuVksGSBi3xOjQPLjbPeSbG2x00Ni6cWR9S0n39m3tV2AO2s6gIUb8ievhMUwD57tWrot8RZK5OYFBTPaUE9wYkT9EdGrOYlDfn4FkaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MuszbH2C; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MuszbH2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488501; x=1739024501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=syWhBX517J+XUXmuU5gMe1ovOlvV1TyZVDh/AeqK1gI=;
  b=MuszbH2C9DXuDyq6D+iqTiKxqRUjrMtDuvmuGmOHaigNdILO+Bf2dvNB
   gNgEPDQgS1FaDX1Hhli4qKcYIp4w1CvxiPM1WI8WCIwfAmdaQnF0cXu3F
   iGIu816nMXV1AdDc9JUsWmGjvfBIWfpCZtSr3TqTn87N57kpz/cYUY1oz
   qIRMaQ3QuioIUSuKnmUfiJq/je1F+IhlGVu8KziXRau6AQwCa4wFY/hHF
   PuygcZWMhw2x+ng3hgakM7Jt3sZSu/d44cFS1NfCoU0okAjmW23KmV8vd
   WSelp6yXxDzYUhyeM0OyXZU9TpNmZsXfpSI7nT6HLNUwRJnvqGMxlQJv5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="5252998"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="5252998"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:21:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="2165257"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2024 06:21:27 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYRkq-0004mE-2G;
	Fri, 09 Feb 2024 14:21:24 +0000
Date: Fri, 9 Feb 2024 22:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ukleinek:pwm-lifetime-tracking 153/153]
 drivers/pwm/pwm-omap-dmtimer.c:66: warning: Excess struct member 'chip'
 description in 'pwm_omap_dmtimer_chip'
Message-ID: <202402092204.Vxk56Ruw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm-lifetime-tracking
head:   f10ff6c7e1f341afe7f15a1f5f53379a0752bcb0
commit: 4b0a2d6e64260314f34fa13b3749c840da7901b0 [153/153] pwm: omap-dmtimer: Make use of devm_pwmchip_alloc() function
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240209/202402092204.Vxk56Ruw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402092204.Vxk56Ruw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402092204.Vxk56Ruw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-omap-dmtimer.c:66: warning: Excess struct member 'chip' description in 'pwm_omap_dmtimer_chip'


vim +66 drivers/pwm/pwm-omap-dmtimer.c

6604c6556db9e4 Neil Armstrong 2015-11-02  52  
6b28fb6f3ca30b Lokesh Vutla   2020-03-12  53  /**
6b28fb6f3ca30b Lokesh Vutla   2020-03-12  54   * struct pwm_omap_dmtimer_chip - Structure representing a pwm chip
6b28fb6f3ca30b Lokesh Vutla   2020-03-12  55   *				  corresponding to omap dmtimer.
6b28fb6f3ca30b Lokesh Vutla   2020-03-12  56   * @chip:		PWM chip structure representing PWM controller
6b28fb6f3ca30b Lokesh Vutla   2020-03-12  57   * @dm_timer:		Pointer to omap dm timer.
6b28fb6f3ca30b Lokesh Vutla   2020-03-12  58   * @pdata:		Pointer to omap dm timer ops.
dfd9b6154d5df4 Lee Jones      2020-06-29  59   * @dm_timer_pdev:	Pointer to omap dm timer platform device
6b28fb6f3ca30b Lokesh Vutla   2020-03-12  60   */
6604c6556db9e4 Neil Armstrong 2015-11-02  61  struct pwm_omap_dmtimer_chip {
6b28fb6f3ca30b Lokesh Vutla   2020-03-12  62  	/* Mutex to protect pwm apply state */
54091b5f195b45 Lokesh Vutla   2020-03-12  63  	struct omap_dm_timer *dm_timer;
b7290cf6ff7869 Keerthy        2018-02-15  64  	const struct omap_dm_timer_ops *pdata;
6604c6556db9e4 Neil Armstrong 2015-11-02  65  	struct platform_device *dm_timer_pdev;
6604c6556db9e4 Neil Armstrong 2015-11-02 @66  };
6604c6556db9e4 Neil Armstrong 2015-11-02  67  

:::::: The code at line 66 was first introduced by commit
:::::: 6604c6556db9e41c85f2839f66bd9d617bcf9f87 pwm: Add PWM driver for OMAP using dual-mode timers

:::::: TO: Neil Armstrong <narmstrong@baylibre.com>
:::::: CC: Thierry Reding <thierry.reding@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
