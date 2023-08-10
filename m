Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96631877
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 23:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691711606; x=1723247606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XZRNMYiQFyUr54cieBDe1Sp61J0my9pfSDQxA+zZ/vc=;
  b=JQQzSmyD7rLRKfnZFBdoq5/AuT/MFUMMDrnnB8CRB1M6kSJ/gW0aVY1z
   F1aZYdJGRq3TZOBpCIghHSQQXSkxLDCGX++bqg9b01EcVlWH7s79syxMt
   2UeT7sV/kG4VkVrtkzjd6/WjYUBtGXucbR7T7xp+HUMvqas4XSaIvpnyU
   zH63kzSFsAJ7KUJlJVgfsXcSKccycUmo4BcXQJU/R41eoxuxmmvB/zdzy
   zY+Rfr0rPeUYPbFoww8V624xju+uQrglURBZyGjFSP6DZNZAi9XiO+LUy
   V57+ud70as1Fy246/+bW9YdlntpDNvoHHwwlNHtbMF9lfmwYw0kTE2KOu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351872273"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="351872273"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 16:53:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="856092398"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="856092398"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Aug 2023 16:53:24 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUFT1-0007LO-0a;
	Thu, 10 Aug 2023 23:53:23 +0000
Date: Fri, 11 Aug 2023 07:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:testing/af/vexp 3/9] ERROR: modpost: vmlinux:
 local symbol 'set_workqueue_cpumask' was exported
Message-ID: <202308110730.mXECPXwY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block testing/af/vexp
head:   c31aaa998888aa068bf42d9bd453568d27319a3b
commit: 4c7baed466761c1ee39e4c91e6b5010afac6a4e9 [3/9] workqueue: Add set_workqueue_cpumask() helper function
config: riscv-randconfig-r042-20230811 (https://download.01.org/0day-ci/archive/20230811/202308110730.mXECPXwY-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110730.mXECPXwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110730.mXECPXwY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: vmlinux: local symbol 'thread_group_exited' was exported
ERROR: modpost: vmlinux: local symbol 'abort' was exported
ERROR: modpost: vmlinux: local symbol 'irq_stat' was exported
ERROR: modpost: vmlinux: local symbol 'hardirqs_enabled' was exported
ERROR: modpost: vmlinux: local symbol 'hardirq_context' was exported
ERROR: modpost: vmlinux: local symbol '__local_bh_disable_ip' was exported
ERROR: modpost: vmlinux: local symbol '_local_bh_enable' was exported
ERROR: modpost: vmlinux: local symbol '__local_bh_enable_ip' was exported
ERROR: modpost: vmlinux: local symbol '__tasklet_schedule' was exported
ERROR: modpost: vmlinux: local symbol '__tasklet_hi_schedule' was exported
ERROR: modpost: vmlinux: local symbol 'tasklet_setup' was exported
ERROR: modpost: vmlinux: local symbol 'tasklet_init' was exported
ERROR: modpost: vmlinux: local symbol 'tasklet_unlock_spin_wait' was exported
ERROR: modpost: vmlinux: local symbol 'tasklet_kill' was exported
ERROR: modpost: vmlinux: local symbol 'tasklet_unlock' was exported
ERROR: modpost: vmlinux: local symbol 'tasklet_unlock_wait' was exported
ERROR: modpost: vmlinux: local symbol 'ioport_resource' was exported
ERROR: modpost: vmlinux: local symbol 'iomem_resource' was exported
ERROR: modpost: vmlinux: local symbol 'request_resource' was exported
ERROR: modpost: vmlinux: local symbol 'release_resource' was exported
ERROR: modpost: vmlinux: local symbol 'walk_iomem_res_desc' was exported
ERROR: modpost: vmlinux: local symbol 'page_is_ram' was exported
ERROR: modpost: vmlinux: local symbol 'region_intersects' was exported
ERROR: modpost: vmlinux: local symbol 'allocate_resource' was exported
ERROR: modpost: vmlinux: local symbol 'insert_resource' was exported
ERROR: modpost: vmlinux: local symbol 'insert_resource_expand_to_fit' was exported
ERROR: modpost: vmlinux: local symbol 'remove_resource' was exported
ERROR: modpost: vmlinux: local symbol 'adjust_resource' was exported
ERROR: modpost: vmlinux: local symbol '__request_region' was exported
ERROR: modpost: vmlinux: local symbol '__release_region' was exported
ERROR: modpost: vmlinux: local symbol 'devm_request_resource' was exported
ERROR: modpost: vmlinux: local symbol 'devm_release_resource' was exported
ERROR: modpost: vmlinux: local symbol '__devm_request_region' was exported
ERROR: modpost: vmlinux: local symbol '__devm_release_region' was exported
ERROR: modpost: vmlinux: local symbol 'resource_list_create_entry' was exported
ERROR: modpost: vmlinux: local symbol 'resource_list_free' was exported
ERROR: modpost: vmlinux: local symbol 'sysctl_vals' was exported
ERROR: modpost: vmlinux: local symbol 'sysctl_long_vals' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dobool' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dointvec' was exported
ERROR: modpost: vmlinux: local symbol 'proc_douintvec' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dointvec_jiffies' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dointvec_minmax' was exported
ERROR: modpost: vmlinux: local symbol 'proc_douintvec_minmax' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dointvec_userhz_jiffies' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dointvec_ms_jiffies' was exported
ERROR: modpost: vmlinux: local symbol 'proc_dostring' was exported
ERROR: modpost: vmlinux: local symbol 'proc_doulongvec_minmax' was exported
ERROR: modpost: vmlinux: local symbol 'proc_doulongvec_ms_jiffies_minmax' was exported
ERROR: modpost: vmlinux: local symbol 'proc_do_large_bitmap' was exported
ERROR: modpost: vmlinux: local symbol 'file_ns_capable' was exported
ERROR: modpost: vmlinux: local symbol 'capable_wrt_inode_uidgid' was exported
ERROR: modpost: vmlinux: local symbol 'task_user_regset_view' was exported
ERROR: modpost: vmlinux: local symbol 'init_user_ns' was exported
ERROR: modpost: vmlinux: local symbol 'free_uid' was exported
ERROR: modpost: vmlinux: local symbol 'recalc_sigpending' was exported
ERROR: modpost: vmlinux: local symbol 'flush_signals' was exported
ERROR: modpost: vmlinux: local symbol 'dequeue_signal' was exported
ERROR: modpost: vmlinux: local symbol 'kill_pid_usb_asyncio' was exported
ERROR: modpost: vmlinux: local symbol 'send_sig_info' was exported
ERROR: modpost: vmlinux: local symbol 'send_sig' was exported
ERROR: modpost: vmlinux: local symbol 'force_sig' was exported
ERROR: modpost: vmlinux: local symbol 'send_sig_mceerr' was exported
ERROR: modpost: vmlinux: local symbol 'kill_pgrp' was exported
ERROR: modpost: vmlinux: local symbol 'kill_pid' was exported
ERROR: modpost: vmlinux: local symbol 'sigprocmask' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_sigaction' was exported
ERROR: modpost: vmlinux: local symbol 'overflowuid' was exported
ERROR: modpost: vmlinux: local symbol 'overflowgid' was exported
ERROR: modpost: vmlinux: local symbol 'fs_overflowuid' was exported
ERROR: modpost: vmlinux: local symbol 'fs_overflowgid' was exported
ERROR: modpost: vmlinux: local symbol 'usermodehelper_read_trylock' was exported
ERROR: modpost: vmlinux: local symbol 'usermodehelper_read_lock_wait' was exported
ERROR: modpost: vmlinux: local symbol 'usermodehelper_read_unlock' was exported
ERROR: modpost: vmlinux: local symbol 'call_usermodehelper_setup' was exported
ERROR: modpost: vmlinux: local symbol 'call_usermodehelper_exec' was exported
ERROR: modpost: vmlinux: local symbol 'call_usermodehelper' was exported
ERROR: modpost: vmlinux: local symbol 'system_wq' was exported
ERROR: modpost: vmlinux: local symbol 'system_highpri_wq' was exported
ERROR: modpost: vmlinux: local symbol 'system_long_wq' was exported
ERROR: modpost: vmlinux: local symbol 'system_unbound_wq' was exported
ERROR: modpost: vmlinux: local symbol 'system_freezable_wq' was exported
ERROR: modpost: vmlinux: local symbol 'system_power_efficient_wq' was exported
ERROR: modpost: vmlinux: local symbol 'system_freezable_power_efficient_wq' was exported
ERROR: modpost: vmlinux: local symbol 'queue_work_on' was exported
ERROR: modpost: vmlinux: local symbol 'queue_work_node' was exported
ERROR: modpost: vmlinux: local symbol 'delayed_work_timer_fn' was exported
ERROR: modpost: vmlinux: local symbol 'queue_delayed_work_on' was exported
ERROR: modpost: vmlinux: local symbol 'mod_delayed_work_on' was exported
ERROR: modpost: vmlinux: local symbol 'queue_rcu_work' was exported
ERROR: modpost: vmlinux: local symbol '__flush_workqueue' was exported
ERROR: modpost: vmlinux: local symbol 'drain_workqueue' was exported
ERROR: modpost: vmlinux: local symbol 'flush_work' was exported
ERROR: modpost: vmlinux: local symbol 'cancel_work_sync' was exported
ERROR: modpost: vmlinux: local symbol 'flush_delayed_work' was exported
ERROR: modpost: vmlinux: local symbol 'flush_rcu_work' was exported
ERROR: modpost: vmlinux: local symbol 'cancel_work' was exported
ERROR: modpost: vmlinux: local symbol 'cancel_delayed_work' was exported
ERROR: modpost: vmlinux: local symbol 'cancel_delayed_work_sync' was exported
ERROR: modpost: vmlinux: local symbol 'execute_in_process_context' was exported
>> ERROR: modpost: vmlinux: local symbol 'set_workqueue_cpumask' was exported
ERROR: modpost: vmlinux: local symbol 'alloc_workqueue' was exported
ERROR: modpost: vmlinux: local symbol 'destroy_workqueue' was exported
ERROR: modpost: vmlinux: local symbol 'workqueue_set_max_active' was exported
ERROR: modpost: vmlinux: local symbol 'current_work' was exported
ERROR: modpost: vmlinux: local symbol 'workqueue_congested' was exported
ERROR: modpost: vmlinux: local symbol 'work_busy' was exported
ERROR: modpost: vmlinux: local symbol 'set_worker_desc' was exported
ERROR: modpost: vmlinux: local symbol 'work_on_cpu' was exported
ERROR: modpost: vmlinux: local symbol 'work_on_cpu_safe' was exported
ERROR: modpost: vmlinux: local symbol '__warn_flushing_systemwide_wq' was exported
ERROR: modpost: vmlinux: local symbol 'init_pid_ns' was exported
ERROR: modpost: vmlinux: local symbol 'put_pid' was exported
ERROR: modpost: vmlinux: local symbol 'find_pid_ns' was exported
ERROR: modpost: vmlinux: local symbol 'find_vpid' was exported
ERROR: modpost: vmlinux: local symbol 'pid_task' was exported
ERROR: modpost: vmlinux: local symbol 'get_task_pid' was exported
ERROR: modpost: vmlinux: local symbol 'get_pid_task' was exported
ERROR: modpost: vmlinux: local symbol 'find_get_pid' was exported
ERROR: modpost: vmlinux: local symbol 'pid_nr_ns' was exported
ERROR: modpost: vmlinux: local symbol 'pid_vnr' was exported
ERROR: modpost: vmlinux: local symbol '__task_pid_nr_ns' was exported
ERROR: modpost: vmlinux: local symbol 'task_active_pid_ns' was exported
ERROR: modpost: vmlinux: local symbol 'find_ge_pid' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_byte' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_byte' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_byte' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_short' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_short' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_short' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_ushort' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_ushort' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_ushort' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_int' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_int' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_int' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_uint' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_uint' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_uint' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_long' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_long' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_long' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_ulong' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_ulong' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_ulong' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_ullong' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_ullong' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_ullong' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_hexint' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_hexint' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_hexint' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_uint_minmax' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_charp' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_charp' was exported
ERROR: modpost: vmlinux: local symbol 'param_free_charp' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_charp' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_bool' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_bool' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_bool' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_bool_enable_only' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_bool_enable_only' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_invbool' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_invbool' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_invbool' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_bint' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_bint' was exported
ERROR: modpost: vmlinux: local symbol 'param_array_ops' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_copystring' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_string' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_string' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_param_lock' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_param_unlock' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_should_stop' was exported
ERROR: modpost: vmlinux: local symbol '__kthread_should_park' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_should_park' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_freezable_should_stop' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_func' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_data' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_parkme' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_complete_and_exit' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_create_on_node' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_bind' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_create_on_cpu' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_unpark' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_park' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_stop' was exported
ERROR: modpost: vmlinux: local symbol '__kthread_init_worker' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_worker_fn' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_create_worker' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_create_worker_on_cpu' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_queue_work' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_delayed_work_timer_fn' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_queue_delayed_work' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_flush_work' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_mod_delayed_work' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_cancel_work_sync' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_cancel_delayed_work_sync' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_flush_worker' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_destroy_worker' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_use_mm' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_unuse_mm' was exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
