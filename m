Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57503612E3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629116; cv=none; b=Zu3RovSp2WgZiyTYevoBx9UXfHJyYOHY9UF12S6qqTcBZRfJ1codN+X7NxxC/yLhs57upMJo3r7t5Mb8Kk4ohLiA3KnT5J1ds7VveHV+QfTirDODX7mNlNC3Q4nMYsw6zHAWo6xUfryTe9NasmB/ZuDne8E5ApzZHLEvnDRSbdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629116; c=relaxed/simple;
	bh=laEMyCEy7KAUGcNA6QqlAKlojDZ6WYDtI5pJdzqsmsQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XAdbaFrBcHgx5H67rr2I9mFZTYELp/IXFDoUEup9iZ5Hy2IjbipvqxSvAo4RF1fbOqKpEdwSBue1GgqUjLYRwE6qYJm+stNKP19RcTrjIhJf9HkiJ8aCO9ZRQLkhIEr/1MmcOkYTYi45FSs0JAJBmkrnh/HGFkGa4UTaYyAC304=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHy9zAS8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHy9zAS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777629115; x=1809165115;
  h=date:from:to:cc:subject:message-id;
  bh=laEMyCEy7KAUGcNA6QqlAKlojDZ6WYDtI5pJdzqsmsQ=;
  b=RHy9zAS8y0R6JgFwrMH0dHBErQFBb32ugKV6YW4sIMCPLYq+KYUJf4I6
   GBNUFE9qkNIVBMFbWeIKtLxtK8xATYbDIuwyOypof4sCVi/7R8qfX41Xv
   07PBdfvLc15eyIXyZdXT+j1JQcM2NS76THbvPxmZphhcuuH2lNWSSsC38
   l6z84K939UYDbv5jtSVJfj+3bu4dReb8GFIuA45YaBqlAnjV0mbtHEAkr
   tdIRCjY9Th2Y4KtYg7gvUIZ1JO3IXs9qgFj6oa8xkg153+DCR75/91pzk
   IefluM8JrAJgPZdjMWyqCpy52G7f5DpjMHZ0g7ja+faq8BT8fRm6MPjjw
   g==;
X-CSE-ConnectionGUID: qlBO1t7AT3qmaAFDCIkt3A==
X-CSE-MsgGUID: n8eUI/h2QXeNlQ4E+DTImA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89688210"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="89688210"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 02:51:55 -0700
X-CSE-ConnectionGUID: Xp7xHzhRRqWey1M2Zh9X7Q==
X-CSE-MsgGUID: ADIGaKRWRImfrz0ZzWO7Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="258177542"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 May 2026 02:51:52 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIkXF-000000000QT-2qN9;
	Fri, 01 May 2026 09:51:49 +0000
Date: Fri, 01 May 2026 17:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: Gaghik Khachatrian <gaghik.khachatrian@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 Clayton King <clayton.king@amd.com>, Roman Li <roman.li@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:186
 dml_round() warn: inconsistent indenting
Message-ID: <202605011731.M1fqKbGr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26fd6bff2c050196005312d1d306889220952a99
commit: b35601c5432a52c5a889a8bf505bbe2540e13254 drm/amd/display: Fix unused parameters warnings in dml2_0
date:   2 weeks ago
config: i386-randconfig-141-20260426 (https://download.01.org/0day-ci/archive/20260501/202605011731.M1fqKbGr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b35601c5432a ("drm/amd/display: Fix unused parameters warnings in dml2_0")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011731.M1fqKbGr-lkp@intel.com/

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
