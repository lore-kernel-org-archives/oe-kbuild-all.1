Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D78119453
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 23:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqNAMGJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699226110; x=1730762110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ySCtM2LaWOafMdUmj2H/o5P9TrLodaBMDYFdfnDterg=;
  b=CqNAMGJDFFiEB/7JL1DcuYXanGkeeOnQx5qU0hkWQtO0Y6ddAgIU7WyU
   LKtwa59t1ZZiEkzMx7f5FppBPbmOodWfYmLTg1mQHDyN6DPHp/4Abe+4w
   qFs5TIMJSXezKnb0ScZhEb117fNsLVL7fWF4a7fd1gPIKOKBm+TSss93/
   W+30sPmg19XKZ17Vdfuu/ndcs8tVTN5ZrA6CZL3DOY+c7jZNDkFBTxt0f
   3Da67L9q5Zk4afiJf/n/wNZgILZZ2TdX9UctBn4ROhYPSbpRyKhPMWpif
   hUN7wISRJWsR6qh4rcgPVnqkAh5evEEb13UWlyG9pR2ocM/wqm9chdniH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="388999702"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="388999702"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 15:15:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="738634499"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="738634499"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Nov 2023 15:15:04 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzmKc-0005sU-0Q;
	Sun, 05 Nov 2023 23:15:02 +0000
Date: Mon, 6 Nov 2023 07:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>
Subject: ERROR: modpost: vmlinux: local symbol 'nbcon_can_proceed' was
 exported
Message-ID: <202311060709.kmj0T96l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: 9757acd0a700ba4a0d16dde4ba820eb052aba1a7 printk: nbcon: Allow drivers to mark unsafe regions and check state
date:   7 weeks ago
config: riscv-randconfig-r036-20230813 (https://download.01.org/0day-ci/archive/20231106/202311060709.kmj0T96l-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060709.kmj0T96l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060709.kmj0T96l-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: vmlinux: local symbol 'lock_pin_lock' was exported
ERROR: modpost: vmlinux: local symbol 'lock_repin_lock' was exported
ERROR: modpost: vmlinux: local symbol 'lock_unpin_lock' was exported
ERROR: modpost: vmlinux: local symbol 'lockdep_unregister_key' was exported
ERROR: modpost: vmlinux: local symbol 'debug_check_no_locks_freed' was exported
ERROR: modpost: vmlinux: local symbol 'debug_check_no_locks_held' was exported
ERROR: modpost: vmlinux: local symbol 'debug_show_all_locks' was exported
ERROR: modpost: vmlinux: local symbol 'debug_show_held_locks' was exported
ERROR: modpost: vmlinux: local symbol 'lockdep_rcu_suspicious' was exported
ERROR: modpost: vmlinux: local symbol 'rt_mutex_base_init' was exported
ERROR: modpost: vmlinux: local symbol 'rt_mutex_lock_nested' was exported
ERROR: modpost: vmlinux: local symbol '_rt_mutex_lock_nest_lock' was exported
ERROR: modpost: vmlinux: local symbol 'rt_mutex_lock_interruptible' was exported
ERROR: modpost: vmlinux: local symbol 'rt_mutex_lock_killable' was exported
ERROR: modpost: vmlinux: local symbol 'rt_mutex_trylock' was exported
ERROR: modpost: vmlinux: local symbol 'rt_mutex_unlock' was exported
ERROR: modpost: vmlinux: local symbol '__rt_mutex_init' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_trylock' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_trylock_bh' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irqsave' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_bh' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irqrestore' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_bh' was exported
ERROR: modpost: vmlinux: local symbol '_raw_read_trylock' was exported
ERROR: modpost: vmlinux: local symbol '_raw_read_lock' was exported
ERROR: modpost: vmlinux: local symbol '_raw_read_lock_irqsave' was exported
ERROR: modpost: vmlinux: local symbol '_raw_read_lock_irq' was exported
ERROR: modpost: vmlinux: local symbol '_raw_read_lock_bh' was exported
ERROR: modpost: vmlinux: local symbol '_raw_read_unlock' was exported
ERROR: modpost: vmlinux: local symbol '_raw_read_unlock_irqrestore' was exported
ERROR: modpost: vmlinux: local symbol '_raw_read_unlock_irq' was exported
ERROR: modpost: vmlinux: local symbol '_raw_read_unlock_bh' was exported
ERROR: modpost: vmlinux: local symbol '_raw_write_trylock' was exported
ERROR: modpost: vmlinux: local symbol '_raw_write_lock' was exported
ERROR: modpost: vmlinux: local symbol '_raw_write_lock_nested' was exported
ERROR: modpost: vmlinux: local symbol '_raw_write_lock_irqsave' was exported
ERROR: modpost: vmlinux: local symbol '_raw_write_lock_irq' was exported
ERROR: modpost: vmlinux: local symbol '_raw_write_lock_bh' was exported
ERROR: modpost: vmlinux: local symbol '_raw_write_unlock' was exported
ERROR: modpost: vmlinux: local symbol '_raw_write_unlock_irqrestore' was exported
ERROR: modpost: vmlinux: local symbol '_raw_write_unlock_irq' was exported
ERROR: modpost: vmlinux: local symbol '_raw_write_unlock_bh' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_nested' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irqsave_nested' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_nest_lock' was exported
ERROR: modpost: vmlinux: local symbol 'in_lock_functions' was exported
ERROR: modpost: vmlinux: local symbol '__raw_spin_lock_init' was exported
ERROR: modpost: vmlinux: local symbol '__rwlock_init' was exported
ERROR: modpost: vmlinux: local symbol 'cpu_latency_qos_request_active' was exported
ERROR: modpost: vmlinux: local symbol 'cpu_latency_qos_add_request' was exported
ERROR: modpost: vmlinux: local symbol 'cpu_latency_qos_update_request' was exported
ERROR: modpost: vmlinux: local symbol 'cpu_latency_qos_remove_request' was exported
ERROR: modpost: vmlinux: local symbol 'freq_qos_add_request' was exported
ERROR: modpost: vmlinux: local symbol 'freq_qos_update_request' was exported
ERROR: modpost: vmlinux: local symbol 'freq_qos_remove_request' was exported
ERROR: modpost: vmlinux: local symbol 'freq_qos_add_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'freq_qos_remove_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'pm_wq' was exported
ERROR: modpost: vmlinux: local symbol 'console_printk' was exported
ERROR: modpost: vmlinux: local symbol 'ignore_console_lock_warning' was exported
ERROR: modpost: vmlinux: local symbol '__tracepoint_console' was exported
ERROR: modpost: vmlinux: local symbol '__traceiter_console' was exported
ERROR: modpost: vmlinux: local symbol '__SCK__tp_func_console' was exported
ERROR: modpost: vmlinux: local symbol 'oops_in_progress' was exported
ERROR: modpost: vmlinux: local symbol 'console_list' was exported
ERROR: modpost: vmlinux: local symbol 'lockdep_assert_console_list_lock_held' was exported
ERROR: modpost: vmlinux: local symbol 'console_srcu_read_lock_is_held' was exported
ERROR: modpost: vmlinux: local symbol 'console_list_lock' was exported
ERROR: modpost: vmlinux: local symbol 'console_list_unlock' was exported
ERROR: modpost: vmlinux: local symbol 'console_srcu_read_lock' was exported
ERROR: modpost: vmlinux: local symbol 'console_srcu_read_unlock' was exported
ERROR: modpost: vmlinux: local symbol 'console_set_on_cmdline' was exported
ERROR: modpost: vmlinux: local symbol 'vprintk_emit' was exported
ERROR: modpost: vmlinux: local symbol 'vprintk_default' was exported
ERROR: modpost: vmlinux: local symbol '_printk' was exported
ERROR: modpost: vmlinux: local symbol 'console_suspend_enabled' was exported
ERROR: modpost: vmlinux: local symbol 'console_verbose' was exported
ERROR: modpost: vmlinux: local symbol 'console_lock' was exported
ERROR: modpost: vmlinux: local symbol 'console_trylock' was exported
ERROR: modpost: vmlinux: local symbol 'is_console_locked' was exported
ERROR: modpost: vmlinux: local symbol 'console_unlock' was exported
ERROR: modpost: vmlinux: local symbol 'console_conditional_schedule' was exported
ERROR: modpost: vmlinux: local symbol 'console_stop' was exported
ERROR: modpost: vmlinux: local symbol 'console_start' was exported
ERROR: modpost: vmlinux: local symbol 'register_console' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_console' was exported
ERROR: modpost: vmlinux: local symbol 'console_force_preferred_locked' was exported
ERROR: modpost: vmlinux: local symbol '__printk_ratelimit' was exported
ERROR: modpost: vmlinux: local symbol 'printk_timed_ratelimit' was exported
ERROR: modpost: vmlinux: local symbol 'kmsg_dump_register' was exported
ERROR: modpost: vmlinux: local symbol 'kmsg_dump_unregister' was exported
ERROR: modpost: vmlinux: local symbol 'kmsg_dump_reason_str' was exported
ERROR: modpost: vmlinux: local symbol 'kmsg_dump_get_line' was exported
ERROR: modpost: vmlinux: local symbol 'kmsg_dump_get_buffer' was exported
ERROR: modpost: vmlinux: local symbol 'kmsg_dump_rewind' was exported
ERROR: modpost: vmlinux: local symbol 'vprintk' was exported
>> ERROR: modpost: vmlinux: local symbol 'nbcon_can_proceed' was exported
>> ERROR: modpost: vmlinux: local symbol 'nbcon_enter_unsafe' was exported
>> ERROR: modpost: vmlinux: local symbol 'nbcon_exit_unsafe' was exported
ERROR: modpost: vmlinux: local symbol 'nr_irqs' was exported
ERROR: modpost: vmlinux: local symbol 'generic_handle_irq' was exported
ERROR: modpost: vmlinux: local symbol 'generic_handle_irq_safe' was exported
ERROR: modpost: vmlinux: local symbol 'generic_handle_domain_irq' was exported
ERROR: modpost: vmlinux: local symbol 'generic_handle_domain_irq_safe' was exported
ERROR: modpost: vmlinux: local symbol 'irq_free_descs' was exported
ERROR: modpost: vmlinux: local symbol '__irq_alloc_descs' was exported
ERROR: modpost: vmlinux: local symbol 'irq_get_percpu_devid_partition' was exported
ERROR: modpost: vmlinux: local symbol '__irq_set_lockdep_class' was exported
ERROR: modpost: vmlinux: local symbol 'handle_bad_irq' was exported
ERROR: modpost: vmlinux: local symbol 'no_action' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_hardirq' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_irq' was exported
ERROR: modpost: vmlinux: local symbol 'irq_set_vcpu_affinity' was exported
ERROR: modpost: vmlinux: local symbol 'disable_irq_nosync' was exported
ERROR: modpost: vmlinux: local symbol 'disable_irq' was exported
ERROR: modpost: vmlinux: local symbol 'disable_hardirq' was exported
ERROR: modpost: vmlinux: local symbol 'enable_irq' was exported
ERROR: modpost: vmlinux: local symbol 'irq_set_irq_wake' was exported
ERROR: modpost: vmlinux: local symbol 'irq_set_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_wake_thread' was exported
ERROR: modpost: vmlinux: local symbol 'free_irq' was exported
ERROR: modpost: vmlinux: local symbol 'request_threaded_irq' was exported
ERROR: modpost: vmlinux: local symbol 'request_any_context_irq' was exported
ERROR: modpost: vmlinux: local symbol 'enable_percpu_irq' was exported
ERROR: modpost: vmlinux: local symbol 'irq_percpu_is_enabled' was exported
ERROR: modpost: vmlinux: local symbol 'disable_percpu_irq' was exported
ERROR: modpost: vmlinux: local symbol 'free_percpu_irq' was exported
ERROR: modpost: vmlinux: local symbol '__request_percpu_irq' was exported
ERROR: modpost: vmlinux: local symbol 'irq_get_irqchip_state' was exported
ERROR: modpost: vmlinux: local symbol 'irq_set_irqchip_state' was exported
ERROR: modpost: vmlinux: local symbol 'irq_has_action' was exported
ERROR: modpost: vmlinux: local symbol 'irq_check_status_bit' was exported
ERROR: modpost: vmlinux: local symbol 'irq_inject_interrupt' was exported
ERROR: modpost: vmlinux: local symbol 'irq_set_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irq_set_irq_type' was exported
ERROR: modpost: vmlinux: local symbol 'irq_set_handler_data' was exported
ERROR: modpost: vmlinux: local symbol 'irq_set_chip_data' was exported
ERROR: modpost: vmlinux: local symbol 'irq_get_irq_data' was exported
ERROR: modpost: vmlinux: local symbol 'handle_nested_irq' was exported
ERROR: modpost: vmlinux: local symbol 'handle_simple_irq' was exported
ERROR: modpost: vmlinux: local symbol 'handle_untracked_irq' was exported
ERROR: modpost: vmlinux: local symbol 'handle_level_irq' was exported
ERROR: modpost: vmlinux: local symbol 'handle_fasteoi_irq' was exported
ERROR: modpost: vmlinux: local symbol 'handle_fasteoi_nmi' was exported
ERROR: modpost: vmlinux: local symbol 'handle_edge_irq' was exported
ERROR: modpost: vmlinux: local symbol '__irq_set_handler' was exported
ERROR: modpost: vmlinux: local symbol 'irq_set_chained_handler_and_data' was exported
ERROR: modpost: vmlinux: local symbol 'irq_set_chip_and_handler_name' was exported
ERROR: modpost: vmlinux: local symbol 'irq_modify_status' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_set_parent_state' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_get_parent_state' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_enable_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_disable_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_ack_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_mask_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_mask_ack_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_unmask_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_eoi_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_set_affinity_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_set_type_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_retrigger_hierarchy' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_set_vcpu_affinity_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_set_wake_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_request_resources_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_chip_release_resources_parent' was exported
ERROR: modpost: vmlinux: local symbol 'dummy_irq_chip' was exported
ERROR: modpost: vmlinux: local symbol 'devm_request_threaded_irq' was exported
ERROR: modpost: vmlinux: local symbol 'devm_request_any_context_irq' was exported
ERROR: modpost: vmlinux: local symbol 'devm_free_irq' was exported
ERROR: modpost: vmlinux: local symbol '__devm_irq_alloc_descs' was exported
ERROR: modpost: vmlinux: local symbol 'devm_irq_alloc_generic_chip' was exported
ERROR: modpost: vmlinux: local symbol 'devm_irq_setup_generic_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_noop' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_mask_disable_reg' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_mask_set_bit' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_mask_clr_bit' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_unmask_enable_reg' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_ack_set_bit' was exported
ERROR: modpost: vmlinux: local symbol 'irq_gc_set_wake' was exported
ERROR: modpost: vmlinux: local symbol 'irq_alloc_generic_chip' was exported
ERROR: modpost: vmlinux: local symbol '__irq_alloc_domain_generic_chips' was exported
ERROR: modpost: vmlinux: local symbol 'irq_get_domain_generic_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irq_generic_chip_ops' was exported
ERROR: modpost: vmlinux: local symbol 'irq_setup_generic_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irq_setup_alt_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irq_remove_generic_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irqchip_fwnode_ops' was exported
ERROR: modpost: vmlinux: local symbol '__irq_domain_alloc_fwnode' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_free_fwnode' was exported
ERROR: modpost: vmlinux: local symbol '__irq_domain_add' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_remove' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_update_bus_token' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_create_simple' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_add_legacy' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_create_legacy' was exported
ERROR: modpost: vmlinux: local symbol 'irq_find_matching_fwspec' was exported
ERROR: modpost: vmlinux: local symbol 'irq_set_default_host' was exported
ERROR: modpost: vmlinux: local symbol 'irq_get_default_host' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_associate' was exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
