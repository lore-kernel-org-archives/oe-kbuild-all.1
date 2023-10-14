Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FF263AB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRxP6YyZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697270835; x=1728806835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MLf725eaHu73nnRNwgz4DsDqyGKu+KceaEr7G6E8Uqg=;
  b=mRxP6YyZEjENVk4uV6WhZ3/qH8Hdn7qesPciFCSJVOGsGOkxorkJ4Lkl
   sVvOlH+Lzk/Tx3b4Ejaos6IUGcLIU0mwR0ns6EkUCEV5per+vId22mlkm
   6G3WtRH7RL22BmJxUfYx+wG/u2hhNpp4vzVYZ27PmSpfTBqT2HOJeHzjf
   SI3IB+hLT7i3Tg9hPzS2GEuRX5sdr3Ygb1DUtEj7amhQA7Bbv8dtSoKte
   QP5Ls5AFjwGRk1yjQL46goWkI+6hGDejN0RpY8gkKR5PGSHAR6gtZHkpf
   U1dtakl41ZdgkyedpWhzF+I5vwVS72bygGQiqC398yZINIJh/aOlcmvHr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="384181242"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="384181242"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 01:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871395256"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="871395256"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2023 01:07:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrZfw-0005rV-2F;
	Sat, 14 Oct 2023 08:07:08 +0000
Date: Sat, 14 Oct 2023 16:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4621/15767] drivers/dma/imx-sdma.c:476:
 warning: Function parameter or member 'prio' not described in 'sdma_channel'
Message-ID: <202310141516.XPgj6EyF-lkp@intel.com>
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
commit: 8ad3a1d7ad966ee2c90c45cf3f50a88f71c467b0 [4621/15767] dmaengine: imx-sdma: Add pm_ops to support suspend & resume
config: arm-randconfig-002-20231014 (https://download.01.org/0day-ci/archive/20231014/202310141516.XPgj6EyF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141516.XPgj6EyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141516.XPgj6EyF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'ap_2_ap_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'ap_2_bp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'ap_2_ap_fixed_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'bp_2_ap_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'loopback_on_dsp_side_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'mcu_interrupt_only_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'firi_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'firi_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'per_2_firi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'mcu_2_firi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'uart_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'uart_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'per_2_app_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'mcu_2_app_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'per_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'uartsh_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'uartsh_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'per_2_shp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'mcu_2_shp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'ata_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'mcu_2_ata_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'app_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'app_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'shp_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'shp_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'mshc_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'mcu_2_mshc_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'spdif_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'mcu_2_spdif_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'asrc_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'ext_mem_2_ipu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'descrambler_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'dptc_dvfs_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'utra_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'ram_code_start_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'mcu_2_ssish_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'ssish_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'hdmi_dma_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'zcanfd_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'zqspi_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'mcu_2_ecspi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'mcu_2_sai_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'sai_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'uart_2_mcu_rom_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'uartsh_2_mcu_rom_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:256: warning: Function parameter or member 'mcu_2_zqspi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:476: warning: Function parameter or member 'audio_config' not described in 'sdma_channel'
>> drivers/dma/imx-sdma.c:476: warning: Function parameter or member 'prio' not described in 'sdma_channel'


vim +476 drivers/dma/imx-sdma.c

76c33d27073e29 Sascha Hauer  2018-06-20  403  
1ec1e82f2510e2 Sascha Hauer  2010-09-30  404  /**
1ec1e82f2510e2 Sascha Hauer  2010-09-30  405   * struct sdma_channel - housekeeping for a SDMA channel
1ec1e82f2510e2 Sascha Hauer  2010-09-30  406   *
24ca312dd66329 Robin Gong    2018-07-04  407   * @vc:			virt_dma base structure
24ca312dd66329 Robin Gong    2018-07-04  408   * @desc:		sdma description including vd and other special member
24ca312dd66329 Robin Gong    2018-07-04  409   * @sdma:		pointer to the SDMA engine for this channel
24ca312dd66329 Robin Gong    2018-07-04  410   * @channel:		the channel number, matches dmaengine chan_id + 1
24ca312dd66329 Robin Gong    2018-07-04  411   * @direction:		transfer type. Needed for setting SDMA script
d0c4a1492810f6 Lee Jones     2020-07-14  412   * @slave_config:	Slave configuration
24ca312dd66329 Robin Gong    2018-07-04  413   * @peripheral_type:	Peripheral type. Needed for setting SDMA script
24ca312dd66329 Robin Gong    2018-07-04  414   * @event_id0:		aka dma request line
24ca312dd66329 Robin Gong    2018-07-04  415   * @event_id1:		for channels that use 2 events
24ca312dd66329 Robin Gong    2018-07-04  416   * @word_size:		peripheral access size
24ca312dd66329 Robin Gong    2018-07-04  417   * @pc_from_device:	script address for those device_2_memory
24ca312dd66329 Robin Gong    2018-07-04  418   * @pc_to_device:	script address for those memory_2_device
24ca312dd66329 Robin Gong    2018-07-04  419   * @device_to_device:	script address for those device_2_device
0f06c02755889a Robin Gong    2018-07-24  420   * @pc_to_pc:		script address for those memory_2_memory
24ca312dd66329 Robin Gong    2018-07-04  421   * @flags:		loop mode or not
24ca312dd66329 Robin Gong    2018-07-04  422   * @per_address:	peripheral source or destination address in common case
24ca312dd66329 Robin Gong    2018-07-04  423   *                      destination address in p_2_p case
24ca312dd66329 Robin Gong    2018-07-04  424   * @per_address2:	peripheral source address in p_2_p case
24ca312dd66329 Robin Gong    2018-07-04  425   * @event_mask:		event mask used in p_2_p script
24ca312dd66329 Robin Gong    2018-07-04  426   * @watermark_level:	value for gReg[7], some script will extend it from
24ca312dd66329 Robin Gong    2018-07-04  427   *			basic watermark such as p_2_p
24ca312dd66329 Robin Gong    2018-07-04  428   * @shp_addr:		value for gReg[6]
24ca312dd66329 Robin Gong    2018-07-04  429   * @per_addr:		value for gReg[2]
24ca312dd66329 Robin Gong    2018-07-04  430   * @status:		status of dma channel
d0c4a1492810f6 Lee Jones     2020-07-14  431   * @context_loaded:	ensure context is only loaded once
24ca312dd66329 Robin Gong    2018-07-04  432   * @data:		specific sdma interface structure
24ca312dd66329 Robin Gong    2018-07-04  433   * @bd_pool:		dma_pool for bd
d0c4a1492810f6 Lee Jones     2020-07-14  434   * @terminate_worker:	used to call back into terminate work function
01eafd4b238058 Shengjiu Wang 2022-07-06  435   * @terminated:		terminated list
01eafd4b238058 Shengjiu Wang 2022-07-06  436   * @is_ram_script:	flag for script in ram
01eafd4b238058 Shengjiu Wang 2022-07-06  437   * @n_fifos_src:	number of source device fifos
01eafd4b238058 Shengjiu Wang 2022-07-06  438   * @n_fifos_dst:	number of destination device fifos
e0c7ea83f006ce Shengjiu Wang 2022-07-07  439   * @stride_fifos_src:	stride for source device FIFOs
e0c7ea83f006ce Shengjiu Wang 2022-07-07  440   * @stride_fifos_dst:	stride for destination device FIFOs
e0c7ea83f006ce Shengjiu Wang 2022-07-07  441   * @words_per_fifo:	copy number of words one time for one FIFO
68acd913ea0173 Robin Gong    2018-01-16  442   * @sw_done:		software done flag
1ec1e82f2510e2 Sascha Hauer  2010-09-30  443   */
1ec1e82f2510e2 Sascha Hauer  2010-09-30  444  struct sdma_channel {
57b772b86871e0 Robin Gong    2018-06-20  445  	struct virt_dma_chan		vc;
76c33d27073e29 Sascha Hauer  2018-06-20  446  	struct sdma_desc		*desc;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  447  	struct sdma_engine		*sdma;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  448  	unsigned int			channel;
db8196df4bb6f1 Vinod Koul    2011-10-13  449  	enum dma_transfer_direction	direction;
107d06441b709d Vinod Koul    2018-10-25  450  	struct dma_slave_config		slave_config;
68acd913ea0173 Robin Gong    2018-01-16  451  	struct sdma_peripheral_config	*audio_config;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  452  	enum sdma_peripheral_type	peripheral_type;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  453  	unsigned int			event_id0;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  454  	unsigned int			event_id1;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  455  	enum dma_slave_buswidth		word_size;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  456  	unsigned int			pc_from_device, pc_to_device;
8391ecf465ec5c Shengjiu Wang 2015-07-10  457  	unsigned int			device_to_device;
0f06c02755889a Robin Gong    2018-07-24  458  	unsigned int                    pc_to_pc;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  459  	unsigned long			flags;
8391ecf465ec5c Shengjiu Wang 2015-07-10  460  	dma_addr_t			per_address, per_address2;
0bbc1413028e93 Richard Zhao  2012-01-13  461  	unsigned long			event_mask[2];
0bbc1413028e93 Richard Zhao  2012-01-13  462  	unsigned long			watermark_level;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  463  	u32				shp_addr, per_addr;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  464  	enum dma_status			status;
0b3518652c596b Nicolin Chen  2014-06-16  465  	struct imx_dma_data		data;
b8603d2a5795c4 Lucas Stach   2018-11-06  466  	struct work_struct		terminate_worker;
4e2b10be1f4fe0 Robin Gong    2021-07-14  467  	struct list_head                terminated;
e8fafa50645c22 Robin Gong    2021-07-14  468  	bool				is_ram_script;
8ad3a1d7ad966e Robin Gong    2020-04-29  469  	int				prio;
824a0a02cd7477 Sascha Hauer  2022-04-14  470  	unsigned int                    n_fifos_src;
824a0a02cd7477 Sascha Hauer  2022-04-14  471  	unsigned int                    n_fifos_dst;
e0c7ea83f006ce Shengjiu Wang 2022-07-07  472  	unsigned int                    stride_fifos_src;
e0c7ea83f006ce Shengjiu Wang 2022-07-07  473  	unsigned int                    stride_fifos_dst;
e0c7ea83f006ce Shengjiu Wang 2022-07-07  474  	unsigned int                    words_per_fifo;
824a0a02cd7477 Sascha Hauer  2022-04-14  475  	bool                            sw_done;
1ec1e82f2510e2 Sascha Hauer  2010-09-30 @476  };
1ec1e82f2510e2 Sascha Hauer  2010-09-30  477  

:::::: The code at line 476 was first introduced by commit
:::::: 1ec1e82f2510e2bdcb6268ed74aa79e1a7bc9594 dmaengine: Add Freescale i.MX SDMA support

:::::: TO: Sascha Hauer <s.hauer@pengutronix.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
