Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8723C5662
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693560334; x=1725096334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BDf9ufRSVfxWmKYI0/njeQqYL2YhuvSXcjVEzrQgqw4=;
  b=NrTY9jFL9Oztjg/Yh/zcVKOdmK9ON5zJXuvx5L/fVFxWY+UjYOubBdDC
   MY2iCcN39jV2B5aVRt9U67ECvo43PCKEbxw/pKYotGHVyr408BpQAifmD
   crhCVzQd86vm1PKr4Zh/nloWkVhSAytJhPMdtcCYB+BpEqBSnSBTfu/wX
   LII/L4DYgU5p5gDyZlWEDo86qiJMBHjJJPUAZAcHmuY45l1GQRDweOvrN
   I5ASwTUzLu0gQqC4gNxRbpmAsiVp8NodsSMSxFtXKpMgvV1IkiGSslqDn
   pf7lJAmadevVr+W9BI3Gn9AHekX8ZHebc0ZfTwleAkkilVBVt3ux7tjAu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440157755"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="440157755"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 02:25:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863489978"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="863489978"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Sep 2023 02:25:32 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc0PC-00018D-1X;
	Fri, 01 Sep 2023 09:25:30 +0000
Date: Fri, 1 Sep 2023 17:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 15326/24604]
 drivers/leds/leds-pca995x.c:280:34: warning: unused variable
 'of_pca995x_match'
Message-ID: <202309011704.J0x8CbYl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: 8d95b5f8d03c993efd374d585823eefe84138d2c [15326/24604] LF-6247-3: driver: leds: pca995x: Add support for PCA995X chips
config: x86_64-buildonly-randconfig-006-20230901 (https://download.01.org/0day-ci/archive/20230901/202309011704.J0x8CbYl-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011704.J0x8CbYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011704.J0x8CbYl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-pca995x.c:280:34: warning: unused variable 'of_pca995x_match' [-Wunused-const-variable]
   static const struct of_device_id of_pca995x_match[] = {
                                    ^
   1 warning generated.


vim +/of_pca995x_match +280 drivers/leds/leds-pca995x.c

   279	
 > 280	static const struct of_device_id of_pca995x_match[] = {
   281		{.compatible = "nxp,pca9955btw", .data = (void *) pca9955btw},
   282		{.compatible = "nxp,pca995xtw",  .data = (void *) pca995xtw},
   283		{},
   284	};
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
