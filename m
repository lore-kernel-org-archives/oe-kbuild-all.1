Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDC81EA95
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLmy2bqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697119991; x=1728655991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DkdNOo9DbO7pI/nyZTy1PTAWYidm2NvKSlqyIslrK6g=;
  b=YLmy2bqQxUhkExX3c6oB5ZinEKYqLrslT45n/iJpanpaqTawXy42GwEc
   MGZRTVKIDjN1tJaHyU3lgLSqfgMcmlepopvmu8p7eA1E6l0u/dOlA0/zp
   iAJawMgzCV5R7TyGmQgm3ChwG4FZWV4XgRc1zSkyPSH4C8d121NHaosGT
   aE5B+blJ2OLXNK6IoA7lCiXxneLRFGQwY1/sP70pCBF23VhY3If1vcfPS
   GaH4R8kelAsQ2i0gcH3NvKgjbKQ/LY/4QHh9BQfD3W/4kBImyM6Jkzv0+
   CPRsVcetLXbXlD0xPc9zq5hYkejBtpXIosycArlwbM3keW55eowu2aTkC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375287629"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="375287629"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 07:13:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1085674537"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1085674537"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Oct 2023 07:13:09 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqwR1-0003Vf-0i;
	Thu, 12 Oct 2023 14:13:07 +0000
Date: Thu, 12 Oct 2023 22:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 7258/15768]
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c:280:19: warning:
 'imx8_pcie_phy_fine_tune' defined but not used
Message-ID: <202310122240.Rdlq2Jp0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 7813538d3a615aec87afd7de70677645b228ad08 [7258/15768] LF-8215 phy: freescale: imx8m-pcie: Fix i.MX8MP EVK EP RC link speed is only Gen1
config: loongarch-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231012/202310122240.Rdlq2Jp0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310122240.Rdlq2Jp0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122240.Rdlq2Jp0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/freescale/phy-fsl-imx8m-pcie.c:280:19: warning: 'imx8_pcie_phy_fine_tune' defined but not used [-Wunused-function]
     280 | static int __init imx8_pcie_phy_fine_tune(char *str)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~


vim +/imx8_pcie_phy_fine_tune +280 drivers/phy/freescale/phy-fsl-imx8m-pcie.c

   279	
 > 280	static int __init imx8_pcie_phy_fine_tune(char *str)
   281	{
   282		if (!strcmp(str, "yes")) {
   283			pr_info("i.MX PCIe PHY is fine tuned in EP/RC SYS.\n");
   284			imx8_pcie_phy_tuned = 1;
   285		}
   286		return 1;
   287	}
   288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
