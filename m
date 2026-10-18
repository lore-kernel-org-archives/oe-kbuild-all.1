Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C5B44725F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309966; cv=none; b=T2/MKiqTs+ZR/JEe+vTZ0oJggMSwknGGeMxb9LNFxBiUX6ifpq/iVG6q5Qf3r+MnYRSLrajas7D1jp3U5eLfDTcEfShB63+Q6am/pt7eFvUHjV4LC/6bpk515pCiP+85XjTUFKKZBC6W2IUwS6Kq9Y6vO58hL/nh1CnLqrZuGVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309966; c=relaxed/simple;
	bh=jOjltlJUt6ytuQE6PB3StTm3i7Cihmt6VfhYP5n+vNg=;
	h=Date:From:Cc:Subject:Message-ID; b=IbPr4l6Am5lJ/tuiDhx59/qU7wb8+38S9+0YN8CJ/5kroBd0hQ5YpxEaMvemrUO7HE6J8ovfxYHeiyhSNuCx1Ndm/hsk1++131ugR9kU+x3USAl/TQj/F0S4SP2ZeTvd/QBdUfsN+Obh+jpiHPmOtOO9QPxlqwMlEAa7DfAijeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amr7Gq68; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amr7Gq68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309962; x=1823845962;
  h=date:from:cc:subject:message-id;
  bh=jOjltlJUt6ytuQE6PB3StTm3i7Cihmt6VfhYP5n+vNg=;
  b=amr7Gq68BriRdIPuy4BNaWUtzUBmN3CDWzKq0PMy73cdit0zCsOsWDfd
   1+WexJPZLO1etzHIPtJnussETW+3YlVF2trKjaNP0PXDDGj/eo4gCXADr
   Jps3n1+BBb8WVBc+HeNCzr7bu+wXe89k52VV4AzCpR01htA+O18AJ6WTa
   UIIUg3+Pb+AU3PEptc5Z8jkxhXb5adK7TxT2iOSaHkGAzfmZKAcp/bCvB
   vbRRDB0VsMnwCmGM1idcLP4Qekq/7wDdwdwMuAqFyLaHKtx5vTIut+DQE
   00iU64+SrVsubC+IEI/xCv2Rgnr2/wThfoAHA09QsZwQ1q7f9909rapPO
   Q==;
X-CSE-ConnectionGUID: 8ArhPFz/RVqOuJe0AAAnng==
X-CSE-MsgGUID: 6FRzNEZbSP617DN5DrAZAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908855"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908855"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:37 -0700
X-CSE-ConnectionGUID: 2VhYRTNoRPejXfJaAPA/tA==
X-CSE-MsgGUID: 4wqd639AQZGikhdNzrMo1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115556"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004y3-2dNU;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:43:35 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1145:undefined
 reference to `xe_configfs_get_ctx_restore_mid_bb'
Message-ID: <202610162335.FEwMdGY9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
commit: 7a4756b2fd0431f109b07b904a7442f00838abf9 drm/xe/lrc: Allow to add user commands mid context switch
date:   1 year, 1 month ago
config: xtensa-randconfig-r2305-20261014 (https://download.01.org/0day-ci/archive/20261016/202610162335.FEwMdGY9-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610162335.FEwMdGY9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7a4756b2fd04 ("drm/xe/lrc: Allow to add user commands mid context switch")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610162335.FEwMdGY9-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .text VMA [00003000,01941ebb] overlaps section .data VMA [00000000,0032a4bf]
   xtensa-linux-ld: section .init.data VMA [0032a4c0,003337eb] overlaps section .text VMA [00003000,01941ebb]
   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1424:(.exception.text+0x1e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init':
   drivers/gpu/drm/xe/xe_guc.c:827:(.text+0x1cd4): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   drivers/gpu/drm/xe/xe_guc.c:90:(.text+0x1f76): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engine_setup_default_lrc_state':
   drivers/gpu/drm/xe/xe_hw_engine.c:828:(.text+0x10cc): undefined reference to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x160a): undefined reference to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_invalidate_state_cache_wa':
   drivers/gpu/drm/xe/xe_lrc.c:1116:(.text+0x6c4): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x704): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
>> xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1145:(.text+0x784): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
>> drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x7c4): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_write_ring':
   drivers/gpu/drm/xe/xe_lrc.c:1387:(.text+0x539c): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x5680): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
   drivers/gpu/drm/xe/xe_pci.c:822:(.text+0x1284): undefined reference to `xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   drivers/gpu/drm/xe/xe_pci.c:828:(.text+0x13f6): undefined reference to `xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `psmi_debugfs_capture_addr_show':
   drivers/gpu/drm/xe/xe_psmi.c:260:(.text+0x904): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x932): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:289:(.text+0x9c4): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x9e8): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_not_sriov_vf':
   drivers/gpu/drm/xe/xe_rtp.c:370:(.text+0x1404): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c:371: more undefined references to `xe_configfs_get_psmi_enabled' follow
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_boot_enabled':
   drivers/gpu/drm/xe/xe_survivability_mode.c:285:(.text+0x55c): undefined reference to `xe_configfs_get_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:295:(.text+0x5d2): undefined reference to `xe_configfs_get_survivability_mode'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
