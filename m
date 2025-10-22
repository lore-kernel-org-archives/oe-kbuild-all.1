Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1137081F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 01:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761097660; cv=none; b=jXcde66BeRqkV7b/VyiXt5mpvF1Ahe12f7ya4lka/XAqW+VjDIgPMl/2Jv6148HqQxk9B06o5y2susAnp5Ge8lKJL37RHHKu+KwnF3HGzY7OyUr+hnX+G/QFsi16efJlFyNu/F3m+Juggy+Q1x4J7y2/aAJswSJFPK34zSklMHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761097660; c=relaxed/simple;
	bh=D82XOoM3RrXGENqMVxFkAyD5HzRnWMaSF5pL/ZxF3gk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RUrQeXF0fWHVMFY+21QeVTj27VZbYFgyBM1NaD3LL2RBuTX+ujlftEZCr/7fXp4k60KOhynuHq0ccowidQvQ7I8MIIuiqv2JaU9g1u3ij0BrRGX3ijbDexF1lrB5MQSjDaw8c+iPSyi+4JHEoaaPfzEN1YGk8zlCFDalfXLOKiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uik0qV7S; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uik0qV7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761097658; x=1792633658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D82XOoM3RrXGENqMVxFkAyD5HzRnWMaSF5pL/ZxF3gk=;
  b=Uik0qV7SSeC4409v1S5gaOx9r9kCXx9HZRXiRVclqnTUJ/BpnC0EbB9w
   bKZ31lDkGQt4NaQnpYfJw/KMqesJD+izfPHelxpGDrzBSPWkRdB00Jr5Q
   m5dB+FehvydCeKPVAjOpLEb68IZip35dMJDJGoilu+JW3VyeZNU9s09ES
   wAHMCDewU4WTJgpl6yHFDbKg0bntERQhESwzOe5ElGszAt7G+qUZCeXRV
   9j1/Fm3x9EynOHFY9hJynv4sqIOdAvoDlZ7nFxmGza3xynv/VrOnUw207
   6oYUxa+7SJFgOPzg7OXk4zFt1yUlTD0p6ArDNijYev7xoGF2IV7axrnMx
   A==;
X-CSE-ConnectionGUID: J69Kk8yLQ9Ku8CbxesdaTQ==
X-CSE-MsgGUID: V8wNgOpQR924ccI2K+j1vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63332403"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63332403"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 18:47:38 -0700
X-CSE-ConnectionGUID: S0Rl0XNBS4mpB+vLX6S+6Q==
X-CSE-MsgGUID: kCQ46rG3TBq3az56QjDuDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="188863194"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Oct 2025 18:47:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBNws-000BuW-2F;
	Wed, 22 Oct 2025 01:47:34 +0000
Date: Wed, 22 Oct 2025 09:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 16/16]
 drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7402: warning: Function
 parameter or member 'adapter' not described in 'txgbe_linkdown_subtask'
Message-ID: <202510220915.MUCCr8jZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   07d2947100f726bec0c31169ea3a2406115aff6f
commit: a899781823a6a54ad6e6182191e05f441b56d436 [16/16] anolis: net: txgbe: fix bond port rate is unknown when linkup
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251022/202510220915.MUCCr8jZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220915.MUCCr8jZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220915.MUCCr8jZ-lkp@intel.com/

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
