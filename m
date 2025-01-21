Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BE11AB53A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 05:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737437449; cv=none; b=Xxt8o8cPe0oNTkUJRojEiZHScc5qIMzCnMmbDpX4v9MRF8U3chzPn9EQhmEljabUqw19rOGYyXnkOtczNKLKa7OiDtGBzZSj31nEhl1HInwDPhts2i1Jj6xP5x0g8r4TdO/yVC1VpHlJoVT4vbjlvhYOx2oMakYNTaWhRF0jFAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737437449; c=relaxed/simple;
	bh=xKLuEABgfjkU7tyy2bPXKu3F3gAcyuYyCiATrRr0s9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qgehmysklMIApJB3lAzeqVK8o4gEjHzVgKgjDl+irxIBOylDNVCmlP5pw6MkFapXYfMTWz9xNEY+wZsM0g7dbTHVJ/dH8g9pAoi7fgXhYN6gSvO8AoB3JhhJ7GyOHVxksKIOtb7JzIEO1YG1PRXoDlu1FH2DF5Sr9kQzkfQT1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzY9O/5B; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzY9O/5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737437447; x=1768973447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xKLuEABgfjkU7tyy2bPXKu3F3gAcyuYyCiATrRr0s9w=;
  b=lzY9O/5B8kgAsoFsqM/EDfXxPTVZmVNe4sUDVfKzlcIa0jqonw0sZsVg
   frgCSeBRkTjWthcufcGe3REnBlUH5ANy5cEea+SeznpHiGPbguFs3bxip
   Kx9gqjjpuT/1FbCrrKdQU3VU/nMs7ZW9IEsaCLWHvywc/x4MQ6tAj8bYf
   gVNAkojTAbuzmhf0fyvTx/IR0MEmabQzcOOLwiGqrDBkAaxqo/lWZrZzN
   s6FeoBzu7S+Ug/3bGazUbqi7iSHXBKROB2u8tvAln1cmzxxLCDcpyqJdR
   p1A+id0VUHCMs0oiitYkCoRdFQJpUC/G6F0WMdnXJtlVS4mGj822F/o7h
   A==;
X-CSE-ConnectionGUID: 2Z3odv1nQlCamC3nr/mOtA==
X-CSE-MsgGUID: gX7z2EXhRDuv7eaNck2RFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="38080066"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="38080066"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 21:30:44 -0800
X-CSE-ConnectionGUID: ZnmFZWS+Tp6KvJzDbwQ+wg==
X-CSE-MsgGUID: WLThK6sDRAiRM5QigBxYHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111672838"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jan 2025 21:30:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta6qX-000Xf1-05;
	Tue, 21 Jan 2025 05:30:41 +0000
Date: Tue, 21 Jan 2025 13:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-07 1/1]
 drivers/net/ethernet/mellanox/mlx5/core/en/txrx.h:448:44: warning: result of
 comparison of constant 256 with expression of type 'u8' (aka 'unsigned
 char') is always false
Message-ID: <202501211337.6uzyHbZh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maxim,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-07
head:   3467130f5b435e716d658adb8ea3d185e9f7ec96
commit: f9c955b4fe5c8626d11b8a9b93ccc0ba77358fec [1/1] net/mlx5e: Add missing sanity checks for max TX WQE size
config: arm64-randconfig-r053-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211337.6uzyHbZh-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211337.6uzyHbZh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211337.6uzyHbZh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mellanox/mlx5/core/en/channels.c:5:
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en.h:35:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1748:
   include/linux/vmstat.h:502:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:530:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     530 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     531 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en/channels.c:6:
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en/ptp.h:9:
>> drivers/net/ethernet/mellanox/mlx5/core/en/txrx.h:448:44: warning: result of comparison of constant 256 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     448 |         WARN_ON_ONCE(PAGE_SIZE / MLX5_SEND_WQE_BB < mlx5e_get_max_sq_wqebbs(mdev));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   6 warnings generated.
--
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en/xsk/rx.c:4:
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en/xsk/rx.h:7:
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en.h:35:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1748:
   include/linux/vmstat.h:502:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:530:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     530 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     531 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en/xsk/rx.c:5:
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h:38:
>> drivers/net/ethernet/mellanox/mlx5/core/en/txrx.h:448:44: warning: result of comparison of constant 256 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     448 |         WARN_ON_ONCE(PAGE_SIZE / MLX5_SEND_WQE_BB < mlx5e_get_max_sq_wqebbs(mdev));
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xsk/rx.c:176:3: warning: array index 0 is past the end of the array (that has type 'struct mlx5_wqe_data_seg[0]') [-Warray-bounds]
     176 |                 wqe->data[0].addr = cpu_to_be64(addr + rq->buff.headroom);
         |                 ^         ~
   drivers/net/ethernet/mellanox/mlx5/core/en.h:250:2: note: array 'data' declared here
     250 |         struct mlx5_wqe_data_seg      data[0];
         |         ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xsk/rx.c:202:3: warning: array index 0 is past the end of the array (that has type 'struct mlx5_wqe_data_seg[0]') [-Warray-bounds]
     202 |                 wqe->data[0].addr = cpu_to_be64(addr + rq->buff.headroom);
         |                 ^         ~
   drivers/net/ethernet/mellanox/mlx5/core/en.h:250:2: note: array 'data' declared here
     250 |         struct mlx5_wqe_data_seg      data[0];
         |         ^
   8 warnings generated.


vim +448 drivers/net/ethernet/mellanox/mlx5/core/en/txrx.h

   445	
   446	static inline u16 mlx5e_stop_room_for_wqe(struct mlx5_core_dev *mdev, u16 wqe_size)
   447	{
 > 448		WARN_ON_ONCE(PAGE_SIZE / MLX5_SEND_WQE_BB < mlx5e_get_max_sq_wqebbs(mdev));
   449	
   450		/* A WQE must not cross the page boundary, hence two conditions:
   451		 * 1. Its size must not exceed the page size.
   452		 * 2. If the WQE size is X, and the space remaining in a page is less
   453		 *    than X, this space needs to be padded with NOPs. So, one WQE of
   454		 *    size X may require up to X-1 WQEBBs of padding, which makes the
   455		 *    stop room of X-1 + X.
   456		 * WQE size is also limited by the hardware limit.
   457		 */
   458		WARN_ONCE(wqe_size > mlx5e_get_max_sq_wqebbs(mdev),
   459			  "wqe_size %u is greater than max SQ WQEBBs %u",
   460			  wqe_size, mlx5e_get_max_sq_wqebbs(mdev));
   461	
   462		return MLX5E_STOP_ROOM(wqe_size);
   463	}
   464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
