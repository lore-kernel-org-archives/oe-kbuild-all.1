Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42D7156972
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 06:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726209161; cv=none; b=s7+HDJ+PorU0JOLGRXuBIfTOSokGuKKed+7AzN3UaV8N+FUM2KcFOk2OU8LOVVpFObcTrTJ++gS5OQt0qx8EYkcOQSOhCSf8x4Rg5q8PBXPG1Emki8dZdw/NxIMsfO0uKJS1xI6jExPS3cb3kIelSjT3KM0gYR4wb1lEkzbHxOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726209161; c=relaxed/simple;
	bh=g/yhlRfJXswVskOrsI0RphqGD7dpVFrgFvoQmf+I3RE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lu6u2IU5oyhfWoI8dkBSob3d7Z7VtIRi6Bkh/B/kDi9Ilb3dfJz9b52NIfjKDhDCfHDDMcJg2vgpiWULs7BhGj57Kn4YqTjXx354cpehoz02LDlU8nyEZWGsuUPuauuuLqL1FWdzllZdhUSkH9MgTvargbjtZmpoPb15+49TVTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwrWc5+i; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwrWc5+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726209159; x=1757745159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/yhlRfJXswVskOrsI0RphqGD7dpVFrgFvoQmf+I3RE=;
  b=NwrWc5+iRLuKPNUIfjvSp2qAqsEUd/+RcjiXehlQxAwXRKxfnLevt3yk
   M4n3LbVv03+Qvv7v8LtYehqRgdfb1nyBl4ACWJkb+qRuF5t2SNDmKBxAx
   qgegMQ/MRlKv7jCytQxOlpZk3wR3EMXig0urCQjjlvg7ALGyyKe8w5veY
   gP5qoG/QP+O5pdbj0eeQPxEFgau6noMzDPsky53FajDPGmaJOAwf4LnN+
   rgaQ7rHO28f7Z3YHuWH5cUatPHTeEhg1WQMQ6sCihYZpl8UStc7FJe5qp
   MipHVXMyXxKXo2/d85CUO1GS0dc45/OC9B3UPMZhPLIl6O0uIFaWL1K/d
   g==;
X-CSE-ConnectionGUID: A57MCWZMQQ6zL/K7TzxraQ==
X-CSE-MsgGUID: c+RmD0HGSui3OjuQ2+uAdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25222153"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25222153"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 23:32:38 -0700
X-CSE-ConnectionGUID: dFfTsI0aSISDOWvuAsJccg==
X-CSE-MsgGUID: cNaDixi/RjeSkQB7/WE5Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68453876"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Sep 2024 23:32:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sozr8-00066E-2q;
	Fri, 13 Sep 2024 06:32:34 +0000
Date: Fri, 13 Sep 2024 14:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangchangzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20703/23707]
 kernel/sched/core.c:5976:9: error: implicit declaration of function
 'init_auto_affinity'; did you mean 'irq_set_affinity'?
Message-ID: <202409131450.IS4ToWpC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c46f803e3465bd0ca66716804a4d3e20f586ac0d
commit: 713cfd2684fa5ea08b144d92b9858b932c0f1705 [20703/23707] sched: Introduce smart grid scheduling strategy for cfs
config: arm64-randconfig-004-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131450.IS4ToWpC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131450.IS4ToWpC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131450.IS4ToWpC-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c:1587:6: warning: no previous prototype for 'sched_set_stop_task' [-Wmissing-prototypes]
    1587 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:3771:35: warning: no previous prototype for 'preempt_schedule_irq' [-Wmissing-prototypes]
    3771 | asmlinkage __visible void __sched preempt_schedule_irq(void)
         |                                   ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'sched_cpu_activate':
   kernel/sched/core.c:5845:9: error: implicit declaration of function 'tg_update_affinity_domains' [-Werror=implicit-function-declaration]
    5845 |         tg_update_affinity_domains(cpu, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'sched_init_smp':
>> kernel/sched/core.c:5976:9: error: implicit declaration of function 'init_auto_affinity'; did you mean 'irq_set_affinity'? [-Werror=implicit-function-declaration]
    5976 |         init_auto_affinity(&root_task_group);
         |         ^~~~~~~~~~~~~~~~~~
         |         irq_set_affinity
   kernel/sched/core.c:5976:29: error: 'root_task_group' undeclared (first use in this function); did you mean 'task_group'?
    5976 |         init_auto_affinity(&root_task_group);
         |                             ^~~~~~~~~~~~~~~
         |                             task_group
   kernel/sched/core.c:5976:29: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/core.c: In function 'sched_init':
   kernel/sched/core.c:6029:39: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
    6029 |         unsigned long alloc_size = 0, ptr;
         |                                       ^~~
   In file included from include/linux/migrate.h:6,
                    from kernel/sched/sched.h:52,
                    from kernel/sched/core.c:8:
   include/linux/mempolicy.h: At top level:
   include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/list.h:9,
                    from include/linux/resource_ext.h:17,
                    from include/linux/acpi.h:26,
                    from drivers/iommu/arm-smmu-v3.c:23:
   drivers/iommu/arm-smmu-v3.c: In function 'arm_smmu_device_hw_probe':
>> drivers/iommu/arm-smmu-v3.c:223:55: error: 'CONFIG_CMA_ALIGNMENT' undeclared (first use in this function); did you mean 'CONFIG_CMDLINE'?
     223 | #define Q_MAX_SZ_SHIFT                  (PAGE_SHIFT + CONFIG_CMA_ALIGNMENT)
         |                                                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:851:36: note: in definition of macro '__typecheck'
     851 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                    ^
   include/linux/kernel.h:875:31: note: in expansion of macro '__safe_cmp'
     875 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/kernel.h:943:33: note: in expansion of macro '__careful_cmp'
     943 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4024:40: note: in expansion of macro 'min_t'
    4024 |         smmu->cmdq.q.llq.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                        ^~~~~
   drivers/iommu/arm-smmu-v3.c:296:42: note: in expansion of macro 'Q_MAX_SZ_SHIFT'
     296 | #define CMDQ_MAX_SZ_SHIFT               (Q_MAX_SZ_SHIFT - CMDQ_ENT_SZ_SHIFT)
         |                                          ^~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4024:51: note: in expansion of macro 'CMDQ_MAX_SZ_SHIFT'
    4024 |         smmu->cmdq.q.llq.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                                   ^~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:223:55: note: each undeclared identifier is reported only once for each function it appears in
     223 | #define Q_MAX_SZ_SHIFT                  (PAGE_SHIFT + CONFIG_CMA_ALIGNMENT)
         |                                                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:851:36: note: in definition of macro '__typecheck'
     851 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                    ^
   include/linux/kernel.h:875:31: note: in expansion of macro '__safe_cmp'
     875 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/kernel.h:943:33: note: in expansion of macro '__careful_cmp'
     943 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4024:40: note: in expansion of macro 'min_t'
    4024 |         smmu->cmdq.q.llq.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                        ^~~~~
   drivers/iommu/arm-smmu-v3.c:296:42: note: in expansion of macro 'Q_MAX_SZ_SHIFT'
     296 | #define CMDQ_MAX_SZ_SHIFT               (Q_MAX_SZ_SHIFT - CMDQ_ENT_SZ_SHIFT)
         |                                          ^~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4024:51: note: in expansion of macro 'CMDQ_MAX_SZ_SHIFT'
    4024 |         smmu->cmdq.q.llq.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                                   ^~~~~~~~~~~~~~~~~
>> include/linux/kernel.h:875:9: error: first argument to '__builtin_choose_expr' not a constant
     875 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:943:33: note: in expansion of macro '__careful_cmp'
     943 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4024:40: note: in expansion of macro 'min_t'
    4024 |         smmu->cmdq.q.llq.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
         |                                        ^~~~~
>> include/linux/kernel.h:875:9: error: first argument to '__builtin_choose_expr' not a constant
     875 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:943:33: note: in expansion of macro '__careful_cmp'
     943 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4038:40: note: in expansion of macro 'min_t'
    4038 |         smmu->evtq.q.llq.max_n_shift = min_t(u32, EVTQ_MAX_SZ_SHIFT,
         |                                        ^~~~~
>> include/linux/kernel.h:875:9: error: first argument to '__builtin_choose_expr' not a constant
     875 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:943:33: note: in expansion of macro '__careful_cmp'
     943 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4040:40: note: in expansion of macro 'min_t'
    4040 |         smmu->priq.q.llq.max_n_shift = min_t(u32, PRIQ_MAX_SZ_SHIFT,
         |                                        ^~~~~
   drivers/iommu/arm-smmu-v3.c: At top level:
   drivers/iommu/arm-smmu-v3.c:4343:5: warning: no previous prototype for 'arm_smmu_set_dev_mpam' [-Wmissing-prototypes]
    4343 | int arm_smmu_set_dev_mpam(struct device *dev, int ssid, int partid, int pmg,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4385:5: warning: no previous prototype for 'arm_smmu_get_dev_mpam' [-Wmissing-prototypes]
    4385 | int arm_smmu_get_dev_mpam(struct device *dev, int ssid, int *partid, int *pmg,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4399:5: warning: no previous prototype for 'arm_smmu_set_dev_user_mpam_en' [-Wmissing-prototypes]
    4399 | int arm_smmu_set_dev_user_mpam_en(struct device *dev, int user_mpam_en)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:4417:5: warning: no previous prototype for 'arm_smmu_get_dev_user_mpam_en' [-Wmissing-prototypes]
    4417 | int arm_smmu_get_dev_user_mpam_en(struct device *dev, int *user_mpam_en)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +5976 kernel/sched/core.c

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
