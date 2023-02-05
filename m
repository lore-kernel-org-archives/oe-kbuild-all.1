Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3198A28E8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 11:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675596560; x=1707132560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gzUbC22S/fdWrLv9R32X3z3yGCDnFyzIGXsn2KT1ti8=;
  b=Eb2t9/OzCECTsw2Qeq4uJJ9l7Jl2uuTIJvmKqpBAk4wZU1055aQBLF7I
   wgx8xWPplKjnqtAECkeBUNSFMvJXqoF7+hVe/XLoBjLKt3t6NeDUy9Aqq
   kXk3vivptpf1qPfg/NkZD275JA/MgfxzscH1la6DFG9MyWHCpSzulcbWD
   qAupbd8btOWOHm1bcj9zGlLFDrphZIAWep1/1uEK595AgBdJC/P8SXUlJ
   IDeJfg/dD53mPr/OOr4ji0F9etF2sICb/kHJhfE/X4cFQ66y37M0KZZci
   9sUJWOJKU/bQlWcyxIsEe1YMeHdfEfStVmFkNfigwAP30+TxpqWzacFUT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="356388354"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="356388354"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 03:29:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="995004226"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="995004226"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Feb 2023 03:29:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOdCv-0001y4-24;
	Sun, 05 Feb 2023 11:29:17 +0000
Date: Sun, 5 Feb 2023 19:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 1629/20208] drivers/dma/mxs-dma.c:914:5:
 warning: no previous prototype for 'mxs_dma_runtime_suspend'
Message-ID: <202302051924.D7wisx3F-lkp@intel.com>
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
commit: 1b639120f160cd2a1a0fa6528d4cb721b94708c3 [1629/20208] LF-251-1: dma: mxs-dma: enable runtime PM for mxs-dma
config: ia64-buildonly-randconfig-r004-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051924.D7wisx3F-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/1b639120f160cd2a1a0fa6528d4cb721b94708c3
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 1b639120f160cd2a1a0fa6528d4cb721b94708c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/dma/ drivers/irqchip/ drivers/mtd/nand/raw/gpmi-nand/ drivers/pci/controller/mobiveil/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/dma/mxs-dma.c: In function 'mxs_dma_remove':
   drivers/dma/mxs-dma.c:879:9: error: implicit declaration of function 'dma_pool_destroy' [-Werror=implicit-function-declaration]
     879 |         dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
         |         ^~~~~~~~~~~~~~~~
   drivers/dma/mxs-dma.c:879:47: error: 'struct mxs_dma_chan' has no member named 'ccw_pool'
     879 |         dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
         |                                               ^
   drivers/dma/mxs-dma.c:885:25: error: 'struct mxs_dma_chan' has no member named 'ccw_pool'
     885 |                 mxs_chan->ccw_pool = NULL;
         |                         ^~
   drivers/dma/mxs-dma.c: At top level:
>> drivers/dma/mxs-dma.c:914:5: warning: no previous prototype for 'mxs_dma_runtime_suspend' [-Wmissing-prototypes]
     914 | int mxs_dma_runtime_suspend(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dma/mxs-dma.c:923:5: warning: no previous prototype for 'mxs_dma_runtime_resume' [-Wmissing-prototypes]
     923 | int mxs_dma_runtime_resume(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mxs_dma_runtime_suspend +914 drivers/dma/mxs-dma.c

   913	
 > 914	int mxs_dma_runtime_suspend(struct device *dev)
   915	{
   916		struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
   917	
   918		clk_disable_unprepare(mxs_dma->clk);
   919	
   920		return 0;
   921	}
   922	
 > 923	int mxs_dma_runtime_resume(struct device *dev)
   924	{
   925		struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
   926		int ret;
   927	
   928		ret = clk_prepare_enable(mxs_dma->clk);
   929		if (ret) {
   930			dev_err(&mxs_dma->pdev->dev, "failed to enable the clock\n");
   931			return ret;
   932		}
   933	
   934		return 0;
   935	}
   936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
