Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B75168A8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 06:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707631492; cv=none; b=bwMWkyg6yUst+FOOlBfciAzgf/UMfIvbwstm65v0Z8B7/ejxKrPk9fTu+kCZDC60KxJH8enO9ZIqMzW5ZRxFNGAuiWA3kVZOgqRBmznsNNAHgJrYyS9FDWw/AG/vXzd9bAXKYDe9P7P8raDQK8VGCSY6j4BhI63gW2ipK3aBfZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707631492; c=relaxed/simple;
	bh=1FucLqfEwgTBL2/hhnW6NYcTGX8HoLVgKkoHz4War04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mx+1+tQUCLTlTCVrGj7Tx0GV6aq5kNL2mUXfNbCu4vMzPe76cnDrZdOcfI0vW4a/MHhWlaWk1hNgt1xnQpdaVxuJEhDsiHgRGNXhtoZJ/Z+OK4a8+HGEnHhvEHdtS/GqxWQx7AwkzWuYxchHseAo57RE7IvlPMfvk/SDMm8dE3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Th3UqDVj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Th3UqDVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707631491; x=1739167491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1FucLqfEwgTBL2/hhnW6NYcTGX8HoLVgKkoHz4War04=;
  b=Th3UqDVj3Ej4Hep8JSGn1mVs8Dj/pixnQN9CssXFTMZBxo3YK7EOuAF9
   sA7x2852gTovDpFfnjY4psgaQ6TA4UffebcwTGM52d1qCNfKxNyuTY5du
   Ven2LtAj/SiwHoPWULhmk7InWtWdo9gK+r9Kujco1uKqlfmBklQcOSQnT
   mHPkStQOlFdUxkPGRaFv6I3fte1bwn+FN6MaMmQWZeXSw6xN0BVIXsLTp
   3jy04C8j91IB6x+7jGDvf8o4U2ycfAkEmfBRSqk1+TSncYb4r2KdYaPkI
   H7CC6paGTeCZM7mD9DG3AK1etSzL2S1yi+CHaFI93xBUhgbP3BpOrlvZQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="5423350"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="5423350"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 22:04:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="2270943"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2024 22:04:48 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZ2xJ-0006MY-2J;
	Sun, 11 Feb 2024 06:04:45 +0000
Date: Sun, 11 Feb 2024 14:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 1287/17898]
 drivers/gpu/drm/imx/dw_mipi_dsi-imx.c:615:24: error:
 'dw_mipi_dsi_imx_pm_ops' undeclared here (not in a function); did you mean
 'dw_mipi_dsi_imx_phy_ops'?
Message-ID: <202402111323.7LVj1BXa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   4e3fc5471376a15279ee5c99e791a7c7b065cbc1
commit: 850748892aef50b330e3177be5d6967ddc34e899 [1287/17898] LF-6251-2 drm/imx: Add i.MX93 Synopsys DesignWare MIPI DSI controller support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240211/202402111323.7LVj1BXa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402111323.7LVj1BXa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402111323.7LVj1BXa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/imx/dw_mipi_dsi-imx.c:615:24: error: 'dw_mipi_dsi_imx_pm_ops' undeclared here (not in a function); did you mean 'dw_mipi_dsi_imx_phy_ops'?
     615 |                 .pm = &dw_mipi_dsi_imx_pm_ops,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        dw_mipi_dsi_imx_phy_ops


vim +615 drivers/gpu/drm/imx/dw_mipi_dsi-imx.c

   608	
   609	struct platform_driver dw_mipi_dsi_imx_driver = {
   610		.probe	= dw_mipi_dsi_imx_probe,
   611		.remove	= dw_mipi_dsi_imx_remove,
   612		.driver	= {
   613			.of_match_table = dw_mipi_dsi_imx_dt_ids,
   614			.name = "dw-mipi-dsi-imx",
 > 615			.pm = &dw_mipi_dsi_imx_pm_ops,
   616		},
   617	};
   618	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
