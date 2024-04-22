Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37A54CDF9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713781647; cv=none; b=QmOCFi/paw7klW1DUbHlxT2tbHzZ3JFF49PItH6lZMIrCEp4USOyS5gXm7K0QhfrPPk36ZopeFUVjNK8nXcTGnEOUvgcjLE6m7lCV17Lfog6HEGRST78O44tIuRNbrShmgcbZEaIwvq6AyOJ2ByILY1n/ImLBgO8jaEPz+MPg6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713781647; c=relaxed/simple;
	bh=74wCo7JXeMIXdS7Jn0oeIIS2In/VxzNNo7IfUX0UJhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=adghHe0Na5AdgwS6smvBgm680TnYeTKDaL8HHoiGfOwIJZgGIbQi46xjK1bgPika75ytvWTme3hbf955fvfsluPpzLHPHz7OQ0v8smrMpI14rtfv4hhgoNEMa2TSnaVy7xwm6cNfAUmM39nLaq/59FwDwQOiukNqhp0R5ec9yeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mh1xO3Hb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mh1xO3Hb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713781646; x=1745317646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=74wCo7JXeMIXdS7Jn0oeIIS2In/VxzNNo7IfUX0UJhg=;
  b=mh1xO3HbqVCNVzedsletKGkMaJZgwSlXL70+bP0ToDswa21xMMKHri0r
   ebZPS9fASF7FPbJi49kX2envJSVAT7UpG+K5ld4s6OeihkDGWz6LY1Qlb
   TehfNj0amLqmteJL/ghdmqcoPenEj7z5JyBb+50ONjj7ZzHvnRaeEVNYK
   RmouUnQAwpTFkMpLNIvV122kt9Kj3qcVnqDlJT4asR3RbLd4/yX9H/57p
   PxbhAwa6DpFKnxAJ6wPkKTSRxHYhUvPFdC9hntsmSEBRgYce+eGVPuyHd
   0uC3m/mNHGY7vSVjW6R+VSFxYhK/qgJdkzgIpEy2EqB5wXum5DQDrKE3M
   A==;
X-CSE-ConnectionGUID: Sr/13UBkQRawNtlAf6vVTw==
X-CSE-MsgGUID: TZNEw0u2TwuSVX4mSx2uZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="12251335"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="12251335"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 03:27:25 -0700
X-CSE-ConnectionGUID: jB8PErtJSfWrEG7M1aEIOQ==
X-CSE-MsgGUID: 9zSiOLYrQBGdzs8MQF1Gkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="24001514"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Apr 2024 03:27:24 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryqtM-000CUI-0g;
	Mon, 22 Apr 2024 10:27:20 +0000
Date: Mon, 22 Apr 2024 18:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-7n-69rc5 16/34] ld:
 drivers/gpu/drm/display/drm_dp_helper.o:drivers/gpu/drm/display/drm_dp_helper.c:44:
 multiple definition of `drm_debug_classes';
 drivers/gpu/drm/drm_crtc_helper.o:drivers/gpu/drm/drm_crtc_helper.c:53:
 first defined here
Message-ID: <202404221833.jKrqB8l4-lkp@intel.com>
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
config: x86_64-randconfig-011-20240422 (https://download.01.org/0day-ci/archive/20240422/202404221833.jKrqB8l4-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404221833.jKrqB8l4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404221833.jKrqB8l4-lkp@intel.com/

Note: the jimc/dd-classmap-fix-7n-69rc5 HEAD a99cf394338e133341ee5c78dcbff4ddce86c0b0 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld: drivers/gpu/drm/display/drm_dp_helper.o:drivers/gpu/drm/display/drm_dp_helper.c:44: multiple definition of `drm_debug_classes'; drivers/gpu/drm/drm_crtc_helper.o:drivers/gpu/drm/drm_crtc_helper.c:53: first defined here
>> ld: drivers/gpu/drm/display/drm_dp_helper.o:drivers/gpu/drm/display/drm_dp_helper.c:44: multiple definition of `drm_debug_classes_classnames'; drivers/gpu/drm/drm_crtc_helper.o:drivers/gpu/drm/drm_crtc_helper.c:53: first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:220: multiple definition of `drm_debug_classes'; drivers/gpu/drm/drm_crtc_helper.o:drivers/gpu/drm/drm_crtc_helper.c:53: first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:220: multiple definition of `drm_debug_classes_classnames'; drivers/gpu/drm/drm_crtc_helper.o:drivers/gpu/drm/drm_crtc_helper.c:53: first defined here
   ld: drivers/gpu/drm/i915/i915_params.o:drivers/gpu/drm/i915/i915_params.c:32: multiple definition of `drm_debug_classes'; drivers/gpu/drm/drm_crtc_helper.o:drivers/gpu/drm/drm_crtc_helper.c:53: first defined here
   ld: drivers/gpu/drm/i915/i915_params.o:drivers/gpu/drm/i915/i915_params.c:32: multiple definition of `drm_debug_classes_classnames'; drivers/gpu/drm/drm_crtc_helper.o:drivers/gpu/drm/drm_crtc_helper.c:53: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
