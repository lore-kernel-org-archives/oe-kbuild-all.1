Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B665682
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcx0+7BR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697288010; x=1728824010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZSqaJ2aT9LNGT5W2NEwbSjNrBJ94vqvTS/PkhVSoQfM=;
  b=hcx0+7BR0x4HTKY+BlY621w278dVUFis/zFp5zdYdDcJNVz796RCdGbs
   IqwOZqhpjPY7ztTWubElepJDBc8i3BzMsDLFjUy2GstJJyElGG/rRnZwA
   CtQevigvmo4jA62O/zEFOrc5UnYoShHCPcR4tim3SUYmHmyK3F5nBrL+/
   xSonln0ywrqIfX9SZI4efjbV90oi6C8tLaUFB9Jftiy1wL3gupeSN6Th2
   YFzEvhBBKeIuymS3woQyLj3xtPMyd9BrezIs6PS4AHA/n507MSC5BjXn/
   3fcLR0+oaZczuPX96aYPlP7AOP+L0Ccy34Wo/G/Gy6t+U3Bix3ij7sKDx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="375674575"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="375674575"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 05:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871447747"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="871447747"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2023 05:53:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qre8y-0006Al-1Y;
	Sat, 14 Oct 2023 12:53:24 +0000
Date: Sat, 14 Oct 2023 20:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.4-2.3.x-imx 700/30000] drivers/dma/imx-sdma.c:400:
 warning: Function parameter or member 'fifo_num' not described in
 'sdma_channel'
Message-ID: <202310142005.W24QPMaq-lkp@intel.com>
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
commit: b9416dfe215dfeb752225f950282f01f0c9024ea [700/30000] dmaengine: imx-sdma: update sdma script for multi fifo on SAI
config: arm-randconfig-002-20231014 (https://download.01.org/0day-ci/archive/20231014/202310142005.W24QPMaq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142005.W24QPMaq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142005.W24QPMaq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/imx-sdma.c:400: warning: Function parameter or member 'slave_config' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:400: warning: Function parameter or member 'terminate_worker' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:400: warning: Function parameter or member 'is_ram_script' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:400: warning: Function parameter or member 'src_dualfifo' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:400: warning: Function parameter or member 'dst_dualfifo' not described in 'sdma_channel'
>> drivers/dma/imx-sdma.c:400: warning: Function parameter or member 'fifo_num' not described in 'sdma_channel'
>> drivers/dma/imx-sdma.c:400: warning: Function parameter or member 'sw_done' not described in 'sdma_channel'
>> drivers/dma/imx-sdma.c:400: warning: Function parameter or member 'sw_done_sel' not described in 'sdma_channel'


vim +400 drivers/dma/imx-sdma.c

76c33d27073e29 Sascha Hauer  2018-06-20  341  
1ec1e82f2510e2 Sascha Hauer  2010-09-30  342  /**
1ec1e82f2510e2 Sascha Hauer  2010-09-30  343   * struct sdma_channel - housekeeping for a SDMA channel
1ec1e82f2510e2 Sascha Hauer  2010-09-30  344   *
24ca312dd66329 Robin Gong    2018-07-04  345   * @vc:			virt_dma base structure
24ca312dd66329 Robin Gong    2018-07-04  346   * @desc:		sdma description including vd and other special member
24ca312dd66329 Robin Gong    2018-07-04  347   * @sdma:		pointer to the SDMA engine for this channel
24ca312dd66329 Robin Gong    2018-07-04  348   * @channel:		the channel number, matches dmaengine chan_id + 1
24ca312dd66329 Robin Gong    2018-07-04  349   * @direction:		transfer type. Needed for setting SDMA script
107d06441b709d Vinod Koul    2018-10-25  350   * @slave_config	Slave configuration
24ca312dd66329 Robin Gong    2018-07-04  351   * @peripheral_type:	Peripheral type. Needed for setting SDMA script
24ca312dd66329 Robin Gong    2018-07-04  352   * @event_id0:		aka dma request line
24ca312dd66329 Robin Gong    2018-07-04  353   * @event_id1:		for channels that use 2 events
24ca312dd66329 Robin Gong    2018-07-04  354   * @word_size:		peripheral access size
24ca312dd66329 Robin Gong    2018-07-04  355   * @pc_from_device:	script address for those device_2_memory
24ca312dd66329 Robin Gong    2018-07-04  356   * @pc_to_device:	script address for those memory_2_device
24ca312dd66329 Robin Gong    2018-07-04  357   * @device_to_device:	script address for those device_2_device
0f06c02755889a Robin Gong    2018-07-24  358   * @pc_to_pc:		script address for those memory_2_memory
24ca312dd66329 Robin Gong    2018-07-04  359   * @flags:		loop mode or not
24ca312dd66329 Robin Gong    2018-07-04  360   * @per_address:	peripheral source or destination address in common case
24ca312dd66329 Robin Gong    2018-07-04  361   *                      destination address in p_2_p case
24ca312dd66329 Robin Gong    2018-07-04  362   * @per_address2:	peripheral source address in p_2_p case
24ca312dd66329 Robin Gong    2018-07-04  363   * @event_mask:		event mask used in p_2_p script
24ca312dd66329 Robin Gong    2018-07-04  364   * @watermark_level:	value for gReg[7], some script will extend it from
24ca312dd66329 Robin Gong    2018-07-04  365   *			basic watermark such as p_2_p
24ca312dd66329 Robin Gong    2018-07-04  366   * @shp_addr:		value for gReg[6]
24ca312dd66329 Robin Gong    2018-07-04  367   * @per_addr:		value for gReg[2]
24ca312dd66329 Robin Gong    2018-07-04  368   * @status:		status of dma channel
24ca312dd66329 Robin Gong    2018-07-04  369   * @data:		specific sdma interface structure
24ca312dd66329 Robin Gong    2018-07-04  370   * @bd_pool:		dma_pool for bd
1ec1e82f2510e2 Sascha Hauer  2010-09-30  371   */
1ec1e82f2510e2 Sascha Hauer  2010-09-30  372  struct sdma_channel {
57b772b86871e0 Robin Gong    2018-06-20  373  	struct virt_dma_chan		vc;
76c33d27073e29 Sascha Hauer  2018-06-20  374  	struct sdma_desc		*desc;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  375  	struct sdma_engine		*sdma;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  376  	unsigned int			channel;
db8196df4bb6f1 Vinod Koul    2011-10-13  377  	enum dma_transfer_direction		direction;
107d06441b709d Vinod Koul    2018-10-25  378  	struct dma_slave_config		slave_config;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  379  	enum sdma_peripheral_type	peripheral_type;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  380  	unsigned int			event_id0;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  381  	unsigned int			event_id1;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  382  	enum dma_slave_buswidth		word_size;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  383  	unsigned int			pc_from_device, pc_to_device;
8391ecf465ec5c Shengjiu Wang 2015-07-10  384  	unsigned int			device_to_device;
0f06c02755889a Robin Gong    2018-07-24  385  	unsigned int                    pc_to_pc;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  386  	unsigned long			flags;
8391ecf465ec5c Shengjiu Wang 2015-07-10  387  	dma_addr_t			per_address, per_address2;
0bbc1413028e93 Richard Zhao  2012-01-13  388  	unsigned long			event_mask[2];
0bbc1413028e93 Richard Zhao  2012-01-13  389  	unsigned long			watermark_level;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  390  	u32				shp_addr, per_addr;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  391  	enum dma_status			status;
0b3518652c596b Nicolin Chen  2014-06-16  392  	struct imx_dma_data		data;
b8603d2a5795c4 Lucas Stach   2018-11-06  393  	struct work_struct		terminate_worker;
e977370b6d9170 Robin Gong    2019-04-28  394  	bool				is_ram_script;
a89c75d447599b Shengjiu Wang 2015-07-17  395  	bool				src_dualfifo;
a89c75d447599b Shengjiu Wang 2015-07-17  396  	bool				dst_dualfifo;
b9416dfe215dfe Robin Gong    2018-01-16  397  	unsigned int			fifo_num;
b9416dfe215dfe Robin Gong    2018-01-16  398  	bool				sw_done;
b9416dfe215dfe Robin Gong    2018-01-16  399  	u32				sw_done_sel;
1ec1e82f2510e2 Sascha Hauer  2010-09-30 @400  };
1ec1e82f2510e2 Sascha Hauer  2010-09-30  401  

:::::: The code at line 400 was first introduced by commit
:::::: 1ec1e82f2510e2bdcb6268ed74aa79e1a7bc9594 dmaengine: Add Freescale i.MX SDMA support

:::::: TO: Sascha Hauer <s.hauer@pengutronix.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
