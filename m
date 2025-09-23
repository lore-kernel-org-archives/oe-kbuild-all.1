Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501BC8F40
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758652060; cv=none; b=WOArbU/1YUGdk93N6hsnWt5PoO76XUYPhzvhVhnkUYBjTb0tP+AxCbegu6ZtkdtF71d8Xn00p5njw231bAgvf7ScFtzzi0TTPb9u3QaDtsGqNLVwoyx58xU0WtDIBM2Wj77PCzu33Kh2ev4EXj4seQRlP4Hz9XD2R3rSaStA/yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758652060; c=relaxed/simple;
	bh=Ogy78bcAbjjz751mnvCAYI2zeBOgEs2Ff+8B3RaFrvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IRrGO+S6nk7McaoTjOjCimUF152wIxWpW+v3HwmHhiHhNg2l3Q3S3wj4bM37mij60rxmi9W11CuyCgllb+iqGawKRo1V5NwS8W2SNYFq34qfhN8f6gNDnarC866rAczxLrzj/778ByLa2fb79dY2B+yJnFlfrCU4ieow0T09J7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iH8NBxiO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iH8NBxiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758652059; x=1790188059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ogy78bcAbjjz751mnvCAYI2zeBOgEs2Ff+8B3RaFrvo=;
  b=iH8NBxiOjv0SaC6yZaN50r9Fn43uueP1opvNI4n1V3D8TRgsg1XSagb9
   1ucxtXpSVYFb29yY9oRgAVbCIx/SzsJBJ3oTK+MErNUbWLkEpaEgBflOQ
   922u0GC1eUGJu98pBophMv5R1csaHlruDeydYoL5KamIY8IXUNagTnqIM
   MItHpoGvpYdZd3Z4sY+TFM6t2Nrlz4HOFnaKIzzB7v05Q43+LXevFmNeE
   QIPWQBZ7Qcya4ypKQzinidWcpEbrq48LQJ0oiRfi+gPefqKed7z6ANp6s
   2lN51mMQKRJMLgyVRbn21brk4LpRK1Gb/gUU+qIlgYVZy2A8VpVi5ntae
   g==;
X-CSE-ConnectionGUID: mNLg7c6cRMue1i781aFX4w==
X-CSE-MsgGUID: THg2Fs9WTWGNAS9zppgMyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64580396"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="64580396"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 11:27:38 -0700
X-CSE-ConnectionGUID: p7ewc8b7Swiss/hOKPCYtg==
X-CSE-MsgGUID: jX7pCmMzSDqHlRkQMtZr6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="177620567"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2025 11:27:36 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v17ji-0003Q7-1G;
	Tue, 23 Sep 2025 18:27:34 +0000
Date: Wed, 24 Sep 2025 02:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2919/2919]
 drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable
 'cur_diff' set but not used
Message-ID: <202509240211.6y9LdLBP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   197ce274f644770303e8a9c9591ac6cf6a7ded25
commit: 2048b5b7f264f56a4d9e73079e790e13c8596aaf [2919/2919] net: wangxun: txgbe: add support for wangxun 10G/25G/40G
config: x86_64-buildonly-randconfig-005-20250923 (https://download.01.org/0day-ci/archive/20250924/202509240211.6y9LdLBP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240211.6y9LdLBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240211.6y9LdLBP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_debugfs.c:4:
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^
   1 warning generated.
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:28:
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_xsk.h:7:
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:582:7: warning: variable 'real_tx_hang' set but not used [-Wunused-but-set-variable]
     582 |         bool real_tx_hang = false;
         |              ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:2618:21: warning: variable 'tx_ring' set but not used [-Wunused-but-set-variable]
    2618 |         struct txgbe_ring *tx_ring;
         |                            ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4403:20: warning: variable 'vlnctrl' set but not used [-Wunused-but-set-variable]
    4403 |         u32 fctrl, vmolr, vlnctrl;
         |                           ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6709:9: warning: variable 'missed_rx' set but not used [-Wunused-but-set-variable]
    6709 |         u32 i, missed_rx = 0, mpc, bprc, lxon, lxoff;
         |                ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6915:6: warning: no previous prototype for function 'txgbe_irq_rearm_queues' [-Wmissing-prototypes]
    6915 | void txgbe_irq_rearm_queues(struct txgbe_adapter *adapter,
         |      ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6915:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6915 | void txgbe_irq_rearm_queues(struct txgbe_adapter *adapter,
         | ^
         | static 
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9001:6: warning: variable 'nxmit' set but not used [-Wunused-but-set-variable]
    9001 |         int nxmit = 0;
         |             ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9169:5: warning: variable 'vlan_addlen' set but not used [-Wunused-but-set-variable]
    9169 |         u8 vlan_addlen = 0;
         |            ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:11120:10: error: use of undeclared identifier 'txgbe_pm_ops'
    11120 |                 .pm = &txgbe_pm_ops,
          |                        ^
   8 warnings and 1 error generated.
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_e56.c:4:
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_e56.h:8:
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_e56.c:1480:6: warning: variable 'osc_freq_err_occur' set but not used [-Wunused-but-set-variable]
    1480 |         int osc_freq_err_occur;
         |             ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_e56.c:3438:4: warning: variable 'adapter' is uninitialized when used here [-Wuninitialized]
    3438 |                         e_info(drv, "ERROR: Wait E56PHY_CTRL_FSM_RX_STAT_0_ADDR Timeout!!!\n");
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:1292:30: note: expanded from macro 'e_info'
    1292 |         netif_info(adapter, msglvl, adapter->netdev, format, ## arg)
         |                                     ^~~~~~~
   include/net/net_debug.h:109:32: note: expanded from macro 'netif_info'
     109 |         netif_level(info, priv, type, dev, fmt, ##args)
         |                                       ^~~
   include/net/net_debug.h:93:18: note: expanded from macro 'netif_level'
      93 |                 netdev_##level(dev, fmt, ##args);               \
         |                                ^~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_e56.c:3281:31: note: initialize the variable 'adapter' to silence this warning
    3281 |         struct txgbe_adapter *adapter;
         |                                      ^
         |                                       = NULL
   3 warnings generated.
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_param.c:7:
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_param.c:918:15: warning: variable 'pstring' set but not used [-Wunused-but-set-variable]
     918 |                 const char *pstring;
         |                             ^
   2 warnings generated.
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_ptp.c:4:
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ptp.c:656:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     656 |         case HWTSTAMP_TX_ON:
         |         ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_ptp.c:656:2: note: insert 'break;' to avoid fall-through
     656 |         case HWTSTAMP_TX_ON:
         |         ^
         |         break; 
   2 warnings generated.
--
>> drivers/net/ethernet/wangxun/txgbe/txgbe_debugfs.c:23: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * data operation
   drivers/net/ethernet/wangxun/txgbe/txgbe_debugfs.c:190: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * reg_ops operation
   drivers/net/ethernet/wangxun/txgbe/txgbe_debugfs.c:330: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * netdev_ops operation
>> drivers/net/ethernet/wangxun/txgbe/txgbe_debugfs.c:444: warning: Function parameter or member 'adapter' not described in 'txgbe_dbg_adapter_exit'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_debugfs.c:444: warning: Excess function parameter 'pf' description in 'txgbe_dbg_adapter_exit'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_debugfs.c:471: warning: Function parameter or member 'adapter' not described in 'txgbe_dump'
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:10:
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_e56.h:8:
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6456:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    6456 |         case 0x7F:
         |         ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6456:2: note: insert 'break;' to avoid fall-through
    6456 |         case 0x7F:
         |         ^
         |         break; 
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6468:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    6468 |         case TXGBE_ATR_L4TYPE_MASK:
         |         ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6468:2: note: insert 'break;' to avoid fall-through
    6468 |         case TXGBE_ATR_L4TYPE_MASK:
         |         ^
         |         break; 
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7554:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
    7554 |         int status;
         |             ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7687:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
    7687 |         int status;
         |             ^
   5 warnings generated.
--
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:105: warning: Function parameter or member 'hw' not described in 'txgbe_get_phy_type_from_id'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:105: warning: Excess function parameter 'phy_id' description in 'txgbe_get_phy_type_from_id'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:174: warning: Function parameter or member 'device_type' not described in 'txgbe_read_phy_reg_mdi'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:174: warning: expecting prototype for txgbe_read_phy_mdi(). Prototype was for txgbe_read_phy_reg_mdi() instead
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:212: warning: Function parameter or member 'device_type' not described in 'txgbe_read_phy_reg'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:323: warning: Function parameter or member 'speed_set' not described in 'txgbe_setup_phy_link'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:323: warning: Function parameter or member 'autoneg_wait_to_complete' not described in 'txgbe_setup_phy_link'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:381: warning: Function parameter or member 'autoneg_wait_to_complete' not described in 'txgbe_setup_phy_link_speed'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1094: warning: Function parameter or member 'sff8472_data' not described in 'txgbe_read_i2c_sff8472'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1094: warning: Excess function parameter 'eeprom_data' description in 'txgbe_read_i2c_sff8472'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1111: warning: Function parameter or member 'page' not described in 'txgbe_read_i2c_sff8636'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1111: warning: Function parameter or member 'sff8636_data' not described in 'txgbe_read_i2c_sff8636'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1111: warning: Excess function parameter 'eeprom_data' description in 'txgbe_read_i2c_sff8636'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1133: warning: Function parameter or member 'data' not described in 'txgbe_read_i2c_sfp_phy'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1133: warning: Excess function parameter 'eeprom_data' description in 'txgbe_read_i2c_sfp_phy'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1170: warning: Function parameter or member 'dev_addr' not described in 'txgbe_read_i2c_byte_int'
   drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1211: warning: Function parameter or member 'dev_addr' not described in 'txgbe_read_i2c_word_int'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1326: warning: Function parameter or member 'dev_addr' not described in 'txgbe_read_i2c_byte'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1344: warning: Function parameter or member 'dev_addr' not described in 'txgbe_read_i2c_word'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1363: warning: Function parameter or member 'dev_addr' not described in 'txgbe_write_i2c_byte_int'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1363: warning: Excess function parameter 'lock' description in 'txgbe_write_i2c_byte_int'
   drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:1396: warning: Function parameter or member 'dev_addr' not described in 'txgbe_write_i2c_byte'
--
>> drivers/net/ethernet/wangxun/txgbe/txgbe_lib.c:765: warning: Function parameter or member 'xdp_count' not described in 'txgbe_alloc_q_vector'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_lib.c:765: warning: Function parameter or member 'xdp_idx' not described in 'txgbe_alloc_q_vector'
--
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:51: warning: Function parameter or member 'hw' not described in 'txgbe_dcb_calculate_tc_credits_cee'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:51: warning: Function parameter or member 'dcb_config' not described in 'txgbe_dcb_calculate_tc_credits_cee'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:51: warning: Function parameter or member 'max_frame_size' not described in 'txgbe_dcb_calculate_tc_credits_cee'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:51: warning: Excess function parameter 'txgbe_dcb_config' description in 'txgbe_dcb_calculate_tc_credits_cee'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:249: warning: Function parameter or member 'dcb_config' not described in 'txgbe_dcb_config_tc_stats'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:387: warning: Function parameter or member 'refill' not described in 'txgbe_dcb_config_rx_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:387: warning: Function parameter or member 'max' not described in 'txgbe_dcb_config_rx_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:387: warning: Function parameter or member 'bwg_id' not described in 'txgbe_dcb_config_rx_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:387: warning: Function parameter or member 'tsa' not described in 'txgbe_dcb_config_rx_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:387: warning: Function parameter or member 'map' not described in 'txgbe_dcb_config_rx_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:387: warning: Excess function parameter 'dcb_config' description in 'txgbe_dcb_config_rx_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:444: warning: Function parameter or member 'refill' not described in 'txgbe_dcb_config_tx_desc_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:444: warning: Function parameter or member 'max' not described in 'txgbe_dcb_config_tx_desc_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:444: warning: Function parameter or member 'bwg_id' not described in 'txgbe_dcb_config_tx_desc_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:444: warning: Function parameter or member 'tsa' not described in 'txgbe_dcb_config_tx_desc_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:444: warning: Excess function parameter 'dcb_config' description in 'txgbe_dcb_config_tx_desc_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:487: warning: Function parameter or member 'refill' not described in 'txgbe_dcb_config_tx_data_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:487: warning: Function parameter or member 'max' not described in 'txgbe_dcb_config_tx_data_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:487: warning: Function parameter or member 'bwg_id' not described in 'txgbe_dcb_config_tx_data_arbiter'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:487: warning: Function parameter or member 'tsa' not described in 'txgbe_dcb_config_tx_data_arbiter'
   drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:487: warning: Function parameter or member 'map' not described in 'txgbe_dcb_config_tx_data_arbiter'
   drivers/net/ethernet/wangxun/txgbe/txgbe_dcb.c:487: warning: Excess function parameter 'dcb_config' description in 'txgbe_dcb_config_tx_data_arbiter'
--
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ptp.c:153: warning: Function parameter or member 'timestamp' not described in 'txgbe_ptp_convert_to_hwtstamp'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ptp.c:153: warning: Excess function parameter 'systim' description in 'txgbe_ptp_convert_to_hwtstamp'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ptp.c:353: warning: Excess function parameter 'eicr' description in 'txgbe_ptp_check_pps_event'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ptp.c:579: warning: Function parameter or member 'adapter' not described in 'txgbe_ptp_rx_hwtstamp'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ptp.c:579: warning: expecting prototype for txgbe_ptp_rx_rgtstamp(). Prototype was for txgbe_ptp_rx_hwtstamp() instead
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ptp.c:607: warning: Function parameter or member 'ifr' not described in 'txgbe_ptp_get_ts_config'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ptp.c:607: warning: Excess function parameter 'ifreq' description in 'txgbe_ptp_get_ts_config'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ptp.c:755: warning: Function parameter or member 'ifr' not described in 'txgbe_ptp_set_ts_config'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ptp.c:755: warning: Excess function parameter 'ifreq' description in 'txgbe_ptp_set_ts_config'
..


vim +/cur_diff +987 drivers/net/ethernet/wangxun/txgbe/txgbe.h

   982	
   983	static inline u32 txgbe_misc_isb(struct txgbe_adapter *adapter,
   984					 enum txgbe_isb_idx idx)
   985	{
   986		u32 cur_tag = 0;
 > 987		u32 cur_diff = 0;
   988	
   989		cur_tag = adapter->isb_mem[TXGBE_ISB_HEADER];
   990		cur_diff = cur_tag - adapter->isb_tag[idx];
   991	
   992		adapter->isb_tag[idx] = cur_tag;
   993	
   994		return adapter->isb_mem[idx];
   995	}
   996	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
