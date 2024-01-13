Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AA3A48
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCGsUzFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705138480; x=1736674480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kiUttKKMo6CzWdcFpSvwvWAxOC6lOZCrboWK/mKdJBo=;
  b=SCGsUzFRRTe5MNp27BVEWiW2eBZ8mD0eM8ggyk8PeQvYYnSyrZhfPpzA
   ZuQLSZjrAhUV//b06ZrfWZc0j9iwbBppe1Q9a27zcocUPbPM7yBYgnS/O
   lXOO+rcROGRXLXEBm3LSav2z3wf7B+Hg+hP3M0LvzXCKe6rx0lHLr05fa
   WbqIGpM5zq91bEVXjjW+d4ZiNWWewS3FKCbN6fvyJFjgEv3jGbJnmrw5T
   /wAZVdCycABMbWKD1eQFIuTZMfhVOJkZcIAx1O34dWH9YkgU/xBRESobo
   EfYlbcVT3IFw4A7QaR8jAMKy38pLGi37S15mG36P7JEKNUj6fZEqoschI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="463646734"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="463646734"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 01:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="956337900"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="956337900"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Jan 2024 01:34:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOaPU-000AJI-3B;
	Sat, 13 Jan 2024 09:34:36 +0000
Date: Sat, 13 Jan 2024 17:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 114/17888]
 drivers/soc/imx/imx8mp-blk-ctrl.c:746:25: error: use of undeclared
 identifier 'imx8m_blk_ctrl_of_match'; did you mean
 'imx8mp_blk_ctrl_of_match'?
Message-ID: <202401131748.tZn9bo2D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jindong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 245075cb7098e00517c3362f7d6a8e13d1e83120 [114/17888] MA-18464 soc: imx: Support building imx8m soc driver as module
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240113/202401131748.tZn9bo2D-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131748.tZn9bo2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131748.tZn9bo2D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/imx/imx8mp-blk-ctrl.c:746:25: error: use of undeclared identifier 'imx8m_blk_ctrl_of_match'; did you mean 'imx8mp_blk_ctrl_of_match'?
     746 | MODULE_DEVICE_TABLE(of, imx8m_blk_ctrl_of_match);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                         imx8mp_blk_ctrl_of_match
   include/linux/module.h:243:15: note: expanded from macro 'MODULE_DEVICE_TABLE'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^
   drivers/soc/imx/imx8mp-blk-ctrl.c:735:34: note: 'imx8mp_blk_ctrl_of_match' declared here
     735 | static const struct of_device_id imx8mp_blk_ctrl_of_match[] = {
         |                                  ^
   1 error generated.


vim +746 drivers/soc/imx/imx8mp-blk-ctrl.c

556f5cf9568af7 Lucas Stach 2022-04-06  734  
556f5cf9568af7 Lucas Stach 2022-04-06  735  static const struct of_device_id imx8mp_blk_ctrl_of_match[] = {
556f5cf9568af7 Lucas Stach 2022-04-06  736  	{
556f5cf9568af7 Lucas Stach 2022-04-06  737  		.compatible = "fsl,imx8mp-hsio-blk-ctrl",
556f5cf9568af7 Lucas Stach 2022-04-06  738  		.data = &imx8mp_hsio_blk_ctl_dev_data,
e3442022f54301 Lucas Stach 2022-04-06  739  	}, {
e3442022f54301 Lucas Stach 2022-04-06  740  		.compatible = "fsl,imx8mp-hdmi-blk-ctrl",
e3442022f54301 Lucas Stach 2022-04-06  741  		.data = &imx8mp_hdmi_blk_ctl_dev_data,
556f5cf9568af7 Lucas Stach 2022-04-06  742  	}, {
556f5cf9568af7 Lucas Stach 2022-04-06  743  		/* Sentinel */
556f5cf9568af7 Lucas Stach 2022-04-06  744  	}
556f5cf9568af7 Lucas Stach 2022-04-06  745  };
556f5cf9568af7 Lucas Stach 2022-04-06 @746  MODULE_DEVICE_TABLE(of, imx8m_blk_ctrl_of_match);
556f5cf9568af7 Lucas Stach 2022-04-06  747  

:::::: The code at line 746 was first introduced by commit
:::::: 556f5cf9568af772d494cff24ffaa7ea41e1ab40 soc: imx: add i.MX8MP HSIO blk-ctrl

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
