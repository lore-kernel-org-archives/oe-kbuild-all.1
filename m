Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6D57E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 05:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXfLM70E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697261578; x=1728797578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DBBC/2rlh5kFBE4v03EUXAnX7VS89NNT1PD6/PGf60s=;
  b=MXfLM70E9VljC6c6aiyrSR8rNmXRtCPpwplVLGOSQgz134sNeI5lb5LS
   6jOkHBY93uXtle3YXNDgAkRoMFLHLEuFSOErCzNbMu+9wTQevS+ay0weE
   kuvJKBI8IoGnnfTb9enfcrQRjZ5sHlmBFexIrIkxYQfQyr4exxGigIRKS
   1w0HgbGA+uY0KLmpACZqHRW8WhhueY2ZoEeO5fmFU0qpLvmj29d+nCQDC
   JjETdTyJ2sh8zEOejqHhWTQtUpGQW18opF2oDZGISkcUNOU/l/Xelhhce
   Aygh3B0zvon5PGAJEo08dZjK5jL4TD40DeHivby18oJ4rojBS2fcnxt5V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388159161"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="388159161"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 22:32:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758725616"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="758725616"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Oct 2023 22:32:56 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrXGg-0005jz-2k;
	Sat, 14 Oct 2023 05:32:54 +0000
Date: Sat, 14 Oct 2023 13:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4743/15768]
 drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function
 parameter or member 'fwnode' not described in 'csi_state'
Message-ID: <202310141339.pmzkixNP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: b3bbdb2a80a2895f190786815f3c3b9cf7123ee6 [4743/15768] Merge remote-tracking branch 'origin/capture/mxc' into capture/next
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310141339.pmzkixNP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141339.pmzkixNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141339.pmzkixNP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'dev' not described in 'csi_state'
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'mipi_sd' not described in 'csi_state'
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'sensor_sd' not described in 'csi_state'
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'v4l2_dev' not described in 'csi_state'
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'mipi_clk' not described in 'csi_state'
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'phy_clk' not described in 'csi_state'
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'disp_axi' not described in 'csi_state'
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'disp_apb' not described in 'csi_state'
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'clk_frequency' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'fwnode' not described in 'csi_state'
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'subdev_notifier' not described in 'csi_state'
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'hw_reset' not described in 'csi_state'
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'mipi_phy_regulator' not described in 'csi_state'


vim +294 drivers/media/platform/mxc/capture/mxc_mipi_csi.c

4399e4b7ed5e4e Robby Cai   2019-09-27  231  
4399e4b7ed5e4e Robby Cai   2019-09-27  232  /**
4399e4b7ed5e4e Robby Cai   2019-09-27  233   * struct csi_state - the driver's internal state data structure
4399e4b7ed5e4e Robby Cai   2019-09-27  234   * @lock: mutex serializing the subdev and power management operations,
4399e4b7ed5e4e Robby Cai   2019-09-27  235   *        protecting @format and @flags members
4399e4b7ed5e4e Robby Cai   2019-09-27  236   * @sd: v4l2_subdev associated with CSIS device instance
4399e4b7ed5e4e Robby Cai   2019-09-27  237   * @index: the hardware instance index
4399e4b7ed5e4e Robby Cai   2019-09-27  238   * @pdev: CSIS platform device
4399e4b7ed5e4e Robby Cai   2019-09-27  239   * @phy: pointer to the CSIS generic PHY
4399e4b7ed5e4e Robby Cai   2019-09-27  240   * @regs: mmaped I/O registers memory
4399e4b7ed5e4e Robby Cai   2019-09-27  241   * @supplies: CSIS regulator supplies
4399e4b7ed5e4e Robby Cai   2019-09-27  242   * @clock: CSIS clocks
4399e4b7ed5e4e Robby Cai   2019-09-27  243   * @irq: requested s5p-mipi-csis irq number
4399e4b7ed5e4e Robby Cai   2019-09-27  244   * @flags: the state variable for power and streaming control
4399e4b7ed5e4e Robby Cai   2019-09-27  245   * @clock_frequency: device bus clock frequency
4399e4b7ed5e4e Robby Cai   2019-09-27  246   * @hs_settle: HS-RX settle time
4399e4b7ed5e4e Robby Cai   2019-09-27  247   * @clk_settle: Clk settle time
4399e4b7ed5e4e Robby Cai   2019-09-27  248   * @num_lanes: number of MIPI-CSI data lanes used
4399e4b7ed5e4e Robby Cai   2019-09-27  249   * @max_num_lanes: maximum number of MIPI-CSI data lanes supported
4399e4b7ed5e4e Robby Cai   2019-09-27  250   * @wclk_ext: CSI wrapper clock: 0 - bus clock, 1 - external SCLK_CAM
4399e4b7ed5e4e Robby Cai   2019-09-27  251   * @csis_fmt: current CSIS pixel format
4399e4b7ed5e4e Robby Cai   2019-09-27  252   * @format: common media bus format for the source and sink pad
4399e4b7ed5e4e Robby Cai   2019-09-27  253   * @slock: spinlock protecting structure members below
4399e4b7ed5e4e Robby Cai   2019-09-27  254   * @pkt_buf: the frame embedded (non-image) data buffer
4399e4b7ed5e4e Robby Cai   2019-09-27  255   * @events: MIPI-CSIS event (error) counters
4399e4b7ed5e4e Robby Cai   2019-09-27  256   */
4399e4b7ed5e4e Robby Cai   2019-09-27  257  struct csi_state {
4399e4b7ed5e4e Robby Cai   2019-09-27  258  	struct mutex lock;
4399e4b7ed5e4e Robby Cai   2019-09-27  259  	struct device		*dev;
4399e4b7ed5e4e Robby Cai   2019-09-27  260  	struct v4l2_subdev mipi_sd;
4399e4b7ed5e4e Robby Cai   2019-09-27  261  	struct v4l2_subdev *sensor_sd;
4399e4b7ed5e4e Robby Cai   2019-09-27  262  	struct v4l2_device	v4l2_dev;
4399e4b7ed5e4e Robby Cai   2019-09-27  263  
4399e4b7ed5e4e Robby Cai   2019-09-27  264  	u8 index;
4399e4b7ed5e4e Robby Cai   2019-09-27  265  	struct platform_device *pdev;
4399e4b7ed5e4e Robby Cai   2019-09-27  266  	struct phy *phy;
4399e4b7ed5e4e Robby Cai   2019-09-27  267  	void __iomem *regs;
4399e4b7ed5e4e Robby Cai   2019-09-27  268  	struct clk *mipi_clk;
4399e4b7ed5e4e Robby Cai   2019-09-27  269  	struct clk *phy_clk;
4399e4b7ed5e4e Robby Cai   2019-09-27  270  	struct clk *disp_axi;
4399e4b7ed5e4e Robby Cai   2019-09-27  271  	struct clk *disp_apb;
4399e4b7ed5e4e Robby Cai   2019-09-27  272  	int irq;
4399e4b7ed5e4e Robby Cai   2019-09-27  273  	u32 flags;
4399e4b7ed5e4e Robby Cai   2019-09-27  274  
4399e4b7ed5e4e Robby Cai   2019-09-27  275  	u32 clk_frequency;
4399e4b7ed5e4e Robby Cai   2019-09-27  276  	u32 hs_settle;
4399e4b7ed5e4e Robby Cai   2019-09-27  277  	u32 clk_settle;
4399e4b7ed5e4e Robby Cai   2019-09-27  278  	u32 num_lanes;
4399e4b7ed5e4e Robby Cai   2019-09-27  279  	u32 max_num_lanes;
4399e4b7ed5e4e Robby Cai   2019-09-27  280  	u8 wclk_ext;
4399e4b7ed5e4e Robby Cai   2019-09-27  281  
4399e4b7ed5e4e Robby Cai   2019-09-27  282  	const struct csis_pix_format *csis_fmt;
4399e4b7ed5e4e Robby Cai   2019-09-27  283  	struct v4l2_mbus_framefmt format;
4399e4b7ed5e4e Robby Cai   2019-09-27  284  
4399e4b7ed5e4e Robby Cai   2019-09-27  285  	spinlock_t slock;
4399e4b7ed5e4e Robby Cai   2019-09-27  286  	struct csis_pktbuf pkt_buf;
4399e4b7ed5e4e Robby Cai   2019-09-27  287  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
4399e4b7ed5e4e Robby Cai   2019-09-27  288  
acc894f31bdbff Guoniu.zhou 2021-03-29  289  	struct fwnode_handle *fwnode;
4399e4b7ed5e4e Robby Cai   2019-09-27  290  	struct v4l2_async_notifier  subdev_notifier;
4399e4b7ed5e4e Robby Cai   2019-09-27  291  
4399e4b7ed5e4e Robby Cai   2019-09-27  292  	struct csis_hw_reset hw_reset;
4399e4b7ed5e4e Robby Cai   2019-09-27  293  	struct regulator     *mipi_phy_regulator;
4399e4b7ed5e4e Robby Cai   2019-09-27 @294  };
4399e4b7ed5e4e Robby Cai   2019-09-27  295  

:::::: The code at line 294 was first introduced by commit
:::::: 4399e4b7ed5e4e59c729e6fad98470977ccba862 media: mipi csi: add samsung's mipi csi support

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
