Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C37C2F744D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 22:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763504486; cv=none; b=oZxL7a61UE+j+IN9jpxnRvWNgr3CDCBXy1f7f6/c30f15QILCe/UGeNlp3ehNryag0UsqXO8zddoLClXz9YDfEKM3eGSOwyTHWdeMqKO5VPxBratES44XGkAi5/X/DAzcoqYRyDFA620frb102PtqZP6oRcTRt818BPuIz4qnmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763504486; c=relaxed/simple;
	bh=57GA4f0Hpjh5YaWuAQwCXLV3s3PhLoZmtWWecJaX5T0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RYt0khBgTnnpo5iOgS1yh4XYOUOvg3r8HzT6odnmCKsPDQfHIgYifTeT2aNIECjfQ/JegItNtE4jhNY69YE+qSqq/NmftTTCUiJNoi8Msysn11346+KXx9+d9h1JMbSHshVbxFH2OuLX8pys+uwVQuRkD7Y7wyIzMFFh+RCVzsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZzVMsCf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZzVMsCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763504484; x=1795040484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=57GA4f0Hpjh5YaWuAQwCXLV3s3PhLoZmtWWecJaX5T0=;
  b=YZzVMsCfDlnK2AaDm2O579/RdbGWSjETc739U4Nkxl/TpGFQ60CSsDnm
   IMbNB/cPGYEF5Q/BIfb7P5mQh6R0bBT0uUtpeIshk6ZM3EVxkIq62wXp/
   bMYFncNFhvYBrCpJfDF6p6hdYt4/XawvCLmx5gl0dZrBC2ZWEoKCbAAF+
   WTNU4lkvqCLUgAzCr6gtTXPHhq5HoBpboQZlpF1I/HbbR58p+DnQW6Hs8
   O2oLCjWOQ+paABSyzjTOTYUSFQ5Mrqdb/PUjymKeLtBII0WiPD7EBa8Ht
   xHuRAOl9/r2OIlodeb1eS8VoqW17xwmmUavZEZ+DU62mf/G9feuMP7l/C
   g==;
X-CSE-ConnectionGUID: R1CjpbwaRkSCBdYtPegUbg==
X-CSE-MsgGUID: f0Y0r2d3Q32b3MwF9kicVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65420018"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65420018"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 14:21:23 -0800
X-CSE-ConnectionGUID: zP+Z4FaJQWmv9QxKZksrDg==
X-CSE-MsgGUID: 3DYWs4XVSdSIld5Dz87vcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190154397"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2025 14:21:22 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLU4e-0002EX-0y;
	Tue, 18 Nov 2025 22:21:20 +0000
Date: Wed, 19 Nov 2025 06:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3269/3269]
 drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:450:39: error: dereferencing
 pointer to incomplete type 'struct ieee_pfc'
Message-ID: <202511190613.H4utOQmR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b4a3c05741e1650e8bb8399196fb5d7a318a4698
commit: 2048b5b7f264f56a4d9e73079e790e13c8596aaf [3269/3269] net: wangxun: txgbe: add support for wangxun 10G/25G/40G
config: arm64-randconfig-002-20251119 (https://download.01.org/0day-ci/archive/20251119/202511190613.H4utOQmR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190613.H4utOQmR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190613.H4utOQmR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_xsk.h:7,
                    from drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:28:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     u32 cur_diff = 0;
         ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_update_xoff_received':
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:450:39: error: dereferencing pointer to incomplete type 'struct ieee_pfc'
      pfc_en |= !!(adapter->txgbe_ieee_pfc->pfc_en);
                                          ^~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_tx_timeout':
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:582:7: warning: variable 'real_tx_hang' set but not used [-Wunused-but-set-variable]
     bool real_tx_hang = false;
          ^~~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_do_lan_reset':
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:2618:21: warning: variable 'tx_ring' set but not used [-Wunused-but-set-variable]
     struct txgbe_ring *tx_ring;
                        ^~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: At top level:
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4515:5: warning: no previous prototype for 'txgbe_dcb_hw_ets' [-Wmissing-prototypes]
    s32 txgbe_dcb_hw_ets(struct txgbe_hw *hw, struct ieee_ets *ets, int max_frame)
        ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_dcb_hw_ets':
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4517:15: error: 'IEEE_8021QAZ_MAX_TCS' undeclared (first use in this function)
     __u16 refill[IEEE_8021QAZ_MAX_TCS], max[IEEE_8021QAZ_MAX_TCS];
                  ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4517:15: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4526:14: error: dereferencing pointer to incomplete type 'struct ieee_ets'
      switch (ets->tc_tsa[i]) {
                 ^~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4527:8: error: 'IEEE_8021QAZ_TSA_STRICT' undeclared (first use in this function)
      case IEEE_8021QAZ_TSA_STRICT:
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4530:8: error: 'IEEE_8021QAZ_TSA_ETS' undeclared (first use in this function)
      case IEEE_8021QAZ_TSA_ETS:
           ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4522:7: warning: unused variable 'bwg_id' [-Wunused-variable]
     __u8 bwg_id[IEEE_8021QAZ_MAX_TCS] = {0, 1, 2, 3, 4, 5, 6, 7};
          ^~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4518:7: warning: unused variable 'prio_type' [-Wunused-variable]
     __u8 prio_type[IEEE_8021QAZ_MAX_TCS];
          ^~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4517:38: warning: unused variable 'max' [-Wunused-variable]
     __u16 refill[IEEE_8021QAZ_MAX_TCS], max[IEEE_8021QAZ_MAX_TCS];
                                         ^~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4517:8: warning: unused variable 'refill' [-Wunused-variable]
     __u16 refill[IEEE_8021QAZ_MAX_TCS], max[IEEE_8021QAZ_MAX_TCS];
           ^~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_configure_dcb':
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4591:26: error: 'DCB_CAP_DCBX_VER_IEEE' undeclared (first use in this function)
     if (adapter->dcbx_cap & DCB_CAP_DCBX_VER_IEEE) {
                             ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: At top level:
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6915:6: warning: no previous prototype for 'txgbe_irq_rearm_queues' [-Wmissing-prototypes]
    void txgbe_irq_rearm_queues(struct txgbe_adapter *adapter,
         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_update_default_up':
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7090:9: error: variable 'app' has initializer but incomplete type
     struct dcb_app app = {
            ^~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7091:11: error: 'struct dcb_app' has no member named 'selector'
             .selector = DCB_APP_IDTYPE_ETHTYPE,
              ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7091:22: error: 'DCB_APP_IDTYPE_ETHTYPE' undeclared (first use in this function); did you mean 'ENCAP_TYPE_ETHER'?
             .selector = DCB_APP_IDTYPE_ETHTYPE,
                         ^~~~~~~~~~~~~~~~~~~~~~
                         ENCAP_TYPE_ETHER
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7091:22: warning: excess elements in struct initializer
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7091:22: note: (near initialization for 'app')
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7092:11: error: 'struct dcb_app' has no member named 'protocol'
             .protocol = 0,
              ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7092:22: warning: excess elements in struct initializer
             .protocol = 0,
                         ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7092:22: note: (near initialization for 'app')
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7090:17: error: storage size of 'app' isn't known
     struct dcb_app app = {
                    ^~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7094:7: error: implicit declaration of function 'dcb_getapp'; did you mean 'wb_get'? [-Werror=implicit-function-declaration]
     up = dcb_getapp(netdev, &app);
          ^~~~~~~~~~
          wb_get
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7090:17: warning: unused variable 'app' [-Wunused-variable]
     struct dcb_app app = {
                    ^~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_set_prio_tc_map':
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9722:27: error: 'DCB_CAP_DCBX_VER_CEE' undeclared (first use in this function)
      if (adapter->dcbx_cap & DCB_CAP_DCBX_VER_CEE)
                              ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: At top level:
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:10239:22: error: 'txgbe_fcoe_get_wwn' undeclared here (not in a function); did you mean 'txgbe_fcoe_enable'?
     .ndo_fcoe_get_wwn = txgbe_fcoe_get_wwn,
                         ^~~~~~~~~~~~~~~~~~
                         txgbe_fcoe_enable
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_remove':
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:10826:2: error: implicit declaration of function 'txgbe_fcoe_ddp_disable'; did you mean 'txgbe_fcoe_disable'? [-Werror=implicit-function-declaration]
     txgbe_fcoe_ddp_disable(adapter);
     ^~~~~~~~~~~~~~~~~~~~~~
     txgbe_fcoe_disable
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_dcb_hw_ets':
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4546:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_fcoe.c:4:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     u32 cur_diff = 0;
         ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_fcoe.c: At top level:
>> drivers/net/ethernet/wangxun/txgbe/txgbe_fcoe.c:748:5: warning: no previous prototype for 'txgbe_fcoe_ddp_enable' [-Wmissing-prototypes]
    int txgbe_fcoe_ddp_enable(struct txgbe_adapter *adapter)
        ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/wangxun/txgbe/txgbe_fcoe.c:767:6: warning: no previous prototype for 'txgbe_fcoe_ddp_disable' [-Wmissing-prototypes]
    void txgbe_fcoe_ddp_disable(struct txgbe_adapter *adapter)
         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/wangxun/txgbe/txgbe_fcoe.c:899:5: warning: no previous prototype for 'txgbe_fcoe_get_wwn' [-Wmissing-prototypes]
    int txgbe_fcoe_get_wwn(struct net_device *netdev, u64 *wwn, int type)
        ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/wangxun/txgbe/txgbe_fcoe.c:936:4: warning: no previous prototype for 'txgbe_fcoe_get_tc' [-Wmissing-prototypes]
    u8 txgbe_fcoe_get_tc(struct txgbe_adapter *adapter)
       ^~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_lib.c:4:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     u32 cur_diff = 0;
         ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_lib.c: In function 'txgbe_cache_ring_dcb_vmdq':
>> drivers/net/ethernet/wangxun/txgbe/txgbe_lib.c:63:16: error: implicit declaration of function 'txgbe_fcoe_get_tc'; did you mean 'txgbe_fcoe_enable'? [-Werror=implicit-function-declaration]
      u8 fcoe_tc = txgbe_fcoe_get_tc(adapter);
                   ^~~~~~~~~~~~~~~~~
                   txgbe_fcoe_enable
   cc1: some warnings being treated as errors


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
