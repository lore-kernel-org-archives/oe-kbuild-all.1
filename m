Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B9E38237A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Apr 2026 23:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777161166; cv=none; b=l1ydwFF66ilEaWRkV4yfjwRLT3Xh+WJ7OU/llNnz1LODHfw6GLY/Gf4nr+eZ00J89TEGByA/FwrDD1ce7jRhb7z7RQWrHUQ8EJWiYxDZ+TQoBwEOogzKGVlESl1y6xOobv584b21QLivHJAqWHTtEvEsi6/j+m/nbtDxIuGo+K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777161166; c=relaxed/simple;
	bh=/GrtXS1cbjoKDBNULjxp9zHcFFFYeLghlAexJSJmmgE=;
	h=Date:From:Cc:Subject:Message-ID; b=RD8FWq235HSsY+0th2QfgNFyu2bUM0vjp7mH6ppuzdjzoFc4D5MaChitn6EytFnPLjTizhM8jB6N7PW135XbsvSRZ2yXHHgzpX952AUDSraT/zZOWazAsii/twmQeIVXuZkEALSqd+jrFXfZwumklmgdJwD2v+velJlV9Iul+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUKp3MIt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUKp3MIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777161165; x=1808697165;
  h=date:from:cc:subject:message-id;
  bh=/GrtXS1cbjoKDBNULjxp9zHcFFFYeLghlAexJSJmmgE=;
  b=RUKp3MIt6XHh/UFaJKgSRQ2hFTe+XJjScRQcYQc45/fy+JuwxNHQ1aZC
   zf7ImDSXFEFbM0aHQosn6GPd0s/iaD78AXio/mLdBGtsUVkGFhGHY/Fze
   KoHAOObY7x8Yetn65cXZ5tqsJDv3xMcUgPzJrtsqAkOE24RubfteSCldC
   JKvJVsWDB6dwJFefsyDpLSZ2Ei4frpGOk4tce7Ost03Pny1zyZpXsKl1T
   20xyFcnl8vv5+C6mMdxKIz/H3o/ER0fjo2oxdV12yB7//zJ4juy8YdvuV
   VHpU3L/rgJU7Ex7aZqOGgl45KI09Z8fbUJ5z1PQLbsq8zOyZou7h58Vjv
   g==;
X-CSE-ConnectionGUID: p1xj8AHAQsOd0T/9WADs/Q==
X-CSE-MsgGUID: 7W0ddUylThm3KMIq+0DQpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="77121207"
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="77121207"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 16:52:45 -0700
X-CSE-ConnectionGUID: cUe9XM60SIep75ePyoRH/A==
X-CSE-MsgGUID: ew4U8cF7SNqMiV/v9MnLFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="230091913"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Apr 2026 16:52:43 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGmnh-000000007Cb-0FtU;
	Sat, 25 Apr 2026 23:52:41 +0000
Date: Sun, 26 Apr 2026 07:51:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Matt Roper <matthew.d.roper@intel.com>
Subject: xe_hw_engine.c:undefined reference to
 `xe_configfs_get_engines_allowed'
Message-ID: <202604260716.MUZmwzlS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lucas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   897d54018cc9aa97fd1529ca08a53b429d05a566
commit: 58b51df807d7394a09ddb95b47099d59465e3777 drm/xe: Allow to disable engines
date:   11 months ago
config: arm64-randconfig-r071-20260425 (https://download.01.org/0day-ci/archive/20260426/202604260716.MUZmwzlS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9007-gcf3ea02b
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604260716.MUZmwzlS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 58b51df807d7 ("drm/xe: Allow to disable engines")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604260716.MUZmwzlS-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
>> xe_hw_engine.c:(.text+0x1398): undefined reference to `xe_configfs_get_engines_allowed'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x10): undefined reference to `xe_configfs_init'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x18): undefined reference to `xe_configfs_exit'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_fini':
   xe_survivability_mode.c:(.text+0x24): undefined reference to `xe_configfs_clear_survivability_mode'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `enable_survivability_mode':
   xe_survivability_mode.c:(.text+0x1c8): undefined reference to `xe_configfs_clear_survivability_mode'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   xe_survivability_mode.c:(.text+0x494): undefined reference to `xe_configfs_get_survivability_mode'
   aarch64-linux-ld: xe_survivability_mode.c:(.text+0x4c0): undefined reference to `xe_configfs_clear_survivability_mode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
