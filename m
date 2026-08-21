Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB2E455171
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 10:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309376; cv=none; b=Hw+UW2gPGOn/Rf2m4fhucWUP6EKcce2fAP9/U8Ltu84BE08RY2MeE9YjEc90SGhcYJnGwukGpK/+Sah5Qh+sKjhufTdpzNSZVT3hlliButI27vSyOwyYmyomUeAkNz9UhRMU6uuPCtbKR8LOQhb7yY10zrgajfDHbHJHxGrFsO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309376; c=relaxed/simple;
	bh=BkVAiPshKvqy9hHuoW50/2Hlt2UxcjIZsoe3AGcIZrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dm0avYrK0wFIR41h0pdJLaAkvdwXEfrlE8qHF6Dp8uNqvJSxtZli2nyGsW0eW7qWTbNCK93kCL6wcRkIczo964sUoQ5cSW6SCCb/mapAf+YJygGKS8ccq0kUqmq11UApBGqMA/1yP5Ash0BjIH7FecPf/v1Q/w2Xc0dw69wV9vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGxnoIVM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGxnoIVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787309373; x=1818845373;
  h=date:from:to:cc:subject:message-id;
  bh=BkVAiPshKvqy9hHuoW50/2Hlt2UxcjIZsoe3AGcIZrc=;
  b=IGxnoIVMvZnglpWDqQFSHo48qMy/QDLHzehKl6m4fg7KsqQ5cKOpYdwz
   PE2oqBytApCOlV4L6qsUxssmQOA3o56YiCWUmqRqMZTAC2GDGm91AT5kV
   AxrVgRJL/i0mR6Yv5sv655ilfYOjgPe/zjohKqcx7ERlBTeUB21Z9ILct
   M9eMFWCUM+KhYmt7eMh5pjdIkk3ZxZktYTukwHrnuF6/Fbmhtk2zcCWc+
   OZyZkG0ydURAIWQwEidHMI5Nwk5fp43/+/mPCsJaUjQCdpdnucfdjXbnH
   39I+hS/GeA77T3oaY37A3Y0kZYP/+IuR4lvvEFA0AOMYVSLizgN/bv3Rs
   w==;
X-CSE-ConnectionGUID: gEYInJgIQeug3Vx0fKRSow==
X-CSE-MsgGUID: 25iuVtXJQZauIarw8PYGjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="91729962"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="91729962"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 03:49:32 -0700
X-CSE-ConnectionGUID: Kx3guiyfQGiYMGU7F9rLww==
X-CSE-MsgGUID: qvNWnfzYTn2VGeLXYC2J/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="270539116"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Aug 2026 03:49:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxMoR-00000000plt-1PQ9;
	Fri, 21 Aug 2026 10:49:27 +0000
Date: Fri, 21 Aug 2026 18:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: 
 drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23:
 sparse: sparse: cast to restricted __be32
Message-ID: <202608211811.lps93xao-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Chintan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   818bebeb63dd6bf5f4e07e145f6cdbace520a34c
commit: bf9ec461a7d1b82bbc3fe110fba9e9533879849d fbdev: omapfb: Make FB_DEVICE dependency optional
date:   6 months ago
config: arm64-randconfig-r112-20260821 (https://download.01.org/0day-ci/archive/20260821/202608211811.lps93xao-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211811.lps93xao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bf9ec461a7d1 ("fbdev: omapfb: Make FB_DEVICE dependency optional")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608211811.lps93xao-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23: sparse: sparse: cast to restricted __be32
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23: sparse: sparse: cast to restricted __be32
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23: sparse: sparse: cast to restricted __be32
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23: sparse: sparse: cast to restricted __be32
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23: sparse: sparse: cast to restricted __be32
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23: sparse: sparse: cast to restricted __be32

vim +218 drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c

f76ee892a99e68 Tomi Valkeinen 2015-12-09  210  
f76ee892a99e68 Tomi Valkeinen 2015-12-09  211  static int panel_enabled(struct panel_drv_data *ddata)
f76ee892a99e68 Tomi Valkeinen 2015-12-09  212  {
f76ee892a99e68 Tomi Valkeinen 2015-12-09  213  	u32 disp_status;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  214  	int enabled;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  215  
f76ee892a99e68 Tomi Valkeinen 2015-12-09  216  	acx565akm_read(ddata, MIPID_CMD_READ_DISP_STATUS,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  217  			(u8 *)&disp_status, 4);
f76ee892a99e68 Tomi Valkeinen 2015-12-09 @218  	disp_status = __be32_to_cpu(disp_status);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  219  	enabled = (disp_status & (1 << 17)) && (disp_status & (1 << 10));
f76ee892a99e68 Tomi Valkeinen 2015-12-09  220  	dev_dbg(&ddata->spi->dev,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  221  		"LCD panel %senabled by bootloader (status 0x%04x)\n",
f76ee892a99e68 Tomi Valkeinen 2015-12-09  222  		enabled ? "" : "not ", disp_status);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  223  	return enabled;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  224  }
f76ee892a99e68 Tomi Valkeinen 2015-12-09  225  

:::::: The code at line 218 was first introduced by commit
:::::: f76ee892a99e68b55402b8d4b8aeffcae2aff34d omapfb: copy omapdss & displays for omapfb

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ti.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
