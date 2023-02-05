Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5930023B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 09:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675590379; x=1707126379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CzScO4DDQ0sdGCqLxbDNDawqIS7YCRHMacCe/0+GV0Y=;
  b=GCGF+xTkwjhRSEFzB0F2XO0oKCzEj4PhP2WmODKpX89GezSotSikf0rI
   SLJo+IWGQb19HDt2APtCXwKx1wbWH6sGR/NWd0REoFmgCkAws3qSnJJxS
   NqJELvR61xoyJnK4XJMkkWZyUzTK+QoX9ApDvrbmG+o3wDeCbiCCkpFu0
   bmr6Y1Js4cN+lyHpcG3+R+IM34BPUwz6/pSNKBz07uWmGIvMHOwLCkvGi
   0IrZ4y44lsKXsnNzPGi1WiWIrFffmb/XMuDDilQJgHpyl33A8MrlaZBMs
   wCb/esmrDNxOoF9bR/hSJ8521vAyZrZWM+V5khZQnFKukgrkW+POvjF2X
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="317036569"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="317036569"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 01:46:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="729725830"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="729725830"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Feb 2023 01:46:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pObbD-0001us-1t;
	Sun, 05 Feb 2023 09:46:15 +0000
Date: Sun, 5 Feb 2023 17:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 1629/20208] drivers/dma/mxs-dma.c:914:5:
 warning: no previous prototype for function 'mxs_dma_runtime_suspend'
Message-ID: <202302051706.z3JPdPRE-lkp@intel.com>
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
config: powerpc-buildonly-randconfig-r005-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051706.z3JPdPRE-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/Freescale/linux-fslc/commit/1b639120f160cd2a1a0fa6528d4cb721b94708c3
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 1b639120f160cd2a1a0fa6528d4cb721b94708c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/dma/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/soc/fsl/dpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/dma/mxs-dma.c:879:2: error: implicit declaration of function 'dma_pool_destroy' [-Werror,-Wimplicit-function-declaration]
           dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
           ^
   drivers/dma/mxs-dma.c:879:41: error: no member named 'ccw_pool' in 'struct mxs_dma_chan'
           dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
                            ~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/dma/mxs-dma.c:885:13: error: no member named 'ccw_pool' in 'struct mxs_dma_chan'
                   mxs_chan->ccw_pool = NULL;
                   ~~~~~~~~  ^
>> drivers/dma/mxs-dma.c:914:5: warning: no previous prototype for function 'mxs_dma_runtime_suspend' [-Wmissing-prototypes]
   int mxs_dma_runtime_suspend(struct device *dev)
       ^
   drivers/dma/mxs-dma.c:914:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mxs_dma_runtime_suspend(struct device *dev)
   ^
   static 
>> drivers/dma/mxs-dma.c:923:5: warning: no previous prototype for function 'mxs_dma_runtime_resume' [-Wmissing-prototypes]
   int mxs_dma_runtime_resume(struct device *dev)
       ^
   drivers/dma/mxs-dma.c:923:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mxs_dma_runtime_resume(struct device *dev)
   ^
   static 
   2 warnings and 3 errors generated.


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
