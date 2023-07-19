Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860F61857
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 04:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689741833; x=1721277833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/QtDJ5SbQvsT6Bw6fQNI2H4TTmHhYQS4hjJNdWh47MY=;
  b=acYimL4KZzQnQzd2NjjJ37UJ6OcsIAbUBZckLXH4wfKeRFXEZ5hWMUF0
   aorMn2G0OIyQClv96/4b8Z6RNvBUj3pkYat3QbpMe5WowVpVS3/xjtnMD
   RnbyxpXEpbY+DHhtFVJP0UpRHwc+xwQkxgwKIEiZTrOtp5YHHzV8u02bR
   Y95u4m9EkJTomde57cuiGA01a+YZy/cZCmEj3/iVdL4+NeMMJiO4PbjCZ
   8EHyUNKF8Z2cC1STC6tYV6bYAZ7nMhpucBdM4/gbNTJ0kya1o3uDuDqMM
   dP/KLuCWNbT3+VFJgQH6AQ9E+ltmbyNOOXvpRpMmjqdpbqY4Fov9UedNB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="356319322"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="356319322"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 21:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="1054555874"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="1054555874"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jul 2023 21:43:50 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLz21-00049l-2c;
	Wed, 19 Jul 2023 04:43:24 +0000
Date: Wed, 19 Jul 2023 12:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 3816/12467]
 drivers/spi/spi-nxp-fspi.c:1340:26: error: 'nxp_fspi_pm_ops' undeclared here
 (not in a function); did you mean 'nxp_fspi_mem_ops'?
Message-ID: <202307191213.jPUyPpMm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   791ee62ff569635e685d84c09b2179f002c4e0bf
commit: e0b338dc8b0a33b70718899aa798738d157d0259 [3816/12467] spi: spi-nxp-fspi: enable runtime pm for fspi
config: sparc64-randconfig-r036-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191213.jPUyPpMm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191213.jPUyPpMm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191213.jPUyPpMm-lkp@intel.com/

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
