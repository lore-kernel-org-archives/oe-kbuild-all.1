Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38872B661
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwVeCAuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698496165; x=1730032165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kafm+B1CYZWyAiqYAMxeuKBP/xw2BpugTt21fhH6b/g=;
  b=KwVeCAuKEJkLUuYPOJB3S/PVO7VMnCtF//0rocm1DVLZ/8u+Wrdj4Wv5
   bPmbpZWWMK43zKxlxSLWMaKcRX6GnEpZL2DntIzhsWnzIe6wjBXt4JDbp
   hib+FApFeTpjhPuwCbIAqJZ/k8aOiAdy2QAfYFaUEPv9TWNaUyrGXmFQp
   zrq4K5Hvf0ZYPKQdM2XpCw5Mf9yHR0ZA+MLl2KNXngBUg9U8i4aIbjm2y
   g7GIfCeqrcDP1Ter2gxcET/LqyuPb5P8vz74hr20mvus7JbIxr7KoOx1l
   sxJMdZCICqu/QwnBcV4sNoV77TKzaIVBu3Hs1lwPFTMCR4NWg1isI/NGE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="378263692"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="378263692"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 05:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="736347090"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="736347090"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Oct 2023 05:29:22 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwiRM-000BkF-0q;
	Sat, 28 Oct 2023 12:29:20 +0000
Date: Sat, 28 Oct 2023 20:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 18/58] ERROR: modpost: vmlinux: local
 symbol 'kthread_stop_put' was exported
Message-ID: <202310282049.HXCHtgEz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   d431880137b55533f664056070226a88dba99637
commit: 6309727ef27162deabd5c095c11af24970fba5a2 [18/58] kthread: add kthread_stop_put
config: riscv-randconfig-c033-20221102 (https://download.01.org/0day-ci/archive/20231028/202310282049.HXCHtgEz-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310282049.HXCHtgEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310282049.HXCHtgEz-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

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
ERROR: modpost: vmlinux: local symbol 'alloc_workqueue' was exported
ERROR: modpost: vmlinux: local symbol 'destroy_workqueue' was exported
ERROR: modpost: vmlinux: local symbol 'workqueue_set_max_active' was exported
ERROR: modpost: vmlinux: local symbol 'current_work' was exported
ERROR: modpost: vmlinux: local symbol 'workqueue_congested' was exported
ERROR: modpost: vmlinux: local symbol 'work_busy' was exported
ERROR: modpost: vmlinux: local symbol 'set_worker_desc' was exported
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
>> ERROR: modpost: vmlinux: local symbol 'kthread_stop_put' was exported
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
ERROR: modpost: vmlinux: local symbol 'kthread_associate_blkcg' was exported
ERROR: modpost: vmlinux: local symbol 'atomic_notifier_chain_register' was exported
ERROR: modpost: vmlinux: local symbol 'atomic_notifier_chain_register_unique_prio' was exported
ERROR: modpost: vmlinux: local symbol 'atomic_notifier_chain_unregister' was exported
ERROR: modpost: vmlinux: local symbol 'atomic_notifier_call_chain' was exported
ERROR: modpost: vmlinux: local symbol 'blocking_notifier_chain_register' was exported
ERROR: modpost: vmlinux: local symbol 'blocking_notifier_chain_register_unique_prio' was exported
ERROR: modpost: vmlinux: local symbol 'blocking_notifier_chain_unregister' was exported
ERROR: modpost: vmlinux: local symbol 'blocking_notifier_call_chain_robust' was exported
ERROR: modpost: vmlinux: local symbol 'blocking_notifier_call_chain' was exported
ERROR: modpost: vmlinux: local symbol 'raw_notifier_chain_register' was exported
ERROR: modpost: vmlinux: local symbol 'raw_notifier_chain_unregister' was exported
ERROR: modpost: vmlinux: local symbol 'raw_notifier_call_chain_robust' was exported
ERROR: modpost: vmlinux: local symbol 'raw_notifier_call_chain' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_notifier_chain_register' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_notifier_chain_unregister' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_notifier_call_chain' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_init_notifier_head' was exported
ERROR: modpost: vmlinux: local symbol 'register_die_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_die_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_kobj' was exported
ERROR: modpost: vmlinux: local symbol '__put_cred' was exported
ERROR: modpost: vmlinux: local symbol 'get_task_cred' was exported
ERROR: modpost: vmlinux: local symbol 'prepare_creds' was exported
ERROR: modpost: vmlinux: local symbol 'commit_creds' was exported
ERROR: modpost: vmlinux: local symbol 'abort_creds' was exported
ERROR: modpost: vmlinux: local symbol 'override_creds' was exported
ERROR: modpost: vmlinux: local symbol 'revert_creds' was exported
ERROR: modpost: vmlinux: local symbol 'cred_fscmp' was exported
ERROR: modpost: vmlinux: local symbol 'prepare_kernel_cred' was exported
ERROR: modpost: vmlinux: local symbol 'set_security_override' was exported
ERROR: modpost: vmlinux: local symbol 'set_security_override_from_ctx' was exported
ERROR: modpost: vmlinux: local symbol 'set_create_files_as' was exported
ERROR: modpost: vmlinux: local symbol 'creds_are_invalid' was exported
ERROR: modpost: vmlinux: local symbol '__invalid_creds' was exported
ERROR: modpost: vmlinux: local symbol '__validate_process_creds' was exported
ERROR: modpost: vmlinux: local symbol 'cad_pid' was exported
ERROR: modpost: vmlinux: local symbol 'reboot_mode' was exported
ERROR: modpost: vmlinux: local symbol 'emergency_restart' was exported
ERROR: modpost: vmlinux: local symbol 'register_reboot_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_reboot_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'devm_register_reboot_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'register_restart_handler' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_restart_handler' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_restart' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_halt' was exported
ERROR: modpost: vmlinux: local symbol 'register_sys_off_handler' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_sys_off_handler' was exported
ERROR: modpost: vmlinux: local symbol 'devm_register_sys_off_handler' was exported
ERROR: modpost: vmlinux: local symbol 'devm_register_power_off_handler' was exported
ERROR: modpost: vmlinux: local symbol 'devm_register_restart_handler' was exported
ERROR: modpost: vmlinux: local symbol 'register_platform_power_off' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_platform_power_off' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_can_power_off' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_power_off' was exported
ERROR: modpost: vmlinux: local symbol 'orderly_poweroff' was exported
ERROR: modpost: vmlinux: local symbol 'orderly_reboot' was exported
ERROR: modpost: vmlinux: local symbol 'hw_protection_shutdown' was exported
ERROR: modpost: vmlinux: local symbol 'async_schedule_node_domain' was exported
ERROR: modpost: vmlinux: local symbol 'async_schedule_node' was exported
ERROR: modpost: vmlinux: local symbol 'async_synchronize_full' was exported
ERROR: modpost: vmlinux: local symbol 'async_synchronize_full_domain' was exported
ERROR: modpost: vmlinux: local symbol 'async_synchronize_cookie_domain' was exported
ERROR: modpost: vmlinux: local symbol 'async_synchronize_cookie' was exported
ERROR: modpost: vmlinux: local symbol 'current_is_async' was exported
ERROR: modpost: vmlinux: local symbol 'smpboot_register_percpu_thread' was exported
ERROR: modpost: vmlinux: local symbol 'smpboot_unregister_percpu_thread' was exported
ERROR: modpost: vmlinux: local symbol 'regset_get' was exported
ERROR: modpost: vmlinux: local symbol 'regset_get_alloc' was exported
ERROR: modpost: vmlinux: local symbol 'umd_load_blob' was exported
ERROR: modpost: vmlinux: local symbol 'umd_unload_blob' was exported
ERROR: modpost: vmlinux: local symbol 'umd_cleanup_helper' was exported
ERROR: modpost: vmlinux: local symbol 'fork_usermode_driver' was exported
ERROR: modpost: vmlinux: local symbol 'groups_alloc' was exported
ERROR: modpost: vmlinux: local symbol 'groups_free' was exported
ERROR: modpost: vmlinux: local symbol 'groups_sort' was exported
ERROR: modpost: vmlinux: local symbol 'set_groups' was exported
ERROR: modpost: vmlinux: local symbol 'set_current_groups' was exported
ERROR: modpost: vmlinux: local symbol 'in_group_p' was exported
ERROR: modpost: vmlinux: local symbol 'in_egroup_p' was exported
ERROR: modpost: vmlinux: local symbol '__tracepoint_ipi_send_cpu' was exported
ERROR: modpost: vmlinux: local symbol '__traceiter_ipi_send_cpu' was exported
ERROR: modpost: vmlinux: local symbol '__SCK__tp_func_ipi_send_cpu' was exported
ERROR: modpost: vmlinux: local symbol '__tracepoint_ipi_send_cpumask' was exported
ERROR: modpost: vmlinux: local symbol '__traceiter_ipi_send_cpumask' was exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
