Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188D3CEBB7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 11:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786189346; cv=none; b=GPWRyMO/YZC+Lrma1K/680ok4BZIYESFewXSpfiigG5ADCeAhNGS4qM5gOfHxzbErlZku08TNGgcsmo/N2huUnZivYvSpQ7dhC3tM1wLkzBHtIkes8IiCgiD80MXk9Dr5s1L4Lqc98CD6OR/HsaCKOd+L7Wv9YyGGXcDCMqDzdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786189346; c=relaxed/simple;
	bh=BYAEH2NxZufKC/XgzKu/sEgoHojwt2oPPMJRamI8xoc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qaliunAXadAaN25Oq3wa+E6qPLplL9werjmaNzWQGIMWiQ9a4l3BeyHzwGU/jY+H3bzggV9ZxVEvA0heBOzKiE2L04h8ti3EZWSbhB9P+E+/eT/bWpk2sU6hSekCIJxM0ugu9hCbjmaBA53xnwREaom5bfDXIWk0hG5td8xloBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ixijc5I2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ixijc5I2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786189344; x=1817725344;
  h=date:from:to:cc:subject:message-id;
  bh=BYAEH2NxZufKC/XgzKu/sEgoHojwt2oPPMJRamI8xoc=;
  b=Ixijc5I259Kl/exiM3Jus+E2IoYolz4Td1AR/M+R4fiyGrbdojJVp5g2
   yluCXpnmUokbBerzCyEzwHKSRvTIVwY8DR6J/jP21t5nXJqhNKjHW9rEV
   jaavlriahjRIsSL+6E1jwN4Hn1wyofD9aSpf7QwS99lCcmQRNIcsqlKKU
   1HEDscqSOkAwoavx5lvMnDcUbP7ZKmMq8RHQ2E+fDLVj1pYWWTtk52rh4
   3qi4lUYSdKujEPulafh9cnSnIudyvarCsB1rud6wTG5AEprWWGWEQxRfF
   tgz6hhz/VAu2W459khbu/T+JIjTfWPCdsybZm4M/cEhGcYMRX11lPi+5t
   w==;
X-CSE-ConnectionGUID: W29iQER9Q0qVdlTRZ7W/QA==
X-CSE-MsgGUID: LS1RMIZlRIasdyCVTFjymw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="104312173"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="104312173"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 04:42:24 -0700
X-CSE-ConnectionGUID: 8QnjMoP8RkK+zwNHilamew==
X-CSE-MsgGUID: lzpk+5s1TN+zHHRZjxl5fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="300835222"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Aug 2026 04:42:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsfRT-00000000K7Z-2qd2;
	Sat, 08 Aug 2026 11:42:19 +0000
Date: Sat, 08 Aug 2026 19:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gaghik Khachatrian <gaghik.khachatrian@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Clayton King <clayton.king@amd.com>, Roman Li <roman.li@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:186
 dml_round() warn: inconsistent indenting
Message-ID: <202608081925.SFVh43en-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: b35601c5432a52c5a889a8bf505bbe2540e13254 drm/amd/display: Fix unused parameters warnings in dml2_0
date:   4 months ago
config: x86_64-randconfig-r073-20260808 (https://download.01.org/0day-ci/archive/20260808/202608081925.SFVh43en-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b35601c5432a ("drm/amd/display: Fix unused parameters warnings in dml2_0")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608081925.SFVh43en-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:186 dml_round() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:118 dml_floor() warn: if statement not indented
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:152 dml_max() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:747 dml_get_num_active_planes() warn: if statement not indented

vim +186 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c

7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  178  
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  179  dml_float_t dml_round(dml_float_t val, dml_bool_t bankers_rounding)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  180  {
b35601c5432a52 drivers/gpu/drm/amd/display/dc/dml2_0/display_mode_util.c Gaghik Khachatrian 2026-03-07  181  	(void)bankers_rounding;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  182  //	if (bankers_rounding)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  183  //			return (dml_float_t) lrint(val);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  184  //	else {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  185  //		return round(val);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28 @186  		double round_pt = 0.5;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  187  		double ceil = dml_ceil(val, 1);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  188  		double floor = dml_floor(val, 1);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  189  
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  190  		if (val - floor >= round_pt)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  191  			return ceil;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  192  		else
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  193  			return floor;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  194  //	}
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  195  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c   Qingqing Zhuo      2023-07-28  196  

:::::: The code at line 186 was first introduced by commit
:::::: 7966f319c66d9468623c6a6a017ecbc0dd79be75 drm/amd/display: Introduce DML2

:::::: TO: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
