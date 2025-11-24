Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8317A29993D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 17:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764005852; cv=none; b=PsRDhmR4II1eH7911orjXQ2IccHwS4VAORvZkit5l1G+hbXSONHd/OXFiCfHulKCHOKU+dRq/ixrmZocORQPIcvNBKMLyozc1dd8+ZWOOJ1UdiHSRj+Ilhh+LvN/gdFl+fMDoL6faFHNCnLaZ51T9mpN0mEGsX3imv14DmlA0rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764005852; c=relaxed/simple;
	bh=h6O2RDHV0nCXL6F9JcQqQk+UcjUjL1E8vRTNtzSJ/Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=THsM8PB9zspy22hloxl8eFxrSZTr+IbhSPK7Sv7fka3psAUmNW07MnK84HU8zFCNlKt2GSQ7jM8FVnNA18TyAJS8QMG7U/sU5Xs7UGT1GwBywHflE7yUshcY8/5GKNtsvGvL9/c6Aw0qLnEMIrfmJUHrQcxvRohR/baObew6c/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxIfSCGI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxIfSCGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764005850; x=1795541850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h6O2RDHV0nCXL6F9JcQqQk+UcjUjL1E8vRTNtzSJ/Rc=;
  b=DxIfSCGIR1gBVAiPMZcqfO7/kmsXE+Ef5+Ar5z4NA/xBlsX8vd8G4vv8
   RHtucg4QCNa8nEWkt3uQD3VhBOMnQsFLqVqPIh6Jmc+PgTLQ6YMzM+g+Q
   nH2giPkE4hXfNmcM/IRcjB0WeLrYLIYkH0RgGwuBHuir/uckXad11t9Kp
   FdtL5OLwgXVbW1hq8MjW/gBtCxjq/Wz26GPXNaOrJ5+6wK5zI9hbvR7cc
   NKpvIu95s1Grq6eic8nJKfg9oujoh3BfaaQNYeRyQSVQwaLrpkISph5Sv
   Kd/J+byS9Begg40B9lEgQtBWemDFLXmCMWzkg4dCEbgaZRCRRKr5Mfyqn
   A==;
X-CSE-ConnectionGUID: p/BRE8S/QwSUFwDQ9HNijA==
X-CSE-MsgGUID: 2RCy+kJIRH2nOwgHlSGiow==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66086649"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="66086649"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 09:37:30 -0800
X-CSE-ConnectionGUID: M2MJ5NT/R/yo/sgVKVrjew==
X-CSE-MsgGUID: r4cEKweDSRe8tcd4CntaTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="193187542"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Nov 2025 09:37:29 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNaVC-000000000y5-3Tgj;
	Mon, 24 Nov 2025 17:37:26 +0000
Date: Tue, 25 Nov 2025 01:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3309/3309]
 drivers/gpu/drm/loongson/lsdc_plane.c:444:7: warning: variable 'formats' is
 used uninitialized whenever switch case is taken
Message-ID: <202511250117.AjD77new-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   16b8586be5cdac465d2c81e7cdaffcc80384bfb7
commit: 80764bc784413eb604c7d472db55b1ca72d4bbc5 [3309/3309] drm/loongson: add kernel modesetting driver support for ls7a1000/ls7a2000
config: x86_64-buildonly-randconfig-001-20251124 (https://download.01.org/0day-ci/archive/20251125/202511250117.AjD77new-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250117.AjD77new-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250117.AjD77new-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/loongson/lsdc_plane.c:98:13: warning: variable 'lo32_addr_reg' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      98 |         } else if (index == 1) {
         |                    ^~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:114:33: note: uninitialized use occurs here
     114 |         writel(paddr, ldev->reg_base + lo32_addr_reg);
         |                                        ^~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:98:9: note: remove the 'if' if its condition is always true
      98 |         } else if (index == 1) {
         |                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:77:19: note: initialize the variable 'lo32_addr_reg' to silence this warning
      77 |         u32 lo32_addr_reg;
         |                          ^
         |                           = 0
   drivers/gpu/drm/loongson/lsdc_plane.c:98:13: warning: variable 'hi32_addr_reg' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      98 |         } else if (index == 1) {
         |                    ^~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:115:48: note: uninitialized use occurs here
     115 |         writel((paddr >> 32) & 0xFF, ldev->reg_base + hi32_addr_reg);
         |                                                       ^~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:98:9: note: remove the 'if' if its condition is always true
      98 |         } else if (index == 1) {
         |                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:78:19: note: initialize the variable 'hi32_addr_reg' to silence this warning
      78 |         u32 hi32_addr_reg;
         |                          ^
         |                           = 0
   drivers/gpu/drm/loongson/lsdc_plane.c:98:13: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      98 |         } else if (index == 1) {
         |                    ^~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:120:9: note: uninitialized use occurs here
     120 |         writel(val | CFG_PAGE_FLIP_BIT, ldev->reg_base + cfg_reg);
         |                ^~~
   drivers/gpu/drm/loongson/lsdc_plane.c:98:9: note: remove the 'if' if its condition is always true
      98 |         } else if (index == 1) {
         |                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:80:9: note: initialize the variable 'val' to silence this warning
      80 |         u32 val;
         |                ^
         |                 = 0
   drivers/gpu/drm/loongson/lsdc_plane.c:98:13: warning: variable 'cfg_reg' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      98 |         } else if (index == 1) {
         |                    ^~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:120:51: note: uninitialized use occurs here
     120 |         writel(val | CFG_PAGE_FLIP_BIT, ldev->reg_base + cfg_reg);
         |                                                          ^~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:98:9: note: remove the 'if' if its condition is always true
      98 |         } else if (index == 1) {
         |                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:79:13: note: initialize the variable 'cfg_reg' to silence this warning
      79 |         u32 cfg_reg;
         |                    ^
         |                     = 0
>> drivers/gpu/drm/loongson/lsdc_plane.c:444:7: warning: variable 'formats' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     444 |         case DRM_PLANE_TYPE_OVERLAY:
         |              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:451:12: note: uninitialized use occurs here
     451 |                                        formats, format_count,
         |                                        ^~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:429:20: note: initialize the variable 'formats' to silence this warning
     429 |         const u32 *formats;
         |                           ^
         |                            = NULL
   drivers/gpu/drm/loongson/lsdc_plane.c:444:7: warning: variable 'format_count' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     444 |         case DRM_PLANE_TYPE_OVERLAY:
         |              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:451:21: note: uninitialized use occurs here
     451 |                                        formats, format_count,
         |                                                 ^~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:428:27: note: initialize the variable 'format_count' to silence this warning
     428 |         unsigned int format_count;
         |                                  ^
         |                                   = 0
>> drivers/gpu/drm/loongson/lsdc_plane.c:444:7: warning: variable 'name' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
     444 |         case DRM_PLANE_TYPE_OVERLAY:
         |              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:453:18: note: uninitialized use occurs here
     453 |                                        type, name, index);
         |                                              ^~~~
   drivers/gpu/drm/loongson/lsdc_plane.c:430:18: note: initialize the variable 'name' to silence this warning
     430 |         const char *name;
         |                         ^
         |                          = NULL
   7 warnings generated.


vim +/formats +444 drivers/gpu/drm/loongson/lsdc_plane.c

   420	
   421	int lsdc_plane_init(struct lsdc_device *ldev,
   422			    struct drm_plane *plane,
   423			    enum drm_plane_type type,
   424			    unsigned int index)
   425	{
   426		struct drm_device *ddev = ldev->ddev;
   427		int zpos = lsdc_plane_get_default_zpos(type);
   428		unsigned int format_count;
   429		const u32 *formats;
   430		const char *name;
   431		int ret;
   432	
   433		switch (type) {
   434		case DRM_PLANE_TYPE_PRIMARY:
   435			formats = lsdc_primary_formats;
   436			format_count = ARRAY_SIZE(lsdc_primary_formats);
   437			name = "primary-%u";
   438			break;
   439		case DRM_PLANE_TYPE_CURSOR:
   440			formats = lsdc_cursor_formats;
   441			format_count = ARRAY_SIZE(lsdc_cursor_formats);
   442			name = "cursor-%u";
   443			break;
 > 444		case DRM_PLANE_TYPE_OVERLAY:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
