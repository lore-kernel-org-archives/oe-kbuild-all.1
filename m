Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78E7250BE5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740162353; cv=none; b=Bs55Qk8bLlSrwuGZ57F8vZFWFJT5pO2U16G6N/IN8UCRpP16Wx/QcH4AXbUg5EIlpRkG/N5GRETBt0/cAJaEn74pG2WuoSMweK/TCpjj0FclD2e4Ib1g0x8tDy5+5S20uc+erlfzy8BK2X0ZTuk2oDvSY2Pl8WWr4bRduD1loTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740162353; c=relaxed/simple;
	bh=ID94x8KJ4urQlBzL+unPZGMzCTbpzrcCkmoPkFS90IQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rIAxe9+OJQzwLxdPUfOy+sEdKGMTCQXFLiI9jryc006BFvuaGgMZwLlXuPxnq5vjdIs1UHHWMBKAwRBxBF0ujm9My1SXFrjtKJQJ3TdKjS9qr4aC0RsPplqWTVeIvavcanwoceMpiH3Udmv7VcbEUbaBfbh+pew1TuYs6GUnd6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTISXV0M; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTISXV0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740162351; x=1771698351;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ID94x8KJ4urQlBzL+unPZGMzCTbpzrcCkmoPkFS90IQ=;
  b=jTISXV0MKyapnWTf6oHmLm57bOJxNeh4/dc3LptjWmTGfhHSfprA7QvO
   j36NjoB5A+QPj0PrVoy7sA71IfkC50rK5K7O5G2HotR1w/xb7hKzlr70j
   Zk7xu4qzHJ+fEnhR4Ze8budlTKmMCASNFTXEvOvOsq25Q4qrG1Qyf32L8
   +9ubwyLWOD/ghLCbSjZEqm5ulrv5nzSSN8A0EzKpIwVsI8CIWUEPgnK1X
   rqzMqa4ZubLo9ll5+l2MlyjvDrQ1UXxm+r+JbyLElvBIxsmGpmIS26fIs
   3vF4jluofvqw1heQr6RNSDYu5h3pjbo7/OSih3tFNG9ZVsT0iClg7ebz1
   Q==;
X-CSE-ConnectionGUID: gggic4OaQYivhki5SvIWGQ==
X-CSE-MsgGUID: TbN8tcU5Tu2ZgPv/0bYufg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44641501"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="44641501"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 10:25:50 -0800
X-CSE-ConnectionGUID: KKUtWMrlQ72P9yAignWmpA==
X-CSE-MsgGUID: vB6cKOpnTmagXmfvQEjU8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="115449759"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Feb 2025 10:25:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlXid-0005sJ-05
	for oe-kbuild-all@lists.linux.dev;
	Fri, 21 Feb 2025 18:25:47 +0000
Date: Sat, 22 Feb 2025 02:25:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1]
 drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:325:34: warning:
 'pcie_perf_stats_desc64' defined but not used
Message-ID: <202502220237.br0w9DQE-lkp@intel.com>
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
commit: efae7f78c45ba37bdc23a95d219b59ac85bdd0a7 [1/1] net/mlx5e: Add outbound PCI buffer overflow counter
config: xtensa-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250222/202502220237.br0w9DQE-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502220237.br0w9DQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220237.br0w9DQE-lkp@intel.com/

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
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:467:34: warning: 'mlx5e_pme_error_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc mlx5e_pme_error_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:463:34: warning: 'mlx5e_pme_status_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc mlx5e_pme_status_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:400:34: warning: 'sq_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc sq_stats_desc[] = {
                                     ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:359:34: warning: 'rq_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc rq_stats_desc[] = {
                                     ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:329:34: warning: 'pcie_perf_stall_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stall_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:325:34: warning: 'pcie_perf_stats_desc64' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stats_desc64[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:320:34: warning: 'pcie_perf_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:300:34: warning: 'pport_eth_ext_stats_desc' defined but not used [-Wunused-const-variable=]
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
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:467:34: warning: 'mlx5e_pme_error_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc mlx5e_pme_error_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:463:34: warning: 'mlx5e_pme_status_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc mlx5e_pme_status_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:400:34: warning: 'sq_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc sq_stats_desc[] = {
                                     ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:359:34: warning: 'rq_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc rq_stats_desc[] = {
                                     ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:329:34: warning: 'pcie_perf_stall_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stall_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:325:34: warning: 'pcie_perf_stats_desc64' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stats_desc64[] = {
                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:320:34: warning: 'pcie_perf_stats_desc' defined but not used [-Wunused-const-variable=]
    static const struct counter_desc pcie_perf_stats_desc[] = {
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_stats.h:300:34: warning: 'pport_eth_ext_stats_desc' defined but not used [-Wunused-const-variable=]
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


vim +/pcie_perf_stats_desc64 +325 drivers/net/ethernet/mellanox/mlx5/core/en_stats.h

   324	
 > 325	static const struct counter_desc pcie_perf_stats_desc64[] = {
   326		{ "outbound_pci_buffer_overflow", PCIE_PERF_OFF64(tx_overflow_buffer_pkt) },
   327	};
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
