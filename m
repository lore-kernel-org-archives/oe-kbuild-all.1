Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C5E3A7F62
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 17:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767807491; cv=none; b=TWpwzU+UY1FXCA2C9fOBRAjpozt7KwqnHZduqqp5OJpr9IPNIC6Ps1Eqj4Ks/HtRStl8qTAPHE6AWe99O+CUAiT3G30IavPrTDTC/7PYQ4vLHREwvhamdsSNSL0+lF86y02/qkdNuIkzzwOvkQO+6lTw/bxtGcaALwv0dENmsNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767807491; c=relaxed/simple;
	bh=5w11i+iXZuU25LHpagsu6Xue638V9iGRi85xe4NZvTo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vCCXAIzAhPVO6qd/R3hrcA90dEVwnab8Nb1h5/hwtGoAe+JpmxS6S/4nHbZWg702sPs+RiYPvdLUUM5ItQMWl9uCdeKZpb1GN4TvkhQgSho1anedTCT4pm591hx1j8Skn4aRyk8BexuMOfzF/eY0OGKumAtNXZ7E88mxQn0/Zhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nY1bql42; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nY1bql42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767807488; x=1799343488;
  h=date:from:to:cc:subject:message-id;
  bh=5w11i+iXZuU25LHpagsu6Xue638V9iGRi85xe4NZvTo=;
  b=nY1bql42VblDHwhJcGhb7l+0eiRfzMF3O3YC0ft0m7+eBySIROl173Zy
   j77NDqkgjVC3un4JcK8L5JuZ+CGM/p+1Vovv2wv3KJB3bbBLgWB96AJFS
   TU/bOeYlinZyorMpq7eABt2S9I29jnYxw2tPCzGZCbt92+gd2jkK69X8X
   sNylkgfutTMhVJUsg5t/JPV6llHH4Orj2VgPANyew3yA6BAIHbqyE1hDU
   OEVVej7s9bFbPwzVGh/d/UR/aEevd7r4s0gz4RAahIH/pgtcM5H82vFpc
   chcSaI686JRO8Dq9dMJTSdx36rxLAXvWGd32sXjWz/lS7dHQz+P2zoapv
   A==;
X-CSE-ConnectionGUID: R+hKScAxTnCA6on7gV2ppQ==
X-CSE-MsgGUID: iRUWmzntRqKiVORqlWGijg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80296632"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="80296632"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 09:38:06 -0800
X-CSE-ConnectionGUID: qqoes66VQSaeQmoYRFTfVg==
X-CSE-MsgGUID: yYYh5MC4Rw68u81p9P0I4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="233697294"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jan 2026 09:38:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdXTt-00000000429-0FF8;
	Wed, 07 Jan 2026 17:38:01 +0000
Date: Thu, 08 Jan 2026 01:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 10/10]
 arch/sh/boards/mach-hp6xx/hp6xx_apm.c:54:16: sparse: sparse: incorrect type
 in argument 1 (different base types)
Message-ID: <202601080121.FnjOwoqi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   1c79063b436b437afd074eb39f2374b27ac91aa2
commit: 1c79063b436b437afd074eb39f2374b27ac91aa2 [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: sh-randconfig-r121-20260107 (https://download.01.org/0day-ci/archive/20260108/202601080121.FnjOwoqi-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080121.FnjOwoqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601080121.FnjOwoqi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/sh/boards/mach-hp6xx/hp6xx_apm.c:54:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int @@
   arch/sh/boards/mach-hp6xx/hp6xx_apm.c:54:16: sparse:     expected void const volatile [noderef] __iomem *ptr
   arch/sh/boards/mach-hp6xx/hp6xx_apm.c:54:16: sparse:     got unsigned int
>> arch/sh/boards/mach-hp6xx/hp6xx_apm.c:101:33: sparse: sparse: Using plain integer as NULL pointer

vim +54 arch/sh/boards/mach-hp6xx/hp6xx_apm.c

dd4f99b42dcce8 arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2008-03-06   29  
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   30  static void hp6x0_apm_get_power_status(struct apm_power_info *info)
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   31  {
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   32  	int battery, backup, charging, percentage;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   33  	u8 pgdr;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   34  
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   35  	battery		= adc_single(ADC_CHANNEL_BATTERY);
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   36  	backup		= adc_single(ADC_CHANNEL_BACKUP);
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   37  	charging	= adc_single(ADC_CHANNEL_CHARGE);
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   38  
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   39  	percentage = 100 * (battery - HP680_BATTERY_MIN) /
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   40  			   (HP680_BATTERY_MAX - HP680_BATTERY_MIN);
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   41  
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04   42  	/* % of full battery */
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04   43  	info->battery_life = percentage;
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04   44  
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04   45  	/* We want our estimates in minutes */
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04   46  	info->units = 0;
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04   47  
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04   48  	/* Extremely(!!) rough estimate, we will replace this with a datalist later on */
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04   49  	info->time = (2 * battery);
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04   50  
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   51  	info->ac_line_status = (battery > HP680_BATTERY_AC_ON) ?
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   52  			 APM_AC_ONLINE : APM_AC_OFFLINE;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   53  
9d56dd3b083a3b arch/sh/boards/mach-hp6xx/hp6xx_apm.c Paul Mundt         2010-01-26  @54  	pgdr = __raw_readb(PGDR);
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   55  	if (pgdr & PGDR_MAIN_BATTERY_OUT) {
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   56  		info->battery_status	= APM_BATTERY_STATUS_NOT_PRESENT;
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   57  		info->battery_flag	= 0x80;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   58  	} else if (charging < 8) {
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   59  		info->battery_status	= APM_BATTERY_STATUS_CHARGING;
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   60  		info->battery_flag	= 0x08;
8b03c040e4efaa arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2008-03-04   61  		info->ac_line_status	= 0x01;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   62  	} else if (percentage <= APM_CRITICAL) {
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   63  		info->battery_status	= APM_BATTERY_STATUS_CRITICAL;
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   64  		info->battery_flag	= 0x04;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   65  	} else if (percentage <= APM_LOW) {
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   66  		info->battery_status	= APM_BATTERY_STATUS_LOW;
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   67  		info->battery_flag	= 0x02;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   68  	} else {
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   69  		info->battery_status	= APM_BATTERY_STATUS_HIGH;
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   70  		info->battery_flag	= 0x01;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   71  	}
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   72  }
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   73  
35f3c5185b1e28 arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2006-10-06   74  static irqreturn_t hp6x0_apm_interrupt(int irq, void *dev)
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   75  {
8c8ee8254767d5 arch/sh/boards/hp6xx/hp6xx_apm.c      Kristoffer Ericson 2007-09-11   76  	if (!APM_DISABLED)
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   77  		apm_queue_event(APM_USER_SUSPEND);
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   78  
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   79  	return IRQ_HANDLED;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   80  }
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   81  
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   82  static int __init hp6x0_apm_init(void)
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   83  {
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   84  	int ret;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   85  
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   86  	ret = request_irq(HP680_BTN_IRQ, hp6x0_apm_interrupt,
d11584a0449f88 arch/sh/boards/mach-hp6xx/hp6xx_apm.c Yong Zhang         2011-10-22   87  			  0, MODNAME, NULL);
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   88  	if (unlikely(ret < 0)) {
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   89  		printk(KERN_ERR MODNAME ": IRQ %d request failed\n",
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   90  		       HP680_BTN_IRQ);
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   91  		return ret;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   92  	}
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   93  
0a9b0db19262db arch/sh/boards/hp6xx/hp6xx_apm.c      Paul Mundt         2007-01-24   94  	apm_get_power_status = hp6x0_apm_get_power_status;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   95  
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   96  	return ret;
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   97  }
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   98  
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27   99  static void __exit hp6x0_apm_exit(void)
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  100  {
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27 @101  	free_irq(HP680_BTN_IRQ, 0);
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  102  }
3aa770e7972723 arch/sh/boards/hp6xx/hp6xx_apm.c      Andriy Skulysh     2006-09-27  103  

:::::: The code at line 54 was first introduced by commit
:::::: 9d56dd3b083a3bec56e9da35ce07baca81030b03 sh: Mass ctrl_in/outX to __raw_read/writeX conversion.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
