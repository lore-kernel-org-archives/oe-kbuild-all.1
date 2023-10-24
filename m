Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52021173A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C55l+wi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698180627; x=1729716627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CyNewOUI/XLXiF7hQKXc8aiWEHsuWXj5lG3YjpZSgM4=;
  b=C55l+wi8YR+5Gd5ehGejZxZNZfS00yArBe9pUzr+Bzf3glwNb6PW8nHU
   JkAOO1/d+tPknVUVuXr78EZQyelbdzvKGfz+Y5x8mOA1IXQi73hvUZYrP
   S4C1QeTule+el0xcezXRCd/8bm2Okhkmg/uKKaV3bFODa75ZbeuNxWQzn
   wc4UI5CSSykrLTIABeNearhINqjnHPUXxfWv5q6D56uCkw3lgrHFb14Ec
   nvvCKIr0EUatCAj4o3ZY2jhghCP4YmlieNQXkxqiYhLZ+g+pl8inhxJAd
   l71g2KEOUpCsRJfPq9oyqDS4R1cpCnd3XxLE90cjFIf2+YjlJtGQBV8Ya
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="377538851"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="377538851"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 13:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="824431714"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="824431714"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Oct 2023 13:50:25 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvOM3-0008HG-2Q;
	Tue, 24 Oct 2023 20:50:23 +0000
Date: Wed, 25 Oct 2023 04:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 2903/15770]
 drivers/i2c/busses/i2c-imx.c:157:34: warning: 'pinmux_of_match' defined but
 not used
Message-ID: <202310250414.BYATwusC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: cc89a9735f9cf19937652cb62b84b906fec3e804 [2903/15770] i2c: imx: implement bus recovery with gpio for Layerscape
config: x86_64-buildonly-randconfig-004-20231025 (https://download.01.org/0day-ci/archive/20231025/202310250414.BYATwusC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250414.BYATwusC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250414.BYATwusC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-imx.c: In function 'i2c_imx_xfer_common':
   drivers/i2c/busses/i2c-imx.c:1343:14: warning: unused variable 'enable_runtime_pm' [-Wunused-variable]
    1343 |         bool enable_runtime_pm = false;
         |              ^~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx.c: At top level:
>> drivers/i2c/busses/i2c-imx.c:157:34: warning: 'pinmux_of_match' defined but not used [-Wunused-const-variable=]
     157 | static const struct of_device_id pinmux_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~


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
