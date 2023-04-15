Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D30A29
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 04:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681534274; x=1713070274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uQcXkjYDIsSNL8v/J/TXLtlqfOs9OAz8fvo/ov734vU=;
  b=k7pWwtqNnTPdgUG75oqkBxi+i3NYYQnMern+KgpQlncpwoc/jhgZkFrA
   PYBlNv8Fn2xAwRJmo6glDS/meUHKqj3O7y/7YQzIRqXQzwH10vtuYeCB6
   8foqZnv3jkTDqBe6aybUiARLSK7lUkPhnW534JTS02z8fsAnyGT7xH24h
   olgOgYl8ftJRvIOjU+fX/ChqYukDVFOOzdopM3MMkRGN+yfSvj7BNcN+J
   pD39svk/ys6fu5kMB354Ja0Ky0pa3VmJ8gcxlDNBHRksqakEiR58x8Gxg
   9w+W3S6XJk6XNaGOIhVCUuRqBJ0zQIwzE19NuD3d2kkU89bpjgI8teWsB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="346459091"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="346459091"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 21:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="801435695"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="801435695"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2023 21:51:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnXsV-000aT1-2j;
	Sat, 15 Apr 2023 04:51:11 +0000
Date: Sat, 15 Apr 2023 12:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 1287/9838]
 drivers/gpu/drm/imx/dw_mipi_dsi-imx.c:615:24: error:
 'dw_mipi_dsi_imx_pm_ops' undeclared here (not in a function); did you mean
 'dw_mipi_dsi_imx_phy_ops'?
Message-ID: <202304151212.MGJyea1I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 850748892aef50b330e3177be5d6967ddc34e899 [1287/9838] LF-6251-2 drm/imx: Add i.MX93 Synopsys DesignWare MIPI DSI controller support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304151212.MGJyea1I-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/850748892aef50b330e3177be5d6967ddc34e899
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 850748892aef50b330e3177be5d6967ddc34e899
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151212.MGJyea1I-lkp@intel.com/

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
https://github.com/intel/lkp-tests
