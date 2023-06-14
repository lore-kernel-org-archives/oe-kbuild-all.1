Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4E6101DD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 20:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686774202; x=1718310202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HpOoocgRSqb9ufbSMPusYet9vgv9Ln7/lDTmRx8LeO4=;
  b=NAK96vQzY6Vg6QJ5xAPlmjyHeb7ITAoTYoAViKl+6x3HJSfbxT7Ewrft
   TSFZqiCOAA0FUHLrgoRigmh0pBQCDmEqbv+rSFdF+3Z2/TRGau8hNszdU
   tmXrv/zBk+Gc+Pi/FyBKwfndQkLWOAbKPp1qmjF7uizGSnaAh6Ekcse/G
   YuyMW3AhOGY2XpeMl+qyp5FkQWmlc6J3OcI2G049yoM7kQQYkuR2IlDU7
   YgNrpahy6DhhExeyd4OLKhvuudXgnpnBEGD1fT/VSGFFeSTSv/ScPxL5/
   DXJ8Xv8GF0bdQa/OZTmImN57NphIoxTOWWkEhK/sddIuck4XZmdNpua68
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="445098246"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="445098246"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 13:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="662536797"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="662536797"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Jun 2023 13:23:19 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9X19-000137-1R;
	Wed, 14 Jun 2023 20:23:18 +0000
Date: Thu, 15 Jun 2023 04:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS_2023.1_update 140/1079]
 drivers/clk/clk-si5324.c:474: warning: expecting prototype for
 si5324_regmap_is_writable(). Prototype was for si5324_regmap_is_writeable()
 instead
Message-ID: <202306150408.UXmDG0pa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
head:   b8d15414a440db0904ee32f03268e2d262dbf397
commit: cc938825e6e8f50d47ed23750273894aa5429e39 [140/1079] clk: Adding Silicon labs si5324 clock driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230615/202306150408.UXmDG0pa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/cc938825e6e8f50d47ed23750273894aa5429e39
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
        git checkout cc938825e6e8f50d47ed23750273894aa5429e39
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/staging/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306150408.UXmDG0pa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-si5324.c:474: warning: expecting prototype for si5324_regmap_is_writable(). Prototype was for si5324_regmap_is_writeable() instead


vim +474 drivers/clk/clk-si5324.c

   462	
   463	/**
   464	 * si5324_regmap_is_writable - Checks the register is writable or not
   465	 *
   466	 * @dev:	Registered device
   467	 * @reg:	Register offset
   468	 *
   469	 * Checks the register is writable or not.
   470	 *
   471	 * Return:	True if the register is writeable, False if it's not writeable.
   472	 */
   473	static bool si5324_regmap_is_writeable(struct device *dev, unsigned int reg)
 > 474	{
   475		if ((reg > SI5324_POWERDOWN && reg < SI5324_FOS_LOCKT) ||
   476		    (reg > SI5324_N1_HS && reg < SI5324_NC1_LS_H) ||
   477		    (reg > SI5324_NC2_LS_L && reg < SI5324_N2_HS_LS_H) ||
   478		    (reg > SI5324_N32_CLKIN_L && reg < SI5324_FOS_CLKIN_RATE) ||
   479		    (reg > SI5324_FOS_CLKIN_RATE && reg < SI5324_PLL_ACTV_CLK) ||
   480		    reg > SI5324_SKEW2 ||
   481		    (reg >= SI5324_PLL_ACTV_CLK && reg <= SI5324_CLKIN_LOL_STATUS) ||
   482		    (reg >= SI5324_PARTNO_H && reg <= SI5324_PARTNO_L))
   483			return false;
   484	
   485		return true;
   486	}
   487	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
