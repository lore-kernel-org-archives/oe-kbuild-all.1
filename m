Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0635EE579
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilbMnF3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697280558; x=1728816558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e7lbnqskUjaISQ+hQRr/LtAp5pGRcazJkfuzl8QdCsU=;
  b=ilbMnF3Ro+SLotg9OpMJVbS5TTb+KKx6/nUOM3g73nM/Tt9m6vPw/BmZ
   D0GkiPRt8gNEVkL+tIqPn6kqRf1RhfscGJgh/ogX4KoWITN/r9KrA5z/c
   uxWj+wrOwXR0UcOWgkKNeoX5C6a9LH5den3q8Jfw2p3fSl2iUUBFxmA6q
   CMNijpzjvxoVpDELU+k2baKLrqJk2Br2qGzO8JDD+L30BxnZwubk32zNf
   rJDtH7HpS+SKUoavoOVBdxtSPlxlAA55qRIS5/ZHQRjIRunV0tpHzS8fi
   B4ose7O0WW1TA0tn4e7PtbfE6A3wqx29jFQhX4vHCE06SdM8mdu3x4B1s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471547891"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471547891"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 03:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="731658389"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="731658389"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Oct 2023 03:49:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrcCo-00064r-0h;
	Sat, 14 Oct 2023 10:49:14 +0000
Date: Sat, 14 Oct 2023 18:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.4-2.3.x-imx 698/30000] drivers/dma/imx-sdma.c:389:
 warning: Function parameter or member 'src_dualfifo' not described in
 'sdma_channel'
Message-ID: <202310141843.Zwyw8Bw3-lkp@intel.com>
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
commit: a89c75d447599ba8e8d2fdb81993622a6665daee [698/30000] MLK-11259-1: dmaengine: imx-sdma: support dual fifo for DEV_TO_DEV
config: arm-randconfig-002-20231014 (https://download.01.org/0day-ci/archive/20231014/202310141843.Zwyw8Bw3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141843.Zwyw8Bw3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141843.Zwyw8Bw3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/imx-sdma.c:389: warning: Function parameter or member 'slave_config' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:389: warning: Function parameter or member 'terminate_worker' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:389: warning: Function parameter or member 'is_ram_script' not described in 'sdma_channel'
>> drivers/dma/imx-sdma.c:389: warning: Function parameter or member 'src_dualfifo' not described in 'sdma_channel'
>> drivers/dma/imx-sdma.c:389: warning: Function parameter or member 'dst_dualfifo' not described in 'sdma_channel'


vim +389 drivers/dma/imx-sdma.c

76c33d27073e29 Sascha Hauer  2018-06-20  333  
1ec1e82f2510e2 Sascha Hauer  2010-09-30  334  /**
1ec1e82f2510e2 Sascha Hauer  2010-09-30  335   * struct sdma_channel - housekeeping for a SDMA channel
1ec1e82f2510e2 Sascha Hauer  2010-09-30  336   *
24ca312dd66329 Robin Gong    2018-07-04  337   * @vc:			virt_dma base structure
24ca312dd66329 Robin Gong    2018-07-04  338   * @desc:		sdma description including vd and other special member
24ca312dd66329 Robin Gong    2018-07-04  339   * @sdma:		pointer to the SDMA engine for this channel
24ca312dd66329 Robin Gong    2018-07-04  340   * @channel:		the channel number, matches dmaengine chan_id + 1
24ca312dd66329 Robin Gong    2018-07-04  341   * @direction:		transfer type. Needed for setting SDMA script
107d06441b709d Vinod Koul    2018-10-25  342   * @slave_config	Slave configuration
24ca312dd66329 Robin Gong    2018-07-04  343   * @peripheral_type:	Peripheral type. Needed for setting SDMA script
24ca312dd66329 Robin Gong    2018-07-04  344   * @event_id0:		aka dma request line
24ca312dd66329 Robin Gong    2018-07-04  345   * @event_id1:		for channels that use 2 events
24ca312dd66329 Robin Gong    2018-07-04  346   * @word_size:		peripheral access size
24ca312dd66329 Robin Gong    2018-07-04  347   * @pc_from_device:	script address for those device_2_memory
24ca312dd66329 Robin Gong    2018-07-04  348   * @pc_to_device:	script address for those memory_2_device
24ca312dd66329 Robin Gong    2018-07-04  349   * @device_to_device:	script address for those device_2_device
0f06c02755889a Robin Gong    2018-07-24  350   * @pc_to_pc:		script address for those memory_2_memory
24ca312dd66329 Robin Gong    2018-07-04  351   * @flags:		loop mode or not
24ca312dd66329 Robin Gong    2018-07-04  352   * @per_address:	peripheral source or destination address in common case
24ca312dd66329 Robin Gong    2018-07-04  353   *                      destination address in p_2_p case
24ca312dd66329 Robin Gong    2018-07-04  354   * @per_address2:	peripheral source address in p_2_p case
24ca312dd66329 Robin Gong    2018-07-04  355   * @event_mask:		event mask used in p_2_p script
24ca312dd66329 Robin Gong    2018-07-04  356   * @watermark_level:	value for gReg[7], some script will extend it from
24ca312dd66329 Robin Gong    2018-07-04  357   *			basic watermark such as p_2_p
24ca312dd66329 Robin Gong    2018-07-04  358   * @shp_addr:		value for gReg[6]
24ca312dd66329 Robin Gong    2018-07-04  359   * @per_addr:		value for gReg[2]
24ca312dd66329 Robin Gong    2018-07-04  360   * @status:		status of dma channel
24ca312dd66329 Robin Gong    2018-07-04  361   * @data:		specific sdma interface structure
24ca312dd66329 Robin Gong    2018-07-04  362   * @bd_pool:		dma_pool for bd
1ec1e82f2510e2 Sascha Hauer  2010-09-30  363   */
1ec1e82f2510e2 Sascha Hauer  2010-09-30  364  struct sdma_channel {
57b772b86871e0 Robin Gong    2018-06-20  365  	struct virt_dma_chan		vc;
76c33d27073e29 Sascha Hauer  2018-06-20  366  	struct sdma_desc		*desc;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  367  	struct sdma_engine		*sdma;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  368  	unsigned int			channel;
db8196df4bb6f1 Vinod Koul    2011-10-13  369  	enum dma_transfer_direction		direction;
107d06441b709d Vinod Koul    2018-10-25  370  	struct dma_slave_config		slave_config;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  371  	enum sdma_peripheral_type	peripheral_type;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  372  	unsigned int			event_id0;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  373  	unsigned int			event_id1;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  374  	enum dma_slave_buswidth		word_size;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  375  	unsigned int			pc_from_device, pc_to_device;
8391ecf465ec5c Shengjiu Wang 2015-07-10  376  	unsigned int			device_to_device;
0f06c02755889a Robin Gong    2018-07-24  377  	unsigned int                    pc_to_pc;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  378  	unsigned long			flags;
8391ecf465ec5c Shengjiu Wang 2015-07-10  379  	dma_addr_t			per_address, per_address2;
0bbc1413028e93 Richard Zhao  2012-01-13  380  	unsigned long			event_mask[2];
0bbc1413028e93 Richard Zhao  2012-01-13  381  	unsigned long			watermark_level;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  382  	u32				shp_addr, per_addr;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  383  	enum dma_status			status;
0b3518652c596b Nicolin Chen  2014-06-16  384  	struct imx_dma_data		data;
b8603d2a5795c4 Lucas Stach   2018-11-06  385  	struct work_struct		terminate_worker;
e977370b6d9170 Robin Gong    2019-04-28  386  	bool				is_ram_script;
a89c75d447599b Shengjiu Wang 2015-07-17  387  	bool				src_dualfifo;
a89c75d447599b Shengjiu Wang 2015-07-17  388  	bool				dst_dualfifo;
1ec1e82f2510e2 Sascha Hauer  2010-09-30 @389  };
1ec1e82f2510e2 Sascha Hauer  2010-09-30  390  

:::::: The code at line 389 was first introduced by commit
:::::: 1ec1e82f2510e2bdcb6268ed74aa79e1a7bc9594 dmaengine: Add Freescale i.MX SDMA support

:::::: TO: Sascha Hauer <s.hauer@pengutronix.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
