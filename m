Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B6D37473A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533765; cv=none; b=eEZFyphrLI6smGAUmo2X5TSAcLD42K8UyAeUebM4CP4lvt07b6tVRTZx4gBzate0+TJBjyGl+fepvTbHsM3Jk2baPZGO6UELAB+rgUe56OriuOfW02yPUWpOMt9B7QHn8eJ9OVyIrLFXQVzBhzPi7nwk1VoBAWSGemRQeAXTLw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533765; c=relaxed/simple;
	bh=zmBtE/tDyvIPnUqO82t4WbVnVkVeQ1qLfF4HJSnBQMY=;
	h=Date:From:Cc:Subject:Message-ID; b=X1q34JIBRr9JhtFsOk6f4OCgTiQCwHQByrMuuyTzyuckFMOdgtvv1ZiGTcw7IXlZxmYUGgGdtkhIzc14IkOywRLxoNE6gKjx4KGu+Hnumn3snEx9Qx9b/FFIPna1w/leh1gDFtV7dPo+YIdHzbztqxY22JvND6/8B3pW2GSM+9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6hjwUze; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6hjwUze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533764; x=1807069764;
  h=date:from:cc:subject:message-id;
  bh=zmBtE/tDyvIPnUqO82t4WbVnVkVeQ1qLfF4HJSnBQMY=;
  b=S6hjwUzeEwiNgsQ2eSX2B8vHMJaq2Vir9k3u/r9YmBhKVj5dv05cLpq/
   7Rj71pZXj+GR8zQVZU65IbqR/zos7LYgnAAluRk0SkYx6HztMJeWAy2rt
   uNKA/TdZLu7ZURcjZpcFR798BsltcXEgTAcqOuXpdZMzga341hu9CW5gk
   AqAff0P7t52K4o2i2JWETCGZFddiqYrCB5t4TZKPtltqBdmqRVWXWNHU6
   edS/tMWP51d0CeDvp45GQ/BmyygI0ZqtyurlD6B8rcQ1HTr0ld+eiNsxP
   /v0OmFguwn4Dt7NY+30i3EkEZ3Odz18JSB6VFRHi4ogxUCnCuHSFo3JHb
   Q==;
X-CSE-ConnectionGUID: hT2RpOHXSg+ShyviEB5xwA==
X-CSE-MsgGUID: iRSQjOl7RkqVeoqbGZn6xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76385863"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76385863"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:49:22 -0700
X-CSE-ConnectionGUID: 7T8KBycEQHu8gG3GL+AQyQ==
X-CSE-MsgGUID: +fbvA30jQjGKngShf/jYrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251191880"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:49:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xRG-0000000001S-1Brv;
	Tue, 07 Apr 2026 03:49:18 +0000
Date: Tue, 07 Apr 2026 11:49:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: drivers/gpu/drm/xe/xe_lrc.c:1116:undefined reference to
 `xe_configfs_get_ctx_restore_post_bb'
Message-ID: <202604032219.qsUONow2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d8a9a4b11a137909e306e50346148fc5c3b63f9d
commit: 6c6988c5e03df145e6c5cabc50d67b11f5aa2e56 drm/xe/lrc: Allow to add user commands on context switch
date:   7 months ago
config: arc-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260403/202604032219.qsUONow2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604032219.qsUONow2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6c6988c5e03d ("drm/xe/lrc: Allow to add user commands on context switch")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604032219.qsUONow2-lkp@intel.com/

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
>> drivers/gpu/drm/xe/xe_lrc.c:1116:(.text+0x5ce): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
>> arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1116:(.text+0x5ce): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
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


vim +1116 drivers/gpu/drm/xe/xe_lrc.c

  1106	
  1107	static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
  1108							  struct xe_hw_engine *hwe,
  1109							  u32 *batch, size_t max_len)
  1110	{
  1111		struct xe_device *xe = gt_to_xe(lrc->gt);
  1112		const u32 *user_batch;
  1113		u32 *cmd = batch;
  1114		u32 count;
  1115	
> 1116		count = xe_configfs_get_ctx_restore_post_bb(to_pci_dev(xe->drm.dev),
  1117							    hwe->class, &user_batch);
  1118		if (!count)
  1119			return 0;
  1120	
  1121		if (count > max_len)
  1122			return -ENOSPC;
  1123	
  1124		/*
  1125		 * This should be used only for tests and validation. Taint the kernel
  1126		 * as anything could be submitted directly in context switches
  1127		 */
  1128		add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
  1129	
  1130		memcpy(cmd, user_batch, count * sizeof(u32));
  1131		cmd += count;
  1132	
  1133		return cmd - batch;
  1134	}
  1135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
