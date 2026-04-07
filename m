Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958E2376BD6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534264; cv=none; b=DJAH3W96U0TrbDr41csJU+icItjm8TG4pID7jcSSZupjTqLDjCRjOv5UH1TXZfP/Vz1+zCFXsR06VCfT2Da82AR7iDvabz7mXFvcSw/kI6EWv8aVNfYINgYSpOcXIRsTc7rwSVhS2duhBiTA1leHVrqI5U1W2cG3+tCZpQGJ0fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534264; c=relaxed/simple;
	bh=owyW7sX1t6lpgdPGIKSYzdkfYYFdbjoRyCMQxmvfwHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GDa7x905ft/R4/hNmphrpv9M/8+Ehz0H9avwHojGvtg1wXglDuCeITR7MqK4E+F4Y7WjD/UryS63RXiH3zJzYG7LBKHKxO/bfvXYvAEbBwPq1vlTURcJxa3+K6Vwh7ofTDg+DjWjQm7KId1S6NogNKPfxhd6bHQzhxVLm1n8Vo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgX2ZfQZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgX2ZfQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534263; x=1807070263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=owyW7sX1t6lpgdPGIKSYzdkfYYFdbjoRyCMQxmvfwHg=;
  b=NgX2ZfQZfENR/C+Ag7rahLV/o5oSyCnlsZ7QigjjygTZbADvMQkGgSJS
   HyBSOjdTja41dXRkydtxiq7yRIok7YES6hcqWKruOpc5JWAf/gbZe8JbN
   hYGpg8391YBjbrUqqGEs2imhWj4OBgxaZcbNrD+txF3xrM12uUJThW8lm
   MPN0FlVhOkdnWnrnkNMlN+W2Y57fXIzPuDMlx5oRnC40hGJ3CVbqyFay/
   o6vQWGGZ43bpsZNRmrwXK3sYPckwxxdP5VVPlzbtVydbH2SCDbNEAEnd6
   yEWs4XYMafCCksk1WdpVA9vG6+DVxnxTsad/dbbH7S6v6XcD1eqJjzOAi
   w==;
X-CSE-ConnectionGUID: D7zU0My4TeOzXyDyR5qxpQ==
X-CSE-MsgGUID: tzsi5/P4QOi0ZZQL5hTMeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80081106"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80081106"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:57:38 -0700
X-CSE-ConnectionGUID: hRbd83U4QHOAYc1b1tk1Mg==
X-CSE-MsgGUID: xVyH6CV8Roq8QzLdbLi60w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227995310"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:57:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xZE-0000000005Z-3xsU;
	Tue, 07 Apr 2026 03:57:32 +0000
Date: Tue, 07 Apr 2026 11:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Piotr =?utf-8?Q?Pi=C3=B3rkowski"?= <piotr.piorkowski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 =?utf-8?Q?"Micha=C5=82?= Winiarski" <michal.winiarski@intel.com>
Subject: drivers/gpu/drm/xe/xe_pci.c:561:undefined reference to
 `xe_configfs_media_gt_allowed'
Message-ID: <202604042144.qtzDC8tq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ca6d1cfec80ebe46cc063f3284c5896c344d9a1
commit: 5e905ec67214444362b81345ef8fde63e58425b6 drm/xe/vf: Avoid reading media version when media GT is disabled
date:   7 weeks ago
config: arc-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260404/202604042144.qtzDC8tq-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604042144.qtzDC8tq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5e905ec67214 ("drm/xe/vf: Avoid reading media version when media GT is disabled")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604042144.qtzDC8tq-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0x1356): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: xe_guc.c:(.text+0x1356): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:845:(.text+0x9de): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.c:845:(.text+0x9de): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1143:(.text+0x5d2): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1143:(.text+0x5d2): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1172:(.text+0x7a2): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1172:(.text+0x7a2): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   drivers/gpu/drm/xe/xe_lrc.c:92:(.text+0x2378): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:92:(.text+0x2378): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `read_gmdid':
>> drivers/gpu/drm/xe/xe_pci.c:561:(.text+0x10e): undefined reference to `xe_configfs_media_gt_allowed'
>> arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:561:(.text+0x10e): undefined reference to `xe_configfs_media_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
   drivers/gpu/drm/xe/xe_pci.c:780:(.text+0x476): undefined reference to `xe_configfs_primary_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:780:(.text+0x476): undefined reference to `xe_configfs_primary_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:811:(.text+0x52c): undefined reference to `xe_configfs_media_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:811:(.text+0x52c): undefined reference to `xe_configfs_media_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   drivers/gpu/drm/xe/xe_pci.c:992:(.text+0x698): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:992:(.text+0x698): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:710:(.text+0x8b6): undefined reference to `xe_configfs_primary_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:710:(.text+0x8b6): undefined reference to `xe_configfs_primary_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x2f6): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x2f6): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x368): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x368): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   drivers/gpu/drm/xe/xe_rtp.c:371:(.text+0x6ca): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c:371: more undefined references to `xe_configfs_get_psmi_enabled' follow
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:384:(.text+0x240): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:384:(.text+0x240): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_sriov_pf_readiness':
   drivers/gpu/drm/xe/xe_sriov_pf.c:26:(.text+0x218): undefined reference to `xe_configfs_get_max_vfs'
   arc-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.c:26:(.text+0x218): undefined reference to `xe_configfs_get_max_vfs'


vim +561 drivers/gpu/drm/xe/xe_pci.c

   537	
   538	static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
   539	{
   540		struct xe_mmio *mmio = xe_root_tile_mmio(xe);
   541		struct xe_reg gmdid_reg = GMD_ID;
   542		u32 val;
   543	
   544		KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
   545	
   546		if (IS_SRIOV_VF(xe)) {
   547			/*
   548			 * To get the value of the GMDID register, VFs must obtain it
   549			 * from the GuC using MMIO communication.
   550			 *
   551			 * Note that at this point the GTs are not initialized and only
   552			 * tile-level access to MMIO registers is possible. To use our
   553			 * existing GuC communication functions we must create a dummy
   554			 * GT structure and perform at least basic xe_gt and xe_guc
   555			 * initialization.
   556			 */
   557			struct xe_gt *gt __free(kfree) = NULL;
   558			int err;
   559	
   560			/* Don't try to read media ver if media GT is not allowed */
 > 561			if (type == GMDID_MEDIA && !xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev))) {
   562				*ver = *revid = 0;
   563				return 0;
   564			}
   565	
   566			gt = kzalloc(sizeof(*gt), GFP_KERNEL);
   567			if (!gt)
   568				return -ENOMEM;
   569	
   570			gt->tile = &xe->tiles[0];
   571			if (type == GMDID_MEDIA) {
   572				gt->info.id = 1;
   573				gt->info.type = XE_GT_TYPE_MEDIA;
   574			} else {
   575				gt->info.id = 0;
   576				gt->info.type = XE_GT_TYPE_MAIN;
   577			}
   578	
   579			xe_gt_mmio_init(gt);
   580			xe_guc_comm_init_early(&gt->uc.guc);
   581	
   582			err = xe_gt_sriov_vf_bootstrap(gt);
   583			if (err)
   584				return err;
   585	
   586			val = xe_gt_sriov_vf_gmdid(gt);
   587		} else {
   588			/*
   589			 * GMD_ID is a GT register, but at this point in the driver
   590			 * init we haven't fully initialized the GT yet so we need to
   591			 * read the register with the tile's MMIO accessor.  That means
   592			 * we need to apply the GSI offset manually since it won't get
   593			 * automatically added as it would if we were using a GT mmio
   594			 * accessor.
   595			 */
   596			if (type == GMDID_MEDIA)
   597				gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
   598	
   599			val = xe_mmio_read32(mmio, gmdid_reg);
   600		}
   601	
   602		*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
   603		*revid = REG_FIELD_GET(GMD_ID_REVID, val);
   604	
   605		return 0;
   606	}
   607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
