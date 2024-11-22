Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AF7145A03
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 04:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732251291; cv=none; b=fpupR28wETKf0MbiqzLNV5LmaNKSIdRYVZLvhito0nIZL0qxA2qXNn9R03RyQg70wzUCn7ekYs8aBo5h5uY9e4NTLtboe8Vdt8imp/59Hd7dtqUs4D3FmQm88sNXTB1LwQWyHCzHPZS1yzAdteULUJw0B0W4DkWrcvEqV7VTVyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732251291; c=relaxed/simple;
	bh=SEPeIBTNGyK82A2Op9xArRRkfTQjjDS+x4iiDulOMJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SWvEC6hxtDFcaGRkONXofaMVa0HwE+fiJU0t53pLSqY5qy+RuiD1he/HH0MJRMICRzt9Sc1dois1wm1RMhAs577VzUfMO4Jpv4nVjrtjXvb56FPSzhTs+ZTcLoHA4nH7BQTK041MrD+6DUI5cGKLvONYA36XBFrgK47PVszgRpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIEczRwO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIEczRwO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732251288; x=1763787288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SEPeIBTNGyK82A2Op9xArRRkfTQjjDS+x4iiDulOMJw=;
  b=LIEczRwO8A699C+gkLtGmwFZyedg9/ddCIW83mmBoktCggBgV0WdWYvv
   Ni7Yqh0RRity6vH/e89a63KC7iv09HeXAOyvUfj0yVXGdfcHsxBDVj64j
   TuJb8YTyFE0wnMKFxV3+0IMxPfy/cb8bozc7hMeRqNwMrfjrOJwxUuydF
   UtwFQ9OKgmiAGOm8JqSkR0s9SzqI3au/uhyo6JjxvB1N/gr3vQ7egXahU
   XVhaYuYZjgiVwTI/6C4tEHYnE3bv1l/xF5SGwE44ezUoHZrzIxhYb2SmW
   XGBEZjNdZat1lWDx2w9ytsvD9xiFo6sYQUUS1kjKGy5zvDAeYBUWC5ZgH
   w==;
X-CSE-ConnectionGUID: Je/tx9vATGKry24JWu2tMA==
X-CSE-MsgGUID: HmpL0iWBR3yUL43lvgaCzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54902012"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="54902012"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 20:54:47 -0800
X-CSE-ConnectionGUID: c0H6vuQ/SzeaeGo51Imi+w==
X-CSE-MsgGUID: EwHIFRqTRSq6vPuemXXJjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="94907465"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Nov 2024 20:54:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tELgp-0003gL-0R;
	Fri, 22 Nov 2024 04:54:43 +0000
Date: Fri, 22 Nov 2024 12:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangchangzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1304/1304] kernel/sched/core.c:5845:2:
 error: implicit declaration of function 'tg_update_affinity_domains'
Message-ID: <202411221242.ljLHS46N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hui,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   81e029d5dd0cae934243168eee37ef303ebcce38
commit: 713cfd2684fa5ea08b144d92b9858b932c0f1705 [1304/1304] sched: Introduce smart grid scheduling strategy for cfs
config: x86_64-randconfig-002-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221242.ljLHS46N-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411221242.ljLHS46N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221242.ljLHS46N-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:8:
   In file included from kernel/sched/sched.h:39:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/core.c:8:
   kernel/sched/sched.h:1249:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1249 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:1587:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
    1587 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^
   kernel/sched/core.c:1587:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1587 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         | ^
         | static 
   kernel/sched/core.c:2741:10: warning: cast from 'void (*)(struct callback_head *)' to 'void (*)(struct rq *)' converts to incompatible function type [-Wcast-function-type-strict]
    2741 |                 func = (void (*)(struct rq *))head->func;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:3632:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
    3632 | asmlinkage __visible void __sched schedule_user(void)
         |                                   ^
   kernel/sched/core.c:3632:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3632 | asmlinkage __visible void __sched schedule_user(void)
         |                      ^
         |                      static 
   kernel/sched/core.c:3771:35: warning: no previous prototype for function 'preempt_schedule_irq' [-Wmissing-prototypes]
    3771 | asmlinkage __visible void __sched preempt_schedule_irq(void)
         |                                   ^
   kernel/sched/core.c:3771:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3771 | asmlinkage __visible void __sched preempt_schedule_irq(void)
         |                      ^
         |                      static 
>> kernel/sched/core.c:5845:2: error: implicit declaration of function 'tg_update_affinity_domains' [-Werror,-Wimplicit-function-declaration]
    5845 |         tg_update_affinity_domains(cpu, 1);
         |         ^
   kernel/sched/core.c:5904:2: error: implicit declaration of function 'tg_update_affinity_domains' [-Werror,-Wimplicit-function-declaration]
    5904 |         tg_update_affinity_domains(cpu, 0);
         |         ^
   kernel/sched/core.c:5976:2: error: implicit declaration of function 'init_auto_affinity' [-Werror,-Wimplicit-function-declaration]
    5976 |         init_auto_affinity(&root_task_group);
         |         ^
   kernel/sched/core.c:5976:2: note: did you mean 'irq_set_affinity'?
   include/linux/interrupt.h:292:1: note: 'irq_set_affinity' declared here
     292 | irq_set_affinity(unsigned int irq, const struct cpumask *cpumask)
         | ^
   kernel/sched/core.c:5976:22: error: use of undeclared identifier 'root_task_group'; did you mean 'task_group'?
    5976 |         init_auto_affinity(&root_task_group);
         |                             ^~~~~~~~~~~~~~~
         |                             task_group
   kernel/sched/sched.h:1444:34: note: 'task_group' declared here
    1444 | static inline struct task_group *task_group(struct task_struct *p)
         |                                  ^
   kernel/sched/core.c:6029:32: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
    6029 |         unsigned long alloc_size = 0, ptr;
         |                                       ^
   7 warnings and 4 errors generated.


vim +/tg_update_affinity_domains +5845 kernel/sched/core.c

  5831	
  5832	int sched_cpu_activate(unsigned int cpu)
  5833	{
  5834		struct rq *rq = cpu_rq(cpu);
  5835		struct rq_flags rf;
  5836	
  5837	#ifdef CONFIG_SCHED_SMT
  5838		/*
  5839		 * When going up, increment the number of cores with SMT present.
  5840		 */
  5841		if (cpumask_weight(cpu_smt_mask(cpu)) == 2)
  5842			static_branch_inc_cpuslocked(&sched_smt_present);
  5843	#endif
  5844		set_cpu_active(cpu, true);
> 5845		tg_update_affinity_domains(cpu, 1);
  5846	
  5847		if (sched_smp_initialized) {
  5848			sched_domains_numa_masks_set(cpu);
  5849			cpuset_cpu_active();
  5850		}
  5851	
  5852		/*
  5853		 * Put the rq online, if not already. This happens:
  5854		 *
  5855		 * 1) In the early boot process, because we build the real domains
  5856		 *    after all CPUs have been brought up.
  5857		 *
  5858		 * 2) At runtime, if cpuset_cpu_active() fails to rebuild the
  5859		 *    domains.
  5860		 */
  5861		rq_lock_irqsave(rq, &rf);
  5862		if (rq->rd) {
  5863			BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
  5864			set_rq_online(rq);
  5865		}
  5866		rq_unlock_irqrestore(rq, &rf);
  5867	
  5868		update_max_interval();
  5869	
  5870		return 0;
  5871	}
  5872	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
