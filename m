Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D31842B733
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 19:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781205158; cv=none; b=DQ3BaEGxAJ3flBfByhlka7gsCLV+pLkxLvOLxpOA3IoLYdwzcDrOD4Ldt5LrQhy72rUUT1dbnSKzupbI29LwmiTrUR6jWJT8FnBPRql7TjBZKQrcTSgkZ+wu9CA7hLvI/rH3LRrzVhEfvFxLscr9mMxz+HzJ33PH1EOELRJCrLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781205158; c=relaxed/simple;
	bh=Hpj1UNU2SWt+ZBnxLY0kJUKxtMJ3rBhxiO7bEJb6Wuo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BKUeAlhRqZcdx6HJqvSGiVx3wghBdd2/FLYS+KBL6ex02w1LMzMxjWTgMjn1R7R+KTi0oG4lPMZzt+LYw0zKDmHJLmL3/FWl60ib5Ckq2HR86oAKY9UUnCuguCltQkvdEk/7+bCOb5S3GEz2/KmDuvNtxHlL8l1hrDQo6pOPYyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9LlZPf3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9LlZPf3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781205157; x=1812741157;
  h=date:from:to:cc:subject:message-id;
  bh=Hpj1UNU2SWt+ZBnxLY0kJUKxtMJ3rBhxiO7bEJb6Wuo=;
  b=M9LlZPf3/30k3TZ33jffDrrX9OGgKnG+lHpG9sV6SKWA60G83+qpHcSa
   lOSy2mGD2/dQjxvALGYPN6Z+6XfGH7cB18B5gJuQprJjSzYxBtdgbUYUX
   YcoEfY5bt0Lrpn/7UNoyWg8wxZHAzOhnZ7MJqmP901up8spY05iwCqLah
   cy+ahWI2zLw5I6g/+RwbQ87KmhSDz8eOb5s6CsYf8MzAxvRYYHvTP4kRT
   2zxqHExLuv/zpeZ9Wq6ukHNLlnJlesD2FaJqEsvCwgK6/1RqkcjWamdSC
   L3ioYXnl6RWhvZ+JuKgCftSo444rrfkz+ef4LAPoYLu2xzC94Y1yU8YxC
   A==;
X-CSE-ConnectionGUID: LX2S/nyUSdClFm4EiYAHOw==
X-CSE-MsgGUID: LNvDtMYVT/GcaDFVCJu92g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99608839"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="99608839"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:12:35 -0700
X-CSE-ConnectionGUID: onmw27m1TEKVxMY0zQAXNQ==
X-CSE-MsgGUID: hjmSEL6PR/qhQh/rHWlviw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="250862683"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 12:12:33 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXkpK-00000000Njq-246C;
	Thu, 11 Jun 2026 19:12:30 +0000
Date: Fri, 12 Jun 2026 03:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>
Subject: drivers/gpu/drm/msm/dp/dp_display.c:1313:39: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202606120248.njRlf8uE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 603fc0fc30bf69e78a7a5febdb1431bd49d87f22 drm/msm/dp: drop the msm_dp_catalog module
date:   11 months ago
config: riscv-randconfig-r121-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120248.njRlf8uE-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120248.njRlf8uE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 603fc0fc30bf ("drm/msm/dp: drop the msm_dp_catalog module")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120248.njRlf8uE-lkp@intel.com/

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
