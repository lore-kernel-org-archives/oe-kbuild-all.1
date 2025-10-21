Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784A634B69C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761069176; cv=none; b=SU289oph+uK8UYic4MmP2Pv9/Dqqr4vwDcYZxwY99QhK7qYb8RALqQzg8a577oqCfbrbJHuD7jPgQqs0sgl2fLXPiXJGp0J4zZO0H8V+UgicWffwEIZYnSECaRjKubAq8wM55ZNxMBW5pLGaka5HgcEFSgStefmtWWPDrKbWVIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761069176; c=relaxed/simple;
	bh=AFrQLNTKp5EoYxx0lkzaXm+DY4pc/TXJwqJmKBDt2X0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gxxCbXNiw6N7YrFyqK9rYqgGB0+SD6+KrpRV4no5PR1/DqZzMpcv68ZuBoP8lfwcrWy/Q6Rww3ytCKEjSSd2+6nu0+I0ckqU1lfH3k3Godg2+4G2pbAzeE8DPSP1V6Tb3cSxri5901ZZxazgIr9luam240Wx/c+6Ipi4Znob2yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5qm5hMV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5qm5hMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761069175; x=1792605175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AFrQLNTKp5EoYxx0lkzaXm+DY4pc/TXJwqJmKBDt2X0=;
  b=E5qm5hMVFRc0eXh5eb6Ow6aIXawH/0xHGlaMNLjg9wMeMeExwFeauFrk
   Oai3G4vcrx87xETXxy579PQ17mgG8wFd4rwJVnbomHZ+x+Ds/Jzh9op+D
   /U6waVzDsSqJ/sMsTIomFIYxjRWhTIk8UxNtvmH3UZEfVrBjCaInQkqb2
   y+i3uWKr9z7N47ijNZmsB4acwN3wbixdxu6lnhC4hm+g0M7/jKzWqHcHD
   dcHWcEXDh2h58jF/p68Abd7Fe4+scxDGSXyUzvUNAQ01AIPBxc44soaVa
   RFpQbD1KMwaMkwrnxX5CaEpSEC0lj3zkTUu+SYFZWw0d1dpb+zYEOtcEd
   w==;
X-CSE-ConnectionGUID: 6Sdc+mzvQeyL6YS28q5R2A==
X-CSE-MsgGUID: Us6savj/S4SsF7dAsG5wJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63102230"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="63102230"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 10:52:55 -0700
X-CSE-ConnectionGUID: l1BSiMV/Spuj9fFIhQ/aMQ==
X-CSE-MsgGUID: ZNaGe6XPSGeWHF7u3apHyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="207324869"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Oct 2025 10:52:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBGXS-000B97-13;
	Tue, 21 Oct 2025 17:52:50 +0000
Date: Wed, 22 Oct 2025 01:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 2917/3056]
 drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/amdgpu_ras_mgr.c:132: undefined
 reference to `__udivdi3'
Message-ID: <202510220123.2uh3mVgt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
commit: 7169e706c82d7bcb3ba4c8943faa32e26daf3523 [2917/3056] drm/amdgpu: Add ras module ip block to amdgpu discovery
config: microblaze-randconfig-r052-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220123.2uh3mVgt-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220123.2uh3mVgt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220123.2uh3mVgt-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.o: in function `amdgpu_ras_mgr_create_ras_core':
>> drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/amdgpu_ras_mgr.c:132: undefined reference to `__udivdi3'
   microblaze-linux-ld: drivers/gpu/drm/amd/ras/rascore/ras_core.o: in function `ras_core_convert_timestamp_to_time':
   drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:86: undefined reference to `__umoddi3'
   microblaze-linux-ld: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:86: undefined reference to `__umoddi3'
   microblaze-linux-ld: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:76: undefined reference to `__umoddi3'
   microblaze-linux-ld: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:76: undefined reference to `__umoddi3'


vim +132 drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/amdgpu_ras_mgr.c

fa0b203cd902608 YiPeng Chai 2025-03-17   96  
fa0b203cd902608 YiPeng Chai 2025-03-17   97  static int amdgpu_ras_mgr_init_eeprom_config(struct amdgpu_device *adev,
fa0b203cd902608 YiPeng Chai 2025-03-17   98  		struct ras_core_config *config)
fa0b203cd902608 YiPeng Chai 2025-03-17   99  {
fa0b203cd902608 YiPeng Chai 2025-03-17  100  	struct ras_eeprom_config *eeprom_cfg = &config->eeprom_cfg;
fa0b203cd902608 YiPeng Chai 2025-03-17  101  
fa0b203cd902608 YiPeng Chai 2025-03-17  102  	eeprom_cfg->eeprom_sys_fn = &amdgpu_ras_eeprom_i2c_sys_func;
fa0b203cd902608 YiPeng Chai 2025-03-17  103  	eeprom_cfg->eeprom_i2c_adapter = adev->pm.ras_eeprom_i2c_bus;
fa0b203cd902608 YiPeng Chai 2025-03-17  104  	if (eeprom_cfg->eeprom_i2c_adapter) {
fa0b203cd902608 YiPeng Chai 2025-03-17  105  		const struct i2c_adapter_quirks *quirks =
fa0b203cd902608 YiPeng Chai 2025-03-17  106  			((struct i2c_adapter *)eeprom_cfg->eeprom_i2c_adapter)->quirks;
fa0b203cd902608 YiPeng Chai 2025-03-17  107  
fa0b203cd902608 YiPeng Chai 2025-03-17  108  		if (quirks) {
fa0b203cd902608 YiPeng Chai 2025-03-17  109  			eeprom_cfg->max_i2c_read_len = quirks->max_read_len;
fa0b203cd902608 YiPeng Chai 2025-03-17  110  			eeprom_cfg->max_i2c_write_len = quirks->max_write_len;
fa0b203cd902608 YiPeng Chai 2025-03-17  111  		}
fa0b203cd902608 YiPeng Chai 2025-03-17  112  	}
fa0b203cd902608 YiPeng Chai 2025-03-17  113  
fa0b203cd902608 YiPeng Chai 2025-03-17  114  	/*
fa0b203cd902608 YiPeng Chai 2025-03-17  115  	 * amdgpu_bad_page_threshold is used to config
fa0b203cd902608 YiPeng Chai 2025-03-17  116  	 * the threshold for the number of bad pages.
fa0b203cd902608 YiPeng Chai 2025-03-17  117  	 * -1:  Threshold is set to default value
fa0b203cd902608 YiPeng Chai 2025-03-17  118  	 *      Driver will issue a warning message when threshold is reached
fa0b203cd902608 YiPeng Chai 2025-03-17  119  	 *      and continue runtime services.
fa0b203cd902608 YiPeng Chai 2025-03-17  120  	 * 0:   Disable bad page retirement
fa0b203cd902608 YiPeng Chai 2025-03-17  121  	 *      Driver will not retire bad pages
fa0b203cd902608 YiPeng Chai 2025-03-17  122  	 *      which is intended for debugging purpose.
fa0b203cd902608 YiPeng Chai 2025-03-17  123  	 * -2:  Threshold is determined by a formula
fa0b203cd902608 YiPeng Chai 2025-03-17  124  	 *      that assumes 1 bad page per 100M of local memory.
fa0b203cd902608 YiPeng Chai 2025-03-17  125  	 *      Driver will continue runtime services when threhold is reached.
fa0b203cd902608 YiPeng Chai 2025-03-17  126  	 * 0 < threshold < max number of bad page records in EEPROM,
fa0b203cd902608 YiPeng Chai 2025-03-17  127  	 *      A user-defined threshold is set
fa0b203cd902608 YiPeng Chai 2025-03-17  128  	 *      Driver will halt runtime services when this custom threshold is reached.
fa0b203cd902608 YiPeng Chai 2025-03-17  129  	 */
fa0b203cd902608 YiPeng Chai 2025-03-17  130  	if (amdgpu_bad_page_threshold == NONSTOP_OVER_THRESHOLD)
fa0b203cd902608 YiPeng Chai 2025-03-17  131  		eeprom_cfg->eeprom_record_threshold_count =
fa0b203cd902608 YiPeng Chai 2025-03-17 @132  				ESTIMATE_BAD_PAGE_THRESHOLD(adev->gmc.mc_vram_size);
fa0b203cd902608 YiPeng Chai 2025-03-17  133  	else if (amdgpu_bad_page_threshold == WARN_NONSTOP_OVER_THRESHOLD)
fa0b203cd902608 YiPeng Chai 2025-03-17  134  		eeprom_cfg->eeprom_record_threshold_count =
fa0b203cd902608 YiPeng Chai 2025-03-17  135  				COUNT_BAD_PAGE_THRESHOLD(RAS_RESERVED_VRAM_SIZE_DEFAULT);
fa0b203cd902608 YiPeng Chai 2025-03-17  136  	else
fa0b203cd902608 YiPeng Chai 2025-03-17  137  		eeprom_cfg->eeprom_record_threshold_count = amdgpu_bad_page_threshold;
fa0b203cd902608 YiPeng Chai 2025-03-17  138  
fa0b203cd902608 YiPeng Chai 2025-03-17  139  	eeprom_cfg->eeprom_record_threshold_config = amdgpu_bad_page_threshold;
fa0b203cd902608 YiPeng Chai 2025-03-17  140  
fa0b203cd902608 YiPeng Chai 2025-03-17  141  	return 0;
fa0b203cd902608 YiPeng Chai 2025-03-17  142  }
fa0b203cd902608 YiPeng Chai 2025-03-17  143  

:::::: The code at line 132 was first introduced by commit
:::::: fa0b203cd902608a214130c83e6a6d76fe04b708 drm/amd/ras: Add amdgpu ras management function.

:::::: TO: YiPeng Chai <YiPeng.Chai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
