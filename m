Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A560337F8B2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365336; cv=none; b=L4PRUEocZ33WwjIsPIMfr8OA01B21DuA5V2s3+mNSRhjd7GShhYhyQo5cCz7vfK2GltP4FRPc3DnFGY9ISW1dp+STeMwwTYMVR+05Gjly0gRMYRMkOkL2YH03htJOVVW2sQbjfO0+IvrlUZc9HovBL/Wp1s+MXZBG1Bp/rhF+Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365336; c=relaxed/simple;
	bh=ArBZSZ/Tjh6NyqCBQe7ZR8BbAXP3qlCQLfDWW7Vaa2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TtE6Q/7LXzDtZLt+zmtVXMAQlU4MKMxE6jn7PlgQkTok/5vg1OzVR1z2FW0Ov/9jEoGU2BOP7i8BOy9MqT/vBbgYeCYT4i8m38Ncz9BUOZo4uURl5jl2FXwPJKk7kdkzQAz82XB58gYERQgN4VbWhg3u5aJPT9dSdXTBqnR47G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4E+jQ4u; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4E+jQ4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784365334; x=1815901334;
  h=date:from:to:cc:subject:message-id;
  bh=ArBZSZ/Tjh6NyqCBQe7ZR8BbAXP3qlCQLfDWW7Vaa2U=;
  b=n4E+jQ4uz0N/sDuwUbezMy1KR/AJtbB41ArQXt7bGY+x8OJBwKy2uCzT
   1Gy28t+XzJQmtnT0rwqaFb7jggLadJX2sVTSAsYIfXRBLJbzI+UT0e6DM
   v/WKBj5HA3HExOLNBON8KQR9wWu/n/bkQm4hAYlILzqcaydzfOw5GHOEW
   y72E+27db+8Go++lMhlXfzzH1Y+VxBBcYcEdg6ZLwe4p72d3fqdV97lFv
   D+dkkGjCFjR9uRcIGQ6SmOtTOFwCwY4LLfcx8V0KM9OqyVjQMg78HB5aS
   J+ZgaJ4pkWM4hdEMzaCo7uHfh7aibG5ZqBYjs/mberpDOiEtKR+GEMTBG
   w==;
X-CSE-ConnectionGUID: m6zQPvq5QoqDOPh1AvYXEw==
X-CSE-MsgGUID: kdCaVd0GS822g6tKVjMY2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="87563128"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="87563128"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 02:02:12 -0700
X-CSE-ConnectionGUID: iEP4XSQ3RzWQ68OG4+1Pdg==
X-CSE-MsgGUID: CgJFN5McRSK+LD8vMG3dSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="256423924"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Jul 2026 02:02:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl0vw-00000000Tbh-0svg;
	Sat, 18 Jul 2026 09:02:08 +0000
Date: Sat, 18 Jul 2026 16:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>
Subject: drivers/gpu/drm/msm/dp/dp_display.c:1313:39: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202607181635.C5jkxTEO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 603fc0fc30bf69e78a7a5febdb1431bd49d87f22 drm/msm/dp: drop the msm_dp_catalog module
date:   1 year ago
config: arm64-randconfig-r122-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181635.C5jkxTEO-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181635.C5jkxTEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 603fc0fc30bf ("drm/msm/dp: drop the msm_dp_catalog module")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181635.C5jkxTEO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/dp/dp_display.c:1313:39: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/msm/dp/dp_display.c:1313:39: sparse:    void [noderef] __iomem *
   drivers/gpu/drm/msm/dp/dp_display.c:1313:39: sparse:    void *

vim +1313 drivers/gpu/drm/msm/dp/dp_display.c

  1302	
  1303	static int msm_dp_display_get_io(struct msm_dp_display_private *display)
  1304	{
  1305		struct platform_device *pdev = display->msm_dp_display.pdev;
  1306	
  1307		display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
  1308		if (IS_ERR(display->ahb_base))
  1309			return PTR_ERR(display->ahb_base);
  1310	
  1311		display->aux_base = msm_dp_ioremap(pdev, 1, &display->aux_len);
  1312		if (IS_ERR(display->aux_base)) {
> 1313			if (display->aux_base != ERR_PTR(-EINVAL)) {
  1314				DRM_ERROR("unable to remap aux region: %pe\n", display->aux_base);
  1315				return PTR_ERR(display->aux_base);
  1316			}
  1317	
  1318			/*
  1319			 * The initial binding had a single reg, but in order to
  1320			 * support variation in the sub-region sizes this was split.
  1321			 * msm_dp_ioremap() will fail with -EINVAL here if only a single
  1322			 * reg is specified, so fill in the sub-region offsets and
  1323			 * lengths based on this single region.
  1324			 */
  1325			if (display->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
  1326				DRM_ERROR("legacy memory region not large enough\n");
  1327				return -EINVAL;
  1328			}
  1329	
  1330			display->ahb_len = DP_DEFAULT_AHB_SIZE;
  1331			display->aux_base = display->ahb_base + DP_DEFAULT_AUX_OFFSET;
  1332			display->aux_len = DP_DEFAULT_AUX_SIZE;
  1333			display->link_base = display->ahb_base + DP_DEFAULT_LINK_OFFSET;
  1334			display->link_len = DP_DEFAULT_LINK_SIZE;
  1335			display->p0_base = display->ahb_base + DP_DEFAULT_P0_OFFSET;
  1336			display->p0_len = DP_DEFAULT_P0_SIZE;
  1337	
  1338			return 0;
  1339		}
  1340	
  1341		display->link_base = msm_dp_ioremap(pdev, 2, &display->link_len);
  1342		if (IS_ERR(display->link_base)) {
  1343			DRM_ERROR("unable to remap link region: %pe\n", display->link_base);
  1344			return PTR_ERR(display->link_base);
  1345		}
  1346	
  1347		display->p0_base = msm_dp_ioremap(pdev, 3, &display->p0_len);
  1348		if (IS_ERR(display->p0_base)) {
  1349			DRM_ERROR("unable to remap p0 region: %pe\n", display->p0_base);
  1350			return PTR_ERR(display->p0_base);
  1351		}
  1352	
  1353		return 0;
  1354	}
  1355	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
