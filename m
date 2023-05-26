Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6779E523D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 08:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685091268; x=1716627268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vw3O5UXo3z65hb+Np0fSlFAY04ltCc7fUJRSN21pptg=;
  b=lwX9AMemCwZeQDDET1eLM0wIQBgK6N6BCQzCW4LPRdhJ66tP6oYLrq6b
   /qHqmnB0ng0h/UBAry1TbeUdBrf8WMRCn2Ueti2vRYf3APJ0csUvX41zS
   9k9GbNBblMePV60WgPdLfV7D6QnV8mPUs3n3y8AYe5m5/Cf0TxOlfC7tj
   ABqlbeV14cjye8/w3KAM+3HpTFASlQ1Gk1XviUGGBdvqcu6ZGedeU29kC
   zbGI8Fo66WkbQmMD+gqSu5ZOiQW7veLuYp9VOFvpq7Tw5eiVSunQQ5+fl
   UlwcoZYwW98C+zFkdD2QS1W4GaLZTgoVo+kwadIsOrz0kP2cPeCd94y9c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="419910075"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="419910075"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 01:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="682659652"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="682659652"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 May 2023 01:54:24 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2TDL-000JCL-33;
	Fri, 26 May 2023 08:54:23 +0000
Date: Fri, 26 May 2023 16:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 4750/9879]
 drivers/staging/media/imx/imx8-isi-core.c:349:13: warning: variable 'len'
 set but not used
Message-ID: <202305261608.eqwUfy01-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: aa6e8979d728efcceef49ae02440bdda255e04e8 [4750/9879] Merge remote-tracking branch 'origin/capture/media-dev' into capture/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230526/202305261608.eqwUfy01-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/aa6e8979d728efcceef49ae02440bdda255e04e8
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout aa6e8979d728efcceef49ae02440bdda255e04e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/firmware/imx/ drivers/gpu/drm/imx/ drivers/input/touchscreen/ drivers/media/platform/chips-media/ drivers/mfd/ drivers/spi/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261608.eqwUfy01-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-isi-core.c: In function 'mxc_isi_imx8mn_parse_resets':
>> drivers/staging/media/imx/imx8-isi-core.c:349:13: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     349 |         u32 len, rstc_num = 0;
         |             ^~~
   drivers/staging/media/imx/imx8-isi-core.c: At top level:
   drivers/staging/media/imx/imx8-isi-core.c:846:12: warning: 'mxc_isi_runtime_resume' defined but not used [-Wunused-function]
     846 | static int mxc_isi_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-isi-core.c:836:12: warning: 'mxc_isi_runtime_suspend' defined but not used [-Wunused-function]
     836 | static int mxc_isi_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-isi-core.c:831:12: warning: 'mxc_isi_pm_resume' defined but not used [-Wunused-function]
     831 | static int mxc_isi_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-isi-core.c:819:12: warning: 'mxc_isi_pm_suspend' defined but not used [-Wunused-function]
     819 | static int mxc_isi_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~


vim +/len +349 drivers/staging/media/imx/imx8-isi-core.c

1f5ffc7afd13e4 Guoniu.zhou 2019-10-25  339  
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  340  static int mxc_isi_imx8mn_parse_resets(struct mxc_isi_dev *mxc_isi)
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  341  {
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  342  	int ret;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  343  	struct device *dev = &mxc_isi->pdev->dev;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  344  	struct device_node *np = dev->of_node;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  345  	struct device_node *parent, *child;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  346  	struct of_phandle_args args;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  347  	struct reset_control *rstc;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  348  	const char *compat;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21 @349  	u32 len, rstc_num = 0;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  350  
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  351  	ret = of_parse_phandle_with_args(np, "resets", "#reset-cells",
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  352  					 0, &args);
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  353  	if (ret)
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  354  		return ret;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  355  
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  356  	parent = args.np;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  357  	for_each_child_of_node(parent, child) {
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  358  		compat = of_get_property(child, "compatible", NULL);
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  359  		if (!compat)
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  360  			continue;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  361  
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  362  		rstc = of_reset_control_array_get(child, false, false, true);
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  363  		if (IS_ERR(rstc))
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  364  			continue;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  365  
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  366  		len = strlen(compat);
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  367  		if (!of_compat_cmp("isi,soft-resetn", compat, len)) {
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  368  			mxc_isi->soft_resetn = rstc;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  369  			rstc_num++;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  370  		} else if (!of_compat_cmp("isi,clk-enable", compat, len)) {
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  371  			mxc_isi->clk_enable = rstc;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  372  			rstc_num++;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  373  		} else {
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  374  			dev_warn(dev, "invalid isi reset node: %s\n", compat);
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  375  		}
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  376  	}
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  377  
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  378  	if (!rstc_num) {
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  379  		dev_err(dev, "no invalid reset control exists\n");
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  380  		return -EINVAL;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  381  	}
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  382  
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  383  	of_node_put(parent);
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  384  	return 0;
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  385  }
ab0c4f88bcf554 Guoniu.zhou 2020-08-21  386  

:::::: The code at line 349 was first introduced by commit
:::::: ab0c4f88bcf554a3b19150c9e7b0a14973ca00ed LF-2264-4: staging: media: isi: add clocks and resets for ISI of IMX8MN

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
