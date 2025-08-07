Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FE31F95C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 01:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754528702; cv=none; b=JbY0YZ7/g+H+D65eVegAJEKRYkrsoduTA5hVxPBzljpEOLTdwlbTTg0X5TjYxxgOwQNu2sHX5Vtq/Kaj9dtC6hZqd1vx8cjLj7K0Z5GlZo9z8AD4fLfGQg608Ew6d93mhKZo5qQC13brvDtmkmwA79e1lNENoYhKcN+JgpNabno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754528702; c=relaxed/simple;
	bh=Kb5jnAu2WNnM8ylc0TTr02B//kSXaezHuGqRn3UEdYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i47Y3wYIEO0e+C89+GC/6Xt5G4a3EGZk3Tig+tV1lVjFsv7y49/KSsY4sjoU3k3NN5O/bWMgVrBrtw+xHxg/vlBQjd4il9dBNLB3unTlYV1ZisTXDgpEMLyf/4x1pi9/mx+430kXM5O0TWD4wV/wDxVowhOOqsZDdUm0nyGrYF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fplp+wF5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fplp+wF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754528700; x=1786064700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kb5jnAu2WNnM8ylc0TTr02B//kSXaezHuGqRn3UEdYA=;
  b=Fplp+wF5I7FjUPbifQOIDhS+sgRDl9Bj3uA/IOKnW/Px9FgzdqTJQRkp
   7GG9FJvP9ssQc1fyxNOOc7pYNfRWeFHUvaQOJnuLR9iiuO5E7tHdngA1z
   1/LZMsHpuLb4+IMGlrkRo1Py+yGuvglgbKhxoFvNY3aeoubpH0NpTvZps
   8JZ9ZWznB+zYZOrt+V2IV3d5wsnxpB5hnwSD/0CjWmCLjHm/TrPLXGY91
   Lt3IlVkkL3w8vE78lof+U48MuoPoZjGtuVfZGKYI12R9ew/Y4wPtbUSL5
   pbtw09WuV3Xm2WZaE41NCtU+bplylIm+WGMC4yQdR/Ze0guKzlhY5sf8T
   A==;
X-CSE-ConnectionGUID: gWjLW98GR6CuEZh/AIac7w==
X-CSE-MsgGUID: hNHkH8YMQpOngS9eOpFTnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67124322"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67124322"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 18:05:00 -0700
X-CSE-ConnectionGUID: LaYNle4cRS2Urf+JjewDYg==
X-CSE-MsgGUID: UBrtMza0RnGojtp6lXLo/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165253071"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Aug 2025 18:04:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujp3v-0002Ei-1V;
	Thu, 07 Aug 2025 01:04:55 +0000
Date: Thu, 7 Aug 2025 09:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:perf/refcount 6/6] ERROR: modpost: __ex_table+0x1584
 references non-executable section '.rodata.musb_init_controller.str1.4'
Message-ID: <202508070824.4pu0Iqri-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git perf/refcount
head:   d46d032a8625ce8449a56e1825c12ae92a340e54
commit: d46d032a8625ce8449a56e1825c12ae92a340e54 [6/6] perf/core: Convert mmap() refcounts to refcount_t
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070824.4pu0Iqri-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070824.4pu0Iqri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070824.4pu0Iqri-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: xp_fill_cb+0x46 (section: .text.xp_fill_cb) -> .L62 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_data+0x18 (section: .text.xp_raw_get_data) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_data+0x1e (section: .text.xp_raw_get_data) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_data+0x22 (section: .text.xp_raw_get_data) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_data+0x38 (section: .text.xp_raw_get_data) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_dma+0x18 (section: .text.xp_raw_get_dma) -> .L73 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_dma+0x1e (section: .text.xp_raw_get_dma) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_dma+0x22 (section: .text.xp_raw_get_dma) -> .L70 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_dma+0x3a (section: .text.xp_raw_get_dma) -> .L84 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_ctx+0x18 (section: .text.xp_raw_get_ctx) -> .L87 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_ctx+0x1e (section: .text.xp_raw_get_ctx) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_ctx+0x22 (section: .text.xp_raw_get_ctx) -> .L86 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_ctx+0x3a (section: .text.xp_raw_get_ctx) -> ics932s401_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_ctx+0x62 (section: .text.xp_raw_get_ctx) -> .L89 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_ctx+0x9a (section: .text.xp_raw_get_ctx) -> .L90 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_init_dma_info+0x18 (section: .text.xp_init_dma_info) -> .L93 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_init_dma_info+0x1e (section: .text.xp_init_dma_info) -> .L91 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_init_dma_info+0x22 (section: .text.xp_init_dma_info) -> .L92 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_init_dma_info+0x32 (section: .text.xp_init_dma_info) -> .L95 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x170 (section: .text.xp_alloc) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x18c (section: .text.xp_alloc) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc_batch+0xee (section: .text.xp_alloc_batch) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc_batch+0x15a (section: .text.xp_alloc_batch) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_unmap+0x7a (section: .text.xp_dma_unmap) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x5c (section: .text.xp_dma_map) -> wcd934x_slim_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x11c (section: .text.xp_dma_map) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x14c (section: .text.xp_dma_map) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x1a0 (section: .text.xp_dma_map) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x1b0 (section: .text.xp_dma_map) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x2a4 (section: .text.xp_assign_dev) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x52 (section: .text.xp_clear_dev) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_put_pool+0x80 (section: .text.xp_put_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x98 (section: .text.ida_alloc_range) -> wcd934x_slim_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0xd8 (section: .text.ida_alloc_range) -> lkdtm_module_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0xe2 (section: .text.ida_alloc_range) -> .LVL26 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0xec (section: .text.ida_alloc_range) -> .LVL41 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0xf4 (section: .text.ida_alloc_range) -> lkdtm_bugs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0xfa (section: .text.ida_alloc_range) -> .LVL25 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x100 (section: .text.ida_alloc_range) -> .LVL42 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x106 (section: .text.ida_alloc_range) -> .LVL37 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x124 (section: .text.ida_alloc_range) -> .LVL38 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x142 (section: .text.ida_alloc_range) -> .LVL25 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x14a (section: .text.ida_alloc_range) -> .LVL33 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x172 (section: .text.ida_alloc_range) -> .LVL25 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x17a (section: .text.ida_alloc_range) -> .LVL35 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x17c (section: .text.ida_alloc_range) -> .LVL39 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x1ae (section: .text.ida_alloc_range) -> .LVL42 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x26e (section: .text.ida_alloc_range) -> .LVL25 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x27a (section: .text.ida_alloc_range) -> .LVL39 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x280 (section: .text.ida_alloc_range) -> .LVL39 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x316 (section: .text.ida_alloc_range) -> wcd934x_slim_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kset_create_and_add+0x10 (section: .text.kset_create_and_add) -> wcd934x_slim_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_create_and_add+0xe (section: .text.kobject_create_and_add) -> wcd934x_slim_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uevent_net_init+0xe (section: .text.uevent_net_init) -> wcd934x_slim_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_env+0x72 (section: .text.kobject_uevent_env) -> wcd934x_slim_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_synth_uevent+0x106 (section: .text.kobject_synth_uevent) -> wcd934x_slim_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_unregister_range+0x28 (section: .text.logic_pio_unregister_range) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x6e (section: .text.mab_mas_cp) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x88 (section: .text.mab_mas_cp) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x96 (section: .text.mab_mas_cp) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0xba (section: .text.mab_mas_cp) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0xca (section: .text.mab_mas_cp) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0xd6 (section: .text.mab_mas_cp) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0xdc (section: .text.mab_mas_cp) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x7e (section: .text.mas_empty_area) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0xd2 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0xda (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0xf0 (section: .text.mas_empty_area) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x306 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x59c (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_set_height+0x2c (section: .text.mt_set_height) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_set_height+0x34 (section: .text.mt_set_height) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_set_height+0x64 (section: .text.mt_set_height) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_put_in_tree+0x4e (section: .text.mas_put_in_tree) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_put_in_tree+0x82 (section: .text.mas_put_in_tree) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_put_in_tree+0x8a (section: .text.mas_put_in_tree) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_put_in_tree+0xae (section: .text.mas_put_in_tree) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_split_final_node+0x28 (section: .text.mas_split_final_node) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x9a (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x174 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x186 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x1ce (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x200 (section: .text.mt_validate) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x65a (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x668 (section: .text.mt_validate) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x694 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x748 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x36 (section: .text.vsnprintf) -> tps6594_esm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x4a (section: .text.vsnprintf) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x7a (section: .text.vsnprintf) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0xa8 (section: .text.vsnprintf) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x104 (section: .text.vsnprintf) -> tps6594_esm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x106 (section: .text.vsnprintf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x10c (section: .text.vsnprintf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x28a (section: .text.vsnprintf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.LVL26+0x0 (section: .init.text.check_platform_features) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x4 (section: .init.text.efi_enter_kernel) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.LVL43+0x2 (section: .init.text.memparse) -> stmpe_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x4 (section: .init.text.memparse) -> stmpe_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> 0x0 (section: .rodata.musb_init_controller.str1.4)
>> ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.musb_init_controller.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> 0x0 (section: .rodata.musb_otg_timer_func.str1.4)
>> ERROR: modpost: __ex_table+0x1588 references non-executable section '.rodata.musb_otg_timer_func.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> 0x0 (section: .rodata.musb_queue_resume_work.str1.4)
>> ERROR: modpost: __ex_table+0x1590 references non-executable section '.rodata.musb_queue_resume_work.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> 0x0 (section: .rodata.musb_set_peripheral.str1.4)
>> ERROR: modpost: __ex_table+0x1594 references non-executable section '.rodata.musb_set_peripheral.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x159c (section: __ex_table) -> 0x0 (section: .rodata.musb_start.str1.4)
>> ERROR: modpost: __ex_table+0x159c references non-executable section '.rodata.musb_start.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a0 (section: __ex_table) -> 0x0 (section: .rodata.musb_set_peripheral.str1.4)
ERROR: modpost: __ex_table+0x15a0 references non-executable section '.rodata.musb_set_peripheral.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a8 (section: __ex_table) -> .LASF635 (section: .debug_str)
ERROR: modpost: __ex_table+0x15a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15ac (section: __ex_table) -> .LASF637 (section: .debug_str)
ERROR: modpost: __ex_table+0x15ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b4 (section: __ex_table) -> .LASF639 (section: .debug_str)
ERROR: modpost: __ex_table+0x15b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b8 (section: __ex_table) -> .LASF641 (section: .debug_str)
ERROR: modpost: __ex_table+0x15b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c0 (section: __ex_table) -> .LASF643 (section: .debug_str)
ERROR: modpost: __ex_table+0x15c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c4 (section: __ex_table) -> .LASF645 (section: .debug_str)
ERROR: modpost: __ex_table+0x15c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15cc (section: __ex_table) -> .LASF647 (section: .debug_str)
ERROR: modpost: __ex_table+0x15cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d0 (section: __ex_table) -> .LASF645 (section: .debug_str)
ERROR: modpost: __ex_table+0x15d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d8 (section: __ex_table) -> .LASF650 (section: .debug_str)
ERROR: modpost: __ex_table+0x15d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15dc (section: __ex_table) -> .LASF645 (section: .debug_str)
ERROR: modpost: __ex_table+0x15dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF1214 (section: .debug_str)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF1216 (section: .debug_str)
ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF1218 (section: .debug_str)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF1220 (section: .debug_str)
ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1680 (section: __ex_table) -> .LASF1222 (section: .debug_str)
ERROR: modpost: __ex_table+0x1680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1684 (section: __ex_table) -> .LASF1224 (section: .debug_str)
ERROR: modpost: __ex_table+0x1684 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x168c (section: __ex_table) -> .LASF1226 (section: .debug_str)
ERROR: modpost: __ex_table+0x168c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1690 (section: __ex_table) -> .LASF1220 (section: .debug_str)
ERROR: modpost: __ex_table+0x1690 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1698 (section: __ex_table) -> .LASF1229 (section: .debug_str)
ERROR: modpost: __ex_table+0x1698 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x169c (section: __ex_table) -> .LASF1220 (section: .debug_str)
ERROR: modpost: __ex_table+0x169c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a4 (section: __ex_table) -> .LASF1232 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a8 (section: __ex_table) -> .LASF1234 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b0 (section: __ex_table) -> .LASF1265 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b4 (section: __ex_table) -> .LASF1267 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16bc (section: __ex_table) -> .LASF1269 (section: .debug_str)
ERROR: modpost: __ex_table+0x16bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c0 (section: __ex_table) -> .LASF1271 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c8 (section: __ex_table) -> .LASF3908 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16cc (section: __ex_table) -> .LASF3910 (section: .debug_str)
ERROR: modpost: __ex_table+0x16cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a0 (section: __ex_table) -> .LASF4334 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a4 (section: __ex_table) -> .LASF4336 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ac (section: __ex_table) -> .LASF4338 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b0 (section: __ex_table) -> .LASF4336 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b8 (section: __ex_table) -> .LASF4341 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17bc (section: __ex_table) -> .LASF4336 (section: .debug_str)
ERROR: modpost: __ex_table+0x17bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c4 (section: __ex_table) -> .LASF4344 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c8 (section: __ex_table) -> .LASF4346 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d0 (section: __ex_table) -> .LASF4348 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d4 (section: __ex_table) -> .LASF4336 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f4 (section: __ex_table) -> .LASF1364 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f8 (section: __ex_table) -> .LASF1366 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1800 (section: __ex_table) -> .LASF1368 (section: .debug_str)
ERROR: modpost: __ex_table+0x1800 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1804 (section: __ex_table) -> .LASF1370 (section: .debug_str)
ERROR: modpost: __ex_table+0x1804 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f0 (section: __ex_table) -> .LLST226 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18f0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> .LASF392 (section: .debug_str)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> .LASF394 (section: .debug_str)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .LASF396 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> .LASF394 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e0 (section: __ex_table) -> .LASF398 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> .LASF400 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e4 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
