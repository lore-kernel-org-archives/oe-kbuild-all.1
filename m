Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6691C27
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 06:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675493617; x=1707029617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SXQj6X0phHSZEn2oLXzL4H2mprT3b2lOEGx1O0iDdE8=;
  b=e0q/WAOpv9o4BWHDuZXTlE4gdCgnhDs4cSeBo3hcHmGuYH5MjQ86P0DM
   4AdAOseQcMhy1LCHE1ecnVn+xNB26FYEeH67ENa/geghmhx7H82n8Rwl3
   695Q4jJ2QWQ3PkhC4pzgJ85BeACdG44xpJumTQ+yxxBq54QkVocF56P6/
   k4F4CPRKzVmk09B4HmWY7EDn0/GikuyJyJnYdcuIieFGioKtPWtbUFTy5
   Nj2XxUHPfiOPp97tcEInsi55t2AByFM5X8KZm+hJs7lxmaN+/93k/6c91
   /LaFIx5DSkQHLbcoTLwF51ggYoXSvDUKveIwgPEr6AfeCWhoB6Tg/qfyD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="309258046"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="309258046"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 22:53:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="774582772"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="774582772"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 22:53:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOCQZ-00017F-0I;
	Sat, 04 Feb 2023 06:53:35 +0000
Date: Sat, 4 Feb 2023 14:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6075/20209]
 drivers/staging/media/imx/imx8-isi-core.c:346:13: warning: variable 'len'
 set but not used
Message-ID: <202302041457.74ebKmgk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: 9d223b25631248abffac9224668cf0e22ddbd99e [6075/20209] Merge remote-tracking branch 'origin/capture/media-dev' into capture/next
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230204/202302041457.74ebKmgk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/9d223b25631248abffac9224668cf0e22ddbd99e
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 9d223b25631248abffac9224668cf0e22ddbd99e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/firmware/imx/ drivers/gpu/drm/imx/ drivers/irqchip/ drivers/mfd/ drivers/soc/imx/ drivers/spi/ drivers/staging/media/imx/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-isi-core.c: In function 'mxc_isi_imx8mn_parse_resets':
>> drivers/staging/media/imx/imx8-isi-core.c:346:13: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     346 |         u32 len, rstc_num = 0;
         |             ^~~
   drivers/staging/media/imx/imx8-isi-core.c: At top level:
   drivers/staging/media/imx/imx8-isi-core.c:840:12: warning: 'mxc_isi_runtime_resume' defined but not used [-Wunused-function]
     840 | static int mxc_isi_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-isi-core.c:830:12: warning: 'mxc_isi_runtime_suspend' defined but not used [-Wunused-function]
     830 | static int mxc_isi_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-isi-core.c:825:12: warning: 'mxc_isi_pm_resume' defined but not used [-Wunused-function]
     825 | static int mxc_isi_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-isi-core.c:813:12: warning: 'mxc_isi_pm_suspend' defined but not used [-Wunused-function]
     813 | static int mxc_isi_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~


vim +/len +346 drivers/staging/media/imx/imx8-isi-core.c

676d51a2b26317 Guoniu.zhou 2019-10-25  336  
c8368d8520f624 Guoniu.zhou 2020-08-21  337  static int mxc_isi_imx8mn_parse_resets(struct mxc_isi_dev *mxc_isi)
c8368d8520f624 Guoniu.zhou 2020-08-21  338  {
c8368d8520f624 Guoniu.zhou 2020-08-21  339  	int ret;
c8368d8520f624 Guoniu.zhou 2020-08-21  340  	struct device *dev = &mxc_isi->pdev->dev;
c8368d8520f624 Guoniu.zhou 2020-08-21  341  	struct device_node *np = dev->of_node;
c8368d8520f624 Guoniu.zhou 2020-08-21  342  	struct device_node *parent, *child;
c8368d8520f624 Guoniu.zhou 2020-08-21  343  	struct of_phandle_args args;
c8368d8520f624 Guoniu.zhou 2020-08-21  344  	struct reset_control *rstc;
c8368d8520f624 Guoniu.zhou 2020-08-21  345  	const char *compat;
c8368d8520f624 Guoniu.zhou 2020-08-21 @346  	u32 len, rstc_num = 0;
c8368d8520f624 Guoniu.zhou 2020-08-21  347  
c8368d8520f624 Guoniu.zhou 2020-08-21  348  	ret = of_parse_phandle_with_args(np, "resets", "#reset-cells",
c8368d8520f624 Guoniu.zhou 2020-08-21  349  					 0, &args);
c8368d8520f624 Guoniu.zhou 2020-08-21  350  	if (ret)
c8368d8520f624 Guoniu.zhou 2020-08-21  351  		return ret;
c8368d8520f624 Guoniu.zhou 2020-08-21  352  
c8368d8520f624 Guoniu.zhou 2020-08-21  353  	parent = args.np;
c8368d8520f624 Guoniu.zhou 2020-08-21  354  	for_each_child_of_node(parent, child) {
c8368d8520f624 Guoniu.zhou 2020-08-21  355  		compat = of_get_property(child, "compatible", NULL);
c8368d8520f624 Guoniu.zhou 2020-08-21  356  		if (!compat)
c8368d8520f624 Guoniu.zhou 2020-08-21  357  			continue;
c8368d8520f624 Guoniu.zhou 2020-08-21  358  
c8368d8520f624 Guoniu.zhou 2020-08-21  359  		rstc = of_reset_control_array_get(child, false, false, true);
c8368d8520f624 Guoniu.zhou 2020-08-21  360  		if (IS_ERR(rstc))
c8368d8520f624 Guoniu.zhou 2020-08-21  361  			continue;
c8368d8520f624 Guoniu.zhou 2020-08-21  362  
c8368d8520f624 Guoniu.zhou 2020-08-21  363  		len = strlen(compat);
c8368d8520f624 Guoniu.zhou 2020-08-21  364  		if (!of_compat_cmp("isi,soft-resetn", compat, len)) {
c8368d8520f624 Guoniu.zhou 2020-08-21  365  			mxc_isi->soft_resetn = rstc;
c8368d8520f624 Guoniu.zhou 2020-08-21  366  			rstc_num++;
c8368d8520f624 Guoniu.zhou 2020-08-21  367  		} else if (!of_compat_cmp("isi,clk-enable", compat, len)) {
c8368d8520f624 Guoniu.zhou 2020-08-21  368  			mxc_isi->clk_enable = rstc;
c8368d8520f624 Guoniu.zhou 2020-08-21  369  			rstc_num++;
c8368d8520f624 Guoniu.zhou 2020-08-21  370  		} else {
c8368d8520f624 Guoniu.zhou 2020-08-21  371  			dev_warn(dev, "invalid isi reset node: %s\n", compat);
c8368d8520f624 Guoniu.zhou 2020-08-21  372  		}
c8368d8520f624 Guoniu.zhou 2020-08-21  373  	}
c8368d8520f624 Guoniu.zhou 2020-08-21  374  
c8368d8520f624 Guoniu.zhou 2020-08-21  375  	if (!rstc_num) {
c8368d8520f624 Guoniu.zhou 2020-08-21  376  		dev_err(dev, "no invalid reset control exists\n");
c8368d8520f624 Guoniu.zhou 2020-08-21  377  		return -EINVAL;
c8368d8520f624 Guoniu.zhou 2020-08-21  378  	}
c8368d8520f624 Guoniu.zhou 2020-08-21  379  
c8368d8520f624 Guoniu.zhou 2020-08-21  380  	of_node_put(parent);
c8368d8520f624 Guoniu.zhou 2020-08-21  381  	return 0;
c8368d8520f624 Guoniu.zhou 2020-08-21  382  }
c8368d8520f624 Guoniu.zhou 2020-08-21  383  

:::::: The code at line 346 was first introduced by commit
:::::: c8368d8520f624e6ca157a7d9ece332e57ff9d29 LF-2264-4: staging: media: isi: add clocks and resets for ISI of IMX8MN

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
