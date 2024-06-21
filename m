Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7172A8FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 05:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718947291; cv=none; b=lrqq0xLToejWft8Z6V88E67WCgkDS3Xb+n0R2TJGpqzOfRDa7c7kK0fqAZA7MSVMtA33ZzMFhBd2YNzDmp0IeAACISzkNrrfxuqc60MVqGg5q40lVUuiPEakhq8uDg+EGA6xv4CbVIqKV5lN5wMA9Jh3+f7kkJ62xr7xobcrvSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718947291; c=relaxed/simple;
	bh=XGNbnrG3mPLYGp4QcHWT6BgieKkkXJY8bncVVhyHPj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FTtiHolo7UKhENwhOtBMesmO6b0ZfrsHBQpfs6sZMJQ8GpKCvBpTqlOa9hTgpSvFFuHFxjUTUIkaAXXyb6twu6MRLpeWsdNJSylvS65+Lo7mKYIO2bBohVvVdw9qQXuXHP3qpe3t3UhP7l70xpLkDdb0mm6+W9mCudUm8wlD/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xk7+6Ybs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xk7+6Ybs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718947289; x=1750483289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XGNbnrG3mPLYGp4QcHWT6BgieKkkXJY8bncVVhyHPj4=;
  b=Xk7+6Ybs5LepBGNnwdPQHxmXKQDq+FBRRzno6AKPCsHv0OwmyqKvTMOX
   CwO4K6v00mBqVJ3oNQYcS496HXPA3S8aqiOyHvv8MFzh8jatEAamGgy1u
   sB8MkwaX0vI2L6H/ubcayMGMbFPFw35FTZ+SW+MlDH/f6FFrqvHBxKpRg
   4UuEiT2NB9SH+7FF9xhomg4OkOm9UxiwJpC/myvlWp4SkMxBCOlMkJuBg
   yLvROxAYv8mnRvW1eSRN+SfOQ6hw1BV1WwyTOy8J/sYt/Z4bjjuSoUqYm
   Ol4Q+27bd7RebdNuGtZuo9M+a7AHFSinGuKtI7IRthwhFdtC6a/zOe8My
   Q==;
X-CSE-ConnectionGUID: MMWQkCGwQLGntEGrZ5X7GQ==
X-CSE-MsgGUID: F3OxrG28SGSub+0gfdgh7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="18874426"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="18874426"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 22:21:29 -0700
X-CSE-ConnectionGUID: 95nESI63TZ+qnUft4Hm/qA==
X-CSE-MsgGUID: HWK4KPGSQWmm8QogM6LjoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="42395645"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Jun 2024 22:21:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKWiD-0008Fu-0b;
	Fri, 21 Jun 2024 05:21:25 +0000
Date: Fri, 21 Jun 2024 13:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 28/40]
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:54:45: error: cannot assign to
 non-static data member 'driver' with const-qualified type 'const struct
 drm_driver *'
Message-ID: <202406211319.JXgbToeK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   7efd94878682c61791c3ca7f047afa30cde60f2c
commit: 2a78ff0b0ab60ac2fb3cc6ea6b4895e2a7e7e769 [28/40] drm: Allow const struct drm_driver
config: i386-buildonly-randconfig-003-20240621 (https://download.01.org/0day-ci/archive/20240621/202406211319.JXgbToeK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211319.JXgbToeK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211319.JXgbToeK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:54:45: error: cannot assign to non-static data member 'driver' with const-qualified type 'const struct drm_driver *'
      54 |         adev_to_drm(adev)->driver->driver_features &= ~DRIVER_ATOMIC;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   include/drm/drm_device.h:89:27: note: non-static data member 'driver' declared const here
      89 |         const struct drm_driver *driver;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:558:6: warning: no previous prototype for function 'amdgpu_virt_update_vf2pf_work_item' [-Wmissing-prototypes]
     558 | void amdgpu_virt_update_vf2pf_work_item(struct work_struct *work)
         |      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:558:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     558 | void amdgpu_virt_update_vf2pf_work_item(struct work_struct *work)
         | ^
         | static 
   1 warning and 1 error generated.


vim +54 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c

a16f8f11c599cd pding         2017-10-24  47  
bc992ba5a3c19c Xiangliang Yu 2017-01-12  48  void amdgpu_virt_init_setting(struct amdgpu_device *adev)
bc992ba5a3c19c Xiangliang Yu 2017-01-12  49  {
06465d8ec91a88 Xiangliang Yu 2017-01-11  50  	/* enable virtual display */
02f6efb47856cd Emily Deng    2020-03-25  51  	if (adev->mode_info.num_crtc == 0)
06465d8ec91a88 Xiangliang Yu 2017-01-11  52  		adev->mode_info.num_crtc = 1;
06465d8ec91a88 Xiangliang Yu 2017-01-11  53  	adev->enable_virtual_display = true;
4a580877bdcb83 Luben Tuikov  2020-08-24 @54  	adev_to_drm(adev)->driver->driver_features &= ~DRIVER_ATOMIC;
213cacefcd5c78 Xiangliang Yu 2017-04-21  55  	adev->cg_flags = 0;
213cacefcd5c78 Xiangliang Yu 2017-04-21  56  	adev->pg_flags = 0;
bc992ba5a3c19c Xiangliang Yu 2017-01-12  57  }
bc992ba5a3c19c Xiangliang Yu 2017-01-12  58  

:::::: The code at line 54 was first introduced by commit
:::::: 4a580877bdcb837e7a3754ae20798dcfccb44e80 drm/amdgpu: Get DRM dev from adev by inline-f

:::::: TO: Luben Tuikov <luben.tuikov@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
