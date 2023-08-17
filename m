Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4264B3C10
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 09:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692264844; x=1723800844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0xBFrhEuAniaNwPlx3QcyqXq/Baf7B1QMc1z2gmM/Hc=;
  b=UjoA7p3bBciBn17A98zDgm5V1RZtGZ45ghq/SNtv8zEPDvDUlfP0xzNw
   ZIawIKOz6ZMiPZixvcYGbPEYggJnTUUWjP83i6F2n4Ulb9+8zzEW0bpy6
   uPf693X8HWlVd4wVlYlRjRVPevKbWGxGPCCoJa0QcLT/g1bPGBv5tvNNk
   yhHo3WxsCWF+xbzec1eZ2eEvOxA3Ne7JJpdVBAoYzv1OqYbDJBbNnu0iE
   2DM4PQKeagRkenlZoUiiH884myFu/qTCvSd6uah38N5HH1S0SyuUD+Kq+
   RsuXNqbAXLZLjzkzvGORXTRG8qY7X0H8PP2gdILmL8EECAYKfOcbK0WZI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403743054"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="403743054"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 02:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="728068761"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="728068761"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2023 02:33:59 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWZOA-00010N-16;
	Thu, 17 Aug 2023 09:33:58 +0000
Date: Thu, 17 Aug 2023 17:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vinod Koul <vkoul@kernel.org>, Stephen Boyd <swboyd@chromium.org>
Subject: [stable:linux-5.15.y 6018/9999]
 drivers/phy/qualcomm/phy-qcom-qmp.c:2928: warning: Function parameter or
 member 'usb_phy' not described in 'qcom_qmp'
Message-ID: <202308171705.faxuzPKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: e58df87394be1b4a4e72760ae99461c1e3828073 [6018/9999] phy: qcom-qmp-combo: fix broken power on
config: h8300-randconfig-r022-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171705.faxuzPKe-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171705.faxuzPKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171705.faxuzPKe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-qmp.c:2890: warning: Function parameter or member 'dp_aux_cfg' not described in 'qmp_phy'
   drivers/phy/qualcomm/phy-qcom-qmp.c:2890: warning: Function parameter or member 'dp_opts' not described in 'qmp_phy'
   drivers/phy/qualcomm/phy-qcom-qmp.c:2890: warning: Function parameter or member 'dp_clks' not described in 'qmp_phy'
>> drivers/phy/qualcomm/phy-qcom-qmp.c:2928: warning: Function parameter or member 'usb_phy' not described in 'qcom_qmp'


vim +2928 drivers/phy/qualcomm/phy-qcom-qmp.c

e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2897  
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2898  /**
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2899   * struct qcom_qmp - structure holding QMP phy block attributes
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2900   *
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2901   * @dev: device
efb05a50c956b4 drivers/phy/qualcomm/phy-qcom-qmp.c Manu Gautam  2018-01-16  2902   * @dp_com: iomapped memory space for phy's dp_com control block
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2903   *
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2904   * @clks: array of clocks required by phy
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2905   * @resets: array of resets required by phy
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2906   * @vregs: regulator supplies bulk data
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2907   *
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2908   * @phys: array of per-lane phy descriptors
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2909   * @phy_mutex: mutex lock for PHY common block initialization
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2910   * @init_count: phy common block initialization count
c9b589791fc1b3 drivers/phy/qualcomm/phy-qcom-qmp.c Evan Green   2019-03-21  2911   * @ufs_reset: optional UFS PHY reset handle
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2912   */
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2913  struct qcom_qmp {
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2914  	struct device *dev;
efb05a50c956b4 drivers/phy/qualcomm/phy-qcom-qmp.c Manu Gautam  2018-01-16  2915  	void __iomem *dp_com;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2916  
10939b10741d2f drivers/phy/qualcomm/phy-qcom-qmp.c Vivek Gautam 2018-01-16  2917  	struct clk_bulk_data *clks;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2918  	struct reset_control **resets;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2919  	struct regulator_bulk_data *vregs;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2920  
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2921  	struct qmp_phy **phys;
e58df87394be1b drivers/phy/qualcomm/phy-qcom-qmp.c Johan Hovold 2023-02-03  2922  	struct qmp_phy *usb_phy;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2923  
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2924  	struct mutex phy_mutex;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2925  	int init_count;
c9b589791fc1b3 drivers/phy/qualcomm/phy-qcom-qmp.c Evan Green   2019-03-21  2926  
c9b589791fc1b3 drivers/phy/qualcomm/phy-qcom-qmp.c Evan Green   2019-03-21  2927  	struct reset_control *ufs_reset;
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06 @2928  };
e78f3d15e115e8 drivers/phy/phy-qcom-qmp.c          Vivek Gautam 2017-04-06  2929  

:::::: The code at line 2928 was first introduced by commit
:::::: e78f3d15e115e8e764d4b1562b4fa538f2e22f6b phy: qcom-qmp: new qmp phy driver for qcom-chipsets

:::::: TO: Vivek Gautam <vivek.gautam@codeaurora.org>
:::::: CC: Kishon Vijay Abraham I <kishon@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
