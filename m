Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C3170808
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 04:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754539435; cv=none; b=ZCVfe5P6+a3NzbPykZvlhiY3mhPa0wfGmkE1Al8Qu95IRQpSWQ1ssM0ESrhEn4TE3KzV8ZBoNqSI9x/wa0V8k61hA7DyLyXfdytKcwso4dbos/ob+WkpNZ7CKfijhXALO3olwhsIVk6u5xXhLrtorsKCv3uarbER8dWPvSQNW9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754539435; c=relaxed/simple;
	bh=+kfs2B0V8kGGIabF8VUSuYRS9Iu07MUf+/+GIV7koRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YX4RDstxpG9DIlTEGRvd/LmNdjAHVkmkRbyuJV0Z1Cl2X9JGGBy4UNxrZCUZS+6NgJ5b5liz1u+ZHFKx1q4hBG8eJDmXijfOkEdVyDRj2Nsm7YhphG2/XNmDqSRXsw4/lWe4wvDjaQMM8IGs4Jjxy96fU5M0IfaA4aSWUAzNVu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RsYjdF53; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsYjdF53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754539432; x=1786075432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+kfs2B0V8kGGIabF8VUSuYRS9Iu07MUf+/+GIV7koRA=;
  b=RsYjdF53HyUDnAzJyHC1wyeygY6G2RQUEf73deH5D3PNzehH3KYLKOSb
   ONK/+bXZnpmptpeqaMBkPGkbFYMaOLaVN2Rg+k14q5eBF+KTYO/aA7X7r
   Neb0PuihWB132+Fd0HtmMI/i7O5WRw7Xu7KgkwmAi2QIZQrrZz3sFYVER
   L1aq/gCLsuaTutPPFOaoOpM0U/rh1EbWnlr9XHMVdN7aFSJwO3f7CvzFH
   eK3SUvpJdjzvv+MEhsQNI2WVvirPtisBsOwbGUE/CR+USLDe514dcFvsx
   Fd5YIKXpDsfJjBlhyeb9zVxAPJvAEkreIAm0VOxOfPtXdYBTflw6H0wZ3
   g==;
X-CSE-ConnectionGUID: u4CUt7CiQHOp3NefJOgOmw==
X-CSE-MsgGUID: 2trVDoaQS6+uOaPLTJXZ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="55901997"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="55901997"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 21:03:51 -0700
X-CSE-ConnectionGUID: vbwi7i1TS0qxAaomV3YqeA==
X-CSE-MsgGUID: YqBgIi/BQEKoE6PPygPDNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164849413"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Aug 2025 21:03:49 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujrr1-0002Lw-0N;
	Thu, 07 Aug 2025 04:03:47 +0000
Date: Thu, 7 Aug 2025 12:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [sj:mm-new 42/45] ERROR: modpost: __ex_table+0x1584 references
 non-executable section '.rodata.spk_ttyio_synth_probe.str1.4'
Message-ID: <202508071131.KsUs9Est-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git mm-new
head:   b2a4beca30ba51331a16d7bb84387a70b692a66d
commit: 607a455e2f3d528b71be200e1e18e578273a602e [42/45] mm: change vma_start_read() to drop RCU lock on failure
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071131.KsUs9Est-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071131.KsUs9Est-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071131.KsUs9Est-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: node_get+0x3a (section: .text.node_get) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: qrtr_ns_worker+0x30 (section: .text.qrtr_ns_worker) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: qrtr_ns_worker+0x110 (section: .text.qrtr_ns_worker) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: qrtr_ns_worker+0x312 (section: .text.qrtr_ns_worker) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: qrtr_tun_open+0xe (section: .text.qrtr_tun_open) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdp_put_umem+0x54 (section: .text.xdp_put_umem) -> soc_bus_register (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdp_put_umem+0x68 (section: .text.xdp_put_umem) -> register_cpufreq_notifier (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdp_umem_create+0x1c (section: .text.xdp_umem_create) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdp_umem_create+0x244 (section: .text.xdp_umem_create) -> register_cpufreq_notifier (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xdp_umem_create+0x25a (section: .text.xdp_umem_create) -> soc_bus_register (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xskq_create+0xe (section: .text.xskq_create) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x5c (section: .text.xp_dma_map) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x98 (section: .text.ida_alloc_range) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x316 (section: .text.ida_alloc_range) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: kset_create_and_add+0x10 (section: .text.kset_create_and_add) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_create_and_add+0xe (section: .text.kobject_create_and_add) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: uevent_net_init+0xe (section: .text.uevent_net_init) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_env+0x72 (section: .text.kobject_uevent_env) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_env+0x324 (section: .text.kobject_uevent_env) -> .LVL169 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_env+0x32c (section: .text.kobject_uevent_env) -> .LVL171 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_uevent_env+0x360 (section: .text.kobject_uevent_env) -> .LVL170 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobject_synth_uevent+0x106 (section: .text.kobject_synth_uevent) -> wm8994_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x1a (section: .text.mas_get_slot) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x22 (section: .text.mas_get_slot) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x3a (section: .text.mas_get_slot) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x50 (section: .text.mas_get_slot) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x60 (section: .text.mas_get_slot) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x6a (section: .text.mas_get_slot) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x74 (section: .text.mas_get_slot) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x80 (section: .text.mas_get_slot) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0x9a (section: .text.mas_get_slot) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0xb8 (section: .text.mas_get_slot) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0xc0 (section: .text.mas_get_slot) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_get_slot+0xd4 (section: .text.mas_get_slot) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0xf2 (section: .text.mas_empty_area_rev) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x156 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x1a2 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x230 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x238 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x240 (section: .text.mt_validate) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x30c (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x314 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x65e (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x6bc (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x6d0 (section: .text.mt_validate) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x4ae (section: .text.mas_spanning_rebalance) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x4c6 (section: .text.mas_spanning_rebalance) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x586 (section: .text.mas_spanning_rebalance) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x590 (section: .text.mas_spanning_rebalance) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x852 (section: .text.mas_spanning_rebalance) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x87c (section: .text.mas_spanning_rebalance) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x916 (section: .text.mas_spanning_rebalance) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0x968 (section: .text.mas_spanning_rebalance) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0xa3e (section: .text.mas_spanning_rebalance) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0xa46 (section: .text.mas_spanning_rebalance) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0xaa2 (section: .text.mas_spanning_rebalance) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_spanning_rebalance+0xaa6 (section: .text.mas_spanning_rebalance) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_spanning_store.isra.63+0x15c (section: .text.mas_wr_spanning_store.isra.63) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_spanning_store.isra.63+0x2a2 (section: .text.mas_wr_spanning_store.isra.63) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_bnode+0x46 (section: .text.mas_wr_bnode) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_bnode+0x60e (section: .text.mas_wr_bnode) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_path+0x44 (section: .text.seq_buf_path) -> wcd934x_slim_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: number+0x76 (section: .text.number) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: number+0x98 (section: .text.number) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: number+0x9c (section: .text.number) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: number+0xa2 (section: .text.number) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: number+0xbc (section: .text.number) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0xd0 (section: .text.resource_string.isra.12) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0xda (section: .text.resource_string.isra.12) -> virtio_nsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x158 (section: .text.resource_string.isra.12) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x1ce (section: .text.resource_string.isra.12) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x252 (section: .text.resource_string.isra.12) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x2bc (section: .text.resource_string.isra.12) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x2ec (section: .text.resource_string.isra.12) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: clock.isra.14+0x28 (section: .text.clock.isra.14) -> virtio_nsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dentry_name+0x46 (section: .text.dentry_name) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dentry_name+0x70 (section: .text.dentry_name) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dentry_name+0x1d4 (section: .text.dentry_name) -> virtio_nsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dentry_name+0x21e (section: .text.dentry_name) -> virtio_nsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x8a (section: .text.pointer) -> virtio_nsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_store+0xa4 (section: .text.xas_store) -> pm860x_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_store+0x5be (section: .text.xas_store) -> pm860x_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_alloc_cyclic+0x9e (section: .text.__xa_alloc_cyclic) -> pm860x_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x16 (section: .text.__xa_insert) -> pm860x_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x3e (section: .text.__xa_insert) -> pm860x_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x46 (section: .text.__xa_insert) -> pm860x_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x54 (section: .text.__xa_insert) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x62 (section: .text.__xa_insert) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x7a (section: .text.__xa_insert) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x84 (section: .text.__xa_insert) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x90 (section: .text.__xa_insert) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __xa_insert+0x9a (section: .text.__xa_insert) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_extract+0x564 (section: .text.xa_extract) -> pm860x_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0x38 (section: .text.xa_load) -> pm860x_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0x3c (section: .text.xa_load) -> pm860x_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0x4e (section: .text.xa_load) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_load+0xaa (section: .text.xa_load) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.efi_parse_options) -> stmpe_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x4 (section: .init.text.efi_parse_options) -> stmpe_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> 0x0 (section: .rodata.spk_ttyio_synth_probe.str1.4)
>> ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.spk_ttyio_synth_probe.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> 0x0 (section: .rodata.spk_synth_is_alive_restart.str1.4)
>> ERROR: modpost: __ex_table+0x1588 references non-executable section '.rodata.spk_synth_is_alive_restart.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> 0x0 (section: .rodata.spk_set_num_var)
>> ERROR: modpost: __ex_table+0x1590 references non-executable section '.rodata.spk_set_num_var'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> 0x0 (section: .rodata.spk_get_var.str1.4)
>> ERROR: modpost: __ex_table+0x1594 references non-executable section '.rodata.spk_get_var.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x159c (section: __ex_table) -> __func__ (section: .rodata.__func__.53540)
ERROR: modpost: __ex_table+0x159c references non-executable section '.rodata.__func__.53540'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a0 (section: __ex_table) -> 0x0 (section: .rodata.spk_get_var.str1.4)
ERROR: modpost: __ex_table+0x15a0 references non-executable section '.rodata.spk_get_var.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a8 (section: __ex_table) -> .LASF4598 (section: .debug_str)
ERROR: modpost: __ex_table+0x15a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15ac (section: __ex_table) -> .LASF4600 (section: .debug_str)
ERROR: modpost: __ex_table+0x15ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b4 (section: __ex_table) -> .LASF4602 (section: .debug_str)
ERROR: modpost: __ex_table+0x15b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b8 (section: __ex_table) -> .LASF4604 (section: .debug_str)
ERROR: modpost: __ex_table+0x15b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c0 (section: __ex_table) -> .LASF4606 (section: .debug_str)
ERROR: modpost: __ex_table+0x15c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c4 (section: __ex_table) -> .LASF4608 (section: .debug_str)
ERROR: modpost: __ex_table+0x15c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15cc (section: __ex_table) -> .LASF4610 (section: .debug_str)
ERROR: modpost: __ex_table+0x15cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d0 (section: __ex_table) -> .LASF4608 (section: .debug_str)
ERROR: modpost: __ex_table+0x15d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d8 (section: __ex_table) -> .LASF4613 (section: .debug_str)
ERROR: modpost: __ex_table+0x15d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15dc (section: __ex_table) -> .LASF4608 (section: .debug_str)
ERROR: modpost: __ex_table+0x15dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF762 (section: .debug_str)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF764 (section: .debug_str)
ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF766 (section: .debug_str)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF768 (section: .debug_str)
ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1680 (section: __ex_table) -> .LASF770 (section: .debug_str)
ERROR: modpost: __ex_table+0x1680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1684 (section: __ex_table) -> .LASF772 (section: .debug_str)
ERROR: modpost: __ex_table+0x1684 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x168c (section: __ex_table) -> .LASF774 (section: .debug_str)
ERROR: modpost: __ex_table+0x168c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1690 (section: __ex_table) -> .LASF768 (section: .debug_str)
ERROR: modpost: __ex_table+0x1690 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1698 (section: __ex_table) -> .LASF777 (section: .debug_str)
ERROR: modpost: __ex_table+0x1698 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x169c (section: __ex_table) -> .LASF768 (section: .debug_str)
ERROR: modpost: __ex_table+0x169c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a4 (section: __ex_table) -> .LASF780 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a8 (section: __ex_table) -> .LASF782 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b0 (section: __ex_table) -> printk_trace (section: .data.rel.local.printk_trace)
ERROR: modpost: __ex_table+0x16b0 references non-executable section '.data.rel.local.printk_trace'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b4 (section: __ex_table) -> trace_die_notifier (section: .data.rel.local.trace_die_notifier)
ERROR: modpost: __ex_table+0x16b4 references non-executable section '.data.rel.local.trace_die_notifier'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16bc (section: __ex_table) -> trace_panic_notifier (section: .data.rel.local.trace_panic_notifier)
ERROR: modpost: __ex_table+0x16bc references non-executable section '.data.rel.local.trace_panic_notifier'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c0 (section: __ex_table) -> tracepoint_printk_mutex (section: .data.rel.local.tracepoint_printk_mutex)
ERROR: modpost: __ex_table+0x16c0 references non-executable section '.data.rel.local.tracepoint_printk_mutex'
WARNING: modpost: vmlinux: section mismatch in reference: 0x180c (section: __ex_table) -> .LASF3916 (section: .debug_str)
ERROR: modpost: __ex_table+0x180c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1818 (section: __ex_table) -> .LASF3917 (section: .debug_str)
ERROR: modpost: __ex_table+0x1818 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1824 (section: __ex_table) -> .LLST172 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1824 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1848 (section: __ex_table) -> .LASF3922 (section: .debug_str)
ERROR: modpost: __ex_table+0x1848 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1854 (section: __ex_table) -> .LLST161 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1854 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1858 (section: __ex_table) -> .LASF3923 (section: .debug_str)
ERROR: modpost: __ex_table+0x1858 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1860 (section: __ex_table) -> .LASF78 (section: .debug_str)
ERROR: modpost: __ex_table+0x1860 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1864 (section: __ex_table) -> .LASF80 (section: .debug_str)
ERROR: modpost: __ex_table+0x1864 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x186c (section: __ex_table) -> .LASF82 (section: .debug_str)
ERROR: modpost: __ex_table+0x186c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1870 (section: __ex_table) -> .LASF84 (section: .debug_str)
ERROR: modpost: __ex_table+0x1870 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1878 (section: __ex_table) -> .LASF86 (section: .debug_str)
ERROR: modpost: __ex_table+0x1878 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x187c (section: __ex_table) -> .LASF88 (section: .debug_str)
ERROR: modpost: __ex_table+0x187c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1884 (section: __ex_table) -> .LASF90 (section: .debug_str)
ERROR: modpost: __ex_table+0x1884 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1888 (section: __ex_table) -> .LASF92 (section: .debug_str)
ERROR: modpost: __ex_table+0x1888 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1890 (section: __ex_table) -> .LASF94 (section: .debug_str)
ERROR: modpost: __ex_table+0x1890 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1894 (section: __ex_table) -> .LASF96 (section: .debug_str)
ERROR: modpost: __ex_table+0x1894 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x189c (section: __ex_table) -> .LASF98 (section: .debug_str)
ERROR: modpost: __ex_table+0x189c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a0 (section: __ex_table) -> .LASF100 (section: .debug_str)
ERROR: modpost: __ex_table+0x18a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a8 (section: __ex_table) -> .LASF102 (section: .debug_str)
ERROR: modpost: __ex_table+0x18a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18ac (section: __ex_table) -> .LASF104 (section: .debug_str)
ERROR: modpost: __ex_table+0x18ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b4 (section: __ex_table) -> .LASF106 (section: .debug_str)
ERROR: modpost: __ex_table+0x18b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b8 (section: __ex_table) -> .LASF104 (section: .debug_str)
ERROR: modpost: __ex_table+0x18b8 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
