Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1111E7C2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740152834; cv=none; b=n7S1xtKJN0xMlSZUpuKrr5IOWmotXb0suSsSND98uX4EpxzHJgB+KCQSDjV42drtVX8xEp17EpEi4huZKyThsTj0spR5/z+WkrtmvzK+95S11Z5YnCL9r9sCW319ELAW7sSAAujkXuO1L5tyfX6ErtRI56a01z+BUxtEvP6Jl1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740152834; c=relaxed/simple;
	bh=u0lK3Cq/9EStUQkBYDfifYYu/iVYUY6q481roJUTiSI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PZzUJamH+wpwFQQXQM4T7Gm7P+1VMzDPLBHsIZyg+NUbWO6UEY7+GF2lMjCRWftxjvME4AjxLPfmkrZVW9nt1Zai6wiImITJtYwTrS+szl++2iWCxXIDZ/mBkAuSbnH+TGHXrR5MR8mbVOq0dKFENPKvVeEWI/jZxILrW+Ov/3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8jgVacx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8jgVacx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740152832; x=1771688832;
  h=date:from:cc:subject:message-id:mime-version;
  bh=u0lK3Cq/9EStUQkBYDfifYYu/iVYUY6q481roJUTiSI=;
  b=X8jgVacx6OO/5PO3ss/G0x55trNcmGWr31e5sOKkzaDegkBt7YFgGuMC
   Nj1LTDQ4LPuhJvxwj7/hGMyvwf5RByFEkPO1HJgfW+UfODU4RRMLFR1sj
   5fr2JOdS/t9kmq4FBAYcUZC6CMPrpIWXk3y5khEbXfdTBVm8IPe+XB3vN
   dSkEd695zvtFhEMgRn+T/67KspzTJc4NeEd2A9ZqbPSmM4ZCxvWywx1Yi
   8QviYmW1HSEWBH1pGUen/h387b3Amq9Oa2hQc9TJOG2JznU+0x4vZYEMK
   ToIMyJL7qFAZeCAUig9q9kddTsmB0R87Lp29QECsx6YNBYGqe0bNI/2Qb
   g==;
X-CSE-ConnectionGUID: xv2q74YqR2CkCCrLT16HhQ==
X-CSE-MsgGUID: dnO+LoIZRPyZaYhVclOIAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="28568757"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="28568757"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 07:47:11 -0800
X-CSE-ConnectionGUID: 8x731XGoSVaZr2is9aVxIg==
X-CSE-MsgGUID: ULjk2/VvRx6l5njzeG3+lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115899028"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Feb 2025 07:47:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlVF5-0005gl-2U
	for oe-kbuild-all@lists.linux.dev;
	Fri, 21 Feb 2025 15:47:07 +0000
Date: Fri, 21 Feb 2025 23:46:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1]
 drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:300:34: warning:
 'pport_eth_ext_stats_desc' defined but not used
Message-ID: <202502212302.slRqHSz9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 068aef33bebcb1962720e44525c8d4aff6c2ee3d [1/1] net/mlx5e: Add RX buffer fullness counters
config: xtensa-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250221/202502212302.slRqHSz9-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502212302.slRqHSz9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502212302.slRqHSz9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/prefetch.h:13,
                    from drivers/net/ethernet/mellanox/mlx5/core/en_rx.c:33:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:175:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/dma-mapping.h:331:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:331:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_rx.c: In function 'mlx5e_xdp_handle':
   drivers/net/ethernet/mellanox/mlx5/core/en_rx.c:765:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
      bpf_warn_invalid_xdp_action(act);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_rx.c:766:2: note: here
     case XDP_ABORTED:
     ^~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_rx.c:767:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
      trace_xdp_exception(rq->netdev, prog, act);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_rx.c:768:2: note: here
     case XDP_DROP:
     ^~~~
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en_rx.c:39:0:
   At top level:
   drivers/net/ethernet/mellanox/mlx5/core/en.h:188:19: warning: 'mlx5e_priv_flags' defined but not used [-Wunused-const-variable=]
    static const char mlx5e_priv_flags[][ETH_GSTRING_LEN] = {
                      ^~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en.h:51:0,
                    from drivers/net/ethernet/mellanox/mlx5/core/en_rx.c:39:
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:453:34: warning: 'mlx5e_pme_error_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc mlx5e_pme_error_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:449:34: warning: 'mlx5e_pme_status_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc mlx5e_pme_status_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:390:34: warning: 'sq_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc sq_stats_desc[] = {
                                     ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:349:34: warning: 'rq_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc rq_stats_desc[] = {
                                     ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:319:34: warning: 'pcie_perf_stall_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stall_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:314:34: warning: 'pcie_perf_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:300:34: warning: 'pport_eth_ext_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_eth_ext_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:291:34: warning: 'pport_per_prio_pfc_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_per_prio_pfc_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:284:34: warning: 'pport_per_prio_traffic_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_per_prio_traffic_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:279:34: warning: 'pport_phy_statistical_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_phy_statistical_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:263:34: warning: 'pport_2819_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_2819_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:257:34: warning: 'pport_2863_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_2863_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:236:34: warning: 'pport_802_3_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_802_3_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:145:34: warning: 'vport_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc vport_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:133:34: warning: 'q_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc q_stats_desc[] = {
                                     ^~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:92:34: warning: 'sw_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc sw_stats_desc[] = {
                                     ^~~~~~~~~~~~~
--
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from drivers/net/ethernet/mellanox/mlx5/core/en_fs.c:33:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:175:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/dma-mapping.h:331:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:331:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en_fs.c:38:0:
   At top level:
   drivers/net/ethernet/mellanox/mlx5/core/en.h:188:19: warning: 'mlx5e_priv_flags' defined but not used [-Wunused-const-variable=]
    static const char mlx5e_priv_flags[][ETH_GSTRING_LEN] = {
                      ^~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/mellanox/mlx5/core/en.h:51:0,
                    from drivers/net/ethernet/mellanox/mlx5/core/en_fs.c:38:
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:453:34: warning: 'mlx5e_pme_error_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc mlx5e_pme_error_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:449:34: warning: 'mlx5e_pme_status_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc mlx5e_pme_status_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:390:34: warning: 'sq_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc sq_stats_desc[] = {
                                     ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:349:34: warning: 'rq_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc rq_stats_desc[] = {
                                     ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:319:34: warning: 'pcie_perf_stall_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stall_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:314:34: warning: 'pcie_perf_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:300:34: warning: 'pport_eth_ext_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_eth_ext_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:291:34: warning: 'pport_per_prio_pfc_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_per_prio_pfc_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:284:34: warning: 'pport_per_prio_traffic_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_per_prio_traffic_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:279:34: warning: 'pport_phy_statistical_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_phy_statistical_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:263:34: warning: 'pport_2819_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_2819_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:257:34: warning: 'pport_2863_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_2863_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:236:34: warning: 'pport_802_3_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_802_3_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:145:34: warning: 'vport_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc vport_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:133:34: warning: 'q_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc q_stats_desc[] = {
                                     ^~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:92:34: warning: 'sw_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc sw_stats_desc[] = {
                                     ^~~~~~~~~~~~~


vim +/pport_eth_ext_stats_desc +300 drivers/net/ethernet/mellanox/mlx5/core/en_stats.h

   299	
 > 300	static const struct counter_desc pport_eth_ext_stats_desc[] = {
   301		{ "rx_buffer_passed_thres_phy", PPORT_ETH_EXT_OFF(rx_buffer_almost_full) },
   302	};
   303	
   304	#define PCIE_PERF_OFF(c) \
   305		MLX5_BYTE_OFF(mpcnt_reg, counter_set.pcie_perf_cntrs_grp_data_layout.c)
   306	#define PCIE_PERF_GET(pcie_stats, c) \
   307		MLX5_GET(mpcnt_reg, (pcie_stats)->pcie_perf_counters, \
   308			 counter_set.pcie_perf_cntrs_grp_data_layout.c)
   309	
   310	struct mlx5e_pcie_stats {
   311		__be64 pcie_perf_counters[MLX5_ST_SZ_QW(mpcnt_reg)];
   312	};
   313	
   314	static const struct counter_desc pcie_perf_stats_desc[] = {
   315		{ "rx_pci_signal_integrity", PCIE_PERF_OFF(rx_errors) },
   316		{ "tx_pci_signal_integrity", PCIE_PERF_OFF(tx_errors) },
   317	};
   318	
   319	static const struct counter_desc pcie_perf_stall_stats_desc[] = {
   320		{ "outbound_pci_stalled_rd", PCIE_PERF_OFF(outbound_stalled_reads) },
   321		{ "outbound_pci_stalled_wr", PCIE_PERF_OFF(outbound_stalled_writes) },
   322		{ "outbound_pci_stalled_rd_events", PCIE_PERF_OFF(outbound_stalled_reads_events) },
   323		{ "outbound_pci_stalled_wr_events", PCIE_PERF_OFF(outbound_stalled_writes_events) },
   324	};
   325	
   326	struct mlx5e_rq_stats {
   327		u64 packets;
   328		u64 bytes;
   329		u64 csum_complete;
   330		u64 csum_unnecessary_inner;
   331		u64 csum_none;
   332		u64 lro_packets;
   333		u64 lro_bytes;
   334		u64 xdp_drop;
   335		u64 xdp_tx;
   336		u64 xdp_tx_full;
   337		u64 wqe_err;
   338		u64 mpwqe_filler;
   339		u64 buff_alloc_err;
   340		u64 cqe_compress_blks;
   341		u64 cqe_compress_pkts;
   342		u64 page_reuse;
   343		u64 cache_reuse;
   344		u64 cache_full;
   345		u64 cache_empty;
   346		u64 cache_busy;
   347	};
   348	
 > 349	static const struct counter_desc rq_stats_desc[] = {
   350		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, packets) },
   351		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, bytes) },
   352		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, csum_complete) },
   353		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, csum_unnecessary_inner) },
   354		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, csum_none) },
   355		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, xdp_drop) },
   356		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, xdp_tx) },
   357		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, xdp_tx_full) },
   358		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, lro_packets) },
   359		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, lro_bytes) },
   360		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, wqe_err) },
   361		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, mpwqe_filler) },
   362		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, buff_alloc_err) },
   363		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, cqe_compress_blks) },
   364		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, cqe_compress_pkts) },
   365		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, page_reuse) },
   366		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, cache_reuse) },
   367		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, cache_full) },
   368		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, cache_empty) },
   369		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, cache_busy) },
   370	};
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
