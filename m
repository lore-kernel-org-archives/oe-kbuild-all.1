Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CC9125AC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 14:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693491622; x=1725027622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y2euEez5c5Ax8K+T9imAFysIr5DB3YLiAz7v4DhtQ24=;
  b=Vd9PQz2Lc6s01zftTp/WGSvFQWnnjlYllt8oBQ4F0VOZeQaigz185cGM
   mWZesRRcHUWpcfZUO5+AQSoA81w3zYDjKGpxkaAsY/YsvaXy9H/lwluFN
   Ly/a3mo+9TGmBAnywmGbt/ewaxfvMWe7mh8z43nzFykurVMGTcovhR4cQ
   llGI9CKIQIjNtBzWXQI+AmFWjBGwI3lKyvXV6Q0C0byVMx2eh6kri6o/v
   RTRwnroSPU3ZByXeHQfu/ok0qB1z1aZH6u3hJoBv6nclyT/zYLJ+oJvT+
   6eW0U7nvzLnIl1Olujp67RfvXiMj9z5E9j7Z1pi/9uJAve3q7OUtPyBaf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355455772"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="355455772"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:12:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733124888"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="733124888"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Aug 2023 07:12:52 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbiPi-0000ER-0d;
	Thu, 31 Aug 2023 14:12:50 +0000
Date: Thu, 31 Aug 2023 22:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6075/24603]
 drivers/staging/media/imx/imx8-mipi-csi2.c:1361:13: warning:
 'mipi_csi2_runtime_resume' defined but not used
Message-ID: <202308312258.1dZNSJ75-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 9d223b25631248abffac9224668cf0e22ddbd99e [6075/24603] Merge remote-tracking branch 'origin/capture/media-dev' into capture/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308312258.1dZNSJ75-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312258.1dZNSJ75-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312258.1dZNSJ75-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/imx/imx8-mipi-csi2.c:1361:13: warning: 'mipi_csi2_runtime_resume' defined but not used [-Wunused-function]
    1361 | static int  mipi_csi2_runtime_resume(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2.c:1353:13: warning: 'mipi_csi2_runtime_suspend' defined but not used [-Wunused-function]
    1353 | static int  mipi_csi2_runtime_suspend(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2.c:1348:13: warning: 'mipi_csi2_pm_resume' defined but not used [-Wunused-function]
    1348 | static int  mipi_csi2_pm_resume(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-mipi-csi2.c:1335:13: warning: 'mipi_csi2_pm_suspend' defined but not used [-Wunused-function]
    1335 | static int  mipi_csi2_pm_suspend(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-mipi-csi2.c:1172:46: warning: 'mipi_csi2_sd_internal_ops' defined but not used [-Wunused-const-variable=]
    1172 | static const struct v4l2_subdev_internal_ops mipi_csi2_sd_internal_ops = {
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/staging/media/imx/imx8-isi-core.c: In function 'mxc_isi_imx8mn_parse_resets':
>> drivers/staging/media/imx/imx8-isi-core.c:346:13: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     346 |         u32 len, rstc_num = 0;
         |             ^~~
   drivers/staging/media/imx/imx8-isi-core.c: At top level:
>> drivers/staging/media/imx/imx8-isi-core.c:840:12: warning: 'mxc_isi_runtime_resume' defined but not used [-Wunused-function]
     840 | static int mxc_isi_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-core.c:830:12: warning: 'mxc_isi_runtime_suspend' defined but not used [-Wunused-function]
     830 | static int mxc_isi_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-core.c:825:12: warning: 'mxc_isi_pm_resume' defined but not used [-Wunused-function]
     825 | static int mxc_isi_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-core.c:813:12: warning: 'mxc_isi_pm_suspend' defined but not used [-Wunused-function]
     813 | static int mxc_isi_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~


vim +/mipi_csi2_runtime_resume +1361 drivers/staging/media/imx/imx8-mipi-csi2.c

bc54aa15d96d92 Guoniu.zhou 2019-01-21  1334  
bc54aa15d96d92 Guoniu.zhou 2019-01-21 @1335  static int  mipi_csi2_pm_suspend(struct device *dev)
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1336  {
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1337  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1338  	struct mxc_mipi_csi2_dev *csi2dev = sd_to_mxc_mipi_csi2_dev(sd);
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1339  
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1340  	if (csi2dev->running > 0) {
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1341  		dev_warn(dev, "running, prevent entering suspend.\n");
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1342  		return -EAGAIN;
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1343  	}
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1344  
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1345  	return pm_runtime_force_suspend(dev);
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1346  }
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1347  
bc54aa15d96d92 Guoniu.zhou 2019-01-21 @1348  static int  mipi_csi2_pm_resume(struct device *dev)
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1349  {
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1350  	return pm_runtime_force_resume(dev);
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1351  }
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1352  
bc54aa15d96d92 Guoniu.zhou 2019-01-21 @1353  static int  mipi_csi2_runtime_suspend(struct device *dev)
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1354  {
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1355  	struct mxc_mipi_csi2_dev *csi2dev = dev_get_drvdata(dev);
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1356  
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1357  	mipi_csi2_clk_disable(csi2dev);
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1358  	return 0;
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1359  }
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1360  
bc54aa15d96d92 Guoniu.zhou 2019-01-21 @1361  static int  mipi_csi2_runtime_resume(struct device *dev)
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1362  {
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1363  	struct mxc_mipi_csi2_dev *csi2dev = dev_get_drvdata(dev);
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1364  	int ret;
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1365  
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1366  	ret = mipi_csi2_clk_enable(csi2dev);
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1367  	if (ret)
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1368  		return ret;
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1369  
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1370  	return 0;
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1371  }
bc54aa15d96d92 Guoniu.zhou 2019-01-21  1372  

:::::: The code at line 1361 was first introduced by commit
:::::: bc54aa15d96d92760e83902d03e628e35a5a2274 media: staging: csi: add mipi csi driver support for IMX8

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
