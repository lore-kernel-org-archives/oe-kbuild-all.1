Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFFA8F45
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 07:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711871849; cv=none; b=UXD4ahC3yRnEc9TaNhAJJ1zEFAu8hTxjohaQndfxOrJv9OYcNfSQKHk8pR20ecL0++tkrKg9NAOR02xzB6AzdgCoXmu6rFRGy1VVuiLyaxci4LpfCFnqUufx0x9H0CDQPfMQVzW2RXNelSc889n2FfCoolZnzJAy86apRx7LJfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711871849; c=relaxed/simple;
	bh=/oDF7nbFB8/Rw808nwqHvhHfDN8dDxdnCuLpWDYHHVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2/absB+heFi6PLo2/86nDmnoSo21IkSjnHlYncTi2XfXxozfNZ4s8rrSLuNUMQ+2f59dErzbWt0xXkMNjSwJZXV/QRDPz1ddCDLa6h7Qg2hHl7yvEMvlMZtUYy5mVguYBEnYJKR7UV060sNJp5+NfBfSaBMWYEcgPHDf+5zKwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ub+hizyq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ub+hizyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711871847; x=1743407847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/oDF7nbFB8/Rw808nwqHvhHfDN8dDxdnCuLpWDYHHVw=;
  b=Ub+hizyqSGMxRsW9RGFvAr4M+0eTnZsjlPvOa1vGdcqFSug009iGSkfD
   eR4ug2Zay/HzOZFiPZSptUEYc0OtJeREqOjMJoXIi8SxFMRmjucb73Nn1
   zlNKRIAJIFEzloa70bV2HoUqD+ZH+1ThNuYUrehSAsbsnf2o4Dg9xCO40
   XXcFxjqvlIrkduXZuZhertsSnTq3QFHE0hX4Ib0vO6UqNDiq0msPwl2XI
   OfOnrZbK4Mfa3A/wZbqvgDK2WLPYY2kY6ruYpK62iabQ22DtmQ9w0f0Uf
   Xiev1oc/4Z795WZtfqizc1wc+euWnjNaphbwA4o3V3MzsgYmbtw3o+N9c
   Q==;
X-CSE-ConnectionGUID: /ZeTBf5NRhKAA7ZsD0IPZw==
X-CSE-MsgGUID: OPIclcRITCuaQ5zASSscNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="10827730"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="10827730"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 00:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="17468446"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2024 00:57:19 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqq45-0000v6-0k;
	Sun, 31 Mar 2024 07:57:17 +0000
Date: Sun, 31 Mar 2024 15:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Duanqiang Wen <duanqiangwen@net-swift.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18628/30000]
 drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2340: multiple definition of
 `fmgr_cmd_op';
 drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2854:
 first defined here
Message-ID: <202403311504.0RPY0tDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   737efe73dd2ca6ee503ba26e6fc3ee41bd8cf633
commit: 3ddd74dceeba1f4ea8b20db59276ea3c6eded3d5 [18628/30000] openeuler: net: txgbe: Fix some known bugs, merge net-swift txgbe-1.2.3 out-of-tree
config: x86_64-randconfig-005-20240330 (https://download.01.org/0day-ci/archive/20240331/202403311504.0RPY0tDC-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403311504.0RPY0tDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403311504.0RPY0tDC-lkp@intel.com/

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
