Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864823ABD8F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 05:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790658389; cv=none; b=d33PU4cMrDypKAJEgUNpudM5snzlroVOs2XRdEQN6R0ZkA2rYSM9UNsT1+xVOs5tQDH4XmCl8HBVK6EupNpArtbTd5hSYFNlJMt7pEcglIv/NfZpNbOx7ItSyQBT+BEnkv42HnSlMIyB21NNbTKhFLQ14daDV4gE+2v0RDSn1EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790658389; c=relaxed/simple;
	bh=FPB8tDSziHqTN3CEM2pzQ+o/7yNnXXZ68RviflbO3FI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P/EHfG9lX4V5WyVYpdSQcsz3Aqx0TpPMD5srjV9E5JOq4hOqjK2f76kjnyxOcEc2EKO9Sh+JTwz67xfCaq5Qsd78CrHdD14SyqON8lZqIW6n8w+XEp3NNHMOdrSveboIsAlGzK3rZ4okR81aAPUrm5BNQSfEH87slIQcqSTcrDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3XtfEnb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3XtfEnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790658388; x=1822194388;
  h=date:from:to:cc:subject:message-id;
  bh=FPB8tDSziHqTN3CEM2pzQ+o/7yNnXXZ68RviflbO3FI=;
  b=F3XtfEnb1SxyzdcW2rpQ+zTYpDbJnjcUb4DXBGK3HOCiJZWWACZ/nuWH
   JGub6bHPY371EjTHBq/RPRnbjCk/m6oGjoqw5MZdpNIZtVBJDKuVrFFdV
   ffEqYW9ljXchpxWW4uOgEBramFwTAQo/dRlycxyzXKwnuqmQ3OlZ7/OfQ
   z+3/6hE5ogCrgUjbHtURTHZSeCKRYjOLD0GFCUIcPqmK502bI4HATe5vz
   8VElYbB1XAiyuZk98ZyJ0qRdhxIkrS6oM/jXxW3y+4HaZoq8tTfyd5cux
   bD4d+piI6gixbAAli0CE2t+tjHGgU6jpuRfNbkQVk9ByXdd5nE2r5FBA5
   g==;
X-CSE-ConnectionGUID: 2+v3MinsSDSgEADmPXacxA==
X-CSE-MsgGUID: WYoxLSc6TtK7s6RWnWbuqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101938234"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="101938234"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 22:06:27 -0700
X-CSE-ConnectionGUID: ILCqWeY0SGSgX5VrrCn5Qg==
X-CSE-MsgGUID: Fsgoy1Z3TCuFEsrSaJgoMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="283340224"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 22:06:25 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBQ2p-000000001Ix-1qlM;
	Tue, 29 Sep 2026 05:06:23 +0000
Date: Tue, 29 Sep 2026 07:06:07 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 7/7]
 kernel/irq/manage.c:2690: warning: expecting prototype for
 __request_percpu_irq(). Prototype was for __request_percpu_irq_NEW() instead
Message-ID: <202609290750.a1Qyii1f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   46c9dcf34122090162fe8bdaf2c9f5c17fc95448
commit: 24195a8917b80c31ea4322a95b725262d6b1bb3b [7/7] ANDROID: irq: Retain old __request_percpu_irq() signature for KMI kludge
config: x86_64-randconfig-r2104-20260929 (https://download.01.org/0day-ci/archive/20260929/202609290750.a1Qyii1f-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290750.a1Qyii1f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290750.a1Qyii1f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/manage.c:2690: warning: expecting prototype for __request_percpu_irq(). Prototype was for __request_percpu_irq_NEW() instead


vim +2690 kernel/irq/manage.c

8d81ff0bf14f8a Marc Zyngier   2025-10-20  2668  
31d9d9b6d83030 Marc Zyngier   2011-09-23  2669  /**
c80081b9209713 Daniel Lezcano 2017-07-06  2670   *	__request_percpu_irq - allocate a percpu interrupt line
31d9d9b6d83030 Marc Zyngier   2011-09-23  2671   *	@irq: Interrupt line to allocate
31d9d9b6d83030 Marc Zyngier   2011-09-23  2672   *	@handler: Function to be called when the IRQ occurs.
c80081b9209713 Daniel Lezcano 2017-07-06  2673   *	@flags: Interrupt type flags (IRQF_TIMER only)
31d9d9b6d83030 Marc Zyngier   2011-09-23  2674   *	@devname: An ascii name for the claiming device
0d21cee2dc788f Marc Zyngier   2025-10-20  2675   *	@affinity: A cpumask describing the target CPUs for this interrupt
31d9d9b6d83030 Marc Zyngier   2011-09-23  2676   *	@dev_id: A percpu cookie passed back to the handler function
31d9d9b6d83030 Marc Zyngier   2011-09-23  2677   *
8d81ff0bf14f8a Marc Zyngier   2025-10-20  2678   *	This call allocates interrupt resources, but doesn't enable the
8d81ff0bf14f8a Marc Zyngier   2025-10-20  2679   *	interrupt on any CPU, as all percpu-devid interrupts are flagged
8d81ff0bf14f8a Marc Zyngier   2025-10-20  2680   *	with IRQ_NOAUTOEN. It has to be done on each CPU using
a1b7febd725a2c Maxime Ripard  2015-09-25  2681   *	enable_percpu_irq().
31d9d9b6d83030 Marc Zyngier   2011-09-23  2682   *
31d9d9b6d83030 Marc Zyngier   2011-09-23  2683   *	Dev_id must be globally unique. It is a per-cpu variable, and
31d9d9b6d83030 Marc Zyngier   2011-09-23  2684   *	the handler gets called with the interrupted CPU's instance of
31d9d9b6d83030 Marc Zyngier   2011-09-23  2685   *	that variable.
31d9d9b6d83030 Marc Zyngier   2011-09-23  2686   */
24195a8917b80c Will Deacon    2026-04-17  2687  int __request_percpu_irq_NEW(unsigned int irq, irq_handler_t handler,
c80081b9209713 Daniel Lezcano 2017-07-06  2688  			 unsigned long flags, const char *devname,
0d21cee2dc788f Marc Zyngier   2025-10-20  2689  			 const cpumask_t *affinity, void __percpu *dev_id)
31d9d9b6d83030 Marc Zyngier   2011-09-23 @2690  {
31d9d9b6d83030 Marc Zyngier   2011-09-23  2691  	struct irqaction *action;
31d9d9b6d83030 Marc Zyngier   2011-09-23  2692  	struct irq_desc *desc;
31d9d9b6d83030 Marc Zyngier   2011-09-23  2693  	int retval;
31d9d9b6d83030 Marc Zyngier   2011-09-23  2694  
31d9d9b6d83030 Marc Zyngier   2011-09-23  2695  	if (!dev_id)
31d9d9b6d83030 Marc Zyngier   2011-09-23  2696  		return -EINVAL;
31d9d9b6d83030 Marc Zyngier   2011-09-23  2697  
31d9d9b6d83030 Marc Zyngier   2011-09-23  2698  	desc = irq_to_desc(irq);
31d9d9b6d83030 Marc Zyngier   2011-09-23  2699  	if (!desc || !irq_settings_can_request(desc) ||
31d9d9b6d83030 Marc Zyngier   2011-09-23  2700  	    !irq_settings_is_per_cpu_devid(desc))
31d9d9b6d83030 Marc Zyngier   2011-09-23  2701  		return -EINVAL;
31d9d9b6d83030 Marc Zyngier   2011-09-23  2702  
c80081b9209713 Daniel Lezcano 2017-07-06  2703  	if (flags && flags != IRQF_TIMER)
c80081b9209713 Daniel Lezcano 2017-07-06  2704  		return -EINVAL;
c80081b9209713 Daniel Lezcano 2017-07-06  2705  
0d21cee2dc788f Marc Zyngier   2025-10-20  2706  	action = create_percpu_irqaction(handler, flags, devname, affinity, dev_id);
31d9d9b6d83030 Marc Zyngier   2011-09-23  2707  	if (!action)
31d9d9b6d83030 Marc Zyngier   2011-09-23  2708  		return -ENOMEM;
31d9d9b6d83030 Marc Zyngier   2011-09-23  2709  
be45beb2df6909 Jon Hunter     2016-06-07  2710  	retval = irq_chip_pm_get(&desc->irq_data);
4396f46c8c6283 Shawn Lin      2016-08-22  2711  	if (retval < 0) {
4396f46c8c6283 Shawn Lin      2016-08-22  2712  		kfree(action);
be45beb2df6909 Jon Hunter     2016-06-07  2713  		return retval;
4396f46c8c6283 Shawn Lin      2016-08-22  2714  	}
be45beb2df6909 Jon Hunter     2016-06-07  2715  
31d9d9b6d83030 Marc Zyngier   2011-09-23  2716  	retval = __setup_irq(irq, desc, action);
31d9d9b6d83030 Marc Zyngier   2011-09-23  2717  
be45beb2df6909 Jon Hunter     2016-06-07  2718  	if (retval) {
be45beb2df6909 Jon Hunter     2016-06-07  2719  		irq_chip_pm_put(&desc->irq_data);
31d9d9b6d83030 Marc Zyngier   2011-09-23  2720  		kfree(action);
be45beb2df6909 Jon Hunter     2016-06-07  2721  	}
31d9d9b6d83030 Marc Zyngier   2011-09-23  2722  
31d9d9b6d83030 Marc Zyngier   2011-09-23  2723  	return retval;
31d9d9b6d83030 Marc Zyngier   2011-09-23  2724  }
24195a8917b80c Will Deacon    2026-04-17  2725  EXPORT_SYMBOL_GPL(__request_percpu_irq_NEW);
24195a8917b80c Will Deacon    2026-04-17  2726  

:::::: The code at line 2690 was first introduced by commit
:::::: 31d9d9b6d83030f748d013e61502fa5477e2ac0e genirq: Add support for per-cpu dev_id interrupts

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
