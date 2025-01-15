Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA73801
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 00:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736899634; cv=none; b=izn5vu1sGPtxfWgIs2yupKSRueoT4o3HrmFx7HJpxpuaBZUW9KTQsNNEVR/qM5riELqnOfvcXv7IAiJuPJe6q1ixoSaTGkGftHOCEU6L3GrV/kp7Zbyky4hKdETYgwkCtYZ7dZA77QzfmXAsloYLYaPRTlePixqyvOu3U3Rb+Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736899634; c=relaxed/simple;
	bh=pgI6ItkGyJ0JANhZZ4NIijPwgDryoAuNv8Cqun0coJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JOO9SP7/a+cexB5S/nTglXs/kP/OOF4kegUzwJ2KjkUPnLPT5QERz8XassVg2HoR1o6h8xrSDlm/FvI/XGwIvj6K88pGvUDp/dTSW4MbVTKvtPkkUFZm8rtJmRqbWxX31Fla05E/rZgC8bBlEcCQQz3xhAHw8SM09qGQgeReano=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4POtmof; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4POtmof"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736899633; x=1768435633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pgI6ItkGyJ0JANhZZ4NIijPwgDryoAuNv8Cqun0coJk=;
  b=e4POtmofVomwB9N3MePkdqL3f3EdMIYA1eQsQxVM/qhVqClu1848vXTK
   Xe6H8tugQeSKvi7bFx9n473hyD3PB+JvgOt12MfRCAHA29mtWDsIGSUPt
   sF6a/q4VuER72HS5NKVtg4vDOQGHoJWaNEjewlZxDAMx1ku6L/CnY7iWy
   Y41ZSpO4sj0GFh0W50ioW972w5sgR78cDXzhzq5TmwNfHfn47fUcWo9hZ
   8yLfFli7eSKky0oWoy0GXcNnuSjzQsNJyma33wQp9tIRWpl65Ysy5ZyOV
   PRXs8Zoe26IQSpY0EabYe9ojToKcKgZ1tIpT7ZnHh18GKFR2M+yhZYnXf
   A==;
X-CSE-ConnectionGUID: fORwVo2BQFiZUyuc2njvNQ==
X-CSE-MsgGUID: OAAlHlVWSkyILjMl0WRbgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47709599"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="47709599"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 16:07:12 -0800
X-CSE-ConnectionGUID: YZYq/1wyRviMhZ2SknElhw==
X-CSE-MsgGUID: EztjXzoiQkqjG8DdM9SCrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="104803228"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jan 2025 16:07:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXqw7-000PDB-3D;
	Wed, 15 Jan 2025 00:07:08 +0000
Date: Wed, 15 Jan 2025 08:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 331/504] core.c:undefined reference to
 `ulpi_write'
Message-ID: <202501150719.uqlFsDf7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   816b29d4609d74a6a2e3290af1ef0061f2976e6c
commit: ba5e49ae789e8f4cf738103c73ca1bd9952c6e7c [331/504] usb: dwc3: Add power management support in DWC3 Xilinx driver
config: i386-buildonly-randconfig-003-20250115 (https://download.01.org/0day-ci/archive/20250115/202501150719.uqlFsDf7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150719.uqlFsDf7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150719.uqlFsDf7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/dwc3/core.o: in function `dwc3_suspend_common.constprop.0':
>> core.c:(.text+0x29d5): undefined reference to `ulpi_write'
   ld: drivers/usb/dwc3/core.o: in function `dwc3_runtime_resume':
   core.c:(.text+0x3425): undefined reference to `ulpi_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
