Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C949D3208
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 12:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165189; cv=none; b=UWWSyc2gZKwRLH6EMRZ/wXSb9bq+5CfByUO7tGTDtYX4G5q2uFX7vZl3plYFWy2m5aVFF/OfscWez86wgw+m3DT9s5jXjLjHoWV2swyESvME8O60Z810We+PiDmXPp/yFqrSC/BSwJS+P09GUmDRi+otvSU2BNytN/QBqOVJS1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165189; c=relaxed/simple;
	bh=q8bKHVL6pB8J+AtOmNlBwJ3zl4qZj5T6Qp+MRFa1IMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m32udRq9c3Ka1zN8KLFfWrRxVEwynRpIoQAgQ1huyEFMVrkDp0gxgh9ASWan0G2DHNE8Yr0Zu6O+4sM/AWNiTzhpDDCtLkAnjlSuBvWnn+xC0joS8xfm2NL5n6FcgMMs7iGsaqlA9rYcBHp1WGQBC3V4gOIONLVuSgPWTXDeTK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYGU11+B; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYGU11+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743165188; x=1774701188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q8bKHVL6pB8J+AtOmNlBwJ3zl4qZj5T6Qp+MRFa1IMc=;
  b=AYGU11+BCnvnSKoJNiPAqckiPKowXfFE1QRPaHXuZfwsntukhbpW+klC
   S8ar+/IbNjLlMJrYRGX0pBDaWMjG74V5BOYBWZFhk6U4MFLcftjQd5wWE
   lTZi21taE0I7ZJoqGFAXXmAROwrmGv9r/eyb0LEQkdDvVNWErJQaXCUkK
   sJ8nb1SLPnpGs0VI7LaA/vHYF4SCkxuU0ZOePbIjnnsU6ysQeuOLS0eF8
   rNjU4sE3pbvDl/0moEZ7J2iS6vNf+JnQWYaY7eRl/24zPmjZgzxzLUF7M
   O8gdnoUl9QnugpgAZkoHtBRe9N6PdEz8w0k7wQMkOtRQ7gJaL7v5s7S43
   g==;
X-CSE-ConnectionGUID: bJ1yF5KRRGGDhWDHja4Gqg==
X-CSE-MsgGUID: xIUICnmgS4+Ng6J+9/FK+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44245819"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44245819"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 05:33:07 -0700
X-CSE-ConnectionGUID: XK8XL53dQUGzHKcidPntcQ==
X-CSE-MsgGUID: WdQvG5FpQTyRKgcOvvAY9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="126360850"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Mar 2025 05:33:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty8tS-0007Ri-28;
	Fri, 28 Mar 2025 12:33:02 +0000
Date: Fri, 28 Mar 2025 20:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 17/17] kernel/irq/manage.c:2619:22: warning:
 assignment makes pointer from integer without a cast
Message-ID: <202503282049.7rjXBkvh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/ppi
head:   e9141d0584201dc14a70533175804e111ab53f36
commit: e9141d0584201dc14a70533175804e111ab53f36 [17/17] WIP
config: sparc-randconfig-002-20250328 (https://download.01.org/0day-ci/archive/20250328/202503282049.7rjXBkvh-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503282049.7rjXBkvh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503282049.7rjXBkvh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/irq_32.h:16:0,
                    from arch/sparc/include/asm/irq.h:7,
                    from include/linux/irq.h:23,
                    from kernel/irq/manage.c:11:
   include/linux/interrupt.h:130:2: error: expected identifier or '(' before 'struct'
     struct irqaction *next;
     ^~~~~~
   In file included from kernel/irq/manage.c:25:0:
   kernel/irq/manage.c: In function 'irq_set_thread_affinity':
   kernel/irq/internals.h:173:41: error: 'struct irqaction' has no member named 'next'
     for (act = desc->action; act; act = act->next)
                                            ^
   kernel/irq/manage.c:194:2: note: in expansion of macro 'for_each_action_of_desc'
     for_each_action_of_desc(desc, action) {
     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c: In function 'irq_wake_thread':
   kernel/irq/internals.h:173:41: error: 'struct irqaction' has no member named 'next'
     for (act = desc->action; act; act = act->next)
                                            ^
   kernel/irq/manage.c:1350:2: note: in expansion of macro 'for_each_action_of_desc'
     for_each_action_of_desc(desc, action) {
     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c: In function '__setup_irq':
   kernel/irq/manage.c:1662:18: error: 'struct irqaction' has no member named 'next'
       old_ptr = &old->next;
                     ^~
   kernel/irq/manage.c: In function '__free_irq':
   kernel/irq/manage.c:1902:23: error: 'struct irqaction' has no member named 'next'
      action_ptr = &action->next;
                          ^~
   kernel/irq/manage.c:1906:22: error: 'struct irqaction' has no member named 'next'
     *action_ptr = action->next;
                         ^~
   kernel/irq/manage.c: In function '__request_percpu_irq':
   kernel/irq/manage.c:2619:24: error: implicit declaration of function 'alloc_cpumask'; did you mean 'alloc_cpumask_var'? [-Werror=implicit-function-declaration]
      action->valid_mask = alloc_cpumask()
                           ^~~~~~~~~~~~~
                           alloc_cpumask_var
>> kernel/irq/manage.c:2619:22: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      action->valid_mask = alloc_cpumask()
                         ^
   kernel/irq/manage.c:2620:2: error: expected ';' before '}' token
     }
     ^
   cc1: some warnings being treated as errors


vim +2619 kernel/irq/manage.c

  2577	
  2578	/**
  2579	 *	__request_percpu_irq - allocate a percpu interrupt line
  2580	 *	@irq: Interrupt line to allocate
  2581	 *	@handler: Function to be called when the IRQ occurs.
  2582	 *	@flags: Interrupt type flags (IRQF_TIMER only)
  2583	 *	@devname: An ascii name for the claiming device
  2584	 *	@dev_id: A percpu cookie passed back to the handler function
  2585	 *
  2586	 *	This call allocates interrupt resources and enables the
  2587	 *	interrupt on the local CPU. If the interrupt is supposed to be
  2588	 *	enabled on other CPUs, it has to be done on each CPU using
  2589	 *	enable_percpu_irq().
  2590	 *
  2591	 *	Dev_id must be globally unique. It is a per-cpu variable, and
  2592	 *	the handler gets called with the interrupted CPU's instance of
  2593	 *	that variable.
  2594	 */
  2595	int __request_percpu_irq(unsigned int irq, irq_handler_t handler,
  2596				 unsigned long flags, const char *devname,
  2597				 const cpumask_t *valid_mask, void __percpu *dev_id)
  2598	{
  2599		struct irqaction *action;
  2600		struct irq_desc *desc;
  2601		int retval;
  2602	
  2603		if (!dev_id)
  2604			return -EINVAL;
  2605	
  2606		desc = irq_to_desc(irq);
  2607		if (!desc || !irq_settings_can_request(desc) ||
  2608		    !irq_settings_is_per_cpu_devid(desc))
  2609			return -EINVAL;
  2610	
  2611		if (flags && flags != IRQF_TIMER)
  2612			return -EINVAL;
  2613	
  2614		action = kzalloc(sizeof(struct irqaction), GFP_KERNEL);
  2615		if (!action)
  2616			return -ENOMEM;
  2617	
  2618		if (valid_mask != cpu_possible_mask) {
> 2619			action->valid_mask = alloc_cpumask()
  2620		}
  2621	
  2622		action->handler = handler;
  2623		action->flags = flags | IRQF_PERCPU | IRQF_NO_SUSPEND;
  2624		action->name = devname;
  2625		action->percpu_dev_id = dev_id;
  2626	
  2627		retval = irq_chip_pm_get(&desc->irq_data);
  2628		if (retval < 0) {
  2629			kfree(action);
  2630			return retval;
  2631		}
  2632	
  2633		retval = __setup_irq(irq, desc, action);
  2634	
  2635		if (retval) {
  2636			irq_chip_pm_put(&desc->irq_data);
  2637			kfree(action);
  2638		}
  2639	
  2640		return retval;
  2641	}
  2642	EXPORT_SYMBOL_GPL(__request_percpu_irq);
  2643	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
