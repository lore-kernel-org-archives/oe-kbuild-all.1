Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709013C3F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713780255; cv=none; b=Zx0MBP2sKXCAGD4h5ZgtBW2b9ymBhgyFLuTrkw/FpThhy215m1ychbLAinFRuB3JQqeFFUwKWTEv2uul8J+xrlT+P7VUU9W8Sj28QZPoZtneL8Rlu/WZ2FySedsF2LpBDzpxwR2IQmlznhnvI4VCx9ABPdM2zaKfQ5Fdv5PV6gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713780255; c=relaxed/simple;
	bh=H7FClDmr3ihmGZ0yE2VeH9m8ATAN7/3bwOM5PbqgGjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i/zGBtVOzq+tytKMKWxlTtK7VEOyQ5uQzWBl4jAunDinHM843mxnZLFFfr1Nri1flXsQ/DmHUpETQz5O2MBJzDeGs+N1qWAJcwHt8KP4dV7BD8b9ungOv1lQE2wwFnlGSnb2Tn4I/JfNL4SFsJTpD4qVB5NyWiJbaq0ncdp64EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXSh/BZP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXSh/BZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713780251; x=1745316251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H7FClDmr3ihmGZ0yE2VeH9m8ATAN7/3bwOM5PbqgGjs=;
  b=RXSh/BZP4rz0kVXMipLPrkglpDVed20eqLyS38rwfv8r0pklzF9NQ0g2
   w3aPQSe33RTUDM7krvXkR79LX7XpuXnO2inh9NI5ILs9SeitQ2fJfHPxt
   /RozwgEKUX77JKVfkP5tqSh0y0OBAdy6aFRA+jAzXpFLrSBVphXOH2fXS
   tfucPbwVNiza75tXoKcHvj7Vak0YXc/Tc2JNj+RDT5W6B7Cl0r5yG2sRn
   ruoMQo68+qLowkzE6tJGwQnP1av3Q2uk7aKcVguUGWm45KM/nZACrCL2S
   4bcQVuHvXD5S28zT1st/T1D/UK4ykbXCFLRFWqYJtBPWluofvq/5KaJk3
   A==;
X-CSE-ConnectionGUID: gfzWFUdISZWFTaGBW35Trg==
X-CSE-MsgGUID: FB0PRmCGQ92cK82szaG57Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9420924"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9420924"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 03:04:10 -0700
X-CSE-ConnectionGUID: I2bGFovUQOej/3ATRtcebQ==
X-CSE-MsgGUID: 0XaWzxJbQdqnOJLy2RwRkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="24038484"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2024 03:04:08 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryqWq-000CTi-33;
	Mon, 22 Apr 2024 10:04:04 +0000
Date: Mon, 22 Apr 2024 18:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-7n-69rc5 16/34] alpha-linux-ld:
 drivers/gpu/drm/display/drm_dp_helper.o:(__dyndbg_classes+0x0): multiple
 definition of `drm_debug_classes';
 drivers/gpu/drm/drm_crtc_helper.o:(__dyndbg_classes+0x0): first defined here
Message-ID: <202404221831.e86o8PAY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmap-fix-7n-69rc5
head:   a99cf394338e133341ee5c78dcbff4ddce86c0b0
commit: 3de44979ae680fe6f795f6d5bf80648d31576287 [16/34] dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240422/202404221831.e86o8PAY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404221831.e86o8PAY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404221831.e86o8PAY-lkp@intel.com/

Note: the jimc/dd-classmap-fix-7n-69rc5 HEAD a99cf394338e133341ee5c78dcbff4ddce86c0b0 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> alpha-linux-ld: drivers/gpu/drm/display/drm_dp_helper.o:(__dyndbg_classes+0x0): multiple definition of `drm_debug_classes'; drivers/gpu/drm/drm_crtc_helper.o:(__dyndbg_classes+0x0): first defined here
>> alpha-linux-ld: drivers/gpu/drm/display/drm_dp_helper.o:(.data+0x320): multiple definition of `drm_debug_classes_classnames'; drivers/gpu/drm/drm_crtc_helper.o:(.data+0xe0): first defined here
   alpha-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(__dyndbg_classes+0x0): multiple definition of `drm_debug_classes'; drivers/gpu/drm/drm_crtc_helper.o:(__dyndbg_classes+0x0): first defined here
   alpha-linux-ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(.data+0x358): multiple definition of `drm_debug_classes_classnames'; drivers/gpu/drm/drm_crtc_helper.o:(.data+0xe0): first defined here
   alpha-linux-ld: drivers/gpu/drm/nouveau/nouveau_drm.o:(__dyndbg_classes+0x0): multiple definition of `drm_debug_classes'; drivers/gpu/drm/drm_crtc_helper.o:(__dyndbg_classes+0x0): first defined here
   alpha-linux-ld: drivers/gpu/drm/nouveau/nouveau_drm.o:(.data+0x200): multiple definition of `drm_debug_classes_classnames'; drivers/gpu/drm/drm_crtc_helper.o:(.data+0xe0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
