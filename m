Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E8012AAE0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 18:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708711930; cv=none; b=Mf7tLdEUXLPKNdes0TNiqfNOhQ5lFn86/XxvixKunsjSSl7gqEWFZNePu9vJnPPHMvNxpMHZbXCcOJ0c8lCIPv+50sP2f+zOGl4gR7gk8ZQDR/vLCd5xgvxFigmfRVnTggB/21hTN5MI5/q1iHkI13/FOd0IL9aOnN1Hm5h8pEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708711930; c=relaxed/simple;
	bh=5FYsfkHPILYZmyEevMpOwUlEbUXhuMK0hVWjvW+Lgj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g8U5efchm6e+9/MaBjk7OPAp3JQ8MNVujfO+ZSQgIFix8fiQI0bKLC45+lbcNmvVkRM/mFpW6ehFWrDc3iRh0hiClYR4IQU+zcP7LQk8kcDO4fno+Ua8jN2651zSWkvjSMruo4PZh6/UggSSXFUgQyZS8g8BCon3kvxU2Vc9e2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0dkUZtS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0dkUZtS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708711928; x=1740247928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5FYsfkHPILYZmyEevMpOwUlEbUXhuMK0hVWjvW+Lgj8=;
  b=Z0dkUZtSG+q6aTYkhoRGhNfq6xY1UoEvBMLrCeWyMZpI7xT5K5KENDu2
   vMQLr4ChgYjRvO9qMIykaHx9YIQW7Eq0mc6XgWMwosZ2u/xTsXvCq6MxW
   OS5f3eAD5Ej5khekQRiD9bEiQ7YzKkw85WHe4NzdS0N9BGKF7wpiif54b
   V7PS6PIZqJTvZMGZ6VKwyhkgMGsV0AzFJK7PgMHKLixKDOm4kMYG5sIxU
   IohcUjHIAc6k1sPKizVXOe1yxs0qmoJHcJFiMsJiOQr1kZ/Rah47RKPDD
   nPMphiNZdrBG/ahjk78rvNjsMKqc/mL+dl6pEl4NqyapiDYRT7/m0OR2D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="13685098"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="13685098"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 10:12:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="10684098"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Feb 2024 10:12:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rda1P-0007kK-2X;
	Fri, 23 Feb 2024 18:11:49 +0000
Date: Sat, 24 Feb 2024 02:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/net/ethernet/intel/e1000e/linux/80003es2lan.c:1081: warning:
 Excess function parameter 'duplex' description in
 'e1000_cfg_on_link_up_80003es2lan'
Message-ID: <202402240238.alHNP9ev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi caelli,

First bad commit (maybe != root cause):

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: f219393fa69408fc55e023efbf174c3c0347abac driver: update e1000e to 3.8.4
date:   12 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240224/202402240238.alHNP9ev-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240238.alHNP9ev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240238.alHNP9ev-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/e1000e/linux/ptp.c:154: warning: Function parameter or member 'xtstamp' not described in 'e1000e_phc_getcrosststamp'
>> drivers/net/ethernet/intel/e1000e/linux/ptp.c:154: warning: Excess function parameter 'cts' description in 'e1000e_phc_getcrosststamp'
--
>> drivers/net/ethernet/intel/e1000e/linux/80003es2lan.c:1081: warning: Excess function parameter 'duplex' description in 'e1000_cfg_on_link_up_80003es2lan'
--
>> drivers/net/ethernet/intel/e1000e/linux/phy.c:2318: warning: Function parameter or member 'reg' not described in 'e1000_get_phy_addr_for_bm_page'
>> drivers/net/ethernet/intel/e1000e/linux/phy.c:2738: warning: Function parameter or member 'page_set' not described in '__e1000_read_phy_reg_hv'
>> drivers/net/ethernet/intel/e1000e/linux/phy.c:2845: warning: Function parameter or member 'page_set' not described in '__e1000_write_phy_reg_hv'
--
>> drivers/net/ethernet/intel/e1000e/linux/ich8lan.c:746: warning: Function parameter or member 'address' not described in '__e1000_access_emi_reg_locked'
>> drivers/net/ethernet/intel/e1000e/linux/ich8lan.c:746: warning: Excess function parameter 'addr' description in '__e1000_access_emi_reg_locked'
>> drivers/net/ethernet/intel/e1000e/linux/ich8lan.c:2265: warning: Function parameter or member 'k1_enable' not described in 'e1000_configure_k1_ich8lan'
>> drivers/net/ethernet/intel/e1000e/linux/ich8lan.c:2265: warning: Excess function parameter 'enable' description in 'e1000_configure_k1_ich8lan'
>> drivers/net/ethernet/intel/e1000e/linux/ich8lan.c:2400: warning: Function parameter or member 'hw' not described in 'e1000_hv_phy_workarounds_ich8lan'
>> drivers/net/ethernet/intel/e1000e/linux/ich8lan.c:2689: warning: Function parameter or member 'hw' not described in 'e1000_lv_phy_workarounds_ich8lan'
--
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:471: warning: Function parameter or member 'ring' not described in 'e1000_desc_unused'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:552: warning: Function parameter or member 'netdev' not described in 'e1000_receive_skb'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:574: warning: Function parameter or member 'skb' not described in 'e1000_rx_checksum'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:574: warning: Excess function parameter 'csum' description in 'e1000_rx_checksum'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:574: warning: Excess function parameter 'sk_buff' description in 'e1000_rx_checksum'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:644: warning: Function parameter or member 'cleaned_count' not described in 'e1000_alloc_rx_buffers'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:644: warning: Function parameter or member 'gfp' not described in 'e1000_alloc_rx_buffers'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:712: warning: Function parameter or member 'cleaned_count' not described in 'e1000_alloc_rx_buffers_ps'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:712: warning: Function parameter or member 'gfp' not described in 'e1000_alloc_rx_buffers_ps'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:816: warning: Function parameter or member 'gfp' not described in 'e1000_alloc_jumbo_rx_buffers'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:907: warning: Function parameter or member 'work_done' not described in 'e1000_clean_rx_irq'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:907: warning: Function parameter or member 'work_to_do' not described in 'e1000_clean_rx_irq'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:1301: warning: Function parameter or member 'work_done' not described in 'e1000_clean_rx_irq_ps'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:1301: warning: Function parameter or member 'work_to_do' not described in 'e1000_clean_rx_irq_ps'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:1490: warning: Function parameter or member 'bi' not described in 'e1000_consume_page'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:1490: warning: Function parameter or member 'skb' not described in 'e1000_consume_page'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:1490: warning: Function parameter or member 'length' not described in 'e1000_consume_page'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:1506: warning: Function parameter or member 'rx_ring' not described in 'e1000_clean_jumbo_rx_irq'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:1506: warning: Function parameter or member 'work_done' not described in 'e1000_clean_jumbo_rx_irq'
>> drivers/net/ethernet/intel/e1000e/linux/netdev.c:1506: warning: Function parameter or member 'work_to_do' not described in 'e1000_clean_jumbo_rx_irq'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:1506: warning: Excess function parameter 'adapter' description in 'e1000_clean_jumbo_rx_irq'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:1967: warning: Function parameter or member 'adapter' not described in 'e1000_configure_msix'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:2045: warning: Function parameter or member 'adapter' not described in 'e1000e_set_interrupt_capability'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:2100: warning: Function parameter or member 'adapter' not described in 'e1000_request_msix'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:2153: warning: Function parameter or member 'adapter' not described in 'e1000_request_irq'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:2210: warning: Function parameter or member 'adapter' not described in 'e1000_irq_disable'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:2232: warning: Function parameter or member 'adapter' not described in 'e1000_irq_enable'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:2303: warning: Function parameter or member 'adapter' not described in 'e1000_alloc_ring_dma'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:2303: warning: Function parameter or member 'ring' not described in 'e1000_alloc_ring_dma'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:2490: warning: Excess function parameter 'adapter' description in 'e1000_update_itr'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:3022: warning: Function parameter or member 'S' not described in 'PAGE_USE_COUNT'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:3022: warning: Excess function parameter 'adapter' description in 'PAGE_USE_COUNT'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:3585: warning: Function parameter or member 'config' not described in 'e1000e_config_hwtstamp'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:3781: warning: Function parameter or member 'adapter' not described in 'e1000_power_down_phy'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:3795: warning: Function parameter or member 'adapter' not described in 'e1000_flush_tx_ring'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:3826: warning: Function parameter or member 'adapter' not described in 'e1000_flush_rx_ring'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:3864: warning: Function parameter or member 'adapter' not described in 'e1000_flush_desc_rings'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:3943: warning: Function parameter or member 'adapter' not described in 'e1000e_reset'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:4820: warning: Function parameter or member 't' not described in 'e1000_update_phy_info'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:4820: warning: Excess function parameter 'data' description in 'e1000_update_phy_info'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:5156: warning: Function parameter or member 't' not described in 'e1000_watchdog'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:5156: warning: Excess function parameter 'data' description in 'e1000_watchdog'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:6160: warning: Function parameter or member 'ifr' not described in 'e1000e_hwtstamp_set'
   drivers/net/ethernet/intel/e1000e/linux/netdev.c:6160: warning: Excess function parameter 'ifreq' description in 'e1000e_hwtstamp_set'


vim +1081 drivers/net/ethernet/intel/e1000e/linux/80003es2lan.c

^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1071  
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1072  /**
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1073   *  e1000_cfg_on_link_up_80003es2lan - es2 link configuration after link-up
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1074   *  @hw: pointer to the HW structure
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1075   *  @duplex: current duplex setting
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1076   *
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1077   *  Configure the KMRN interface by applying last minute quirks for
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1078   *  10/100 operation.
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1079   **/
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1080  static s32 e1000_cfg_on_link_up_80003es2lan(struct e1000_hw *hw)
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16 @1081  {
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1082  	s32 ret_val = 0;
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1083  	u16 speed;
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1084  	u16 duplex;
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1085  
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1086  	if (hw->phy.media_type == e1000_media_type_copper) {
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1087  		ret_val = e1000e_get_speed_and_duplex_copper(hw, &speed,
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1088  							     &duplex);
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1089  		if (ret_val)
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1090  			return ret_val;
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1091  
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1092  		if (speed == SPEED_1000)
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1093  			ret_val = e1000_cfg_kmrn_1000_80003es2lan(hw);
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1094  		else
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1095  			ret_val = e1000_cfg_kmrn_10_100_80003es2lan(hw, duplex);
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1096  	}
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1097  
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1098  	return ret_val;
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1099  }
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/80003es2lan.c Kaixu Xia 2021-03-16  1100  

:::::: The code at line 1081 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
