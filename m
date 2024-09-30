Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6DE433B6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704639; cv=none; b=KgM2XoO9mbTJ9SFAVyPwrsi5WPqFU5QHOJ4g13YXf1AkXwi4cyKKq2uWLEqoTcU6TAWYZZes5WXY0/sveCXMCpGHLQZJDfgGJzxF0W2VABe778jeoNVYcfmnl4BbllzTQO0scY2+TS3vFSOAgClcUb5ErtD80X2s8V7MQgX7STI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704639; c=relaxed/simple;
	bh=mOqwrGGmp0tZEsvC8WxxFDzR+itfH+LFYOZi6F25WrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g1xIFGLRhLbRGexuAjprK3jR1tZHPUVnhlUYQuMScJWH83MEQQPJ8Xb34ulrjV9VtBqAqxOhCxj1zuNfStntLnMaC//epv+3+JqpdSZticVjrFis4VNeH25SJl3H4fUUKd47huyMvOajlhek5CZm/JqW7T6kfvfiyD/JEu312mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZpvAPB1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZpvAPB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727704637; x=1759240637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mOqwrGGmp0tZEsvC8WxxFDzR+itfH+LFYOZi6F25WrI=;
  b=dZpvAPB1aBDfetwFA1va6xbAgx/rMtW9Lt69dtp1PsEAGHGzUJOsKYWN
   E1bnQgfMCdTwfa+IfNbReVewi8kHozkLIV8Inl/8SfT4AQDVFmbB9cIf5
   op/Hbpm1+D2HZ8fcE3VUmW1owPDY6s/QsJ3I+Xjh15OyYu02Bj7zJE2F+
   Lhz7sdTKr/tW225sLpeAHI19oR15autL8AUHqjcOp1eK8Vo8hKUYwFZi5
   Mlr5mChnDaj6CihisFJqP2En/5mg0pvB1ovSdD12RTtsSjuaq9BaTg3vi
   kgBirVd1L7anGNJo3oA9Bpr+RkkBSZlwgHFMPCTtjHg9JvMOlcrxbqYyi
   A==;
X-CSE-ConnectionGUID: zp217UGkQLqaGC4FyimMDg==
X-CSE-MsgGUID: qrr2NwnpS86L9NBGTOokkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37376709"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="37376709"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 06:57:16 -0700
X-CSE-ConnectionGUID: j2fjAxJcQJWpI1BWdZYGeA==
X-CSE-MsgGUID: 5vc4FpilRrycG63rbpiGIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="77384747"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2024 06:57:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svGtk-000PWR-32;
	Mon, 30 Sep 2024 13:57:12 +0000
Date: Mon, 30 Sep 2024 21:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5783/16788]
 drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function
 parameter or member 'v4l2_dev' not described in 'csi_state'
Message-ID: <202409302153.mpa32Ir5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 980c9b12d176da5063b63180f6d4af6ae4ed72f9 [5783/16788] Merge remote-tracking branch 'origin/capture/mxc' into capture/next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240930/202409302153.mpa32Ir5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409302153.mpa32Ir5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409302153.mpa32Ir5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/mxc_mipi_csi.c: In function 'mipi_csis_probe':
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1073:29: warning: variable 'mipi_sd' set but not used [-Wunused-but-set-variable]
    1073 |         struct v4l2_subdev *mipi_sd;
         |                             ^~~~~~~
--
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'dev' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'mipi_sd' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'sensor_sd' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'v4l2_dev' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'mipi_clk' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'phy_clk' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'disp_axi' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'disp_apb' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'clk_frequency' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'fwnode' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'subdev_notifier' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'hw_reset' not described in 'csi_state'
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:294: warning: Function parameter or member 'mipi_phy_regulator' not described in 'csi_state'


vim +294 drivers/media/platform/mxc/capture/mxc_mipi_csi.c

234dcc3e17a39b Robby Cai   2019-09-27  231  
234dcc3e17a39b Robby Cai   2019-09-27  232  /**
234dcc3e17a39b Robby Cai   2019-09-27  233   * struct csi_state - the driver's internal state data structure
234dcc3e17a39b Robby Cai   2019-09-27  234   * @lock: mutex serializing the subdev and power management operations,
234dcc3e17a39b Robby Cai   2019-09-27  235   *        protecting @format and @flags members
234dcc3e17a39b Robby Cai   2019-09-27  236   * @sd: v4l2_subdev associated with CSIS device instance
234dcc3e17a39b Robby Cai   2019-09-27  237   * @index: the hardware instance index
234dcc3e17a39b Robby Cai   2019-09-27  238   * @pdev: CSIS platform device
234dcc3e17a39b Robby Cai   2019-09-27  239   * @phy: pointer to the CSIS generic PHY
234dcc3e17a39b Robby Cai   2019-09-27  240   * @regs: mmaped I/O registers memory
234dcc3e17a39b Robby Cai   2019-09-27  241   * @supplies: CSIS regulator supplies
234dcc3e17a39b Robby Cai   2019-09-27  242   * @clock: CSIS clocks
234dcc3e17a39b Robby Cai   2019-09-27  243   * @irq: requested s5p-mipi-csis irq number
234dcc3e17a39b Robby Cai   2019-09-27  244   * @flags: the state variable for power and streaming control
234dcc3e17a39b Robby Cai   2019-09-27  245   * @clock_frequency: device bus clock frequency
234dcc3e17a39b Robby Cai   2019-09-27  246   * @hs_settle: HS-RX settle time
234dcc3e17a39b Robby Cai   2019-09-27  247   * @clk_settle: Clk settle time
234dcc3e17a39b Robby Cai   2019-09-27  248   * @num_lanes: number of MIPI-CSI data lanes used
234dcc3e17a39b Robby Cai   2019-09-27  249   * @max_num_lanes: maximum number of MIPI-CSI data lanes supported
234dcc3e17a39b Robby Cai   2019-09-27  250   * @wclk_ext: CSI wrapper clock: 0 - bus clock, 1 - external SCLK_CAM
234dcc3e17a39b Robby Cai   2019-09-27  251   * @csis_fmt: current CSIS pixel format
234dcc3e17a39b Robby Cai   2019-09-27  252   * @format: common media bus format for the source and sink pad
234dcc3e17a39b Robby Cai   2019-09-27  253   * @slock: spinlock protecting structure members below
234dcc3e17a39b Robby Cai   2019-09-27  254   * @pkt_buf: the frame embedded (non-image) data buffer
234dcc3e17a39b Robby Cai   2019-09-27  255   * @events: MIPI-CSIS event (error) counters
234dcc3e17a39b Robby Cai   2019-09-27  256   */
234dcc3e17a39b Robby Cai   2019-09-27  257  struct csi_state {
234dcc3e17a39b Robby Cai   2019-09-27  258  	struct mutex lock;
234dcc3e17a39b Robby Cai   2019-09-27  259  	struct device		*dev;
234dcc3e17a39b Robby Cai   2019-09-27  260  	struct v4l2_subdev mipi_sd;
234dcc3e17a39b Robby Cai   2019-09-27  261  	struct v4l2_subdev *sensor_sd;
234dcc3e17a39b Robby Cai   2019-09-27  262  	struct v4l2_device	v4l2_dev;
234dcc3e17a39b Robby Cai   2019-09-27  263  
234dcc3e17a39b Robby Cai   2019-09-27  264  	u8 index;
234dcc3e17a39b Robby Cai   2019-09-27  265  	struct platform_device *pdev;
234dcc3e17a39b Robby Cai   2019-09-27  266  	struct phy *phy;
234dcc3e17a39b Robby Cai   2019-09-27  267  	void __iomem *regs;
234dcc3e17a39b Robby Cai   2019-09-27  268  	struct clk *mipi_clk;
234dcc3e17a39b Robby Cai   2019-09-27  269  	struct clk *phy_clk;
234dcc3e17a39b Robby Cai   2019-09-27  270  	struct clk *disp_axi;
234dcc3e17a39b Robby Cai   2019-09-27  271  	struct clk *disp_apb;
234dcc3e17a39b Robby Cai   2019-09-27  272  	int irq;
234dcc3e17a39b Robby Cai   2019-09-27  273  	u32 flags;
234dcc3e17a39b Robby Cai   2019-09-27  274  
234dcc3e17a39b Robby Cai   2019-09-27  275  	u32 clk_frequency;
234dcc3e17a39b Robby Cai   2019-09-27  276  	u32 hs_settle;
234dcc3e17a39b Robby Cai   2019-09-27  277  	u32 clk_settle;
234dcc3e17a39b Robby Cai   2019-09-27  278  	u32 num_lanes;
234dcc3e17a39b Robby Cai   2019-09-27  279  	u32 max_num_lanes;
234dcc3e17a39b Robby Cai   2019-09-27  280  	u8 wclk_ext;
234dcc3e17a39b Robby Cai   2019-09-27  281  
234dcc3e17a39b Robby Cai   2019-09-27  282  	const struct csis_pix_format *csis_fmt;
234dcc3e17a39b Robby Cai   2019-09-27  283  	struct v4l2_mbus_framefmt format;
234dcc3e17a39b Robby Cai   2019-09-27  284  
234dcc3e17a39b Robby Cai   2019-09-27  285  	spinlock_t slock;
234dcc3e17a39b Robby Cai   2019-09-27  286  	struct csis_pktbuf pkt_buf;
234dcc3e17a39b Robby Cai   2019-09-27  287  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
234dcc3e17a39b Robby Cai   2019-09-27  288  
8eeda6869b9431 Guoniu.zhou 2021-03-29  289  	struct fwnode_handle *fwnode;
234dcc3e17a39b Robby Cai   2019-09-27  290  	struct v4l2_async_notifier  subdev_notifier;
234dcc3e17a39b Robby Cai   2019-09-27  291  
234dcc3e17a39b Robby Cai   2019-09-27  292  	struct csis_hw_reset hw_reset;
234dcc3e17a39b Robby Cai   2019-09-27  293  	struct regulator     *mipi_phy_regulator;
234dcc3e17a39b Robby Cai   2019-09-27 @294  };
234dcc3e17a39b Robby Cai   2019-09-27  295  

:::::: The code at line 294 was first introduced by commit
:::::: 234dcc3e17a39b8b44df1b1f3b804862902bad3c media: mipi csi: add samsung's mipi csi support

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
