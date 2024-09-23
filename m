Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C801FA5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 18:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727117624; cv=none; b=YcQQkUUBaPStUdk1fv9qisLppGGAc4Tr//Z8sDf+/jWrl7GErmGxqk3LedJXgm5RUFJdPTEI5xxJDXXp3xjDX/7ULMOpPxyhqboPe6O9KNYk0I+ULqW040F8MGuECV/ZZ8xR39Yand59G1KzWRcgL1xUvfriIw429kl3OQfaSZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727117624; c=relaxed/simple;
	bh=I5XWoTo8RZnth6UE6PwT/9WRs7jGf3voQw9Y5KWyQLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aOJIl3ahuP6TVIHpwVtXIMFNTQpEkssvD27yorVX+zy3aj0dFSTpVxukZNPj5GdTD8esGCspbWvkF0MreepdFB7xIGHDWRg+0C6cRtAdZUkJVIDyRg6Nd85XemUsVGb5i6nPUwQskYOOwRk00lPmP5aBPcgoRJ+ai4tXiaBvZUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtufuZR2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtufuZR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727117623; x=1758653623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I5XWoTo8RZnth6UE6PwT/9WRs7jGf3voQw9Y5KWyQLo=;
  b=VtufuZR2K6nRx6XahcX3COFuTigB4fnFbIKWpbSTOmE+Z/pK3OB1+tzV
   EWcdhaHGXZOdErQvEZBgla7/pyMUdkbEwCd7O5sAH4A/0xAgLTF53SC3g
   x6SeZbVfwhpWBS9L16wLOfrCnco4oO2AEKVdT7bGq45rl3jrEvzgmon5c
   T8xjXqqB1UFFQ5vaZEHGG9nnsMzHTzMjj1Nz1kQpW2RqOgONCc5tUVWvg
   shkzhMfnHejxQPmbxbNZAwn8NV902kuZmOG+16djKrBGY5S3V8xzkDw3T
   h5U5ISmvGaQcXfY67ppJhbQG8Gxlf5QVo1em6XqGE98c5c5etEbc1ED1s
   Q==;
X-CSE-ConnectionGUID: uoLBDCttSlCcunZNk1XJxA==
X-CSE-MsgGUID: l/oy5vjFR4uLLBFT7tUN2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="51501467"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="51501467"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 11:53:42 -0700
X-CSE-ConnectionGUID: ROCuzyxDROucl2RSvtfCKg==
X-CSE-MsgGUID: ihpgZcvMQJumEYftL1SErg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="71431369"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2024 11:53:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssoBm-000HWK-2x;
	Mon, 23 Sep 2024 18:53:38 +0000
Date: Tue, 24 Sep 2024 02:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Duanqiang Wen <duanqiangwen@net-swift.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 13578/30000]
 drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2340: multiple definition of
 `fmgr_cmd_op';
 drivers/net/ethernet/netswift/txgbe/txgbe_hw.o:drivers/net/ethernet/netswift/txgbe/txgbe_hw.c:2854:
 first defined here
Message-ID: <202409240243.FnQ7nuJi-lkp@intel.com>
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
head:   686352476cd29ec854b93e09a49d57c25a18a32f
commit: 3ddd74dceeba1f4ea8b20db59276ea3c6eded3d5 [13578/30000] openeuler: net: txgbe: Fix some known bugs, merge net-swift txgbe-1.2.3 out-of-tree
config: x86_64-randconfig-001-20240923 (https://download.01.org/0day-ci/archive/20240924/202409240243.FnQ7nuJi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240243.FnQ7nuJi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240243.FnQ7nuJi-lkp@intel.com/

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
