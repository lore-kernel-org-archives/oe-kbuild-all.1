Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D472AE84
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735405521; cv=none; b=JKcfhXAa5hpzQh5tZzBTvaYJBI7BWO7zAiwQnL+oIJVJQ/QxLnH4ZdqsKg9Dizo6m0nnl8b+3yfPJl7aY/zwZT3pyflU58Z5INigk+Tda/lsujlRiZAQWyZATBGTFL0gVI4GbyDg5OKV2LkpW1WHNytALzVzsEZopbHtVz5sGao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735405521; c=relaxed/simple;
	bh=w6PF5j2v+vcnLZtmoE3N42hWGM+MJg42uVqYHgL5Rng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jdhgCOrrEY3XhZc30Uhll86/Nkv1YPFrcKJr4ooGrZ3U4m26nJjAZiknB9KCvXK4dVm+8zr8w78gh3NUA64NFGCY+h9fh5wLSuccpLZgkj4bwwaDroQjaFURKfUaCZitE0P27item4l4n1QGvNHOnx12cfHjCawzhxGfeizfTck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRo5ARGX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRo5ARGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735405519; x=1766941519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w6PF5j2v+vcnLZtmoE3N42hWGM+MJg42uVqYHgL5Rng=;
  b=aRo5ARGX1lrLCZCGErVUqNiLk217jVFWeZ80BZ6qtar1BAhRqwDLAIDJ
   iCpF1I4gE8U97gP928W9JwbxGX34BrSX4yA8jpCfqyuCoe1aM2kqdx8ve
   rVUGqWcQq2jBXn8O6Ourjwy8gjfB0FfgOO+V7a0nV8+8T8R/Rn9CmNd4y
   inMhVGcBBVhlsx2dR4Fdi+10VuTqniS2XkwmMM6KLWSScomGjnzyCmMMR
   n2TBBMsbz/oXLL0KAxuw00iKX7/3obZj/yw2zKFvVWaQdWjWxLxV7Czzl
   FyFaWq3Nr8CFRHI5aVQxTU86Rwhe6Ae6LcaVH/X7rrdTPBCjznIOF5whV
   A==;
X-CSE-ConnectionGUID: 6yDt44RKRCO/KibYt8JHsg==
X-CSE-MsgGUID: xO+hezRQTFmPrtWcwuB9iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35987666"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="35987666"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 09:05:18 -0800
X-CSE-ConnectionGUID: KlNM/Mz+TTa/nWdffoUWbg==
X-CSE-MsgGUID: mmXdBKWZQj6b0aTxxg4sOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="105251017"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Dec 2024 09:05:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRaFX-0004Cq-0H;
	Sat, 28 Dec 2024 17:05:15 +0000
Date: Sun, 29 Dec 2024 01:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1336/1336]
 drivers/net/ethernet/netswift/txgbe/txgbe_mtd.o: warning: objtool: missing
 symbol for section .text
Message-ID: <202412290049.f0BfxWby-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: e9f0b33ca1fa178f87823d17762a4d2f9296efd1 [1336/1336] net: txgbe: Add support for Netswift 10G NIC
config: x86_64-buildonly-randconfig-003-20241219 (https://download.01.org/0day-ci/archive/20241229/202412290049.f0BfxWby-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290049.f0BfxWby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290049.f0BfxWby-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:19:
   drivers/net/ethernet/netswift/txgbe/txgbe.h:871:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     871 |         u32 cur_diff = 0;
         |             ^
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:178:12: warning: no previous prototype for function 'mtdCheckDeviceCapabilities' [-Wmissing-prototypes]
     178 | MTD_STATUS mtdCheckDeviceCapabilities(
         |            ^
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:178:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     178 | MTD_STATUS mtdCheckDeviceCapabilities(
         | ^
         | static 
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:290:12: warning: no previous prototype for function 'mtdIsPhyReadyAfterReset' [-Wmissing-prototypes]
     290 | MTD_STATUS mtdIsPhyReadyAfterReset(
         |            ^
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:290:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     290 | MTD_STATUS mtdIsPhyReadyAfterReset(
         | ^
         | static 
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:342:12: warning: no previous prototype for function 'mtdIsPhyReadyAfterHardwareReset' [-Wmissing-prototypes]
     342 | MTD_STATUS mtdIsPhyReadyAfterHardwareReset(
         |            ^
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:342:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     342 | MTD_STATUS mtdIsPhyReadyAfterHardwareReset(
         | ^
         | static 
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:829:12: warning: no previous prototype for function 'mtdAutonegIsCompleted' [-Wmissing-prototypes]
     829 | MTD_STATUS mtdAutonegIsCompleted(
         |            ^
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:829:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     829 | MTD_STATUS mtdAutonegIsCompleted(
         | ^
         | static 
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:1119:12: warning: no previous prototype for function 'mtdCunitSwReset' [-Wmissing-prototypes]
    1119 | MTD_STATUS mtdCunitSwReset(
         |            ^
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:1119:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1119 | MTD_STATUS mtdCunitSwReset(
         | ^
         | static 
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:1127:12: warning: no previous prototype for function 'mtdRerunSerdesAutoInitializationUseAutoMode' [-Wmissing-prototypes]
    1127 | MTD_STATUS mtdRerunSerdesAutoInitializationUseAutoMode(
         |            ^
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:1127:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1127 | MTD_STATUS mtdRerunSerdesAutoInitializationUseAutoMode(
         | ^
         | static 
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:1275:9: warning: no previous prototype for function 'mtdSemCreate' [-Wmissing-prototypes]
    1275 | MTD_SEM mtdSemCreate(
         |         ^
   drivers/net/ethernet/netswift/txgbe/txgbe_mtd.c:1275:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1275 | MTD_SEM mtdSemCreate(
         | ^
         | static 
   8 warnings generated.
>> drivers/net/ethernet/netswift/txgbe/txgbe_mtd.o: warning: objtool: missing symbol for section .text
--
   In file included from drivers/net/ethernet/netswift/txgbe/txgbe_bp.c:19:
   In file included from drivers/net/ethernet/netswift/txgbe/txgbe_bp.h:22:
   drivers/net/ethernet/netswift/txgbe/txgbe.h:871:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     871 |         u32 cur_diff = 0;
         |             ^
   drivers/net/ethernet/netswift/txgbe/txgbe_bp.c:582:5: warning: no previous prototype for function 'ReadPhyLaneTxEq' [-Wmissing-prototypes]
     582 | int ReadPhyLaneTxEq(unsigned short lane, struct txgbe_adapter *adapter, int post_t, int mode)
         |     ^
   drivers/net/ethernet/netswift/txgbe/txgbe_bp.c:582:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     582 | int ReadPhyLaneTxEq(unsigned short lane, struct txgbe_adapter *adapter, int post_t, int mode)
         | ^
         | static 
   drivers/net/ethernet/netswift/txgbe/txgbe_bp.c:645:5: warning: no previous prototype for function 'EnableCl72KrTr' [-Wmissing-prototypes]
     645 | int EnableCl72KrTr(unsigned int enable, struct txgbe_adapter *adapter)
         |     ^
   drivers/net/ethernet/netswift/txgbe/txgbe_bp.c:645:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     645 | int EnableCl72KrTr(unsigned int enable, struct txgbe_adapter *adapter)
         | ^
         | static 
   drivers/net/ethernet/netswift/txgbe/txgbe_bp.c:699:5: warning: no previous prototype for function 'CheckCl72KrTrStatus' [-Wmissing-prototypes]
     699 | int CheckCl72KrTrStatus(struct txgbe_adapter *adapter)
         |     ^
   drivers/net/ethernet/netswift/txgbe/txgbe_bp.c:699:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     699 | int CheckCl72KrTrStatus(struct txgbe_adapter *adapter)
         | ^
         | static 
   4 warnings generated.
>> drivers/net/ethernet/netswift/txgbe/txgbe_bp.o: warning: objtool: missing symbol for section .text
--
   In file included from drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:24:
   In file included from drivers/net/ethernet/netswift/txgbe/txgbe_phy.h:28:
   drivers/net/ethernet/netswift/txgbe/txgbe.h:871:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     871 |         u32 cur_diff = 0;
         |             ^
   1 warning generated.
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:95: warning: Function parameter or member 'hw' not described in 'txgbe_get_phy_type_from_id'
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:95: warning: Excess function parameter 'phy_id' description in 'txgbe_get_phy_type_from_id'
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:169: warning: Function parameter or member 'device_type' not described in 'txgbe_read_phy_reg_mdi'
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:207: warning: Function parameter or member 'device_type' not described in 'txgbe_read_phy_reg'
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:324: warning: Function parameter or member 'speed_set' not described in 'txgbe_setup_phy_link'
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:324: warning: Function parameter or member 'autoneg_wait_to_complete' not described in 'txgbe_setup_phy_link'
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:376: warning: Function parameter or member 'autoneg_wait_to_complete' not described in 'txgbe_setup_phy_link_speed'
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:774: warning: Function parameter or member 'sff8472_data' not described in 'txgbe_read_i2c_sff8472'
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:774: warning: Excess function parameter 'eeprom_data' description in 'txgbe_read_i2c_sff8472'
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:810: warning: Function parameter or member 'dev_addr' not described in 'txgbe_read_i2c_byte_int'
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:872: warning: Function parameter or member 'dev_addr' not described in 'txgbe_read_i2c_byte'
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:891: warning: Function parameter or member 'dev_addr' not described in 'txgbe_write_i2c_byte_int'
   drivers/net/ethernet/netswift/txgbe/txgbe_phy.c:935: warning: Function parameter or member 'dev_addr' not described in 'txgbe_write_i2c_byte'
>> drivers/net/ethernet/netswift/txgbe/txgbe_phy.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
