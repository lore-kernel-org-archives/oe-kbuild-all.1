Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD6615CB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 02:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKJ36Ihb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697338346; x=1728874346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vMGHm7W1O5zXZ7jr/yrMBa2h1V16n9Br+7dgdGC0jVc=;
  b=gKJ36IhbZLZFWcEVSFwUcJlcndRsQI3Nx/KfDhxq/EOh6l9PyHUMvk1P
   CzYi0P+HYcK7Mc7U0PTojE3Qs7rCEAFd0uKBQmSMH+lq6b9lNRlnhxeoa
   9rgQhbYAuxgHwotcZOObz4fVygjIno2iAITKwwATatsiaLV1/dq+mQI+i
   Qs+6FeJKN3rIuzwhoM7Q8psxGlIcPPEzakJCmCeZwm7vLPppEnqrdaVYe
   3Y7xKnlmWkZP2HI6J33P8VUPSc9q/Q3qb+Z331z6IechcfUgBFt7IO0G2
   0X/T7Jy9kFVHGgToK83K6FZuzxPeo7rioGNoCIuVVkU/nLPbxzko4wTk8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389220933"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389220933"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 19:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="705144336"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="705144336"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Oct 2023 19:52:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrrEn-0006xP-1L;
	Sun, 15 Oct 2023 02:52:17 +0000
Date: Sun, 15 Oct 2023 10:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2215/30000]
 drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1260:12: warning:
 'mipi_csis_runtime_resume' defined but not used
Message-ID: <202310151013.wZMd2FUi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: b8cb1caf1eba91d5f9686af6a089da4380cf9c12 [2215/30000] Merge remote-tracking branch 'origin/capture/mxc' into capture/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151013.wZMd2FUi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151013.wZMd2FUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151013.wZMd2FUi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/mxc_mipi_csi.c: In function 'mipi_csis_probe':
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1070:29: warning: variable 'mipi_sd' set but not used [-Wunused-but-set-variable]
    1070 |         struct v4l2_subdev *mipi_sd;
         |                             ^~~~~~~
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c: At top level:
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1260:12: warning: 'mipi_csis_runtime_resume' defined but not used [-Wunused-function]
    1260 | static int mipi_csis_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1255:12: warning: 'mipi_csis_runtime_suspend' defined but not used [-Wunused-function]
    1255 | static int mipi_csis_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mipi_csis_runtime_resume +1260 drivers/media/platform/mxc/capture/mxc_mipi_csi.c

29cf1a9a4c9797 Robby Cai 2019-09-27  1254  
29cf1a9a4c9797 Robby Cai 2019-09-27 @1255  static int mipi_csis_runtime_suspend(struct device *dev)
29cf1a9a4c9797 Robby Cai 2019-09-27  1256  {
29cf1a9a4c9797 Robby Cai 2019-09-27  1257  	return mipi_csis_pm_suspend(dev, true);
29cf1a9a4c9797 Robby Cai 2019-09-27  1258  }
29cf1a9a4c9797 Robby Cai 2019-09-27  1259  
29cf1a9a4c9797 Robby Cai 2019-09-27 @1260  static int mipi_csis_runtime_resume(struct device *dev)
29cf1a9a4c9797 Robby Cai 2019-09-27  1261  {
29cf1a9a4c9797 Robby Cai 2019-09-27  1262  	return mipi_csis_pm_resume(dev, true);
29cf1a9a4c9797 Robby Cai 2019-09-27  1263  }
29cf1a9a4c9797 Robby Cai 2019-09-27  1264  

:::::: The code at line 1260 was first introduced by commit
:::::: 29cf1a9a4c9797cb4db57075129b226f51ee06e6 media: mipi csi: add samsung's mipi csi support

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
