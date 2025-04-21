Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B901E51E3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 23:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745279185; cv=none; b=fxz+aAjqzh28IEIkUxyXS1HS8sqaz0krlQyuz+gpti1dLIa5lXsFJJjMze9ituywqHUMm00x6YUWF69vktZsgUNBNK19l/EZwoZu/G+EUUgH9h5JemqfmRZZZa+J9oVkVfQOeeTouvSdoWlSfMUkDi6c3vWwb5K9m+AvKfzCXuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745279185; c=relaxed/simple;
	bh=qWZVKTd4MLKq4ccKgRjftZJ4ROFm8u4nh8uLaOynfk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qx7f84c3Cmn8n1Ra7o/vkODCf/AEfLqNkDbIkz+jrVYvc5NoZysyZzgKVavDjvXKs3VkhC9qe0ATrA5g2/6HXriwFJ4eJrBOHJqPuFeBN2GUGovKp9zZkWyD7Sj5I/jaz9hQRy0gONNH1HPIpZgbs8W8XpqIMOUiKcWASLlUnsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVhK69YP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVhK69YP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745279183; x=1776815183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qWZVKTd4MLKq4ccKgRjftZJ4ROFm8u4nh8uLaOynfk8=;
  b=kVhK69YPsp3e0MUcMR+ytMWM36yHqU+k1VP4Z+iZQ74Mx2+Ew29Ae1k4
   HO+fDtZjlV/EEmmJ30yNTlsNlfS066FMykWwERX9+87JUHExJm6iy3ZLV
   SScVXs2WZx1KPGgsM9lyIl3CxBIh/VjszA8BIH4p2LL/ikk29OOjHVl5p
   OslvEpJXtrjG39We7YmTrg59bDXZ+ujlBffcxFnggr7HOuFiRNKhrOC4D
   c+w2tao9QrCvVyIKn4vCZK6e4rMHe2sWQYktCDhT+je3hdU+E2VfxZXXT
   rnWojEfEKqh5TQEpr1me2wJf+ZwUKlYbIotQyBJcH+oef/jN396He4EL7
   A==;
X-CSE-ConnectionGUID: Fw/B7l2ZTTixyuUTBgwbMg==
X-CSE-MsgGUID: /6Zu6qYMR72zkI55DqMvFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57470012"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="57470012"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 16:46:19 -0700
X-CSE-ConnectionGUID: cCjhljN9TxOIfrCVdyteNg==
X-CSE-MsgGUID: PoGXtRppS5Cp1HX8HMKDYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="162820129"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Apr 2025 16:46:17 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u70q7-0000Sh-0n;
	Mon, 21 Apr 2025 23:46:15 +0000
Date: Tue, 22 Apr 2025 07:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/5] sched: Inhibit cache aware scheduling if the
 preferred LLC is over aggregated
Message-ID: <202504220710.wPfh5hyL-lkp@intel.com>
References: <2c45f6db1efef84c6c1ed514a8d24a9bc4a2ca4b.1745199017.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c45f6db1efef84c6c1ed514a8d24a9bc4a2ca4b.1745199017.git.yu.c.chen@intel.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on akpm-mm/mm-everything peterz-queue/sched/core linus/master v6.15-rc3 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu/sched-Cache-aware-load-balancing/20250421-113804
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/2c45f6db1efef84c6c1ed514a8d24a9bc4a2ca4b.1745199017.git.yu.c.chen%40intel.com
patch subject: [RFC PATCH 4/5] sched: Inhibit cache aware scheduling if the preferred LLC is over aggregated
config: arc-randconfig-r122-20250421 (https://download.01.org/0day-ci/archive/20250422/202504220710.wPfh5hyL-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250422/202504220710.wPfh5hyL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220710.wPfh5hyL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1318:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu * @@
   kernel/sched/fair.c:1318:51: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:1318:51: sparse:     got struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:1432:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:1432:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:1432:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:1495:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1495:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1495:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:13238:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13238:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13238:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7238:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7238:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:7238:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8632:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8632:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8632:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8937:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8937:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8937:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9081:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9081:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:9081:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9112:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9112:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:9112:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9330:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9330:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:9330:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:10374:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10374:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10374:40: sparse:     got struct sched_domain [noderef] __rcu *child
>> kernel/sched/fair.c:10705:42: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10705:42: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:10705:42: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:11045:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:11045:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:11045:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12490:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12490:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12490:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12140:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12140:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:12140:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12599:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12599:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12599:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:1234:26: sparse: sparse: context imbalance in 'fraction_mm_sched' - wrong count at exit
   kernel/sched/fair.c:1276:13: sparse: sparse: context imbalance in 'task_tick_cache' - different lock contexts for basic block
   kernel/sched/fair.c:6949:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2496:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2496:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2496:9: sparse:    struct task_struct *
   kernel/sched/fair.c: note: in included file (through arch/arc/include/asm/irqflags.h, include/linux/irqflags.h, include/linux/spinlock.h, ...):
   arch/arc/include/asm/irqflags-arcv2.h:80:31: sparse: sparse: undefined identifier '__builtin_arc_lr'
   arch/arc/include/asm/irqflags-arcv2.h:83:17: sparse: sparse: undefined identifier '__builtin_arc_sr'
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2284:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2284:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2284:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2284:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2284:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2284:26: sparse:    struct task_struct *

vim +10705 kernel/sched/fair.c

 10694	
 10695	#ifdef CONFIG_SCHED_CACHE
 10696	/*
 10697	 * Save this sched group's statistic for later use:
 10698	 * The task wakeup and load balance can make better
 10699	 * decision based on these statistics.
 10700	 */
 10701	static void update_sg_if_llc(struct lb_env *env, struct sg_lb_stats *sgs,
 10702				     struct sched_group *group)
 10703	{
 10704		/* Find the sched domain that spans this group. */
 10705		struct sched_domain *sd = env->sd->child;
 10706		struct sched_domain_shared *sd_share;
 10707		u64 last_nr;
 10708	
 10709		if (!sched_feat(SCHED_CACHE) || env->idle == CPU_NEWLY_IDLE)
 10710			return;
 10711	
 10712		/* only care the sched domain that spans 1 LLC */
 10713		if (!sd || !(sd->flags & SD_SHARE_LLC) ||
 10714		    !sd->parent || (sd->parent->flags & SD_SHARE_LLC))
 10715			return;
 10716	
 10717		sd_share = rcu_dereference(per_cpu(sd_llc_shared,
 10718					   cpumask_first(sched_group_span(group))));
 10719		if (!sd_share)
 10720			return;
 10721	
 10722		last_nr = READ_ONCE(sd_share->nr_avg);
 10723		update_avg(&last_nr, sgs->sum_nr_running);
 10724	
 10725		if (likely(READ_ONCE(sd_share->util_avg) != sgs->group_util))
 10726			WRITE_ONCE(sd_share->util_avg, sgs->group_util);
 10727	
 10728		WRITE_ONCE(sd_share->nr_avg, last_nr);
 10729	}
 10730	#else
 10731	static inline void update_sg_if_llc(struct lb_env *env, struct sg_lb_stats *sgs,
 10732					    struct sched_group *group)
 10733	{
 10734	}
 10735	#endif
 10736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
