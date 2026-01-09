Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9083C500960
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 04:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767931264; cv=none; b=Tli1SHsR/0xZjbT+He6WYQveCML6GddGa+48uCTeCCpLOuV43cpEEmCuw8JAJsKKESi6CpkIB300Rn/Cs14dAebYWx/n9R9u8l1X3PCxtaPuTdNz8C4PjsYPSfgbXoP9HtHoeTG143pojY7iAApqCHJlzjjZIb44lEgTC1csEbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767931264; c=relaxed/simple;
	bh=saFZSJmuMiuBIWF9XZCd1sOYeBzdrHzEKEvXdyvwvxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cjUlNoky8rZVuv+Qup/4Yok2sZjdaVvXRo0iYpBTVa1e21OG5jy7v0PtsJ2t/nruiTNB3r9gMQWosAo1U1u/d5vBxyfURK/v9OQZ+jc/fkCgN13e3wGxxcsY5vF4XSFawDwGnGqFY3gXS/prSJ3SwFkYt6/j/hWjdOduAtO16is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JofIjukD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JofIjukD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767931262; x=1799467262;
  h=date:from:to:cc:subject:message-id;
  bh=saFZSJmuMiuBIWF9XZCd1sOYeBzdrHzEKEvXdyvwvxY=;
  b=JofIjukDqmiab4iSfnoqWufdDE26cSi2iKm7wysSBozI8Sd3jJdn4sxL
   0AV3A+KUyMpyX05RLYeXHG2ia7oeuKdOAKWO2E6IufGeYUhWq/41i+3+f
   DE5ZR8nakA8QEVycz2exvA0M91ajIyyF40F7B+WEy6s9B+lZa7oMCSjks
   dRSEW/WgXF8w6v8l0JFpC7nScx5bZe5YL2uFkkVXfAAPmyLI3mYR2aR+J
   cj6tVnRs4aotXlwKqBaMvl3o7Lqr33zHsJSBiD+xDntFT1Me0W8023EqW
   L1UZ1Uy2p9tDpljHpLpHmOESFwgQkLT24sHkYdIjUlQxsBpuFXHrE5XaX
   w==;
X-CSE-ConnectionGUID: 8+TQ4kPYRoixlCUPtUb/Cw==
X-CSE-MsgGUID: VWHLpM2DRJSlHzC5/PEm1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="71889677"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="71889677"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 20:01:02 -0800
X-CSE-ConnectionGUID: TY+9HRgFRmez5RV+pTjqRA==
X-CSE-MsgGUID: v+WGRbh/TpS/HjKhuLfD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="226764774"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2026 20:01:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve3gI-000000005Sq-1I2a;
	Fri, 09 Jan 2026 04:00:58 +0000
Date: Fri, 09 Jan 2026 12:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [drm-misc:for-linux-next 1/2] Warning:
 drivers/gpu/drm/drm_gpuvm.c:1836 expecting prototype for
 drm_gpuvm_bo_obtain(). Prototype was for drm_gpuvm_bo_obtain_locked() instead
Message-ID: <202601091113.0b0WuRML-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git for-linux-next
head:   ec27500c8f2b65a3be6ce39a5844d6d246d1b2b0
commit: 9bf4ca1e699c272defe9636f9812ff33a448d650 [1/2] drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260109/202601091113.0b0WuRML-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091113.0b0WuRML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091113.0b0WuRML-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gpuvm.c:1836 expecting prototype for drm_gpuvm_bo_obtain(). Prototype was for drm_gpuvm_bo_obtain_locked() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
