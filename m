Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EDC230270
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 02:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767666698; cv=none; b=hjDaZ5SEJ7vYEmXhGaDZ93ibMZWamciwImRcs/nZ02sSaxSt9m16Lntc1KozBnDOiWTEm1KS72yZRQ8R+evYj1ebIUcVzX4odYaFPYyghceyPBaP16FeKHNTbvVduoHim9LnhbuxlDT5cUmO6twnGYtBp2m59TjUx9NC9l0NTzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767666698; c=relaxed/simple;
	bh=1hVmod0Iq61+TwxMeFeRapxGa3e5mTm/G8FjRgmW3UM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZTIdRf/nWQh8IT+9pP/Nkp/G84IEWqhJ1ZAV2iY4/djMCIflZy1RWs+ZwFFFo5Etz72tpWDcZ+VaNhlCyepfkM3ZWT9kmFz5lBGmTVoIsqgvTgiHYBWtaagX0Hk8Dhf5ZcSxerYuTP1Eif4IZMCamMwvc+OJY1tCV8eBL2vsXJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0foSBbN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0foSBbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767666694; x=1799202694;
  h=date:from:to:cc:subject:message-id;
  bh=1hVmod0Iq61+TwxMeFeRapxGa3e5mTm/G8FjRgmW3UM=;
  b=G0foSBbN8tW6eSiaOfpN/oomScErJ3qvX1X2xSCFVWZGI3FGr6yj8SEM
   NPc1QAFced2EJ4bm1WerVy9fQvVunheoPQDWCPWNfWJav/Q207rFlPAFs
   BRdaY6ixS5YSCMkurjetYDVZug/ttNfiPmeLYRpUjzK0mHT+Qa7y/83hu
   r5DWQLU1K9OJtY+LqQv1FU+qGiWMlQIqzqFUbEK4+u2iy9MaOCIVSFlQb
   qQMP5MM5hvNnCyouUsASZNDOr19uzD6TuR8K9rKFu2GYTgzQWldpXIKqQ
   3ucNliMY9zMxD0DsMmS2B2mWx8BlmHFuIRrT4qHsMbPbpq+q8V4DlIMrY
   w==;
X-CSE-ConnectionGUID: 2F7nlrUBQiKsP8kWBBM49g==
X-CSE-MsgGUID: 0WcIbGZsQEiIOUqfygSm9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="80402086"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="80402086"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 18:31:34 -0800
X-CSE-ConnectionGUID: NrJySSIMSoqDP6Fsc976DQ==
X-CSE-MsgGUID: 2STpbdsXTi6r7/6RRIk7pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="206683362"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jan 2026 18:31:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcwr5-000000001c9-0TAy;
	Tue, 06 Jan 2026 02:31:31 +0000
Date: Tue, 06 Jan 2026 10:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 2/2]
 drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:13: warning: variable
 'cur_diff' set but not used
Message-ID: <202601061025.xct8dmi0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   c0fb027197aee899e12b0f1e3e712b4e4aac28b3
commit: bed7e25b0f57e67ce116b1bb4e85b7428c639970 [2/2] anolis: net: wangxun: txgbe: add support for wangxun 10G/25G/40G
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260106/202601061025.xct8dmi0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601061025.xct8dmi0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601061025.xct8dmi0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_xsk.h:7,
                    from drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:28:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_tx_timeout':
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:582:14: warning: variable 'real_tx_hang' set but not used [-Wunused-but-set-variable]
     582 |         bool real_tx_hang = false;
         |              ^~~~~~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: In function 'txgbe_do_lan_reset':
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:2618:28: warning: variable 'tx_ring' set but not used [-Wunused-but-set-variable]
    2618 |         struct txgbe_ring *tx_ring;
         |                            ^~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c: At top level:
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6915:6: warning: no previous prototype for 'txgbe_irq_rearm_queues' [-Wmissing-prototypes]
    6915 | void txgbe_irq_rearm_queues(struct txgbe_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_e56.h:8,
                    from drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:10:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c: In function 'txgbe_hic_get_lldp':
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7554:13: warning: variable 'status' set but not used [-Wunused-but-set-variable]
    7554 |         int status;
         |             ^~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c: In function 'txgbe_hic_notify_led_active':
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7687:13: warning: variable 'status' set but not used [-Wunused-but-set-variable]
    7687 |         int status;
         |             ^~~~~~
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:6:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^~~~~~~~
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:14:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c: In function 'txgbe_set_priv_flags':
   drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:1861:14: warning: variable 'reset_needed' set but not used [-Wunused-but-set-variable]
    1861 |         bool reset_needed = 0;
         |              ^~~~~~~~~~~~
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
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_e56.h:8,
                    from drivers/net/ethernet/wangxun/txgbe/txgbe_e56.c:4:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_e56.c: In function 'txgbe_e56_rxs_oscinit_temp_track':
>> drivers/net/ethernet/wangxun/txgbe/txgbe_e56.c:1480:13: warning: variable 'osc_freq_err_occur' set but not used [-Wunused-but-set-variable]
    1480 |         int osc_freq_err_occur;
         |             ^~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:816: warning: Function parameter or member 'pools' not described in 'txgbe_set_rar'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:816: warning: Excess function parameter 'vmdq' description in 'txgbe_set_rar'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:958: warning: Function parameter or member 'vmdq' not described in 'txgbe_add_uc_addr'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:1083: warning: Function parameter or member 'mc_addr' not described in 'txgbe_set_mta'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:1083: warning: Excess function parameter 'hash_value' description in 'txgbe_set_mta'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:1702: warning: expecting prototype for txgbe_enable_sec_Tx_path(). Prototype was for txgbe_enable_sec_tx_path() instead
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:1922: warning: Function parameter or member 'pool' not described in 'txgbe_set_vmdq'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:1922: warning: Excess function parameter 'vmdq' description in 'txgbe_set_vmdq'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:1936: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    *  This function should only be involved in the IOV mode.
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:3309: warning: bad line:                        (8.1542E-08)N^3 + (-1.6743E-11)N^4
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:3316: warning: Excess function parameter 'data' description in 'txgbe_get_thermal_sensor_data'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:4101: warning: expecting prototype for txgbe_init_phy_ops(). Prototype was for txgbe_init_phy_ops_sp() instead
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:4366: warning: expecting prototype for txgbe_get_link_capabilities(). Prototype was for txgbe_get_link_capabilities_sp() instead
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:5541: warning: expecting prototype for txgbe_setup_mac_link(). Prototype was for txgbe_setup_mac_link_sp() instead
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6219: warning: Function parameter or member 'input' not described in 'txgbe_atr_compute_sig_hash'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6219: warning: Function parameter or member 'common' not described in 'txgbe_atr_compute_sig_hash'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6219: warning: Excess function parameter 'stream' description in 'txgbe_atr_compute_sig_hash'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6283: warning: expecting prototype for txgbe_atr_add_signature_filter(). Prototype was for txgbe_fdir_add_signature_filter() instead
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6348: warning: Function parameter or member 'input' not described in 'txgbe_atr_compute_perfect_hash'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6348: warning: Excess function parameter 'atr_input' description in 'txgbe_atr_compute_perfect_hash'
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6934: warning: expecting prototype for txgbe_read_ee_hostif(). Prototype was for txgbe_read_ee_hostif_data() instead
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7088: warning: expecting prototype for txgbe_write_ee_hostif(). Prototype was for txgbe_write_ee_hostif_data() instead
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7415: warning: expecting prototype for txgbe_check_mac_link(). Prototype was for txgbe_check_mac_link_sp() instead
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_param.c:7:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h: In function 'txgbe_misc_isb':
>> drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:13: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^~~~~~~~
   drivers/net/ethernet/wangxun/txgbe/txgbe_param.c: In function 'txgbe_check_options':
>> drivers/net/ethernet/wangxun/txgbe/txgbe_param.c:918:29: warning: variable 'pstring' set but not used [-Wunused-but-set-variable]
     918 |                 const char *pstring;
         |                             ^~~~~~~
--
>> drivers/net/ethernet/wangxun/txgbe/txgbe_fcoe.c:26: warning: Function parameter or member 'ddp' not described in 'txgbe_fcoe_clear_ddp'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_fcoe.c:118: warning: Function parameter or member 'target_mode' not described in 'txgbe_fcoe_ddp_setup'
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
