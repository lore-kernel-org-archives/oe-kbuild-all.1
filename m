Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B0DBE49
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 01:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743384036; cv=none; b=rhE+78raylnKnnHtVl5FdGOrPHuBPuN+FZ17mdnF3wiHIuXD0qRu2nnyAIHLiyOt5GvttpXwXIAyGbDpuTzCwZlywZyE0e1hemHKwdbyyOZyrc9jkDWQ8KBTL1gAWVGWrtjYaGxbbWK0C4bgaPeOQeiB7tWyrHzBwE9HZZftbUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743384036; c=relaxed/simple;
	bh=PuKvP21z0et4f0DiAMN74z9Ja9rLglh/y7bGfVONQy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mf6mbZy40+rkXLKObdJR4brV6O4phccuGq5f1v22CcoAHT37vSbG/cFFalHOKynYpPsIV+QZa+Elpi5itfL+ewEIYqOVtGdP9ZED9hin5nR8m0ZvCBs6FU6DDhIRGPM2rfwpGt2so8j2mZ741IXEo5r6V10/1RH5UrmMWmKycm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6eNcoSM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6eNcoSM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743384034; x=1774920034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PuKvP21z0et4f0DiAMN74z9Ja9rLglh/y7bGfVONQy4=;
  b=O6eNcoSM2KvlHwOX4BNCSFTBTx7nZBAN6CU59EYom5zvT/mT0oj7eTXr
   WZ8LC15/xzUtQOBhVX2djKdV4dBpOQuB831Bhte5CwzznQ8bl7Kas8xS6
   9yds/e01yMRHdIupwHKmU2YGbrkKIHU91AtdmdxAfbOHN1FoTHxGmOOaw
   5I00S8Wf+MnBvbuBxwkCOWlHZC8qdtC8g1z6kIIdT0r+FpMFNGAK8C2O7
   ao9yLiDhSi9MpOfuO1KYeLNXymunQ7dHUARO41eUh6dzDejyosVA4J2b2
   UAKJNfkegrDu1tvtId9l0I07rEcKDcI6zPQM5aCl/DPQ/6cvvZe8QWL8K
   g==;
X-CSE-ConnectionGUID: SDrllFs7RICI5NhVRfHOug==
X-CSE-MsgGUID: LBr/U8ckSGKZ6qsQZdDq5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44844676"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="44844676"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 18:20:33 -0700
X-CSE-ConnectionGUID: gubPM03sRuuyLRIryvt7qA==
X-CSE-MsgGUID: 2j3ZzKdIRKyaYN1OlWMMLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="131176332"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Mar 2025 18:20:32 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz3pG-0008xe-0C;
	Mon, 31 Mar 2025 01:20:30 +0000
Date: Mon, 31 Mar 2025 09:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2829/2829]
 drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2340: multiple definition of
 `fmgr_cmd_op';
 drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2854:
 first defined here
Message-ID: <202503310959.wgczfMA5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi DuanqiangWen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0e7e8faca7062a439fd0a56574c2c3860ceb2088
commit: 3ddd74dceeba1f4ea8b20db59276ea3c6eded3d5 [2829/2829] openeuler: net: txgbe: Fix some known bugs, merge net-swift txgbe-1.2.3 out-of-tree
config: x86_64-randconfig-122-20250330 (https://download.01.org/0day-ci/archive/20250331/202503310959.wgczfMA5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503310959.wgczfMA5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503310959.wgczfMA5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `fmgr_cmd_op':
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2340: multiple definition of `fmgr_cmd_op'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2854: first defined here
   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `fmgr_usr_cmd_op':
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2361: multiple definition of `fmgr_usr_cmd_op'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2875: first defined here
   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `flash_erase_chip':
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2371: multiple definition of `flash_erase_chip'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2885: first defined here
   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `flash_erase_sector':
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2377: multiple definition of `flash_erase_sector'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2891: first defined here
   ld: drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: in function `flash_write_dword':
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2393: multiple definition of `flash_write_dword'; drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2908: first defined here

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:625:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:625:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:625:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:1004:6: sparse: sparse: symbol 'txgbe_add_uc_addr' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:1138:6: sparse: sparse: symbol 'txgbe_set_mta' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2604:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2604:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2604:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2707:5: sparse: sparse: symbol 'txgbe_setup_mac_link_hostif' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2744:5: sparse: sparse: symbol 'txgbe_crc16_ccitt' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2897:5: sparse: sparse: symbol 'flash_read_dword' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2922:5: sparse: sparse: symbol 'txgbe_flash_write_cab' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2944:5: sparse: sparse: symbol 'txgbe_flash_read_cab' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2975:5: sparse: sparse: symbol 'txgbe_flash_write_unlock' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2998:5: sparse: sparse: symbol 'txgbe_flash_write_lock' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3451:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3451:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3451:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3496:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3496:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:3496:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4396:5: sparse: sparse: symbol 'txgbe_enable_rx_adapter' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4417:5: sparse: sparse: symbol 'txgbe_set_sgmii_an37_ability' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4972:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4972:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:4972:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:5345:5: sparse: sparse: symbol 'txgbe_reset_misc' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6426:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6426:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6426:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6428:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6428:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6428:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6593:5: sparse: sparse: symbol 'txgbe_read_ee_hostif_data' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6642:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6642:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6642:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6724:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6724:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6724:9: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6737:5: sparse: sparse: symbol 'txgbe_write_ee_hostif_data' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6847:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6847:17: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6847:17: sparse:    int
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6890:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6890:9: sparse:    void
   drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:6890:9: sparse:    int
--
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:132:5: sparse: sparse: symbol 'txgbe_poll_for_msg' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:162:5: sparse: sparse: symbol 'txgbe_poll_for_ack' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:263:5: sparse: sparse: symbol 'txgbe_read_v2p_mailbox' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:284:5: sparse: sparse: symbol 'txgbe_check_for_bit_vf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:300:5: sparse: sparse: symbol 'txgbe_check_for_msg_vf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:320:5: sparse: sparse: symbol 'txgbe_check_for_ack_vf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:340:5: sparse: sparse: symbol 'txgbe_check_for_rst_vf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:359:5: sparse: sparse: symbol 'txgbe_obtain_mbx_lock_vf' was not declared. Should it be static?
>> drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:387:5: sparse: sparse: symbol 'txgbe_write_mbx_vf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:425:5: sparse: sparse: symbol 'txgbe_read_mbx_vf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:483:5: sparse: sparse: symbol 'txgbe_check_for_bit_pf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:503:5: sparse: sparse: symbol 'txgbe_check_for_msg_pf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:525:5: sparse: sparse: symbol 'txgbe_check_for_ack_pf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:547:5: sparse: sparse: symbol 'txgbe_check_for_rst_pf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:572:5: sparse: sparse: symbol 'txgbe_obtain_mbx_lock_pf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:601:5: sparse: sparse: symbol 'txgbe_write_mbx_pf' was not declared. Should it be static?
   drivers/net/ethernet/netswift/txgbe/txgbe_mbx.c:644:5: sparse: sparse: symbol 'txgbe_read_mbx_pf' was not declared. Should it be static?

vim +2340 drivers/net/ethernet/netswift/ngbe/ngbe_hw.c

a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2333  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2334  /**
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2335   * cmd_addr is used for some special command:
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2336   * 1. to be sector address, when implemented erase sector command
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2337   * 2. to be flash address when implemented read, write flash address
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2338   **/
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2339  u8 fmgr_cmd_op(struct ngbe_hw *hw, u32 cmd, u32 cmd_addr)
a5961b4bc6ce09 Duanqiang Wen 2022-12-01 @2340  {
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2341  	u32 cmd_val = 0;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2342  	u32 time_out = 0;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2343  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2344  	cmd_val = (cmd << SPI_CLK_CMD_OFFSET) | (SPI_CLK_DIV << SPI_CLK_DIV_OFFSET) | cmd_addr;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2345  	wr32(hw, SPI_H_CMD_REG_ADDR, cmd_val);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2346  	while (1) {
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2347  		if (rd32(hw, SPI_H_STA_REG_ADDR) & 0x1)
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2348  			break;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2349  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2350  		if (time_out == SPI_TIME_OUT_VALUE)
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2351  			return 1;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2352  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2353  		time_out = time_out + 1;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2354  		udelay(10);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2355  	}
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2356  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2357  	return 0;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2358  }
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2359  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2360  u8 fmgr_usr_cmd_op(struct ngbe_hw *hw, u32 usr_cmd)
a5961b4bc6ce09 Duanqiang Wen 2022-12-01 @2361  {
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2362  	u8 status = 0;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2363  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2364  	wr32(hw, SPI_H_USR_CMD_REG_ADDR, usr_cmd);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2365  	status = fmgr_cmd_op(hw, SPI_CMD_USER_CMD, 0);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2366  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2367  	return status;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2368  }
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2369  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2370  u8 flash_erase_chip(struct ngbe_hw *hw)
a5961b4bc6ce09 Duanqiang Wen 2022-12-01 @2371  {
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2372  	u8 status = fmgr_cmd_op(hw, SPI_CMD_ERASE_CHIP, 0);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2373  	return status;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2374  }
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2375  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2376  u8 flash_erase_sector(struct ngbe_hw *hw, u32 sec_addr)
a5961b4bc6ce09 Duanqiang Wen 2022-12-01 @2377  {
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2378  	u8 status = fmgr_cmd_op(hw, SPI_CMD_ERASE_SECTOR, sec_addr);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2379  	return status;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2380  }
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2381  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2382  u32 ngbe_flash_read_dword(struct ngbe_hw *hw, u32 addr)
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2383  {
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2384  	u8 status = fmgr_cmd_op(hw, SPI_CMD_READ_DWORD, addr);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2385  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2386  	if (status)
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2387  		return (u32)status;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2388  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2389  	return rd32(hw, SPI_H_DAT_REG_ADDR);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2390  }
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2391  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2392  u8 flash_write_dword(struct ngbe_hw *hw, u32 addr, u32 dword)
a5961b4bc6ce09 Duanqiang Wen 2022-12-01 @2393  {
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2394  	u8 status = 0;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2395  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2396  	wr32(hw, SPI_H_DAT_REG_ADDR, dword);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2397  	status = fmgr_cmd_op(hw, SPI_CMD_WRITE_DWORD, addr);
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2398  	if (status)
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2399  		return status;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2400  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2401  	if (dword != ngbe_flash_read_dword(hw, addr))
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2402  		return 1;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2403  
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2404  	return 0;
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2405  }
a5961b4bc6ce09 Duanqiang Wen 2022-12-01  2406  

:::::: The code at line 2340 was first introduced by commit
:::::: a5961b4bc6ce09a70902686ecc848a47493a9251 openeuler: net: ngbe: add ngbe module support

:::::: TO: Duanqiang Wen <duanqiangwen@net-swift.com>
:::::: CC: Duanqiang Wen <duanqiangwen@net-swift.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
