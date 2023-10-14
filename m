Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D6171DA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHxgiPWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697316616; x=1728852616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3aufas40CzuTRD0vjKsW+LGHqHtLEDxwdjehnGlmdSI=;
  b=IHxgiPWSh0+C6+2Oq1h667UQ4sCstDwzWIM4Qli7aoSNkyREUuTgv1j0
   RMv5oHlCRMVvKkhKCrWKQVXzfuDBA+UFVdhmP8B8Tk39HrbTZUEPIO7rC
   nACGgsnspptkBGtWz8xueZX7ug+8Q4wnFnrRKUjaIsSy7qsdmY6g5GZHC
   hwPwa7bW60zQ0QU1Qv0Yru68dibEo1Xag5VgPYdvHgoFh88rVKQZ6xWfc
   kcWQmIUlZSkn1mCy9/pbgQxPj4bNfYjvv1yMFJI8lDCVSaNU3CS/6Ldvv
   WYLQ3GutE6s7cvw+GkYA43BjTXAWc0ES7KghbilIiWgjSm1csyQpFGyvI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364709718"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="364709718"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 13:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="748756383"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="748756383"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 13:50:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrlaO-0006dJ-16;
	Sat, 14 Oct 2023 20:50:12 +0000
Date: Sun, 15 Oct 2023 04:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 1287/15768]
 drivers/gpu/drm/imx/dw_mipi_dsi-imx.c:615:24: error:
 'dw_mipi_dsi_imx_pm_ops' undeclared here (not in a function); did you mean
 'dw_mipi_dsi_imx_phy_ops'?
Message-ID: <202310150439.04WmuEHX-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 850748892aef50b330e3177be5d6967ddc34e899 [1287/15768] LF-6251-2 drm/imx: Add i.MX93 Synopsys DesignWare MIPI DSI controller support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310150439.04WmuEHX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150439.04WmuEHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150439.04WmuEHX-lkp@intel.com/

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
