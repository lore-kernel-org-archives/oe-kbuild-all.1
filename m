Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F649881E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 21:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724706275; cv=none; b=R6bbpVsUtn8VPTDpQB1tv+xlmTAuQX8AteEIe9IMoKruJwyqwizFQd1a/8+Vxhrt2+xl6Edzt+mGvglfkRlF9XxJS+M8GzIAF+Tu6KZwgr4gJz7U4dnNfKEfwUXqVTQEDEUxsN11k4xAHYk1xVrbhpVEdlbMIsllYjTEA0cDy7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724706275; c=relaxed/simple;
	bh=Z281a+Fn0W3FmIAwm2rRp0u+y3sP2Q/ERDxJyCPOy4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMUS6zT+OUYS3Zmt4CqkdiwMqs8IIgz20puBcAAUQk3oSD2x69OQ9+5vqBzEMpUIBJCDGeomkKkpsEdJAo0R3j9ASoiO8i9mKFf/1ztVHHjU6AkRAMt1OvORlNARZSzZC5FrEjdM95yzyVpC+ZCsDEV2Cj/WUDBxcYJ4cDxdSOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQ/tmrc3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQ/tmrc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724706273; x=1756242273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z281a+Fn0W3FmIAwm2rRp0u+y3sP2Q/ERDxJyCPOy4Y=;
  b=SQ/tmrc3kpBImnnUGKpUpY/SHZXyq6mcRpDJKTA4rXn/f/sy35OgIKID
   rh5wrrbwv/4wqBfOJfQdavF5GJPhwVpVWIM3T/3EGlrbU/5S/KSyABJ8+
   HGBZZ9OOu6jzwSopBYfX8pJWrLiHACjzwxXHYUrIvIradp4K2GM5xoOFz
   yD4APwD1gghAj5IPdvEf4PQ2k29aqrHUWVyhKJWpmrTP/8o6NF28Lw7CW
   cBDdFmvII9e2ynN65HvnbSxBNTiPxNRj7R0djGBZ/oho7UzbcudhgyyZh
   6J8aS0wgXkibxBss7Wi9Uf5imD471y/lKW20qIvLo66ekl4kLb0LK04Ye
   A==;
X-CSE-ConnectionGUID: nPSfkBQzRCS90ZKvgLpSQw==
X-CSE-MsgGUID: QFXXHsxjTcasqGsNSXYevQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23334379"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="23334379"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 14:04:30 -0700
X-CSE-ConnectionGUID: Lha/vjDUTrGCzdYSOKtWBw==
X-CSE-MsgGUID: jTsN4saNR2ORtDk/q4p5jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="63367228"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Aug 2024 14:04:30 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sigt1-000Hb4-18;
	Mon, 26 Aug 2024 21:04:27 +0000
Date: Tue, 27 Aug 2024 05:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] genirq: Get rid of global lock in irq_do_set_affinity()
Message-ID: <202408270442.ktIulUsN-lkp@intel.com>
References: <20240826080618.3886694-1-maz@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826080618.3886694-1-maz@kernel.org>

Hi Marc,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v6.11-rc5 next-20240826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Zyngier/genirq-Get-rid-of-global-lock-in-irq_do_set_affinity/20240826-170538
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20240826080618.3886694-1-maz%40kernel.org
patch subject: [PATCH] genirq: Get rid of global lock in irq_do_set_affinity()
config: arc-randconfig-002-20240827 (https://download.01.org/0day-ci/archive/20240827/202408270442.ktIulUsN-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408270442.ktIulUsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408270442.ktIulUsN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7,
                    from ./arch/arc/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from arch/arc/include/asm/smp.h:104,
                    from arch/arc/include/asm/cmpxchg.h:13,
                    from arch/arc/include/asm/atomic.h:13,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:188,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from kernel/irq/manage.c:11:
   kernel/irq/manage.c: In function 'irq_do_set_affinity':
   include/linux/percpu-defs.h:92:40: error: section attribute cannot be specified for local variables
      92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
         |                                        ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:115:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:93:33: error: section attribute cannot be specified for local variables
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |                                 ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:115:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                ^~~~~~~~~~~~~~
>> include/linux/percpu-defs.h:93:33: error: declaration of '__pcpu_unique___tmp_mask' with no linkage follows extern declaration
      93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |                                 ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:115:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:92:40: note: previous declaration of '__pcpu_unique___tmp_mask' with type 'char'
      92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
         |                                        ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:115:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     115 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                ^~~~~~~~~~~~~~
>> kernel/irq/manage.c:230:47: error: section attribute cannot be specified for local variables
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                                               ^~~~~~~~~~
   include/linux/percpu-defs.h:94:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      94 |         extern __PCPU_ATTRS(sec) __typeof__(type) name;                 \
         |                                                   ^~~~
   kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                ^~~~~~~~~~~~~~
>> kernel/irq/manage.c:230:47: error: section attribute cannot be specified for local variables
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                                               ^~~~~~~~~~
   include/linux/percpu-defs.h:95:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                                                   ^~~~
   kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                ^~~~~~~~~~~~~~
>> kernel/irq/manage.c:230:47: error: weak declaration of '__tmp_mask' must be public
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                                               ^~~~~~~~~~
   include/linux/percpu-defs.h:95:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                                                   ^~~~
   kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                ^~~~~~~~~~~~~~
>> kernel/irq/manage.c:230:47: error: declaration of '__tmp_mask' with no linkage follows extern declaration
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                                               ^~~~~~~~~~
   include/linux/percpu-defs.h:95:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                                                   ^~~~
   kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                ^~~~~~~~~~~~~~
   kernel/irq/manage.c:230:47: note: previous declaration of '__tmp_mask' with type 'struct cpumask'
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                                               ^~~~~~~~~~
   include/linux/percpu-defs.h:94:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      94 |         extern __PCPU_ATTRS(sec) __typeof__(type) name;                 \
         |                                                   ^~~~
   kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
     230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
         |                ^~~~~~~~~~~~~~


vim +230 kernel/irq/manage.c

   220	
   221	int irq_do_set_affinity(struct irq_data *data, const struct cpumask *mask,
   222				bool force)
   223	{
   224		struct irq_desc *desc = irq_data_to_desc(data);
   225		struct irq_chip *chip = irq_data_get_irq_chip(data);
   226		const struct cpumask  *prog_mask;
   227		struct cpumask *tmp_mask;
   228		int ret;
   229	
 > 230		static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
   231	
   232		if (!chip || !chip->irq_set_affinity)
   233			return -EINVAL;
   234	
   235		tmp_mask = this_cpu_ptr(&__tmp_mask);
   236	
   237		/*
   238		 * If this is a managed interrupt and housekeeping is enabled on
   239		 * it check whether the requested affinity mask intersects with
   240		 * a housekeeping CPU. If so, then remove the isolated CPUs from
   241		 * the mask and just keep the housekeeping CPU(s). This prevents
   242		 * the affinity setter from routing the interrupt to an isolated
   243		 * CPU to avoid that I/O submitted from a housekeeping CPU causes
   244		 * interrupts on an isolated one.
   245		 *
   246		 * If the masks do not intersect or include online CPU(s) then
   247		 * keep the requested mask. The isolated target CPUs are only
   248		 * receiving interrupts when the I/O operation was submitted
   249		 * directly from them.
   250		 *
   251		 * If all housekeeping CPUs in the affinity mask are offline, the
   252		 * interrupt will be migrated by the CPU hotplug code once a
   253		 * housekeeping CPU which belongs to the affinity mask comes
   254		 * online.
   255		 */
   256		if (irqd_affinity_is_managed(data) &&
   257		    housekeeping_enabled(HK_TYPE_MANAGED_IRQ)) {
   258			const struct cpumask *hk_mask;
   259	
   260			hk_mask = housekeeping_cpumask(HK_TYPE_MANAGED_IRQ);
   261	
   262			cpumask_and(tmp_mask, mask, hk_mask);
   263			if (!cpumask_intersects(tmp_mask, cpu_online_mask))
   264				prog_mask = mask;
   265			else
   266				prog_mask = tmp_mask;
   267		} else {
   268			prog_mask = mask;
   269		}
   270	
   271		/*
   272		 * Make sure we only provide online CPUs to the irqchip,
   273		 * unless we are being asked to force the affinity (in which
   274		 * case we do as we are told).
   275		 */
   276		cpumask_and(tmp_mask, prog_mask, cpu_online_mask);
   277		if (!force && !cpumask_empty(tmp_mask))
   278			ret = chip->irq_set_affinity(data, tmp_mask, force);
   279		else if (force)
   280			ret = chip->irq_set_affinity(data, mask, force);
   281		else
   282			ret = -EINVAL;
   283	
   284		switch (ret) {
   285		case IRQ_SET_MASK_OK:
   286		case IRQ_SET_MASK_OK_DONE:
   287			cpumask_copy(desc->irq_common_data.affinity, mask);
   288			fallthrough;
   289		case IRQ_SET_MASK_OK_NOCOPY:
   290			irq_validate_effective_affinity(data);
   291			irq_set_thread_affinity(desc);
   292			ret = 0;
   293		}
   294	
   295		return ret;
   296	}
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
