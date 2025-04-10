Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D73E20409F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 19:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744311734; cv=none; b=qmLIi1ZkI9Hrgo5JyrnaCvTbYThplAT1gcPnl0O4OplNxpngGcH2tqzPPsbilZuk/yNLxudFgBSwfn6jFnDPohIanLVRuMkSrQNVIRXaglr4b4X8/3D3D0QAWqZU2mJ8PuE24rmLXAGTcZja6FtPDe+WWA9h5wGkw1IK9Jgfm0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744311734; c=relaxed/simple;
	bh=/MYRd1h1XeY7hjWS+jyycAEb+QuWfIwEC7spGM+GQlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t4K2oO2cRGcp8PS5/KbzEzkrebrh4FoKe3o/XOfMAMMKpo3W4TIW8EFVFI4rV0507IInNspK8x9hkOUp3Z+yUZSPIz5D2AMDGm2deLHoeJ0cro+DhnO+VC8a7Si0EXbZnY5muxb6ebD1cFf2ci8BqgNOW/P6ud20/GQ0Xdnzluw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWkoMZGZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWkoMZGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744311732; x=1775847732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/MYRd1h1XeY7hjWS+jyycAEb+QuWfIwEC7spGM+GQlU=;
  b=SWkoMZGZXxBxBUOUTgG7kCMvcdE2CUW8DD/FQtj1Rd3Il6qSELE1Tl/j
   02iU9NloQ5CiDSTKBmdsY3xdqZ3Z0PDyuxOMJcmsH4zQxgK03LgaJjKh9
   yvtoY3o8eXjj9RVZKb7p41GIgWrGMCrQxTp/GQ5yw6PaEq/jDQCQDVsQZ
   mlhXkrwQaajRHURr0C6kWx95gWHo3m5k8lPxJB7ThqDjPkFwv5XgOPist
   lvK/wfYgdKfSL2eRPxty7StM/ZI62yGSJIS9J4AZoupULEtf0j22KXExg
   KXRFbDt04sylC4mS0ReQFNp51oViZUyF8mNx4lj0Jnr1M4t9wZ3yWEw93
   w==;
X-CSE-ConnectionGUID: ZEbIRQx7TKqlUlwKxRnudQ==
X-CSE-MsgGUID: bKP2yZxBQpOKSdleAgIQbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56495516"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="56495516"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 12:02:09 -0700
X-CSE-ConnectionGUID: VJwOD0AHQImTmn2j2iPDAw==
X-CSE-MsgGUID: kSuXxbzQSuSBHMsIpajvlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="129953935"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Apr 2025 12:02:08 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2xA5-000ARp-2p;
	Thu, 10 Apr 2025 19:02:05 +0000
Date: Fri, 11 Apr 2025 03:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1578/1578]
 drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: warning: objtool: missing
 symbol for section .text.unlikely.
Message-ID: <202504110241.8SiMchEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ac44c6a4925e0772513c3597d420e5705faf482b
commit: 206f9c11a8c8b0197da5a26859d96d2ed65f5757 [1578/1578] net: ngbe: Add Netswift Giga NIC driver
config: x86_64-buildonly-randconfig-005-20250410 (https://download.01.org/0day-ci/archive/20250411/202504110241.8SiMchEQ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504110241.8SiMchEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504110241.8SiMchEQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2542:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2542 | u32 flash_read_dword(struct ngbe_hw *hw, u32 addr)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2551:4: warning: no previous prototype for function 'flash_write_dword' [-Wmissing-prototypes]
    2551 | u8 flash_write_dword(struct ngbe_hw *hw, u32 addr, u32 dword)
         |    ^
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2551:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2551 | u8 flash_write_dword(struct ngbe_hw *hw, u32 addr, u32 dword)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2567:5: warning: no previous prototype for function 'ngbe_flash_write_cab' [-Wmissing-prototypes]
    2567 | int ngbe_flash_write_cab(struct ngbe_hw *hw, u32 addr, u32 value, u16 lan_id)
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2567:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2567 | int ngbe_flash_write_cab(struct ngbe_hw *hw, u32 addr, u32 value, u16 lan_id)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2593:5: warning: no previous prototype for function 'ngbe_flash_read_cab' [-Wmissing-prototypes]
    2593 | int ngbe_flash_read_cab(struct ngbe_hw *hw, u32 addr, u16 lan_id)
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2593:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2593 | int ngbe_flash_read_cab(struct ngbe_hw *hw, u32 addr, u16 lan_id)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2628:5: warning: no previous prototype for function 'ngbe_flash_write_unlock' [-Wmissing-prototypes]
    2628 | int ngbe_flash_write_unlock(struct ngbe_hw *hw)
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2628:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2628 | int ngbe_flash_write_unlock(struct ngbe_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2651:5: warning: no previous prototype for function 'ngbe_flash_write_lock' [-Wmissing-prototypes]
    2651 | int ngbe_flash_write_lock(struct ngbe_hw *hw)
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2651:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2651 | int ngbe_flash_write_lock(struct ngbe_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3498:5: warning: no previous prototype for function 'ngbe_get_copper_link_capabilities' [-Wmissing-prototypes]
    3498 | s32 ngbe_get_copper_link_capabilities(struct ngbe_hw *hw,
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3498:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3498 | s32 ngbe_get_copper_link_capabilities(struct ngbe_hw *hw,
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3647:5: warning: no previous prototype for function 'ngbe_reset_misc' [-Wmissing-prototypes]
    3647 | int ngbe_reset_misc(struct ngbe_hw *hw)
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3647:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3647 | int ngbe_reset_misc(struct ngbe_hw *hw)
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4124:5: warning: no previous prototype for function 'ngbe_read_ee_hostif_data' [-Wmissing-prototypes]
    4124 | s32 ngbe_read_ee_hostif_data(struct ngbe_hw *hw, u16 offset,
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4124 | s32 ngbe_read_ee_hostif_data(struct ngbe_hw *hw, u16 offset,
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4339:5: warning: no previous prototype for function 'ngbe_read_ee_hostif_data32' [-Wmissing-prototypes]
    4339 | s32 ngbe_read_ee_hostif_data32(struct ngbe_hw *hw, u16 offset,
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4339:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4339 | s32 ngbe_read_ee_hostif_data32(struct ngbe_hw *hw, u16 offset,
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4405:5: warning: no previous prototype for function 'ngbe_write_ee_hostif_data' [-Wmissing-prototypes]
    4405 | s32 ngbe_write_ee_hostif_data(struct ngbe_hw *hw, u16 offset,
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4405:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4405 | s32 ngbe_write_ee_hostif_data(struct ngbe_hw *hw, u16 offset,
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4466:5: warning: no previous prototype for function 'ngbe_write_ee_hostif_data32' [-Wmissing-prototypes]
    4466 | s32 ngbe_write_ee_hostif_data32(struct ngbe_hw *hw, u16 offset,
         |     ^
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:4466:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4466 | s32 ngbe_write_ee_hostif_data32(struct ngbe_hw *hw, u16 offset,
         | ^
         | static 
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2883:17: warning: unused variable 'ngbe_emc_temp_data' [-Wunused-const-variable]
    2883 | STATIC const u8 ngbe_emc_temp_data[4] = {
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2890:17: warning: unused variable 'ngbe_emc_therm_limit' [-Wunused-const-variable]
    2890 | STATIC const u8 ngbe_emc_therm_limit[4] = {
         |                 ^~~~~~~~~~~~~~~~~~~~
   26 warnings generated.
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:657: warning: Function parameter or member 'pools' not described in 'ngbe_set_rar'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:657: warning: Excess function parameter 'vmdq' description in 'ngbe_set_rar'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:817: warning: Function parameter or member 'vmdq' not described in 'ngbe_add_uc_addr'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:961: warning: Function parameter or member 'mc_addr' not described in 'ngbe_set_mta'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:961: warning: Excess function parameter 'hash_value' description in 'ngbe_set_mta'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:1616: warning: Function parameter or member 'pool' not described in 'ngbe_set_vmdq'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:1616: warning: Excess function parameter 'vmdq' description in 'ngbe_set_vmdq'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2904: warning: bad line:                        (8.1542E-08)N^3 + (-1.6743E-11)N^4
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:2911: warning: Excess function parameter 'data' description in 'ngbe_get_thermal_sensor_data'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3632: warning: Function parameter or member 'need_restart_AN' not described in 'ngbe_setup_copper_link'
   drivers/net/ethernet/netswift/ngbe/ngbe_hw.c:3632: warning: Excess function parameter 'autoneg_wait_to_complete' description in 'ngbe_setup_copper_link'
>> drivers/net/ethernet/netswift/ngbe/ngbe_hw.o: warning: objtool: missing symbol for section .text.unlikely.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
