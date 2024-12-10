Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC7A1D7E4C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 03:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733802940; cv=none; b=YAiLhNjD5Lc77yXa1F5JimWw96ASPSJ0sJbN7jhziO+IIapQRmpe+Z7bn8HAMUJYFIolIv/hbdmsFuN5dk+G0+pSdL3wIdOYI0iinZB71r12WoLa38YrpYUrzzM36mMS6ybalcb7ic7csLLx0crUNB8AdS2SOI2kjxrxgmCwMq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733802940; c=relaxed/simple;
	bh=HmBDFa+DnXRx/i3YBIV+hGHs8GxySCy7St1ZP+4dFNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bVzTjBdRRQ4SVTZz6a+eFnImhuDY+WO9h+6Q5hKGAa0qt80a5S7ZNJMV+aJwrGcsLQBM0C21DHw6s6KrAbWlG5WiYWFuitxcVwGRiSLdoCGOVYE6Jk4fmdimsqgC0neo7f5v50sHAh6Yvzxkm1TsJZnsywGns9LDnlClXi2ZtDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpHBPUo9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpHBPUo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733802939; x=1765338939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HmBDFa+DnXRx/i3YBIV+hGHs8GxySCy7St1ZP+4dFNc=;
  b=hpHBPUo9iySXsei9i7cDQpcFN8u6jfXaYSF2CiBzMAqcEbt3VsHNXfNO
   XNCaT5bqcyksT70iFqMkHWa8hpfjBRUaeHTOZ1I+Ch4ZTrZKgy3d2/Ghs
   4ToqjCR7os4+/d+lfhhwZ78d2JnBA5bFuTC41ThnkRkk4cSaydBy/RsTO
   bt38PY/FvOazSYe863iySoVlC0ACFcntDt8TJB0vKt33jHRQ49v9Q+J8v
   946D9DSEXDLMqhLYJNO3po7jpTwi3y68SNpkjPO1mxJgbr18q2j4INPiU
   1kDgZY8oYi7vFarv6KAEndGdj51hgjUyleEVdAysIJdVgrabnFbcAy1qL
   g==;
X-CSE-ConnectionGUID: OSc60glJRieVMc49Xb4lNw==
X-CSE-MsgGUID: F4ET5Fx7TtywVvvXzMDUIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="21714109"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="21714109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 19:55:38 -0800
X-CSE-ConnectionGUID: w49r98lLTku7ARnRCRlZIg==
X-CSE-MsgGUID: RQePnzKcSV6cHKLOA3MM5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="95344035"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Dec 2024 19:55:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKrLS-00054z-0V;
	Tue, 10 Dec 2024 03:55:34 +0000
Date: Tue, 10 Dec 2024 11:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: ld.lld: error: undefined symbol: drm_fb_helper_alloc_info
Message-ID: <202412101149.8nmtqw6k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7cb1b466315004af98f6ba6c2546bb713ca3c237
commit: dadd28d4142f9ad39eefb7b45ee7518bd4d2459c drm/client: Add client-lib module
date:   8 weeks ago
config: i386-randconfig-051-20241210 (https://download.01.org/0day-ci/archive/20241210/202412101149.8nmtqw6k-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101149.8nmtqw6k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101149.8nmtqw6k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_fb_helper_alloc_info
   >>> referenced by drm_fbdev_shmem.c:171 (drivers/gpu/drm/drm_fbdev_shmem.c:171)
   >>>               drivers/gpu/drm/drm_fbdev_shmem.o:(drm_fbdev_shmem_driver_fbdev_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_fb_helper_fill_info
   >>> referenced by drm_fbdev_shmem.c:177 (drivers/gpu/drm/drm_fbdev_shmem.c:177)
   >>>               drivers/gpu/drm/drm_fbdev_shmem.o:(drm_fbdev_shmem_driver_fbdev_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_fb_helper_set_par
   >>> referenced by drm_fbdev_shmem.c
   >>>               drivers/gpu/drm/drm_fbdev_shmem.o:(drm_fbdev_shmem_fb_ops) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_fb_helper_setcmap
   >>> referenced by drm_fbdev_shmem.c
   >>>               drivers/gpu/drm/drm_fbdev_shmem.o:(drm_fbdev_shmem_fb_ops) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_fb_helper_blank
   >>> referenced by drm_fbdev_shmem.c
   >>>               drivers/gpu/drm/drm_fbdev_shmem.o:(drm_fbdev_shmem_fb_ops) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_fb_helper_pan_display
   >>> referenced by drm_fbdev_shmem.c
   >>>               drivers/gpu/drm/drm_fbdev_shmem.o:(drm_fbdev_shmem_fb_ops) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_fb_helper_ioctl
   >>> referenced by drm_fbdev_shmem.c
   >>>               drivers/gpu/drm/drm_fbdev_shmem.o:(drm_fbdev_shmem_fb_ops) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_fb_helper_debug_enter
   >>> referenced by drm_fbdev_shmem.c
   >>>               drivers/gpu/drm/drm_fbdev_shmem.o:(drm_fbdev_shmem_fb_ops) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_fb_helper_debug_leave
   >>> referenced by drm_fbdev_shmem.c
   >>>               drivers/gpu/drm/drm_fbdev_shmem.o:(drm_fbdev_shmem_fb_ops) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_fb_helper_deferred_io
   >>> referenced by drm_fbdev_shmem.c:192 (drivers/gpu/drm/drm_fbdev_shmem.c:192)
   >>>               drivers/gpu/drm/drm_fbdev_shmem.o:(drm_fbdev_shmem_driver_fbdev_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_fb_helper_release_info
   >>> referenced by drm_fbdev_shmem.c:202 (drivers/gpu/drm/drm_fbdev_shmem.c:202)
   >>>               drivers/gpu/drm/drm_fbdev_shmem.o:(drm_fbdev_shmem_driver_fbdev_probe) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
