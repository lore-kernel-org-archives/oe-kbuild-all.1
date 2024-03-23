Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0175256
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 01:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711156968; cv=none; b=nrER+uzOF65tmqcwThhz3uyh/FuLwjLsI/FYy2/i8skVfV3N8JM521tAgzM6RtBUGTLJaeTzU+/lzokb6mv5zcD6OvWmjJCRyFgAA1j+k7ADJMNO5lKzI8Ijc9e4flDHoGVekxdhidh/DaJEF02YjkYUf6bQukc8TbgDeNsdH2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711156968; c=relaxed/simple;
	bh=mF/K4bCax0aQvUmn+TcmAnecgUaIMuqMUOjoqhqQGbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtXVWZjzfmHi9tJ4j9G+eEmgkv/x4FKHnD+oAWfw/chdqqWzNTRtr1CnJNH/WnL1A+aAzPESO7tYd/HvOh3DGZ0Hx2tLTK/m8mlqyunUZb3Y4JnTtV3rVDG/KsCgRkjyuLXmtZA9gJSt8PIv8rSU+izWQ5/g0joB/++9ihB1KM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSX96FIN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSX96FIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711156966; x=1742692966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mF/K4bCax0aQvUmn+TcmAnecgUaIMuqMUOjoqhqQGbU=;
  b=MSX96FINJVMaXUiI7eLjvNwk+xdgo3XRNqjRJGbwKSXd3Ixfw3KSuhrZ
   sZtPB4OWMD2Cc2FzOtZSLoV77d5+QZ6bbY4kO1CB0jzfofDHQU+l1bUCD
   9t6gs3MWOmDxGfIiAF3VR9rzbpH0nxskzA6vj6JU8dPf+YlQSED6hgOMQ
   T6O7ddCFC9ZFq9uJW9ISCcx/VXc4dwh+8+lvIsqixINpczf5WZY0whRt3
   eeLWdJA3SeTUnhQNIHbWRp6MiZS49J8frewmy4c8d5ggq4to1kOUxOkL9
   5WswqLfIPoWqPrBrHgDEekF0j0nvnT09pje2sD0QrqCAcNfIKGxGjGbrS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6433886"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6433886"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 18:22:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="14990502"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Mar 2024 18:22:43 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnq5p-000Kln-0k;
	Sat, 23 Mar 2024 01:22:41 +0000
Date: Sat, 23 Mar 2024 09:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dasnavis Sabiya <sabiya.d@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 2/5]
 drivers/phy/cadence/phy-cadence-torrent.c:2493:5: warning: variable
 'pcie_links' is uninitialized when used here
Message-ID: <202403230920.k3WLlEKN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   2e423244f8c09173a344e7069f0fe2bdf26cccee
commit: d0d3c1e91c7affc0a4c30793a93ba920076130ec [2/5] phy: cadence-torrent: Add PCIe multilink + USB with same SSC register config for 100MHz refclk
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240323/202403230920.k3WLlEKN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230920.k3WLlEKN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403230920.k3WLlEKN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/phy/cadence/phy-cadence-torrent.c:15:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/phy/cadence/phy-cadence-torrent.c:15:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/phy/cadence/phy-cadence-torrent.c:15:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/phy/cadence/phy-cadence-torrent.c:22:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:1775:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/phy/cadence/phy-cadence-torrent.c:2493:5: warning: variable 'pcie_links' is uninitialized when used here [-Wuninitialized]
    2493 |                                 pcie_links++;
         |                                 ^~~~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:2483:26: note: initialize the variable 'pcie_links' to silence this warning
    2483 |         u32 num_regs, pcie_links;
         |                                 ^
         |                                  = 0
   8 warnings generated.


vim +/pcie_links +2493 drivers/phy/cadence/phy-cadence-torrent.c

  2466	
  2467	static
  2468	int cdns_torrent_phy_configure_multilink(struct cdns_torrent_phy *cdns_phy)
  2469	{
  2470		const struct cdns_torrent_data *init_data = cdns_phy->init_data;
  2471		struct cdns_torrent_vals *cmn_vals, *tx_ln_vals, *rx_ln_vals;
  2472		enum cdns_torrent_ref_clk ref_clk1 = cdns_phy->ref_clk1_rate;
  2473		enum cdns_torrent_ref_clk ref_clk = cdns_phy->ref_clk_rate;
  2474		struct cdns_torrent_vals *link_cmn_vals, *xcvr_diag_vals;
  2475		enum cdns_torrent_phy_type phy_t1, phy_t2;
  2476		struct cdns_torrent_vals *phy_pma_cmn_vals;
  2477		struct cdns_torrent_vals *pcs_cmn_vals;
  2478		int i, j, node, mlane, num_lanes, ret;
  2479		u32 num_links = cdns_phy->nsubnodes;
  2480		struct cdns_reg_pairs *reg_pairs;
  2481		enum cdns_torrent_ssc_mode ssc;
  2482		struct regmap *regmap;
  2483		u32 num_regs, pcie_links;
  2484	
  2485		if (num_links == 2) {
  2486			phy_t1 = cdns_phy->phys[0].phy_type;
  2487			phy_t2 = cdns_phy->phys[1].phy_type;
  2488		} else if (num_links > 2) {
  2489			phy_t1 = TYPE_PCIE_ML;
  2490			phy_t2 = TYPE_NONE;
  2491			for (node = 0; node < num_links; node++) {
  2492				if (cdns_phy->phys[node].phy_type == TYPE_PCIE) {
> 2493					pcie_links++;
  2494					continue;
  2495				}
  2496				phy_t2 = cdns_phy->phys[node].phy_type;
  2497			}
  2498			if (pcie_links <= 1 || phy_t2 != TYPE_USB)
  2499				return -EINVAL;
  2500		}
  2501	
  2502		/**
  2503		 * First configure the PHY for first link with phy_t1. Get the array
  2504		 * values as [phy_t1][phy_t2][ssc].
  2505		 */
  2506		for (node = 0; node < num_links; node++) {
  2507			if ((num_links == 2 && node == 1) ||
  2508			    (num_links > 2 && node == pcie_links)) {
  2509				/**
  2510				 * If first link with phy_t1 is configured, then
  2511				 * configure the PHY for second link with phy_t2.
  2512				 * Get the array values as [phy_t2][phy_t1][ssc].
  2513				 */
  2514				swap(phy_t1, phy_t2);
  2515				swap(ref_clk, ref_clk1);
  2516			}
  2517	
  2518			mlane = cdns_phy->phys[node].mlane;
  2519			ssc = cdns_phy->phys[node].ssc_mode;
  2520			num_lanes = cdns_phy->phys[node].num_lanes;
  2521	
  2522			/**
  2523			 * PHY configuration specific registers:
  2524			 * link_cmn_vals depend on combination of PHY types being
  2525			 * configured and are common for both PHY types, so array
  2526			 * values should be same for [phy_t1][phy_t2][ssc] and
  2527			 * [phy_t2][phy_t1][ssc].
  2528			 * xcvr_diag_vals also depend on combination of PHY types
  2529			 * being configured, but these can be different for particular
  2530			 * PHY type and are per lane.
  2531			 */
  2532			link_cmn_vals = cdns_torrent_get_tbl_vals(&init_data->link_cmn_vals_tbl,
  2533								  CLK_ANY, CLK_ANY,
  2534								  phy_t1, phy_t2, ANY_SSC);
  2535			if (link_cmn_vals) {
  2536				reg_pairs = link_cmn_vals->reg_pairs;
  2537				num_regs = link_cmn_vals->num_regs;
  2538				regmap = cdns_phy->regmap_common_cdb;
  2539	
  2540				/**
  2541				 * First array value in link_cmn_vals must be of
  2542				 * PHY_PLL_CFG register
  2543				 */
  2544				regmap_field_write(cdns_phy->phy_pll_cfg,
  2545						   reg_pairs[0].val);
  2546	
  2547				for (i = 1; i < num_regs; i++)
  2548					regmap_write(regmap, reg_pairs[i].off,
  2549						     reg_pairs[i].val);
  2550			}
  2551	
  2552			xcvr_diag_vals = cdns_torrent_get_tbl_vals(&init_data->xcvr_diag_vals_tbl,
  2553								   CLK_ANY, CLK_ANY,
  2554								   phy_t1, phy_t2, ANY_SSC);
  2555			if (xcvr_diag_vals) {
  2556				reg_pairs = xcvr_diag_vals->reg_pairs;
  2557				num_regs = xcvr_diag_vals->num_regs;
  2558				for (i = 0; i < num_lanes; i++) {
  2559					regmap = cdns_phy->regmap_tx_lane_cdb[i + mlane];
  2560					for (j = 0; j < num_regs; j++)
  2561						regmap_write(regmap, reg_pairs[j].off,
  2562							     reg_pairs[j].val);
  2563				}
  2564			}
  2565	
  2566			/* PHY PCS common registers configurations */
  2567			pcs_cmn_vals = cdns_torrent_get_tbl_vals(&init_data->pcs_cmn_vals_tbl,
  2568								 CLK_ANY, CLK_ANY,
  2569								 phy_t1, phy_t2, ANY_SSC);
  2570			if (pcs_cmn_vals) {
  2571				reg_pairs = pcs_cmn_vals->reg_pairs;
  2572				num_regs = pcs_cmn_vals->num_regs;
  2573				regmap = cdns_phy->regmap_phy_pcs_common_cdb;
  2574				for (i = 0; i < num_regs; i++)
  2575					regmap_write(regmap, reg_pairs[i].off,
  2576						     reg_pairs[i].val);
  2577			}
  2578	
  2579			/* PHY PMA common registers configurations */
  2580			phy_pma_cmn_vals = cdns_torrent_get_tbl_vals(&init_data->phy_pma_cmn_vals_tbl,
  2581								     CLK_ANY, CLK_ANY,
  2582								     phy_t1, phy_t2, ANY_SSC);
  2583			if (phy_pma_cmn_vals) {
  2584				reg_pairs = phy_pma_cmn_vals->reg_pairs;
  2585				num_regs = phy_pma_cmn_vals->num_regs;
  2586				regmap = cdns_phy->regmap_phy_pma_common_cdb;
  2587				for (i = 0; i < num_regs; i++)
  2588					regmap_write(regmap, reg_pairs[i].off,
  2589						     reg_pairs[i].val);
  2590			}
  2591	
  2592			/* PMA common registers configurations */
  2593			cmn_vals = cdns_torrent_get_tbl_vals(&init_data->cmn_vals_tbl,
  2594							     ref_clk, ref_clk1,
  2595							     phy_t1, phy_t2, ssc);
  2596			if (cmn_vals) {
  2597				reg_pairs = cmn_vals->reg_pairs;
  2598				num_regs = cmn_vals->num_regs;
  2599				regmap = cdns_phy->regmap_common_cdb;
  2600				for (i = 0; i < num_regs; i++)
  2601					regmap_write(regmap, reg_pairs[i].off,
  2602						     reg_pairs[i].val);
  2603			}
  2604	
  2605			/* PMA TX lane registers configurations */
  2606			tx_ln_vals = cdns_torrent_get_tbl_vals(&init_data->tx_ln_vals_tbl,
  2607							       ref_clk, ref_clk1,
  2608							       phy_t1, phy_t2, ssc);
  2609			if (tx_ln_vals) {
  2610				reg_pairs = tx_ln_vals->reg_pairs;
  2611				num_regs = tx_ln_vals->num_regs;
  2612				for (i = 0; i < num_lanes; i++) {
  2613					regmap = cdns_phy->regmap_tx_lane_cdb[i + mlane];
  2614					for (j = 0; j < num_regs; j++)
  2615						regmap_write(regmap, reg_pairs[j].off,
  2616							     reg_pairs[j].val);
  2617				}
  2618			}
  2619	
  2620			/* PMA RX lane registers configurations */
  2621			rx_ln_vals = cdns_torrent_get_tbl_vals(&init_data->rx_ln_vals_tbl,
  2622							       ref_clk, ref_clk1,
  2623							       phy_t1, phy_t2, ssc);
  2624			if (rx_ln_vals) {
  2625				reg_pairs = rx_ln_vals->reg_pairs;
  2626				num_regs = rx_ln_vals->num_regs;
  2627				for (i = 0; i < num_lanes; i++) {
  2628					regmap = cdns_phy->regmap_rx_lane_cdb[i + mlane];
  2629					for (j = 0; j < num_regs; j++)
  2630						regmap_write(regmap, reg_pairs[j].off,
  2631							     reg_pairs[j].val);
  2632				}
  2633			}
  2634	
  2635			if (phy_t1 == TYPE_DP) {
  2636				ret = cdns_torrent_dp_get_pll(cdns_phy, phy_t2);
  2637				if (ret)
  2638					return ret;
  2639			}
  2640	
  2641			reset_control_deassert(cdns_phy->phys[node].lnk_rst);
  2642		}
  2643	
  2644		/* Take the PHY out of reset */
  2645		ret = reset_control_deassert(cdns_phy->phy_rst);
  2646		if (ret)
  2647			return ret;
  2648	
  2649		return 0;
  2650	}
  2651	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
