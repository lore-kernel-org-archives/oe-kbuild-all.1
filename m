Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD1B80B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 02:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748657605; cv=none; b=SrRsuJOutytsQ7w8/TLYZZjuB+MgrAygYlnxughtEK39VH+NhdyS4nqFhfgWvzd0NHre81dCQFAPFR+6Jm8DdIT1ySkaWaMzf6UqNHN2ySb/pdxZMF51lmk76e8FIG6mUtyVSXCvonnBlTWlYKezWM9yNNfguMyL5jhFZT7Lcc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748657605; c=relaxed/simple;
	bh=VG9szdSzjBmkASZiT8DmjpkjjIc7SfYsdCNtUEKyJNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRBJuYqcCDGbjz1dET3APrHuzyTbFq3js3BGoGxCBICvuR+aw29kOlaBxRVRLdnWLfFoshVR2ifd60tBMzsDH8Tbz9YOZBJoRiM9lfnxYv9HXvmBunagNgn1e0nkJNJS7cyFWV9Xhkj1qakFol5XQcp3HGCOkwhmyGDgevmlISs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K06sAK11; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K06sAK11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748657603; x=1780193603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VG9szdSzjBmkASZiT8DmjpkjjIc7SfYsdCNtUEKyJNw=;
  b=K06sAK11LKRFqUvKkwwBdH9V9LSChXKHq2pdQ0Gydqx/OhRLdgYl1rQt
   +Ge3l+H+vNKFgO7wKm4VcmzYfqB2GCHOKgYWt1TUhUsstjFKywicUbfu5
   FcWhAVh3DJgjNvpaRAv55JVqAkY2heOr7dzAwxZKBtMorOBw9M6wCJhvd
   KD/mZ73HYZQ1df4Qz9e+HyHY85D1na2obTRjvW0Hsnojmj2tBqGotB5Qd
   4dN+nEGEO5posrYkdVeMZbBgIF0q2Fe5kItnPD0rOEqoTa0xnmjwaEr1N
   rHPW+V67+tkTd9CE8e7qjykPhXe+KjNRAhVWqErbAPfRR8u2D0bb9pBxQ
   Q==;
X-CSE-ConnectionGUID: gPn8M6ktTyaJkYrJVzIHCA==
X-CSE-MsgGUID: etM+8agwS1qLdmwBPyWqYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50856107"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50856107"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 19:13:22 -0700
X-CSE-ConnectionGUID: y+VsDSFqTf6Iz+tPQ8st7Q==
X-CSE-MsgGUID: vGfIa7c2QzuN5+msu3FiiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144679495"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 May 2025 19:13:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLBip-000Y8W-1X;
	Sat, 31 May 2025 02:13:19 +0000
Date: Sat, 31 May 2025 10:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 49/49]
 drivers/gpu/drm/panel/panel-samsung-ld9040.c:240:12: warning: stack frame
 size (8344) exceeds limit (8192) in 'ld9040_prepare'
Message-ID: <202505311045.SxxJ1YMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   dd8fcb53983ced78cff12b5cd37d3a9c06ea0161
commit: 31b7859751f00279ccd2dc735ff3f7d276462a04 [49/49] ANDROID: Fix adding cflags for CONFIG_AUTOFDO_CLANG
config: x86_64-randconfig-161-20250531 (https://download.01.org/0day-ci/archive/20250531/202505311045.SxxJ1YMM-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311045.SxxJ1YMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505311045.SxxJ1YMM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-samsung-ld9040.c:240:12: warning: stack frame size (8344) exceeds limit (8192) in 'ld9040_prepare' [-Wframe-larger-than]
     240 | static int ld9040_prepare(struct drm_panel *panel)
         |            ^
   1 warning generated.


vim +/ld9040_prepare +240 drivers/gpu/drm/panel/panel-samsung-ld9040.c

ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  239  
099b3e8699322e drivers/gpu/drm/panel/panel-ld9040.c Ajay Kumar    2014-07-31 @240  static int ld9040_prepare(struct drm_panel *panel)
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  241  {
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  242  	struct ld9040 *ctx = panel_to_ld9040(panel);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  243  	int ret;
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  244  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  245  	ret = ld9040_power_on(ctx);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  246  	if (ret < 0)
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  247  		return ret;
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  248  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  249  	ld9040_init(ctx);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  250  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  251  	ret = ld9040_clear_error(ctx);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  252  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  253  	if (ret < 0)
8141028278c2ea drivers/gpu/drm/panel/panel-ld9040.c Ajay Kumar    2014-07-31  254  		ld9040_unprepare(panel);
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  255  
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  256  	return ret;
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  257  }
ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  258  

:::::: The code at line 240 was first introduced by commit
:::::: 099b3e8699322efb7229913d2c1651588205f182 drm/panel: ld9040: Add dummy prepare and unprepare routines

:::::: TO: Ajay Kumar <ajaykumar.rs@samsung.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
