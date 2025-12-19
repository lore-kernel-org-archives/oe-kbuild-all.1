Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A072D27A92D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140695; cv=none; b=SGmFOk46Vw9B4fSagenn7wFhjYz4HPYlqi1m7YGLzbP90lxMF9AfQ0gedq8tv1jSusPeSqGfPou7xmTq9m9yZsqLnsxZcD8dPz0HUr0DD9Bnu5GHOA5UGZ1BTK7uU8hTfB8UcfA9sAC5lJc1BTPq1kBu/17m267fjhNr8IJYU1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140695; c=relaxed/simple;
	bh=1AYIYzz19TBFQ7ozDXZiR6odoodP/ILDBmPBkyQQuCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rqKq7fmw2T84ctY+5ePqjdpCeqfeARf2vcnsAUK2N16YihWXQjxijTRODRTtUvuk/Ha/j8RaSDTS65TpoEwc/vb7Mh6nlaobFVHeAJCPF9e9fc7rywn5cKBmMB5meWdmK5zGo8UgX1Gb4onrJ6LVUphiwmx3BKgVqpg2fPQN7eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/fABKkb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/fABKkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766140690; x=1797676690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1AYIYzz19TBFQ7ozDXZiR6odoodP/ILDBmPBkyQQuCE=;
  b=X/fABKkbxxm/r3p99FE/wwcDHAlt+7B3EfI8lvBSKv02RaId/VlReg13
   81wpLLBWot90utna+6OSf3HN/7tO9Pz+gtMVgYaOY9DJ4rsRhyNk5hzk7
   N9z3PzfFQLDtm4X2dPgJlHWEqxPPYXv8EjZJJyvArFOqb3AbTLqojmg4l
   +MyvNs8ZBLycEU955sPuKpOcXqAg2DTv/C3mTqJxnjie987oVTEwsCQeV
   NM88/0LLQzvhEsRA+L6RKar/iuWz/nk1/5E5y/bjulFd+5gd7la9TbNak
   KIUWAFWpV5HlmmYSiZgpei5eWbePzIi/uW97nxyHA5d0/0DxNo4/c5rnh
   w==;
X-CSE-ConnectionGUID: 0PsKOYHjTFmqmEs8QjHx2w==
X-CSE-MsgGUID: HLNv+2b4Q2OlUmtiVEWGNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68175684"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="68175684"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 02:38:09 -0800
X-CSE-ConnectionGUID: H6fYYWHiSWeGDSAJmk/moA==
X-CSE-MsgGUID: lVFaiw+VTD+7dnzYW7UTOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="203225810"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Dec 2025 02:38:08 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWXs6-000000003MX-18NV;
	Fri, 19 Dec 2025 10:38:06 +0000
Date: Fri, 19 Dec 2025 18:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/4]
 drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:559: warning: expecting
 prototype for ngbe_ptp_rx_rgtstamp(). Prototype was for
 ngbe_ptp_rx_hwtstamp() instead
Message-ID: <202512191805.3dwlR7jE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi linyuexie,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   a2dd3d028a03896d70974c70f36eebc729c1d69f
commit: 788b1c9f47ec15f115d5709c98220c2c17992476 [0/4] anolis:net: wangxun: ngbe: add support for wangxun 1G
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251219/202512191805.3dwlR7jE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191805.3dwlR7jE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191805.3dwlR7jE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:190: warning: Function parameter or member 'timestamp' not described in 'ngbe_ptp_convert_to_hwtstamp'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:190: warning: Excess function parameter 'systim' description in 'ngbe_ptp_convert_to_hwtstamp'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:211: warning: expecting prototype for txgbe_ptp_adjfreq(). Prototype was for ngbe_ptp_adjfine() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:343: warning: Excess function parameter 'eicr' description in 'ngbe_ptp_check_pps_event'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:559: warning: Function parameter or member 'adapter' not described in 'ngbe_ptp_rx_hwtstamp'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:559: warning: expecting prototype for ngbe_ptp_rx_rgtstamp(). Prototype was for ngbe_ptp_rx_hwtstamp() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:586: warning: Function parameter or member 'ifr' not described in 'ngbe_ptp_get_ts_config'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:586: warning: Excess function parameter 'ifreq' description in 'ngbe_ptp_get_ts_config'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:726: warning: Function parameter or member 'ifr' not described in 'ngbe_ptp_set_ts_config'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:726: warning: Excess function parameter 'ifreq' description in 'ngbe_ptp_set_ts_config'
--
>> drivers/net/ethernet/wangxun/ngbe/ngbe_lib.c:316: warning: Function parameter or member 'xdp_count' not described in 'ngbe_alloc_q_vector'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_lib.c:316: warning: Function parameter or member 'xdp_idx' not described in 'ngbe_alloc_q_vector'
--
   drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:161: warning: expecting prototype for ngbe_pet_vfs(). Prototype was for ngbe_put_vfs() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:1173: warning: expecting prototype for nxgbe_set_all_vfs(). Prototype was for ngbe_set_all_vfs() instead
--
   drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:120: warning: Function parameter or member 'device_type' not described in 'ngbe_phy_read_reg_mdi'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:120: warning: expecting prototype for ngbe_read_phy_mdi(). Prototype was for ngbe_phy_read_reg_mdi() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:158: warning: expecting prototype for ngbe_write_phy_reg_mdi(). Prototype was for ngbe_phy_write_reg_mdi() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:877: warning: expecting prototype for ngbe_identify_module(). Prototype was for ngbe_phy_identify() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:1737: warning: expecting prototype for ngbe_tn_check_overtemp(). Prototype was for ngbe_phy_check_overtemp() instead
--
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:516: warning: Function parameter or member 'pools' not described in 'ngbe_set_rar'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:516: warning: Excess function parameter 'vmdq' description in 'ngbe_set_rar'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:653: warning: Function parameter or member 'vmdq' not described in 'ngbe_add_uc_addr'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:781: warning: Function parameter or member 'mc_addr' not described in 'ngbe_set_mta'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:781: warning: Excess function parameter 'hash_value' description in 'ngbe_set_mta'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:1376: warning: Function parameter or member 'pool' not described in 'ngbe_set_vmdq'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:1376: warning: Excess function parameter 'vmdq' description in 'ngbe_set_vmdq'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:1389: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    *  This function should only be involved in the IOV mode.
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:2590: warning: bad line:                        (8.1542E-08)N^3 + (-1.6743E-11)N^4
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:2596: warning: Excess function parameter 'data' description in 'ngbe_get_thermal_sensor_data'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:2929: warning: Function parameter or member 'need_restart_AN' not described in 'ngbe_setup_copper_link'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:2929: warning: Excess function parameter 'autoneg_wait_to_complete' description in 'ngbe_setup_copper_link'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3326: warning: expecting prototype for ngbe_read_ee_hostif(). Prototype was for ngbe_read_ee_hostif_data() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3629: warning: expecting prototype for ngbe_read_ee_hostif(). Prototype was for ngbe_read_ee_hostif_data32() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3665: warning: expecting prototype for ngbe_read_ee_hostif(). Prototype was for ngbe_read_ee_hostif32() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3686: warning: expecting prototype for ngbe_write_ee_hostif(). Prototype was for ngbe_write_ee_hostif_data() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3737: warning: expecting prototype for ngbe_write_ee_hostif(). Prototype was for ngbe_write_ee_hostif_data32() instead
--
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:637: warning: Function parameter or member 'quiet' not described in 'ngbe_read_reg'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:825: warning: Function parameter or member 'txqueue' not described in 'ngbe_tx_timeout'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2478: warning: Function parameter or member 'queues' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2478: warning: Function parameter or member 'flush' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2874: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_msi_and_legacy'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3047: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return a number of entries in the RSS indirection table
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3059: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write the RETA table to HW
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3270: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_bridge_mode'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3729: warning: Function parameter or member 'pool' not described in 'ngbe_write_uc_addr_list'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:4745: warning: cannot understand function prototype: 'const u32 def_rss_key[10] = '
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5694: warning: Function parameter or member 'adapter' not described in 'ngbe_check_hang_subtask'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5771: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_update_link_status'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5771: warning: expecting prototype for ngbe_watchdog_update_link(). Prototype was for ngbe_watchdog_update_link_status() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5867: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_up'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5913: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_down'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5984: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_flush_tx'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6051: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_subtask'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6081: warning: Function parameter or member 't' not described in 'ngbe_service_timer'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6081: warning: Excess function parameter 'data' description in 'ngbe_service_timer'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6939: warning: Function parameter or member 'dev' not described in 'ngbe_setup_tc'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6939: warning: Excess function parameter 'netdev' description in 'ngbe_setup_tc'


vim +559 drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c

   549	
   550	/**
   551	 * ngbe_ptp_rx_rgtstamp - utility function which checks for RX time stamp
   552	 * @q_vector: structure containing interrupt and ring information
   553	 * @skb: particular skb to send timestamp with
   554	 * if the timestamp is valid, we convert it into the timecounter ns
   555	 * value, then store that result into the shhwtstamps structure which
   556	 * is passed up the network stack
   557	 */
   558	void ngbe_ptp_rx_hwtstamp(struct ngbe_adapter *adapter, struct sk_buff *skb)
 > 559	{
   560		struct ngbe_hw *hw = &adapter->hw;
   561		u64 regval = 0;
   562		u32 tsyncrxctl;
   563	
   564		/* Read the tsyncrxctl register afterwards in order to prevent taking an
   565		 * I/O hit on every packet.
   566		 */
   567		tsyncrxctl = rd32(hw, NGBE_PSR_1588_CTL);
   568		if (!(tsyncrxctl & NGBE_PSR_1588_CTL_VALID))
   569			return;
   570	
   571		regval |= (u64)rd32(hw, NGBE_PSR_1588_STMPL);
   572		regval |= (u64)rd32(hw, NGBE_PSR_1588_STMPH) << 32;
   573	
   574		ngbe_ptp_convert_to_hwtstamp(adapter, skb_hwtstamps(skb), regval);
   575	}
   576	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
