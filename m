Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE0D15A0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 04:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689480976; x=1721016976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dwM5im4ZsQaCpQUJg79O6w6LZdE5UXwbFE6+EPCuuds=;
  b=bif9L+iNLoiOT+oDCoHQFxgmFiFuwi3F2XC84qbP665z35DL3SXYjOfC
   qyUyzVuQrTtZiTP9Kkao54Q+l3rw8D8hSP1UyUc7drbRCJ7j6YMwmRsT9
   G1teKFIdC4S1F6T0ap6sOmluZlw1wXMApzbWRkum7Fa7rDCruiPR6xWxg
   w+VCnERxANwB87A03ZATQmvlJcICexcsQv7c2EdaPKb71wapCe9FLG6bP
   8edu8LeztbyEe63zNclGMlfY/EPhDXyW1XZfijnV3VxXjhEbQ9KP2CTq7
   /+fb+0Ga7x8JLD0pBCwvXDeRxVH9tlhmDSe5pJOGeoP25Clj05dNvXJVc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="364598381"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="364598381"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 21:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="726127881"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="726127881"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jul 2023 21:16:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKtB7-0008ZP-21;
	Sun, 16 Jul 2023 04:16:13 +0000
Date: Sun, 16 Jul 2023 12:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:rt-thermal-pressure 1/1] kernel/sched/rt.c:2552:13:
 warning: no previous prototype for 'init_sched_rt_fitness_mask'
Message-ID: <202307161256.QYhRtL1u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux rt-thermal-pressure
head:   5e556c4c3d199e96b26dff9e6f6f2847810c4392
commit: 5e556c4c3d199e96b26dff9e6f6f2847810c4392 [1/1] sched/rt: Support multi-criterion fitness search for lowest_rq
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230716/202307161256.QYhRtL1u-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161256.QYhRtL1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161256.QYhRtL1u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
>> kernel/sched/rt.c:2552:13: warning: no previous prototype for 'init_sched_rt_fitness_mask' [-Wmissing-prototypes]
    2552 | void __init init_sched_rt_fitness_mask(int cpu)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/init_sched_rt_fitness_mask +2552 kernel/sched/rt.c

  2551	
> 2552	void __init init_sched_rt_fitness_mask(int cpu)
  2553	{
  2554		cpumask_var_t *fitness_mask_array;
  2555		unsigned int i;
  2556	
  2557		if (!NUM_FITNESS_FN)
  2558			return;
  2559	
  2560		fitness_mask_array = kcalloc_node(NUM_FITNESS_FN, sizeof(cpumask_var_t),
  2561						  GFP_KERNEL, cpu_to_node(cpu));
  2562	
  2563		per_cpu(local_cpu_fitness_mask, cpu) = fitness_mask_array;
  2564	
  2565		for (i = 0; i < NUM_FITNESS_FN; i++) {
  2566			zalloc_cpumask_var_node(&fitness_mask_array[i], GFP_KERNEL,
  2567						cpu_to_node(cpu));
  2568		}
  2569	}
  2570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
