Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A27F17F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 14:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WV55SCMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697122518; x=1728658518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4z4/63jzgJkGuRnSYRmo4elMG8TZBahQc/1WtNMEHbU=;
  b=WV55SCMX8Nt+NogcSLJ19jj9oi7xRTmcc4er+o1/t0XT8yo8FXZ2f50L
   yoFFH3jA/Z56kg6dT3EswLd5o8MfjqSMtmiOQdXQcdRAI1CHoYEZy0daf
   9iO0ntBJg7Gh4Va/qRUIPeY1VtK1DcPj1S9amXiyqMsOqFLa7eKyUFC5F
   KRWyPEYqjsVWftlBfOP07Nc4bVmKh2UKBjJ986k9KvQGKnZfnDpxzyonU
   UOppNtMkY/TSEbZ1eyjRMIjzeNcWhPSrNDTIl4da5s32OxM0fHGyXgCdr
   cQtg/i+GtpVl1yvmfr+TMULrKUhsMOR30oYSruj5x0cwNph/w6L1llW6d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375298770"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="375298770"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 07:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878140341"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="878140341"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 07:55:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqx5l-0003XV-1O;
	Thu, 12 Oct 2023 14:55:13 +0000
Date: Thu, 12 Oct 2023 22:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3816/15768]
 drivers/spi/spi-nxp-fspi.c:1340:26: error: 'nxp_fspi_pm_ops' undeclared here
 (not in a function); did you mean 'nxp_fspi_mem_ops'?
Message-ID: <202310122252.6QTRzMH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haibo,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: e0b338dc8b0a33b70718899aa798738d157d0259 [3816/15768] spi: spi-nxp-fspi: enable runtime pm for fspi
config: loongarch-randconfig-002-20231012 (https://download.01.org/0day-ci/archive/20231012/202310122252.6QTRzMH4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310122252.6QTRzMH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122252.6QTRzMH4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-nxp-fspi.c:1340:26: error: 'nxp_fspi_pm_ops' undeclared here (not in a function); did you mean 'nxp_fspi_mem_ops'?
    1340 |                 .pm =   &nxp_fspi_pm_ops,
         |                          ^~~~~~~~~~~~~~~
         |                          nxp_fspi_mem_ops


vim +1340 drivers/spi/spi-nxp-fspi.c

55ab8487e01d18 kuldip dwivedi      2020-09-11  1334  
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1335  static struct platform_driver nxp_fspi_driver = {
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1336  	.driver = {
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1337  		.name	= "nxp-fspi",
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1338  		.of_match_table = nxp_fspi_dt_ids,
55ab8487e01d18 kuldip dwivedi      2020-09-11  1339  		.acpi_match_table = ACPI_PTR(nxp_fspi_acpi_ids),
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15 @1340  		.pm =   &nxp_fspi_pm_ops,
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1341  	},
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1342  	.probe          = nxp_fspi_probe,
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1343  	.remove		= nxp_fspi_remove,
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1344  };
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1345  module_platform_driver(nxp_fspi_driver);
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1346  

:::::: The code at line 1340 was first introduced by commit
:::::: a5356aef6a907c2e2aed0caaa2b88b6021394471 spi: spi-mem: Add driver for NXP FlexSPI controller

:::::: TO: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
