Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9BF23AD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 04:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754021002; cv=none; b=jBvUDS27E7AFZqSMEYMp7MIl5HlsgSUhZmAFkSoFLb98dQfAoQZg9zZAHCG+Z6zKXUl6KiqCg/9kwYBFJs5jZpn1xFoziNAHzjaYhk2FWLiay/F7JTyL+bbjcKcioI49lqPsFTORVzRxbm/ZRXKcrPC5jdq57L6iNZPgR0V7LSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754021002; c=relaxed/simple;
	bh=RH88CElOM73qe5Gp4wA7rpTpR2LMaFx/xlQ73c0WDyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FG1u/sEhiaYzTRG1IGIOdxG8QVCVJuOmQic+Z4ig/1c/zf2vWsHj2ysKBL5qxE1audYFA2QSKs894QA205h2iPW3EWgSVP/1D6CSreURrY3cF0+LmiuKIN0M1ziL1CZS9iGmcR2H8fSNRoE7jKMyGPGL+cJJc+1XydhoTVR2YVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpudfmeX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpudfmeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754021001; x=1785557001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RH88CElOM73qe5Gp4wA7rpTpR2LMaFx/xlQ73c0WDyk=;
  b=mpudfmeXYDATnOOIrrlikK6wjrX2txPRx8ti+GL095e822aNWS1cn1YJ
   Au952E5hEsvDtoz4oUzLDPSHMSjAmV+hTJn/TXNCBNWfVpr3N4l2eCg/+
   IwQGfGoKVcurrJwNxMmQNtk/qLAN0PMpNVdFHr89nfETMDrg5Hbjmarn3
   MIM/Dhc9lidr3tocIt6Wpz8LRjKxMeD+sx3nQ9pD4lfv4u+xdZ5VuKge6
   HkAzI62IIlnopmNy/g0iYjSotdcYiVQ+LxFcI0Y6NDga9B63EgYJ3uuc0
   yzFTLWgQYsAhGkBXIBuc6YAZ0yK+h3MVekukcG6FtoDLbUG05eVfoxtpU
   A==;
X-CSE-ConnectionGUID: p1lZHBquR1yF7ikrcGC7Yw==
X-CSE-MsgGUID: QemeIiqdQlOejb22rEzNsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56320934"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56320934"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 21:03:20 -0700
X-CSE-ConnectionGUID: CNdbwFEdS+ug5dAJmMJgww==
X-CSE-MsgGUID: y237KQWNRr2pWh83k0YBPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163016432"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Jul 2025 21:03:19 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhgzF-0004Ku-0f;
	Fri, 01 Aug 2025 04:03:17 +0000
Date: Fri, 1 Aug 2025 12:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 25/25] kernel/irq/manage.c:2466:47: error:
 initialization of 'struct irq_action *' from incompatible pointer type
 'struct irqaction **'
Message-ID: <202508011246.xuBfT6Ao-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/ppi
head:   8a3b504aca25e8c9a274cb563d63a6b9454b2780
commit: 8a3b504aca25e8c9a274cb563d63a6b9454b2780 [25/25] WIP
config: i386-buildonly-randconfig-002-20250801 (https://download.01.org/0day-ci/archive/20250801/202508011246.xuBfT6Ao-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011246.xuBfT6Ao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011246.xuBfT6Ao-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/irq/manage.c:2453:5: warning: no previous prototype for 'add_percpu_irq_target' [-Wmissing-prototypes]
    2453 | int add_percpu_irq_target(unsigned int irq, void __percpu *dev_id)
         |     ^~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c: In function 'add_percpu_irq_target':
>> kernel/irq/manage.c:2466:47: error: initialization of 'struct irq_action *' from incompatible pointer type 'struct irqaction **' [-Werror=incompatible-pointer-types]
    2466 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next) {
         |                                               ^
>> kernel/irq/manage.c:2466:76: error: invalid use of undefined type 'struct irq_action'
    2466 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next) {
         |                                                                            ^~
   kernel/irq/manage.c:2467:69: error: invalid use of undefined type 'struct irq_action'
    2467 |                         if (cpumask_test_cpu(smp_processor_id(), tmp->affinity))
         |                                                                     ^~
   kernel/irq/manage.c:2470:32: error: invalid use of undefined type 'struct irq_action'
    2470 |                         if (tmp->percpu_dev_id == dev_id)
         |                                ^~
   kernel/irq/manage.c:2474:59: error: invalid use of undefined type 'struct irq_action'
    2474 |                 cpumask_set_cpu(smp_processor_id(), action->affinity);
         |                                                           ^~
   kernel/irq/manage.c:2477:42: error: invalid use of undefined type 'struct irq_action'
    2477 |                 if (cpumask_weight(action->affinity) == nr_possible_cpus())
         |                                          ^~
>> kernel/irq/manage.c:2477:57: error: implicit declaration of function 'nr_possible_cpus'; did you mean 'num_possible_cpus'? [-Werror=implicit-function-declaration]
    2477 |                 if (cpumask_weight(action->affinity) == nr_possible_cpus())
         |                                                         ^~~~~~~~~~~~~~~~
         |                                                         num_possible_cpus
   kernel/irq/manage.c:2478:31: error: invalid use of undefined type 'struct irq_action'
    2478 |                         action->flags &= ~IRQF_SHARED;
         |                               ^~
   kernel/irq/manage.c: At top level:
>> kernel/irq/manage.c:2484:5: warning: no previous prototype for 'remove_percpu_irq_target' [-Wmissing-prototypes]
    2484 | int remove_percpu_irq_target(unsigned int irq)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c: In function 'remove_percpu_irq_target':
   kernel/irq/manage.c:2495:47: error: initialization of 'struct irq_action *' from incompatible pointer type 'struct irqaction **' [-Werror=incompatible-pointer-types]
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                                               ^
>> kernel/irq/manage.c:2495:17: error: 'struct irq_action' declared in 'for' loop initial declaration
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                 ^~~
   kernel/irq/manage.c:2495:76: error: invalid use of undefined type 'struct irq_action'
    2495 |                 for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
         |                                                                            ^~
   kernel/irq/manage.c:2496:79: error: invalid use of undefined type 'struct irq_action'
    2496 |                         if (cpumask_test_and_clear_cpu(smp_processor_id(), tmp->affinity)) {
         |                                                                               ^~
>> kernel/irq/manage.c:2497:52: error: 'action' undeclared (first use in this function); did you mean 'no_action'?
    2497 |                                 if (cpumask_weight(action->affinity) < nr_possible_cpus())
         |                                                    ^~~~~~
         |                                                    no_action
   kernel/irq/manage.c:2497:52: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +2466 kernel/irq/manage.c

  2452	
> 2453	int add_percpu_irq_target(unsigned int irq, void __percpu *dev_id)
  2454	{
  2455		struct irq_desc *desc = irq_to_desc(irq);
  2456	
  2457		if (!desc || !irq_settings_is_per_cpu_devid(desc))
  2458			return -EINVAL;
  2459	
  2460		scoped_guard(raw_spinlock_irqsave, &desc->lock) {
  2461			struct irq_action *action = NULL;
  2462	
  2463			if (cpumask_test_cpu(smp_processor_id(), desc->percpu_enabled))
  2464				return -EINVAL;
  2465	
> 2466			for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next) {
  2467				if (cpumask_test_cpu(smp_processor_id(), tmp->affinity))
  2468					return -EINVAL;
  2469	
  2470				if (tmp->percpu_dev_id == dev_id)
  2471					action = tmp;
  2472			}
  2473	
  2474			cpumask_set_cpu(smp_processor_id(), action->affinity);
  2475	
  2476			/* If we have a full house, indicate we can't share anymore */
> 2477			if (cpumask_weight(action->affinity) == nr_possible_cpus())
  2478				action->flags &= ~IRQF_SHARED;
  2479		}
  2480	
  2481		return 0;
  2482	}
  2483	
> 2484	int remove_percpu_irq_target(unsigned int irq)
  2485	{
  2486		struct irq_desc *desc = irq_to_desc(irq);
  2487	
  2488		if (!desc || !irq_settings_is_per_cpu_devid(desc))
  2489			return -EINVAL;
  2490	
  2491		scoped_guard(raw_spinlock_irqsave, &desc->lock) {
  2492			if (cpumask_test_cpu(smp_processor_id(), desc->percpu_enabled))
  2493				return -EINVAL;
  2494	
> 2495			for (struct irq_action *tmp = &desc->action; tmp; tmp = tmp->next)
  2496				if (cpumask_test_and_clear_cpu(smp_processor_id(), tmp->affinity)) {
> 2497					if (cpumask_weight(action->affinity) < nr_possible_cpus())
  2498						action->flags |= IRQF_SHARED;
  2499	
  2500					return 0;
  2501				}
  2502		}
  2503	
  2504		return -ENOENT;
  2505	}
  2506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
