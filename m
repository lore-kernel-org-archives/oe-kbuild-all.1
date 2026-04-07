Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63522375F9A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534196; cv=none; b=DWwKyTUhxYtAiVGA9yxiebSUkh/fzhn1zucAC7HI76bFJDaZKC36MQEatwNSwu8iH1RHefYS3s8Wqjx7pt0dVH4fN/KNEVxMvqX2Z04VdHcIgu8ZsKk+rfb4G6trqver0leiheh7MuZb2GpPN2NASMSJ8h0mm7SxWw3Y5jPlZig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534196; c=relaxed/simple;
	bh=qMDzu/Sbryu8cWF9DCzCau20XMxURV7FGoeTlv0K2jY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GDnscDLI+WoLQ3AooTPn0s99+7Q+4GtrctT239nmE+FmNDtL+wrhSjQxggMSQ2jw3Owbq0at2kvYlPVxMzRpmK/pEhB7Owdcd83GawMxpJgdtdnIdNcfiRJrjtyJ0K34etvKheiRAtwDPvDZzDY1IrrEkop6hNpIKOsC4YkbgQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fsn2MRaW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fsn2MRaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534192; x=1807070192;
  h=date:from:to:cc:subject:message-id;
  bh=qMDzu/Sbryu8cWF9DCzCau20XMxURV7FGoeTlv0K2jY=;
  b=Fsn2MRaWi/zhFb2bj3AgDQWyD129j1BLSYzQmo134dgkj62nG1PtUOQr
   E1T1ok5lpMLqFOyXoVo5i6ucF28tYg1F7N3f1cRwkMPMs6+75MwGatGn/
   tXPTY20DLv4jmD7GjwO21QNjb00+7ehEVTcGYLuMjwfPpUinHORC2MsJf
   hIL0u1yg0nG0fQkhzYFxg/Rk2g/j/G/MNgE3cXkDa7icJYJsxG0E7ws6e
   aGoelYovtf6+DqRSsfjDln1gcA0mLzaxiwBKCMdvcq7zRxfUrNcdFA2Er
   eJd2ndLTZ5xaEvZXZ3xzj6CqXEhUvGHktkEb0Vgh4tzKYwhik2x3mOhvi
   Q==;
X-CSE-ConnectionGUID: CV71IP+uS6SjeWmaJVt/kA==
X-CSE-MsgGUID: T7MUn+UUQDqiSteOOip5Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80081022"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80081022"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:56:32 -0700
X-CSE-ConnectionGUID: y/bSyrgtRBGqvgXW8lGAnQ==
X-CSE-MsgGUID: JVpmRoGWTHy1hANIuTom/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227995129"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:56:30 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xY8-0000000004t-0sKT;
	Tue, 07 Apr 2026 03:56:24 +0000
Date: Tue, 07 Apr 2026 11:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: drivers/gpu/drm/xe/xe_pci.c:700:undefined reference to
 `xe_configfs_primary_gt_allowed'
Message-ID: <202604041843.GXLHHVTu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ca6d1cfec80ebe46cc063f3284c5896c344d9a1
commit: 7abd69278bb53ab6b43f9650daba550cc7624858 drm/xe/configfs: Add attribute to disable GT types
date:   6 months ago
config: arc-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260404/202604041843.GXLHHVTu-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041843.GXLHHVTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7abd69278bb5 ("drm/xe/configfs: Add attribute to disable GT types")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041843.GXLHHVTu-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0xa16): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: xe_guc.c:(.text+0xa16): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:814:(.text+0x99a): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.c:814:(.text+0x99a): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x5ce): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x5ce): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x79e): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x79e): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x2332): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x2332): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
>> drivers/gpu/drm/xe/xe_pci.c:700:(.text+0x46c): undefined reference to `xe_configfs_primary_gt_allowed'
>> arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:700:(.text+0x46c): undefined reference to `xe_configfs_primary_gt_allowed'
>> arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:730:(.text+0x520): undefined reference to `xe_configfs_media_gt_allowed'
>> arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:730:(.text+0x520): undefined reference to `xe_configfs_media_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   drivers/gpu/drm/xe/xe_pci.c:911:(.text+0x68a): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:911:(.text+0x68a): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x2f2): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x2f2): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x364): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x364): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   drivers/gpu/drm/xe/xe_rtp.c:372:(.text+0x6ca): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c:372: more undefined references to `xe_configfs_get_psmi_enabled' follow
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:295:(.text+0x262): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:295:(.text+0x262): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_sriov_pf_readiness':
   drivers/gpu/drm/xe/xe_sriov_pf.c:24:(.text+0x1c4): undefined reference to `xe_configfs_get_max_vfs'
   arc-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.c:24:(.text+0x1c4): undefined reference to `xe_configfs_get_max_vfs'


vim +700 drivers/gpu/drm/xe/xe_pci.c

   692	
   693	static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
   694					      const struct xe_graphics_desc *graphics_desc,
   695					      const struct xe_media_desc *media_desc)
   696	{
   697		struct xe_device *xe = tile_to_xe(tile);
   698		struct xe_gt *gt;
   699	
 > 700		if (!xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev))) {
   701			xe_info(xe, "Primary GT disabled via configfs\n");
   702			return NULL;
   703		}
   704	
   705		gt = xe_gt_alloc(tile);
   706		if (IS_ERR(gt))
   707			return gt;
   708	
   709		gt->info.type = XE_GT_TYPE_MAIN;
   710		gt->info.id = tile->id * xe->info.max_gt_per_tile;
   711		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
   712		gt->info.engine_mask = graphics_desc->hw_engine_mask;
   713	
   714		/*
   715		 * Before media version 13, the media IP was part of the primary GT
   716		 * so we need to add the media engines to the primary GT's engine list.
   717		 */
   718		if (MEDIA_VER(xe) < 13 && media_desc)
   719			gt->info.engine_mask |= media_desc->hw_engine_mask;
   720	
   721		return gt;
   722	}
   723	
   724	static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
   725					    const struct xe_media_desc *media_desc)
   726	{
   727		struct xe_device *xe = tile_to_xe(tile);
   728		struct xe_gt *gt;
   729	
 > 730		if (!xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev))) {
   731			xe_info(xe, "Media GT disabled via configfs\n");
   732			return NULL;
   733		}
   734	
   735		if (MEDIA_VER(xe) < 13 || !media_desc)
   736			return NULL;
   737	
   738		gt = xe_gt_alloc(tile);
   739		if (IS_ERR(gt))
   740			return gt;
   741	
   742		gt->info.type = XE_GT_TYPE_MEDIA;
   743		gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
   744		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
   745		gt->info.engine_mask = media_desc->hw_engine_mask;
   746	
   747		return gt;
   748	}
   749	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
