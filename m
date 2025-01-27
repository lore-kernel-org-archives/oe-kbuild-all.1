Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9086E3C17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 00:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737937613; cv=none; b=Dy6AUdjoZDlZ0m2bECsptwdnig0r27KpdonsAvjFmLebjr7V63aSqQora4HrOCCTOOldGonBW3dywI6xAAG+YNw+Z5QYolcmlZigI4AwnDqgx3aXCOMfyLFGGfxu578qx6riHTjzpwNgxf7EiGzT0jZ5PgNN1aHuGu1GC9H9cBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737937613; c=relaxed/simple;
	bh=UOWVdIejHgAvfFWs4sM2XAlIOUdPJDOBCPvcz941444=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0eBrumaL2AzDQmvmqS89RpRveIfqEMnaYIaYvdojbW9fBhbMK0CSFI3eYShXRXKmo++5t9X/x+C6b5XUZXs0JeX6TbXyQS99VwMRcwGgV2f/JZ6Xn+RVNWxZM17/pxMlrc1rSze1LfZtMFTaI7rF0rNwsVejWaOJq019gE93gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJpUga62; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJpUga62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737937610; x=1769473610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UOWVdIejHgAvfFWs4sM2XAlIOUdPJDOBCPvcz941444=;
  b=iJpUga629jrd8aU8u5kv0Y85sea0uuNc1AJt2KsMr6uX6JF/Z5EaBr0G
   YcoopIAeBXl2Lbfc9j2p0J6DtzWGrJbhS7ySuNFe7mAhNQoc52cXvXzOV
   KDQogxsYXDOOzP87Ns8zYKn8kkKMzvuzJ70pGQE3XjXiV7Je/PhyVj1N7
   b91o3TJjIzzPPuYp/1IOdnudugSjhb++44oXQhaN5PHCIO7iuUrTnyGO5
   zypw2yUurkOfSW17RH0Vt0QEWZ1WUHGwVF69cHrjsuCdN2LmS7Z1BftCI
   DP2/eY5ABe/YTKN/AI6eu7dHCReTfefUHazHszrlxfiZdWdqvhg6RPz9B
   w==;
X-CSE-ConnectionGUID: TcXJeUlVT2utbWnjTNJoIQ==
X-CSE-MsgGUID: FFemu0eERtKen6HzjUplcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38532883"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="38532883"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 16:26:50 -0800
X-CSE-ConnectionGUID: p6djyEY+QbqN8PTZIAGCWw==
X-CSE-MsgGUID: yihiTJXWTSSm43JJv1rNoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145528026"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jan 2025 16:26:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcCxi-000gCx-24;
	Mon, 27 Jan 2025 00:26:46 +0000
Date: Mon, 27 Jan 2025 08:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.13.y 83/83] kernel/sched/debug.c:555:71:
 error: use of undeclared identifier 'sched_min_base_slice_fops'
Message-ID: <202501270833.7tJelKrl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: c358c65925524fe1dfe962d59966a6aa01b5fc9b [83/83] linux6.13.y-bore5.9.6
config: x86_64-buildonly-randconfig-004-20250127 (https://download.01.org/0day-ci/archive/20250127/202501270833.7tJelKrl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501270833.7tJelKrl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270833.7tJelKrl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:72:
>> kernel/sched/debug.c:555:71: error: use of undeclared identifier 'sched_min_base_slice_fops'
     555 |         debugfs_create_file("min_base_slice_ns", 0644, debugfs_sched, NULL, &sched_min_base_slice_fops);
         |                                                                              ^
>> kernel/sched/debug.c:555:71: error: use of undeclared identifier 'sched_min_base_slice_fops'
   2 errors generated.
--
>> kernel/sched/fair.c:211:6: warning: no previous prototype for function 'sched_update_min_base_slice' [-Wmissing-prototypes]
     211 | void sched_update_min_base_slice(void) { update_sysctl(); }
         |      ^
   kernel/sched/fair.c:211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     211 | void sched_update_min_base_slice(void) { update_sysctl(); }
         | ^
         | static 
   kernel/sched/fair.c:504:20: warning: unused function 'list_del_leaf_cfs_rq' [-Wunused-function]
     504 | static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:525:19: warning: unused function 'tg_is_idle' [-Wunused-function]
     525 | static inline int tg_is_idle(struct task_group *tg)
         |                   ^~~~~~~~~~
   kernel/sched/fair.c:549:19: warning: unused function 'max_vruntime' [-Wunused-function]
     549 | static inline u64 max_vruntime(u64 max_vruntime, u64 vruntime)
         |                   ^~~~~~~~~~~~
   kernel/sched/fair.c:1423:20: warning: unused function 'is_core_idle' [-Wunused-function]
    1423 | static inline bool is_core_idle(int cpu)
         |                    ^~~~~~~~~~~~
   kernel/sched/fair.c:3690:20: warning: unused function 'account_numa_enqueue' [-Wunused-function]
    3690 | static inline void account_numa_enqueue(struct rq *rq, struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3694:20: warning: unused function 'account_numa_dequeue' [-Wunused-function]
    3694 | static inline void account_numa_dequeue(struct rq *rq, struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3698:20: warning: unused function 'update_scan_period' [-Wunused-function]
    3698 | static inline void update_scan_period(struct task_struct *p, int new_cpu)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5165:20: warning: unused function 'cfs_rq_is_decayed' [-Wunused-function]
    5165 | static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5180:20: warning: unused function 'remove_entity_load_avg' [-Wunused-function]
    5180 | static inline void remove_entity_load_avg(struct sched_entity *se) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6722:20: warning: unused function 'cfs_bandwidth_used' [-Wunused-function]
    6722 | static inline bool cfs_bandwidth_used(void)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6730:20: warning: unused function 'sync_throttle' [-Wunused-function]
    6730 | static inline void sync_throttle(struct task_group *tg, int cpu) {}
         |                    ^~~~~~~~~~~~~
   kernel/sched/fair.c:6743:19: warning: unused function 'throttled_lb_pair' [-Wunused-function]
    6743 | static inline int throttled_lb_pair(struct task_group *tg,
         |                   ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6754:37: warning: unused function 'tg_cfs_bandwidth' [-Wunused-function]
    6754 | static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
         |                                     ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6758:20: warning: unused function 'destroy_cfs_bandwidth' [-Wunused-function]
    6758 | static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6759:20: warning: unused function 'update_runtime_enabled' [-Wunused-function]
    6759 | static inline void update_runtime_enabled(struct rq *rq) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6760:20: warning: unused function 'unthrottle_offline_cfs_rqs' [-Wunused-function]
    6760 | static inline void unthrottle_offline_cfs_rqs(struct rq *rq) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   17 warnings generated.


vim +/sched_min_base_slice_fops +555 kernel/sched/debug.c

   553	
   554	#ifdef CONFIG_SCHED_BORE
 > 555		debugfs_create_file("min_base_slice_ns", 0644, debugfs_sched, NULL, &sched_min_base_slice_fops);
   556		debugfs_create_u32("base_slice_ns", 0444, debugfs_sched, &sysctl_sched_base_slice);
   557	#else // !CONFIG_SCHED_BORE
   558		debugfs_create_u32("base_slice_ns", 0644, debugfs_sched, &sysctl_sched_base_slice);
   559	#endif // CONFIG_SCHED_BORE
   560	
   561		debugfs_create_u32("latency_warn_ms", 0644, debugfs_sched, &sysctl_resched_latency_warn_ms);
   562		debugfs_create_u32("latency_warn_once", 0644, debugfs_sched, &sysctl_resched_latency_warn_once);
   563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
