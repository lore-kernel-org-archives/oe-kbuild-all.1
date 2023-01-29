Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0DD17D9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674985741; x=1706521741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tQNFukfF9LQOtTgCDxPFbgN+UG8IMD9IneG+sS8Qbas=;
  b=TiiM6BV8tUWZYZqsVh5StN3ez1HtIV7owyZfrx4bBR3HX9uqqUspC+w2
   7i++KbwisgMvUfvHEbljPnUrlRZ81pUFJAN7Tp95KIyIBAaV2cHZsS3lC
   yzsrm5Q+FjpxQ4iPjaa3fy6nIKJplolFklxNSnfH38K2KOX+VH5yd40/n
   /cg2EIAIFw2vjuKiAk8v/7VVkY/g1SBxEnO38DFCHnPpNPG+MJxiVocwf
   YNxhs1R2HSPMs1VJGWuXynO2TRz77bJD5sbVABuwrjFXJ+hmMB/axSg7m
   Xwm+s7/mjRGC1+zEDSFTTwtKPCDWn/KlFWcmY9awipbgM8I3G7th8Qd9c
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="326052162"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="326052162"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 01:49:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="694220000"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="694220000"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Jan 2023 01:48:59 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM4J0-0002gO-2r;
	Sun, 29 Jan 2023 09:48:58 +0000
Date: Sun, 29 Jan 2023 17:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jagadeesh Banisetti <jagadeesh.banisetti@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 835/1124]
 drivers/phy/xilinx/xilinx_dpgtquadphy.c:49:17: error: implicit declaration
 of function 'FIELD_PREP'
Message-ID: <202301291735.U2eZ9C94-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jagadeesh,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   5da20470af455bc588357712b64603b06e4edf42
commit: 0295958b5a214d82a0621379590f897cae5bf6cd [835/1124] phy: Add driver for GTQUAD BASE for Displayport
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291735.U2eZ9C94-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/0295958b5a214d82a0621379590f897cae5bf6cd
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout 0295958b5a214d82a0621379590f897cae5bf6cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/phy/xilinx/xilinx_dpgtquadphy.c: In function 'xdpgtquad_init':
>> drivers/phy/xilinx/xilinx_dpgtquadphy.c:49:17: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      49 |         data |= FIELD_PREP(GT_QUAD_BASE_CH1_CLK_DIV_MASK,
         |                 ^~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_PANEL_SIMPLE
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && BACKLIGHT_CLASS_DEVICE [=y] && PM
   Selected by [y]:
   - DRM_XLNX_DSI [=y] && HAS_IOMEM [=y] && DRM_XLNX [=y]


vim +/FIELD_PREP +49 drivers/phy/xilinx/xilinx_dpgtquadphy.c

    34	
    35	static int xdpgtquad_init(struct phy *phy)
    36	{
    37		struct dpgtquadphy_dev *gtquad = phy_get_drvdata(phy);
    38		u32 data;
    39	
    40		/*
    41		 * Unlocking the NPI space so that GT CH1 divider value can be
    42		 * programmed. This will generate a /20 clk
    43		 */
    44		writel(GT_QUAD_BASE_CTL_VALUE,
    45		       gtquad->base + GT_QUAD_BASE_CTL);
    46	
    47		data = readl(gtquad->base + GT_QUAD_BASE_CH1_CLK_DIV_REG);
    48		data &= ~GT_QUAD_BASE_CH1_CLK_DIV_MASK;
  > 49		data |= FIELD_PREP(GT_QUAD_BASE_CH1_CLK_DIV_MASK,
    50				   GT_QUAD_BASE_CH1_CLK_DIV_VALUE);
    51		writel(data, gtquad->base + GT_QUAD_BASE_CH1_CLK_DIV_REG);
    52	
    53		return 0;
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
