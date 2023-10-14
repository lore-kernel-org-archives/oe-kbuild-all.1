Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3884412B90
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 16:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtkCtCZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697300679; x=1728836679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lhC9EcU+9CVUtv/Ljt22OxRedV6aQDNnxzXRPdUiltQ=;
  b=JtkCtCZvWkiyhhpCh81ZZLD6CqpAVba9uyP/oP1ExprHagd42ls6qAfT
   sqwR89xlV+p/iAj5fjsywunofjIyf40eCV43kH9SINc3tn8Bn2oU2Ipti
   kqVNTsFST7vTibF3oJtMsiPfM5wtaGV2ZcrjJsZ/uSAmCjcdt4+1VEKo4
   PUy7YKjjaEZD+rdYmuWPqobgAs6GZ3sSFd7hyXeuiQKkknyq5accsRJXi
   OVvv54FPZvoQPKxqaDwsWrTpZZ5OrKFglmQyBDGXZeV3mUK6jpED52NW/
   +MV5n6aIgXQECFcWst/A45qcZxuzPwNcNAvH80dFn/HrSK0wjMiM2VYE2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370406624"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="370406624"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 09:24:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="821015718"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="821015718"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Oct 2023 09:24:37 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrhRJ-0006NH-2s;
	Sat, 14 Oct 2023 16:24:34 +0000
Date: Sun, 15 Oct 2023 00:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.4-2.3.x-imx 9339/30000]
 drivers/dma/imx-sdma.c:402: warning: Function parameter or member
 'terminated_node' not described in 'sdma_channel'
Message-ID: <202310150014.iBKl5Bla-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.4-2.3.x-imx
head:   bcde5677c4cabfef7080ffc2fef17275144a0517
commit: acf2a79f1f73b1cf59b2e3dc096ff4340cfe7687 [9339/30000] MLK-24071 dmaengine: imx-sdma: fix random channel stop
config: arm-randconfig-002-20231014 (https://download.01.org/0day-ci/archive/20231015/202310150014.iBKl5Bla-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150014.iBKl5Bla-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150014.iBKl5Bla-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/imx-sdma.c:402: warning: Function parameter or member 'terminated_node' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:402: warning: Function parameter or member 'slave_config' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:402: warning: Function parameter or member 'terminate_worker' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:402: warning: Function parameter or member 'is_ram_script' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:402: warning: Function parameter or member 'src_dualfifo' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:402: warning: Function parameter or member 'dst_dualfifo' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:402: warning: Function parameter or member 'fifo_num' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:402: warning: Function parameter or member 'sw_done' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:402: warning: Function parameter or member 'sw_done_sel' not described in 'sdma_channel'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARM_ERRATA_814220
   Depends on [n]: CPU_V7 [=n]
   Selected by [y]:
   - SOC_IMX7D [=y] && ARCH_MXC [=y] && (ARCH_MULTI_V7 [=n] || ARM_SINGLE_ARMV7M [=y])
   WARNING: unmet direct dependencies detected for INPUT_POLLDEV
   Depends on [m]: !UML && INPUT [=m]
   Selected by [y]:
   - MXC_MMA8451 [=y] && HWMON [=y] && I2C [=y]
   Selected by [m]:
   - SENSORS_LIS3LV02D [=m] && INPUT [=m]
   - KEYBOARD_CLPS711X [=m] && !UML && INPUT [=m] && INPUT_KEYBOARD [=y] && OF_GPIO [=y] && (ARCH_CLPS711X [=n] || COMPILE_TEST [=y])
   - TOUCHSCREEN_RASPBERRYPI_FW [=m] && !UML && INPUT [=m] && INPUT_TOUCHSCREEN [=y] && (RASPBERRYPI_FIRMWARE [=n] || RASPBERRYPI_FIRMWARE [=n]=n && COMPILE_TEST [=y])
   - TOUCHSCREEN_TPS6507X [=m] && !UML && INPUT [=m] && INPUT_TOUCHSCREEN [=y] && I2C [=y]


vim +402 drivers/dma/imx-sdma.c

76c33d27073e29 Sascha Hauer  2018-06-20  342  
1ec1e82f2510e2 Sascha Hauer  2010-09-30  343  /**
1ec1e82f2510e2 Sascha Hauer  2010-09-30  344   * struct sdma_channel - housekeeping for a SDMA channel
1ec1e82f2510e2 Sascha Hauer  2010-09-30  345   *
24ca312dd66329 Robin Gong    2018-07-04  346   * @vc:			virt_dma base structure
24ca312dd66329 Robin Gong    2018-07-04  347   * @desc:		sdma description including vd and other special member
24ca312dd66329 Robin Gong    2018-07-04  348   * @sdma:		pointer to the SDMA engine for this channel
24ca312dd66329 Robin Gong    2018-07-04  349   * @channel:		the channel number, matches dmaengine chan_id + 1
24ca312dd66329 Robin Gong    2018-07-04  350   * @direction:		transfer type. Needed for setting SDMA script
107d06441b709d Vinod Koul    2018-10-25  351   * @slave_config	Slave configuration
24ca312dd66329 Robin Gong    2018-07-04  352   * @peripheral_type:	Peripheral type. Needed for setting SDMA script
24ca312dd66329 Robin Gong    2018-07-04  353   * @event_id0:		aka dma request line
24ca312dd66329 Robin Gong    2018-07-04  354   * @event_id1:		for channels that use 2 events
24ca312dd66329 Robin Gong    2018-07-04  355   * @word_size:		peripheral access size
24ca312dd66329 Robin Gong    2018-07-04  356   * @pc_from_device:	script address for those device_2_memory
24ca312dd66329 Robin Gong    2018-07-04  357   * @pc_to_device:	script address for those memory_2_device
24ca312dd66329 Robin Gong    2018-07-04  358   * @device_to_device:	script address for those device_2_device
0f06c02755889a Robin Gong    2018-07-24  359   * @pc_to_pc:		script address for those memory_2_memory
24ca312dd66329 Robin Gong    2018-07-04  360   * @flags:		loop mode or not
24ca312dd66329 Robin Gong    2018-07-04  361   * @per_address:	peripheral source or destination address in common case
24ca312dd66329 Robin Gong    2018-07-04  362   *                      destination address in p_2_p case
24ca312dd66329 Robin Gong    2018-07-04  363   * @per_address2:	peripheral source address in p_2_p case
24ca312dd66329 Robin Gong    2018-07-04  364   * @event_mask:		event mask used in p_2_p script
24ca312dd66329 Robin Gong    2018-07-04  365   * @watermark_level:	value for gReg[7], some script will extend it from
24ca312dd66329 Robin Gong    2018-07-04  366   *			basic watermark such as p_2_p
24ca312dd66329 Robin Gong    2018-07-04  367   * @shp_addr:		value for gReg[6]
24ca312dd66329 Robin Gong    2018-07-04  368   * @per_addr:		value for gReg[2]
24ca312dd66329 Robin Gong    2018-07-04  369   * @status:		status of dma channel
24ca312dd66329 Robin Gong    2018-07-04  370   * @data:		specific sdma interface structure
24ca312dd66329 Robin Gong    2018-07-04  371   * @bd_pool:		dma_pool for bd
1ec1e82f2510e2 Sascha Hauer  2010-09-30  372   */
1ec1e82f2510e2 Sascha Hauer  2010-09-30  373  struct sdma_channel {
57b772b86871e0 Robin Gong    2018-06-20  374  	struct virt_dma_chan		vc;
76c33d27073e29 Sascha Hauer  2018-06-20  375  	struct sdma_desc		*desc;
acf2a79f1f73b1 Robin Gong    2020-05-20  376  	struct list_head                terminated_node;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  377  	struct sdma_engine		*sdma;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  378  	unsigned int			channel;
db8196df4bb6f1 Vinod Koul    2011-10-13  379  	enum dma_transfer_direction		direction;
107d06441b709d Vinod Koul    2018-10-25  380  	struct dma_slave_config		slave_config;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  381  	enum sdma_peripheral_type	peripheral_type;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  382  	unsigned int			event_id0;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  383  	unsigned int			event_id1;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  384  	enum dma_slave_buswidth		word_size;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  385  	unsigned int			pc_from_device, pc_to_device;
8391ecf465ec5c Shengjiu Wang 2015-07-10  386  	unsigned int			device_to_device;
0f06c02755889a Robin Gong    2018-07-24  387  	unsigned int                    pc_to_pc;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  388  	unsigned long			flags;
8391ecf465ec5c Shengjiu Wang 2015-07-10  389  	dma_addr_t			per_address, per_address2;
0bbc1413028e93 Richard Zhao  2012-01-13  390  	unsigned long			event_mask[2];
0bbc1413028e93 Richard Zhao  2012-01-13  391  	unsigned long			watermark_level;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  392  	u32				shp_addr, per_addr;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  393  	enum dma_status			status;
0b3518652c596b Nicolin Chen  2014-06-16  394  	struct imx_dma_data		data;
b8603d2a5795c4 Lucas Stach   2018-11-06  395  	struct work_struct		terminate_worker;
e977370b6d9170 Robin Gong    2019-04-28  396  	bool				is_ram_script;
a89c75d447599b Shengjiu Wang 2015-07-17  397  	bool				src_dualfifo;
a89c75d447599b Shengjiu Wang 2015-07-17  398  	bool				dst_dualfifo;
b9416dfe215dfe Robin Gong    2018-01-16  399  	unsigned int			fifo_num;
b9416dfe215dfe Robin Gong    2018-01-16  400  	bool				sw_done;
b9416dfe215dfe Robin Gong    2018-01-16  401  	u32				sw_done_sel;
1ec1e82f2510e2 Sascha Hauer  2010-09-30 @402  };
1ec1e82f2510e2 Sascha Hauer  2010-09-30  403  

:::::: The code at line 402 was first introduced by commit
:::::: 1ec1e82f2510e2bdcb6268ed74aa79e1a7bc9594 dmaengine: Add Freescale i.MX SDMA support

:::::: TO: Sascha Hauer <s.hauer@pengutronix.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
