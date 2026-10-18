Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55F6448384
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309966; cv=none; b=fcFKY3yzhlrjw0qqh6N+fHSIGJ1reeZvQAOmwOwS25m2CICz8r94EHejJf62Yqnl8p6KvoXW5ggtBQ4fyHb3hpimXZhyDsiK2bJ6YWOjSmXYgsAs/+oKhPy8ZtS+hzeg3QUPgDkcHKGIFg6Ms+sMqO3f+6dFkiHb8nz7tx5GTA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309966; c=relaxed/simple;
	bh=znwkJ0jXWhkNOTv8pnrKrbRqoJ9CkGXC00X3bAkhVXs=;
	h=Date:From:Cc:Subject:Message-ID; b=qeMOSm+A/XR33ClyZXN1v0BQnXfEIkQKks2RJUDVJDiBGgdg1qQ8ut+g8ispYmKpnu6Lp/IMSUGkJPVu7uOyW3r8mfxA7RxedBjsvsP1Ax2VFiWEbqIqwTAY52DGOBPqVa3R2PmrWbPlXm80l5hOBH7htWFx539UKs9UurjDkgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISzPssDV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISzPssDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309962; x=1823845962;
  h=date:from:cc:subject:message-id;
  bh=znwkJ0jXWhkNOTv8pnrKrbRqoJ9CkGXC00X3bAkhVXs=;
  b=ISzPssDVquGF4Tlt0xAsScvxWb8MKtnvPhlL6RSfKT3QUg54rnxjJ8tZ
   z7ZpA+/DvXW12lK5WT8IG9+ww5kyLV6aHycRBNR89Iy/rLL99S8jXWZVg
   n06qYHIu+nomTBBxh6WvraMwnUITLQbRliND3hrOqS89w/IUiUTaifMC5
   L1ff5rf4g7MqcHnqwzlpYsiG5McTo8OzmQGqhPcwyv1C7HPjevNj76RZA
   7VAbmgU8q9EpvYvgqynrmUNOPDVrl2fNGrxf9ap900VoC0H3mEUueY+c5
   Q3h9w8PpBCWhe58GMojys5pdUSoDma2hG3wh99vzAsbs0ax1epGQhiwA6
   g==;
X-CSE-ConnectionGUID: q2uDiOqnTqWrRQl69nWSQw==
X-CSE-MsgGUID: 6r+R+H+oRG6ZcHxjb18fUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908857"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908857"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:37 -0700
X-CSE-ConnectionGUID: n+A1IanmS1aU1mp9AJTTOg==
X-CSE-MsgGUID: hl6jBAxbQfmSAC+Czjdpng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115554"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004y0-2Wgh;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:46:10 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 John Harrison <John.C.Harrison@Intel.com>
Subject: xe_guc.c:undefined reference to
 `xe_configfs_get_psmi_enabled'
Message-ID: <202610171034.VxvUrqDj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lucas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
commit: abde96d8442de131fc3af647fdc63a0877dc99b6 drm/xe/guc: Extract function to print load error
date:   1 year, 1 month ago
config: xtensa-randconfig-r2305-20261014 (https://download.01.org/0day-ci/archive/20261017/202610171034.VxvUrqDj-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171034.VxvUrqDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: abde96d8442d ("drm/xe/guc: Extract function to print load error")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171034.VxvUrqDj-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .text VMA [00003000,019430fb] overlaps section .data VMA [00000000,0032a73f]
   xtensa-linux-ld: section .init.data VMA [0032a740,00333a6b] overlaps section .text VMA [00003000,019430fb]
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init':
>> xe_guc.c:(.text+0x1854): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0x1af6): undefined reference to `xe_configfs_get_psmi_enabled'
   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1424:(.exception.text+0x1e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engine_setup_default_lrc_state':
   drivers/gpu/drm/xe/xe_hw_engine.c:828:(.text+0x10cc): undefined reference to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x1606): undefined reference to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_invalidate_state_cache_wa':
   drivers/gpu/drm/xe/xe_lrc.c:1116:(.text+0x6c4): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x704): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1145:(.text+0x784): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x7c4): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_write_ring':
   drivers/gpu/drm/xe/xe_lrc.c:1387:(.text+0x535c): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x5640): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
   drivers/gpu/drm/xe/xe_pci.c:822:(.text+0x1244): undefined reference to `xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   drivers/gpu/drm/xe/xe_pci.c:828:(.text+0x13b6): undefined reference to `xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `psmi_debugfs_capture_addr_show':
   drivers/gpu/drm/xe/xe_psmi.c:260:(.text+0x884): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x8b2): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:289:(.text+0x944): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x968): undefined reference to `xe_configfs_get_psmi_enabled'
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
