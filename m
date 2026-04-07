Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C5F375F8E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534070; cv=none; b=Q4zFe4KSEZavlBjIvvo1yysYNi4us1COYvipNGA6wJfKMxAFzp5/iki2hawRxVDTBquPsrU2Q4NdhZ3nNtv5C5t2anZmAqYPeloNORkGypJqlkpZBISOrNdtAWHr9gtYiJIw7VUD4pXzXVIdpOlNz3LzWFeTK2ICKGiuWP4S4/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534070; c=relaxed/simple;
	bh=UcXLhn5TWJzOhPnH+/gmAQl163Z7rzLtKk1kDT1TW4Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NGKgSmigUhzImnCBy4RvdhXoPsfBtifgLgbX6bjYCWXCAN/BM3mx7PVNI2KeAiBRV17EwirGc/wdlCy7chw+ZIxGlwj4MU07aW0isOpd7xRY+K+wTiGa5oovKZVAK1pujOPYl92jEnmVYRCRhJ12wJyJ85mLcAXS0t2FhO4VZFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjE3Lz42; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjE3Lz42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534070; x=1807070070;
  h=date:from:to:cc:subject:message-id;
  bh=UcXLhn5TWJzOhPnH+/gmAQl163Z7rzLtKk1kDT1TW4Y=;
  b=CjE3Lz42h/owKC2frChrQckzDrMzDUsm2kbMZLwBJyL5L92Z0d/We1Fu
   bKcK6J+rXvyNjmTHMVe1rLSH4kcz/8PO9djihj41jEKJPuOc+roz2Gpw2
   q0wSNQ0uP0wGxYr5220I3iaBe2sg0a40akIi1dBWd7ow6KVXtJSZBVGuS
   w7NSGlWNrSKWKNd1KofQj4jfB2AoIhpYjp7Pj0b+ew9ghkNDcAzpuj9Cg
   Wqbq2v7pc1DRlxbqfw8fkxP7Cu+sY/vSgwA3oJJaN6xq9+DajWSciymUQ
   u8kmXpdKzhs+L9iqEoTA4qpZud+mcGAYpKXnBICqR4j6EeCUdgV3w56Bh
   g==;
X-CSE-ConnectionGUID: dVJdkfv1SMSGs4tLfpNRJA==
X-CSE-MsgGUID: OKLI2pXhTk+JmTWZ891B+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80080781"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80080781"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:54:27 -0700
X-CSE-ConnectionGUID: aUJx8SEfRHan/h7+gRX7lw==
X-CSE-MsgGUID: uU0hKxn2Sx+0Iq1nk2BwnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227994800"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:54:25 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xWA-0000000004C-1I6n;
	Tue, 07 Apr 2026 03:54:22 +0000
Date: Tue, 07 Apr 2026 11:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: drivers/gpu/drm/xe/xe_sriov_pf.c:24:undefined reference to
 `xe_configfs_get_max_vfs'
Message-ID: <202604041459.rn6LHDtB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ca6d1cfec80ebe46cc063f3284c5896c344d9a1
commit: c09a9933af08cdcb295ccc65a6d9862bf8474706 drm/xe/pf: Add max_vfs configfs attribute to control PF mode
date:   6 months ago
config: arc-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260404/202604041459.rn6LHDtB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041459.rn6LHDtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c09a9933af08 ("drm/xe/pf: Add max_vfs configfs attribute to control PF mode")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041459.rn6LHDtB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0xa16): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: xe_guc.c:(.text+0xa16): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x99e): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x99e): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x5ca): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x5ca): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x79a): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x79a): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x2322): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x2322): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   drivers/gpu/drm/xe/xe_pci.c:828:(.text+0x5de): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:828:(.text+0x5de): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x2fa): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x2fa): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x36c): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x36c): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   drivers/gpu/drm/xe/xe_rtp.c:371:(.text+0x706): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c:371: more undefined references to `xe_configfs_get_psmi_enabled' follow
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:295:(.text+0x262): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:295:(.text+0x262): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_sriov_pf_readiness':
>> drivers/gpu/drm/xe/xe_sriov_pf.c:24:(.text+0x1c8): undefined reference to `xe_configfs_get_max_vfs'
>> arc-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.c:24:(.text+0x1c8): undefined reference to `xe_configfs_get_max_vfs'


vim +24 drivers/gpu/drm/xe/xe_sriov_pf.c

    20	
    21	static unsigned int wanted_max_vfs(struct xe_device *xe)
    22	{
    23		if (IS_ENABLED(CONFIG_CONFIGFS_FS))
  > 24			return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
    25		return xe_modparam.max_vfs;
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
