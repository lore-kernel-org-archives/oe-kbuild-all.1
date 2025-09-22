Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6524A9475
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 04:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758515982; cv=none; b=hOWu9bmqCQ/blozisOGj5DfBFrarjii2b//5LjnJe2/WBM1Gnl6iFk0pZCvSpUv/B14qsMTseUJpaq5rC2zQKCZIk9KVtV+0moL1MiMEFyQoQ+0cFZwDaboodS7NpXKeLZCcd98IXQr7sqKOV0rquqwZmKXCQeC+TpnJo36/QCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758515982; c=relaxed/simple;
	bh=WbzVmhTfAB33YB7W6E4bLEUjVsSeGV/BTSsEq2vf4JM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=awClmJj7s0SCKPYYJYx+LM/Yrp76hUXCNbvK6ryDWG3MVAJlfEMG3wXnsbzrQiUubB7WDqKnp+nkd7ZNVN7yKMXNPZtNqVhlxi80COgOgimZldjq6P3FKxEeYMB70/iX9xSNHzIH+hdepXq06viPgntQRG0A10BvKL1G0smrMBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bl60yFXZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bl60yFXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758515981; x=1790051981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WbzVmhTfAB33YB7W6E4bLEUjVsSeGV/BTSsEq2vf4JM=;
  b=bl60yFXZfrJfvl2IVeTYwfEipN4Z27XESI9uC1TfRUvpiE8SYuWBwPf/
   YSfQCn8HXt7t61FZp0Y8oexbRMEg1n1oOpFgDe+iD2Ne05XEm8iOFCIXs
   EYB+yyNxZlBAy1IataAEp2c+bjoRgcTw7S+jbQYF3BQesZZ24HHdFesif
   +6EOJ4HXGH6aFEJrKNrVKhV2YBNOi/+zbndVFIy1VmgUmJahyvsE4iHeW
   BjdaHqXo6T290wL0MHAcYkGjYPN6qozebWbGaBYTXKezRZA9S0UEid1+F
   DoC5+ts9seB+Llsnpa1jiyeHrvkE0IbSmrWToFisRCt5Ri7QjKo47h5Xp
   w==;
X-CSE-ConnectionGUID: HcYyyOX9S3ydZI9sAJLvXQ==
X-CSE-MsgGUID: 3uizpKF9QhSuOb5v46RgIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60466908"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="60466908"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 21:39:40 -0700
X-CSE-ConnectionGUID: avPpA7HNSLitN1NgDzBz7Q==
X-CSE-MsgGUID: ipghUoFwTkq7fM7gbT5MPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="176753978"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Sep 2025 21:39:38 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0YKt-0001K9-2l;
	Mon, 22 Sep 2025 04:39:35 +0000
Date: Mon, 22 Sep 2025 12:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2908/2908]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:432:6: error: no
 previous prototype for 'sxe_debugfs_entries_init'
Message-ID: <202509221213.1pyyj9JK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liujie_answer,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1f1c00e79b5b7cd4202a28c0fcd645c3c92c0df5
commit: dd013ad487534c1838afc2f55efdb5daec15aace [2908/2908] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250922/202509221213.1pyyj9JK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221213.1pyyj9JK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221213.1pyyj9JK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_xdp.c:410:6: error: no previous prototype for 'sxe_txrx_ring_enable' [-Werror=missing-prototypes]
     410 | void sxe_txrx_ring_enable(struct sxe_adapter *adapter, u32 ring_idx)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:432:6: error: no previous prototype for 'sxe_debugfs_entries_init' [-Werror=missing-prototypes]
     432 | void sxe_debugfs_entries_init(struct sxe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:459:6: error: no previous prototype for 'sxe_debugfs_entries_exit' [-Werror=missing-prototypes]
     459 | void sxe_debugfs_entries_exit(struct sxe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:465:6: error: no previous prototype for 'sxe_debugfs_init' [-Werror=missing-prototypes]
     465 | void sxe_debugfs_init(void)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:470:6: error: no previous prototype for 'sxe_debugfs_exit' [-Werror=missing-prototypes]
     470 | void sxe_debugfs_exit(void)
         |      ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:2022:5: error: no previous prototype for 'sxe_reg_test' [-Werror=missing-prototypes]
    2022 | int sxe_reg_test(struct sxe_adapter *adapter)
         |     ^~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:2644:5: error: no previous prototype for 'sxe_phys_id_set' [-Werror=missing-prototypes]
    2644 | int sxe_phys_id_set(struct net_device *netdev, enum ethtool_phys_id_state state)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c: In function 'sxe_get_module_eeprom':
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ethtool.c:2736:47: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
    2736 |                 LOG_ERROR("read sfp failed\n");
         |                                               ^
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:230:6: error: no previous prototype for 'sxe_hw_no_snoop_disable' [-Werror=missing-prototypes]
     230 | void sxe_hw_no_snoop_disable(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:262:6: error: no previous prototype for 'sxe_hw_uc_addr_pool_del' [-Werror=missing-prototypes]
     262 | void sxe_hw_uc_addr_pool_del(struct sxe_hw *hw, u32 rar_idx, u32 pool_idx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:283:5: error: no previous prototype for 'sxe_hw_uc_addr_pool_enable' [-Werror=missing-prototypes]
     283 | s32 sxe_hw_uc_addr_pool_enable(struct sxe_hw *hw, u8 rar_idx, u8 pool_idx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:337:5: error: no previous prototype for 'sxe_hw_nic_reset' [-Werror=missing-prototypes]
     337 | s32 sxe_hw_nic_reset(struct sxe_hw *hw)
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:367:6: error: no previous prototype for 'sxe_hw_pf_rst_done_set' [-Werror=missing-prototypes]
     367 | void sxe_hw_pf_rst_done_set(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:735:5: error: no previous prototype for 'sxe_hw_pending_irq_read_clear' [-Werror=missing-prototypes]
     735 | u32 sxe_hw_pending_irq_read_clear(struct sxe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:740:6: error: no previous prototype for 'sxe_hw_pending_irq_write_clear' [-Werror=missing-prototypes]
     740 | void sxe_hw_pending_irq_write_clear(struct sxe_hw *hw, u32 value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:745:5: error: no previous prototype for 'sxe_hw_irq_cause_get' [-Werror=missing-prototypes]
     745 | u32 sxe_hw_irq_cause_get(struct sxe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:765:6: error: no previous prototype for 'sxe_hw_ring_irq_auto_disable' [-Werror=missing-prototypes]
     765 | void sxe_hw_ring_irq_auto_disable(struct sxe_hw *hw, bool is_msix)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:775:6: error: no previous prototype for 'sxe_hw_irq_general_reg_set' [-Werror=missing-prototypes]
     775 | void sxe_hw_irq_general_reg_set(struct sxe_hw *hw, u32 value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:780:5: error: no previous prototype for 'sxe_hw_irq_general_reg_get' [-Werror=missing-prototypes]
     780 | u32 sxe_hw_irq_general_reg_get(struct sxe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:790:6: error: no previous prototype for 'sxe_hw_event_irq_map' [-Werror=missing-prototypes]
     790 | void sxe_hw_event_irq_map(struct sxe_hw *hw, u8 offset, u16 irq_idx)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:806:6: error: no previous prototype for 'sxe_hw_ring_irq_map' [-Werror=missing-prototypes]
     806 | void sxe_hw_ring_irq_map(struct sxe_hw *hw, bool is_tx, u16 reg_idx,
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:823:6: error: no previous prototype for 'sxe_hw_ring_irq_interval_set' [-Werror=missing-prototypes]
     823 | void sxe_hw_ring_irq_interval_set(struct sxe_hw *hw, u16 irq_idx, u32 interval)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:838:6: error: no previous prototype for 'sxe_hw_event_irq_auto_clear_set' [-Werror=missing-prototypes]
     838 | void sxe_hw_event_irq_auto_clear_set(struct sxe_hw *hw, u32 value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:843:6: error: no previous prototype for 'sxe_hw_specific_irq_disable' [-Werror=missing-prototypes]
     843 | void sxe_hw_specific_irq_disable(struct sxe_hw *hw, u32 value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:848:6: error: no previous prototype for 'sxe_hw_specific_irq_enable' [-Werror=missing-prototypes]
     848 | void sxe_hw_specific_irq_enable(struct sxe_hw *hw, u32 value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:876:6: error: no previous prototype for 'sxe_hw_all_irq_disable' [-Werror=missing-prototypes]
     876 | void sxe_hw_all_irq_disable(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:994:5: error: no previous prototype for 'sxe_hw_link_speed_get' [-Werror=missing-prototypes]
     994 | u32 sxe_hw_link_speed_get(struct sxe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1014:6: error: no previous prototype for 'sxe_hw_link_speed_set' [-Werror=missing-prototypes]
    1014 | void sxe_hw_link_speed_set(struct sxe_hw *hw, u32 speed)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1033:6: error: no previous prototype for 'sxe_hw_is_link_state_up' [-Werror=missing-prototypes]
    1033 | bool sxe_hw_is_link_state_up(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1055:6: error: no previous prototype for 'sxe_hw_mac_pad_enable' [-Werror=missing-prototypes]
    1055 | void sxe_hw_mac_pad_enable(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1064:5: error: no previous prototype for 'sxe_hw_fc_enable' [-Werror=missing-prototypes]
    1064 | s32 sxe_hw_fc_enable(struct sxe_hw *hw)
         |     ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1135:6: error: no previous prototype for 'sxe_fc_autoneg_localcap_set' [-Werror=missing-prototypes]
    1135 | void sxe_fc_autoneg_localcap_set(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1164:5: error: no previous prototype for 'sxe_hw_pfc_enable' [-Werror=missing-prototypes]
    1164 | s32 sxe_hw_pfc_enable(struct sxe_hw *hw, u8 tc_idx)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1256:6: error: no previous prototype for 'sxe_hw_crc_configure' [-Werror=missing-prototypes]
    1256 | void sxe_hw_crc_configure(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1264:6: error: no previous prototype for 'sxe_hw_loopback_switch' [-Werror=missing-prototypes]
    1264 | void sxe_hw_loopback_switch(struct sxe_hw *hw, bool is_enable)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1276:6: error: no previous prototype for 'sxe_hw_mac_txrx_enable' [-Werror=missing-prototypes]
    1276 | void sxe_hw_mac_txrx_enable(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1285:6: error: no previous prototype for 'sxe_hw_mac_max_frame_set' [-Werror=missing-prototypes]
    1285 | void sxe_hw_mac_max_frame_set(struct sxe_hw *hw, u32 max_frame)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1298:5: error: no previous prototype for 'sxe_hw_mac_max_frame_get' [-Werror=missing-prototypes]
    1298 | u32 sxe_hw_mac_max_frame_get(struct sxe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1330:6: error: no previous prototype for 'sxe_hw_fc_tc_high_water_mark_set' [-Werror=missing-prototypes]
    1330 | void sxe_hw_fc_tc_high_water_mark_set(struct sxe_hw *hw, u8 tc_idx, u32 mark)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1335:6: error: no previous prototype for 'sxe_hw_fc_tc_low_water_mark_set' [-Werror=missing-prototypes]
    1335 | void sxe_hw_fc_tc_low_water_mark_set(struct sxe_hw *hw, u8 tc_idx, u32 mark)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1340:6: error: no previous prototype for 'sxe_hw_is_fc_autoneg_disabled' [-Werror=missing-prototypes]
    1340 | bool sxe_hw_is_fc_autoneg_disabled(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1345:6: error: no previous prototype for 'sxe_hw_fc_autoneg_disable_set' [-Werror=missing-prototypes]
    1345 | void sxe_hw_fc_autoneg_disable_set(struct sxe_hw *hw, bool is_disabled)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1360:6: error: no previous prototype for 'sxe_hw_fc_requested_mode_set' [-Werror=missing-prototypes]
    1360 | void sxe_hw_fc_requested_mode_set(struct sxe_hw *hw, enum sxe_fc_mode mode)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1388:5: error: no previous prototype for 'sxe_hw_rx_mode_get' [-Werror=missing-prototypes]
    1388 | u32 sxe_hw_rx_mode_get(struct sxe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1393:5: error: no previous prototype for 'sxe_hw_pool_rx_mode_get' [-Werror=missing-prototypes]
    1393 | u32 sxe_hw_pool_rx_mode_get(struct sxe_hw *hw, u16 pool_idx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1398:6: error: no previous prototype for 'sxe_hw_rx_mode_set' [-Werror=missing-prototypes]
    1398 | void sxe_hw_rx_mode_set(struct sxe_hw *hw, u32 filter_ctrl)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1403:6: error: no previous prototype for 'sxe_hw_pool_rx_mode_set' [-Werror=missing-prototypes]
    1403 | void sxe_hw_pool_rx_mode_set(struct sxe_hw *hw, u32 vmolr, u16 pool_idx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1408:6: error: no previous prototype for 'sxe_hw_rx_lro_enable' [-Werror=missing-prototypes]
    1408 | void sxe_hw_rx_lro_enable(struct sxe_hw *hw, bool is_enable)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1420:6: error: no previous prototype for 'sxe_hw_rx_nfs_filter_disable' [-Werror=missing-prototypes]
    1420 | void sxe_hw_rx_nfs_filter_disable(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1428:6: error: no previous prototype for 'sxe_hw_rx_udp_frag_checksum_disable' [-Werror=missing-prototypes]
    1428 | void sxe_hw_rx_udp_frag_checksum_disable(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1437:6: error: no previous prototype for 'sxe_hw_fc_mac_addr_set' [-Werror=missing-prototypes]
    1437 | void sxe_hw_fc_mac_addr_set(struct sxe_hw *hw, u8 *mac_addr)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1449:5: error: no previous prototype for 'sxe_hw_uc_addr_add' [-Werror=missing-prototypes]
    1449 | s32 sxe_hw_uc_addr_add(struct sxe_hw *hw, u32 rar_idx, u8 *addr, u32 pool_idx)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1484:5: error: no previous prototype for 'sxe_hw_uc_addr_del' [-Werror=missing-prototypes]
    1484 | s32 sxe_hw_uc_addr_del(struct sxe_hw *hw, u32 index)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1510:6: error: no previous prototype for 'sxe_hw_mta_hash_table_set' [-Werror=missing-prototypes]
    1510 | void sxe_hw_mta_hash_table_set(struct sxe_hw *hw, u8 index, u32 value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1515:6: error: no previous prototype for 'sxe_hw_mta_hash_table_update' [-Werror=missing-prototypes]
    1515 | void sxe_hw_mta_hash_table_update(struct sxe_hw *hw, u8 reg_idx, u8 bit_idx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1525:5: error: no previous prototype for 'sxe_hw_mc_filter_get' [-Werror=missing-prototypes]
    1525 | u32 sxe_hw_mc_filter_get(struct sxe_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1530:6: error: no previous prototype for 'sxe_hw_mc_filter_enable' [-Werror=missing-prototypes]
    1530 | void sxe_hw_mc_filter_enable(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1554:6: error: no previous prototype for 'sxe_hw_uc_addr_clear' [-Werror=missing-prototypes]
    1554 | void sxe_hw_uc_addr_clear(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1587:6: error: no previous prototype for 'sxe_hw_vt_ctrl_cfg' [-Werror=missing-prototypes]
    1587 | void sxe_hw_vt_ctrl_cfg(struct sxe_hw *hw, u8 default_pool)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1601:6: error: no previous prototype for 'sxe_hw_vt_disable' [-Werror=missing-prototypes]
    1601 | void sxe_hw_vt_disable(struct sxe_hw *hw)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_hw.c:1675:5: error: no previous prototype for 'sxe_hw_vlan_pool_filter_read' [-Werror=missing-prototypes]
    1675 | u32 sxe_hw_vlan_pool_filter_read(struct sxe_hw *hw, u16 reg_index)
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:136:5: error: no previous prototype for 'sxe_msi_irq_init' [-Werror=missing-prototypes]
     136 | int sxe_msi_irq_init(struct sxe_adapter *adapter)
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:182:6: error: no previous prototype for 'sxe_disable_dcb' [-Werror=missing-prototypes]
     182 | void sxe_disable_dcb(struct sxe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:212:6: error: no previous prototype for 'sxe_disable_rss' [-Werror=missing-prototypes]
     212 | void sxe_disable_rss(struct sxe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:729:6: error: no previous prototype for 'sxe_lsc_irq_handler' [-Werror=missing-prototypes]
     729 | void sxe_lsc_irq_handler(struct sxe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_irq.c:745:6: error: no previous prototype for 'sxe_mailbox_irq_handler' [-Werror=missing-prototypes]
     745 | void sxe_mailbox_irq_handler(struct sxe_adapter *adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:70:6: error: no previous prototype for 'sxe_allow_inval_mac' [-Werror=missing-prototypes]
      70 | bool sxe_allow_inval_mac(void)
         |      ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_phy.c:733:5: error: no previous prototype for 'sxe_multispeed_sfp_link_configure' [-Werror=missing-prototypes]
     733 | s32 sxe_multispeed_sfp_link_configure(struct sxe_adapter *adapter, u32 speed)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_rx_proc.c:1431:6: error: no previous prototype for 'sxe_headers_cleanup' [-Werror=missing-prototypes]
    1431 | bool sxe_headers_cleanup(struct sxe_ring *rx_ring,
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_rx_proc.c:1569:6: error: no previous prototype for 'sxe_rx_buffer_page_offset_update' [-Werror=missing-prototypes]
    1569 | void sxe_rx_buffer_page_offset_update(struct sxe_ring *rx_ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_sriov.c: In function 'sxe_vf_uc_addr_del':
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_sriov.c:766:13: error: variable 'ret' set but not used [-Werror=unused-but-set-variable]
     766 |         s32 ret;
         |             ^~~
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_sriov.c: At top level:
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_sriov.c:1552:6: error: no previous prototype for 'sxe_set_vf_link_enable' [-Werror=missing-prototypes]
    1552 | void sxe_set_vf_link_enable(struct sxe_adapter *adapter, s32 vf_idx, s32 state)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:160:6: error: no previous prototype for 'sxevf_hw_stop' [-Werror=missing-prototypes]
     160 | void sxevf_hw_stop(struct sxevf_hw *hw)
         |      ^~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:187:6: error: no previous prototype for 'sxevf_msg_write' [-Werror=missing-prototypes]
     187 | void sxevf_msg_write(struct sxevf_hw *hw, u8 index, u32 msg)
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:196:5: error: no previous prototype for 'sxevf_msg_read' [-Werror=missing-prototypes]
     196 | u32 sxevf_msg_read(struct sxevf_hw *hw, u8 index)
         |     ^~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:206:5: error: no previous prototype for 'sxevf_mailbox_read' [-Werror=missing-prototypes]
     206 | u32 sxevf_mailbox_read(struct sxevf_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:211:6: error: no previous prototype for 'sxevf_mailbox_write' [-Werror=missing-prototypes]
     211 | void sxevf_mailbox_write(struct sxevf_hw *hw, u32 value)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:216:6: error: no previous prototype for 'sxevf_pf_req_irq_trigger' [-Werror=missing-prototypes]
     216 | void sxevf_pf_req_irq_trigger(struct sxevf_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:221:6: error: no previous prototype for 'sxevf_pf_ack_irq_trigger' [-Werror=missing-prototypes]
     221 | void sxevf_pf_ack_irq_trigger(struct sxevf_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:226:6: error: no previous prototype for 'sxevf_event_irq_map' [-Werror=missing-prototypes]
     226 | void sxevf_event_irq_map(struct sxevf_hw *hw, u16 vector)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:240:6: error: no previous prototype for 'sxevf_specific_irq_enable' [-Werror=missing-prototypes]
     240 | void sxevf_specific_irq_enable(struct sxevf_hw *hw, u32 value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:245:6: error: no previous prototype for 'sxevf_irq_enable' [-Werror=missing-prototypes]
     245 | void sxevf_irq_enable(struct sxevf_hw *hw, u32 mask)
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:251:6: error: no previous prototype for 'sxevf_irq_disable' [-Werror=missing-prototypes]
     251 | void sxevf_irq_disable(struct sxevf_hw *hw)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:259:6: error: no previous prototype for 'sxevf_hw_ring_irq_map' [-Werror=missing-prototypes]
     259 | void sxevf_hw_ring_irq_map(struct sxevf_hw *hw, bool is_tx, u16 hw_ring_idx,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:276:6: error: no previous prototype for 'sxevf_ring_irq_interval_set' [-Werror=missing-prototypes]
     276 | void sxevf_ring_irq_interval_set(struct sxevf_hw *hw, u16 irq_idx, u32 interval)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:313:6: error: no previous prototype for 'sxevf_hw_reset' [-Werror=missing-prototypes]
     313 | void sxevf_hw_reset(struct sxevf_hw *hw)
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:324:5: error: no previous prototype for 'sxevf_link_state_get' [-Werror=missing-prototypes]
     324 | u32 sxevf_link_state_get(struct sxevf_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:539:6: error: no previous prototype for 'sxevf_tx_ring_switch' [-Werror=missing-prototypes]
     539 | void sxevf_tx_ring_switch(struct sxevf_hw *hw, u8 reg_idx, bool is_on)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:594:6: error: no previous prototype for 'sxevf_rx_ring_switch' [-Werror=missing-prototypes]
     594 | void sxevf_rx_ring_switch(struct sxevf_hw *hw, u8 reg_idx, bool is_on)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:626:6: error: no previous prototype for 'sxevf_rx_ring_desc_configure' [-Werror=missing-prototypes]
     626 | void sxevf_rx_ring_desc_configure(struct sxevf_hw *hw, u32 desc_mem_len,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:640:6: error: no previous prototype for 'sxevf_rx_rcv_ctl_configure' [-Werror=missing-prototypes]
     640 | void sxevf_rx_rcv_ctl_configure(struct sxevf_hw *hw, u8 reg_idx,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:697:6: error: no previous prototype for 'sxevf_32bit_counter_update' [-Werror=missing-prototypes]
     697 | void sxevf_32bit_counter_update(struct sxevf_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:710:6: error: no previous prototype for 'sxevf_36bit_counter_update' [-Werror=missing-prototypes]
     710 | void sxevf_36bit_counter_update(struct sxevf_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:726:6: error: no previous prototype for 'sxevf_packet_stats_get' [-Werror=missing-prototypes]
     726 | void sxevf_packet_stats_get(struct sxevf_hw *hw, struct sxevf_hw_stats *stats)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c:740:6: error: no previous prototype for 'sxevf_stats_init_value_get' [-Werror=missing-prototypes]
     740 | void sxevf_stats_init_value_get(struct sxevf_hw *hw,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
..


vim +/sxe_debugfs_entries_init +432 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c

   431	
 > 432	void sxe_debugfs_entries_init(struct sxe_adapter *adapter)
   433	{
   434		struct dentry *dir;
   435		const char *name = pci_name(adapter->pdev);
   436	
   437		adapter->debugfs_entries = debugfs_create_dir(name, sxe_debugfs_root);
   438		dir = debugfs_create_file("reg_ops", 0600, adapter->debugfs_entries,
   439					  adapter, &sxe_debugfs_reg_ops_fops);
   440		if (!dir || dir == ERR_PTR(-ENODEV))
   441			LOG_INFO_BDF("debugfs:reg_ops file create failed\n");
   442	
   443		dir = debugfs_create_file("netdev_ops", 0600, adapter->debugfs_entries,
   444					  adapter, &sxe_debugfs_netdev_ops_fops);
   445		if (!dir || dir == ERR_PTR(-ENODEV))
   446			LOG_INFO_BDF("debugfs:netdev_ops file create failed\n");
   447	
   448		dir = debugfs_create_file("hw_stats", 0400, adapter->debugfs_entries,
   449					  adapter, &sxe_debugfs_hw_stats_fops);
   450		if (!dir || dir == ERR_PTR(-ENODEV))
   451			LOG_INFO_BDF("debugfs:hw_stats file create failed\n");
   452	
   453		dir = debugfs_create_file("sfp_info", 0400, adapter->debugfs_entries,
   454					  adapter, &sxe_debugfs_sfp_info_fops);
   455		if (!dir || dir == ERR_PTR(-ENODEV))
   456			LOG_INFO_BDF("debugfs:sfp_info file create failed\n");
   457	}
   458	
 > 459	void sxe_debugfs_entries_exit(struct sxe_adapter *adapter)
   460	{
   461		debugfs_remove_recursive(adapter->debugfs_entries);
   462		adapter->debugfs_entries = NULL;
   463	}
   464	
 > 465	void sxe_debugfs_init(void)
   466	{
   467		sxe_debugfs_root = debugfs_create_dir(SXE_DRV_NAME, NULL);
   468	}
   469	
 > 470	void sxe_debugfs_exit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
