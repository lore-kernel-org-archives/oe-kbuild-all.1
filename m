Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168C01D6AA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769955357; cv=none; b=huremZ2dqDvY8qHSMUClb8OVtBF+pvsPdkXM2p0pgbGGj0X214bmmpc7Pl2BC1maNhZWQlQVmcZeDfwXmVqIK5LfYGkV86AaVjLH4V1kvEG9ZRz0ZpeiOFWMMliTxGHBdsRcmvhJoow5FOViYZooVEE/FbtkHdet59+DbLjWqWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769955357; c=relaxed/simple;
	bh=yoOWkfHdMcCbjW/2U+tJ4O5aXl3gK0mb3lOM8HpgKwk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YZygmGCp00YY4IeVuLWKcrz/S/Th817XEVzu60LChGC+XKekYvbUoEroZzctHsEJvcJMj7l5HFLXCJh0DWt1eN1RhiN+9/aZS4ldgxQOJe3g0rrDTmTjG97y2Fl068+XJEMlwmtduvqFOvwq2M0I8ixxmbBfHb+JQj65Pqdi358=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DohbejyD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DohbejyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769955355; x=1801491355;
  h=date:from:to:cc:subject:message-id;
  bh=yoOWkfHdMcCbjW/2U+tJ4O5aXl3gK0mb3lOM8HpgKwk=;
  b=DohbejyD1bzWxoAQ9+Obz+30pXB2FFPD+Oh2zCxYuU10oHzePAw3w+AW
   PTEXsvEqd6Qjf0la3ohUE82Nu17MtURz2QpDPtx4olnjJlPvND3klWIT+
   4s/MYcCA+mjiwpNzzKXY/QjjkyIJO7BfNyFGZ9QWdbu7fmW7c8Sub1KrG
   V+7k0GFyXxMkgbm/cmpn9iwijwChBeGeI+8oQOYbclGQ7Atd1DRwaiytr
   xGrgcHQukZA5+PJelmM/U15ZWUBl9TIBhR8dMXgu3UlPxI748hngO6BBZ
   xH+gkD4OH9k0mFBwK+SE/ObNRIpr/SHj9nR95qnahZXAWcLjiX/T87WWa
   w==;
X-CSE-ConnectionGUID: lCxf51+eTlOpYkCw8pd+Kg==
X-CSE-MsgGUID: 6/p7d9xnTnq7G232VUahmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="82243541"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="82243541"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 06:15:54 -0800
X-CSE-ConnectionGUID: 5zPHCfgBSiyBE8AL2qlQlQ==
X-CSE-MsgGUID: zTMr/IS0RHq4S/NtBavHrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209263989"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Feb 2026 06:15:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmYEw-00000000enU-1oLb;
	Sun, 01 Feb 2026 14:15:50 +0000
Date: Sun, 01 Feb 2026 22:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 8/21] vmlinux.o: warning: objtool:
 kvm_device_mmap+0x17: no-cfi indirect call!
Message-ID: <202602012228.zsn75WO7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   d6e2bc7b4238d6041b82e9414254860f4d890164
commit: 97e1889365cf61110c72c1d25695e378089c9343 [8/21] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-103-20260201 (https://download.01.org/0day-ci/archive/20260201/202602012228.zsn75WO7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602012228.zsn75WO7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602012228.zsn75WO7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: perf_check_microcode+0x13: no-cfi indirect call!
   vmlinux.o: warning: objtool: x86_pmu_aux_output_match+0x1c: no-cfi indirect call!
>> vmlinux.o: warning: objtool: kvm_device_mmap+0x17: no-cfi indirect call!
   vmlinux.o: warning: objtool: acpi_unregister_gsi+0x13: no-cfi indirect call!
>> vmlinux.o: warning: objtool: arch_cpuhp_sync_state_poll+0x13: no-cfi indirect call!
>> vmlinux.o: warning: objtool: irq_chip_get_parent_state+0x20: no-cfi indirect call!
>> vmlinux.o: warning: objtool: irq_chip_startup_parent+0x18: no-cfi indirect call!
>> vmlinux.o: warning: objtool: irq_chip_set_type_parent+0x18: no-cfi indirect call!
>> vmlinux.o: warning: objtool: irq_chip_retrigger_hierarchy+0x1b: no-cfi indirect call!
>> vmlinux.o: warning: objtool: irq_chip_set_vcpu_affinity_parent+0x1b: no-cfi indirect call!
>> vmlinux.o: warning: objtool: irq_chip_request_resources_parent+0x1b: no-cfi indirect call!
>> vmlinux.o: warning: objtool: irq_domain_alloc_irqs_parent+0x20: no-cfi indirect call!
>> vmlinux.o: warning: objtool: msi_parent_init_dev_msi_info+0x28: no-cfi indirect call!
>> vmlinux.o: warning: objtool: msi_domain_translate+0x18: no-cfi indirect call!
>> vmlinux.o: warning: objtool: clockevents_tick_resume+0x10: no-cfi indirect call!
>> vmlinux.o: warning: objtool: bpf_map_poll+0x21: no-cfi indirect call!
>> vmlinux.o: warning: objtool: special_mapping_close+0x1a: no-cfi indirect call!
>> vmlinux.o: warning: objtool: special_mapping_mremap+0x32: no-cfi indirect call!
>> vmlinux.o: warning: objtool: vma_kernel_pagesize+0x19: no-cfi indirect call!
>> vmlinux.o: warning: objtool: vma_mmu_pagesize+0x19: no-cfi indirect call!
>> vmlinux.o: warning: objtool: vfs_fsync_range+0x1e: no-cfi indirect call!
>> vmlinux.o: warning: objtool: fscrypt_get_dummy_policy+0x17: no-cfi indirect call!
>> vmlinux.o: warning: objtool: nfs3_commit_done+0x13: no-cfi indirect call!
   vmlinux.o: warning: objtool: pin_config_get_for_pin+0x1d: no-cfi indirect call!
   vmlinux.o: warning: objtool: of_gpiochip_instance_match+0x13: no-cfi indirect call!
   vmlinux.o: warning: objtool: led_set_brightness_sync+0x41: no-cfi indirect call!
   vmlinux.o: warning: objtool: pci_pm_runtime_idle+0x2f: no-cfi indirect call!
   vmlinux.o: warning: objtool: virtio_vdpa_generation+0x1e: no-cfi indirect call!
   vmlinux.o: warning: objtool: tty_get_tiocm+0x17: no-cfi indirect call!
   vmlinux.o: warning: objtool: tty_get_icount+0x66: no-cfi indirect call!
   vmlinux.o: warning: objtool: tty_chars_in_buffer+0x1a: no-cfi indirect call!
   vmlinux.o: warning: objtool: tty_write_room+0x1a: no-cfi indirect call!
   vmlinux.o: warning: objtool: tty_ldisc_receive_buf+0x17: no-cfi indirect call!
   vmlinux.o: warning: objtool: tty_port_carrier_raised+0x17: no-cfi indirect call!
   vmlinux.o: warning: objtool: device_iommu_capable+0x2b: no-cfi indirect call!
   vmlinux.o: warning: objtool: iommu_sync_map+0x14: no-cfi indirect call!
   vmlinux.o: warning: objtool: iommu_set_pgtable_quirks+0x19: no-cfi indirect call!
   vmlinux.o: warning: objtool: device_namespace+0x1c: no-cfi indirect call!
   vmlinux.o: warning: objtool: dev_attr_store+0x10: no-cfi indirect call!
   vmlinux.o: warning: objtool: container_offline+0x13: no-cfi indirect call!
   vmlinux.o: warning: objtool: fwnode_get_name+0x30: no-cfi indirect call!
   vmlinux.o: warning: objtool: fwnode_get_name_prefix+0x2d: no-cfi indirect call!
   vmlinux.o: warning: objtool: fwnode_get_parent+0x2c: no-cfi indirect call!
   vmlinux.o: warning: objtool: fwnode_handle_get+0x2d: no-cfi indirect call!
   vmlinux.o: warning: objtool: fwnode_get_next_child_node+0x2d: no-cfi indirect call!
   vmlinux.o: warning: objtool: fwnode_get_named_child_node+0x2d: no-cfi indirect call!
   vmlinux.o: warning: objtool: device_get_named_child_node+0x49: no-cfi indirect call!
   vmlinux.o: warning: objtool: fwnode_iomap+0x2d: no-cfi indirect call!
   vmlinux.o: warning: objtool: fwnode_graph_get_remote_endpoint+0x2d: no-cfi indirect call!
   vmlinux.o: warning: objtool: pm_generic_runtime_suspend+0x22: no-cfi indirect call!
   vmlinux.o: warning: objtool: pm_generic_runtime_resume+0x22: no-cfi indirect call!
   vmlinux.o: warning: objtool: dev_pm_domain_start+0x1f: no-cfi indirect call!
   vmlinux.o: warning: objtool: dev_pm_domain_set_performance_state+0x1f: no-cfi indirect call!
   vmlinux.o: warning: objtool: dax_recovery_write+0x17: no-cfi indirect call!
   vmlinux.o: warning: objtool: dma_buf_stats_attribute_show+0x19: no-cfi indirect call!
   vmlinux.o: warning: objtool: __phy_hwtstamp_get+0x26: no-cfi indirect call!
   vmlinux.o: warning: objtool: __phy_hwtstamp_set+0x26: no-cfi indirect call!
   vmlinux.o: warning: objtool: phy_inband_caps+0x1f: no-cfi indirect call!
   vmlinux.o: warning: objtool: phy_disable_interrupts+0x21: no-cfi indirect call!
   vmlinux.o: warning: objtool: gswip_phylink_mac_select_pcs+0x1f: no-cfi indirect call!
   vmlinux.o: warning: objtool: ksz_port_vlan_add+0x1e: no-cfi indirect call!
   vmlinux.o: warning: objtool: ksz_port_mdb_del+0x1e: no-cfi indirect call!
   vmlinux.o: warning: objtool: ksz_port_fdb_dump+0x1b: no-cfi indirect call!
   vmlinux.o: warning: objtool: ksz_port_vlan_del+0x1b: no-cfi indirect call!
   vmlinux.o: warning: objtool: ksz_change_mtu+0x1e: no-cfi indirect call!
   vmlinux.o: warning: objtool: ksz_port_mdb_add+0x1a: no-cfi indirect call!
   vmlinux.o: warning: objtool: ksz_set_ageing_time+0x1e: no-cfi indirect call!
   vmlinux.o: warning: objtool: stmmac_reset+0x26: no-cfi indirect call!
   vmlinux.o: warning: objtool: i2c_dw_clk_rate+0x13: no-cfi indirect call!
   vmlinux.o: warning: objtool: cec_error_inj_show+0x2a: no-cfi indirect call!
   vmlinux.o: warning: objtool: power_supply_set_property_direct+0x1c: no-cfi indirect call!
   vmlinux.o: warning: objtool: show_scaling_setspeed+0x19: no-cfi indirect call!
   vmlinux.o: warning: objtool: mmc_sd_get_ro+0x22: no-cfi indirect call!
   vmlinux.o: warning: objtool: ssb_fill_sprom_with_fallback+0x13: no-cfi indirect call!
   vmlinux.o: warning: objtool: gb_hd_cport_allocate+0x17: no-cfi indirect call!
   vmlinux.o: warning: objtool: mbox_chan_received_data+0x14: no-cfi indirect call!
   vmlinux.o: warning: objtool: mbox_client_peek_data+0x17: no-cfi indirect call!
   vmlinux.o: warning: objtool: hwspin_lock_bust+0x1c: no-cfi indirect call!
   vmlinux.o: warning: objtool: rpmsg_create_channel+0x21: no-cfi indirect call!
   vmlinux.o: warning: objtool: rpmsg_release_channel+0x21: no-cfi indirect call!
   vmlinux.o: warning: objtool: rpmsg_send+0x1c: no-cfi indirect call!
   vmlinux.o: warning: objtool: rpmsg_sendto+0x1c: no-cfi indirect call!
   vmlinux.o: warning: objtool: rpmsg_trysend+0x1b: no-cfi indirect call!
   vmlinux.o: warning: objtool: rpmsg_trysendto+0x1c: no-cfi indirect call!
   vmlinux.o: warning: objtool: rpmsg_poll+0x1c: no-cfi indirect call!
   vmlinux.o: warning: objtool: rpmsg_get_mtu+0x1c: no-cfi indirect call!
   vmlinux.o: warning: objtool: nvmem_layout_bus_probe+0x21: no-cfi indirect call!
   vmlinux.o: warning: objtool: sock_bind_add+0x17: no-cfi indirect call!
   vmlinux.o: warning: objtool: dev_get_iflink+0x1c: no-cfi indirect call!
   vmlinux.o: warning: objtool: __netif_set_mtu+0x17: no-cfi indirect call!
   vmlinux.o: warning: objtool: dev_get_phys_port_id+0x17: no-cfi indirect call!
   vmlinux.o: warning: objtool: inet_bind_sk+0x14: no-cfi indirect call!
   vmlinux.o: warning: objtool: inet_bind+0x18: no-cfi indirect call!
   vmlinux.o: warning: objtool: dsa_user_get_eeprom_len+0x38: no-cfi indirect call!
   vmlinux.o: warning: objtool: dsa_user_get_eeprom+0x22: no-cfi indirect call!
   vmlinux.o: warning: objtool: dsa_user_set_eeprom+0x22: no-cfi indirect call!
   vmlinux.o: warning: objtool: rpcauth_stringify_acceptor+0x14: no-cfi indirect call!
   vmlinux.o: warning: objtool: rpcauth_xmit_need_reencode+0x27: no-cfi indirect call!
   vmlinux.o: warning: objtool: svc_auth_flavor+0x17: no-cfi indirect call!
   vmlinux.o: warning: objtool: pcibios_disable_device+0x13: no-cfi indirect call!
   vmlinux.o: warning: objtool: kobj_ns_ops+0x1d: no-cfi indirect call!
   vmlinux.o: warning: objtool: kobj_attr_show+0xb: no-cfi indirect call!
   vmlinux.o: warning: objtool: kobj_attr_store+0xb: no-cfi indirect call!
   vmlinux.o: warning: objtool: kobj_child_ns_ops+0x19: no-cfi indirect call!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
