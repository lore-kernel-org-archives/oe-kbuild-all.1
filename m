Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ED74A32
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jun 2026 05:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781934159; cv=none; b=TZJSrC7k8iQfco+ZbPSAG9kODQSklRuMBjf640MdVxBYtmD0dwVfw19C5vW651HIRjmFHiJ5gZozPxvfMtkaC0IBi3WsNVKB4aeRJl9WtuJz8DCvOQfNt5wOP4vj3G3UPgOgOCQpp8gwImzWU7gtUHkCeg1gIYoIEC4wp1GPi24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781934159; c=relaxed/simple;
	bh=IcnRWteyVKCkTHA81xWpK9pTVY7gDNxyF3UnD7aAOgM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LQ+J9As1TPbN5zJwWcqkN/KA88en7Mq9MshFlzy0t598Pi3G8lB77h0CdSIcv6UHMU1SGLTjYOM9Lzr6eaycj/EFUakhb8fP68Ob79TAvJE0ncmWSGVo2u5QQuzChk7q/57G/pyusvZ+DThnF5XzknaMumgB5bYtsi2N9ASxGPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNfkI1HS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNfkI1HS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781934156; x=1813470156;
  h=date:from:to:cc:subject:message-id;
  bh=IcnRWteyVKCkTHA81xWpK9pTVY7gDNxyF3UnD7aAOgM=;
  b=lNfkI1HSATxg1+cbCdvyWYkchAKA66EHrsyIlYX779Z+sf7Ph1VNXQlE
   4t08pixv2rdIcSzMZLzoNkuWjrq5F5vYIVwg7d4sZls3M4fnrpkpvdMVf
   Uw0b+gk0+p4fcTbXw3998zzCvdvqqYihPcxDwTd5PusRYIvSF2Ol7kQtq
   F4cf86F3E5OdsA7+rFT+/p0LoKnDxWpp4RwMVB+Aq5RTEJ6eYNNmUI4ok
   I83FLkz+TEWLGYP6ztBUzCg1bM2AqcUmuGanRP0BypNacE3xpgRkrpbLs
   mhOHNlPxQmTPw9Cn8yYio4D713W0heCzUWCtPjTgBZtr588D+9OFI6QC4
   g==;
X-CSE-ConnectionGUID: Vmby0uraST+P7qW1tQ9L4g==
X-CSE-MsgGUID: CCSQq90mSx664LFO6dj/4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="86442284"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="86442284"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 22:42:36 -0700
X-CSE-ConnectionGUID: smjABKzuS7ORReD9l51ZwA==
X-CSE-MsgGUID: odxE4IGdR4+JkhPjWGTOrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="286882408"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 19 Jun 2026 22:42:33 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waoTP-000000005jB-1hhk;
	Sat, 20 Jun 2026 05:42:31 +0000
Date: Sat, 20 Jun 2026 07:42:31 +0200
From: kernel test robot <lkp@intel.com>
To: Jing Wu <realwujing@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Qiliang Yuan <yuanql9@chinatelecom.cn>
Subject: kernel/irq/manage.c:2850:61: error: '__tmp_mask' undeclared
Message-ID: <202606200703.Ij55ckIz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jing-Wu/sched-isolation-Replace-notifier-chain-with-explicit-callback-interface/20260618-111648
head:   1558ace3815ead46d20cb956f01d41f6c64fbf22
commit: a9dbca218958fa8af0150cd86394228406942c62 genirq: Add explicit housekeeping callback for managed IRQ migration
date:   2 days ago
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20260620/202606200703.Ij55ckIz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260620/202606200703.Ij55ckIz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606200703.Ij55ckIz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/irq/manage.c:21:
   include/linux/sched/isolation.h:114:52: warning: 'struct housekeeping_cbs' declared inside parameter list will not be visible outside of this definition or declaration
     114 |                                             struct housekeeping_cbs *cbs) { return 0; }
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/sched/isolation.h:116:54: warning: 'struct housekeeping_cbs' declared inside parameter list will not be visible outside of this definition or declaration
     116 |                                               struct housekeeping_cbs *cbs) { return 0; }
         |                                                      ^~~~~~~~~~~~~~~~
   In file included from include/asm-generic/percpu.h:9,
                    from arch/x86/include/asm/percpu.h:598,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from kernel/irq/manage.c:11:
   kernel/irq/manage.c: In function 'irq_hk_apply':
>> kernel/irq/manage.c:2850:61: error: '__tmp_mask' undeclared (first use in this function)
    2850 |                         struct cpumask *tmp = this_cpu_ptr(&__tmp_mask);
         |                                                             ^~~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:268:33: note: in expansion of macro 'per_cpu_ptr'
     268 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:269:33: note: in expansion of macro 'raw_cpu_ptr'
     269 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   kernel/irq/manage.c:2850:47: note: in expansion of macro 'this_cpu_ptr'
    2850 |                         struct cpumask *tmp = this_cpu_ptr(&__tmp_mask);
         |                                               ^~~~~~~~~~~~
   kernel/irq/manage.c:2850:61: note: each undeclared identifier is reported only once for each function it appears in
    2850 |                         struct cpumask *tmp = this_cpu_ptr(&__tmp_mask);
         |                                                             ^~~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:268:33: note: in expansion of macro 'per_cpu_ptr'
     268 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:269:33: note: in expansion of macro 'raw_cpu_ptr'
     269 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   kernel/irq/manage.c:2850:47: note: in expansion of macro 'this_cpu_ptr'
    2850 |                         struct cpumask *tmp = this_cpu_ptr(&__tmp_mask);
         |                                               ^~~~~~~~~~~~
   kernel/irq/manage.c: At top level:
>> kernel/irq/manage.c:2874:15: error: variable 'irq_hk_cbs' has initializer but incomplete type
    2874 | static struct housekeeping_cbs irq_hk_cbs = {
         |               ^~~~~~~~~~~~~~~~
>> kernel/irq/manage.c:2875:10: error: 'struct housekeeping_cbs' has no member named 'name'
    2875 |         .name           = "genirq/managed",
         |          ^~~~
   kernel/irq/manage.c:2875:27: warning: excess elements in struct initializer
    2875 |         .name           = "genirq/managed",
         |                           ^~~~~~~~~~~~~~~~
   kernel/irq/manage.c:2875:27: note: (near initialization for 'irq_hk_cbs')
>> kernel/irq/manage.c:2876:10: error: 'struct housekeeping_cbs' has no member named 'pre_validate'
    2876 |         .pre_validate   = irq_hk_validate,
         |          ^~~~~~~~~~~~
   kernel/irq/manage.c:2876:27: warning: excess elements in struct initializer
    2876 |         .pre_validate   = irq_hk_validate,
         |                           ^~~~~~~~~~~~~~~
   kernel/irq/manage.c:2876:27: note: (near initialization for 'irq_hk_cbs')
>> kernel/irq/manage.c:2877:10: error: 'struct housekeeping_cbs' has no member named 'apply'
    2877 |         .apply          = irq_hk_apply,
         |          ^~~~~
   kernel/irq/manage.c:2877:27: warning: excess elements in struct initializer
    2877 |         .apply          = irq_hk_apply,
         |                           ^~~~~~~~~~~~
   kernel/irq/manage.c:2877:27: note: (near initialization for 'irq_hk_cbs')
   kernel/irq/manage.c: In function 'irq_hk_init':
>> kernel/irq/manage.c:2884:62: error: passing argument 2 of 'housekeeping_register_cbs' from incompatible pointer type [-Wincompatible-pointer-types]
    2884 |         ret = housekeeping_register_cbs(HK_TYPE_MANAGED_IRQ, &irq_hk_cbs);
         |                                                              ^~~~~~~~~~~
         |                                                              |
         |                                                              struct housekeeping_cbs *
   include/linux/sched/isolation.h:114:70: note: expected 'struct housekeeping_cbs *' but argument is of type 'struct housekeeping_cbs *'
     114 |                                             struct housekeeping_cbs *cbs) { return 0; }
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   kernel/irq/manage.c: At top level:
>> kernel/irq/manage.c:2874:32: error: storage size of 'irq_hk_cbs' isn't known
    2874 | static struct housekeeping_cbs irq_hk_cbs = {
         |                                ^~~~~~~~~~


vim +/__tmp_mask +2850 kernel/irq/manage.c

  2804	
  2805	/*
  2806	 * Managed IRQ housekeeping callback: iterate all managed IRQs and ask
  2807	 * the chip to move them off CPUs newly removed from HK_TYPE_MANAGED_IRQ.
  2808	 */
  2809	static void irq_hk_apply(enum hk_type type)
  2810	{
  2811		cpumask_var_t hk_mask;
  2812		struct irq_desc *desc;
  2813		unsigned int irq;
  2814	
  2815		if (!alloc_cpumask_var(&hk_mask, GFP_KERNEL))
  2816			return;
  2817	
  2818		/*
  2819		 * Snapshot the new HK_TYPE_MANAGED_IRQ mask under an RCU read lock
  2820		 * before iterating IRQ descriptors.  The lockdep annotation in
  2821		 * housekeeping_cpumask() requires an RCU read-side critical section
  2822		 * for runtime-mutable types.
  2823		 */
  2824		rcu_read_lock();
  2825		cpumask_copy(hk_mask, housekeeping_cpumask_rcu(HK_TYPE_MANAGED_IRQ));
  2826		rcu_read_unlock();
  2827	
  2828		irq_lock_sparse();
  2829	
  2830		for_each_active_irq(irq) {
  2831			desc = irq_to_desc(irq);
  2832			if (!desc || !desc->action)
  2833				continue;
  2834	
  2835			/*
  2836			 * Only managed interrupts are selected: they have
  2837			 * IRQF_AFFINITY_MANAGED set, meaning the kernel owns their
  2838			 * affinity.  User-controlled IRQs are intentionally skipped.
  2839			 *
  2840			 * When the intersection of the current affinity mask and the
  2841			 * new housekeeping mask is non-empty, re-apply the restricted
  2842			 * affinity to migrate the IRQ away from newly isolated CPUs.
  2843			 * If the intersection is empty (all serving CPUs are now
  2844			 * isolated), the IRQ is left on its current CPU temporarily;
  2845			 * handling that case (IRQ shutdown / re-startup) is left for
  2846			 * a follow-up.
  2847			 */
  2848			if (irqd_affinity_is_managed(&desc->irq_data)) {
  2849				const struct cpumask *mask;
> 2850				struct cpumask *tmp = this_cpu_ptr(&__tmp_mask);
  2851	
  2852				raw_spin_lock_irq(&desc->lock);
  2853				mask = irq_data_get_affinity_mask(&desc->irq_data);
  2854				cpumask_and(tmp, mask, hk_mask);
  2855				if (cpumask_intersects(tmp, cpu_online_mask))
  2856					irq_do_set_affinity(&desc->irq_data, tmp, false);
  2857				raw_spin_unlock_irq(&desc->lock);
  2858			}
  2859		}
  2860	
  2861		irq_unlock_sparse();
  2862		free_cpumask_var(hk_mask);
  2863	}
  2864	
  2865	static int irq_hk_validate(enum hk_type type,
  2866				   const struct cpumask *cur_mask,
  2867				   const struct cpumask *new_mask)
  2868	{
  2869		if (!IS_ENABLED(CONFIG_SMP))
  2870			return -EOPNOTSUPP;
  2871		return 0;
  2872	}
  2873	
> 2874	static struct housekeeping_cbs irq_hk_cbs = {
> 2875		.name		= "genirq/managed",
> 2876		.pre_validate	= irq_hk_validate,
> 2877		.apply		= irq_hk_apply,
  2878	};
  2879	
  2880	static int __init irq_hk_init(void)
  2881	{
  2882		int ret;
  2883	
> 2884		ret = housekeeping_register_cbs(HK_TYPE_MANAGED_IRQ, &irq_hk_cbs);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
