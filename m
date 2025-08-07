Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8121E25E8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 06:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754547584; cv=none; b=t5zZhxPqh85/qa1d+nbla/ujj7BFqWgps/GNdJegrO61E8m2EUIU53v+neqDNeAcwVq8lLvQI0305Z+TFtsmbYTJBA0Npm+I5VD/zImfwMsNFjAETdnRZwIxMXUiiKkOnx42prefXV7wrE1ard2k5SYPpWp///ZVBodc/Cyx93E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754547584; c=relaxed/simple;
	bh=ronyuSRZ3yPOsnul+6/QaZMoqsGyCIDYlofUCeibdV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=grNqEgv5XzZBb5Yl8mtmHR2QCoQ4NtCkvpJKaISIRWq8+7MI41OAHyJ02vksE+4q0Ifxr8XqMaHbGKsoG25j+A+Sryc7Zz3ImF2uO9D7F+7GCpQG+H7yX61VsRDfUw2xWPfQqvB599do/6gIm6pkStyLlrB2gOZb/pkSyC6+QYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHi1TOVd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHi1TOVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754547582; x=1786083582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ronyuSRZ3yPOsnul+6/QaZMoqsGyCIDYlofUCeibdV4=;
  b=PHi1TOVdgjbqEVrfzubEm0v7YbJeeZT8bN1Sup3Q6b+VVPKvLw2LRkr5
   8Jl8j2ZI1USiFjSfJELyoGnOk5eTxF1vHe6LF0dmcsFaHmOfO+/yca8TY
   oNs3eYfvevK2VkmkKUzVa2WZObq61bPnD3URQGAS1qKWkDbVZDBPqFUn8
   wKJlHGcceklpDQZaA7d46K3lyQ5P1oisYVShLY7Rw+O6C2oBA4K13djEf
   DYs4pvqXEOJf1B9iKkjabGvYNr4kvO1oFuftDwiz0Fz3I3oRmZxYuM8/x
   jbJgnZs2bpJVmDZ7qojaqM+/1QlT6dQGt9tZMEPLz2lqaYT6ADIHbwVQE
   Q==;
X-CSE-ConnectionGUID: FEymP+5tRre3r5Re5gWdvg==
X-CSE-MsgGUID: OlyY3AJvSDWICj6y6MO6fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56583404"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56583404"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 23:19:42 -0700
X-CSE-ConnectionGUID: cBjVuTFqRD2vFO0VUtPVxg==
X-CSE-MsgGUID: lovnwjWwQ8Co3mdssrQvDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="202148679"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Aug 2025 23:19:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujtyH-0002SG-2u;
	Thu, 07 Aug 2025 06:19:29 +0000
Date: Thu, 7 Aug 2025 14:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:wireguard 1/3] ERROR: modpost: __ex_table+0x1584 references
 non-executable section '.rodata.x25_data_transmit.str1.4'
Message-ID: <202508071400.rPyWLOVM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux wireguard
head:   ba29278f050c074becf705010c89cc224461d8d1
commit: 7420718eb426065e2f8cb4e599967bd34f478727 [1/3] bitops: add compile-time test for ror() and rol()
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071400.rPyWLOVM-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071400.rPyWLOVM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071400.rPyWLOVM-lkp@intel.com/

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
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> 0x0 (section: .rodata.x25_data_transmit.str1.4)
>> ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.x25_data_transmit.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> 0x0 (section: .rodata.x25_xmit.str1.4)
>> ERROR: modpost: __ex_table+0x1588 references non-executable section '.rodata.x25_xmit.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> 0x0 (section: .rodata.devm_framer_create.str1.4)
>> ERROR: modpost: __ex_table+0x1590 references non-executable section '.rodata.devm_framer_create.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> 0x0 (section: .rodata.framer_create.str1.4)
>> ERROR: modpost: __ex_table+0x1594 references non-executable section '.rodata.framer_create.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x159c (section: __ex_table) -> CSWTCH (section: .rodata.CSWTCH.31)
>> ERROR: modpost: __ex_table+0x159c references non-executable section '.rodata.CSWTCH.31'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a0 (section: __ex_table) -> 0x0 (section: .rodata.framer_create.str1.4)
ERROR: modpost: __ex_table+0x15a0 references non-executable section '.rodata.framer_create.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF348 (section: .debug_str)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF350 (section: .debug_str)
ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF352 (section: .debug_str)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF354 (section: .debug_str)
ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1680 (section: __ex_table) -> .LASF356 (section: .debug_str)
ERROR: modpost: __ex_table+0x1680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1684 (section: __ex_table) -> .LASF358 (section: .debug_str)
ERROR: modpost: __ex_table+0x1684 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x168c (section: __ex_table) -> .LASF360 (section: .debug_str)
ERROR: modpost: __ex_table+0x168c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1690 (section: __ex_table) -> .LASF354 (section: .debug_str)
ERROR: modpost: __ex_table+0x1690 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1698 (section: __ex_table) -> .LASF362 (section: .debug_str)
ERROR: modpost: __ex_table+0x1698 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x169c (section: __ex_table) -> .LASF354 (section: .debug_str)
ERROR: modpost: __ex_table+0x169c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a4 (section: __ex_table) -> .LASF365 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a8 (section: __ex_table) -> .LASF367 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b0 (section: __ex_table) -> .LASF398 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b4 (section: __ex_table) -> .LASF400 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16bc (section: __ex_table) -> .LASF402 (section: .debug_str)
ERROR: modpost: __ex_table+0x16bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c0 (section: __ex_table) -> .LASF404 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c8 (section: __ex_table) -> .LASF3040 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16cc (section: __ex_table) -> .LASF3042 (section: .debug_str)
ERROR: modpost: __ex_table+0x16cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a0 (section: __ex_table) -> .LASF3465 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a4 (section: __ex_table) -> .LASF3467 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ac (section: __ex_table) -> .LASF3469 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b0 (section: __ex_table) -> .LASF3467 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b8 (section: __ex_table) -> .LASF3472 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17bc (section: __ex_table) -> .LASF3467 (section: .debug_str)
ERROR: modpost: __ex_table+0x17bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c4 (section: __ex_table) -> .LASF3475 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c8 (section: __ex_table) -> .LASF3477 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d0 (section: __ex_table) -> .LASF3479 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d4 (section: __ex_table) -> .LASF3467 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f4 (section: __ex_table) -> .LASF1528 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f8 (section: __ex_table) -> .LASF1530 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1800 (section: __ex_table) -> .LASF1532 (section: .debug_str)
ERROR: modpost: __ex_table+0x1800 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1804 (section: __ex_table) -> .LASF1534 (section: .debug_str)
ERROR: modpost: __ex_table+0x1804 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x180c (section: __ex_table) -> _init_on_alloc_enabled_early (section: .data._init_on_alloc_enabled_early)
>> ERROR: modpost: __ex_table+0x180c references non-executable section '.data._init_on_alloc_enabled_early'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1810 (section: __ex_table) -> _init_on_free_enabled_early (section: .data._init_on_free_enabled_early)
>> ERROR: modpost: __ex_table+0x1810 references non-executable section '.data._init_on_free_enabled_early'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1818 (section: __ex_table) -> early_pfn_lock (section: .data.rel.local.early_pfn_lock.55265)
>> ERROR: modpost: __ex_table+0x1818 references non-executable section '.data.rel.local.early_pfn_lock.55265'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1854 (section: __ex_table) -> r (section: .bss.r.55330)
>> ERROR: modpost: __ex_table+0x1854 references non-executable section '.bss.r.55330'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f4 (section: __ex_table) -> .LLST388 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18f4 references non-executable section '.debug_loc'
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
WARNING: modpost: vmlinux: section mismatch in reference: 0x19ec (section: __ex_table) -> .LASF402 (section: .debug_str)
ERROR: modpost: __ex_table+0x19ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f0 (section: __ex_table) -> .LASF394 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f8 (section: __ex_table) -> .LASF2682 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19fc (section: __ex_table) -> .LASF2684 (section: .debug_str)
ERROR: modpost: __ex_table+0x19fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: __ex_table) -> .LASF2686 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: __ex_table) -> .LASF2688 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> .LASF3129 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> .LASF3131 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a1c (section: __ex_table) -> .LASF3133 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a20 (section: __ex_table) -> .LASF3135 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a28 (section: __ex_table) -> .LASF3137 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a2c (section: __ex_table) -> .LASF3139 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a34 (section: __ex_table) -> .LASF3141 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a38 (section: __ex_table) -> .LASF3143 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a40 (section: __ex_table) -> .LASF3145 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a44 (section: __ex_table) -> .LASF3147 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a4c (section: __ex_table) -> .LASF3149 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a50 (section: __ex_table) -> .LASF3151 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a58 (section: __ex_table) -> .LASF1890 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a5c (section: __ex_table) -> .LASF1892 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a64 (section: __ex_table) -> .LASF1894 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a68 (section: __ex_table) -> .LASF1896 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a70 (section: __ex_table) -> .LASF1898 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a74 (section: __ex_table) -> .LASF1900 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a7c (section: __ex_table) -> .LASF1902 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a80 (section: __ex_table) -> .LASF1904 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a88 (section: __ex_table) -> .LASF1906 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a8c (section: __ex_table) -> .LASF1904 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a94 (section: __ex_table) -> .LASF1909 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a98 (section: __ex_table) -> .LASF1904 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa0 (section: __ex_table) -> .LASF1912 (section: .debug_str)
ERROR: modpost: __ex_table+0x1aa0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa4 (section: __ex_table) -> .LASF1904 (section: .debug_str)
ERROR: modpost: __ex_table+0x1aa4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aac (section: __ex_table) -> .LASF1915 (section: .debug_str)
ERROR: modpost: __ex_table+0x1aac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab0 (section: __ex_table) -> .LASF1904 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ab0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab8 (section: __ex_table) -> .LASF1918 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ab8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1abc (section: __ex_table) -> .LASF1904 (section: .debug_str)
ERROR: modpost: __ex_table+0x1abc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> .LASF1921 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> .LASF1904 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad0 (section: __ex_table) -> .LASF1924 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad4 (section: __ex_table) -> .LASF1904 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1adc (section: __ex_table) -> .LASF1927 (section: .debug_str)
ERROR: modpost: __ex_table+0x1adc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae0 (section: __ex_table) -> .LASF1904 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae8 (section: __ex_table) -> .LASF1930 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae8 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
