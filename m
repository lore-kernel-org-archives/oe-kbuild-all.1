Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CBAE573
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 06:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765520794; cv=none; b=Pj5poxeHlTE5xrcx9kiuV8wT79zalfcWP4zbJmyvlr2/BYSHB0QG0hnyRNj575NBdmwfAdD4IhAKr4XzmDxEgjB6vsBt/hqEdkujt3TpmOeXcg/1QUuUHBj7W5qTKZqR0q5B921yWx7zxVRZDoq3+PfgHl/00k1f/AEfQmLb0ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765520794; c=relaxed/simple;
	bh=7d01ki1jXZzjbhU5BIVYHe2ZcR/spCXIvq0tyz4qjIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OPYFzFIBIzMiNY3qNJKfDSg3qGYHsTnrO62wTn9WbWIqQl6UPDiswf9geCQ4TovCCDq4iP+jMfqkERuo0ms50iWvCJgHVfpzCyZi0Xb/am2ibwy+cfBuH1P/MrsvROTzEOLNI/etmD2mzCXEUQktiYDlZn3832zCo3tvyEjBzU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I47saalr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I47saalr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765520793; x=1797056793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7d01ki1jXZzjbhU5BIVYHe2ZcR/spCXIvq0tyz4qjIM=;
  b=I47saalrkcqjUtGyz2HU3rSAGFLQyMyXBwH+nog0osPH+hFx6UGJ+mbE
   GNiKO2asdJl+entKOlhJv3Jv7vcUh20xC9RrtuK+w7DAqYRrMWDq7YEcG
   ZMxd9mLIKHFVTGzNvfY7F3BKHVIqbrN4mtIh6cewEzxU0rjEwiHZFgUf4
   UtfE6pchYCrGYjIR7Fdv7z2oT3ho/MySQnj7MgUp7vYTn4Mijv2gkf+L4
   X6Yj4EL2zVsN0yIO1BxWNIa/n5pg/yzAB+UHX66DxyW2lEN6Kxdp6GGfK
   P0uFS/zS9zLJXdpyu5nhUUzZ3k/8+m/EeVvfF652MS0RkJvwLV4cLgkhb
   Q==;
X-CSE-ConnectionGUID: T7Kx5vf2TgugaasauhgapQ==
X-CSE-MsgGUID: 9JonyDHLSXm2tuQPaDbycw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67549923"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67549923"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 22:26:32 -0800
X-CSE-ConnectionGUID: Fq90b39UTkicsaGXXO7ZEA==
X-CSE-MsgGUID: Gh6+VOCORhSd00QrYVMRbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196907873"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Dec 2025 22:26:31 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTwbl-000000005f4-053l;
	Fri, 12 Dec 2025 06:26:29 +0000
Date: Fri, 12 Dec 2025 14:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:3682: warning: Function
 parameter or member 'adapter' not described in 'txgbe_configure_bridge_mode'
Message-ID: <202512121422.odp5zpbB-lkp@intel.com>
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
commit: bed7e25b0f57e67ce116b1bb4e85b7428c639970 [25/25] anolis: net: wangxun: txgbe: add support for wangxun 10G/25G/40G
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512121422.odp5zpbB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121422.odp5zpbB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121422.odp5zpbB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:328: warning: Function parameter or member 'quiet' not described in 'txgbe_read_reg'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:577: warning: Function parameter or member 'txqueue' not described in 'txgbe_tx_timeout'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:658: warning: Function parameter or member 'napi_budget' not described in 'txgbe_clean_tx_irq'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:658: warning: expecting prototype for txgbe_(). Prototype was for txgbe_clean_tx_irq() instead
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:1550: warning: Function parameter or member 'size' not described in 'txgbe_add_rx_frag'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:1550: warning: Excess function parameter 'rx_desc' description in 'txgbe_add_rx_frag'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:2173: warning: expecting prototype for ixgbe_update_itr(). Prototype was for txgbe_update_itr() instead
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:2559: warning: Function parameter or member 'queues' not described in 'txgbe_irq_enable'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:2559: warning: Function parameter or member 'flush' not described in 'txgbe_irq_enable'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:3066: warning: Function parameter or member 'adapter' not described in 'txgbe_configure_msi_and_legacy'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:3316: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return a number of entries in the RSS indirection table
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:3330: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write the RETA table to HW
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:3682: warning: Function parameter or member 'adapter' not described in 'txgbe_configure_bridge_mode'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:4735: warning: Function parameter or member 'pb' not described in 'txgbe_lpbthresh'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:5679: warning: cannot understand function prototype: 'const u32 def_rss_key[10] = '
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6530: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * __txgbe_shutdown is not used when power management
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6884: warning: Function parameter or member 'adapter' not described in 'txgbe_fdir_reinit_subtask'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6939: warning: Function parameter or member 'adapter' not described in 'txgbe_check_hang_subtask'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6976: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_update_link'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7109: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_link_is_up'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7217: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_link_is_down'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7307: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_flush_tx'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7377: warning: Function parameter or member 'adapter' not described in 'txgbe_watchdog_subtask'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7453: warning: Function parameter or member 'adapter' not described in 'txgbe_sfp_detection_subtask'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7534: warning: Function parameter or member 'adapter' not described in 'txgbe_sfp_link_config_subtask'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7635: warning: Function parameter or member 't' not described in 'txgbe_service_timer'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7635: warning: Excess function parameter 'data' description in 'txgbe_service_timer'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9125: warning: expecting prototype for skb_pad(). Prototype was for txgbe_skb_pad_nonzero() instead
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9739: warning: Function parameter or member 'dev' not described in 'txgbe_setup_tc'
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9739: warning: Excess function parameter 'netdev' description in 'txgbe_setup_tc'


vim +3682 drivers/net/ethernet/wangxun/txgbe/txgbe_main.c

  3673	
  3674	/**
  3675	 * txgbe_configure_bridge_mode - common settings for configuring bridge mode
  3676	 * @adapter - the private structure
  3677	 *
  3678	 * This function's purpose is to remove code duplication and configure some
  3679	 * settings require to switch bridge modes.
  3680	 **/
  3681	static void txgbe_configure_bridge_mode(struct txgbe_adapter *adapter)
> 3682	{
  3683		struct txgbe_hw *hw = &adapter->hw;
  3684	
  3685		if (adapter->flags & TXGBE_FLAG_SRIOV_VEPA_BRIDGE_MODE) {
  3686			/* disable Tx loopback, rely on switch hairpin mode */
  3687			wr32m(hw, TXGBE_PSR_CTL,
  3688			      TXGBE_PSR_CTL_SW_EN, 0);
  3689	
  3690		} else {
  3691			/* enable Tx loopback for internal VF/PF communication */
  3692			wr32m(hw, TXGBE_PSR_CTL,
  3693			      TXGBE_PSR_CTL_SW_EN, TXGBE_PSR_CTL_SW_EN);
  3694		}
  3695	}
  3696	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
