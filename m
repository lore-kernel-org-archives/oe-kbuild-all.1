Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4839F441F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 05:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVj21DP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701839760; x=1733375760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1QcHc/DikwPdT/lSHhWRdwIgL4QFP9vtovOKAgd29xc=;
  b=XVj21DP1rtkTiafGFvnP9qSZqdy23tCKgROLwdpJ+weIPtsz/nnYcmDU
   2Y4VEiFNVR3DkGH/BAZY2qyBbfhTBgCkFF7NW+sn8InRPgpP0Sm8URZh7
   DJ5E3ODIUb72hHP0Od9SpBkIVWMbIYk2fE3HmWvZSns/pDa22mb0ol5Tp
   z3EEqZhEJ//rcHEy6LMS7WLTw3SmXwWH7ZEXJ5pjG9/mPkeeBTw+ZiVuS
   sTn/aQykHdaZKwbpDsw+D5GepkbjR6cPNwFlaDualQzFTBrrlb7ljAqqn
   eYwAmO5+o1YCS6GeGimlag9+IQAH2gGynIfYBlxZkTs56i6V2ca6jyVOG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="392875995"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="392875995"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 21:15:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="774876340"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="774876340"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2023 21:15:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAkGI-000AJi-2B;
	Wed, 06 Dec 2023 05:15:54 +0000
Date: Wed, 6 Dec 2023 13:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jia He <justin.he@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: ERROR: modpost: vmlinux: local symbol 'dma_addressing_limited' was
 exported
Message-ID: <202312061307.TwC5Kt2r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 8ae0e970319ac0b516d285650a744bab4ed3dd37 dma-mapping: move dma_addressing_limited() out of line
date:   4 weeks ago
config: riscv-randconfig-c033-20221102 (https://download.01.org/0day-ci/archive/20231206/202312061307.TwC5Kt2r-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061307.TwC5Kt2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061307.TwC5Kt2r-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: vmlinux: local symbol 'rcu_barrier_tasks' was exported
ERROR: modpost: vmlinux: local symbol 'show_rcu_tasks_classic_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol 'get_rcu_tasks_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol 'call_rcu_tasks_rude' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_rcu_tasks_rude' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_barrier_tasks_rude' was exported
ERROR: modpost: vmlinux: local symbol 'show_rcu_tasks_rude_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol 'get_rcu_tasks_rude_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_trace_lock_map' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_trc_cmpxchg_need_qs' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_read_unlock_trace_special' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_tasks_trace_qs_blkd' was exported
ERROR: modpost: vmlinux: local symbol 'call_rcu_tasks_trace' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_rcu_tasks_trace' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_barrier_tasks_trace' was exported
ERROR: modpost: vmlinux: local symbol 'show_rcu_tasks_trace_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol 'get_rcu_tasks_trace_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol '__init_srcu_struct' was exported
ERROR: modpost: vmlinux: local symbol 'cleanup_srcu_struct' was exported
ERROR: modpost: vmlinux: local symbol '__srcu_read_lock' was exported
ERROR: modpost: vmlinux: local symbol '__srcu_read_unlock' was exported
ERROR: modpost: vmlinux: local symbol 'call_srcu' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_srcu_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_srcu' was exported
ERROR: modpost: vmlinux: local symbol 'get_state_synchronize_srcu' was exported
ERROR: modpost: vmlinux: local symbol 'start_poll_synchronize_srcu' was exported
ERROR: modpost: vmlinux: local symbol 'poll_state_synchronize_srcu' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_barrier' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_batches_completed' was exported
ERROR: modpost: vmlinux: local symbol 'srcutorture_get_gp_data' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_torture_stats_print' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_scheduler_active' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_get_gp_kthreads_prio' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_momentary_dyntick_idle' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_get_gp_seq' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_exp_batches_completed' was exported
ERROR: modpost: vmlinux: local symbol 'rcutorture_get_gp_data' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_is_watching' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_gp_slow_register' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_gp_slow_unregister' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_gp_set_torture_wait' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_force_quiescent_state' was exported
ERROR: modpost: vmlinux: local symbol 'call_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'kvfree_call_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'get_completed_synchronize_rcu_full' was exported
ERROR: modpost: vmlinux: local symbol 'get_state_synchronize_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'get_state_synchronize_rcu_full' was exported
ERROR: modpost: vmlinux: local symbol 'start_poll_synchronize_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'start_poll_synchronize_rcu_full' was exported
ERROR: modpost: vmlinux: local symbol 'poll_state_synchronize_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'poll_state_synchronize_rcu_full' was exported
ERROR: modpost: vmlinux: local symbol 'cond_synchronize_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'cond_synchronize_rcu_full' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_barrier' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_exp_jiffies_till_stall_check' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_jiffies_till_stall_check' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_check_boost_fail' was exported
ERROR: modpost: vmlinux: local symbol 'show_rcu_gp_kthreads' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_fwd_progress_check' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_stall_chain_notifier_register' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_stall_chain_notifier_unregister' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_rcu_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'start_poll_synchronize_rcu_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'start_poll_synchronize_rcu_expedited_full' was exported
ERROR: modpost: vmlinux: local symbol 'cond_synchronize_rcu_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'cond_synchronize_rcu_expedited_full' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_note_context_switch' was exported
ERROR: modpost: vmlinux: local symbol '__rcu_read_lock' was exported
ERROR: modpost: vmlinux: local symbol '__rcu_read_unlock' was exported
ERROR: modpost: vmlinux: local symbol 'dmam_free_coherent' was exported
ERROR: modpost: vmlinux: local symbol 'dmam_alloc_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_map_page_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_unmap_page_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_map_sg_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_map_sgtable' was exported
ERROR: modpost: vmlinux: local symbol 'dma_unmap_sg_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_map_resource' was exported
ERROR: modpost: vmlinux: local symbol 'dma_unmap_resource' was exported
ERROR: modpost: vmlinux: local symbol 'dma_sync_single_for_cpu' was exported
ERROR: modpost: vmlinux: local symbol 'dma_sync_single_for_device' was exported
ERROR: modpost: vmlinux: local symbol 'dma_sync_sg_for_cpu' was exported
ERROR: modpost: vmlinux: local symbol 'dma_sync_sg_for_device' was exported
ERROR: modpost: vmlinux: local symbol 'dma_get_sgtable_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_can_mmap' was exported
ERROR: modpost: vmlinux: local symbol 'dma_mmap_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_get_required_mask' was exported
ERROR: modpost: vmlinux: local symbol 'dma_alloc_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_free_attrs' was exported
ERROR: modpost: vmlinux: local symbol 'dma_alloc_pages' was exported
ERROR: modpost: vmlinux: local symbol 'dma_free_pages' was exported
ERROR: modpost: vmlinux: local symbol 'dma_mmap_pages' was exported
ERROR: modpost: vmlinux: local symbol 'dma_alloc_noncontiguous' was exported
ERROR: modpost: vmlinux: local symbol 'dma_free_noncontiguous' was exported
ERROR: modpost: vmlinux: local symbol 'dma_vmap_noncontiguous' was exported
ERROR: modpost: vmlinux: local symbol 'dma_vunmap_noncontiguous' was exported
ERROR: modpost: vmlinux: local symbol 'dma_mmap_noncontiguous' was exported
ERROR: modpost: vmlinux: local symbol 'dma_pci_p2pdma_supported' was exported
ERROR: modpost: vmlinux: local symbol 'dma_set_mask' was exported
ERROR: modpost: vmlinux: local symbol 'dma_set_coherent_mask' was exported
>> ERROR: modpost: vmlinux: local symbol 'dma_addressing_limited' was exported
ERROR: modpost: vmlinux: local symbol 'dma_max_mapping_size' was exported
ERROR: modpost: vmlinux: local symbol 'dma_opt_mapping_size' was exported
ERROR: modpost: vmlinux: local symbol 'dma_need_sync' was exported
ERROR: modpost: vmlinux: local symbol 'dma_get_merge_boundary' was exported
ERROR: modpost: vmlinux: local symbol 'register_module_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_module_notifier' was exported
ERROR: modpost: vmlinux: local symbol '__module_put_and_kthread_exit' was exported
ERROR: modpost: vmlinux: local symbol '__symbol_get' was exported
ERROR: modpost: vmlinux: local symbol '__request_module' was exported
ERROR: modpost: vmlinux: local symbol 'is_module_sig_enforced' was exported
ERROR: modpost: vmlinux: local symbol 'module_layout' was exported
ERROR: modpost: vmlinux: local symbol 'freezer_active' was exported
ERROR: modpost: vmlinux: local symbol 'freezing_slow_path' was exported
ERROR: modpost: vmlinux: local symbol '__refrigerator' was exported
ERROR: modpost: vmlinux: local symbol 'set_freezable' was exported
ERROR: modpost: vmlinux: local symbol 'prof_on' was exported
ERROR: modpost: vmlinux: local symbol 'profile_hits' was exported
ERROR: modpost: vmlinux: local symbol 'stack_trace_print' was exported
ERROR: modpost: vmlinux: local symbol 'stack_trace_snprint' was exported
ERROR: modpost: vmlinux: local symbol 'stack_trace_save' was exported
ERROR: modpost: vmlinux: local symbol 'stack_trace_save_tsk' was exported
ERROR: modpost: vmlinux: local symbol 'filter_irq_stacks' was exported
ERROR: modpost: vmlinux: local symbol 'sys_tz' was exported
ERROR: modpost: vmlinux: local symbol 'jiffies_to_msecs' was exported
ERROR: modpost: vmlinux: local symbol 'jiffies_to_usecs' was exported
ERROR: modpost: vmlinux: local symbol 'mktime64' was exported
ERROR: modpost: vmlinux: local symbol 'ns_to_kernel_old_timeval' was exported
ERROR: modpost: vmlinux: local symbol 'set_normalized_timespec64' was exported
ERROR: modpost: vmlinux: local symbol 'ns_to_timespec64' was exported
ERROR: modpost: vmlinux: local symbol '__msecs_to_jiffies' was exported
ERROR: modpost: vmlinux: local symbol '__usecs_to_jiffies' was exported
ERROR: modpost: vmlinux: local symbol 'timespec64_to_jiffies' was exported
ERROR: modpost: vmlinux: local symbol 'jiffies_to_timespec64' was exported
ERROR: modpost: vmlinux: local symbol 'jiffies_to_clock_t' was exported
ERROR: modpost: vmlinux: local symbol 'clock_t_to_jiffies' was exported
ERROR: modpost: vmlinux: local symbol 'jiffies_64_to_clock_t' was exported
ERROR: modpost: vmlinux: local symbol 'jiffies64_to_nsecs' was exported
ERROR: modpost: vmlinux: local symbol 'jiffies64_to_msecs' was exported
ERROR: modpost: vmlinux: local symbol 'nsecs_to_jiffies64' was exported
ERROR: modpost: vmlinux: local symbol 'nsecs_to_jiffies' was exported
ERROR: modpost: vmlinux: local symbol 'get_timespec64' was exported
ERROR: modpost: vmlinux: local symbol 'put_timespec64' was exported
ERROR: modpost: vmlinux: local symbol 'get_old_timespec32' was exported
ERROR: modpost: vmlinux: local symbol 'put_old_timespec32' was exported
ERROR: modpost: vmlinux: local symbol 'get_itimerspec64' was exported
ERROR: modpost: vmlinux: local symbol 'put_itimerspec64' was exported
ERROR: modpost: vmlinux: local symbol 'get_old_itimerspec32' was exported
ERROR: modpost: vmlinux: local symbol 'put_old_itimerspec32' was exported
ERROR: modpost: vmlinux: local symbol 'jiffies_64' was exported
ERROR: modpost: vmlinux: local symbol '__round_jiffies' was exported
ERROR: modpost: vmlinux: local symbol '__round_jiffies_relative' was exported
ERROR: modpost: vmlinux: local symbol 'round_jiffies' was exported
ERROR: modpost: vmlinux: local symbol 'round_jiffies_relative' was exported
ERROR: modpost: vmlinux: local symbol '__round_jiffies_up' was exported
ERROR: modpost: vmlinux: local symbol '__round_jiffies_up_relative' was exported
ERROR: modpost: vmlinux: local symbol 'round_jiffies_up' was exported
ERROR: modpost: vmlinux: local symbol 'round_jiffies_up_relative' was exported
ERROR: modpost: vmlinux: local symbol 'init_timer_key' was exported
ERROR: modpost: vmlinux: local symbol 'mod_timer_pending' was exported
ERROR: modpost: vmlinux: local symbol 'mod_timer' was exported
ERROR: modpost: vmlinux: local symbol 'timer_reduce' was exported
ERROR: modpost: vmlinux: local symbol 'add_timer' was exported
ERROR: modpost: vmlinux: local symbol 'add_timer_on' was exported
ERROR: modpost: vmlinux: local symbol 'timer_delete' was exported
ERROR: modpost: vmlinux: local symbol 'timer_shutdown' was exported
ERROR: modpost: vmlinux: local symbol 'try_to_del_timer_sync' was exported
ERROR: modpost: vmlinux: local symbol 'timer_delete_sync' was exported
ERROR: modpost: vmlinux: local symbol 'timer_shutdown_sync' was exported
ERROR: modpost: vmlinux: local symbol 'schedule_timeout' was exported
ERROR: modpost: vmlinux: local symbol 'schedule_timeout_interruptible' was exported
ERROR: modpost: vmlinux: local symbol 'schedule_timeout_killable' was exported
ERROR: modpost: vmlinux: local symbol 'schedule_timeout_uninterruptible' was exported
ERROR: modpost: vmlinux: local symbol 'schedule_timeout_idle' was exported
ERROR: modpost: vmlinux: local symbol 'msleep' was exported
ERROR: modpost: vmlinux: local symbol 'msleep_interruptible' was exported
ERROR: modpost: vmlinux: local symbol 'usleep_range_state' was exported
ERROR: modpost: vmlinux: local symbol '__ktime_divns' was exported
ERROR: modpost: vmlinux: local symbol 'ktime_add_safe' was exported
ERROR: modpost: vmlinux: local symbol 'hrtimer_resolution' was exported
ERROR: modpost: vmlinux: local symbol 'hrtimer_forward' was exported
ERROR: modpost: vmlinux: local symbol 'hrtimer_start_range_ns' was exported
ERROR: modpost: vmlinux: local symbol 'hrtimer_try_to_cancel' was exported
ERROR: modpost: vmlinux: local symbol 'hrtimer_cancel' was exported
ERROR: modpost: vmlinux: local symbol '__hrtimer_get_remaining' was exported
ERROR: modpost: vmlinux: local symbol 'hrtimer_init' was exported
ERROR: modpost: vmlinux: local symbol 'hrtimer_active' was exported
ERROR: modpost: vmlinux: local symbol 'hrtimer_sleeper_start_expires' was exported
ERROR: modpost: vmlinux: local symbol 'hrtimer_init_sleeper' was exported
ERROR: modpost: vmlinux: local symbol 'schedule_hrtimeout_range_clock' was exported
ERROR: modpost: vmlinux: local symbol 'schedule_hrtimeout_range' was exported
ERROR: modpost: vmlinux: local symbol 'schedule_hrtimeout' was exported
ERROR: modpost: vmlinux: local symbol 'ktime_get_mono_fast_ns' was exported
ERROR: modpost: vmlinux: local symbol 'ktime_get_raw_fast_ns' was exported
ERROR: modpost: vmlinux: local symbol 'ktime_get_boot_fast_ns' was exported
ERROR: modpost: vmlinux: local symbol 'ktime_get_tai_fast_ns' was exported
ERROR: modpost: vmlinux: local symbol 'ktime_get_real_fast_ns' was exported
ERROR: modpost: vmlinux: local symbol 'pvclock_gtod_register_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'pvclock_gtod_unregister_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'ktime_get_real_ts64' was exported
ERROR: modpost: vmlinux: local symbol 'ktime_get' was exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
