Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865776;
	b=Gmaz89PsjOARNj3VX/40oXaRxiRWVJkt0FQrKqOrcoyDI0vcJYGbeLXNTXH40R7N6V+h
	 FoH5wCBslAxObYFANGRjjJLH2wh7HsMCSLkfKy4BLhBvi174XIpQCwup2LuqW2/Ucuiio
	 teEzf91U0JM/2Bg0MfYUhKtaxm4zU12Vg2myIkrlP0AVzBllp4AylzxXV2U0BR9yzqnEB
	 kDeMX1AZVAinbR+pevKzDEM7/PhtH9rQPGbf3vHUhJECMxHPi+Piz9lo+LFKP4GDroaM5
	 7tlOpk8vUAM5TIIlyw5RbOn15bBABcyl8By1c8C1gUN6Dycn+DZS1ikOfODfE2KWgYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865776;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=69AJQgOMrGXWohfF6Hi5fkRlF5DS6S8JIO7n5eiDm70=;
	b=Rcuj12YAKGCSdRrgzLl3wdKJmoxeCYYTTQJIOLd7Z8/favGr2iFfXU5Nsjz7zcjSkm9T
	 e0hN3d0v/VUXWueBzguPOYMMApmLfamRvSxynnvCrAvspOpzifS84b68KjhvtQovDDnA8
	 fGCHu10MvN4knXi5hlVzeqByH31oaWwjgMjbVPbT+wQ0sD3x+seulSbqQZGKqgaqyp2Xh
	 7EgWd6D3qZo7STWKEBkh0u6ZLdHQ6ko1Z6iCFc0Ix2UXu5ixZSFlfVnMlbXShAPOJiO5X
	 nusGjZlM72QDYamSBloSmjikycXeI+HLi9qxKt49uvOeR771IGUIHZDzwvJHCLVgQmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iEwu2aNP;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671C6606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 21:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 671C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iEwu2aNP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794865776; x=1826401776;
  h=date:from:to:cc:subject:message-id;
  bh=BxG4fjVUC0CuajEHr4EDKvXv+NrHzVUp52GG9eYYLk8=;
  b=iEwu2aNP9EFPvnY2zkFSAX2B/9rvUFP0EskTRHTbloNjMox6OFujkO+2
   SqVSF3WHZAmVFJVK+bsEyDFa/xUNXObrvlPMN705wbbIyXq49LDV8AIL5
   KU4HxH46h1DTfECkD9OeYMo6MUWvfVC2ommSX1XGnhEOOlW2qLs/olMYP
   MHbl1h9XmBlQbInTvvEi7h7BHI6FL02LgwGYmyGR0nhvFDl6jI1iTLMlU
   UHS1SzliyZKG/i+ZXQp7IPJcOSHbGO+X30wvie6yBUNv9BTRUPdDOL7Fn
   lhPIHecDDR4xWTQDFJf2wrwumftIajnn8fU+SlV27DHEheInNlHX612Gl
   w==;
X-CSE-ConnectionGUID: V9nNYh73QLG7jjDluMf6Gg==
X-CSE-MsgGUID: pzJH69PUQoSarfptMOgrLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3516198"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3516198"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:49:35 -0800
X-CSE-ConnectionGUID: /YUy1AJWS6uVJK/Xj5bALA==
X-CSE-MsgGUID: bWCvXLRhSgi8na8I1HQo5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="11385246"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 16 Nov 2026 13:49:34 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT4Zv-000000002of-1Gvk;
	Mon, 16 Nov 2026 21:49:31 +0000
Date: Mon, 16 Nov 2026 22:48:40 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:bpf-waitq 4/14] WARNING: modpost: vmlinux:
 section mismatch in reference: vhost_net_ioctl+0x8e4 (section: .text) ->
 page_idle_init (section: .init.text)
Message-ID: <202611162234.6vGWpzsc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux bpf-waitq
head:   de6f7786c799ac1c046280f313a105aae840d748
commit: aeff3fa85628e5a98b5bb07596dd9cba4c30f31a [4/14] bpf: Propagate bpf_task_park() through global functions
config: loongarch-randconfig-2200-20261115 (https://download.01.org/0day-ci/archive/20261116/202611162234.6vGWpzsc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611162234.6vGWpzsc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611162234.6vGWpzsc-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: btintel_get_codec_config_data+0xa0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: regmap_ibt_gather_write+0xb0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btintel_regmap_init+0x54 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btintel_pcie_dump_entry_alloc+0xc (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btintel_pcie_setup_rxq_bufs+0x10 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btintel_pcie_hci_drv_read_info+0x10 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btintel_parse_mbox_tlv.isra.0+0x344 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btintel_pcie_probe+0xc8 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btintel_pcie_alloc_sgtable+0x24 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btintel_pcie_fwtrigger_worker+0x64 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btintel_pcie_read_hwexp+0x134 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btintel_pcie_get_recovery.isra.0+0x90 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btmrvl_add_card+0x20 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btmrvl_debugfs_init+0x24 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btbcm_initialize+0x448 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btmtk_usb_submit_wmt_recv_urb+0x50 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btmtk_submit_intr_urb+0x68 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btmtk_usb_uhw_reg_write+0x18 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btmtk_usb_hci_wmt_sync+0x34 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _opp_set_clknames+0xb0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _opp_set_regulators+0x90 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_pm_opp_remove+0x140 (section: .text) -> .Lpcadd_hi66 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_pm_opp_remove+0x148 (section: .text) -> .Lpcadd_hi67 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_pm_opp_remove+0x16c (section: .text) -> .Lpcadd_hi68 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_pm_opp_remove+0x204 (section: .text) -> .Lpcadd_hi69 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_pm_opp_get_max_volt_latency+0xd0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _add_opp_dev+0x14 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _allocate_opp_table+0x1c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_pm_opp_set_config+0x1c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _opp_allocate+0x30 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_pm_opp_init_cpufreq_table+0x80 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _read_bw+0xa4 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _read_rate+0x80 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _parse_named_prop+0x1e0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _opp_table_alloc_required_tables+0x8c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_pm_opp_of_find_icc_paths+0x1c0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _opp_add_static_v2+0x340 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpufreq_policy_alloc+0x2c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpufreq_stats_create_table+0x58 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpufreq_stats_create_table+0xb0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpufreq_stats_create_table+0xd0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpufreq_stats_create_table+0xfc (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: od_init+0xc (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: od_alloc+0x0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpufreq_dbs_governor_init+0x164 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: memstick_alloc_host+0x10 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: memstick_check+0xc4 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: msb_ftl_initialize+0xb0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: msb_init_disk+0x160 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: msb_ftl_scan+0x18 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: msb_read_bad_block_table+0x100 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: msb_init_card+0x144 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: msb_init_card+0x33c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: msb_resume+0x2c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: msb_probe+0x14 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: jmb38x_ms_probe+0xec (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fw_cfg_write_vmcoreinfo+0x20 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fw_cfg_build_symlink.isra.0+0x5c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fw_cfg_register_file+0x60 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fw_cfg_register_dir_entries+0x48 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: efi_mem_desc_lookup+0x68 (section: .text) -> setup_slub_min_order (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: efi_mem_desc_lookup+0x78 (section: .text) -> setup_slub_max_order (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: efi_mem_reserve_iomem+0x10 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: efi_capsule_update+0x74 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: efi_capsule_update+0x130 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: efi_call_rts+0x30 (section: .text) -> .LBB308 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: efi_runtime_query_capsulecaps+0x150 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: efi_runtime_get_variable+0x250 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: efi_capsule_open+0x20 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efi_capsule_setup_info+0xa8 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: efi_capsule_write+0x3c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fwctl_fops_open+0x34 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fwctl_cmd_rpc+0xe8 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _fwctl_alloc_device+0x18 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_kbd_probe+0xe0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_kbd_probe+0x1e4 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_mouse_probe+0xd8 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: of_request_module+0x2c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: of_device_alloc+0xa0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: of_changeset_action+0x58 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __of_prop_dup+0x1c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: of_changeset_add_prop_string_array+0x90 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: of_changeset_add_prop_u32_array+0x1c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __of_node_dup+0x1c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_tree_alloc+0x0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: of_dma_get_range+0x140 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: of_reserved_mem_device_init_by_idx+0x10c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ssb_devices_register+0x54 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ssb_attr_sprom_show+0x24 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ssb_attr_sprom_store+0x2c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ssb_pci_sprom_get+0x98 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ssb_pcihost_probe+0x14 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ssb_pcmcia_init+0x70 (section: .text) -> gup_test_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ssb_pcmcia_init+0x74 (section: .text) -> .LVL0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ssb_host_pcmcia_probe+0x18 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bcma_bus_scan+0xe8 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bcma_sprom_get+0x348 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_net_open+0x1c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_net_set_backend+0x280 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_net_ioctl+0x8a8 (section: .text) -> .LBB303 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: vhost_net_ioctl+0x8e4 (section: .text) -> page_idle_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_net_ioctl+0x8f4 (section: .text) -> .LVL110 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_net_ioctl+0x900 (section: .text) -> .LVL114 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_net_ioctl+0x914 (section: .text) -> page_idle_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_net_ioctl+0x958 (section: .text) -> .LVL109 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_copy_cmd_log+0x40 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_open+0x18 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_send_evt+0x4c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_tpg_nexus_store+0x2c0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_copy_iov_to_sgl.isra.0+0x3c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_copy_iov_to_sgl.isra.0+0xfc (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_make_tport+0x18 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_handle_tmf+0x68 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_handle_tmf+0x260 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_make_tpg+0x60 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_handle_vq+0x750 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_setup_vq_cmds+0x90 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_scsi_set_endpoint+0xa0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_vdpa_pa_map+0x1c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_vdpa_probe+0x50 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_vdpa_open+0x90 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_vdpa_va_map+0x138 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_vdpa_process_iotlb_msg+0x110 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_vdpa_get_config+0x130 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_dev_alloc_iovecs+0x78 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_worker_create+0x30 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_new_msg+0x10 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_set_memory+0x11c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_iotlb_alloc+0x10 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vhost_iotlb_add_range_ctx+0x1a0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_hd_create+0x110 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_string_get+0x1e8 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: identify_descriptor+0x1b0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_manifest_parse_cports+0x1d0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_module_create+0x50 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_interface_create+0x18 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_interface_enable+0x1a8 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_bundle_create+0xe0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _gb_connection_create+0xe4 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_control_create+0x14 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_svc_queue_deferred_request+0x14 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_svc_pwrmon_debugfs_init+0xb0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_svc_create+0x1c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_watchdog_pm_notifier+0x38 (section: .text) -> .LBE524 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_svc_watchdog_create+0x1c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_svc_watchdog_destroy+0x38 (section: .text) -> .LBE524 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_svc_watchdog_disable+0x1c (section: .text) -> .LBE524 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_operation_message_alloc+0x58 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_operation_create_common+0x28 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: output_sync+0x14 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: apb_log_poll+0x14 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: apb_log_read+0x40 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: output_async+0x68 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cport_enable+0x14 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ap_probe+0x24 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: arpc_alloc+0x34 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: parse_wdg+0xec (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wmi_marshal_string+0x4c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wmi_unmarshal_acpi_object+0x88 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_stop+0x90 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_reset_rsc_table_on_detach+0x4c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_of_resm_mem_entry_init+0x24 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_mem_entry_init+0x18 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_alloc+0x34 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_handle_devmem+0xc4 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_handle_trace+0xa4 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_alloc_carveout+0xb0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_coredump_using_sections+0xf8 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_coredump_add_custom_segment+0x14 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_coredump_add_segment+0x14 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_coredump+0xf0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_add_virtio_dev+0x180 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_elf_load_rsc_table+0x70 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsm_register+0x18 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_tsm_dev+0x24 (section: .text) -> .Lpcadd_hi13 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_monitor_stop+0x80 (section: .text) -> .LBE524 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_monitor_suspend+0x80 (section: .text) -> .LBE524 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_update_interval+0x8c (section: .text) -> .LBE524 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_update_interval+0xf4 (section: .text) -> .LBE524 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_add_device+0x1a8 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_userspace_handler+0x20 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_target_freq_by_required_opp+0xa8 (section: .text) -> .LVL56 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpufreq_passive_register_notifier+0xb4 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: extcon_sync+0xa8 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: extcon_alloc_cables+0x50 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: extcon_alloc_muex+0x80 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: extcon_dev_register+0x1f0 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: extcon_dev_register+0x340 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: extcon_dev_allocate+0x10 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devm_extcon_dev_allocate+0x44 (section: .text) -> .LBB3132 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devm_delayed_work_drop+0x0 (section: .text) -> .LBE524 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devm_delayed_work_drop+0x0 (section: .text) -> .LBE524 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_extcon_remove+0x18 (section: .text) -> .LBE524 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: idt_dbgfs_info_read+0x40 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: switchtec_ntb_add+0x2c (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tool_peer_mw_write+0x98 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tool_peer_mw_read+0x98 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tool_peer_mw_trans_read+0x70 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tool_mw_trans_read+0x50 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_init_test+0x14 (section: .text) -> .LBB303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_dbgfs_read_run+0x20 (section: .text) -> .LBB303 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
