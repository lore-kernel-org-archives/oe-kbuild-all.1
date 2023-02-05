Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481AD7B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 07:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675582334; x=1707118334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W2UhJK4fEEDqP9K1PWqqKIV0HlKJ5OBnJ69PLGYX7vQ=;
  b=LjVSevENRrxVDRuBVvUoMylpZh++xVrrSHdpiQdydELofKZGDO7GrVx5
   Yi1H8nlANWOLwJYNeyZlXZrXcC7xpU48KVkhi2pqETe7ptSj0MPmA2C+K
   pFH8Z9iMi9TIE7braectFD3wrHPW2pgEHxeQSveRin7KOJfnSRK1KS5kK
   8Z04WuwlK/1kv14ZI7zwxv6B4NFf/Mmp4RKTO5eM2AQow1DScMfrWM86k
   eRR7CVdk365HVbfddMD9m++cXLRIcd3YnqiceAQdrh1ezzk2RLuBGAAjO
   6lfeiIHVyiMFEJGubqrQCsPQe3Bn6MHy0lYq1Ouwj6NSLo1gsJGyb42DX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="331157582"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="331157582"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 23:32:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="643702839"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="643702839"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Feb 2023 23:32:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOZVT-0001pQ-3A;
	Sun, 05 Feb 2023 07:32:11 +0000
Date: Sun, 5 Feb 2023 15:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 4220/20208]
 drivers/spi/spi-nxp-fspi.c:1311:26: error: 'nxp_fspi_pm_ops' undeclared here
 (not in a function); did you mean 'nxp_fspi_mem_ops'?
Message-ID: <202302051552.VhKGYKeG-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: b14e8d1b1ca9bcf02a4e43900141ff8f17fed3f0 [4220/20208] MLK-23644: spi: spi-nxp-fspi: enable runtime pm for fspi
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230205/202302051552.VhKGYKeG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/b14e8d1b1ca9bcf02a4e43900141ff8f17fed3f0
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout b14e8d1b1ca9bcf02a4e43900141ff8f17fed3f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/spi/spi-nxp-fspi.c:1311:26: error: 'nxp_fspi_pm_ops' undeclared here (not in a function); did you mean 'nxp_fspi_mem_ops'?
    1311 |                 .pm =   &nxp_fspi_pm_ops,
         |                          ^~~~~~~~~~~~~~~
         |                          nxp_fspi_mem_ops


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
https://github.com/intel/lkp-tests
