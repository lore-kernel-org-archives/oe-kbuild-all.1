Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CBC8C05
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682978477; x=1714514477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I28H4rU4gPCOYp4K9p5O0wbwad5zoEOFUwLXmzdxE5M=;
  b=kRGPnHusCO0k0FXi4t0qBUmtG01XTpqSBVGfkvG6qkEkp7IamzhX9lKS
   Oqhq2ZWn3Gyoaej42JSTl+QpCB2Qx9c0Nc2HeejZJIHcCa1yp5aS4oKVr
   x7MzatRbbDVkPm2qcxqP8L+HKxCjyMyPPcB3itIhb86vgvQIgW2SqjrYl
   Os0g0+bhaZTPGG44lWG0VglOHBYbT+WLYP1usrt1a6QHi+zpA/MKjnLNy
   RdmD2o2WdPTgQQ6DvBffIjxgyLM7FgWHWLjBT8ONMTURrPr4ukQ5wAiPj
   /PSZ/J4RrcV8CwatFJrAzvgPYzEnuXHljVXxv5TWobjRsezYtryzER8gD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="413682066"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="413682066"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 15:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="807590324"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="807590324"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 May 2023 15:01:16 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptba7-0000fl-16;
	Mon, 01 May 2023 22:01:15 +0000
Date: Tue, 2 May 2023 06:00:40 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 59/59]
 drivers/gpu/drm/sti/sti_drv.c:238:18: warning: assignment to 'struct
 device_node *' from 'int' makes pointer from integer without a cast
Message-ID: <202305020512.BAZSQVXH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   7637af07fc9dd17bd0f6c2df329ea6da853c0e38
commit: 7637af07fc9dd17bd0f6c2df329ea6da853c0e38 [59/59] of: header cleanups
config: arm-randconfig-r046-20230501 (https://download.01.org/0day-ci/archive/20230502/202305020512.BAZSQVXH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=7637af07fc9dd17bd0f6c2df329ea6da853c0e38
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 7637af07fc9dd17bd0f6c2df329ea6da853c0e38
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/omapdrm/ drivers/gpu/drm/sti/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020512.BAZSQVXH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/omapdrm/dss/dss.c: In function 'dss_probe':
>> drivers/gpu/drm/omapdrm/dss/dss.c:1492:13: error: implicit declaration of function 'of_platform_populate' [-Werror=implicit-function-declaration]
    1492 |         r = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/omapdrm/dss/dss.c:1509:9: error: implicit declaration of function 'of_platform_depopulate' [-Werror=implicit-function-declaration]
    1509 |         of_platform_depopulate(&pdev->dev);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/sti/sti_drv.c: In function 'sti_platform_probe':
>> drivers/gpu/drm/sti/sti_drv.c:238:20: error: implicit declaration of function 'of_get_next_available_child' [-Werror=implicit-function-declaration]
     238 |         child_np = of_get_next_available_child(node, NULL);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/sti/sti_drv.c:238:18: warning: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     238 |         child_np = of_get_next_available_child(node, NULL);
         |                  ^
   drivers/gpu/drm/sti/sti_drv.c:243:26: warning: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     243 |                 child_np = of_get_next_available_child(node, child_np);
         |                          ^
   cc1: some warnings being treated as errors


vim +238 drivers/gpu/drm/sti/sti_drv.c

9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  226  
9e1f05b28009ca drivers/gpu/drm/sti/sti_drv.c     Vincent Abriou    2015-07-31  227  static int sti_platform_probe(struct platform_device *pdev)
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  228  {
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  229  	struct device *dev = &pdev->dev;
53bdcf5f026c56 drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2015-07-17  230  	struct device_node *node = dev->of_node;
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  231  	struct device_node *child_np;
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  232  	struct component_match *match = NULL;
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  233  
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  234  	dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  235  
ac7d3af84b24eb drivers/gpu/drm/sti/sti_drv.c     Benjamin Gaignard 2017-02-24  236  	devm_of_platform_populate(dev);
53bdcf5f026c56 drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2015-07-17  237  
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31 @238  	child_np = of_get_next_available_child(node, NULL);
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  239  
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  240  	while (child_np) {
50a912a8660243 drivers/gpu/drm/sti/sti_drv.c     Yong Wu           2022-02-14  241  		drm_of_component_match_add(dev, &match, component_compare_of,
97ac0e47aed5f6 drivers/gpu/drm/sti/sti_drv.c     Russell King      2016-10-19  242  					   child_np);
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  243  		child_np = of_get_next_available_child(node, child_np);
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  244  	}
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  245  
9e1f05b28009ca drivers/gpu/drm/sti/sti_drv.c     Vincent Abriou    2015-07-31  246  	return component_master_add_with_match(dev, &sti_ops, match);
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  247  }
9bbf86fe874cce drivers/gpu/drm/sti/sti_drm_drv.c Benjamin Gaignard 2014-07-31  248  

:::::: The code at line 238 was first introduced by commit
:::::: 9bbf86fe874cce0169f0e1152d96f0591e680874 drm: sti: Add DRM driver itself

:::::: TO: Benjamin Gaignard <benjamin.gaignard@linaro.org>
:::::: CC: Benjamin Gaignard <benjamin.gaignard@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
