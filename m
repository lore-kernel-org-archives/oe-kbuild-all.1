Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7F41FA0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 04:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694406215; x=1725942215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5YeNdzj3Jf/II7HRjwPf+GVNy6Sw8XS40n02pDqCnMI=;
  b=A9umH4ymK2QZxsHQr2QTXCD0q0Z43pkBziS3pIxH8tLxe4qyvvykNmAp
   y/ExOqzCm1PX1vEurkQIsk4x/JBcMp1bXGezB8hBFHU3oSiPyiST8a7zg
   b7tFwxrriSvn+yQK2MB1iu0Tme+EipOs4g2mT1qOrEbm/Km2Dz+/Q3uV2
   SqOvXAYeIJJ0ccS5if18CIy3ak3bD88oUmxJJnpkZhfN/38W3DIEOXQta
   PNAQ7/pKfTDsL2/pDs+d942xgy+tjFv/IVVIMbzpXtd0AA2oc5JcGpnMy
   xAjXa9zUUk5I4vg5VphMDTOB2ygj32ECEdmysxpPzGsO/RHG8LTP1qau+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="381793753"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="381793753"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 21:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="808685406"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="808685406"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Sep 2023 21:23:33 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfYSQ-0005mu-2V;
	Mon, 11 Sep 2023 04:23:30 +0000
Date: Mon, 11 Sep 2023 12:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: drivers/thermal/qcom/tsens-v0_1.c:296:31: warning: 'ops_v0_1'
 defined but not used
Message-ID: <202309111222.B4qyTl1x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: 6812d1dfbca99cd5032683354bf50e0002b2aa02 thermal/drivers/qcom/tsens-v0_1: Fix mdm9607 slope values
date:   3 months ago
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230911/202309111222.B4qyTl1x-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111222.B4qyTl1x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111222.B4qyTl1x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/qcom/tsens-v0_1.c:296:31: warning: 'ops_v0_1' defined but not used [-Wunused-const-variable=]
     296 | static const struct tsens_ops ops_v0_1 = {
         |                               ^~~~~~~~


vim +/ops_v0_1 +296 drivers/thermal/qcom/tsens-v0_1.c

c19970548edc35 Amit Kucheria    2019-03-20  295  
51d78b8b1beba2 Dmitry Baryshkov 2023-01-01 @296  static const struct tsens_ops ops_v0_1 = {
51d78b8b1beba2 Dmitry Baryshkov 2023-01-01  297  	.init		= init_common,
51d78b8b1beba2 Dmitry Baryshkov 2023-01-01  298  	.calibrate	= tsens_calibrate_common,
51d78b8b1beba2 Dmitry Baryshkov 2023-01-01  299  	.get_temp	= get_temp_common,
51d78b8b1beba2 Dmitry Baryshkov 2023-01-01  300  };
51d78b8b1beba2 Dmitry Baryshkov 2023-01-01  301  

:::::: The code at line 296 was first introduced by commit
:::::: 51d78b8b1beba247e1e4314420d98acb0732c4b7 thermal/drivers/tsens: Drop single-cell code for mdm9607

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
