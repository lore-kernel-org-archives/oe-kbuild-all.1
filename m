Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764BD264614
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 01:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781572989; cv=none; b=O+8QGkziO8b5udVoDsG3F6tjjCgXrZVaZmbYyC6muym1PNzjcRfw82IXVsmqhXPzuRxGUMVzDiM7Bzum05fGPKI0iP1QED9gyOaJxw7WdzgbSory8cDROB+N00Vsp65feeJr7XGvd+jwubNH0AiF6s+poMdWJA5E0RH+29CLb0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781572989; c=relaxed/simple;
	bh=BUqRUoMDJhMeJ7xrHjt44jv1eyqkv2wVMVkHVVuGz/k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U8FkgHSmUAUaVfyoD+4SS1AvLIvdkUrQKrpAh+kcgGd+SZNDQMbt76aq5s62HmLrrDhSDsHveNUcL/yP7UT2Ot0efR7YA03KqsZEvWNX4P+7Umrwk5cEMxXqUMmA01GdAUWoZy3oW4PI5x9ANyCfiuP+eX2GHM04/TLEnhK6+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biOzq2ju; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biOzq2ju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781572987; x=1813108987;
  h=date:from:to:cc:subject:message-id;
  bh=BUqRUoMDJhMeJ7xrHjt44jv1eyqkv2wVMVkHVVuGz/k=;
  b=biOzq2juVycgkUw8jkG0526Yzzvw9QBA2QHYraSp/SVo80DSrw57x4Oz
   FsmU0xQSUv/Nf/2PplHKiBkEdqg2Gt6s0tYDvOxmIJxc3X/r78DKvWhic
   ins1rf05JyRh2jEsM7UtYAdb5bJXy1d65mz4RENp2ZtUI106sTy+gxkKd
   MUBZwdt4MbvdRYiuQIcDIOB0VqrPLoZjJaCEMtm0HL3Hhw4zRa4eDB6Te
   5anUkOcN5Pgc8GZjB9Zj9K/sZbmdgi+/nr0f1IAkzZ4yAHigUDahyWtpS
   yYx3VwrWTu/0Lj+j2KHcigMDGY/ucLQUgOpPPJVVNNq0q9tSL6vLJBW7P
   w==;
X-CSE-ConnectionGUID: 5jnKJZSXQSeVCZfLWmMC5w==
X-CSE-MsgGUID: TYyy87knTxGUuKiMZ2rN4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82391895"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="82391895"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 18:23:05 -0700
X-CSE-ConnectionGUID: KDrVGoeaQRuCRYVv7yv1eA==
X-CSE-MsgGUID: xf7LQOb2Q5aFz2w+wqvdfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="285739292"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jun 2026 18:23:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZIW5-00000000Sak-0zUd;
	Tue, 16 Jun 2026 01:23:01 +0000
Date: Tue, 16 Jun 2026 09:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:761 function parameter 'af' not
 described in 'amdgpu_fence_driver_guilty_force_completion'
Message-ID: <202606160951.XRzQuMdD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alex,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   7ca55c29ec35a7ec418e16374897345db36896c2
commit: ff780f4f80323148d43198f2052c14160c8428d3 [1/1] drm/amdgpu: set an error on all fences from a bad context
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260616/202606160951.XRzQuMdD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160951.XRzQuMdD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ff780f4f8032 ("drm/amdgpu: set an error on all fences from a bad context")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606160951.XRzQuMdD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:761 function parameter 'af' not described in 'amdgpu_fence_driver_guilty_force_completion'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
