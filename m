Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EA5BE5E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 08:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763799408; cv=none; b=D42kT4Bv3txzM1qGr6gwBk12aC2vFWWQFREcKy8sRT7ungjoGa4NTGHXnMncGMldhT/q64asMBQ1uDLjk6c+WMVvTGP+xSwOZVFE6CLayk5IZ77fMuLo0o6z5eXO+ddbyCo6reO5Zv48uBezzK8MygefGtmsJXalMkLJUp4at08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763799408; c=relaxed/simple;
	bh=K0sRr2jXj3kZEdp1jTBHFLCKmAf9Q5rreJbpBxHxZfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=co4qD6Lobb+ZmhN5vNu/V9ASynXO56572kP8RtDmjiQU/tMOwlbuca3PWuUHRB+rZrPBUXqxEuxlVQNuNc7SLW7ITkMR2usWzuC7OtOYydNWXgUPbl5ZbrsUd5KHVfYlR7IfeRIyMCaZJgl2ummHp1QeRxgi8S9bcEtYZG+IrGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVoGnAYq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVoGnAYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763799407; x=1795335407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K0sRr2jXj3kZEdp1jTBHFLCKmAf9Q5rreJbpBxHxZfQ=;
  b=VVoGnAYqS4gCJtbkaISehl0w6U6ikjUfaGY1dhgk5WJgOpovNn698566
   oVhE1YaD4bZhazTXGAEg6Sj35nCQKia+Cl0Q11kPCmDrKhB8leEEQ5nm3
   hJVKa2JUSUVJFWpheigqKi2sgNCFkA5Jmwq150NhzYKbzS9TXd5dNB+o4
   mBJOsl4k18STVsIc9U0HFrKoUEkTL8OUaAynagvSkblVypPHP8qSs7CKF
   iVbp70NgUedJmi0C36Oe+SWKuTmm+fYdsGp5yLs3IJW3uJw7aDaoMs0R8
   tlfUiYiIVhTWyY+5SEgE1sJbE1FIpF7kidoZP2ZIRbwRfvwLz/ZqqfAez
   Q==;
X-CSE-ConnectionGUID: mZzQ5ie9SKy9z3pNw1qvcA==
X-CSE-MsgGUID: wr8jOP5yQayCxxJ4CtRkGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="83273938"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="83273938"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 00:16:46 -0800
X-CSE-ConnectionGUID: gFMPHTypQMyiRoLB42IcVw==
X-CSE-MsgGUID: K5VcJhJDSwCYNRL3YQMbBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="191916633"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2025 00:16:45 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMinS-0007Hf-2j;
	Sat, 22 Nov 2025 08:16:42 +0000
Date: Sat, 22 Nov 2025 16:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3304/3304]
 drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:450:39: error: incomplete
 definition of type 'struct ieee_pfc'
Message-ID: <202511221659.lFpcDW1g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2e375b157ddf25336989b074c1f2a88a80ab72f5
commit: 2048b5b7f264f56a4d9e73079e790e13c8596aaf [3304/3304] net: wangxun: txgbe: add support for wangxun 10G/25G/40G
config: x86_64-randconfig-015-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221659.lFpcDW1g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221659.lFpcDW1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221659.lFpcDW1g-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:28:
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_xsk.h:7:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:450:39: error: incomplete definition of type 'struct ieee_pfc'
     450 |                 pfc_en |= !!(adapter->txgbe_ieee_pfc->pfc_en);
         |                              ~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:814:9: note: forward declaration of 'struct ieee_pfc'
     814 |         struct ieee_pfc *txgbe_ieee_pfc;
         |                ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:582:7: warning: variable 'real_tx_hang' set but not used [-Wunused-but-set-variable]
     582 |         bool real_tx_hang = false;
         |              ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:2618:21: warning: variable 'tx_ring' set but not used [-Wunused-but-set-variable]
    2618 |         struct txgbe_ring *tx_ring;
         |                            ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:3270:39: error: incomplete definition of type 'struct ieee_pfc'
    3270 |                 pfc_en |= !!(adapter->txgbe_ieee_pfc->pfc_en);
         |                              ~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:814:9: note: forward declaration of 'struct ieee_pfc'
     814 |         struct ieee_pfc *txgbe_ieee_pfc;
         |                ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4403:20: warning: variable 'vlnctrl' set but not used [-Wunused-but-set-variable]
    4403 |         u32 fctrl, vmolr, vlnctrl;
         |                           ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4517:15: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
    4517 |         __u16 refill[IEEE_8021QAZ_MAX_TCS], max[IEEE_8021QAZ_MAX_TCS];
         |                      ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4517:42: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
    4517 |         __u16 refill[IEEE_8021QAZ_MAX_TCS], max[IEEE_8021QAZ_MAX_TCS];
         |                                                 ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4518:17: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
    4518 |         __u8 prio_type[IEEE_8021QAZ_MAX_TCS];
         |                        ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4522:14: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
    4522 |         __u8 bwg_id[IEEE_8021QAZ_MAX_TCS] = {0, 1, 2, 3, 4, 5, 6, 7};
         |                     ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4525:18: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
    4525 |         for (i = 0; i < IEEE_8021QAZ_MAX_TCS; i++) {
         |                         ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4526:14: error: incomplete definition of type 'struct ieee_ets'
    4526 |                 switch (ets->tc_tsa[i]) {
         |                         ~~~^
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:815:9: note: forward declaration of 'struct ieee_ets'
     815 |         struct ieee_ets *txgbe_ieee_ets;
         |                ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4527:8: error: use of undeclared identifier 'IEEE_8021QAZ_TSA_STRICT'
    4527 |                 case IEEE_8021QAZ_TSA_STRICT:
         |                      ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4530:8: error: use of undeclared identifier 'IEEE_8021QAZ_TSA_ETS'
    4530 |                 case IEEE_8021QAZ_TSA_ETS:
         |                      ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4543:36: error: incomplete definition of type 'struct ieee_ets'
    4543 |         txgbe_dcb_calculate_tc_credits(ets->tc_tx_bw, refill, max, max_frame);
         |                                        ~~~^
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:815:9: note: forward declaration of 'struct ieee_ets'
     815 |         struct ieee_ets *txgbe_ieee_ets;
         |                ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4543:56: error: use of undeclared identifier 'max'
    4543 |         txgbe_dcb_calculate_tc_credits(ets->tc_tx_bw, refill, max, max_frame);
         |                                                               ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4545:30: error: incomplete definition of type 'struct ieee_ets'
    4545 |                                    bwg_id, prio_type, ets->prio_tc);
         |                                                       ~~~^
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:815:9: note: forward declaration of 'struct ieee_ets'
     815 |         struct ieee_ets *txgbe_ieee_ets;
         |                ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4544:41: error: use of undeclared identifier 'max'
    4544 |         return txgbe_dcb_hw_config(hw, refill, max,
         |                                                ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4515:5: warning: no previous prototype for function 'txgbe_dcb_hw_ets' [-Wmissing-prototypes]
    4515 | s32 txgbe_dcb_hw_ets(struct txgbe_hw *hw, struct ieee_ets *ets, int max_frame)
         |     ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4515:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4515 | s32 txgbe_dcb_hw_ets(struct txgbe_hw *hw, struct ieee_ets *ets, int max_frame)
         | ^
         | static 
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4591:26: error: use of undeclared identifier 'DCB_CAP_DCBX_VER_IEEE'
    4591 |         if (adapter->dcbx_cap & DCB_CAP_DCBX_VER_IEEE) {
         |                                 ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4599:36: error: incomplete definition of type 'struct ieee_ets'
    4599 |                         u8 *tc = adapter->txgbe_ieee_ets->prio_tc;
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:815:9: note: forward declaration of 'struct ieee_ets'
     815 |         struct ieee_ets *txgbe_ieee_ets;
         |                ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4601:42: error: incomplete definition of type 'struct ieee_pfc'
    4601 |                         txgbe_dcb_config_pfc(&adapter->hw, pfc->pfc_en, tc);
         |                                                            ~~~^
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:814:9: note: forward declaration of 'struct ieee_pfc'
     814 |         struct ieee_pfc *txgbe_ieee_pfc;
         |                ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6709:9: warning: variable 'missed_rx' set but not used [-Wunused-but-set-variable]
    6709 |         u32 i, missed_rx = 0, mpc, bprc, lxon, lxoff;
         |                ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6915:6: warning: no previous prototype for function 'txgbe_irq_rearm_queues' [-Wmissing-prototypes]
    6915 | void txgbe_irq_rearm_queues(struct txgbe_adapter *adapter,
         |      ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6915:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6915 | void txgbe_irq_rearm_queues(struct txgbe_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7007:39: error: incomplete definition of type 'struct ieee_pfc'
    7007 |                 pfc_en |= !!(adapter->txgbe_ieee_pfc->pfc_en);
         |                              ~~~~~~~~~~~~~~~~~~~~~~~^
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:814:9: note: forward declaration of 'struct ieee_pfc'
     814 |         struct ieee_pfc *txgbe_ieee_pfc;
         |                ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7091:22: error: use of undeclared identifier 'DCB_APP_IDTYPE_ETHTYPE'
    7091 |                               .selector = DCB_APP_IDTYPE_ETHTYPE,
         |                                           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   7 warnings and 20 errors generated.


vim +450 drivers/net/ethernet/wangxun/txgbe/txgbe_main.c

   439	
   440	static void txgbe_update_xoff_received(struct txgbe_adapter *adapter)
   441	{
   442		struct txgbe_hw *hw = &adapter->hw;
   443		struct txgbe_hw_stats *hwstats = &adapter->stats;
   444		u32 xoff[8] = {0};
   445		int tc;
   446		int i;
   447		bool pfc_en = adapter->dcb_cfg.pfc_mode_enable;
   448	
   449		if (adapter->txgbe_ieee_pfc)
 > 450			pfc_en |= !!(adapter->txgbe_ieee_pfc->pfc_en);
   451	
   452		if (!(adapter->flags & TXGBE_FLAG_DCB_ENABLED) || !pfc_en) {
   453			txgbe_update_xoff_rx_lfc(adapter);
   454			return;
   455		}
   456	
   457		/* update stats for each tc, only valid with PFC enabled */
   458		for (i = 0; i < MAX_TX_PACKET_BUFFERS; i++) {
   459			u32 pxoffrxc;
   460	
   461			wr32m(hw, TXGBE_MMC_CONTROL, TXGBE_MMC_CONTROL_UP, i << 16);
   462			pxoffrxc = rd32(hw, TXGBE_MAC_PXOFFRXC);
   463			hwstats->pxoffrxc[i] += pxoffrxc;
   464			/* Get the TC for given UP */
   465			tc = netdev_get_prio_tc_map(adapter->netdev, i);
   466			xoff[tc] += pxoffrxc;
   467		}
   468	
   469		/* disarm tx queues that have received xoff frames */
   470		for (i = 0; i < adapter->num_tx_queues; i++) {
   471			struct txgbe_ring *tx_ring = adapter->tx_ring[i];
   472	
   473			tc = tx_ring->dcb_tc;
   474			if (tc <= 7 && xoff[tc])
   475				clear_bit(__TXGBE_HANG_CHECK_ARMED, &tx_ring->state);
   476		}
   477		for (i = 0; i < adapter->num_xdp_queues; i++) {
   478			struct txgbe_ring *xdp_ring = adapter->xdp_ring[i];
   479	
   480			tc = xdp_ring->dcb_tc;
   481			if (tc <= 7 && xoff[tc])
   482				clear_bit(__TXGBE_HANG_CHECK_ARMED, &xdp_ring->state);
   483			}
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
