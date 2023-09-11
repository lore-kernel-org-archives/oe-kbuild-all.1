Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB649C2D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 11:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694431501; x=1725967501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uv9nAbEUF62DMugRVD9iw/zFF/YRVeZaMUgdwRDQng0=;
  b=fVV9uS+RXpXVxKO/MbTMBXIpl55QpdxfIIXc/0jjDNCvgZL5mGTwVD7V
   gHExL9JeLvrDZFcDeNBg7EN97jLQvLDMYD8CP6batKSUJ5LzDiDH/JRyK
   cl3KtSYpT7sgC4EwB/4OFuS4HnqXVwANMPYm9KHIaja4F/1jA45NX/8BJ
   SEYarcdzV5/3YS9A8B226UhPe4cjiXEmLIjCLOSVMU+sAY6svaxPCM/Vt
   Qre4HA6bF2EVv7o9e1qH72YRURr2g8EdxrCnFz/R8UKi42hcR6ZX+oc50
   JAF+jyY482ObAZAQyddTGfUmgBA/kClqLBt6qZtb8hNWVZtHr7qrGVBsS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="363078865"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="363078865"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 04:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="719958932"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="719958932"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Sep 2023 04:25:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qff2H-00068t-34;
	Mon, 11 Sep 2023 11:24:57 +0000
Date: Mon, 11 Sep 2023 19:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 4220/25021]
 drivers/spi/spi-nxp-fspi.c:1311:12: error: use of undeclared identifier
 'nxp_fspi_pm_ops'; did you mean 'nxp_fspi_mem_ops'?
Message-ID: <202309111936.WZplseLz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Han,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: b14e8d1b1ca9bcf02a4e43900141ff8f17fed3f0 [4220/25021] MLK-23644: spi: spi-nxp-fspi: enable runtime pm for fspi
config: i386-buildonly-randconfig-001-20230910 (https://download.01.org/0day-ci/archive/20230911/202309111936.WZplseLz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111936.WZplseLz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111936.WZplseLz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-nxp-fspi.c:1311:12: error: use of undeclared identifier 'nxp_fspi_pm_ops'; did you mean 'nxp_fspi_mem_ops'?
                   .pm =   &nxp_fspi_pm_ops,
                            ^~~~~~~~~~~~~~~
                            nxp_fspi_mem_ops
   drivers/spi/spi-nxp-fspi.c:1086:44: note: 'nxp_fspi_mem_ops' declared here
   static const struct spi_controller_mem_ops nxp_fspi_mem_ops = {
                                              ^
>> drivers/spi/spi-nxp-fspi.c:1311:11: error: incompatible pointer types initializing 'const struct dev_pm_ops *' with an expression of type 'const struct spi_controller_mem_ops *' [-Werror,-Wincompatible-pointer-types]
                   .pm =   &nxp_fspi_pm_ops,
                           ^~~~~~~~~~~~~~~~
   2 errors generated.


vim +1311 drivers/spi/spi-nxp-fspi.c

55ab8487e01d18 kuldip dwivedi      2020-09-11  1305  
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1306  static struct platform_driver nxp_fspi_driver = {
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1307  	.driver = {
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1308  		.name	= "nxp-fspi",
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1309  		.of_match_table = nxp_fspi_dt_ids,
55ab8487e01d18 kuldip dwivedi      2020-09-11  1310  		.acpi_match_table = ACPI_PTR(nxp_fspi_acpi_ids),
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15 @1311  		.pm =   &nxp_fspi_pm_ops,
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1312  	},
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1313  	.probe          = nxp_fspi_probe,
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1314  	.remove		= nxp_fspi_remove,
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1315  };
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1316  module_platform_driver(nxp_fspi_driver);
a5356aef6a907c Yogesh Narayan Gaur 2019-01-15  1317  

:::::: The code at line 1311 was first introduced by commit
:::::: a5356aef6a907c2e2aed0caaa2b88b6021394471 spi: spi-mem: Add driver for NXP FlexSPI controller

:::::: TO: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
