Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BA931CA68
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 20:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761598489; cv=none; b=mmi0bjb071Bdk9ghinnuA2cWVmRmkURFdG8H70lRq66WgZ7ZHY+OlZUPpDLiA/Qmh9eZbWz2IsvYsAqCaPjY42n2ayVzgH3eph8gSuzGKBcy/QnP+P4W5YqZbAGkHrTbaP4aQ7ZGzGYMe4KTyZ7lfzwyc8kCp6hR/o0cxNMTNUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761598489; c=relaxed/simple;
	bh=ZzGkvZQ1OfhE1+7EOY1Sn9xZdtE2zwkO5cXct8E+deg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUnua+scL7Xqtw7M1vUz7qq4nRe2RjJ1BsoKb8ylRkLUj+fdwooI5QhgRlm8lYwis4Cpx4brcqyJvfsK/8QrRtXiH/GVFksgoaPqSlnMeZ1ZEV/scyl2HZFNzPMdr1n7HsAt1QuhQIg2xslC90XZYwiq5wXPmX828aR9w8jz4FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmFafhBc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmFafhBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761598487; x=1793134487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZzGkvZQ1OfhE1+7EOY1Sn9xZdtE2zwkO5cXct8E+deg=;
  b=BmFafhBcLCsp9OOZgXUcJlZQHVilmlLVdHID7ev0FUcMuF1iFre0Dfdk
   vXYP7J6CIoLOLETa5T4uUHmagnYLuGNgRgqM08zEGqOBQ+wYzTQmzeL5I
   JyoxTOydzrnDkRoBnXWC6cTXG+eSpyxtt08HsDA0faVU1WDa/Aq9jCtdJ
   +5L44C+dRURcZh0RzUlfgWz0G4sktBCLBj2xqsEE8zY2A1GUOJdotQ+VM
   /YCSRYUbu2MILjPPIFhyscOB/rYnH49gwv60TJ8HeKzwd53PGZ51DucSM
   9bQ0VKW0Lf2nIsSFORdQhkT4sgeRGKDYSSCog2uIWwILFgt9f8S5aPmdY
   w==;
X-CSE-ConnectionGUID: z7g6G4gbRrWTtUSeeEFzNg==
X-CSE-MsgGUID: Xuq8eedjSOim3VZ8C+bn5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86318075"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="86318075"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 13:54:47 -0700
X-CSE-ConnectionGUID: JHnRTOEESy6mop4VBmaiIQ==
X-CSE-MsgGUID: byzPuX2EQQ2Ah/BknFKk9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="189455395"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2025 13:54:46 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDUEl-000000000OT-287w;
	Mon, 27 Oct 2025 20:54:43 +0000
Date: Mon, 27 Oct 2025 21:54:04 +0100
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 2770/4376]
 drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/amdgpu_ras_mgr.c:132:undefined
 reference to `__udivdi3'
Message-ID: <202510272144.6SUHUoWx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
commit: 7169e706c82d7bcb3ba4c8943faa32e26daf3523 [2770/4376] drm/amdgpu: Add ras module ip block to amdgpu discovery
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20251027/202510272144.6SUHUoWx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510272144.6SUHUoWx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510272144.6SUHUoWx-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.o: in function `amdgpu_ras_mgr_init_eeprom_config':
>> drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/amdgpu_ras_mgr.c:132:(.text+0x151): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/amd/ras/rascore/ras_core.o: in function `ras_core_convert_timestamp_to_time':
   drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:76:(.text+0x196): undefined reference to `__umoddi3'
   ld: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:76:(.text+0x1b2): undefined reference to `__umoddi3'
   ld: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:86:(.text+0x1f7): undefined reference to `__umoddi3'
   ld: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:86:(.text+0x213): undefined reference to `__umoddi3'


vim +132 drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/amdgpu_ras_mgr.c

fa0b203cd90260 YiPeng Chai 2025-03-17   96  
fa0b203cd90260 YiPeng Chai 2025-03-17   97  static int amdgpu_ras_mgr_init_eeprom_config(struct amdgpu_device *adev,
fa0b203cd90260 YiPeng Chai 2025-03-17   98  		struct ras_core_config *config)
fa0b203cd90260 YiPeng Chai 2025-03-17   99  {
fa0b203cd90260 YiPeng Chai 2025-03-17  100  	struct ras_eeprom_config *eeprom_cfg = &config->eeprom_cfg;
fa0b203cd90260 YiPeng Chai 2025-03-17  101  
fa0b203cd90260 YiPeng Chai 2025-03-17  102  	eeprom_cfg->eeprom_sys_fn = &amdgpu_ras_eeprom_i2c_sys_func;
fa0b203cd90260 YiPeng Chai 2025-03-17  103  	eeprom_cfg->eeprom_i2c_adapter = adev->pm.ras_eeprom_i2c_bus;
fa0b203cd90260 YiPeng Chai 2025-03-17  104  	if (eeprom_cfg->eeprom_i2c_adapter) {
fa0b203cd90260 YiPeng Chai 2025-03-17  105  		const struct i2c_adapter_quirks *quirks =
fa0b203cd90260 YiPeng Chai 2025-03-17  106  			((struct i2c_adapter *)eeprom_cfg->eeprom_i2c_adapter)->quirks;
fa0b203cd90260 YiPeng Chai 2025-03-17  107  
fa0b203cd90260 YiPeng Chai 2025-03-17  108  		if (quirks) {
fa0b203cd90260 YiPeng Chai 2025-03-17  109  			eeprom_cfg->max_i2c_read_len = quirks->max_read_len;
fa0b203cd90260 YiPeng Chai 2025-03-17  110  			eeprom_cfg->max_i2c_write_len = quirks->max_write_len;
fa0b203cd90260 YiPeng Chai 2025-03-17  111  		}
fa0b203cd90260 YiPeng Chai 2025-03-17  112  	}
fa0b203cd90260 YiPeng Chai 2025-03-17  113  
fa0b203cd90260 YiPeng Chai 2025-03-17  114  	/*
fa0b203cd90260 YiPeng Chai 2025-03-17  115  	 * amdgpu_bad_page_threshold is used to config
fa0b203cd90260 YiPeng Chai 2025-03-17  116  	 * the threshold for the number of bad pages.
fa0b203cd90260 YiPeng Chai 2025-03-17  117  	 * -1:  Threshold is set to default value
fa0b203cd90260 YiPeng Chai 2025-03-17  118  	 *      Driver will issue a warning message when threshold is reached
fa0b203cd90260 YiPeng Chai 2025-03-17  119  	 *      and continue runtime services.
fa0b203cd90260 YiPeng Chai 2025-03-17  120  	 * 0:   Disable bad page retirement
fa0b203cd90260 YiPeng Chai 2025-03-17  121  	 *      Driver will not retire bad pages
fa0b203cd90260 YiPeng Chai 2025-03-17  122  	 *      which is intended for debugging purpose.
fa0b203cd90260 YiPeng Chai 2025-03-17  123  	 * -2:  Threshold is determined by a formula
fa0b203cd90260 YiPeng Chai 2025-03-17  124  	 *      that assumes 1 bad page per 100M of local memory.
fa0b203cd90260 YiPeng Chai 2025-03-17  125  	 *      Driver will continue runtime services when threhold is reached.
fa0b203cd90260 YiPeng Chai 2025-03-17  126  	 * 0 < threshold < max number of bad page records in EEPROM,
fa0b203cd90260 YiPeng Chai 2025-03-17  127  	 *      A user-defined threshold is set
fa0b203cd90260 YiPeng Chai 2025-03-17  128  	 *      Driver will halt runtime services when this custom threshold is reached.
fa0b203cd90260 YiPeng Chai 2025-03-17  129  	 */
fa0b203cd90260 YiPeng Chai 2025-03-17  130  	if (amdgpu_bad_page_threshold == NONSTOP_OVER_THRESHOLD)
fa0b203cd90260 YiPeng Chai 2025-03-17  131  		eeprom_cfg->eeprom_record_threshold_count =
fa0b203cd90260 YiPeng Chai 2025-03-17 @132  				ESTIMATE_BAD_PAGE_THRESHOLD(adev->gmc.mc_vram_size);
fa0b203cd90260 YiPeng Chai 2025-03-17  133  	else if (amdgpu_bad_page_threshold == WARN_NONSTOP_OVER_THRESHOLD)
fa0b203cd90260 YiPeng Chai 2025-03-17  134  		eeprom_cfg->eeprom_record_threshold_count =
fa0b203cd90260 YiPeng Chai 2025-03-17  135  				COUNT_BAD_PAGE_THRESHOLD(RAS_RESERVED_VRAM_SIZE_DEFAULT);
fa0b203cd90260 YiPeng Chai 2025-03-17  136  	else
fa0b203cd90260 YiPeng Chai 2025-03-17  137  		eeprom_cfg->eeprom_record_threshold_count = amdgpu_bad_page_threshold;
fa0b203cd90260 YiPeng Chai 2025-03-17  138  
fa0b203cd90260 YiPeng Chai 2025-03-17  139  	eeprom_cfg->eeprom_record_threshold_config = amdgpu_bad_page_threshold;
fa0b203cd90260 YiPeng Chai 2025-03-17  140  
fa0b203cd90260 YiPeng Chai 2025-03-17  141  	return 0;
fa0b203cd90260 YiPeng Chai 2025-03-17  142  }
fa0b203cd90260 YiPeng Chai 2025-03-17  143  

:::::: The code at line 132 was first introduced by commit
:::::: fa0b203cd902608a214130c83e6a6d76fe04b708 drm/amd/ras: Add amdgpu ras management function.

:::::: TO: YiPeng Chai <YiPeng.Chai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
