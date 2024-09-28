Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6302260B8A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727542650; cv=none; b=Odzi9FJgrrOyyFeCHAzxxUIm5NXpzaHeVIY0B/0pufIZEguo89gZ43bYYHhF6Pq5xsOsp+JIaPFK+GayjdI6r6rN/bIzQclqxYPQa5mg99CXSkZNHFCTJFXlYTYiAqHAnPz/O8E+BZ/llSPvJyJpb9+G2BKJpuuIsf8+sWDPK7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727542650; c=relaxed/simple;
	bh=7NO5PMtMF2JVkbZb2APl6OFymkK3cxwtcsX6PtI9LtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ql/aGjRAz6PZLL7qSlPCbFHId9DN3nAOQ6FJ4FESWSVo0BNRyi6QC1XnRehnssmu9X7PLjwOXNNZ2SKORSfLwFIPy2r/JRozoU7RqJmiDhnrMUIELMA28bZefx3i70rWHmS2UDQ914q0DqazPrJEP6p5ywC5E2qd5cdYRm6kxpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYuBm/rN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYuBm/rN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727542648; x=1759078648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7NO5PMtMF2JVkbZb2APl6OFymkK3cxwtcsX6PtI9LtM=;
  b=XYuBm/rNk6A7DTjn2L4JD8RWGVtwQrnfLsiin/MK1iaRX99Pb+L71hJW
   nR/77KICTuBVjCYsIq047sH1kdA9F/taGJDvwCUOH8vJJedToYEbJjgb0
   h+BZ+mIk/bdHzSOmwCcknR45/txURXY0cgs8AcieCZiHHBNXLgJltr4fr
   AoFYkgGBRwW4EAAp3YxfYytRIwEYWhhdDORJObNtk37kfLFUUVBjlKOQr
   4GJe+/jYSkL4HXCjgjQMy85CEAA93Vl9EtGUgy9oxvfCEcLzhRdcFg8q3
   TD6O6nXcEIDlWWQNgfU6nXDFOxyicV08zB4S106CprhpLdIDAELFO5nsr
   w==;
X-CSE-ConnectionGUID: rKDJfMdDR1yRdbjW1r+PXQ==
X-CSE-MsgGUID: Hmt9ZnxiQ2iWoJ6YhOAxwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30560880"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30560880"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 09:57:26 -0700
X-CSE-ConnectionGUID: gSMP2Ct6T+OO8dY5CmayFw==
X-CSE-MsgGUID: rtPOY/R1TsC4ksBGWKslIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="103631449"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Sep 2024 09:57:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sual0-000NTH-1I;
	Sat, 28 Sep 2024 16:57:22 +0000
Date: Sun, 29 Sep 2024 00:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 1186/16788]
 drivers/dma/imx-sdma.c:475: warning: Function parameter or member 'prio' not
 described in 'sdma_channel'
Message-ID: <202409290037.ppze6Tvj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 77b45aa69f6df175c56141ffd61235bea7dc0d8e [1186/16788] dmaengine: imx-sdma: Add pm_ops to support suspend & resume
config: arm-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290037.ppze6Tvj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290037.ppze6Tvj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290037.ppze6Tvj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'ap_2_ap_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'ap_2_bp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'ap_2_ap_fixed_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'bp_2_ap_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'loopback_on_dsp_side_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'mcu_interrupt_only_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'firi_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'firi_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'per_2_firi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'mcu_2_firi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'uart_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'uart_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'per_2_app_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'mcu_2_app_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'per_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'uartsh_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'uartsh_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'per_2_shp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'mcu_2_shp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'ata_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'mcu_2_ata_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'app_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'app_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'shp_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'shp_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'mshc_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'mcu_2_mshc_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'spdif_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'mcu_2_spdif_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'asrc_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'ext_mem_2_ipu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'descrambler_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'dptc_dvfs_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'utra_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'ram_code_start_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'mcu_2_ssish_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'ssish_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'hdmi_dma_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'zcanfd_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'zqspi_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'mcu_2_ecspi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'mcu_2_sai_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'sai_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'uart_2_mcu_rom_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'uartsh_2_mcu_rom_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:255: warning: Function parameter or member 'mcu_2_zqspi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:475: warning: Function parameter or member 'audio_config' not described in 'sdma_channel'
>> drivers/dma/imx-sdma.c:475: warning: Function parameter or member 'prio' not described in 'sdma_channel'


vim +475 drivers/dma/imx-sdma.c

76c33d27073e29 Sascha Hauer  2018-06-20  402  
1ec1e82f2510e2 Sascha Hauer  2010-09-30  403  /**
1ec1e82f2510e2 Sascha Hauer  2010-09-30  404   * struct sdma_channel - housekeeping for a SDMA channel
1ec1e82f2510e2 Sascha Hauer  2010-09-30  405   *
24ca312dd66329 Robin Gong    2018-07-04  406   * @vc:			virt_dma base structure
24ca312dd66329 Robin Gong    2018-07-04  407   * @desc:		sdma description including vd and other special member
24ca312dd66329 Robin Gong    2018-07-04  408   * @sdma:		pointer to the SDMA engine for this channel
24ca312dd66329 Robin Gong    2018-07-04  409   * @channel:		the channel number, matches dmaengine chan_id + 1
24ca312dd66329 Robin Gong    2018-07-04  410   * @direction:		transfer type. Needed for setting SDMA script
d0c4a1492810f6 Lee Jones     2020-07-14  411   * @slave_config:	Slave configuration
24ca312dd66329 Robin Gong    2018-07-04  412   * @peripheral_type:	Peripheral type. Needed for setting SDMA script
24ca312dd66329 Robin Gong    2018-07-04  413   * @event_id0:		aka dma request line
24ca312dd66329 Robin Gong    2018-07-04  414   * @event_id1:		for channels that use 2 events
24ca312dd66329 Robin Gong    2018-07-04  415   * @word_size:		peripheral access size
24ca312dd66329 Robin Gong    2018-07-04  416   * @pc_from_device:	script address for those device_2_memory
24ca312dd66329 Robin Gong    2018-07-04  417   * @pc_to_device:	script address for those memory_2_device
24ca312dd66329 Robin Gong    2018-07-04  418   * @device_to_device:	script address for those device_2_device
0f06c02755889a Robin Gong    2018-07-24  419   * @pc_to_pc:		script address for those memory_2_memory
24ca312dd66329 Robin Gong    2018-07-04  420   * @flags:		loop mode or not
24ca312dd66329 Robin Gong    2018-07-04  421   * @per_address:	peripheral source or destination address in common case
24ca312dd66329 Robin Gong    2018-07-04  422   *                      destination address in p_2_p case
24ca312dd66329 Robin Gong    2018-07-04  423   * @per_address2:	peripheral source address in p_2_p case
24ca312dd66329 Robin Gong    2018-07-04  424   * @event_mask:		event mask used in p_2_p script
24ca312dd66329 Robin Gong    2018-07-04  425   * @watermark_level:	value for gReg[7], some script will extend it from
24ca312dd66329 Robin Gong    2018-07-04  426   *			basic watermark such as p_2_p
24ca312dd66329 Robin Gong    2018-07-04  427   * @shp_addr:		value for gReg[6]
24ca312dd66329 Robin Gong    2018-07-04  428   * @per_addr:		value for gReg[2]
24ca312dd66329 Robin Gong    2018-07-04  429   * @status:		status of dma channel
d0c4a1492810f6 Lee Jones     2020-07-14  430   * @context_loaded:	ensure context is only loaded once
24ca312dd66329 Robin Gong    2018-07-04  431   * @data:		specific sdma interface structure
24ca312dd66329 Robin Gong    2018-07-04  432   * @bd_pool:		dma_pool for bd
d0c4a1492810f6 Lee Jones     2020-07-14  433   * @terminate_worker:	used to call back into terminate work function
01eafd4b238058 Shengjiu Wang 2022-07-06  434   * @terminated:		terminated list
01eafd4b238058 Shengjiu Wang 2022-07-06  435   * @is_ram_script:	flag for script in ram
01eafd4b238058 Shengjiu Wang 2022-07-06  436   * @n_fifos_src:	number of source device fifos
01eafd4b238058 Shengjiu Wang 2022-07-06  437   * @n_fifos_dst:	number of destination device fifos
e0c7ea83f006ce Shengjiu Wang 2022-07-07  438   * @stride_fifos_src:	stride for source device FIFOs
e0c7ea83f006ce Shengjiu Wang 2022-07-07  439   * @stride_fifos_dst:	stride for destination device FIFOs
e0c7ea83f006ce Shengjiu Wang 2022-07-07  440   * @words_per_fifo:	copy number of words one time for one FIFO
c705c35b1cebeb Robin Gong    2018-01-16  441   * @sw_done:		software done flag
1ec1e82f2510e2 Sascha Hauer  2010-09-30  442   */
1ec1e82f2510e2 Sascha Hauer  2010-09-30  443  struct sdma_channel {
57b772b86871e0 Robin Gong    2018-06-20  444  	struct virt_dma_chan		vc;
76c33d27073e29 Sascha Hauer  2018-06-20  445  	struct sdma_desc		*desc;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  446  	struct sdma_engine		*sdma;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  447  	unsigned int			channel;
db8196df4bb6f1 Vinod Koul    2011-10-13  448  	enum dma_transfer_direction	direction;
107d06441b709d Vinod Koul    2018-10-25  449  	struct dma_slave_config		slave_config;
c705c35b1cebeb Robin Gong    2018-01-16  450  	struct sdma_peripheral_config	*audio_config;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  451  	enum sdma_peripheral_type	peripheral_type;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  452  	unsigned int			event_id0;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  453  	unsigned int			event_id1;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  454  	enum dma_slave_buswidth		word_size;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  455  	unsigned int			pc_from_device, pc_to_device;
8391ecf465ec5c Shengjiu Wang 2015-07-10  456  	unsigned int			device_to_device;
0f06c02755889a Robin Gong    2018-07-24  457  	unsigned int                    pc_to_pc;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  458  	unsigned long			flags;
8391ecf465ec5c Shengjiu Wang 2015-07-10  459  	dma_addr_t			per_address, per_address2;
0bbc1413028e93 Richard Zhao  2012-01-13  460  	unsigned long			event_mask[2];
0bbc1413028e93 Richard Zhao  2012-01-13  461  	unsigned long			watermark_level;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  462  	u32				shp_addr, per_addr;
1ec1e82f2510e2 Sascha Hauer  2010-09-30  463  	enum dma_status			status;
0b3518652c596b Nicolin Chen  2014-06-16  464  	struct imx_dma_data		data;
b8603d2a5795c4 Lucas Stach   2018-11-06  465  	struct work_struct		terminate_worker;
4e2b10be1f4fe0 Robin Gong    2021-07-14  466  	struct list_head                terminated;
e8fafa50645c22 Robin Gong    2021-07-14  467  	bool				is_ram_script;
77b45aa69f6df1 Robin Gong    2020-04-29  468  	int				prio;
824a0a02cd7477 Sascha Hauer  2022-04-14  469  	unsigned int                    n_fifos_src;
824a0a02cd7477 Sascha Hauer  2022-04-14  470  	unsigned int                    n_fifos_dst;
e0c7ea83f006ce Shengjiu Wang 2022-07-07  471  	unsigned int                    stride_fifos_src;
e0c7ea83f006ce Shengjiu Wang 2022-07-07  472  	unsigned int                    stride_fifos_dst;
e0c7ea83f006ce Shengjiu Wang 2022-07-07  473  	unsigned int                    words_per_fifo;
824a0a02cd7477 Sascha Hauer  2022-04-14  474  	bool                            sw_done;
1ec1e82f2510e2 Sascha Hauer  2010-09-30 @475  };
1ec1e82f2510e2 Sascha Hauer  2010-09-30  476  

:::::: The code at line 475 was first introduced by commit
:::::: 1ec1e82f2510e2bdcb6268ed74aa79e1a7bc9594 dmaengine: Add Freescale i.MX SDMA support

:::::: TO: Sascha Hauer <s.hauer@pengutronix.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
