Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC38213C8E8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 13:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754572601; cv=none; b=NuWW0AWOoWaTVChkhkvJGXbla/dzNjhXISt0oT8OGbc+i/bwQTF8hD4SpI3ARZe0Vh6cwdbtfBQXxPhtOay1l02XfcpGQtwbxg81NRQdlgIVJSGRbZUBXrXOv9uGAgdS50SopHpJFntHmw26kyv4172cLIMbTo86/po5hYrx8bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754572601; c=relaxed/simple;
	bh=/rM2QjrfHEHCdhvtnm71tWzswzdnzot8Q9yRHzxuxNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O8f3sQHyXP+07KgrhLYoiUVFDBfdha369AeRR7ve+Y3yTSdY50YSAY116bqqgCwxucTJwL+5kLWQ4yUAgFM0h2Shng/B0gr65tGLsDdXCHzBOpsCQoCSngIDWNXhVe6L6iRYnkhwPHWhdKA9/vf6AjBQL4a6+sI/Zd7IqTHBnXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSkPMfQI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSkPMfQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754572599; x=1786108599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/rM2QjrfHEHCdhvtnm71tWzswzdnzot8Q9yRHzxuxNA=;
  b=nSkPMfQIftO6VmP5zfpkZ6ZtoLoD376K0tEabo49AR/nPMeQra8l6c7w
   ICKJmCveCKG0kwKa1kFf4IYrff5ICd0U3wj9M6A4Njy0SnVdz2DiRPMqk
   0suYKNo9/6WYyLiRGX3JsRBMp9h7Vx+z9Rv8s4vpP/do67uti+N7WW4ML
   ED4+fhEnXs51XIQYq66wLfZYKWFbedZqZP3QZuvDJoarvmlUL+N0VtyO2
   l1cu/Sr1/Oj+vyOM/kupfYMviMkXhHdJ+4/rjuehKhl+WMD7VIUa0WXaL
   Vp3owCPPNh43lChYOntGtQUPkl4aNrdZ6VRkLZBuDMQJ3TEXNmrGCqbni
   w==;
X-CSE-ConnectionGUID: 4OpsllTzTyijQMu1Rd8+Dw==
X-CSE-MsgGUID: ndq7KX2TT9CgnKsuZi+RlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="59521684"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="59521684"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 06:16:26 -0700
X-CSE-ConnectionGUID: gN1KAT7uR1SUH5tA8uZTiw==
X-CSE-MsgGUID: 3s7hDuiAQ9O/xXuEFuCYsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169310429"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2025 06:16:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk0Tl-0002om-34;
	Thu, 07 Aug 2025 13:16:21 +0000
Date: Thu, 7 Aug 2025 21:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 13556/13560] ERROR: modpost: __ex_table+0x153c
 references non-executable section '.data.rel.local.f2fs_attr_sb_compression'
Message-ID: <202508072107.qZvP2rOb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   442d93313caebc8ccd6d53f4572c50732a95bc48
commit: ea582fc8d915dcf430a5e277d4b0f2e911cb083c [13556/13560] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072107.qZvP2rOb-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072107.qZvP2rOb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508072107.qZvP2rOb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x152 (section: .text.find_cpio_data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x178 (section: .text.find_cpio_data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x17c (section: .text.find_cpio_data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x180 (section: .text.find_cpio_data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x18c (section: .text.find_cpio_data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x198 (section: .text.find_cpio_data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x19c (section: .text.find_cpio_data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x1a6 (section: .text.find_cpio_data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x1ce (section: .text.find_cpio_data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x1d4 (section: .text.find_cpio_data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_cpio_data+0x208 (section: .text.find_cpio_data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fdt_create+0xa (section: .text.fdt_create) -> tps65218_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fprop_new_period+0x80 (section: .text.fprop_new_period) -> tps6594_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: fprop_new_period+0xc8 (section: .text.fprop_new_period) -> tps6594_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: fprop_new_period+0x10a (section: .text.fprop_new_period) -> tps6594_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: fprop_new_period+0x154 (section: .text.fprop_new_period) -> tps6594_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_find_first_range+0x86 (section: .text.ida_find_first_range) -> c2port_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_find_first_range+0x90 (section: .text.ida_find_first_range) -> hmc6352_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_find_first_range+0x9a (section: .text.ida_find_first_range) -> c2port_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_find_first_range+0xa4 (section: .text.ida_find_first_range) -> hmc6352_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x37e (section: .text.ida_alloc_range) -> hmc6352_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x384 (section: .text.ida_alloc_range) -> hmc6352_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_destroy+0x5e (section: .text.ida_destroy) -> c2port_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_destroy+0x62 (section: .text.ida_destroy) -> hmc6352_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_destroy+0x14c (section: .text.ida_destroy) -> c2port_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_destroy+0x180 (section: .text.ida_destroy) -> c2port_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_register_range+0xf8 (section: .text.logic_pio_register_range) -> uacce_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_register_range+0x100 (section: .text.logic_pio_register_range) -> lis3lv02d_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_ma_write+0xcc (section: .text.trace_ma_write) -> tps6594_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_ma_op+0xbc (section: .text.trace_ma_op) -> tps6594_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_ma_read.constprop.72+0xbc (section: .text.trace_ma_read.constprop.72) -> tps6594_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: radix_tree_next_chunk+0x4e (section: .text.radix_tree_next_chunk) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: radix_tree_next_chunk+0x64 (section: .text.radix_tree_next_chunk) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: radix_tree_next_chunk+0x66 (section: .text.radix_tree_next_chunk) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: radix_tree_next_chunk+0x8a (section: .text.radix_tree_next_chunk) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: radix_tree_next_chunk+0x92 (section: .text.radix_tree_next_chunk) -> pm805_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: radix_tree_next_chunk+0x98 (section: .text.radix_tree_next_chunk) -> pm805_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: radix_tree_next_chunk+0x1ec (section: .text.radix_tree_next_chunk) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: radix_tree_next_chunk+0x234 (section: .text.radix_tree_next_chunk) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x2b6 (section: .text.vbin_printf) -> bd9571mwv_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x62 (section: .text.bstr_printf) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x66 (section: .text.bstr_printf) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x108 (section: .text.__xas_nomem) -> tps65912_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1494 (section: __ex_table) -> f2fs_attr_gc_remaining_trials (section: .data.rel.local.f2fs_attr_gc_remaining_trials)
ERROR: modpost: __ex_table+0x1494 references non-executable section '.data.rel.local.f2fs_attr_gc_remaining_trials'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1498 (section: __ex_table) -> f2fs_attr_gc_urgent (section: .data.rel.local.f2fs_attr_gc_urgent)
ERROR: modpost: __ex_table+0x1498 references non-executable section '.data.rel.local.f2fs_attr_gc_urgent'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14a0 (section: __ex_table) -> f2fs_attr_gc_valid_thresh_ratio (section: .data.rel.local.f2fs_attr_gc_valid_thresh_ratio)
ERROR: modpost: __ex_table+0x14a0 references non-executable section '.data.rel.local.f2fs_attr_gc_valid_thresh_ratio'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14a4 (section: __ex_table) -> f2fs_attr_idle_interval (section: .data.rel.local.f2fs_attr_idle_interval)
ERROR: modpost: __ex_table+0x14a4 references non-executable section '.data.rel.local.f2fs_attr_idle_interval'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14ac (section: __ex_table) -> f2fs_attr_issued_discard (section: .data.rel.local.f2fs_attr_issued_discard)
ERROR: modpost: __ex_table+0x14ac references non-executable section '.data.rel.local.f2fs_attr_issued_discard'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14b0 (section: __ex_table) -> f2fs_attr_lifetime_write_kbytes (section: .data.rel.local.f2fs_attr_lifetime_write_kbytes)
ERROR: modpost: __ex_table+0x14b0 references non-executable section '.data.rel.local.f2fs_attr_lifetime_write_kbytes'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14b8 (section: __ex_table) -> f2fs_attr_max_discard_issue_time (section: .data.rel.local.f2fs_attr_max_discard_issue_time)
ERROR: modpost: __ex_table+0x14b8 references non-executable section '.data.rel.local.f2fs_attr_max_discard_issue_time'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14bc (section: __ex_table) -> f2fs_attr_max_fragment_chunk (section: .data.rel.local.f2fs_attr_max_fragment_chunk)
ERROR: modpost: __ex_table+0x14bc references non-executable section '.data.rel.local.f2fs_attr_max_fragment_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14c4 (section: __ex_table) -> f2fs_attr_max_io_bytes (section: .data.rel.local.f2fs_attr_max_io_bytes)
ERROR: modpost: __ex_table+0x14c4 references non-executable section '.data.rel.local.f2fs_attr_max_io_bytes'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14c8 (section: __ex_table) -> f2fs_attr_max_fragment_chunk (section: .data.rel.local.f2fs_attr_max_fragment_chunk)
ERROR: modpost: __ex_table+0x14c8 references non-executable section '.data.rel.local.f2fs_attr_max_fragment_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d0 (section: __ex_table) -> f2fs_attr_max_roll_forward_node_blocks (section: .data.rel.local.f2fs_attr_max_roll_forward_node_blocks)
ERROR: modpost: __ex_table+0x14d0 references non-executable section '.data.rel.local.f2fs_attr_max_roll_forward_node_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d4 (section: __ex_table) -> f2fs_attr_max_fragment_chunk (section: .data.rel.local.f2fs_attr_max_fragment_chunk)
ERROR: modpost: __ex_table+0x14d4 references non-executable section '.data.rel.local.f2fs_attr_max_fragment_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14dc (section: __ex_table) -> f2fs_attr_mid_discard_issue_time (section: .data.rel.local.f2fs_attr_mid_discard_issue_time)
ERROR: modpost: __ex_table+0x14dc references non-executable section '.data.rel.local.f2fs_attr_mid_discard_issue_time'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14e0 (section: __ex_table) -> f2fs_attr_max_fragment_chunk (section: .data.rel.local.f2fs_attr_max_fragment_chunk)
ERROR: modpost: __ex_table+0x14e0 references non-executable section '.data.rel.local.f2fs_attr_max_fragment_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14e8 (section: __ex_table) -> f2fs_attr_min_discard_issue_time (section: .data.rel.local.f2fs_attr_min_discard_issue_time)
ERROR: modpost: __ex_table+0x14e8 references non-executable section '.data.rel.local.f2fs_attr_min_discard_issue_time'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14ec (section: __ex_table) -> f2fs_attr_min_hot_blocks (section: .data.rel.local.f2fs_attr_min_hot_blocks)
ERROR: modpost: __ex_table+0x14ec references non-executable section '.data.rel.local.f2fs_attr_min_hot_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f4 (section: __ex_table) -> f2fs_attr_min_seq_blocks (section: .data.rel.local.f2fs_attr_min_seq_blocks)
ERROR: modpost: __ex_table+0x14f4 references non-executable section '.data.rel.local.f2fs_attr_min_seq_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f8 (section: __ex_table) -> f2fs_attr_max_fragment_chunk (section: .data.rel.local.f2fs_attr_max_fragment_chunk)
ERROR: modpost: __ex_table+0x14f8 references non-executable section '.data.rel.local.f2fs_attr_max_fragment_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1500 (section: __ex_table) -> f2fs_attr_moved_blocks_background (section: .data.rel.local.f2fs_attr_moved_blocks_background)
ERROR: modpost: __ex_table+0x1500 references non-executable section '.data.rel.local.f2fs_attr_moved_blocks_background'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1504 (section: __ex_table) -> f2fs_attr_max_fragment_chunk (section: .data.rel.local.f2fs_attr_max_fragment_chunk)
ERROR: modpost: __ex_table+0x1504 references non-executable section '.data.rel.local.f2fs_attr_max_fragment_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x150c (section: __ex_table) -> f2fs_attr_ovp_segments (section: .data.rel.local.f2fs_attr_ovp_segments)
ERROR: modpost: __ex_table+0x150c references non-executable section '.data.rel.local.f2fs_attr_ovp_segments'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1510 (section: __ex_table) -> f2fs_attr_max_fragment_chunk (section: .data.rel.local.f2fs_attr_max_fragment_chunk)
ERROR: modpost: __ex_table+0x1510 references non-executable section '.data.rel.local.f2fs_attr_max_fragment_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1518 (section: __ex_table) -> f2fs_attr_queued_discard (section: .data.rel.local.f2fs_attr_queued_discard)
ERROR: modpost: __ex_table+0x1518 references non-executable section '.data.rel.local.f2fs_attr_queued_discard'
WARNING: modpost: vmlinux: section mismatch in reference: 0x151c (section: __ex_table) -> f2fs_attr_ram_thresh (section: .data.rel.local.f2fs_attr_ram_thresh)
ERROR: modpost: __ex_table+0x151c references non-executable section '.data.rel.local.f2fs_attr_ram_thresh'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1524 (section: __ex_table) -> f2fs_attr_reclaim_segments (section: .data.rel.local.f2fs_attr_reclaim_segments)
ERROR: modpost: __ex_table+0x1524 references non-executable section '.data.rel.local.f2fs_attr_reclaim_segments'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1528 (section: __ex_table) -> f2fs_attr_reserved_pin_section (section: .data.rel.local.f2fs_attr_reserved_pin_section)
ERROR: modpost: __ex_table+0x1528 references non-executable section '.data.rel.local.f2fs_attr_reserved_pin_section'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1530 (section: __ex_table) -> f2fs_attr_revoked_atomic_block (section: .data.rel.local.f2fs_attr_revoked_atomic_block)
ERROR: modpost: __ex_table+0x1530 references non-executable section '.data.rel.local.f2fs_attr_revoked_atomic_block'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1534 (section: __ex_table) -> f2fs_attr_max_fragment_chunk (section: .data.rel.local.f2fs_attr_max_fragment_chunk)
ERROR: modpost: __ex_table+0x1534 references non-executable section '.data.rel.local.f2fs_attr_max_fragment_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x153c (section: __ex_table) -> f2fs_attr_sb_compression (section: .data.rel.local.f2fs_attr_sb_compression)
>> ERROR: modpost: __ex_table+0x153c references non-executable section '.data.rel.local.f2fs_attr_sb_compression'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1540 (section: __ex_table) -> f2fs_attr_sb_encryption (section: .data.rel.local.f2fs_attr_sb_encryption)
ERROR: modpost: __ex_table+0x1540 references non-executable section '.data.rel.local.f2fs_attr_sb_encryption'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1548 (section: __ex_table) -> f2fs_attr_sb_flexible_inline_xattr (section: .data.rel.local.f2fs_attr_sb_flexible_inline_xattr)
ERROR: modpost: __ex_table+0x1548 references non-executable section '.data.rel.local.f2fs_attr_sb_flexible_inline_xattr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x154c (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
ERROR: modpost: __ex_table+0x154c references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1554 (section: __ex_table) -> f2fs_attr_sb_project_quota (section: .data.rel.local.f2fs_attr_sb_project_quota)
ERROR: modpost: __ex_table+0x1554 references non-executable section '.data.rel.local.f2fs_attr_sb_project_quota'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1558 (section: __ex_table) -> f2fs_attr_max_fragment_chunk (section: .data.rel.local.f2fs_attr_max_fragment_chunk)
ERROR: modpost: __ex_table+0x1558 references non-executable section '.data.rel.local.f2fs_attr_max_fragment_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (section: __ex_table) -> f2fs_attr_sb_sb_checksum (section: .data.rel.local.f2fs_attr_sb_sb_checksum)
>> ERROR: modpost: __ex_table+0x1560 references non-executable section '.data.rel.local.f2fs_attr_sb_sb_checksum'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1564 (section: __ex_table) -> f2fs_attr_sb_verity (section: .data.rel.local.f2fs_attr_sb_verity)
ERROR: modpost: __ex_table+0x1564 references non-executable section '.data.rel.local.f2fs_attr_sb_verity'
WARNING: modpost: vmlinux: section mismatch in reference: 0x156c (section: __ex_table) -> f2fs_attr_umount_discard_timeout (section: .data.rel.local.f2fs_attr_umount_discard_timeout)
ERROR: modpost: __ex_table+0x156c references non-executable section '.data.rel.local.f2fs_attr_umount_discard_timeout'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1570 (section: __ex_table) -> f2fs_attr_unusable (section: .data.rel.local.f2fs_attr_unusable)
>> ERROR: modpost: __ex_table+0x1570 references non-executable section '.data.rel.local.f2fs_attr_unusable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1578 (section: __ex_table) -> f2fs_attrs (section: .data.rel.local.f2fs_attrs)
>> ERROR: modpost: __ex_table+0x1578 references non-executable section '.data.rel.local.f2fs_attrs'
WARNING: modpost: vmlinux: section mismatch in reference: 0x157c (section: __ex_table) -> f2fs_attr_max_fragment_chunk (section: .data.rel.local.f2fs_attr_max_fragment_chunk)
ERROR: modpost: __ex_table+0x157c references non-executable section '.data.rel.local.f2fs_attr_max_fragment_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> f2fs_base_attr_compression (section: .data.rel.local.f2fs_base_attr_compression)
ERROR: modpost: __ex_table+0x1584 references non-executable section '.data.rel.local.f2fs_base_attr_compression'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> f2fs_base_attr_encryption (section: .data.rel.local.f2fs_base_attr_encryption)
>> ERROR: modpost: __ex_table+0x1588 references non-executable section '.data.rel.local.f2fs_base_attr_encryption'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> __text (section: .data.rel.ro.local.__text.41801)
ERROR: modpost: __ex_table+0x1590 references non-executable section '.data.rel.ro.local.__text.41801'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> __text (section: .data.rel.ro.local.__text.41825)
ERROR: modpost: __ex_table+0x1594 references non-executable section '.data.rel.ro.local.__text.41825'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15fc (section: __ex_table) -> .LASF971 (section: .debug_str)
ERROR: modpost: __ex_table+0x15fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1600 (section: __ex_table) -> .LASF973 (section: .debug_str)
ERROR: modpost: __ex_table+0x1600 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1608 (section: __ex_table) -> .LASF975 (section: .debug_str)
ERROR: modpost: __ex_table+0x1608 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x160c (section: __ex_table) -> .LASF977 (section: .debug_str)
ERROR: modpost: __ex_table+0x160c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1614 (section: __ex_table) -> .LASF979 (section: .debug_str)
ERROR: modpost: __ex_table+0x1614 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1618 (section: __ex_table) -> .LASF981 (section: .debug_str)
ERROR: modpost: __ex_table+0x1618 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1620 (section: __ex_table) -> .LASF983 (section: .debug_str)
ERROR: modpost: __ex_table+0x1620 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1624 (section: __ex_table) -> .LASF985 (section: .debug_str)
ERROR: modpost: __ex_table+0x1624 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x162c (section: __ex_table) -> .LASF987 (section: .debug_str)
ERROR: modpost: __ex_table+0x162c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1630 (section: __ex_table) -> .LASF989 (section: .debug_str)
ERROR: modpost: __ex_table+0x1630 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1638 (section: __ex_table) -> .LASF991 (section: .debug_str)
ERROR: modpost: __ex_table+0x1638 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x163c (section: __ex_table) -> .LASF993 (section: .debug_str)
ERROR: modpost: __ex_table+0x163c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1644 (section: __ex_table) -> .LASF995 (section: .debug_str)
ERROR: modpost: __ex_table+0x1644 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1648 (section: __ex_table) -> .LASF997 (section: .debug_str)
ERROR: modpost: __ex_table+0x1648 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1650 (section: __ex_table) -> .LASF999 (section: .debug_str)
ERROR: modpost: __ex_table+0x1650 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1654 (section: __ex_table) -> .LASF997 (section: .debug_str)
ERROR: modpost: __ex_table+0x1654 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x165c (section: __ex_table) -> .LASF1002 (section: .debug_str)
ERROR: modpost: __ex_table+0x165c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1660 (section: __ex_table) -> .LASF997 (section: .debug_str)
ERROR: modpost: __ex_table+0x1660 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF1005 (section: .debug_str)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF1007 (section: .debug_str)
ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF1009 (section: .debug_str)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF1011 (section: .debug_str)
ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16ec (section: __ex_table) -> .LASF1516 (section: .debug_str)
ERROR: modpost: __ex_table+0x16ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f0 (section: __ex_table) -> .LASF1518 (section: .debug_str)
ERROR: modpost: __ex_table+0x16f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f8 (section: __ex_table) -> .LASF1520 (section: .debug_str)
ERROR: modpost: __ex_table+0x16f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16fc (section: __ex_table) -> .LASF1518 (section: .debug_str)
ERROR: modpost: __ex_table+0x16fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1704 (section: __ex_table) -> .LASF1523 (section: .debug_str)
ERROR: modpost: __ex_table+0x1704 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1708 (section: __ex_table) -> .LASF1518 (section: .debug_str)
ERROR: modpost: __ex_table+0x1708 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1710 (section: __ex_table) -> .LASF1526 (section: .debug_str)
ERROR: modpost: __ex_table+0x1710 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1714 (section: __ex_table) -> .LASF1518 (section: .debug_str)
ERROR: modpost: __ex_table+0x1714 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x171c (section: __ex_table) -> .LASF1529 (section: .debug_str)
ERROR: modpost: __ex_table+0x171c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1720 (section: __ex_table) -> .LASF1518 (section: .debug_str)
ERROR: modpost: __ex_table+0x1720 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1728 (section: __ex_table) -> .LASF1532 (section: .debug_str)
ERROR: modpost: __ex_table+0x1728 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x172c (section: __ex_table) -> .LASF1518 (section: .debug_str)
ERROR: modpost: __ex_table+0x172c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1734 (section: __ex_table) -> .LASF1535 (section: .debug_str)
ERROR: modpost: __ex_table+0x1734 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1738 (section: __ex_table) -> .LASF1537 (section: .debug_str)
ERROR: modpost: __ex_table+0x1738 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1740 (section: __ex_table) -> .LASF1539 (section: .debug_str)
ERROR: modpost: __ex_table+0x1740 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1744 (section: __ex_table) -> .LASF1541 (section: .debug_str)
ERROR: modpost: __ex_table+0x1744 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x174c (section: __ex_table) -> .LASF2868 (section: .debug_str)
ERROR: modpost: __ex_table+0x174c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1750 (section: __ex_table) -> .LASF1544 (section: .debug_str)
ERROR: modpost: __ex_table+0x1750 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1758 (section: __ex_table) -> .LASF1546 (section: .debug_str)
ERROR: modpost: __ex_table+0x1758 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x175c (section: __ex_table) -> .LASF1548 (section: .debug_str)
ERROR: modpost: __ex_table+0x175c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1764 (section: __ex_table) -> .LASF1550 (section: .debug_str)
ERROR: modpost: __ex_table+0x1764 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1768 (section: __ex_table) -> .LASF1552 (section: .debug_str)
ERROR: modpost: __ex_table+0x1768 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1770 (section: __ex_table) -> .LASF1554 (section: .debug_str)
ERROR: modpost: __ex_table+0x1770 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1774 (section: __ex_table) -> .LASF1556 (section: .debug_str)
ERROR: modpost: __ex_table+0x1774 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x177c (section: __ex_table) -> .LASF1558 (section: .debug_str)
ERROR: modpost: __ex_table+0x177c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1780 (section: __ex_table) -> .LASF1560 (section: .debug_str)
ERROR: modpost: __ex_table+0x1780 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
