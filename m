Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A621E2F532B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 21:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750196716; cv=none; b=WexT/pZO0K15In+ZsXVi2IPNEHrXZORPGoVMDtnfSHR3VAxquoLNsrKwq5gtHv7wq+Cwg2ohK9X7ABIY1FH2LuvVAeHCVKpfgv1F2VLN3KCKv5tD9QkzqWxyllaMuhyIwFRoxA/uOK32Wqb+rdabIspKKmpb5J/1RSuDPLqkhQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750196716; c=relaxed/simple;
	bh=JOjyMDROMXjTh2bFrHCfo029QM0Yhd1KvW0dt+BKhB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m2mMpSm3JY1o/CAueRuJro89EMurbM8NBG2bZ7lw1TQCCdg/+PP83z/SRRLmbW/OaiyKxMB0gKOIpm0LnYQWlTl8KRHrWibpH7QN+QC0fnpSX/3f1lEOCY/db4FtgO7glbPRIvH+kPShPezZHziFi+ilu1mLi3LiUAsdTpZq1uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZTaivZ/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZTaivZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750196714; x=1781732714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JOjyMDROMXjTh2bFrHCfo029QM0Yhd1KvW0dt+BKhB4=;
  b=SZTaivZ/j7O9CRLardkkb9H6Kwxzv0UdRveMGBkTds0i9wQcnsVqhp0y
   SJRcTsPkfbCqcP3RzXeFM62D9ks8hCyfzfnhPISyyOFTyIebQmGZHjA5j
   PfywTU2qEEZaCM3R9da5JAoyk93E5a7UhonqQkDuctvkDsOp3A41RunQX
   OcBmfy4qyMPoN3YEyRAVBFszbkkHXFJAc6i5YF3JJAJ5SaWm2Qu/G3YaJ
   j5NujgemibPotr2XVY0TYRQin/TE7MIh4rIsVfHU3862PgdJGGsKSI0HS
   WCfE5fSy21RqhkoFC3IzA1TRrSqU16Jm9teMO87eowwUbgLJYdt3+68MZ
   g==;
X-CSE-ConnectionGUID: GIJoRsX2QgSKJ8GDLgCr4A==
X-CSE-MsgGUID: 2dSw7FrATAGrAzHsiBZiRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52373316"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52373316"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 14:45:14 -0700
X-CSE-ConnectionGUID: YRTKKsayTmSyBtGtwC+7pw==
X-CSE-MsgGUID: V1ISyq33TZauMWo48Bs3JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="154317018"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jun 2025 14:45:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRe7C-000J0E-2G;
	Tue, 17 Jun 2025 21:45:10 +0000
Date: Wed, 18 Jun 2025 05:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>
Subject: [linux-next:master 2264/3035]
 drivers/gpu/drm/msm/dp/dp_display.c:1313:39: sparse: sparse: incompatible
 types in comparison expression (different address spaces):
Message-ID: <202506180552.2clSQiIK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4325743c7e209ae7845293679a4de94b969f2bef
commit: d7e3bee925bd7949472058f753a917a9274ac3c4 [2264/3035] drm/msm/dp: drop the msm_dp_catalog module
config: powerpc-randconfig-r111-20250617 (https://download.01.org/0day-ci/archive/20250618/202506180552.2clSQiIK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250618/202506180552.2clSQiIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180552.2clSQiIK-lkp@intel.com/

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
