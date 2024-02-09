Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA5A657CA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707463761; cv=none; b=NQl9FQQwD0LVhlDV49RAhVPvjjKnaJW+LbOSxtsLEe1DqI9sYbEryX7dUgBCWUapComVrY5yqo3UMD6JrpPLIfcdBIuQ+8qDAQyXNSzC/rHPYxX5Yx8HpwC685ekBUAJ9575Ub5cNmTMyIRCGeyBNrgtWdJQGsu3GVkofSHECKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707463761; c=relaxed/simple;
	bh=xnfwmt4pEG1Ra7z6ZAyVHyXrOUtApbFirmK2JGLtB3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ABFVqUbKBbypHS1x6EJ0aBreTJwVBnKosiqcptRszOCpSu6o3NOzU8r7dabJfO4UihlHHb7B50onur0i+x4/jEtN6lACB5PAeZYqqvOCtW4Xhj+wppEceUL+CfrF6R527NHGCO7gulcgOeqOn8GNn96kLXPwJs2SXenkhPpgBQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DImpUV+o; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DImpUV+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707463759; x=1738999759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xnfwmt4pEG1Ra7z6ZAyVHyXrOUtApbFirmK2JGLtB3U=;
  b=DImpUV+oULtdV07aAh+RPjeMUYZN1hhmSQydSIEl2v6pre1xTyRyMZ1j
   Tb5zZjjGOkSLZClKZuiDv3MWitCfo+qKySpKJzBcULoX1/OpQ9MklofQs
   UG/QhaWiFu4iZ8jNFGHGPQ3UwzCciiz2/Y0txDDCveCqu5R4sgIve4JXI
   Qsvi4RlZkqL3i4qq91fzT+pd9IrP9WifTvt/1cyZYddkHLs2t+qV356+V
   hECbjGu2xQKKOlO8NMa5NAkQFkrIOhch9ZU33lHHEEuRx3TV42Jndxb7K
   UiJaoxfNXreos4crIY7WPNpdetQUid+BF410hOxgco6iMGtzf30CCCKiq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="5237014"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="5237014"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 23:29:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="2097562"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Feb 2024 23:29:16 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYLJy-0004Tz-0K;
	Fri, 09 Feb 2024 07:29:14 +0000
Date: Fri, 9 Feb 2024 15:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 14/14]
 kernel/sched/core.c:4904:21: error: implicit declaration of function
 '__ignore_task_perf'
Message-ID: <202402091519.RXbNC7ZI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   05441ef50df2e5195435b09974271f382d8f946d
commit: 05441ef50df2e5195435b09974271f382d8f946d [14/14] sched: Make iowait boost per task
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402091519.RXbNC7ZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402091519.RXbNC7ZI-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   arch/x86/entry/common.c:211: warning: Function parameter or struct member 'int80_emulation' not described in 'DEFINE_IDTENTRY_RAW'
   arch/x86/entry/common.c:211: warning: expecting prototype for int80_emulation(). Prototype was for DEFINE_IDTENTRY_RAW() instead
   ipc/sem.c:647: warning: expecting prototype for perform_atomic_semop[_slow](). Prototype was for perform_atomic_semop_slow() instead
   kernel/panic.c: In function '__warn':
   kernel/panic.c:670:17: warning: function '__warn' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     670 |                 vprintk(args->fmt, args->args);
         |                 ^~~~~~~
   arch/x86/lib/insn-eval.c:1152: warning: Function parameter or struct member 'base_offset' not described in 'get_eff_addr_sib'
   arch/x86/lib/insn-eval.c:1152: warning: Excess function parameter 'regoff' description in 'get_eff_addr_sib'
   security/yama/yama_lsm.c:116: warning: Function parameter or struct member 'work' not described in 'yama_relation_cleanup'
   kernel/cpu.c:85: warning: Excess struct member 'cpu' description in 'cpuhp_cpu_state'
   arch/x86/mm/pgtable.c:650: warning: Function parameter or struct member 'reserve' not described in 'reserve_top_address'
   arch/x86/mm/pgtable.c:699: warning: Function parameter or struct member 'p4d' not described in 'p4d_set_huge'
   arch/x86/mm/pgtable.c:699: warning: Function parameter or struct member 'addr' not described in 'p4d_set_huge'
   arch/x86/mm/pgtable.c:699: warning: Function parameter or struct member 'prot' not described in 'p4d_set_huge'
   arch/x86/mm/pgtable.c:709: warning: Function parameter or struct member 'p4d' not described in 'p4d_clear_huge'
   arch/x86/mm/pgtable.c:726: warning: Function parameter or struct member 'pud' not described in 'pud_set_huge'
   arch/x86/mm/pgtable.c:726: warning: Function parameter or struct member 'addr' not described in 'pud_set_huge'
   arch/x86/mm/pgtable.c:726: warning: Function parameter or struct member 'prot' not described in 'pud_set_huge'
   arch/x86/mm/pgtable.c:752: warning: Function parameter or struct member 'pmd' not described in 'pmd_set_huge'
   arch/x86/mm/pgtable.c:752: warning: Function parameter or struct member 'addr' not described in 'pmd_set_huge'
   arch/x86/mm/pgtable.c:752: warning: Function parameter or struct member 'prot' not described in 'pmd_set_huge'
   arch/x86/mm/pgtable.c:779: warning: Function parameter or struct member 'pud' not described in 'pud_clear_huge'
   arch/x86/mm/pgtable.c:794: warning: Function parameter or struct member 'pmd' not described in 'pmd_clear_huge'
   arch/x86/lib/usercopy_64.c:29: warning: Function parameter or struct member 'addr' not described in 'clean_cache_range'
   arch/x86/lib/usercopy_64.c:29: warning: Excess function parameter 'vaddr' description in 'clean_cache_range'
   arch/x86/power/hibernate.c:47: warning: Function parameter or struct member 'pfn' not described in 'pfn_is_nosave'
   arch/x86/power/hibernate.c:92: warning: Function parameter or struct member 'max_size' not described in 'arch_hibernation_header_save'
   arch/x86/mm/pat/memtype.c:710: warning: Function parameter or struct member 'pfn' not described in 'pat_pfn_immune_to_uc_mtrr'
   fs/namespace.c:3048: warning: Function parameter or struct member 'mp' not described in 'can_move_mount_beneath'
   kernel/reboot.c:226: warning: Function parameter or struct member 'cmd' not described in 'do_kernel_restart'
   kernel/reboot.c:952: warning: Function parameter or struct member 'poweroff_delay_ms' not described in 'hw_failure_emergency_poweroff'
   arch/x86/kernel/tsc.c:1339: warning: Excess function parameter 'cycles' description in 'convert_art_ns_to_tsc'
   arch/x86/kernel/tsc.c:1339: warning: Excess function parameter 'cs' description in 'convert_art_ns_to_tsc'
   arch/x86/kernel/tsc.c:1373: warning: Function parameter or struct member 'work' not described in 'tsc_refine_calibration_work'
   drivers/clk/clkdev.c: In function 'vclkdev_alloc':
   drivers/clk/clkdev.c:173:17: warning: function 'vclkdev_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     173 |                 vscnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
         |                 ^~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
   kernel/sched/core.c: In function 'update_cpufreq_ctx_switch':
>> kernel/sched/core.c:4904:21: error: implicit declaration of function '__ignore_task_perf' [-Werror=implicit-function-declaration]
    4904 |                 if (__ignore_task_perf(current))
         |                     ^~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:4908:30: error: implicit declaration of function '__uclamp_eff_value'; did you mean 'uclamp_eff_value'? [-Werror=implicit-function-declaration]
    4908 |                 uclamp_min = __uclamp_eff_value(current, UCLAMP_MIN);
         |                              ^~~~~~~~~~~~~~~~~~
         |                              uclamp_eff_value
   drivers/iommu/amd/iommu.c: In function 'iommu_poll_ppr_log':
   drivers/iommu/amd/iommu.c:831:21: warning: variable 'entry' set but not used [-Wunused-but-set-variable]
     831 |                 u64 entry[2];
         |                     ^~~~~
   drivers/iommu/intel/dmar.c: In function 'alloc_iommu':
   drivers/iommu/intel/dmar.c:1062:35: warning: '%d' directive writing between 1 and 10 bytes into a region of size 9 [-Wformat-overflow=]
    1062 |         sprintf(iommu->name, "dmar%d", iommu->seq_id);
         |                                   ^~
   drivers/iommu/intel/dmar.c:1062:30: note: directive argument in the range [0, 2147483647]
    1062 |         sprintf(iommu->name, "dmar%d", iommu->seq_id);
         |                              ^~~~~~~~
   drivers/iommu/intel/dmar.c:1062:9: note: 'sprintf' output between 6 and 15 bytes into a destination of size 13
    1062 |         sprintf(iommu->name, "dmar%d", iommu->seq_id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/manage.c: In function 'shutdown_event':
   drivers/xen/manage.c:354:60: warning: '%s' directive output may be truncated writing up to 95 bytes into a region of size 12 [-Wformat-truncation=]
     354 |                 snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
         |                                                            ^~
   In function 'setup_shutdown_watcher',
       inlined from 'shutdown_event' at drivers/xen/manage.c:371:2:
   drivers/xen/manage.c:354:17: note: 'snprintf' output between 9 and 104 bytes into a destination of size 20
     354 |                 snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     355 |                          shutdown_handlers[idx].command);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/sleep.c:519: warning: Function parameter or struct member 'acpi_state' not described in 'acpi_pm_start'
   drivers/acpi/sleep.c:559: warning: Function parameter or struct member 'pm_state' not described in 'acpi_suspend_begin'
   drivers/acpi/sleep.c:692: warning: Function parameter or struct member 'pm_state' not described in 'acpi_suspend_begin_old'
   drivers/acpi/sleep.c:988: warning: Function parameter or struct member 'stage' not described in 'acpi_hibernation_begin_old'
   drivers/xen/xenbus/xenbus_client.c: In function 'xenbus_va_dev_error':
   drivers/xen/xenbus/xenbus_client.c:295:9: warning: function 'xenbus_va_dev_error' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     295 |         vsnprintf(printf_buffer + len, PRINTF_BUFFER_SIZE - len, fmt, ap);
         |         ^~~~~~~~~
   block/blk-throttle.c: In function 'tg_prfill_limit':
   block/blk-throttle.c:1539:74: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    1539 |                         snprintf(idle_time, sizeof(idle_time), " idle=%lu",
         |                                                                          ^
   block/blk-throttle.c:1539:25: note: 'snprintf' output between 8 and 27 bytes into a destination of size 26
    1539 |                         snprintf(idle_time, sizeof(idle_time), " idle=%lu",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1540 |                                 tg->idletime_threshold_conf);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-throttle.c:1546:43: warning: '%lu' directive output may be truncated writing between 1 and 20 bytes into a region of size 17 [-Wformat-truncation=]
    1546 |                                 " latency=%lu", tg->latency_target_conf);
         |                                           ^~~
   block/blk-throttle.c:1546:33: note: directive argument in the range [0, 18446744073709551614]
    1546 |                                 " latency=%lu", tg->latency_target_conf);
         |                                 ^~~~~~~~~~~~~~
   block/blk-throttle.c:1545:25: note: 'snprintf' output between 11 and 30 bytes into a destination of size 26
    1545 |                         snprintf(latency_time, sizeof(latency_time),
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1546 |                                 " latency=%lu", tg->latency_target_conf);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/xenbus/xenbus_client.c:134: warning: Function parameter or struct member 'will_handle' not described in 'xenbus_watch_path'
   drivers/xen/xenbus/xenbus_client.c:177: warning: Function parameter or struct member 'will_handle' not described in 'xenbus_watch_pathfmt'
   drivers/xen/xenbus/xenbus_client.c:350: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Equivalent to xenbus_dev_fatal(dev, err, fmt, args), but helps
   drivers/xen/xenbus/xenbus_client.c:457: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Allocate an event channel for the given xenbus_device, assigning the newly
   drivers/xen/xenbus/xenbus_client.c:486: warning: Function parameter or struct member 'dev' not described in 'xenbus_free_evtchn'
   drivers/xen/xenbus/xenbus_client.c:486: warning: Function parameter or struct member 'port' not described in 'xenbus_free_evtchn'
   drivers/xen/xenbus/xenbus_client.c:486: warning: expecting prototype for Free an existing event channel. Returns 0 on success or(). Prototype was for xenbus_free_evtchn() instead
   cc1: some warnings being treated as errors
   make[5]: *** [scripts/Makefile.build:243: kernel/sched/core.o] Error 1
   In file included from kernel/locking/qspinlock.c:586:
   kernel/locking/qspinlock_paravirt.h: In function 'pv_wait_node':
   kernel/locking/qspinlock_paravirt.h:298:14: warning: variable 'wait_early' set but not used [-Wunused-but-set-variable]
     298 |         bool wait_early;
         |              ^~~~~~~~~~
   kernel/power/swap.c:544: warning: Function parameter or struct member 'handle' not described in 'save_image'
   kernel/power/swap.c:544: warning: Function parameter or struct member 'snapshot' not described in 'save_image'
   kernel/power/swap.c:544: warning: Function parameter or struct member 'nr_to_write' not described in 'save_image'
   kernel/power/swap.c:891: warning: Function parameter or struct member 'nr_pages' not described in 'enough_swap'
   kernel/power/swap.c:1062: warning: Function parameter or struct member 'handle' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or struct member 'snapshot' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or struct member 'nr_to_read' not described in 'load_image'
   kernel/power/swap.c:1573: warning: Excess function parameter 'exclusive' description in 'swsusp_close'
   kernel/power/snapshot.c:468: warning: Function parameter or struct member 'zone' not described in 'add_rtree_block'
   kernel/power/snapshot.c:468: warning: Function parameter or struct member 'gfp_mask' not described in 'add_rtree_block'
   kernel/power/snapshot.c:468: warning: Function parameter or struct member 'safe_needed' not described in 'add_rtree_block'
   kernel/power/snapshot.c:468: warning: Function parameter or struct member 'ca' not described in 'add_rtree_block'
   kernel/power/snapshot.c:541: warning: Function parameter or struct member 'gfp_mask' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:541: warning: Function parameter or struct member 'safe_needed' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:541: warning: Function parameter or struct member 'ca' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:541: warning: Function parameter or struct member 'start' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:541: warning: Function parameter or struct member 'end' not described in 'create_zone_bm_rtree'
   kernel/power/snapshot.c:576: warning: Function parameter or struct member 'zone' not described in 'free_zone_bm_rtree'
   kernel/power/snapshot.c:576: warning: Function parameter or struct member 'clear_nosave_free' not described in 'free_zone_bm_rtree'
   kernel/power/snapshot.c:684: warning: Function parameter or struct member 'bm' not described in 'memory_bm_create'
   kernel/power/snapshot.c:684: warning: Function parameter or struct member 'gfp_mask' not described in 'memory_bm_create'
   kernel/power/snapshot.c:684: warning: Function parameter or struct member 'safe_needed' not described in 'memory_bm_create'
   kernel/power/snapshot.c:726: warning: Function parameter or struct member 'clear_nosave_free' not described in 'memory_bm_free'
   kernel/power/snapshot.c:748: warning: Function parameter or struct member 'bm' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:748: warning: Function parameter or struct member 'pfn' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:748: warning: Function parameter or struct member 'addr' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:748: warning: Function parameter or struct member 'bit_nr' not described in 'memory_bm_find_bit'
   kernel/power/snapshot.c:996: warning: Function parameter or struct member 'start_pfn' not described in 'register_nosave_region'


vim +/__ignore_task_perf +4904 kernel/sched/core.c

  4877	
  4878	static inline void update_cpufreq_ctx_switch(struct rq *rq)
  4879	{
  4880		if (unlikely(current->sched_class == &stop_sched_class))
  4881			return;
  4882	
  4883		if (unlikely(current->sched_class == &idle_sched_class))
  4884			return;
  4885	
  4886		if (unlikely(task_has_idle_policy(current)))
  4887			return;
  4888	
  4889		if (likely(fair_policy(current->policy))) {
  4890			unsigned long uclamp_min, uclamp_max;
  4891			unsigned long rq_util;
  4892	
  4893			/*
  4894			 * Allow cpufreq updates once for every update_load_avg() decay.
  4895			 */
  4896			if (unlikely(rq->cfs.decayed)) {
  4897				rq->cfs.decayed = false;
  4898				goto force_update;
  4899			}
  4900	
  4901			if (unlikely(current->in_iowait))
  4902				goto force_update;
  4903	
> 4904			if (__ignore_task_perf(current))
  4905				return;
  4906	
  4907			/* Force an update if perf hints are required to be applied */
> 4908			uclamp_min = __uclamp_eff_value(current, UCLAMP_MIN);
  4909			uclamp_max = __uclamp_eff_value(current, UCLAMP_MAX);
  4910			rq_util = rq->cfs.avg.util_avg;
  4911	
  4912			if (uclamp_min > rq_util || uclamp_max < rq_util)
  4913				goto force_update;
  4914	
  4915			return;
  4916		}
  4917	
  4918		/* RT and DL should always send a freq update */
  4919	
  4920		/* XXX ignore updates for sugov worker thread */
  4921	
  4922	force_update:
  4923	
  4924		/*
  4925		 * Request freq update after __balance_callbacks to take into account
  4926		 * any changes to rq.
  4927		 */
  4928		cpufreq_update_util(rq, 0);
  4929	}
  4930	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
