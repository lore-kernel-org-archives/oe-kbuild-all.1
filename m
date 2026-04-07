Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0888D33688C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533886; cv=none; b=ExxWUqSr8PDmEFOWR5OmKDOskHXYbHol8n6djJO5RUZK1888GwjW7n+cLTNWMbgtvNe93K2N8fwE5/ChJnnX8yR9VkbIwgrKcI7kNcq6BuTeCIwfzsGZA/1Fcf4PG0gcTU37HcY307I7eNd+aCNzV6WqXngHfObysVx8lqRwAl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533886; c=relaxed/simple;
	bh=xPtZ0UvweD0dhgDgXwULe4QmSMePK1hb/xm9myRXCR8=;
	h=Date:From:Cc:Subject:Message-ID; b=FihSQia8GeNjjTCTZ93Th9SQVcwP4Fb0GQHPSuuXCfI0hxBMJmGLCetc4Ai+yLVxrooUkIa9qb/225o0/LEF+5fzB/ZFPIYm6zepd/nmnLXdHiLR03lsjjTVQqk8OoIoTjTJMmun3iFW8Z7ww5NRT0dXD4WvMrNcEsnh/c3WnHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNdacgjb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNdacgjb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533885; x=1807069885;
  h=date:from:cc:subject:message-id;
  bh=xPtZ0UvweD0dhgDgXwULe4QmSMePK1hb/xm9myRXCR8=;
  b=GNdacgjb/G/juZjAjAv7jZun1k3I2LPe/q5t48izpUdkXUrfhfEtH3wn
   EQBhnCdyqmdQxFGd0qkLHLoEqxw+lbdHBc/yrTTMqhXL4fjz0hkzoHTb/
   A14ltZYBJOJI765lpkCy6nb75bXFxzlYRLXKl/niR2/snR2dLBfSh0Dbv
   RA549NZeuaxPudmX/zfGW9MvnJGVuHDnjuv16TSc1j2UAmHgC+I1F/fRb
   gI2p+L/6fsgDAgQht88TeXI1ziV5ixpPeaZ1dCHLvUUUWuiUZo3CUYz7G
   YhOKHacGpOF27oa6mFmLLpIVVanxB0DfZoeDtneuzzkTIU4hFAzAu3qn3
   w==;
X-CSE-ConnectionGUID: GbboGf3USnWmfB0gln8MpA==
X-CSE-MsgGUID: xvPFnr0hTQ2Uwn9CS+JKtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87942005"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87942005"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:51:22 -0700
X-CSE-ConnectionGUID: aTWlZNnJTVKdwyXacfd7hg==
X-CSE-MsgGUID: ZzxNA8TeRKyjcmZawLyoKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="221477976"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Apr 2026 20:51:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xTC-0000000002L-2UVT;
	Tue, 07 Apr 2026 03:51:18 +0000
Date: Tue, 07 Apr 2026 11:50:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: drivers/gpu/drm/xe/xe_lrc.c:1151:undefined reference to
 `xe_configfs_get_ctx_restore_mid_bb'
Message-ID: <202604040458.AAyuRWcU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d8a9a4b11a137909e306e50346148fc5c3b63f9d
commit: 7a4756b2fd0431f109b07b904a7442f00838abf9 drm/xe/lrc: Allow to add user commands mid context switch
date:   7 months ago
config: arc-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260404/202604040458.AAyuRWcU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040458.AAyuRWcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7a4756b2fd04 ("drm/xe/lrc: Allow to add user commands mid context switch")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040458.AAyuRWcU-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   drivers/gpu/drm/xe/xe_guc.c:90:(.text+0xb7a): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_guc.c:90:(.text+0xb7a): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x994): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x994): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x5ce): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1122:(.text+0x5ce): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
>> drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x79e): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
>> arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1151:(.text+0x79e): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x230c): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:87:(.text+0x230c): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   drivers/gpu/drm/xe/xe_pci.c:828:(.text+0x5f6): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:828:(.text+0x5f6): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x2f6): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x2f6): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x368): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x368): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   drivers/gpu/drm/xe/xe_rtp.c:371:(.text+0x706): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c:371: more undefined references to `xe_configfs_get_psmi_enabled' follow
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:295:(.text+0x264): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:295:(.text+0x264): undefined reference to `xe_configfs_get_survivability_mode'


vim +1151 drivers/gpu/drm/xe/xe_lrc.c

  1141	
  1142	static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
  1143							 struct xe_hw_engine *hwe,
  1144							 u32 *batch, size_t max_len)
  1145	{
  1146		struct xe_device *xe = gt_to_xe(lrc->gt);
  1147		const u32 *user_batch;
  1148		u32 *cmd = batch;
  1149		u32 count;
  1150	
> 1151		count = xe_configfs_get_ctx_restore_mid_bb(to_pci_dev(xe->drm.dev),
  1152							   hwe->class, &user_batch);
  1153		if (!count)
  1154			return 0;
  1155	
  1156		if (count > max_len)
  1157			return -ENOSPC;
  1158	
  1159		/*
  1160		 * This should be used only for tests and validation. Taint the kernel
  1161		 * as anything could be submitted directly in context switches
  1162		 */
  1163		add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
  1164	
  1165		memcpy(cmd, user_batch, count * sizeof(u32));
  1166		cmd += count;
  1167	
  1168		return cmd - batch;
  1169	}
  1170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
