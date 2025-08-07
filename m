Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70438610D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754546895; cv=none; b=WjN61/PIogydap7f6TxyViilnRzdz3UJ48TjQgbzMsj2LupfQKdCz5y7dQ//kLNsQFYIWcvklVJFBQt15cIew/eirmpIM97OkR+eYYWDxTbn2nnZ2IHgNWQdoVqfXNdtNgttz75DoaFPCSbkpPrnOUDP3sDwJTffLLfiXIQFB8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754546895; c=relaxed/simple;
	bh=+me+qOUWIHxhGDqnqf96QEbMA/mOmJIPKd/Hvfm8s0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WrKBma3jH7zXcoUCq4QtLNOTAEB+zRT9+ykFC9ggydPAiQg9+bdl7zpFSpbEg5mSwMBsk1m+yF4peFZ9J4J2QdtG6bdXm7FPBM7PVhnZCMz34Ui0LnhRvNIob+a6wK293r5ZIdnDlDf6ciFE3iJAY7m+5OhmlV8HmNkbvWUeUU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6MWnr/7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6MWnr/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754546894; x=1786082894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+me+qOUWIHxhGDqnqf96QEbMA/mOmJIPKd/Hvfm8s0k=;
  b=B6MWnr/7LLwVkl00TU97YLIMwndr57As6nYQVciw12v3JPdC1zYjuPQS
   EUspU4+VwsIfcaoo9oOVvJ7LQ6ftLXVdfJe7096Nky16ZGIERgR1TqldZ
   M/092pDqwyNXZgTcbkVw3ioAECq84f6tgkZm+BewMvc6gGFKsvt8XAjtT
   sHyc4ah0RqfcwITYSP+UkJcHTunkeoaQ71mw6vmojtmZpvZBHa+b6EP9s
   enEIm5pND3t3WNkd/jDSOkPvZPaaGGxYv2EOTMiUjZbAu+UjO3fhJCYkC
   +35dL20AgV0e93DEIZHKfnbb62ftPCchWbQzjc0ErgsZg/kI+CPL3xmO1
   g==;
X-CSE-ConnectionGUID: GNc10s7WRUyJ5brWCUbGgA==
X-CSE-MsgGUID: XV/fgFvqQz6L7NO7qXgW2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="59487807"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="59487807"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 23:08:13 -0700
X-CSE-ConnectionGUID: OY/X0FtaRaKfDwH3mG+UZA==
X-CSE-MsgGUID: BMMMfpf8QjCEiiJLEERv/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164496862"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2025 23:08:11 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujtnD-0002Rr-0n;
	Thu, 07 Aug 2025 06:08:01 +0000
Date: Thu, 7 Aug 2025 14:07:00 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 96/96] ERROR: modpost: __ex_table+0x1584 references
 non-executable section '.rodata.mag3110_samp_freq'
Message-ID: <202508071430.08L3ufFK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   2eb431dde1d799d75877a641b5b96ee19cbfa147
commit: 2eb431dde1d799d75877a641b5b96ee19cbfa147 [96/96] include/linux/kasan-enabled: temporal build fix
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071430.08L3ufFK-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071430.08L3ufFK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071430.08L3ufFK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: qrtr_ns_worker+0x110 (section: .text.qrtr_ns_worker) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: qrtr_ns_worker+0x312 (section: .text.qrtr_ns_worker) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: qrtr_tun_open+0xe (section: .text.qrtr_tun_open) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xsk_generic_xmit+0x3d0 (section: .text.xsk_generic_xmit) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdp_put_umem+0x0 (section: .text.xdp_put_umem) -> register_cpufreq_notifier (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdp_put_umem+0x76 (section: .text.xdp_put_umem) -> soc_bus_register (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdp_umem_create+0x1c (section: .text.xdp_umem_create) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdp_umem_create+0x2a6 (section: .text.xdp_umem_create) -> register_cpufreq_notifier (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdp_umem_create+0x2aa (section: .text.xdp_umem_create) -> soc_bus_register (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdp_umem_create+0x2fa (section: .text.xdp_umem_create) -> register_cpufreq_notifier (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xskq_create+0xe (section: .text.xskq_create) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x5c (section: .text.xp_dma_map) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x98 (section: .text.ida_alloc_range) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x316 (section: .text.ida_alloc_range) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: kset_create_and_add+0x10 (section: .text.kset_create_and_add) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_create_and_add+0xe (section: .text.kobject_create_and_add) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: uevent_net_init+0xe (section: .text.uevent_net_init) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_env+0x72 (section: .text.kobject_uevent_env) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_env+0x360 (section: .text.kobject_uevent_env) -> .LVL169 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_env+0x3ca (section: .text.kobject_uevent_env) -> .LVL171 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_env+0x432 (section: .text.kobject_uevent_env) -> .LVL170 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_env+0x43e (section: .text.kobject_uevent_env) -> .LVL170 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_synth_uevent+0x106 (section: .text.kobject_synth_uevent) -> wcd934x_slim_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x3a (section: .text.mas_get_slot) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x48 (section: .text.mas_get_slot) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x50 (section: .text.mas_get_slot) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x60 (section: .text.mas_get_slot) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x6a (section: .text.mas_get_slot) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x74 (section: .text.mas_get_slot) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x80 (section: .text.mas_get_slot) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x9a (section: .text.mas_get_slot) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0xf2 (section: .text.mas_empty_area_rev) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x3da (section: .text.mas_empty_area_rev) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x3ea (section: .text.mas_empty_area_rev) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x186 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x1c6 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x240 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x248 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x254 (section: .text.mt_validate) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x6d0 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x6dc (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x6e0 (section: .text.mt_validate) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x4f0 (section: .text.mas_spanning_rebalance) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x54c (section: .text.mas_spanning_rebalance) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x596 (section: .text.mas_spanning_rebalance) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x5a6 (section: .text.mas_spanning_rebalance) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x5b0 (section: .text.mas_spanning_rebalance) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x88c (section: .text.mas_spanning_rebalance) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x8a2 (section: .text.mas_spanning_rebalance) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x9d6 (section: .text.mas_spanning_rebalance) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0xa3c (section: .text.mas_spanning_rebalance) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_spanning_store.isra.63+0x1dc (section: .text.mas_wr_spanning_store.isra.63) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_spanning_store.isra.63+0x2be (section: .text.mas_wr_spanning_store.isra.63) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_bnode+0x12a (section: .text.mas_wr_bnode) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_bnode+0x8d4 (section: .text.mas_wr_bnode) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_path+0x44 (section: .text.seq_buf_path) -> wm8400_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: number+0x3e (section: .text.number) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: number+0x94 (section: .text.number) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: number+0xa2 (section: .text.number) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: number+0xcc (section: .text.number) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: number+0xd8 (section: .text.number) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: number+0x2ea (section: .text.number) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: default_pointer+0x22 (section: .text.default_pointer) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: default_pointer+0x38 (section: .text.default_pointer) -> virtio_nsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0xfe (section: .text.resource_string.isra.12) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x106 (section: .text.resource_string.isra.12) -> virtio_nsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x270 (section: .text.resource_string.isra.12) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x28e (section: .text.resource_string.isra.12) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x2fc (section: .text.resource_string.isra.12) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x300 (section: .text.resource_string.isra.12) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dentry_name+0x4a (section: .text.dentry_name) -> virtio_nsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dentry_name+0x5c (section: .text.dentry_name) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dentry_name+0x82 (section: .text.dentry_name) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dentry_name+0x1e0 (section: .text.dentry_name) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dentry_name+0x238 (section: .text.dentry_name) -> virtio_nsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x138 (section: .text.pointer) -> virtio_nsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_store+0x2a (section: .text.xas_store) -> pm860x_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_store+0xc6 (section: .text.xas_store) -> pm860x_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x16 (section: .text.__xa_insert) -> pm860x_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x3e (section: .text.__xa_insert) -> pm860x_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x46 (section: .text.__xa_insert) -> pm860x_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x54 (section: .text.__xa_insert) -> pm860x_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x62 (section: .text.__xa_insert) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x7a (section: .text.__xa_insert) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x84 (section: .text.__xa_insert) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x90 (section: .text.__xa_insert) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x9a (section: .text.__xa_insert) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x9e (section: .text.__xa_insert) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0x38 (section: .text.xa_load) -> pm860x_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0x3c (section: .text.xa_load) -> pm860x_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0x4e (section: .text.xa_load) -> pm860x_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0xaa (section: .text.xa_load) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0xae (section: .text.xa_load) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0x142 (section: .text.xa_load) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0x14c (section: .text.xa_load) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0x172 (section: .text.xa_load) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0x19c (section: .text.xa_load) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x4 (section: .init.text.efi_parse_options) -> stmpe_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x4 (section: .init.text.efi_parse_options) -> stmpe_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> mag3110_samp_freq (section: .rodata.mag3110_samp_freq)
>> ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.mag3110_samp_freq'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> 0x0 (section: .rodata.mag3110_show_samp_freq_avail.str1.4)
>> ERROR: modpost: __ex_table+0x1588 references non-executable section '.rodata.mag3110_show_samp_freq_avail.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> hid_magn_3d_ids (section: .rodata.hid_magn_3d_ids)
>> ERROR: modpost: __ex_table+0x1590 references non-executable section '.rodata.hid_magn_3d_ids'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> magn_3d_addresses (section: .rodata.magn_3d_addresses)
>> ERROR: modpost: __ex_table+0x1594 references non-executable section '.rodata.magn_3d_addresses'
WARNING: modpost: vmlinux: section mismatch in reference: 0x159c (section: __ex_table) -> magn_3d_sensitivity_addresses (section: .rodata.magn_3d_sensitivity_addresses)
>> ERROR: modpost: __ex_table+0x159c references non-executable section '.rodata.magn_3d_sensitivity_addresses'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a0 (section: __ex_table) -> magn_3d_addresses (section: .rodata.magn_3d_addresses)
ERROR: modpost: __ex_table+0x15a0 references non-executable section '.rodata.magn_3d_addresses'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1860 (section: __ex_table) -> .LASF2785 (section: .debug_str)
ERROR: modpost: __ex_table+0x1860 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1864 (section: __ex_table) -> .LASF2787 (section: .debug_str)
ERROR: modpost: __ex_table+0x1864 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x186c (section: __ex_table) -> .LASF2789 (section: .debug_str)
ERROR: modpost: __ex_table+0x186c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1870 (section: __ex_table) -> .LASF2791 (section: .debug_str)
ERROR: modpost: __ex_table+0x1870 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1878 (section: __ex_table) -> .LASF2793 (section: .debug_str)
ERROR: modpost: __ex_table+0x1878 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x187c (section: __ex_table) -> .LASF2795 (section: .debug_str)
ERROR: modpost: __ex_table+0x187c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1884 (section: __ex_table) -> .LASF2797 (section: .debug_str)
ERROR: modpost: __ex_table+0x1884 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1888 (section: __ex_table) -> .LASF2799 (section: .debug_str)
ERROR: modpost: __ex_table+0x1888 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1890 (section: __ex_table) -> .LASF2801 (section: .debug_str)
ERROR: modpost: __ex_table+0x1890 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1894 (section: __ex_table) -> .LASF2803 (section: .debug_str)
ERROR: modpost: __ex_table+0x1894 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x189c (section: __ex_table) -> .LASF2805 (section: .debug_str)
ERROR: modpost: __ex_table+0x189c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a0 (section: __ex_table) -> .LASF2807 (section: .debug_str)
ERROR: modpost: __ex_table+0x18a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a8 (section: __ex_table) -> .LASF2809 (section: .debug_str)
ERROR: modpost: __ex_table+0x18a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18ac (section: __ex_table) -> .LASF2811 (section: .debug_str)
ERROR: modpost: __ex_table+0x18ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b4 (section: __ex_table) -> .LASF2813 (section: .debug_str)
ERROR: modpost: __ex_table+0x18b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b8 (section: __ex_table) -> .LASF2811 (section: .debug_str)
ERROR: modpost: __ex_table+0x18b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18c0 (section: __ex_table) -> .LASF2816 (section: .debug_str)
ERROR: modpost: __ex_table+0x18c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18c4 (section: __ex_table) -> .LASF2811 (section: .debug_str)
ERROR: modpost: __ex_table+0x18c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18cc (section: __ex_table) -> .LASF2819 (section: .debug_str)
ERROR: modpost: __ex_table+0x18cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d0 (section: __ex_table) -> .LASF2811 (section: .debug_str)
ERROR: modpost: __ex_table+0x18d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d8 (section: __ex_table) -> .LASF2822 (section: .debug_str)
ERROR: modpost: __ex_table+0x18d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18dc (section: __ex_table) -> .LASF2811 (section: .debug_str)
ERROR: modpost: __ex_table+0x18dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e4 (section: __ex_table) -> .LASF2825 (section: .debug_str)
ERROR: modpost: __ex_table+0x18e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e8 (section: __ex_table) -> .LASF2811 (section: .debug_str)
ERROR: modpost: __ex_table+0x18e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f8 (section: __ex_table) -> .LASF95 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19fc (section: __ex_table) -> .LASF97 (section: .debug_str)
ERROR: modpost: __ex_table+0x19fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: __ex_table) -> .LASF99 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: __ex_table) -> .LASF101 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> .LASF3173 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> .LASF3175 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a1c (section: __ex_table) -> .LASF3177 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a20 (section: __ex_table) -> .LASF3179 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a28 (section: __ex_table) -> .LASF3181 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a2c (section: __ex_table) -> .LASF3183 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a34 (section: __ex_table) -> .LASF3185 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a38 (section: __ex_table) -> .LASF3187 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a40 (section: __ex_table) -> .LASF3189 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a44 (section: __ex_table) -> .LASF3191 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a4c (section: __ex_table) -> .LASF3193 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a50 (section: __ex_table) -> .LASF3195 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a58 (section: __ex_table) -> .LASF793 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a5c (section: __ex_table) -> .LASF795 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a64 (section: __ex_table) -> .LASF797 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a68 (section: __ex_table) -> .LASF799 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a70 (section: __ex_table) -> .LASF801 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a74 (section: __ex_table) -> .LASF803 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a7c (section: __ex_table) -> .LASF805 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a80 (section: __ex_table) -> .LASF807 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a88 (section: __ex_table) -> .LASF809 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a88 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
