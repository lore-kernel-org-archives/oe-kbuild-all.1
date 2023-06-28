Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A1E46A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 07:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687937665; x=1719473665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zMdhwKn9B6eE5F1nUCnxmbiOpjNPUkxGlhdP+aBll2Y=;
  b=SPmH+ac5jw6gm45CV7Xp9KL5eFzhHzHk4xJrO39h+AlKiTzkfclmQmbo
   yiFXdrnyJ0rcmj54/fwiEtQ+8JPBUiBLWLAJ4Cx8AMkhrdzjwOuneCCIm
   YYwvJR5HhOtDYUKYcMPLfZMpEdHjR6PpdHgfJjUrdtfZGWMaGtwEjPzvP
   gV/QJp10RY78gSkevBXvTf+PrfnU1s1YaujrU8M13wDvu3vKwOU8E329W
   jlNOnHWi/z47tFuXQ1axl6OsdVrrFZ1yJ/L1USt2Ea3M7k6s4tIK44mWC
   x3hxkwhgecdbLD3mTFJiGyimn+OtxwIXTC1LPrtyTK573R0Gk3QXI0aXY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="365234798"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="365234798"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 00:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963497523"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="963497523"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jun 2023 00:34:21 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEPgy-000D4x-2v;
	Wed, 28 Jun 2023 07:34:20 +0000
Date: Wed, 28 Jun 2023 15:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 379/385] kernel/sched/alt_core.c:2516:6: warning: no
 previous prototype for 'call_function_single_prep_ipi'
Message-ID: <202306281522.YH4lYLgS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   d6148915d97f4535395579f728454c4f68f0774b
commit: 217029dcc8414f797711c3cac589493f62a4dc13 [379/385] sched/alt: [Sync] 68f4ff04dbad sched, smp: Trace smp callback causing an IPI
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230628/202306281522.YH4lYLgS-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306281522.YH4lYLgS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306281522.YH4lYLgS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:1006:6: warning: no previous prototype for 'resched_curr' [-Wmissing-prototypes]
    1006 | void resched_curr(struct rq *rq)
         |      ^~~~~~~~~~~~
   kernel/sched/alt_core.c:1029:6: warning: no previous prototype for 'resched_cpu' [-Wmissing-prototypes]
    1029 | void resched_cpu(int cpu)
         |      ^~~~~~~~~~~
   kernel/sched/alt_core.c:2473:6: warning: no previous prototype for 'sched_ttwu_pending' [-Wmissing-prototypes]
    2473 | void sched_ttwu_pending(void *arg)
         |      ^~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:2516:6: warning: no previous prototype for 'call_function_single_prep_ipi' [-Wmissing-prototypes]
    2516 | bool call_function_single_prep_ipi(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7137:6: warning: no previous prototype for 'idle_task_exit' [-Wmissing-prototypes]
    7137 | void idle_task_exit(void)
         |      ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7347:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
    7347 | int sched_cpu_activate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7386:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
    7386 | int sched_cpu_deactivate(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7450:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
    7450 | int sched_cpu_starting(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7470:5: warning: no previous prototype for 'sched_cpu_wait_empty' [-Wmissing-prototypes]
    7470 | int sched_cpu_wait_empty(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7512:5: warning: no previous prototype for 'sched_cpu_dying' [-Wmissing-prototypes]
    7512 | int sched_cpu_dying(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7595:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    7595 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7655:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    7655 | void __init sched_init(void)
         |             ^~~~~~~~~~


vim +/call_function_single_prep_ipi +2516 kernel/sched/alt_core.c

  2509	
  2510	/*
  2511	 * Prepare the scene for sending an IPI for a remote smp_call
  2512	 *
  2513	 * Returns true if the caller can proceed with sending the IPI.
  2514	 * Returns false otherwise.
  2515	 */
> 2516	bool call_function_single_prep_ipi(int cpu)
  2517	{
  2518		if (set_nr_if_polling(cpu_rq(cpu)->idle)) {
  2519			trace_sched_wake_idle_without_ipi(cpu);
  2520			return false;
  2521		}
  2522	
  2523		return true;
  2524	}
  2525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
