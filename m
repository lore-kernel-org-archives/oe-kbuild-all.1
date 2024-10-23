Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80621ADFE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 12:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729687858; cv=none; b=NsBP0RxpnA1nGOn4KcKx1rhEhbevcdrQ2GdTgo6u/2Pv16ojksMaomV8WXI3ODo9aEQmtvMCgzJgp+tjjurPcTuRqZYCP+CAY13ncrLYUVlwZJq3RUJDiRyaTVx65R1oM9AzqPuhDG8JoBfGvJ/Gd9cHLQBoDG6ln57tvR7qx6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729687858; c=relaxed/simple;
	bh=SrR4PU21E95CIjcXsPdaPkRcrBlM8aQ8PDzefFK1lgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sAMW0zgjNTpMdYnunEkHG+tuUr6/qbytHiOS3gzVfQVsly3Z0iTSfSlwl+cmHCy6ZvIXoQsnn4Emh2LWqY4v+t2XhrqsfzSvXpnBaSjAZLbqBNaju4t7SXJZ39P1d/eqQ8SIIIPAU7w7BYg+1zQfbfAt9F8V2AW6/5qG1BQXrpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dt368agD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dt368agD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729687857; x=1761223857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SrR4PU21E95CIjcXsPdaPkRcrBlM8aQ8PDzefFK1lgE=;
  b=Dt368agDNuHXhyuYBjIgTqevBp1QMQ7Kd5y07bGAhNF62NPoeCjmU1px
   znN5NpYb1e9uG7V+BkWVdH3atR8eBBxh1VvWKAnsEXzve6Y73w7jFbsUh
   FHeANvaBEjw51kIHTnzRUd/SwJv8laVuM9l96r0bQJfuF+7wjbYA/t129
   A2NyeLxSHViuQ8joezFzTdMKzXDD2DNerCs9XY9evl0TacMCoKbw/YJGF
   t6l8qV+O0om/1mzzpbAIDjQbyJ9NbjlEqYK3a1yQCxa9UDoMl4Wnm3zJu
   /p33NFRozxLV6j2zvm8E/CAHt7cw5rFSYopMM8fwILqjYo/gCgUm+PLYR
   Q==;
X-CSE-ConnectionGUID: dejlD2MqQ/2vj57SpHnRQA==
X-CSE-MsgGUID: Z0EqBxKVQOuEo6NS6bVGtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="32129295"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="32129295"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 05:50:56 -0700
X-CSE-ConnectionGUID: Kd0IveEtTPSAnZOf71uwLQ==
X-CSE-MsgGUID: 1tv8bmKYRxeQBZ0LpHVxDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="111026948"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2024 05:50:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3apA-000Uvy-0k;
	Wed, 23 Oct 2024 12:50:52 +0000
Date: Wed, 23 Oct 2024 20:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.1.x-imx 297/17820]
 drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function
 parameter or member 'dev' not described in 'csi_state'
Message-ID: <202410232010.CnWdMWqQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robby,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.1.x-imx
head:   47d927c130da97d140d1455103e3cacecef94807
commit: b98cd38283d88a37e1ff1e31b1d73ff40cb0e84f [297/17820] LF-9958-2 media: Samsung CSI2: fix build error due to API change
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241023/202410232010.CnWdMWqQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410232010.CnWdMWqQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410232010.CnWdMWqQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'dev' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'v4l2_dev' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'pads' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'mipi_clk' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'disp_axi' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'disp_apb' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'csi_pclk' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'csi_aclk' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'clk_frequency' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'vchannel' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'asd' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'subdev_notifier' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'async_subdevs' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'hw_reset' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'mipi_phy_regulator' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'gasket' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'mix_gpr' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'soft_resetn' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'clk_enable' not described in 'csi_state'
>> drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'mipi_reset' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'csi_rst_pclk' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'csi_rst_aclk' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'pdata' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'hdr' not described in 'csi_state'
   drivers/staging/media/imx/imx8-mipi-csi2-sam.c:447: warning: Function parameter or member 'val' not described in 'csi_state'


vim +447 drivers/staging/media/imx/imx8-mipi-csi2-sam.c

62a5cdad8dc357 Guoniu.zhou 2019-10-25  367  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  368  /**
62a5cdad8dc357 Guoniu.zhou 2019-10-25  369   * struct csi_state - the driver's internal state data structure
62a5cdad8dc357 Guoniu.zhou 2019-10-25  370   * @lock: mutex serializing the subdev and power management operations,
62a5cdad8dc357 Guoniu.zhou 2019-10-25  371   *        protecting @format and @flags members
62a5cdad8dc357 Guoniu.zhou 2019-10-25  372   * @sd: v4l2_subdev associated with CSIS device instance
62a5cdad8dc357 Guoniu.zhou 2019-10-25  373   * @index: the hardware instance index
62a5cdad8dc357 Guoniu.zhou 2019-10-25  374   * @pdev: CSIS platform device
62a5cdad8dc357 Guoniu.zhou 2019-10-25  375   * @phy: pointer to the CSIS generic PHY
62a5cdad8dc357 Guoniu.zhou 2019-10-25  376   * @regs: mmaped I/O registers memory
62a5cdad8dc357 Guoniu.zhou 2019-10-25  377   * @supplies: CSIS regulator supplies
62a5cdad8dc357 Guoniu.zhou 2019-10-25  378   * @clock: CSIS clocks
62a5cdad8dc357 Guoniu.zhou 2019-10-25  379   * @irq: requested s5p-mipi-csis irq number
62a5cdad8dc357 Guoniu.zhou 2019-10-25  380   * @flags: the state variable for power and streaming control
62a5cdad8dc357 Guoniu.zhou 2019-10-25  381   * @clock_frequency: device bus clock frequency
62a5cdad8dc357 Guoniu.zhou 2019-10-25  382   * @hs_settle: HS-RX settle time
62a5cdad8dc357 Guoniu.zhou 2019-10-25  383   * @clk_settle: Clk settle time
62a5cdad8dc357 Guoniu.zhou 2019-10-25  384   * @num_lanes: number of MIPI-CSI data lanes used
62a5cdad8dc357 Guoniu.zhou 2019-10-25  385   * @max_num_lanes: maximum number of MIPI-CSI data lanes supported
62a5cdad8dc357 Guoniu.zhou 2019-10-25  386   * @wclk_ext: CSI wrapper clock: 0 - bus clock, 1 - external SCLK_CAM
62a5cdad8dc357 Guoniu.zhou 2019-10-25  387   * @csis_fmt: current CSIS pixel format
62a5cdad8dc357 Guoniu.zhou 2019-10-25  388   * @format: common media bus format for the source and sink pad
62a5cdad8dc357 Guoniu.zhou 2019-10-25  389   * @slock: spinlock protecting structure members below
62a5cdad8dc357 Guoniu.zhou 2019-10-25  390   * @pkt_buf: the frame embedded (non-image) data buffer
62a5cdad8dc357 Guoniu.zhou 2019-10-25  391   * @events: MIPI-CSIS event (error) counters
62a5cdad8dc357 Guoniu.zhou 2019-10-25  392   */
62a5cdad8dc357 Guoniu.zhou 2019-10-25  393  struct csi_state {
62a5cdad8dc357 Guoniu.zhou 2019-10-25  394  	struct v4l2_subdev	sd;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  395  	struct mutex lock;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  396  	struct device		*dev;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  397  	struct v4l2_device	v4l2_dev;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  398  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  399  	struct media_pad pads[MIPI_CSIS_VCX_PADS_NUM];
62a5cdad8dc357 Guoniu.zhou 2019-10-25  400  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  401  	u8 index;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  402  	struct platform_device *pdev;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  403  	struct phy *phy;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  404  	void __iomem *regs;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  405  	struct clk *mipi_clk;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  406  	struct clk *disp_axi;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  407  	struct clk *disp_apb;
4bfff02e1918e1 Guoniu.zhou 2020-08-21  408  	struct clk *csi_pclk;
4bfff02e1918e1 Guoniu.zhou 2020-08-21  409  	struct clk *csi_aclk;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  410  	int irq;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  411  	u32 flags;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  412  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  413  	u32 clk_frequency;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  414  	u32 hs_settle;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  415  	u32 clk_settle;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  416  	u32 num_lanes;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  417  	u32 max_num_lanes;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  418  	u8 wclk_ext;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  419  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  420  	u8 vchannel;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  421  	const struct csis_pix_format *csis_fmt;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  422  	struct v4l2_mbus_framefmt format;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  423  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  424  	spinlock_t slock;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  425  	struct csis_pktbuf pkt_buf;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  426  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
62a5cdad8dc357 Guoniu.zhou 2019-10-25  427  
b98cd38283d88a Robby Cai   2023-08-25  428  	struct v4l2_async_connection asd;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  429  	struct v4l2_async_notifier  subdev_notifier;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  430  	struct v4l2_async_subdev    *async_subdevs[2];
62a5cdad8dc357 Guoniu.zhou 2019-10-25  431  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  432  	struct csis_hw_reset1 hw_reset;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  433  	struct regulator     *mipi_phy_regulator;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  434  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  435  	struct regmap *gasket;
c9a8facb73f674 Guoniu.zhou 2020-09-18  436  	struct regmap *mix_gpr;
c9a8facb73f674 Guoniu.zhou 2020-09-18  437  
62a5cdad8dc357 Guoniu.zhou 2019-10-25  438  	struct reset_control *soft_resetn;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  439  	struct reset_control *clk_enable;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  440  	struct reset_control *mipi_reset;
4bfff02e1918e1 Guoniu.zhou 2020-08-21  441  	struct reset_control *csi_rst_pclk;
4bfff02e1918e1 Guoniu.zhou 2020-08-21  442  	struct reset_control *csi_rst_aclk;
62a5cdad8dc357 Guoniu.zhou 2019-10-25  443  
b5f9e0b78a7186 Guoniu.zhou 2020-08-21  444  	struct mipi_csis_pdata const *pdata;
c9a8facb73f674 Guoniu.zhou 2020-09-18  445  	bool hdr;
d0d8bff2916a39 Alice Yuan  2022-02-21  446  	u32 val;
62a5cdad8dc357 Guoniu.zhou 2019-10-25 @447  };
62a5cdad8dc357 Guoniu.zhou 2019-10-25  448  

:::::: The code at line 447 was first introduced by commit
:::::: 62a5cdad8dc357a24f464407972456eff9290266 staging: media: imx: add V4L2 subdev driver for MIPI CSI2 of Samsung

:::::: TO: Guoniu.zhou <guoniu.zhou@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
