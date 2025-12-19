Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9232C21FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766135710; cv=none; b=Q8yUulIRWPByT4ZU61ac/Rh+PnLGL+hRt3qwMc3zrOHLbbx3F+E1Wzzeg4HV7CY03gdymEiHqDQfjl28eBk3Q3JVPtCF8HkZOPk7Swo0PnWmmbo7F+e8QXOQf1xQOyzz2p5HDyagNCzrv6RpbRcq5pxdPy3fwm+xXREihRkqtUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766135710; c=relaxed/simple;
	bh=yibTQH3CeF36X+p7XVRLuioj8AZeIrb2cQHv1YJcEUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZX1G/UpVzueV82IrBFBje0as4LI5gCPT4Uc1IkhtoQPUKXsPfr+34/8flE5qeziSMHoVkiShgzOVG8z0W2EFACVCiuWqT960rv5uLzqz/AEgEKuZiHwceT2pHe9EviNvmvz8NYF2eABNXK6iZ4VSYT2Yh+BKfuwp9iqsTdkfaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcH6do+6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcH6do+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766135708; x=1797671708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yibTQH3CeF36X+p7XVRLuioj8AZeIrb2cQHv1YJcEUI=;
  b=mcH6do+6OhH7y++Vj5Zv+09EH61IbJwARClhF3HIoObEWSMHpt7ZU7vv
   Tv21bCa22NWlloHFGfPoq2WgTcKnV9JVnQ8KF8zA2faYG6+dz5J+xf39s
   ljHVk5aWdgxFF/bLCH06mT5fuQ8P0QfNd/DYYJMJ5rHkYuppoD9m+NAd/
   qP98RLWekUcXtxtlrkh3TIic6cjXJAOYH5ViXlr74nej3ntKaXlv0sGNO
   kk+6mxPDAdIOW8ipnK69y+fN2OhQ5uO5eu/4Iu5bwhLA1yWiuT/z9jgzY
   IyIateWu1xgzeQTitpElE/a7p0VzLOJh0Xyg19MmxKKTWz5XHNNphN8uk
   A==;
X-CSE-ConnectionGUID: Xjv4hAXaTmalMkvkHqipHQ==
X-CSE-MsgGUID: bdu+oWnqR3Gl8Fe+ehjnmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78732237"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78732237"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:15:07 -0800
X-CSE-ConnectionGUID: Bo/UTG6NSLWjzySkGa1uhw==
X-CSE-MsgGUID: tEsVqsGfSBGEZ4gVmzQi5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203209502"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Dec 2025 01:15:06 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWWZj-000000003Iz-2Dx6;
	Fri, 19 Dec 2025 09:15:03 +0000
Date: Fri, 19 Dec 2025 17:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/4]
 drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7402: warning: Function
 parameter or member 'adapter' not described in 'txgbe_linkdown_subtask'
Message-ID: <202512191730.8sVYUdwN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Duanqiang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   a2dd3d028a03896d70974c70f36eebc729c1d69f
commit: a899781823a6a54ad6e6182191e05f441b56d436 [0/4] anolis: net: txgbe: fix bond port rate is unknown when linkup
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251219/202512191730.8sVYUdwN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191730.8sVYUdwN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191730.8sVYUdwN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:329: warning: Function parameter or member 'quiet' not described in 'txgbe_read_reg'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:578: warning: Function parameter or member 'txqueue' not described in 'txgbe_tx_timeout'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:659: warning: Function parameter or member 'napi_budget' not described in 'txgbe_clean_tx_irq'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:659: warning: expecting prototype for txgbe_(). Prototype was for txgbe_clean_tx_irq() instead
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:1561: warning: Function parameter or member 'size' not described in 'txgbe_add_rx_frag'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:1561: warning: Excess function parameter 'rx_desc' description in 'txgbe_add_rx_frag'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:2184: warning: expecting prototype for ixgbe_update_itr(). Prototype was for txgbe_update_itr() instead
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:2570: warning: Function parameter or member 'queues' not described in 'txgbe_irq_enable'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:2570: warning: Function parameter or member 'flush' not described in 'txgbe_irq_enable'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:3077: warning: Function parameter or member 'adapter' not described in 'txgbe_configure_msi_and_legacy'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:3327: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return a number of entries in the RSS indirection table
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:3341: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write the RETA table to HW
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:3693: warning: Function parameter or member 'adapter' not described in 'txgbe_configure_bridge_mode'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4748: warning: Function parameter or member 'pb' not described in 'txgbe_lpbthresh'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:5694: warning: cannot understand function prototype: 'const u32 def_rss_key[10] = '
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6545: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * __txgbe_shutdown is not used when power management
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6899: warning: Function parameter or member 'adapter' not described in 'txgbe_fdir_reinit_subtask'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6953: warning: Function parameter or member 'adapter' not described in 'txgbe_check_hang_subtask'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7001: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_update_link'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7134: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_link_is_up'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7242: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_link_is_down'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7332: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_flush_tx'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7402: warning: Function parameter or member 'adapter' not described in 'txgbe_linkdown_subtask'
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7402: warning: expecting prototype for txgbe_watchdog_subtask(). Prototype was for txgbe_linkdown_subtask() instead
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7432: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_subtask'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7508: warning: Function parameter or member 'adapter' not described in 'txgbe_sfp_detection_subtask'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7589: warning: Function parameter or member 'adapter' not described in 'txgbe_sfp_link_config_subtask'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7690: warning: Function parameter or member 't' not described in 'txgbe_service_timer'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7690: warning: Excess function parameter 'data' description in 'txgbe_service_timer'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9190: warning: expecting prototype for skb_pad(). Prototype was for txgbe_skb_pad_nonzero() instead
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9804: warning: Function parameter or member 'dev' not described in 'txgbe_setup_tc'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9804: warning: Excess function parameter 'netdev' description in 'txgbe_setup_tc'


vim +7402 drivers/net/ethernet/wangxun/txgbe/txgbe_main.c

  7396	
  7397	/**
  7398	 * txgbe_watchdog_subtask - check and bring link up
  7399	 * @adapter - pointer to the device adapter structure
  7400	 **/
  7401	static void txgbe_linkdown_subtask(struct txgbe_adapter *adapter)
> 7402	{
  7403		u32 __maybe_unused value = 0;
  7404		struct txgbe_hw *hw = &adapter->hw;
  7405	
  7406		/* if interface is down do nothing */
  7407		if (test_bit(__TXGBE_DOWN, &adapter->state) ||
  7408		    test_bit(__TXGBE_REMOVING, &adapter->state) ||
  7409		    test_bit(__TXGBE_RESETTING, &adapter->state))
  7410			return;
  7411	
  7412		if (!(adapter->flags2 & TXGBE_FLAG2_LINK_DOWN))
  7413			txgbe_watchdog_update_link(adapter);
  7414	
  7415		if (!adapter->link_up)
  7416			txgbe_watchdog_link_is_down(adapter);
  7417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
