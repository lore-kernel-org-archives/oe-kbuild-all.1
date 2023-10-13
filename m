Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514D5224CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 17:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoZ5zC5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697219046; x=1728755046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m848iwOf/svkfpNm2zSvDCh3UdDSCqiuwiTUE1sxKMg=;
  b=EoZ5zC5WR+un75jL74ke2VZD0Dh2dQKDxTjtDeZRYyZVPalX+tCRq0Gi
   5VBAQRaHr6xUQSNzllaZbl8g2v75TM4MGAIKCRDMt8jxOL2tFjXDMklwO
   6wZuWw70L82rObqoq8Mb8+oNKCOHb1xYNqIStjVkmRx6FXQzwqJu5veMe
   2YZHje71gRc058QXOrpAUyPfLXO0NfEzvyoPj4SIhP7mhNqov+c8+hpp6
   rQTPXacExWMf3iSMqh+NqsyA2urgQv8ieSiU89fZmsiYFaxqma81nEJnm
   e6yQShP/gP97sHbfSwCyaDo5GGdYRDnlIKTSkMKh9YgNOD9BQ/X0WG5f/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365492935"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="365492935"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 10:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898645062"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="898645062"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2023 10:42:09 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrMCc-0005Cp-1I;
	Fri, 13 Oct 2023 17:43:58 +0000
Date: Sat, 14 Oct 2023 01:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 259/15768]
 drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function
 parameter or member 'csi_pclk' not described in 'csi_state'
Message-ID: <202310140152.9al0oPdK-lkp@intel.com>
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
commit: 6d567ec4864b92b7ecf5ded76fe55c04f26ab4e7 [259/15768] LF-6810-03: media: Samsung CSI2: fix build error due to API renamed
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140152.9al0oPdK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140152.9al0oPdK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140152.9al0oPdK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'dev' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'v4l2_dev' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'pads' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'mipi_clk' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'disp_axi' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'disp_apb' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'csi_pclk' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'csi_aclk' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'clk_frequency' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'vchannel' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'asd' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'subdev_notifier' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'async_subdevs' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'hw_reset' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'mipi_phy_regulator' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'gasket' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'mix_gpr' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'soft_resetn' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'clk_enable' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'mipi_reset' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'csi_rst_pclk' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'csi_rst_aclk' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'pdata' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'hdr' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'val' not described in 'csi_state'


vim +447 drivers/staging/media/imx/imx8-mipi-csi2-sam.c

d6d0fbf683aa60f Guoniu.zhou 2019-10-25  367  
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  368  /**
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  369   * struct csi_state - the driver's internal state data structure
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  370   * @lock: mutex serializing the subdev and power management operations,
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  371   *        protecting @format and @flags members
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  372   * @sd: v4l2_subdev associated with CSIS device instance
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  373   * @index: the hardware instance index
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  374   * @pdev: CSIS platform device
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  375   * @phy: pointer to the CSIS generic PHY
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  376   * @regs: mmaped I/O registers memory
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  377   * @supplies: CSIS regulator supplies
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  378   * @clock: CSIS clocks
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  379   * @irq: requested s5p-mipi-csis irq number
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  380   * @flags: the state variable for power and streaming control
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  381   * @clock_frequency: device bus clock frequency
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  382   * @hs_settle: HS-RX settle time
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  383   * @clk_settle: Clk settle time
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  384   * @num_lanes: number of MIPI-CSI data lanes used
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  385   * @max_num_lanes: maximum number of MIPI-CSI data lanes supported
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  386   * @wclk_ext: CSI wrapper clock: 0 - bus clock, 1 - external SCLK_CAM
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  387   * @csis_fmt: current CSIS pixel format
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  388   * @format: common media bus format for the source and sink pad
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  389   * @slock: spinlock protecting structure members below
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  390   * @pkt_buf: the frame embedded (non-image) data buffer
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  391   * @events: MIPI-CSIS event (error) counters
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  392   */
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  393  struct csi_state {
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  394  	struct v4l2_subdev	sd;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  395  	struct mutex lock;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  396  	struct device		*dev;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  397  	struct v4l2_device	v4l2_dev;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  398  
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  399  	struct media_pad pads[MIPI_CSIS_VCX_PADS_NUM];
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  400  
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  401  	u8 index;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  402  	struct platform_device *pdev;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  403  	struct phy *phy;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  404  	void __iomem *regs;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  405  	struct clk *mipi_clk;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  406  	struct clk *disp_axi;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  407  	struct clk *disp_apb;
373f27d40275826 Guoniu.zhou 2020-08-21  408  	struct clk *csi_pclk;
373f27d40275826 Guoniu.zhou 2020-08-21  409  	struct clk *csi_aclk;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  410  	int irq;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  411  	u32 flags;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  412  
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  413  	u32 clk_frequency;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  414  	u32 hs_settle;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  415  	u32 clk_settle;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  416  	u32 num_lanes;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  417  	u32 max_num_lanes;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  418  	u8 wclk_ext;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  419  
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  420  	u8 vchannel;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  421  	const struct csis_pix_format *csis_fmt;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  422  	struct v4l2_mbus_framefmt format;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  423  
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  424  	spinlock_t slock;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  425  	struct csis_pktbuf pkt_buf;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  426  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  427  
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  428  	struct v4l2_async_subdev    asd;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  429  	struct v4l2_async_notifier  subdev_notifier;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  430  	struct v4l2_async_subdev    *async_subdevs[2];
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  431  
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  432  	struct csis_hw_reset1 hw_reset;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  433  	struct regulator     *mipi_phy_regulator;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  434  
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  435  	struct regmap *gasket;
2a3a46265af56f2 Guoniu.zhou 2020-09-18  436  	struct regmap *mix_gpr;
2a3a46265af56f2 Guoniu.zhou 2020-09-18  437  
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  438  	struct reset_control *soft_resetn;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  439  	struct reset_control *clk_enable;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  440  	struct reset_control *mipi_reset;
373f27d40275826 Guoniu.zhou 2020-08-21  441  	struct reset_control *csi_rst_pclk;
373f27d40275826 Guoniu.zhou 2020-08-21  442  	struct reset_control *csi_rst_aclk;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  443  
4d5e92874cef37a Guoniu.zhou 2020-08-21  444  	struct mipi_csis_pdata const *pdata;
2a3a46265af56f2 Guoniu.zhou 2020-09-18  445  	bool hdr;
09be5179f636b35 Alice Yuan  2022-02-21  446  	u32 val;
d6d0fbf683aa60f Guoniu.zhou 2019-10-25 @447  };
d6d0fbf683aa60f Guoniu.zhou 2019-10-25  448  

:::::: The code at line 447 was first introduced by commit
:::::: d6d0fbf683aa60f8d27adaab7b5e54343d90d6f6 staging: media: imx: add V4L2 subdev driver for MIPI CSI2 of Samsung

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
