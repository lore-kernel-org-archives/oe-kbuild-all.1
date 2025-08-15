Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BFC2DEA8A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755260659; cv=none; b=ekHlvEZBpmEFifGwC1b0YW/vTigPst7DFxi/8lPyWVDo3AznC70wwgw5J/WBxDfrynFs68qpr/H985/ki2MoqBzm+p3xn5PfBB37bFDPPpEEOKSr22ndCfj71vuCKtzzqnXCvHFV8MeQGkwZYoS+UQyTeeeUW1wW8vpvYBwFZbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755260659; c=relaxed/simple;
	bh=Gi7jfKyRguLEW8BBXmo9xupwunS3Rf0YccxwhegX+Es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EM4J3PAhXfBzG9xTbTZP9arNLi9pVpB4tqHLJLAoCADxTSBJmKqaxyfcNTidGNypJOW448vizCF4CplaLwfHdocriaExih57s25fLnuaNQ8f8wMWlufaixs3/IM3zXzalcqihCiEK79LmZMz3Jm7B3FKpHfb7eHcVOKMLbrCTng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=as67U8T8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="as67U8T8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755260656; x=1786796656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gi7jfKyRguLEW8BBXmo9xupwunS3Rf0YccxwhegX+Es=;
  b=as67U8T84/mlsiHyjXMrAWcFE1GuoRhq3TpyyT4V87Y9tA7ABSCdWnz2
   zP5ACUBU/74g3RQ4tNUTZ7eyXJtB2nAsObh5Xbdo/C9Ej5hhXpygrpo67
   SjXvXt+7zRnkCxIoud79zh+hKLj8UglgVGRW/Wm1xKfmkRyH8n7tc8L17
   +Mqn/r9/xGp6nMVY0zAy2XMOsIJ0SSMJ+qS2rPoj5EHe0Inqg9dudRxqI
   366awV97L27alSc8C0bhZ8NnVEiw4HkjTrxfZcLu8c7bOxx1GbfUA6zXY
   Zep8atwDlF2b2wq8kKb9B0MNxm7OvO0djONCFSs8ieGyekG1sbP9Nh465
   w==;
X-CSE-ConnectionGUID: OfzBw7xMTjybNbE4IFY2Ng==
X-CSE-MsgGUID: PR7ZNXboR/CexqiHz3ktug==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68285060"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68285060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 05:24:16 -0700
X-CSE-ConnectionGUID: za7zcNrTRFy/lIiSg2+pYw==
X-CSE-MsgGUID: ffeK36b3TOOvLMkPbdSqIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166495413"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Aug 2025 05:24:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umtTg-000BxI-2N;
	Fri, 15 Aug 2025 12:24:12 +0000
Date: Fri, 15 Aug 2025 20:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2680/2680]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debugfs.c:432:6: error: no
 previous prototype for 'sxe_debugfs_entries_init'
Message-ID: <202508152057.oL7JqxX1-lkp@intel.com>
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
head:   54d96ebb93c9ff0573fe16586a47778ebe26de32
commit: dd013ad487534c1838afc2f55efdb5daec15aace [2680/2680] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-buildonly-randconfig-006-20250815 (https://download.01.org/0day-ci/archive/20250815/202508152057.oL7JqxX1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508152057.oL7JqxX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508152057.oL7JqxX1-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_rx_proc.c:1431:6: error: no previous prototype for 'sxe_headers_cleanup' [-Werror=missing-prototypes]
    1431 | bool sxe_headers_cleanup(struct sxe_ring *rx_ring,
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_rx_proc.c:1569:6: error: no previous prototype for 'sxe_rx_buffer_page_offset_update' [-Werror=missing-prototypes]
    1569 | void sxe_rx_buffer_page_offset_update(struct sxe_ring *rx_ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:70:6: error: no previous prototype for 'sxe_allow_inval_mac' [-Werror=missing-prototypes]
      70 | bool sxe_allow_inval_mac(void)
         |      ^~~~~~~~~~~~~~~~~~~
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
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_phy.c:733:5: error: no previous prototype for 'sxe_multispeed_sfp_link_configure' [-Werror=missing-prototypes]
     733 | s32 sxe_multispeed_sfp_link_configure(struct sxe_adapter *adapter, u32 speed)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_xdp.c:410:6: error: no previous prototype for 'sxe_txrx_ring_enable' [-Werror=missing-prototypes]
     410 | void sxe_txrx_ring_enable(struct sxe_adapter *adapter, u32 ring_idx)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_rx_proc.c:362:6: error: no previous prototype for 'sxevf_rx_ring_buffers_alloc' [-Werror=missing-prototypes]
     362 | void sxevf_rx_ring_buffers_alloc(struct sxevf_ring *rx_ring, u16 cleaned_count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:88:6: error: no previous prototype for 'sxevf_tx_ring_free' [-Werror=missing-prototypes]
      88 | void sxevf_tx_ring_free(struct sxevf_ring *ring)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:127:5: error: no previous prototype for 'sxevf_tx_ring_alloc' [-Werror=missing-prototypes]
     127 | s32 sxevf_tx_ring_alloc(struct sxevf_ring *ring)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c: In function 'sxevf_xmit_pkt':
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:703:66: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
     703 |                                  ring->idx, SXEVF_TX_DESC_NEEDED);
         |                                                                  ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c: In function 'sxevf_ring_xmit':
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:803:74: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
     803 |                 LOG_ERROR("tx dma mapping err, ring idx=%u\n", ring->idx);
         |                                                                          ^
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c: In function 'sxevf_xmit':
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.c:838:71: error: suggest braces around empty body in an 'else' statement [-Werror=empty-body]
     838 |                 LOG_DEBUG("sxe xmit end, ring idx=%u\n", tx_ring->idx);
         |                                                                       ^
   cc1: all warnings being treated as errors
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


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
