Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EAD1FB5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 06:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWr4CiY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697263500; x=1728799500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=twqUWmq3qrtaiID1LI7KZBAFZ+eHTrXwIpcx19CDz5Y=;
  b=NWr4CiY8FYdV+H9wHLuc0TidDGAqhpeTlZxoiGIFYSQx1JAC6iLsG4GQ
   dCXGeNPrPe3PxmpxjI5opybuF6kUjde4CCIHsY6L6VTQw/VNBBwl3eY1m
   EZzsklJD/b7H4bqhqJZrfGaQK1DkBQDiTS0GRY9ZtIVGOIpM8IPp4AGZ4
   hkxatTFcyuHHNFN2vYhdjD0MFuhUcnTdGcRJPZlO45BfJUYmFLuyblZyH
   42kny3j9ui9GT1xu9rIwYoZX8AG27EdO9z/fPhOKDeqJWGMImUDjEcl6s
   ZiwOAOQUYOPPFrBpTCZQg6RD5GtDYiV+yVDZbNQnNbWxUZI5SNk3a9T1Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="384176440"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="384176440"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 23:04:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="790104820"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="790104820"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 23:04:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrXlf-0005l0-1M;
	Sat, 14 Oct 2023 06:04:55 +0000
Date: Sat, 14 Oct 2023 14:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4618/15767] drivers/dma/imx-sdma.c:472:
 warning: Function parameter or member 'audio_config' not described in
 'sdma_channel'
Message-ID: <202310141359.XbbzO15j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: 68acd913ea01732aa897495d539b74a56312cb09 [4618/15767] dmaengine: imx-sdma: update sdma script for multi fifo on SAI
config: arm-randconfig-002-20231014 (https://download.01.org/0day-ci/archive/20231014/202310141359.XbbzO15j-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141359.XbbzO15j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141359.XbbzO15j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'ap_2_ap_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'ap_2_bp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'ap_2_ap_fixed_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'bp_2_ap_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'loopback_on_dsp_side_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'mcu_interrupt_only_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'firi_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'firi_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'per_2_firi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'mcu_2_firi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'uart_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'uart_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'per_2_app_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'mcu_2_app_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'per_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'uartsh_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'uartsh_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'per_2_shp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'mcu_2_shp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'ata_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'mcu_2_ata_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'app_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'app_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'shp_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'shp_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'mshc_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'mcu_2_mshc_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'spdif_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'mcu_2_spdif_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'asrc_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'ext_mem_2_ipu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'descrambler_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'dptc_dvfs_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'utra_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'ram_code_start_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'mcu_2_ssish_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'ssish_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'hdmi_dma_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'zcanfd_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'zqspi_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'mcu_2_ecspi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'mcu_2_sai_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'sai_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'uart_2_mcu_rom_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'uartsh_2_mcu_rom_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:253: warning: Function parameter or member 'mcu_2_zqspi_addr' not described in 'sdma_script_start_addrs'
>> drivers/dma/imx-sdma.c:472: warning: Function parameter or member 'audio_config' not described in 'sdma_channel'


vim +472 drivers/dma/imx-sdma.c

76c33d27073e29 Sascha Hauer  2018-06-20  400  
1ec1e82f2510e2 Sascha Hauer  2010-09-30  401  /**
1ec1e82f2510e2 Sascha Hauer  2010-09-30  402   * struct sdma_channel - housekeeping for a SDMA channel
1ec1e82f2510e2 Sascha Hauer  2010-09-30  403   *
24ca312dd66329 Robin Gong    2018-07-04  404   * @vc:			virt_dma base structure
24ca312dd66329 Robin Gong    2018-07-04  405   * @desc:		sdma description including vd and other special member
24ca312dd66329 Robin Gong    2018-07-04  406   * @sdma:		pointer to the SDMA engine for this channel
24ca312dd66329 Robin Gong    2018-07-04  407   * @channel:		the channel number, matches dmaengine chan_id + 1
24ca312dd66329 Robin Gong    2018-07-04  408   * @direction:		transfer type. Needed for setting SDMA script
d0c4a1492810f6 Lee Jones     2020-07-14  409   * @slave_config:	Slave configuration
24ca312dd66329 Robin Gong    2018-07-04  410   * @peripheral_type:	Peripheral type. Needed for setting SDMA script
24ca312dd66329 Robin Gong    2018-07-04  411   * @event_id0:		aka dma request line
24ca312dd66329 Robin Gong    2018-07-04  412   * @event_id1:		for channels that use 2 events
24ca312dd66329 Robin Gong    2018-07-04  413   * @word_size:		peripheral access size
24ca312dd66329 Robin Gong    2018-07-04  414   * @pc_from_device:	script address for those device_2_memory
24ca312dd66329 Robin Gong    2018-07-04  415   * @pc_to_device:	script address for those memory_2_device
24ca312dd66329 Robin Gong    2018-07-04  416   * @device_to_device:	script address for those device_2_device
0f06c02755889a Robin Gong    2018-07-24  417   * @pc_to_pc:		script address for those memory_2_memory
24ca312dd66329 Robin Gong    2018-07-04  418   * @flags:		loop mode or not
24ca312dd66329 Robin Gong    2018-07-04  419   * @per_address:	peripheral source or destination address in common case
24ca312dd66329 Robin Gong    2018-07-04  420   *                      destination address in p_2_p case
24ca312dd66329 Robin Gong    2018-07-04  421   * @per_address2:	peripheral source address in p_2_p case
24ca312dd66329 Robin Gong    2018-07-04  422   * @event_mask:		event mask used in p_2_p script
24ca312dd66329 Robin Gong    2018-07-04  423   * @watermark_level:	value for gReg[7], some script will extend it from
24ca312dd66329 Robin Gong    2018-07-04  424   *			basic watermark such as p_2_p
24ca312dd66329 Robin Gong    2018-07-04  425   * @shp_addr:		value for gReg[6]
24ca312dd66329 Robin Gong    2018-07-04  426   * @per_addr:		value for gReg[2]
24ca312dd66329 Robin Gong    2018-07-04  427   * @status:		status of dma channel
d0c4a1492810f6 Lee Jones     2020-07-14  428   * @context_loaded:	ensure context is only loaded once
24ca312dd66329 Robin Gong    2018-07-04  429   * @data:		specific sdma interface structure
24ca312dd66329 Robin Gong    2018-07-04  430   * @bd_pool:		dma_pool for bd
d0c4a1492810f6 Lee Jones     2020-07-14  431   * @terminate_worker:	used to call back into terminate work function
01eafd4b238058 Shengjiu Wang 2022-07-06  432   * @terminated:		terminated list
01eafd4b238058 Shengjiu Wang 2022-07-06  433   * @is_ram_script:	flag for script in ram
01eafd4b238058 Shengjiu Wang 2022-07-06  434   * @n_fifos_src:	number of source device fifos
01eafd4b238058 Shengjiu Wang 2022-07-06  435   * @n_fifos_dst:	number of destination device fifos
e0c7ea83f006ce Shengjiu Wang 2022-07-07  436   * @stride_fifos_src:	stride for source device FIFOs
e0c7ea83f006ce Shengjiu Wang 2022-07-07  437   * @stride_fifos_dst:	stride for destination device FIFOs
e0c7ea83f006ce Shengjiu Wang 2022-07-07  438   * @words_per_fifo:	copy number of words one time for one FIFO
68acd913ea0173 Robin Gong    2018-01-16  439   * @sw_done:		software done flag
1ec1e82f2510e2 Sascha Hauer  2010-09-30  440   */
1ec1e82f2510e2 Sascha Hauer  2010-09-30  441  struct sdma_channel {
57b772b86871e0 Robin Gong    2018-06-20  442  	struct virt_dma_chan		vc;
76c33d27073e29 Sascha Hauer  2018-06-20  443  	struct sdma_desc		*desc;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  444  	struct sdma_engine		*sdma;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  445  	unsigned int			channel;
db8196df4bb6f1 Vinod Koul    2011-10-13  446  	enum dma_transfer_direction	direction;
107d06441b709d Vinod Koul    2018-10-25  447  	struct dma_slave_config		slave_config;
68acd913ea0173 Robin Gong    2018-01-16  448  	struct sdma_peripheral_config	*audio_config;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  449  	enum sdma_peripheral_type	peripheral_type;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  450  	unsigned int			event_id0;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  451  	unsigned int			event_id1;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  452  	enum dma_slave_buswidth		word_size;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  453  	unsigned int			pc_from_device, pc_to_device;
8391ecf465ec5c Shengjiu Wang 2015-07-10  454  	unsigned int			device_to_device;
0f06c02755889a Robin Gong    2018-07-24  455  	unsigned int                    pc_to_pc;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  456  	unsigned long			flags;
8391ecf465ec5c Shengjiu Wang 2015-07-10  457  	dma_addr_t			per_address, per_address2;
0bbc1413028e93 Richard Zhao  2012-01-13  458  	unsigned long			event_mask[2];
0bbc1413028e93 Richard Zhao  2012-01-13  459  	unsigned long			watermark_level;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  460  	u32				shp_addr, per_addr;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  461  	enum dma_status			status;
0b3518652c596b Nicolin Chen  2014-06-16  462  	struct imx_dma_data		data;
b8603d2a5795c4 Lucas Stach   2018-11-06  463  	struct work_struct		terminate_worker;
4e2b10be1f4fe0 Robin Gong    2021-07-14  464  	struct list_head                terminated;
e8fafa50645c22 Robin Gong    2021-07-14  465  	bool				is_ram_script;
824a0a02cd7477 Sascha Hauer  2022-04-14  466  	unsigned int                    n_fifos_src;
824a0a02cd7477 Sascha Hauer  2022-04-14  467  	unsigned int                    n_fifos_dst;
e0c7ea83f006ce Shengjiu Wang 2022-07-07  468  	unsigned int                    stride_fifos_src;
e0c7ea83f006ce Shengjiu Wang 2022-07-07  469  	unsigned int                    stride_fifos_dst;
e0c7ea83f006ce Shengjiu Wang 2022-07-07  470  	unsigned int                    words_per_fifo;
824a0a02cd7477 Sascha Hauer  2022-04-14  471  	bool                            sw_done;
1ec1e82f2510e2 Sascha Hauer  2010-09-30 @472  };
1ec1e82f2510e2 Sascha Hauer  2010-09-30  473  

:::::: The code at line 472 was first introduced by commit
:::::: 1ec1e82f2510e2bdcb6268ed74aa79e1a7bc9594 dmaengine: Add Freescale i.MX SDMA support

:::::: TO: Sascha Hauer <s.hauer@pengutronix.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
