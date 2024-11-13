Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9882216C453
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 03:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731468588; cv=none; b=uTmypYs5ZonU3qui+H4XUQsy0ooj98M0XAkp1LibjUK9TgGmWQvjWGG+K0PuNndTCHcgiT30pwat7E3iUJc75nmId1sWhH80ijg/UcFITOLQB7ZkHtuGtecqnxFXLdRuLbIEHA9rGnMpR4XkMeSFcH62+fDr4yrEiQ7HVo9XKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731468588; c=relaxed/simple;
	bh=AQlrjOSVEwHawp+F+U4TLs08P9BAroO6E6BavfzXG9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s1ext6j3DNjELZaGN4LeXkbhEa3edttgD6rMqUHPwtb/oQngO8fKe1TuPAf+Ie95PCrWaroOGoHQhzb2KqM1Rj0sWGhYH46YE9FleNvBdaVsfZaxIh8LxGKmFEmqxyPZ3aSKG/TMR/Q9YfsRb8dcdPFdWsq2UexVGi9Lip1ONKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLqFBWPi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLqFBWPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731468586; x=1763004586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQlrjOSVEwHawp+F+U4TLs08P9BAroO6E6BavfzXG9g=;
  b=RLqFBWPiSCyvu7hm/Bl0YxES3ToFfCKBbmM8O0BM8zlpXY8jxXUx0A3k
   X+A1v8YTpCmakNByWu9PUARoi9M2Dp1psoBhPpozJo05JXpnZeTSUb1UB
   mIohr0h6KFFYptz01HJwEJuTxzemUOrP9UxnE1avdPf2+3MvMI5rlDZOK
   2REdpA7lIjQL/PnZ0iaDZ1y7RSOJac96cTE1YZkxFjlNeKOLDsdOG+kax
   bmghhqJKNAjkVMxTH4nuIzEVu+k40icXaXJd90wBjHcep8hYf3qHw/fdx
   l1rUjDMAaK6KmPhKZ1wGrWcpoBUWzXojNSJiYobkVsOGxMugvu3cFWfES
   w==;
X-CSE-ConnectionGUID: lH7ps5r4QyiEyU/QkOGqFw==
X-CSE-MsgGUID: J3KGS7qmS1KePDBs5CH9DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53891395"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53891395"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 19:29:43 -0800
X-CSE-ConnectionGUID: rWGN+yZ8SaGIm3wXRrc76A==
X-CSE-MsgGUID: bnRQ3koqSX+pzrO5OmfnQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="111040571"
Received: from lkp-server01.sh.intel.com (HELO c782e932e0d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2024 19:29:13 -0800
Received: from kbuild by c782e932e0d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB446-00001L-2k;
	Wed, 13 Nov 2024 03:29:10 +0000
Date: Wed, 13 Nov 2024 11:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangchangzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291] kernel/sched/core.c:5976:2:
 error: implicit declaration of function 'init_auto_affinity'
Message-ID: <202411131145.yjptmRWX-lkp@intel.com>
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
head:   58ec866c31299a4b0d63a01cb026877c5f85e4d9
commit: 713cfd2684fa5ea08b144d92b9858b932c0f1705 [1291/1291] sched: Introduce smart grid scheduling strategy for cfs
config: x86_64-buildonly-randconfig-002-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131145.yjptmRWX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131145.yjptmRWX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131145.yjptmRWX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:8:
   In file included from kernel/sched/sched.h:52:
   In file included from include/linux/migrate.h:6:
   In file included from include/linux/mempolicy.h:16:
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
   kernel/sched/core.c:5845:2: error: implicit declaration of function 'tg_update_affinity_domains' [-Werror,-Wimplicit-function-declaration]
    5845 |         tg_update_affinity_domains(cpu, 1);
         |         ^
   kernel/sched/core.c:5904:2: error: implicit declaration of function 'tg_update_affinity_domains' [-Werror,-Wimplicit-function-declaration]
    5904 |         tg_update_affinity_domains(cpu, 0);
         |         ^
>> kernel/sched/core.c:5976:2: error: implicit declaration of function 'init_auto_affinity' [-Werror,-Wimplicit-function-declaration]
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


vim +/init_auto_affinity +5976 kernel/sched/core.c

  5949	
  5950	void __init sched_init_smp(void)
  5951	{
  5952		sched_init_numa();
  5953	
  5954		/*
  5955		 * There's no userspace yet to cause hotplug operations; hence all the
  5956		 * CPU masks are stable and all blatant races in the below code cannot
  5957		 * happen. The hotplug lock is nevertheless taken to satisfy lockdep,
  5958		 * but there won't be any contention on it.
  5959		 */
  5960		cpus_read_lock();
  5961		mutex_lock(&sched_domains_mutex);
  5962		sched_init_domains(cpu_active_mask);
  5963		mutex_unlock(&sched_domains_mutex);
  5964		cpus_read_unlock();
  5965	
  5966		/* Move init over to a non-isolated CPU */
  5967		if (set_cpus_allowed_ptr(current, housekeeping_cpumask(HK_FLAG_DOMAIN)) < 0)
  5968			BUG();
  5969		sched_init_granularity();
  5970	
  5971		init_sched_rt_class();
  5972		init_sched_dl_class();
  5973	
  5974		sched_smp_initialized = true;
  5975	
> 5976		init_auto_affinity(&root_task_group);
  5977	}
  5978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
