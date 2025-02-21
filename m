Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA793A31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740142866; cv=none; b=bpKlkeuQxCKCLN+6MzIY5s4349uzBiLLKkbXYUpHf9S6GYnQAlkNucDFOCnfId6l6jfcJRYIXE93ViM8/pY+gUD5IkeVMe6dJXnH2Pe8I/cSTH9dKGCdxbvdO7+wgNIaGHSyz7Z83XjXGdGZ2gowf7ocgKUiXNYBz6WE9OgcoiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740142866; c=relaxed/simple;
	bh=o9UnwFJSPu5oh4kjBw3Ido8HjzE7zwAEbjsnVj6KQHI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mpiewVIjgUmvNvmp4tcSKwaPib3OV95N+hj6SboS3M8KcJNe2f9u+mspHw4UUgluKpM7JDxXVL+EIW7qq47e1Lahi2E3VVesUTHTWNVG6U8jZey63Y5IWUKLPvBjtmvlZMbL+pcnn6ZIZRwCYm2DFkdF6V6GcZNigfag+Uu6IrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOt/sk53; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOt/sk53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740142865; x=1771678865;
  h=date:from:cc:subject:message-id:mime-version;
  bh=o9UnwFJSPu5oh4kjBw3Ido8HjzE7zwAEbjsnVj6KQHI=;
  b=ZOt/sk53G6neOuc2FphZ6Q9G0JN6hX78ovMuVwuqT7/uLJW3lhP3b98c
   GnatyBKvnxE8aL3Bpcu+x81seLuN3BraicCG33RwY4m+4ek++4zFAbjGc
   K9XtmoyuT4Cx0BhbtxP6rXYZsDDOec3vQMEZT2NeaQkoRYIkOsZYCQfvN
   Sv7jR8U5LPU1vtp1LWnYA3cVeDv+buydFfotB8km+JOCbSAvhgHJ+wrpt
   KB7DXv9lbo7zgdicHstPPenmeNK9fCxOOR/taDxrotkO5xapCPWTfizVU
   ICluQpxpo2llMeAX2fIb2CX1bEaDyzUnZazK/vzSL3PqaB+p3u/kl3O5h
   Q==;
X-CSE-ConnectionGUID: kjf4TT9oSCq+D7/RK4iEdA==
X-CSE-MsgGUID: oFlFnKKZSVSjhayuKgB+CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40149879"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="40149879"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 05:01:04 -0800
X-CSE-ConnectionGUID: fSlXeTxrRJSZlnlWh/PcWA==
X-CSE-MsgGUID: EAxj6RvsTvWle0GJxviX/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115895569"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Feb 2025 05:01:03 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlSeL-0005XD-0L
	for oe-kbuild-all@lists.linux.dev;
	Fri, 21 Feb 2025 13:01:01 +0000
Date: Fri, 21 Feb 2025 21:00:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1]
 drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:308:34: warning:
 'pcie_perf_stall_stats_desc' defined but not used
Message-ID: <202502212017.bIFuv1Kz-lkp@intel.com>
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
commit: 73e90646a275aeffea263305c8662f8dd0cb41ef [1/1] net/mlx5e: Add PCIe outbound stalls counters
config: xtensa-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250221/202502212017.bIFuv1Kz-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502212017.bIFuv1Kz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502212017.bIFuv1Kz-lkp@intel.com/

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
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:438:34: warning: 'mlx5e_pme_error_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc mlx5e_pme_error_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:434:34: warning: 'mlx5e_pme_status_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc mlx5e_pme_status_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:379:34: warning: 'sq_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc sq_stats_desc[] = {
                                     ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:338:34: warning: 'rq_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc rq_stats_desc[] = {
                                     ^~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:308:34: warning: 'pcie_perf_stall_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stall_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:303:34: warning: 'pcie_perf_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:284:34: warning: 'pport_per_prio_pfc_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_per_prio_pfc_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:277:34: warning: 'pport_per_prio_traffic_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_per_prio_traffic_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:272:34: warning: 'pport_phy_statistical_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_phy_statistical_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:256:34: warning: 'pport_2819_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_2819_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:250:34: warning: 'pport_2863_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_2863_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:229:34: warning: 'pport_802_3_stats_desc' defined but not used [-Wunused-const-variable=]
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
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:438:34: warning: 'mlx5e_pme_error_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc mlx5e_pme_error_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:434:34: warning: 'mlx5e_pme_status_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc mlx5e_pme_status_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:379:34: warning: 'sq_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc sq_stats_desc[] = {
                                     ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:338:34: warning: 'rq_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc rq_stats_desc[] = {
                                     ^~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:308:34: warning: 'pcie_perf_stall_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stall_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:303:34: warning: 'pcie_perf_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:284:34: warning: 'pport_per_prio_pfc_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_per_prio_pfc_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:277:34: warning: 'pport_per_prio_traffic_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_per_prio_traffic_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:272:34: warning: 'pport_phy_statistical_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_phy_statistical_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:256:34: warning: 'pport_2819_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_2819_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:250:34: warning: 'pport_2863_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pport_2863_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:229:34: warning: 'pport_802_3_stats_desc' defined but not used [-Wunused-const-variable=]
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


vim +/pcie_perf_stall_stats_desc +308 drivers/net/ethernet/mellanox/mlx5/core/en_stats.h

   307	
 > 308	static const struct counter_desc pcie_perf_stall_stats_desc[] = {
   309		{ "outbound_pci_stalled_rd", PCIE_PERF_OFF(outbound_stalled_reads) },
   310		{ "outbound_pci_stalled_wr", PCIE_PERF_OFF(outbound_stalled_writes) },
   311		{ "outbound_pci_stalled_rd_events", PCIE_PERF_OFF(outbound_stalled_reads_events) },
   312		{ "outbound_pci_stalled_wr_events", PCIE_PERF_OFF(outbound_stalled_writes_events) },
   313	};
   314	
   315	struct mlx5e_rq_stats {
   316		u64 packets;
   317		u64 bytes;
   318		u64 csum_complete;
   319		u64 csum_unnecessary_inner;
   320		u64 csum_none;
   321		u64 lro_packets;
   322		u64 lro_bytes;
   323		u64 xdp_drop;
   324		u64 xdp_tx;
   325		u64 xdp_tx_full;
   326		u64 wqe_err;
   327		u64 mpwqe_filler;
   328		u64 buff_alloc_err;
   329		u64 cqe_compress_blks;
   330		u64 cqe_compress_pkts;
   331		u64 page_reuse;
   332		u64 cache_reuse;
   333		u64 cache_full;
   334		u64 cache_empty;
   335		u64 cache_busy;
   336	};
   337	
   338	static const struct counter_desc rq_stats_desc[] = {
   339		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, packets) },
   340		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, bytes) },
   341		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, csum_complete) },
   342		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, csum_unnecessary_inner) },
   343		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, csum_none) },
   344		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, xdp_drop) },
   345		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, xdp_tx) },
   346		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, xdp_tx_full) },
   347		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, lro_packets) },
   348		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, lro_bytes) },
   349		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, wqe_err) },
   350		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, mpwqe_filler) },
   351		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, buff_alloc_err) },
   352		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, cqe_compress_blks) },
   353		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, cqe_compress_pkts) },
   354		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, page_reuse) },
   355		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, cache_reuse) },
   356		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, cache_full) },
   357		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, cache_empty) },
   358		{ MLX5E_DECLARE_RX_STAT(struct mlx5e_rq_stats, cache_busy) },
   359	};
   360	
   361	struct mlx5e_sq_stats {
   362		/* commonly accessed in data path */
   363		u64 packets;
   364		u64 bytes;
   365		u64 xmit_more;
   366		u64 tso_packets;
   367		u64 tso_bytes;
   368		u64 tso_inner_packets;
   369		u64 tso_inner_bytes;
   370		u64 csum_partial_inner;
   371		u64 nop;
   372		/* less likely accessed in data path */
   373		u64 csum_none;
   374		u64 stopped;
   375		u64 wake;
   376		u64 dropped;
   377	};
   378	
   379	static const struct counter_desc sq_stats_desc[] = {
   380		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, packets) },
   381		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, bytes) },
   382		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, tso_packets) },
   383		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, tso_bytes) },
   384		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, tso_inner_packets) },
   385		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, tso_inner_bytes) },
   386		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, csum_partial_inner) },
   387		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, nop) },
   388		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, csum_none) },
   389		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, stopped) },
   390		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, wake) },
   391		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, dropped) },
   392		{ MLX5E_DECLARE_TX_STAT(struct mlx5e_sq_stats, xmit_more) },
   393	};
   394	
   395	#define NUM_SW_COUNTERS			ARRAY_SIZE(sw_stats_desc)
   396	#define NUM_Q_COUNTERS			ARRAY_SIZE(q_stats_desc)
   397	#define NUM_VPORT_COUNTERS		ARRAY_SIZE(vport_stats_desc)
   398	#define NUM_PPORT_802_3_COUNTERS	ARRAY_SIZE(pport_802_3_stats_desc)
   399	#define NUM_PPORT_2863_COUNTERS		ARRAY_SIZE(pport_2863_stats_desc)
   400	#define NUM_PPORT_2819_COUNTERS		ARRAY_SIZE(pport_2819_stats_desc)
   401	#define NUM_PPORT_PHY_STATISTICAL_COUNTERS(priv) \
   402		(ARRAY_SIZE(pport_phy_statistical_stats_desc) * \
   403		 MLX5_CAP_PCAM_FEATURE((priv)->mdev, ppcnt_statistical_group))
   404	#define NUM_PCIE_PERF_COUNTERS(priv) \
   405		(ARRAY_SIZE(pcie_perf_stats_desc) * \
   406		 MLX5_CAP_MCAM_FEATURE((priv)->mdev, pcie_performance_group))
   407	#define NUM_PCIE_PERF_STALL_COUNTERS(priv) \
   408		(ARRAY_SIZE(pcie_perf_stall_stats_desc) * \
   409		 MLX5_CAP_MCAM_FEATURE((priv)->mdev, pcie_outbound_stalled))
   410	#define NUM_PPORT_PER_PRIO_TRAFFIC_COUNTERS \
   411		ARRAY_SIZE(pport_per_prio_traffic_stats_desc)
   412	#define NUM_PPORT_PER_PRIO_PFC_COUNTERS \
   413		ARRAY_SIZE(pport_per_prio_pfc_stats_desc)
   414	#define NUM_PPORT_COUNTERS(priv)	(NUM_PPORT_802_3_COUNTERS + \
   415						 NUM_PPORT_2863_COUNTERS  + \
   416						 NUM_PPORT_2819_COUNTERS  + \
   417						 NUM_PPORT_PHY_STATISTICAL_COUNTERS(priv) + \
   418						 NUM_PPORT_PER_PRIO_TRAFFIC_COUNTERS * \
   419						 NUM_PPORT_PRIO)
   420	#define NUM_PCIE_COUNTERS(priv)		(NUM_PCIE_PERF_COUNTERS(priv) + \
   421						 NUM_PCIE_PERF_STALL_COUNTERS(priv))
   422	#define NUM_RQ_STATS			ARRAY_SIZE(rq_stats_desc)
   423	#define NUM_SQ_STATS			ARRAY_SIZE(sq_stats_desc)
   424	
   425	struct mlx5e_stats {
   426		struct mlx5e_sw_stats sw;
   427		struct mlx5e_qcounter_stats qcnt;
   428		struct mlx5e_vport_stats vport;
   429		struct mlx5e_pport_stats pport;
   430		struct rtnl_link_stats64 vf_vport;
   431		struct mlx5e_pcie_stats pcie;
   432	};
   433	
 > 434	static const struct counter_desc mlx5e_pme_status_desc[] = {
   435		{ "module_unplug", 8 },
   436	};
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
