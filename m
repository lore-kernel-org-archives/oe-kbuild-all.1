Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE5A2FB97A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 10:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139495; cv=none; b=Fe+LVsmtaaNhI2f4BYpJbyo7xYLBbiuPZBW/o9uHsfnLZG1mfRLHSgV/Vdn1gXIuyqRPcVm+0j4dGNUH9a+2/MEGHjOO+3w6wRj5pRE9YFjau47NE3VKP5zIV337kJVzyzoH8uady0/h3+k0SB1b1qOeLxCuzp7H+NU02CQr3Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139495; c=relaxed/simple;
	bh=VWFuBGul3lZaDoLxWebUY/vTS/ujwO5+NTo9mp0r14w=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kMoNCjr6ESKcIUMy8JkJ+cDA6utQoUxDtEEzVKWFawlA4v64HgGs5b/aPAtYQiuclyIx3mBMVH5XswbpW+J3WIsVsTKUdUC8snzWRnDT5moqWElkkMfvezde8knrPVU9RDwy3wxKwoCdQrpv6EDdYGzEdve2JuhL6i3mLj/YJwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZXg04kv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZXg04kv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766139493; x=1797675493;
  h=date:from:cc:subject:message-id:mime-version;
  bh=VWFuBGul3lZaDoLxWebUY/vTS/ujwO5+NTo9mp0r14w=;
  b=OZXg04kvwYO4w5kPL0Rv5gSmXBUTHxq2am8/QcKSZcRnyXYLfKvjW6ul
   HFJnf2FdYXp2M5dMKMx+UMZoky24GYzHVBRxxkwspUpq6uf3JZaoBvRLR
   oJ6dxEJJ8KTLUKhJQzXpYj/gGxaqHx4OQNaZYbiH6cZve7PcwhW85xUW0
   Sx+uMrZ0n0uTiShym0fXAdVVrJevcy/RKHvtiZlidw4EWhvyBzKOEXGB3
   nuIXZLdxa9JsH4QYOdMlDwaqD1a6w+sQRZ51avNTTdiOBy96rWNQMsU14
   wcEuaQhp81Vr0Z1MqPfyGAhSVC3diyPjytgbL8g9KZAC5tlrP8Xxh1xVO
   A==;
X-CSE-ConnectionGUID: KiA9mEMfTCWYB1rLYBurig==
X-CSE-MsgGUID: Ybn7Tiw5R+29gfDtaPPR1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79557174"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="79557174"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 02:18:10 -0800
X-CSE-ConnectionGUID: HZEH84j5Q+2WTxVP3FPFJA==
X-CSE-MsgGUID: YcFDu0KqS+CcjAtvNgz5dQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Dec 2025 02:18:08 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWXYj-000000003Lh-22EF;
	Fri, 19 Dec 2025 10:18:05 +0000
Date: Fri, 19 Dec 2025 18:17:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Riana Tauro <riana.tauro@intel.com>
Subject: xe_guc.c:undefined reference to `xe_configfs_get_psmi_enabled'
Message-ID: <202512191941.T8GV5HoB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: afe902848b417da81f60b3d15cbae40a67286dbf drm/xe/configfs: Allow to enable PSMI
date:   4 months ago
config: powerpc64-randconfig-r053-20251218 (https://download.01.org/0day-ci/archive/20251219/202512191941.T8GV5HoB-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191941.T8GV5HoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191941.T8GV5HoB-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `xe_configfs_clear_survivability_mode'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
>> xe_guc.c:(.text+0xf6c): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   xe_hw_engine.c:(.text+0xebc): undefined reference to `xe_configfs_get_engines_allowed'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
>> xe_psmi.c:(.text+0x53c): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   xe_psmi.c:(.text+0x5f8): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
>> xe_rtp.c:(.text+0xba0): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_fini':
   xe_survivability_mode.c:(.text+0x260): undefined reference to `xe_configfs_clear_survivability_mode'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   xe_survivability_mode.c:(.text+0x2cc): undefined reference to `xe_configfs_get_survivability_mode'
   powerpc64-linux-ld: xe_survivability_mode.c:(.text+0x304): undefined reference to `xe_configfs_clear_survivability_mode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
