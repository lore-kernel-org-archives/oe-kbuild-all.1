Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDC72690D1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246907; cv=none; b=rFNBWlFcLKfLFT+layYu838hp4O49k05pDaH5voDnLfAFsG+VbY7W7P0mNTU3l0qHMGtRo7CQGQ/2sMR8dBv9Q0oaM7akDCUGwvQWB24Gg/Cys/XbneEPkcv/llNSfFe3SzAW+4o8oKC2NU53AGD0mqrgoifbrCSAP+5b0pJcCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246907; c=relaxed/simple;
	bh=3bZ6vaiUhMDRBzCbtgxmx9183akSVQ4oIhHdYlv2ozY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sp6j1GylDYnWAs5pG9n9kbQItaHrzMsOXxuF3xr6qK95noIm1NgOMSfJvFBAW1eEWIJbfWjXdi+lbWroA28XJ7GN65DiPCYYrleScZ2k1hekFrB0A17eGeLw/yw77/yYKHUQ9dFx1h57YRxTtVOWRlonNlVvRdY/DmBUC7oOpoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xj0IwM9/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xj0IwM9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766246906; x=1797782906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3bZ6vaiUhMDRBzCbtgxmx9183akSVQ4oIhHdYlv2ozY=;
  b=Xj0IwM9//UNgG+OVksRqoxDMQtFNNisXSnNi8RjqIiF90UdXP3UbyNoF
   NF/bAqhPTWT1QENxt6lURZimSbRaLcRdgLbvCqQS7gAZziY3mG4Wu2z4b
   USMtP8pViQEO2AoUnwqYqnn07poWj3fXFtzgAO+dFz1J6bSpTULiuCoeq
   6PvwLXlJhdxpXIyUxa8CyKXq0Gxt/YSFvRYvDdwAVNZIeJMm0G7+kDl5M
   dPG0IsX/210M4IpJhnkBpmekqVWkYe5NI92hOYyYRPfUl3UkysiAoAD+R
   htspylj/rPENNnQZqmMMjAdmGcWMWJyKvYinbeSu/gL5yV9MYTJVq1xRk
   A==;
X-CSE-ConnectionGUID: daXXkX4/SbaMWaRPdt9iDg==
X-CSE-MsgGUID: MgSPDxiqRpyDExU64Gkfwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78814090"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78814090"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:08:25 -0800
X-CSE-ConnectionGUID: j+L1NsVyTeyAo/fx4jVuhQ==
X-CSE-MsgGUID: OipiijdmSCWVpcqw7aDRCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198367556"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Dec 2025 08:08:24 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzVF-000000004pv-0d8R;
	Sat, 20 Dec 2025 16:08:21 +0000
Date: Sun, 21 Dec 2025 00:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3560/3560]
 drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:4272:6: warning: variable
 'status' set but not used
Message-ID: <202512202331.85546LYE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 0e80b39fcf6c1b2a13b11f8632b185a89b012b14 [3560/3560] net: wangxun: ngbe: add support for wangxun 1G
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251220/202512202331.85546LYE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202331.85546LYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202331.85546LYE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3772:6: warning: variable 'vlvfb' set but not used [-Wunused-but-set-variable]
    3772 |         u32 vlvfb;
         |             ^
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3878:20: warning: variable 'vlnctrl' set but not used [-Wunused-but-set-variable]
    3878 |         u32 fctrl, vmolr, vlnctrl;
         |                           ^
   2 warnings generated.
--
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:4272:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
    4272 |         int status;
         |             ^
   1 warning generated.
--
   drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:120: warning: Function parameter or member 'device_type' not described in 'ngbe_phy_read_reg_mdi'
   drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:120: warning: expecting prototype for ngbe_read_phy_mdi(). Prototype was for ngbe_phy_read_reg_mdi() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:158: warning: expecting prototype for ngbe_write_phy_reg_mdi(). Prototype was for ngbe_phy_write_reg_mdi() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:877: warning: expecting prototype for ngbe_identify_module(). Prototype was for ngbe_phy_identify() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:1737: warning: expecting prototype for ngbe_tn_check_overtemp(). Prototype was for ngbe_phy_check_overtemp() instead
--
>> drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:161: warning: expecting prototype for ngbe_pet_vfs(). Prototype was for ngbe_put_vfs() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:1173: warning: expecting prototype for nxgbe_set_all_vfs(). Prototype was for ngbe_set_all_vfs() instead
--
>> drivers/net/ethernet/wangxun/ngbe/ngbe_debugfs.c:34: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * data operation
   drivers/net/ethernet/wangxun/ngbe/ngbe_debugfs.c:198: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * reg_ops operation
   drivers/net/ethernet/wangxun/ngbe/ngbe_debugfs.c:335: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * netdev_ops operation
   drivers/net/ethernet/wangxun/ngbe/ngbe_debugfs.c:445: warning: Function parameter or member 'adapter' not described in 'ngbe_dbg_adapter_exit'
   drivers/net/ethernet/wangxun/ngbe/ngbe_debugfs.c:445: warning: Excess function parameter 'pf' description in 'ngbe_dbg_adapter_exit'
   drivers/net/ethernet/wangxun/ngbe/ngbe_debugfs.c:478: warning: Function parameter or member 'adapter' not described in 'ngbe_dump'
--
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:516: warning: Function parameter or member 'pools' not described in 'ngbe_set_rar'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:516: warning: Excess function parameter 'vmdq' description in 'ngbe_set_rar'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:653: warning: Function parameter or member 'vmdq' not described in 'ngbe_add_uc_addr'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:781: warning: Function parameter or member 'mc_addr' not described in 'ngbe_set_mta'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:781: warning: Excess function parameter 'hash_value' description in 'ngbe_set_mta'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:1376: warning: Function parameter or member 'pool' not described in 'ngbe_set_vmdq'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:1376: warning: Excess function parameter 'vmdq' description in 'ngbe_set_vmdq'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:1389: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    *  This function should only be involved in the IOV mode.
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:2590: warning: bad line:                        (8.1542E-08)N^3 + (-1.6743E-11)N^4
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:2596: warning: Excess function parameter 'data' description in 'ngbe_get_thermal_sensor_data'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:2931: warning: Function parameter or member 'need_restart_AN' not described in 'ngbe_setup_copper_link'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:2931: warning: Excess function parameter 'autoneg_wait_to_complete' description in 'ngbe_setup_copper_link'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3328: warning: expecting prototype for ngbe_read_ee_hostif(). Prototype was for ngbe_read_ee_hostif_data() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3631: warning: expecting prototype for ngbe_read_ee_hostif(). Prototype was for ngbe_read_ee_hostif_data32() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3667: warning: expecting prototype for ngbe_read_ee_hostif(). Prototype was for ngbe_read_ee_hostif32() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3688: warning: expecting prototype for ngbe_write_ee_hostif(). Prototype was for ngbe_write_ee_hostif_data() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3739: warning: expecting prototype for ngbe_write_ee_hostif(). Prototype was for ngbe_write_ee_hostif_data32() instead
--
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:637: warning: Function parameter or member 'quiet' not described in 'ngbe_read_reg'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:825: warning: Function parameter or member 'txqueue' not described in 'ngbe_tx_timeout'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2478: warning: Function parameter or member 'queues' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2478: warning: Function parameter or member 'flush' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2874: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_msi_and_legacy'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3047: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return a number of entries in the RSS indirection table
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3059: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write the RETA table to HW
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3270: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_bridge_mode'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3729: warning: Function parameter or member 'pool' not described in 'ngbe_write_uc_addr_list'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:4745: warning: cannot understand function prototype: 'const u32 def_rss_key[10] = '
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5694: warning: Function parameter or member 'adapter' not described in 'ngbe_check_hang_subtask'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5771: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_update_link_status'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5771: warning: expecting prototype for ngbe_watchdog_update_link(). Prototype was for ngbe_watchdog_update_link_status() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5867: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_up'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5913: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_down'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5984: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_flush_tx'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6051: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_subtask'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6081: warning: Function parameter or member 't' not described in 'ngbe_service_timer'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6081: warning: Excess function parameter 'data' description in 'ngbe_service_timer'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6939: warning: Function parameter or member 'dev' not described in 'ngbe_setup_tc'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6939: warning: Excess function parameter 'netdev' description in 'ngbe_setup_tc'


vim +/status +4272 drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c

  4269	
  4270	int ngbe_hic_get_lldp(struct ngbe_hw *hw)
  4271	{
> 4272		int status;
  4273		struct ngbe_hic_write_lldp buffer;
  4274	
  4275		buffer.hdr.cmd = 0xf5;
  4276		buffer.hdr.buf_len = 0x1;
  4277		buffer.hdr.cmd_or_resp.cmd_resv = FW_CEM_CMD_RESERVED;
  4278		buffer.hdr.checksum = FW_DEFAULT_CHECKSUM;
  4279		buffer.func = hw->bus.lan_id;
  4280	
  4281		status = ngbe_host_interface_command(hw, (u32 *)&buffer, sizeof(buffer), 5000, true);
  4282		if (buffer.hdr.cmd_or_resp.ret_status == 0x80)
  4283			return -1;
  4284		else
  4285			return (int)buffer.func;
  4286	}
  4287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
