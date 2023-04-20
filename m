Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A95946F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 23:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682033222; x=1713569222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9zQSTV+mvRMO0gJQfAHO8/tTFFCRFjvnQjYB2o73jSk=;
  b=WNoVgnrvqD1uV5LWQ42XMhEbsSDT68v83ZGGHeAtxd5bR66E3310f9ke
   TBs+lr0ZC1w9KEcEAhHergkCAROZL82uFiEIfpd3ceYzuxQOteSFYrmrV
   kycAjrEegXOmtw1pwZsrEBli8JJfTYgnee6Kh4s/FHS6ujcqFeRtMz4UC
   6fLPLhX/4e/rNkH+nseOzRIseiuU4iXfmNhvdltH39wixOyMxl6BlXkib
   vdZOss3U3JbCCKiZ/uSGw0n7qZ+NdlUspZWcY24KBY77+cLjNQ02d0j1l
   bnFCxbmKOYkpuicGaUng8fwawW5deUj4vu9GsYLqtiMzw1F+V8+CbHo8M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432151311"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="432151311"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 16:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="938262297"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="938262297"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Apr 2023 16:26:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppdg1-000gAY-0c;
	Thu, 20 Apr 2023 23:26:57 +0000
Date: Fri, 21 Apr 2023 07:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop-debugobj 2/2] kernel/rcu/tree.c:4930:26: warning:
 unused variable 'rdp'
Message-ID: <202304210757.X8c9JDMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop-debugobj
head:   c3c9af7f55e25cd3aa48db8bb3623102f34285cb
commit: c3c9af7f55e25cd3aa48db8bb3623102f34285cb [2/2] rcu/debug: Add support for debugfs debugging of RCU CBs.
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230421/202304210757.X8c9JDMp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=c3c9af7f55e25cd3aa48db8bb3623102f34285cb
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop-debugobj
        git checkout c3c9af7f55e25cd3aa48db8bb3623102f34285cb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/rcu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210757.X8c9JDMp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:70:
   kernel/rcu/debug.h:168:5: warning: no previous prototype for 'rcu_debug_ptr_queue' [-Wmissing-prototypes]
     168 | int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
         |     ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/debug.h:173:6: warning: no previous prototype for 'rcu_debug_set_context' [-Wmissing-prototypes]
     173 | void rcu_debug_set_context(struct rcu_data *rdp, void *ip_ptr)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/debug.h:177:6: warning: no previous prototype for 'rcu_debug_reset_context' [-Wmissing-prototypes]
     177 | void rcu_debug_reset_context(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/debug.h:181:6: warning: no previous prototype for 'rcu_debug_init' [-Wmissing-prototypes]
     181 | void rcu_debug_init(void)
         |      ^~~~~~~~~~~~~~
   kernel/rcu/tree.c: In function 'rcu_do_batch':
   kernel/rcu/tree.c:2110:22: error: implicit declaration of function 'rcu_debug_ptr_unqueue_lock'; did you mean 'rcu_debug_ptr_queue'? [-Werror=implicit-function-declaration]
    2110 |                 de = rcu_debug_ptr_unqueue_lock(rdp, rhp);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      rcu_debug_ptr_queue
   kernel/rcu/tree.c:2110:22: error: incompatible types when assigning to type 'rcu_debug_entry' from type 'int'
   kernel/rcu/tree.c:2120:25: error: implicit declaration of function 'rcu_debug_set_context_lock'; did you mean 'rcu_debug_set_context'? [-Werror=implicit-function-declaration]
    2120 |                         rcu_debug_set_context_lock(rdp, f);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         rcu_debug_set_context
   kernel/rcu/tree.c: In function '__call_rcu_common':
   kernel/rcu/tree.c:2651:9: error: implicit declaration of function 'rcu_debug_ptr_queue_lock'; did you mean 'rcu_debug_ptr_queue'? [-Werror=implicit-function-declaration]
    2651 |         rcu_debug_ptr_queue_lock(rdp, (void *)head, lazy);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         rcu_debug_ptr_queue
   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from kernel/rcu/tree.c:23:
   kernel/rcu/tree.c: In function 'rcutree_migrate_callbacks':
   kernel/rcu/tree.c:4495:31: error: implicit declaration of function 'rcu_debug_ptr_unqueue'; did you mean 'rcu_debug_ptr_queue'? [-Werror=implicit-function-declaration]
    4495 |                 WARN_ON_ONCE(!rcu_debug_ptr_unqueue(rdp, rh).valid);
         |                               ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON_ONCE'
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   kernel/rcu/tree.c:4495:61: error: request for member 'valid' in something not a structure or union
    4495 |                 WARN_ON_ONCE(!rcu_debug_ptr_unqueue(rdp, rh).valid);
         |                                                             ^
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON_ONCE'
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   kernel/rcu/tree.c: In function 'rcu_init':
>> kernel/rcu/tree.c:4930:26: warning: unused variable 'rdp' [-Wunused-variable]
    4930 |         struct rcu_data *rdp = per_cpu_ptr(&rcu_data, cpu);
         |                          ^~~
>> kernel/rcu/tree.c:4928:13: warning: unused variable 'i' [-Wunused-variable]
    4928 |         int i;
         |             ^
   cc1: some warnings being treated as errors


vim +/rdp +4930 kernel/rcu/tree.c

  4925	
  4926	void __init rcu_init(void)
  4927	{
> 4928		int i;
  4929		int cpu = smp_processor_id();
> 4930		struct rcu_data *rdp = per_cpu_ptr(&rcu_data, cpu);
  4931	
  4932		rcu_early_boot_tests();
  4933	
  4934		kfree_rcu_batch_init();
  4935		rcu_debug_init();
  4936		rcu_bootup_announce();
  4937		sanitize_kthread_prio();
  4938		rcu_init_geometry();
  4939		rcu_init_one();
  4940		if (dump_tree)
  4941			rcu_dump_rcu_node_tree();
  4942		if (use_softirq)
  4943			open_softirq(RCU_SOFTIRQ, rcu_core_si);
  4944	
  4945		/*
  4946		 * We don't need protection against CPU-hotplug here because
  4947		 * this is called early in boot, before either interrupts
  4948		 * or the scheduler are operational.
  4949		 */
  4950		pm_notifier(rcu_pm_notify, 0);
  4951		WARN_ON(num_online_cpus() > 1); // Only one CPU this early in boot.
  4952		rcutree_prepare_cpu(cpu);
  4953		rcu_cpu_starting(cpu);
  4954		rcutree_online_cpu(cpu);
  4955	
  4956		/* Create workqueue for Tree SRCU and for expedited GPs. */
  4957		rcu_gp_wq = alloc_workqueue("rcu_gp", WQ_MEM_RECLAIM, 0);
  4958		WARN_ON(!rcu_gp_wq);
  4959		rcu_alloc_par_gp_wq();
  4960	
  4961		/* Fill in default value for rcutree.qovld boot parameter. */
  4962		/* -After- the rcu_node ->lock fields are initialized! */
  4963		if (qovld < 0)
  4964			qovld_calc = DEFAULT_RCU_QOVLD_MULT * qhimark;
  4965		else
  4966			qovld_calc = qovld;
  4967	
  4968		// Kick-start any polled grace periods that started early.
  4969		if (!(per_cpu_ptr(&rcu_data, cpu)->mynode->exp_seq_poll_rq & 0x1))
  4970			(void)start_poll_synchronize_rcu_expedited();
  4971	
  4972		rcu_test_sync_prims();
  4973	}
  4974	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
