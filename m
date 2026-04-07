Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38C1375F82
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534011; cv=none; b=h6CkoS4X7E/nZrl4ugVlK4y2ruXo2MPKQ7P+XhnxbSM3XJXRJokY5ds6boYl2Q+GomfVO0Y8/0COC6UsaEZGpDN/lFsNPjiPp89S2Q/FY5Mr0PROii+IY7fkOVwtE0s3nvjHRWs6vBzMgDO0O1TsfoRwYgvkg5eJqSPd8BUFor4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534011; c=relaxed/simple;
	bh=T/9r4ELlG1ggWIDvFoBoMrN4knVLKkzw3da6irj+deM=;
	h=Date:From:Cc:Subject:Message-ID; b=k+eY7xE576Zuq1yQNikc4J2md+QCNyfWE3KK3p22J7Wpt0eQAQMroH81m8z3Ipgg6Q6rxa208sQanEMviP5uUjknUuNZzNBY6UJlzkJKfVL5+wjuF6Eu/QxUKeeqJ0NGX0IsA5NV6N280RaIqHVzGsWhk58R4YcP3dvYzRGeuyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kbxmh+bl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kbxmh+bl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534010; x=1807070010;
  h=date:from:cc:subject:message-id;
  bh=T/9r4ELlG1ggWIDvFoBoMrN4knVLKkzw3da6irj+deM=;
  b=Kbxmh+blGZo4flUpvH+6sT/DQu5HBEdrXvHwKLCvFVvA0KHz22dYRu8W
   19ogbzC5IBWI9BIoIUD1AkgHFo+GHAq65Em1q3bL2mxiLVDV+bLeGHsJb
   VEzaGmfDjbB5Gm9MfRdqam5FsSSUUMmpr60LKdqO36KmrM9ZLzM79GOZP
   jrY8pIttfWwNOS9v/SyY2w1MrAVjS7jTrDeRGRqWdFqKFqvbXI7LAmvZL
   otSGYEQG4YvxxOMRxY7+9bt39FdaMamWB+bM+hA/xjtWDbHaaDvG53cDI
   U5cYAoW7/KY4Vm7AAATqlEXTIZTDIrnLLDWcCWpGuWANtxwb/MuoqmD35
   Q==;
X-CSE-ConnectionGUID: XCDzn/BtSCCrNSy1boCLgg==
X-CSE-MsgGUID: eBqMWh6oR0KXLe8vZOkNUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781629"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781629"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:53:26 -0700
X-CSE-ConnectionGUID: 47363xcvTFCHapOi6Ofqbg==
X-CSE-MsgGUID: W3d6+1AcRYu3T2ga7C3z8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225303587"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:53:24 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xVB-0000000003V-3Xug;
	Tue, 07 Apr 2026 03:53:21 +0000
Date: Tue, 07 Apr 2026 11:52:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 John Harrison <John.C.Harrison@Intel.com>
Subject: xe_guc.c:undefined reference to
 `xe_configfs_get_psmi_enabled'
Message-ID: <202604041034.uqMbzqXZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   631919fb12fe7b1f0453fe1035e62ce704bc3923
commit: abde96d8442de131fc3af647fdc63a0877dc99b6 drm/xe/guc: Extract function to print load error
date:   6 months ago
config: arc-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260404/202604041034.uqMbzqXZ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041034.uqMbzqXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: abde96d8442d ("drm/xe/guc: Extract function to print load error")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041034.uqMbzqXZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
>> xe_guc.c:(.text+0x9f2): undefined reference to `xe_configfs_get_psmi_enabled'
>> arc-linux-ld: xe_guc.c:(.text+0x9f2): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x99a): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x99a): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x5ca): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x5ca): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x79a): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x79a): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x2310): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x2310): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   drivers/gpu/drm/xe/xe_pci.c:828:(.text+0x5d2): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:828:(.text+0x5d2): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x2f2): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x2f2): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x364): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x364): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   drivers/gpu/drm/xe/xe_rtp.c:371:(.text+0x706): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c:371: more undefined references to `xe_configfs_get_psmi_enabled' follow
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:295:(.text+0x262): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:295:(.text+0x262): undefined reference to `xe_configfs_get_survivability_mode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
