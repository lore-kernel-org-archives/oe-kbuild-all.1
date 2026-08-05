Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8243C0A0E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 03:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899614; cv=none; b=JxNYL+wsOhxxr/pzwJi6biOo64K5KAYpJFX1BWdL6B4JkRC85SeMMWBe0BccXzAQ3Js/OI6hJGom54iSnalhh4knUp6CQqiWxyXj2ggoAT2Xx4q24HWhELW4U1TXHYKW2uINXKVKYo+rZzwGU/Ny9jn8ighyCuu7JLPOFh6hFPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899614; c=relaxed/simple;
	bh=DklzzjmHwm1kxKhqk13/7nuO6O2bKEgcsWAa9+jFVJg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YfzPso/IkL3ThoWvMeV512Kdav0mgEKQl/gr+S+iD8JsPMbdw1aoMqtXsJoKYd8k6bBTOp5WMcX5tV7RzuWnTvFwK3aPXrWCo7NOycXCdBFCAYY7eoDgcUDpiR4TCoiLuBfxzYwR+MTrhVAPAhFa2g9u6LEeV6ZHulYVC2MHSOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKQSKk1/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKQSKk1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785899611; x=1817435611;
  h=date:from:to:cc:subject:message-id;
  bh=DklzzjmHwm1kxKhqk13/7nuO6O2bKEgcsWAa9+jFVJg=;
  b=CKQSKk1/Z3J/xgrsuKTsorVzGmlNNstkAxJv8m6jGpXZxEz6lpor47m5
   LeoJKHSRepp1fDdr381AemR1pkq5SDsdyNfFRpvHo3KsVN/ZR6BvsGu3e
   tAxgn0Ic9sAtqAVxveNACRowD7yKHLG2YPz6zdT8wEZy4Iz/6CS6EJ+5q
   8Mb9qa5d4QI1oZx1H3QL1JiRcx8gZsFYit8Wou8hoKcBmS5JnnVFuLnzr
   DWo6Twa162wi+SC9j932oZkBlLT3mAHWsz0NoloxEojscnp+BsloC9AOJ
   nM1tQGrSwlu65aiDi3x/GetfVeuISQSiiTtlPy2aFf5BT/4Q4aM+BGI/u
   Q==;
X-CSE-ConnectionGUID: RnaGyWebTGaLatK301MSoA==
X-CSE-MsgGUID: jnfAahq/SqSPWOCKQ7dyJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="74000660"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="74000660"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 20:13:30 -0700
X-CSE-ConnectionGUID: 9kRp9mZ1QT6J5TsKySGqsw==
X-CSE-MsgGUID: kKwrueaqTbC6IZOnluSSXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="255401876"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Aug 2026 20:13:27 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrS4K-00000000BLF-35oJ;
	Wed, 05 Aug 2026 03:13:24 +0000
Date: Wed, 05 Aug 2026 11:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/n1d/enablement 7/10]
 drivers/clocksource/timer-rzn1.c:297:25: error: implicit declaration of
 function 'irq_set_status_flags'
Message-ID: <202608051029.h8zgHKlf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/enablement
head:   a2d12f9e27fc974d97e58b9c5a7d15452a1be447
commit: 003b1177ec24b75646dd215f6c04525f67d19060 [7/10] clocksource/drivers: Add support for the Renesas RZ/N1 timers
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608051029.h8zgHKlf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051029.h8zgHKlf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051029.h8zgHKlf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clocksource/timer-rzn1.c: In function 'rzn1_timer_setup_timers':
>> drivers/clocksource/timer-rzn1.c:297:25: error: implicit declaration of function 'irq_set_status_flags' [-Wimplicit-function-declaration]
     297 |                         irq_set_status_flags(timer->ced.irq, IRQ_NOAUTOEN);
         |                         ^~~~~~~~~~~~~~~~~~~~
>> drivers/clocksource/timer-rzn1.c:297:62: error: 'IRQ_NOAUTOEN' undeclared (first use in this function); did you mean 'IRQF_NO_AUTOEN'?
     297 |                         irq_set_status_flags(timer->ced.irq, IRQ_NOAUTOEN);
         |                                                              ^~~~~~~~~~~~
         |                                                              IRQF_NO_AUTOEN
   drivers/clocksource/timer-rzn1.c:297:62: note: each undeclared identifier is reported only once for each function it appears in


vim +/irq_set_status_flags +297 drivers/clocksource/timer-rzn1.c

   266	
   267	static int rzn1_timer_setup_timers(struct platform_device *pdev,
   268					   struct rzn1_timer *tab_timers,
   269					   unsigned int first_timer_index,
   270					   unsigned int last_timer_index,
   271					   void __iomem *base, unsigned long clock_rate,
   272					   bool irq_disabled)
   273	{
   274		struct device *dev = &pdev->dev;
   275		struct rzn1_timer *timer;
   276		unsigned int i;
   277		char *name;
   278		int irq;
   279		int ret;
   280	
   281		for (i = first_timer_index; i <= last_timer_index; i++) {
   282			timer = &tab_timers[i];
   283	
   284			rzn1_timer_init(timer, i, base, clock_rate);
   285	
   286			irq = platform_get_irq(pdev, i);
   287			if (irq < 0)
   288				return irq;
   289	
   290			name = devm_kasprintf(dev, GFP_KERNEL, "%s-%u", dev_name(dev), i);
   291			if (!name)
   292				return -ENOMEM;
   293	
   294			rzn1_timer_clkevt_init_ced(timer, name, irq);
   295	
   296			if (irq_disabled)
 > 297				irq_set_status_flags(timer->ced.irq, IRQ_NOAUTOEN);
   298	
   299			ret = devm_request_irq(dev, timer->ced.irq, rzn1_timer_interrupt,
   300					       IRQF_TIMER, timer->ced.name, timer);
   301			if (ret < 0)
   302				return dev_err_probe(dev, ret, "timer%u: Failed to request IRQ\n", i);
   303	
   304			rzn1_timer_int_enable(timer);
   305		}
   306		return 0;
   307	}
   308	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
