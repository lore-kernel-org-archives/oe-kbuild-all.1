Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F8622CBC6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 08:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765614560; cv=none; b=ZSWV7Ps/VI4xBWwV5b3DvIrthPNqoKqPsCWvoeBcRcbqauiQWmUqhiLwCr9/ZuSS8Mcw1PiiNueemnW/aZShsTgerttvAmsAqa1m+taz1M10iEPxDnFpVcR8ZOcWX1G69MNeYyisKGnaP6NZjZTW/9D4U4T2WQTkUKrkqphG5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765614560; c=relaxed/simple;
	bh=42IHy61Iq3jPMPjeDlldntNHqZiFzo7B0dHugOC8r28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fA/olGtJI42Z+0FucqxTpTLS0sjBNUDDC7sne9cmrDusfH5RM01YG34m61iEUnda0j6OiNiwKcqtLqTB55sLRrVcHZPtfrpks4aMRobCrTbn8Ty9ZNtm5qkY8SFBLxoV3LlzFrrYtmP6pmcxeXcyU2pf0Fkiw0TtGIHnMV4HkSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQyBbSEV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQyBbSEV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765614560; x=1797150560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=42IHy61Iq3jPMPjeDlldntNHqZiFzo7B0dHugOC8r28=;
  b=TQyBbSEVt9mQc7ELW2SsFFZK9kbr8Hg1gNQqzrRtZYjBZ0ntMfHoNRQo
   UOX4u74Hl3S+EiX80s58/fYmO6NW3c75G9mISq6l+KgI1b62NG7aYt0Xm
   8sp+VCrRy0EYHPvKtA00VwcMqZqQnYdKlrceIRAZ4UKlNRdHljnVOYbpU
   rargsWMuig5ljzH04Z7m1a8cfSyZmRY7OboxbrsGlEyjgKvAYRZJF3etU
   WFMfAmKTnDODEB0KbihZzVWZn80jYVU5eGpgmB9CYSuVhm8kVvZkr4DNf
   MArwT27sHjcLWoikWpdtd8u6muwrqK5aDyLJeMUcsnNOyS/1aauKxLuhL
   g==;
X-CSE-ConnectionGUID: fRc4QhpfSZadhEKEEE9Cpg==
X-CSE-MsgGUID: K9KvIVA/RFqmhDP3XrrLsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67564968"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67564968"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:29:20 -0800
X-CSE-ConnectionGUID: Ey5HOZJJRn2ozz9VfZS91Q==
X-CSE-MsgGUID: LrmmqvEqSv2vA4+Zz6CzeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201460965"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 00:29:17 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUL07-000000007Jp-0EUh;
	Sat, 13 Dec 2025 08:29:15 +0000
Date: Sat, 13 Dec 2025 16:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>
Subject: drivers/gpu/drm/msm/dp/dp_display.c:1313:39: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202512131656.sgDxurSb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: 603fc0fc30bf69e78a7a5febdb1431bd49d87f22 drm/msm/dp: drop the msm_dp_catalog module
date:   5 months ago
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131656.sgDxurSb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131656.sgDxurSb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131656.sgDxurSb-lkp@intel.com/

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
