Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E81840D57C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109934; cv=none; b=ULz43Z8NgikyvWpJe1ropswLY6zdd76pJLQVtPQSSVWp1aw9uV63VPbMjMiPIULkQmhZ57jE1ur1xZU/i5tsatosrexAF5S1u/JnJ8R5cStZz1cJr5KMk43nBdDNkKO+h9oNM/5pk2WxWr5W5K0q35PsOzb9Gxut9yrfEFPcekY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109934; c=relaxed/simple;
	bh=+jHiD3d2cczmqJHowvTPAss/rFWI5qsei6dkahwAAAA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lcTavVx/7REWvhrZnizgqsqVH997gc7V45RWegtId1Hhcpkmsm82SEfW53f1YW+dWDfmf/pxBaQkRxKUNtcJqE3y+kXQbshqnZkaY8D7rtOGzngn7hkKf+ncM+rXP0O1r18OFtkMDCrYsXooefpxgCHf+AYWd9RNcQIxJH6LxF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJ0ktSjb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJ0ktSjb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781109934; x=1812645934;
  h=date:from:to:cc:subject:message-id;
  bh=+jHiD3d2cczmqJHowvTPAss/rFWI5qsei6dkahwAAAA=;
  b=eJ0ktSjbYkLknRJQqemiThJ4IRacQZmuyt1WpIikcmyDHQb4lHIsM2Kc
   SL+NWwYE0TomAdHp4ooppQMNj4MD+NfX8aWWGEzyNky+i2n5RPii8RGCi
   /SweFjjAU7N2vHY6TSFGkQOIjEAXNIhOsJjTkuTI6waQkq4a8im33meRT
   8nNctsPHvIH68TMULOagpGKPm+F7MGq6bz7PfMz8h+r0Ke/+MvTPxIkvP
   F2fwbv36eTnEUeCeBli9ehVTVjBdYY61329OA0+4/2l1X6qxBf2jdPYB6
   tn6SCfHcYP3dQLpXmUd0+SbwgpyDDAkhcVaYNerkHaHuBe+2XClunmaFD
   g==;
X-CSE-ConnectionGUID: DiMBRdu1QPG5fkFoff+BxA==
X-CSE-MsgGUID: 6b1IhrQeQwCdacN23aQciQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93017008"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="93017008"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 09:45:33 -0700
X-CSE-ConnectionGUID: XcNjX4IvRaGmxxVKJgJEKg==
X-CSE-MsgGUID: 7Bf/hQQRTzaAcNJuKuVCfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="241811826"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jun 2026 09:45:31 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXM3U-00000000Lfu-45hY;
	Wed, 10 Jun 2026 16:45:28 +0000
Date: Thu, 11 Jun 2026 00:45:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 29/29]
 kernel/irq/manage.c:2690: warning: expecting prototype for
 __request_percpu_irq(). Prototype was for __request_percpu_irq_NEW() instead
Message-ID: <202606110001.G1iW6xJz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   3d1a70cbeee3f63c1e323962490a9106d7b78111
commit: 24195a8917b80c31ea4322a95b725262d6b1bb3b [29/29] ANDROID: irq: Retain old __request_percpu_irq() signature for KMI kludge
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260611/202606110001.G1iW6xJz-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110001.G1iW6xJz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110001.G1iW6xJz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/manage.c:2690: warning: expecting prototype for __request_percpu_irq(). Prototype was for __request_percpu_irq_NEW() instead


vim +2690 kernel/irq/manage.c

8d81ff0bf14f8aa Marc Zyngier   2025-10-20  2668  
31d9d9b6d83030f Marc Zyngier   2011-09-23  2669  /**
c80081b9209713e Daniel Lezcano 2017-07-06  2670   *	__request_percpu_irq - allocate a percpu interrupt line
31d9d9b6d83030f Marc Zyngier   2011-09-23  2671   *	@irq: Interrupt line to allocate
31d9d9b6d83030f Marc Zyngier   2011-09-23  2672   *	@handler: Function to be called when the IRQ occurs.
c80081b9209713e Daniel Lezcano 2017-07-06  2673   *	@flags: Interrupt type flags (IRQF_TIMER only)
31d9d9b6d83030f Marc Zyngier   2011-09-23  2674   *	@devname: An ascii name for the claiming device
0d21cee2dc788f0 Marc Zyngier   2025-10-20  2675   *	@affinity: A cpumask describing the target CPUs for this interrupt
31d9d9b6d83030f Marc Zyngier   2011-09-23  2676   *	@dev_id: A percpu cookie passed back to the handler function
31d9d9b6d83030f Marc Zyngier   2011-09-23  2677   *
8d81ff0bf14f8aa Marc Zyngier   2025-10-20  2678   *	This call allocates interrupt resources, but doesn't enable the
8d81ff0bf14f8aa Marc Zyngier   2025-10-20  2679   *	interrupt on any CPU, as all percpu-devid interrupts are flagged
8d81ff0bf14f8aa Marc Zyngier   2025-10-20  2680   *	with IRQ_NOAUTOEN. It has to be done on each CPU using
a1b7febd725a2cd Maxime Ripard  2015-09-25  2681   *	enable_percpu_irq().
31d9d9b6d83030f Marc Zyngier   2011-09-23  2682   *
31d9d9b6d83030f Marc Zyngier   2011-09-23  2683   *	Dev_id must be globally unique. It is a per-cpu variable, and
31d9d9b6d83030f Marc Zyngier   2011-09-23  2684   *	the handler gets called with the interrupted CPU's instance of
31d9d9b6d83030f Marc Zyngier   2011-09-23  2685   *	that variable.
31d9d9b6d83030f Marc Zyngier   2011-09-23  2686   */
24195a8917b80c3 Will Deacon    2026-04-17  2687  int __request_percpu_irq_NEW(unsigned int irq, irq_handler_t handler,
c80081b9209713e Daniel Lezcano 2017-07-06  2688  			 unsigned long flags, const char *devname,
0d21cee2dc788f0 Marc Zyngier   2025-10-20  2689  			 const cpumask_t *affinity, void __percpu *dev_id)
31d9d9b6d83030f Marc Zyngier   2011-09-23 @2690  {
31d9d9b6d83030f Marc Zyngier   2011-09-23  2691  	struct irqaction *action;
31d9d9b6d83030f Marc Zyngier   2011-09-23  2692  	struct irq_desc *desc;
31d9d9b6d83030f Marc Zyngier   2011-09-23  2693  	int retval;
31d9d9b6d83030f Marc Zyngier   2011-09-23  2694  
31d9d9b6d83030f Marc Zyngier   2011-09-23  2695  	if (!dev_id)
31d9d9b6d83030f Marc Zyngier   2011-09-23  2696  		return -EINVAL;
31d9d9b6d83030f Marc Zyngier   2011-09-23  2697  
31d9d9b6d83030f Marc Zyngier   2011-09-23  2698  	desc = irq_to_desc(irq);
31d9d9b6d83030f Marc Zyngier   2011-09-23  2699  	if (!desc || !irq_settings_can_request(desc) ||
31d9d9b6d83030f Marc Zyngier   2011-09-23  2700  	    !irq_settings_is_per_cpu_devid(desc))
31d9d9b6d83030f Marc Zyngier   2011-09-23  2701  		return -EINVAL;
31d9d9b6d83030f Marc Zyngier   2011-09-23  2702  
c80081b9209713e Daniel Lezcano 2017-07-06  2703  	if (flags && flags != IRQF_TIMER)
c80081b9209713e Daniel Lezcano 2017-07-06  2704  		return -EINVAL;
c80081b9209713e Daniel Lezcano 2017-07-06  2705  
0d21cee2dc788f0 Marc Zyngier   2025-10-20  2706  	action = create_percpu_irqaction(handler, flags, devname, affinity, dev_id);
31d9d9b6d83030f Marc Zyngier   2011-09-23  2707  	if (!action)
31d9d9b6d83030f Marc Zyngier   2011-09-23  2708  		return -ENOMEM;
31d9d9b6d83030f Marc Zyngier   2011-09-23  2709  
be45beb2df6909d Jon Hunter     2016-06-07  2710  	retval = irq_chip_pm_get(&desc->irq_data);
4396f46c8c62832 Shawn Lin      2016-08-22  2711  	if (retval < 0) {
4396f46c8c62832 Shawn Lin      2016-08-22  2712  		kfree(action);
be45beb2df6909d Jon Hunter     2016-06-07  2713  		return retval;
4396f46c8c62832 Shawn Lin      2016-08-22  2714  	}
be45beb2df6909d Jon Hunter     2016-06-07  2715  
31d9d9b6d83030f Marc Zyngier   2011-09-23  2716  	retval = __setup_irq(irq, desc, action);
31d9d9b6d83030f Marc Zyngier   2011-09-23  2717  
be45beb2df6909d Jon Hunter     2016-06-07  2718  	if (retval) {
be45beb2df6909d Jon Hunter     2016-06-07  2719  		irq_chip_pm_put(&desc->irq_data);
31d9d9b6d83030f Marc Zyngier   2011-09-23  2720  		kfree(action);
be45beb2df6909d Jon Hunter     2016-06-07  2721  	}
31d9d9b6d83030f Marc Zyngier   2011-09-23  2722  
31d9d9b6d83030f Marc Zyngier   2011-09-23  2723  	return retval;
31d9d9b6d83030f Marc Zyngier   2011-09-23  2724  }
24195a8917b80c3 Will Deacon    2026-04-17  2725  EXPORT_SYMBOL_GPL(__request_percpu_irq_NEW);
24195a8917b80c3 Will Deacon    2026-04-17  2726  

:::::: The code at line 2690 was first introduced by commit
:::::: 31d9d9b6d83030f748d013e61502fa5477e2ac0e genirq: Add support for per-cpu dev_id interrupts

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
