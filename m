Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84663C3B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675796375; x=1707332375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n+jyDIY1VTrBJqivo1p2qwVv+gZmGotmo2QAQNWWNuI=;
  b=JOJBp62Z71VjVeoVY3j/iii4O+5udRzInOLKvHjcA+v91mXJVxF7P/UQ
   v/n+uy7/Ia06wJoNRxum9lwxMLBEJsbe1fDlS+rc6CM9NCu00gKpP4yww
   fX0AgnHpw4u9A+3F7BPKbZ1WGScaO48ksYe/RpIi3yBbKUL+idy2VBGHI
   wLgVdmtJ1Ly1lDa1H42To8DMB/YVZtFKQm/q5/vlnasTxvYHSHoBMEiaR
   0ie1DNhdw+9Nm+3zSnhnEs+hVrSnxSrY3Hjg+/+EaWcKxZXc26MlUpqSE
   XsIS2BY7pnnUt0x2ZpCZs/AnRVILkaq6rJmjDasHzp7My0LhyfCgpO+dA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="415817698"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="415817698"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 10:59:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="755729480"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="755729480"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Feb 2023 10:59:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPTBf-0003nK-2i;
	Tue, 07 Feb 2023 18:59:27 +0000
Date: Wed, 8 Feb 2023 02:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 14467/20209]
 drivers/gpu/drm/imx/dw_mipi_dsi-imx.c:612:24: error:
 'dw_mipi_dsi_imx_pm_ops' undeclared here (not in a function); did you mean
 'dw_mipi_dsi_imx_phy_ops'?
Message-ID: <202302080227.ZOxFkRFx-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: 1db07ceeb7e35318fab75e5069c5e33466b7e202 [14467/20209] LF-6251-2 drm/imx: Add i.MX93 Synopsys DesignWare MIPI DSI controller support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230208/202302080227.ZOxFkRFx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/1db07ceeb7e35318fab75e5069c5e33466b7e202
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 1db07ceeb7e35318fab75e5069c5e33466b7e202
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/imx/dw_mipi_dsi-imx.c:612:24: error: 'dw_mipi_dsi_imx_pm_ops' undeclared here (not in a function); did you mean 'dw_mipi_dsi_imx_phy_ops'?
     612 |                 .pm = &dw_mipi_dsi_imx_pm_ops,
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        dw_mipi_dsi_imx_phy_ops


vim +612 drivers/gpu/drm/imx/dw_mipi_dsi-imx.c

   605	
   606	struct platform_driver dw_mipi_dsi_imx_driver = {
   607		.probe	= dw_mipi_dsi_imx_probe,
   608		.remove	= dw_mipi_dsi_imx_remove,
   609		.driver	= {
   610			.of_match_table = dw_mipi_dsi_imx_dt_ids,
   611			.name = "dw-mipi-dsi-imx",
 > 612			.pm = &dw_mipi_dsi_imx_pm_ops,
   613		},
   614	};
   615	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
