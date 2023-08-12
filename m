Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C8210EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 01:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691804642; x=1723340642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NfxhoXaPnM2VYKUu/X759PaTw0Ut/fvH3cDhTXpGIyw=;
  b=BCe2k90pibXRmy8git8Zxr48aSN7DY1sOfYfnuOVjm61/IPIg4vcbtfk
   ohkU7U7mTJ1L/VEM7PIO8VU6abYH81UzFTyUqpZOtEXq9u+b7KD+bEfY6
   wlc7xhsezQQcNiGfWKb++T/vpNWR2FenQ6sekhD+dSIiJMxhlJjuHclRR
   sorAblqIjVVU5MUU30kgrsMsqs/Fr2vqnQYicYFJQjUPkN+D7D7MiI+Ha
   B7RVrpx8Ik/1/KUM61zXUrqi5xD8rd8DIlcmGukJ0gbqlrRRaJ3xbw9gY
   WOZ4hVbvROQWecySGWl0HvbENo9brSLlcnTTRmJLTkEyq6e+BdVfE2hF9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369264762"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="369264762"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 18:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="767845467"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="767845467"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Aug 2023 18:43:57 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUdfZ-0008BS-0P;
	Sat, 12 Aug 2023 01:43:57 +0000
Date: Sat, 12 Aug 2023 09:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1926/8441] ERROR: modpost: vmlinux: local symbol
 'get_rcu_tasks_trace_gp_kthread' was exported
Message-ID: <202308120923.gCBrnIht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 5f8e3202696f5e94d3fc54cfed75d270ae843ee9 [1926/8441] rcuscale: Measure grace-period kthread CPU time
config: riscv-randconfig-r042-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120923.gCBrnIht-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120923.gCBrnIht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120923.gCBrnIht-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

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
ERROR: modpost: vmlinux: local symbol 'irq_domain_associate_many' was exported
ERROR: modpost: vmlinux: local symbol 'irq_create_mapping_affinity' was exported
ERROR: modpost: vmlinux: local symbol 'of_phandle_args_to_fwspec' was exported
ERROR: modpost: vmlinux: local symbol 'irq_create_fwspec_mapping' was exported
ERROR: modpost: vmlinux: local symbol 'irq_create_of_mapping' was exported
ERROR: modpost: vmlinux: local symbol 'irq_dispose_mapping' was exported
ERROR: modpost: vmlinux: local symbol '__irq_resolve_mapping' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_xlate_onecell' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_xlate_twocell' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_xlate_onetwocell' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_simple_ops' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_translate_onecell' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_translate_twocell' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_reset_irq_data' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_create_hierarchy' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_disconnect_hierarchy' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_get_irq_data' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_set_hwirq_and_chip' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_set_info' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_free_irqs_common' was exported
ERROR: modpost: vmlinux: local symbol '__irq_domain_alloc_irqs' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_push_irq' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_pop_irq' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_alloc_irqs_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_free_irqs_parent' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_create_sim' was exported
ERROR: modpost: vmlinux: local symbol 'irq_domain_remove_sim' was exported
ERROR: modpost: vmlinux: local symbol 'devm_irq_domain_create_sim' was exported
ERROR: modpost: vmlinux: local symbol 'get_cached_msi_msg' was exported
ERROR: modpost: vmlinux: local symbol 'msi_lock_descs' was exported
ERROR: modpost: vmlinux: local symbol 'msi_unlock_descs' was exported
ERROR: modpost: vmlinux: local symbol 'msi_domain_first_desc' was exported
ERROR: modpost: vmlinux: local symbol 'msi_next_desc' was exported
ERROR: modpost: vmlinux: local symbol 'msi_domain_get_virq' was exported
ERROR: modpost: vmlinux: local symbol 'msi_device_has_isolated_msi' was exported
ERROR: modpost: vmlinux: local symbol 'ipi_get_hwirq' was exported
ERROR: modpost: vmlinux: local symbol 'ipi_send_single' was exported
ERROR: modpost: vmlinux: local symbol 'ipi_send_mask' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_read_lock_sched_held' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_gp_is_normal' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_async_should_hurry' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_async_hurry' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_async_relax' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_gp_is_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_expedite_gp' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_unexpedite_gp' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_inkernel_boot_has_ended' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_lock_map' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_bh_lock_map' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_sched_lock_map' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_callback_map' was exported
ERROR: modpost: vmlinux: local symbol 'debug_lockdep_rcu_enabled' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_read_lock_held' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_read_lock_bh_held' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_read_lock_any_held' was exported
ERROR: modpost: vmlinux: local symbol 'wakeme_after_rcu' was exported
ERROR: modpost: vmlinux: local symbol '__wait_rcu_gp' was exported
ERROR: modpost: vmlinux: local symbol 'finish_rcuwait' was exported
ERROR: modpost: vmlinux: local symbol 'do_trace_rcu_torture_read' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_cpu_stall_suppress' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_cpu_stall_suppress_at_boot' was exported
ERROR: modpost: vmlinux: local symbol 'get_completed_synchronize_rcu' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_trace_lock_map' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_trc_cmpxchg_need_qs' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_read_unlock_trace_special' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_tasks_trace_qs_blkd' was exported
ERROR: modpost: vmlinux: local symbol 'call_rcu_tasks_trace' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_rcu_tasks_trace' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_barrier_tasks_trace' was exported
ERROR: modpost: vmlinux: local symbol 'show_rcu_tasks_trace_gp_kthread' was exported
>> ERROR: modpost: vmlinux: local symbol 'get_rcu_tasks_trace_gp_kthread' was exported
ERROR: modpost: vmlinux: local symbol '__init_srcu_struct' was exported
ERROR: modpost: vmlinux: local symbol 'cleanup_srcu_struct' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_check_nmi_safety' was exported
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
ERROR: modpost: vmlinux: local symbol 'rcu_lockdep_current_cpu_online' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_exp_jiffies_till_stall_check' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_jiffies_till_stall_check' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_check_boost_fail' was exported
ERROR: modpost: vmlinux: local symbol 'show_rcu_gp_kthreads' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_fwd_progress_check' was exported
ERROR: modpost: vmlinux: local symbol 'synchronize_rcu_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'start_poll_synchronize_rcu_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'start_poll_synchronize_rcu_expedited_full' was exported
ERROR: modpost: vmlinux: local symbol 'cond_synchronize_rcu_expedited' was exported
ERROR: modpost: vmlinux: local symbol 'cond_synchronize_rcu_expedited_full' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_read_unlock_strict' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_all_qs' was exported
ERROR: modpost: vmlinux: local symbol 'rcu_note_context_switch' was exported
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
ERROR: modpost: vmlinux: local symbol 'dma_max_mapping_size' was exported
ERROR: modpost: vmlinux: local symbol 'dma_opt_mapping_size' was exported
ERROR: modpost: vmlinux: local symbol 'dma_need_sync' was exported
ERROR: modpost: vmlinux: local symbol 'dma_get_merge_boundary' was exported
ERROR: modpost: vmlinux: local symbol 'register_module_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_module_notifier' was exported
ERROR: modpost: vmlinux: local symbol '__module_put_and_kthread_exit' was exported
ERROR: modpost: vmlinux: local symbol '__tracepoint_module_get' was exported
ERROR: modpost: vmlinux: local symbol '__traceiter_module_get' was exported
ERROR: modpost: vmlinux: local symbol '__SCK__tp_func_module_get' was exported
ERROR: modpost: vmlinux: local symbol 'module_refcount' was exported
ERROR: modpost: vmlinux: local symbol '__symbol_put' was exported
ERROR: modpost: vmlinux: local symbol 'symbol_put_addr' was exported
ERROR: modpost: vmlinux: local symbol '__module_get' was exported
ERROR: modpost: vmlinux: local symbol 'try_module_get' was exported
ERROR: modpost: vmlinux: local symbol 'module_put' was exported
ERROR: modpost: vmlinux: local symbol '__symbol_get' was exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
