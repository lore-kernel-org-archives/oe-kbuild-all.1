Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD8A2F744A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 21:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768856660; cv=none; b=adj8QrhZkXjvb57KyLpKQ/pz9cO+iHMYtUaDr9AeopTm/gm1raJUIAQvbZ6jf0mAtp183ER3OEJEqo8smeQqjhmNXmKNGK78SMyWneTZBLMMOFOGLa2yG+HQVFvDMV3KSVgABnvlIymm3nulTk6WzT//npX4BKEESDybBdwOyto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768856660; c=relaxed/simple;
	bh=UulDW052lQyilBwQ5P6nFGWOvvK+Bt+cIULtReblVGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iq+4W8LNpWboVrUTrQmchhXDBAkNQxXXm1tOWAtJo6Liph6Ytj7FL/uxhoGpICUMM1FCdlX+ZI49I7JdXMQ4EVZzUTtgkR8Ldn2WszaZicee82U9HdoTe0aKZ061QdKNtkvpQmdHLEf7x+lbfuMkGjwGWW97EXcUMNWY6fSGLds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loRdUV5n; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loRdUV5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768856658; x=1800392658;
  h=date:from:to:cc:subject:message-id;
  bh=UulDW052lQyilBwQ5P6nFGWOvvK+Bt+cIULtReblVGE=;
  b=loRdUV5nHDEDT2dr/JM4J63f77AGpMM7lgdyprr9eAsOEguzqxObvYCZ
   ofBR363QGKpggoTvrtZgiWIjQdGYWOf+WBW7QkShM2rFBTHGFILAMjDHw
   tRHNjsdYnU4fUN0IaJv1lbfdO5TG/dEfWC8DGYFstnkS7tBulapn4CTea
   qQwWZzLrqgVRZTkCnVqmb2sAZrNcw+GRT1cisjI/5i04yOoP2/xRYSVYd
   roPRcVFbbXvTpj6HGNWl/i2ZCdvqm7EnX3vIrFeAlAF0o42+kcRlkmZ2T
   bN0OLOvbXjbctWP+th4CbX9r7IPsI2Ryz6URZfuzoYXsqQXMSivaqKpdo
   A==;
X-CSE-ConnectionGUID: m3tWVVq0QuSnqbuGE9Fzuw==
X-CSE-MsgGUID: kqJTAkqmR/aCqmYgEIMr2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73931116"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="73931116"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 13:04:17 -0800
X-CSE-ConnectionGUID: afitcn7QRUmkADB3QbklFA==
X-CSE-MsgGUID: EeSuZ3jrRDG/9qE7pWSJ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="210437749"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jan 2026 13:04:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhwQ1-00000000OJ5-45tS;
	Mon, 19 Jan 2026 21:04:13 +0000
Date: Tue, 20 Jan 2026 05:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>
Subject: drivers/gpu/drm/msm/dp/dp_display.c:1313:39: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202601200453.yKeQMaqi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 603fc0fc30bf69e78a7a5febdb1431bd49d87f22 drm/msm/dp: drop the msm_dp_catalog module
date:   7 months ago
config: powerpc-randconfig-r131-20260118 (https://download.01.org/0day-ci/archive/20260120/202601200453.yKeQMaqi-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200453.yKeQMaqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200453.yKeQMaqi-lkp@intel.com/

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
