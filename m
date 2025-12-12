Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ADA2E093F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765528124; cv=none; b=EMYEiAvtrfP5Yt7Ek26HGZaDITuCssyh4xFwuom6hnTFTR7Hs3EXDzfEjrX2M5iBLUMgFvpokqY07MOqZuJlLmKvnk8TtcF8KJYPdd8YMiP+luNIP7l1H+uwFpDrIXGmtPVj77B1jgnUuB+4LV3HM9Khu+5XFmx/bqhKvucqu4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765528124; c=relaxed/simple;
	bh=GiX8dYfG7ahc72t1p6sdplT0iOjvny5AARcqMxU3Cpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k7TRP0ucuhby4y8L9ztjyPqG4A2QU32mS57KZzOMPPSP2lTUUxJ0zhou3ilso9/DMkfugfs45bYibY0pyIvTPiRdbasRSP2zGlX8BWHeS3fqVrOYOBT7Lgt+mbgF+u5QLRvCQo7wcuWXWAYgrmNuoB4nLzftBv2UVi3nEjDCwD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtePkDKa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtePkDKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765528123; x=1797064123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GiX8dYfG7ahc72t1p6sdplT0iOjvny5AARcqMxU3Cpc=;
  b=LtePkDKabPNwj0yaD3QBvSU2q2PVEZyQy6sIJIqHSLu1cAslUUDdv+Rn
   H+zNQQHD4RvbY13GXF9LIXI6MUEOrjD45661k06zd6eTTR6k2FD4axnbA
   Cm5uWBaHixNB8tHZ+8JAsT2othL7w1aEi/X5gMV/DHF6gs8uxA1A14Hfv
   gXgJM7npzSiNfFCsHRDDUfaXjmNtf+o7Me571eorpxhaSCSVm/u4pyfi1
   GVZTjy899mOSRjZKve1PzWftON2cGPBGPcAA3qGOpv3SmGiOGOjiI0+II
   Pk9EH5tuG2Dch0PfgIQL6q5wWf4ytOyPv0FDyeFxTkbeD4fJThARMaRTz
   A==;
X-CSE-ConnectionGUID: S6KtOjZ4RuasDul1Iz0VXg==
X-CSE-MsgGUID: 3f9qiJn/THKAiiytPpR2fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67404262"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67404262"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 00:28:43 -0800
X-CSE-ConnectionGUID: m6r5iFyzR+CEdtOQ9g15uw==
X-CSE-MsgGUID: n69K2R/aQECkvd2IRG0Tbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196788324"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Dec 2025 00:28:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTyVw-000000005nD-2vOA;
	Fri, 12 Dec 2025 08:28:36 +0000
Date: Fri, 12 Dec 2025 16:27:56 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2478: warning: Function
 parameter or member 'queues' not described in 'ngbe_irq_enable'
Message-ID: <202512121658.oQFev7oJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   48fa9d861c1eb99e9f682fb2623142fb456aa0eb
commit: 788b1c9f47ec15f115d5709c98220c2c17992476 [25/25] anolis:net: wangxun: ngbe: add support for wangxun 1G
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512121658.oQFev7oJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121658.oQFev7oJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121658.oQFev7oJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:190: warning: Function parameter or member 'timestamp' not described in 'ngbe_ptp_convert_to_hwtstamp'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:190: warning: Excess function parameter 'systim' description in 'ngbe_ptp_convert_to_hwtstamp'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:211: warning: expecting prototype for txgbe_ptp_adjfreq(). Prototype was for ngbe_ptp_adjfine() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:343: warning: Excess function parameter 'eicr' description in 'ngbe_ptp_check_pps_event'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:559: warning: Function parameter or member 'adapter' not described in 'ngbe_ptp_rx_hwtstamp'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:559: warning: expecting prototype for ngbe_ptp_rx_rgtstamp(). Prototype was for ngbe_ptp_rx_hwtstamp() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:586: warning: Function parameter or member 'ifr' not described in 'ngbe_ptp_get_ts_config'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:586: warning: Excess function parameter 'ifreq' description in 'ngbe_ptp_get_ts_config'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:726: warning: Function parameter or member 'ifr' not described in 'ngbe_ptp_set_ts_config'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:726: warning: Excess function parameter 'ifreq' description in 'ngbe_ptp_set_ts_config'
--
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:637: warning: Function parameter or member 'quiet' not described in 'ngbe_read_reg'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:825: warning: Function parameter or member 'txqueue' not described in 'ngbe_tx_timeout'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2478: warning: Function parameter or member 'queues' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2478: warning: Function parameter or member 'flush' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2874: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_msi_and_legacy'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3047: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return a number of entries in the RSS indirection table
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3059: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write the RETA table to HW
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3270: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_bridge_mode'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3729: warning: Function parameter or member 'pool' not described in 'ngbe_write_uc_addr_list'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:4745: warning: cannot understand function prototype: 'const u32 def_rss_key[10] = '
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5694: warning: Function parameter or member 'adapter' not described in 'ngbe_check_hang_subtask'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5771: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_update_link_status'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5771: warning: expecting prototype for ngbe_watchdog_update_link(). Prototype was for ngbe_watchdog_update_link_status() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5867: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_up'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5913: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_down'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5984: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_flush_tx'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6051: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_subtask'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6081: warning: Function parameter or member 't' not described in 'ngbe_service_timer'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6081: warning: Excess function parameter 'data' description in 'ngbe_service_timer'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6939: warning: Function parameter or member 'dev' not described in 'ngbe_setup_tc'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6939: warning: Excess function parameter 'netdev' description in 'ngbe_setup_tc'


vim +2478 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c

  2472	
  2473	/**
  2474	 * ngbe_irq_enable - Enable default interrupt generation settings
  2475	 * @adapter: board private structure
  2476	 **/
  2477	void ngbe_irq_enable(struct ngbe_adapter *adapter, bool queues, bool flush)
> 2478	{
  2479		u32 mask = 0;
  2480		struct ngbe_hw *hw = &adapter->hw;
  2481	
  2482		/* enable misc interrupt */
  2483		mask = NGBE_PX_MISC_IEN_MASK;
  2484	
  2485		if (adapter->flags2 & NGBE_FLAG2_TEMP_SENSOR_CAPABLE)
  2486			mask |= NGBE_PX_MISC_IEN_OVER_HEAT;
  2487	
  2488		mask |= NGBE_PX_MISC_IEN_TIMESYNC;
  2489	
  2490		if (hw->gpio_ctl == 1)
  2491			wr32(&adapter->hw, NGBE_GPIO_DDR, 0x1);
  2492		else
  2493			wr32(&adapter->hw, NGBE_GPIO_DDR, 0x0);
  2494	
  2495		wr32(&adapter->hw, NGBE_GPIO_INTEN, 0x3);
  2496		wr32(&adapter->hw, NGBE_GPIO_INTTYPE_LEVEL, 0x0);
  2497		if (adapter->hw.phy.type == ngbe_phy_yt8521s_sfi ||
  2498		    adapter->hw.phy.type == ngbe_phy_internal_yt8521s_sfi ||
  2499		    adapter->hw.phy.type == ngbe_phy_external)
  2500			wr32(&adapter->hw, NGBE_GPIO_POLARITY, 0x0);
  2501		else
  2502			wr32(&adapter->hw, NGBE_GPIO_POLARITY, 0x3);
  2503	
  2504		if (adapter->hw.phy.type == ngbe_phy_yt8521s_sfi ||
  2505		    adapter->hw.phy.type == ngbe_phy_internal_yt8521s_sfi ||
  2506		    adapter->hw.phy.type == ngbe_phy_external)
  2507			mask |= NGBE_PX_MISC_IEN_GPIO;
  2508		//		mask &= ~NGBE_PX_MISC_IEN_GPIO;
  2509	
  2510		wr32(hw, NGBE_PX_MISC_IEN, mask);
  2511	
  2512		/* unmask interrupt */
  2513		if (queues) {
  2514			ngbe_intr_enable(&adapter->hw, NGBE_INTR_ALL);
  2515		} else {
  2516			if (!(adapter->flags2 & NGBE_FLAG2_SRIOV_MISC_IRQ_REMAP))
  2517				ngbe_intr_enable(&adapter->hw, NGBE_INTR_MISC(adapter));
  2518			else
  2519				ngbe_intr_enable(&adapter->hw, NGBE_INTR_MISC_VMDQ(adapter));
  2520		}
  2521	
  2522		/* flush configuration */
  2523		if (flush)
  2524			NGBE_WRITE_FLUSH(&adapter->hw);
  2525	}
  2526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
