Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4BAFBEC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 06:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmmuVP5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705127257; x=1736663257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVg/+BnjMeTbG8tXpTKZUPaNQe28hPaRXjNzmCOM3pc=;
  b=mmmuVP5Cm3QD2ffNvK3sBdQPbF2bGoZljxc6dkMX7WAB3m6kl71wjZi9
   KO1Vpd3aeRcZRhb2scJQ17kMHLBO87P9PtGJzk1HKbTY0x50p3BuNZD+m
   zVW/mrDXe1gR0+Iqmf15/iC/50WauzoqGFGIyObMxXJSvQAMrty7z0xdK
   X2cIrqsExYh7EcyULjcK7GMoEJ33vwjvsvdtLQeBa6V1xLpO03VTmCYa9
   PoT5nuWTa4QA+w3ANRGH6mO8TLYnZ9WsVcOu2MWuqNbNmtF5P+B/ZGLqi
   708BJW/4kRR5vIRFs+nRAHJLaRZyOiTwL1WUjwlVn7gahPTE8tpnjIp0r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="399034834"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="399034834"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 22:27:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="31611495"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Jan 2024 22:27:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOXUS-000AAm-2w;
	Sat, 13 Jan 2024 06:27:32 +0000
Date: Sat, 13 Jan 2024 14:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 3816/17888]
 drivers/spi/spi-nxp-fspi.c:1340:26: error: 'nxp_fspi_pm_ops' undeclared here
 (not in a function); did you mean 'nxp_fspi_mem_ops'?
Message-ID: <202401131404.npXnCv0P-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: e0b338dc8b0a33b70718899aa798738d157d0259 [3816/17888] spi: spi-nxp-fspi: enable runtime pm for fspi
config: x86_64-buildonly-randconfig-002-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131404.npXnCv0P-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131404.npXnCv0P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131404.npXnCv0P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-nxp-fspi.c:1340:26: error: 'nxp_fspi_pm_ops' undeclared here (not in a function); did you mean 'nxp_fspi_mem_ops'?
    1340 |                 .pm =   &nxp_fspi_pm_ops,
         |                          ^~~~~~~~~~~~~~~
         |                          nxp_fspi_mem_ops


vim +1340 drivers/spi/spi-nxp-fspi.c

55ab8487e01d184 kuldip dwivedi      2020-09-11  1334  
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1335  static struct platform_driver nxp_fspi_driver = {
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1336  	.driver = {
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1337  		.name	= "nxp-fspi",
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1338  		.of_match_table = nxp_fspi_dt_ids,
55ab8487e01d184 kuldip dwivedi      2020-09-11  1339  		.acpi_match_table = ACPI_PTR(nxp_fspi_acpi_ids),
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15 @1340  		.pm =   &nxp_fspi_pm_ops,
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1341  	},
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1342  	.probe          = nxp_fspi_probe,
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1343  	.remove		= nxp_fspi_remove,
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1344  };
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1345  module_platform_driver(nxp_fspi_driver);
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1346  

:::::: The code at line 1340 was first introduced by commit
:::::: a5356aef6a907c2e2aed0caaa2b88b6021394471 spi: spi-mem: Add driver for NXP FlexSPI controller

:::::: TO: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
