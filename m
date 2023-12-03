Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ED11C0F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMbpaYkw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585177; x=1733121177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PEq2Zb/f6VMuf67XapbzdgqYFarJil0jEV/lfu33IgM=;
  b=WMbpaYkwij6FSFmzSZg3kGFEgzkJ34Ye5BJoKG7jmMiw2Dt1rJxuh8yt
   SmT52aWvwWXdCam+WbAf/xUjJI20qkEJtOsmw/5L56zmNfF4r0NPkfusT
   xUD3ChsPRymPzhdZwFG6V/XiO2XOuqlLwhqax/W6lML6qpxZ9f152/cdj
   PAgX/LXtH1q1tcNNu8m6rOzaJKTrL2YrzorUecbz5HxG1fHb9+AJYr0mr
   WlIKQZziSbr8o2TWRdloje/vPgi9W8a/EDv4moyPSunec3wnws6PiFf+C
   /GasLYWTmi4xXVOKCtnopHcWj6NwCjt7Ix21dp1XGMX+tgwJg0tVmvoEH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180422"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180422"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="914081652"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="914081652"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 22:32:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006MB-2w;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>
Subject: drivers/gpu/drm/nouveau/include/nvkm/core/layout.h:2
 nvkm_device_ctor() warn: inconsistent indenting
Message-ID: <202312030532.hosaZ1px-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 727fd72f2402afe7cc320844b0aef165f7eb544e drm/nouveau/intr: add shared interrupt plumbing between pci/tegra
date:   1 year, 1 month ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231203/202312030532.hosaZ1px-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030532.hosaZ1px-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312030532.hosaZ1px-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/include/nvkm/core/layout.h:2 nvkm_device_ctor() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/nouveau/nvkm/engine/device/base.c:3203 nvkm_device_ctor() warn: Function too hairy.  No more merges.

vim +2 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h

9b70cd54a13e62 Ben Skeggs 2020-12-04  @2  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_PCI     , struct nvkm_pci     ,      pci)
e07f50d3558a83 Ben Skeggs 2020-12-04   3  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_VBIOS   , struct nvkm_bios    ,     bios)
4a34fd0e88d8e1 Ben Skeggs 2020-12-04   4  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_DEVINIT , struct nvkm_devinit ,  devinit)
601c2a06d2a6e1 Ben Skeggs 2020-12-04   5  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_TOP     , struct nvkm_top     ,      top)
26fbb4c8c7c3ee Ben Skeggs 2021-01-16   6  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_PRIVRING, struct nvkm_subdev  , privring)
01055c01ba435c Ben Skeggs 2020-12-04   7  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_GPIO    , struct nvkm_gpio    ,     gpio)
c6ce0861fe71fe Ben Skeggs 2020-12-04   8  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_I2C     , struct nvkm_i2c     ,      i2c)
8d056d9987e3fb Ben Skeggs 2020-12-04   9  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_FUSE    , struct nvkm_fuse    ,     fuse)
0a7bff10aed623 Ben Skeggs 2020-12-04  10  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_MXM     , struct nvkm_subdev  ,      mxm)
1fc2fddfbc8c69 Ben Skeggs 2020-12-04  11  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_MC      , struct nvkm_mc      ,       mc)
d37766e560c9a8 Ben Skeggs 2020-12-04  12  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_BUS     , struct nvkm_bus     ,      bus)
9aad54d5c7ae9c Ben Skeggs 2020-12-04  13  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_TIMER   , struct nvkm_timer   ,    timer)
d9691a2245dbad Ben Skeggs 2020-12-04  14  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_INSTMEM , struct nvkm_instmem ,     imem)
b7a9369ae6f2da Ben Skeggs 2020-12-04  15  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_FB      , struct nvkm_fb      ,       fb)
0afc1c4caa001e Ben Skeggs 2020-12-04  16  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_LTC     , struct nvkm_ltc     ,      ltc)
6dd123ba8a8be7 Ben Skeggs 2020-12-04  17  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_MMU     , struct nvkm_mmu     ,      mmu)
917b24a3c79bde Ben Skeggs 2020-12-04  18  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_BAR     , struct nvkm_bar     ,      bar)
77689f1b6b0a99 Ben Skeggs 2020-12-04  19  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_FAULT   , struct nvkm_fault   ,    fault)
c288b4de94a874 Ben Skeggs 2020-12-02  20  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_ACR     , struct nvkm_acr     ,      acr)
e4b15b4ca08198 Ben Skeggs 2020-12-04  21  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_PMU     , struct nvkm_pmu     ,      pmu)
d07be5d788624a Ben Skeggs 2020-12-04  22  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_VOLT    , struct nvkm_volt    ,     volt)
4dea1a9609d156 Ben Skeggs 2020-12-04  23  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_ICCSENSE, struct nvkm_iccsense, iccsense)
0aec69c76ec9e2 Ben Skeggs 2020-12-04  24  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_THERM   , struct nvkm_therm   ,    therm)
98fd7f83665a92 Ben Skeggs 2020-12-04  25  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_CLK     , struct nvkm_clk     ,      clk)
b240b21261c2a4 Ben Skeggs 2020-12-04  26  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_GSP     , struct nvkm_gsp     ,      gsp)
18618fc6d1e359 Ben Skeggs 2021-02-08  27  NVKM_LAYOUT_INST(NVKM_SUBDEV_IOCTRL  , struct nvkm_subdev  ,   ioctrl, 3)
f6df392dddbb9e Ben Skeggs 2021-02-08  28  NVKM_LAYOUT_ONCE(NVKM_SUBDEV_FLA     , struct nvkm_subdev  ,      fla)
fcc08a7c0ded8c Ben Skeggs 2021-02-04  29  

:::::: The code at line 2 was first introduced by commit
:::::: 9b70cd54a13e626ae830ab2972c1dadcd6347fb2 drm/nouveau/pci: switch to instanced constructor

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
