Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC134F9C4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZECg2Xt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699201659; x=1730737659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bv5XukW+wMPce5Rvom+MsvaQKUfmCFugnLCpCq3bUnw=;
  b=ZECg2Xt2kcb7pDeBTT+0WgLqP8FJPIadDtGWdmaFUmG+lzWryUwF78ut
   sxTYR9QtXysVtKrPh6B7UdqF/0EZ69ydWSNLJkGbG3YtKFjoaUGjcrSc4
   iTSum40FAT8smdgZDtlCbuYdINCiwOhrQt81V6+ictssEK812lArSoF0s
   KENuMrn27YJW/hjAaQHoT/tsUkxwrCGm0Dmws25y6jd5OI/EBkCkaxL1V
   ldb4LHBTmEmGk0fkZmg0etoSCkyZy38mQF4VKhOu3g73Mk6OHMLlv81ID
   uGG/28Br2HI4+3cOMqjW+cabHTPSfyemoPqWLMHY0H+y+cBvXfjH7j9tm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="475395169"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="475395169"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 08:27:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="9866441"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2023 08:27:37 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzfyI-0005c0-1I;
	Sun, 05 Nov 2023 16:27:34 +0000
Date: Mon, 6 Nov 2023 00:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>,
	Laurent Vivier <laurent@vivier.eu>
Subject: ERROR: modpost: vmlinux: local symbol 'init_binfmt_misc' was exported
Message-ID: <202311060036.SZm0Y4Vs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: 21ca59b365c091d583f36ac753eaa8baf947be6f binfmt_misc: enable sandboxed mounts
date:   4 weeks ago
config: riscv-randconfig-r036-20230813 (https://download.01.org/0day-ci/archive/20231106/202311060036.SZm0Y4Vs-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060036.SZm0Y4Vs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060036.SZm0Y4Vs-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: vmlinux: local symbol 'pgtable_l5_enabled' was exported
ERROR: modpost: vmlinux: local symbol 'phys_ram_base' was exported
ERROR: modpost: vmlinux: local symbol 'empty_zero_page' was exported
ERROR: modpost: vmlinux: local symbol 'vm_get_page_prot' was exported
ERROR: modpost: vmlinux: local symbol 'riscv_cbom_block_size' was exported
ERROR: modpost: vmlinux: local symbol 'riscv_cboz_block_size' was exported
ERROR: modpost: vmlinux: local symbol 'arch_wb_cache_pmem' was exported
ERROR: modpost: vmlinux: local symbol 'arch_invalidate_pmem' was exported
ERROR: modpost: vmlinux: local symbol 'dma_cache_alignment' was exported
ERROR: modpost: vmlinux: local symbol 'riscv_noncoherent_register_cache_ops' was exported
ERROR: modpost: vmlinux: local symbol 'free_task' was exported
ERROR: modpost: vmlinux: local symbol '__mmdrop' was exported
ERROR: modpost: vmlinux: local symbol '__put_task_struct' was exported
ERROR: modpost: vmlinux: local symbol '__put_task_struct_rcu_cb' was exported
ERROR: modpost: vmlinux: local symbol 'mmput' was exported
ERROR: modpost: vmlinux: local symbol 'mmput_async' was exported
ERROR: modpost: vmlinux: local symbol 'get_task_mm' was exported
ERROR: modpost: vmlinux: local symbol 'panic_timeout' was exported
ERROR: modpost: vmlinux: local symbol 'panic_notifier_list' was exported
ERROR: modpost: vmlinux: local symbol 'panic_blink' was exported
ERROR: modpost: vmlinux: local symbol 'nmi_panic' was exported
ERROR: modpost: vmlinux: local symbol 'panic' was exported
ERROR: modpost: vmlinux: local symbol 'test_taint' was exported
ERROR: modpost: vmlinux: local symbol 'add_taint' was exported
ERROR: modpost: vmlinux: local symbol '__warn_printk' was exported
ERROR: modpost: vmlinux: local symbol '__stack_chk_fail' was exported
ERROR: modpost: vmlinux: local symbol '__cpuhp_state_add_instance' was exported
ERROR: modpost: vmlinux: local symbol '__cpuhp_setup_state_cpuslocked' was exported
ERROR: modpost: vmlinux: local symbol '__cpuhp_setup_state' was exported
ERROR: modpost: vmlinux: local symbol '__cpuhp_state_remove_instance' was exported
ERROR: modpost: vmlinux: local symbol '__cpuhp_remove_state_cpuslocked' was exported
ERROR: modpost: vmlinux: local symbol '__cpuhp_remove_state' was exported
ERROR: modpost: vmlinux: local symbol 'cpu_bit_bitmap' was exported
ERROR: modpost: vmlinux: local symbol 'cpu_all_bits' was exported
ERROR: modpost: vmlinux: local symbol '__cpu_possible_mask' was exported
ERROR: modpost: vmlinux: local symbol '__cpu_online_mask' was exported
ERROR: modpost: vmlinux: local symbol '__cpu_present_mask' was exported
ERROR: modpost: vmlinux: local symbol '__cpu_active_mask' was exported
ERROR: modpost: vmlinux: local symbol '__cpu_dying_mask' was exported
ERROR: modpost: vmlinux: local symbol '__num_online_cpus' was exported
ERROR: modpost: vmlinux: local symbol 'cpu_mitigations_off' was exported
ERROR: modpost: vmlinux: local symbol 'cpu_mitigations_auto_nosmt' was exported
ERROR: modpost: vmlinux: local symbol 'rcuwait_wake_up' was exported
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
ERROR: modpost: vmlinux: local symbol 'tasklet_kill' was exported
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
ERROR: modpost: vmlinux: local symbol 'proc_dou8vec_minmax' was exported
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
ERROR: modpost: vmlinux: local symbol 'has_capability' was exported
ERROR: modpost: vmlinux: local symbol 'has_capability_noaudit' was exported
ERROR: modpost: vmlinux: local symbol 'ns_capable' was exported
ERROR: modpost: vmlinux: local symbol 'ns_capable_noaudit' was exported
ERROR: modpost: vmlinux: local symbol 'ns_capable_setid' was exported
ERROR: modpost: vmlinux: local symbol 'capable' was exported
ERROR: modpost: vmlinux: local symbol 'file_ns_capable' was exported
ERROR: modpost: vmlinux: local symbol 'capable_wrt_inode_uidgid' was exported
ERROR: modpost: vmlinux: local symbol 'task_user_regset_view' was exported
>> ERROR: modpost: vmlinux: local symbol 'init_binfmt_misc' was exported
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
ERROR: modpost: vmlinux: local symbol '__init_work' was exported
ERROR: modpost: vmlinux: local symbol 'destroy_work_on_stack' was exported
ERROR: modpost: vmlinux: local symbol 'destroy_delayed_work_on_stack' was exported
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
