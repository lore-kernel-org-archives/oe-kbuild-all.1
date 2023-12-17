Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962ECEA9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 01:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar0JeYJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702776069; x=1734312069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xwCIen5kkSlT2dLYIY46SJx6LH+h49Ai2hXt1jlMA1Q=;
  b=ar0JeYJSWYpuI9SzBs3SPq3kTufMnoHxUrUznWQXx1qzlgHqs4Lbet8E
   9poUa0LNI9vtqVtUUtrQCGqf+jjSy59IWYG5/Z20fZPGmSoJP5WaiGymu
   7W2XFNlsYDaFwXZPmQE6VqMfFqqBdYQ3D/86CMNxDw8mtb8jI8BhPV+Uk
   BeFZ8HMFDTeQl3qvN5vB56l6u7X4AJ5vVfMEJp6l/3V2ytQZLvKiFE59O
   ezhYFOAk9krQrJqWK5XlIW4z64B+pOhy0jXEvnZNgF95KkGe2viuvmQaB
   eGUkYOPDldYkW3sRQqwqYkhRZeTovksIMguParu2Z7EwshywcKmrcje1v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="14080040"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="14080040"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 17:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768416342"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="768416342"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2023 17:21:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEfq5-0002Qw-2S;
	Sun, 17 Dec 2023 01:21:05 +0000
Date: Sun, 17 Dec 2023 09:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 2903/16025]
 drivers/i2c/busses/i2c-imx.c:157:34: warning: unused variable
 'pinmux_of_match'
Message-ID: <202312170944.W3eaFBh5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: cc89a9735f9cf19937652cb62b84b906fec3e804 [2903/16025] i2c: imx: implement bus recovery with gpio for Layerscape
config: i386-buildonly-randconfig-001-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170944.W3eaFBh5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170944.W3eaFBh5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170944.W3eaFBh5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-imx.c:1343:7: warning: unused variable 'enable_runtime_pm' [-Wunused-variable]
           bool enable_runtime_pm = false;
                ^
>> drivers/i2c/busses/i2c-imx.c:157:34: warning: unused variable 'pinmux_of_match' [-Wunused-const-variable]
   static const struct of_device_id pinmux_of_match[] = {
                                    ^
   drivers/i2c/busses/i2c-imx.c:1895:12: warning: unused function 'i2c_imx_suspend' [-Wunused-function]
   static int i2c_imx_suspend(struct device *dev)
              ^
   drivers/i2c/busses/i2c-imx.c:1901:12: warning: unused function 'i2c_imx_resume' [-Wunused-function]
   static int i2c_imx_resume(struct device *dev)
              ^
   4 warnings generated.


vim +/pinmux_of_match +157 drivers/i2c/busses/i2c-imx.c

   156	
 > 157	static const struct of_device_id pinmux_of_match[] = {
   158		{ .compatible = "fsl,ls1012a-i2c", .data = &ls1012a_pinmux_cfg},
   159		{ .compatible = "fsl,ls1043a-i2c", .data = &ls1043a_pinmux_cfg},
   160		{ .compatible = "fsl,ls1046a-i2c", .data = &ls1046a_pinmux_cfg},
   161		{},
   162	};
   163	MODULE_DEVICE_TABLE(of, pinmux_of_match);
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
