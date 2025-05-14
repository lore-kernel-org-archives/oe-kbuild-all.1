Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6548E20127F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 06:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747205012; cv=none; b=FuXgCdu8vCS+CXyGwD96mt8cyrwvjEZu51wGibAkyhpiXmI99e0DubGrTuxeR58I6zh/QnEtse//IOOVAx+4LeVgloOz4SzErR7/cQ7otna1GJSXSyW/+uY7zfZcBT3FuGBGoNA2ka027z0ldfsG8PAqzyQBN480CMRfedtGag8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747205012; c=relaxed/simple;
	bh=dO7bfqJG9uDnlrOeg++cvbMG6k4hIN2RV49BT0YBs1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oVYLLSvoEVFOU9PfWHE93PfjujRXXR2TlyP2aT+E9GqrrIBxeNTNuIhU5TeJ3MwLBt1uiuat00jPSVyS2t2Qy/NT/XC5rbiUEp5MMkg5i8c28zVigk4kbZ/mKmwjTOlfTVLosrIgfncMzbfDhdhwbNaP5Mjwm7ow3yQHzwv64e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMwj/YMS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMwj/YMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747205010; x=1778741010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dO7bfqJG9uDnlrOeg++cvbMG6k4hIN2RV49BT0YBs1s=;
  b=BMwj/YMSeSjOSWcD86XoQD91MK6tpKRz5iN9Q9pqtljrKqAjz5U3pxuQ
   1RAmbgQ+69QxvPRPgKgy7NfbCmSG0e586R4TSUwBPRLklFTenkTdsdtdg
   NyyKm8T5EnhA+5EyeF/yV61Wjox27V6vtHQTTs4xfJgDCHh0C1CEDGdfQ
   cZ2Xb2fwvLAEOg7S+/xQ7euk0ioJ74fZuSnfejLVhIQf+53otSCuXzNc6
   x73l9ceVeBnwlcRL2UHo996nQkTMwr356CD95WEZ/LeQtlZqtO9WT+85s
   /QScd5jEEWUgmquDUnc+aRAD1a5vs+iGqkUm6Jf6Au8xmvl49anR7Y/VT
   A==;
X-CSE-ConnectionGUID: cdd0myzHSBGTMLNTiOYEVg==
X-CSE-MsgGUID: 6vm7a3G2Q6uC4j61oYw6ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48952944"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48952944"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:43:29 -0700
X-CSE-ConnectionGUID: jOWmdwKMSdqa7YtTvgipqw==
X-CSE-MsgGUID: IT/3nCrgR7as1+VWXrSlEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="137866239"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2025 23:43:29 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF5pu-00017G-1U;
	Wed, 14 May 2025 06:43:26 +0000
Date: Wed, 14 May 2025 14:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] drivers/dma/imx-sdma.c:240:
 warning: Function parameter or member 'uart_2_mcu_rom_addr' not described in
 'sdma_script_start_addrs'
Message-ID: <202505141442.5wojnyVA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0caacc39200ed39c9449b0b8da1ffc26e2402876
commit: 6b8af9f967499ed92676296615424601401d82a6 [1/1] dmaengine: imx-sdma: fix init of uart scripts
config: arm-randconfig-2002-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141442.5wojnyVA-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141442.5wojnyVA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141442.5wojnyVA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'ap_2_ap_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'ap_2_bp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'ap_2_ap_fixed_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'bp_2_ap_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'loopback_on_dsp_side_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'mcu_interrupt_only_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'firi_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'firi_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'per_2_firi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'mcu_2_firi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'uart_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'uart_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'per_2_app_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'mcu_2_app_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'per_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'uartsh_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'uartsh_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'per_2_shp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'mcu_2_shp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'ata_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'mcu_2_ata_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'app_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'app_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'shp_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'shp_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'mshc_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'mcu_2_mshc_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'spdif_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'mcu_2_spdif_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'asrc_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'ext_mem_2_ipu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'descrambler_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'dptc_dvfs_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'utra_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'ram_code_start_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'mcu_2_ssish_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'ssish_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'hdmi_dma_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'zcanfd_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'zqspi_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'mcu_2_ecspi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'mcu_2_sai_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'sai_2_mcu_addr' not described in 'sdma_script_start_addrs'
>> drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'uart_2_mcu_rom_addr' not described in 'sdma_script_start_addrs'
>> drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'uartsh_2_mcu_rom_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:240: warning: Function parameter or member 'mcu_2_zqspi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:444: warning: Function parameter or member 'terminated' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:444: warning: Function parameter or member 'is_ram_script' not described in 'sdma_channel'


vim +240 drivers/dma/imx-sdma.c

8391ecf465ec5c Shengjiu Wang      2015-07-10  174  
f9d4a398f121b0 Nicolin Chen       2017-09-14  175  #define SDMA_DMA_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
f9d4a398f121b0 Nicolin Chen       2017-09-14  176  				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
f9d4a398f121b0 Nicolin Chen       2017-09-14  177  				 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES))
f9d4a398f121b0 Nicolin Chen       2017-09-14  178  
f9d4a398f121b0 Nicolin Chen       2017-09-14  179  #define SDMA_DMA_DIRECTIONS	(BIT(DMA_DEV_TO_MEM) | \
f9d4a398f121b0 Nicolin Chen       2017-09-14  180  				 BIT(DMA_MEM_TO_DEV) | \
f9d4a398f121b0 Nicolin Chen       2017-09-14  181  				 BIT(DMA_DEV_TO_DEV))
f9d4a398f121b0 Nicolin Chen       2017-09-14  182  
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  183  /**
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  184   * struct sdma_script_start_addrs - SDMA script start pointers
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  185   *
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  186   * start addresses of the different functions in the physical
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  187   * address space of the SDMA engine.
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  188   */
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  189  struct sdma_script_start_addrs {
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  190  	s32 ap_2_ap_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  191  	s32 ap_2_bp_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  192  	s32 ap_2_ap_fixed_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  193  	s32 bp_2_ap_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  194  	s32 loopback_on_dsp_side_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  195  	s32 mcu_interrupt_only_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  196  	s32 firi_2_per_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  197  	s32 firi_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  198  	s32 per_2_firi_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  199  	s32 mcu_2_firi_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  200  	s32 uart_2_per_addr;
6b8af9f967499e Kevin Groeneveld   2022-04-10  201  	s32 uart_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  202  	s32 per_2_app_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  203  	s32 mcu_2_app_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  204  	s32 per_2_per_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  205  	s32 uartsh_2_per_addr;
6b8af9f967499e Kevin Groeneveld   2022-04-10  206  	s32 uartsh_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  207  	s32 per_2_shp_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  208  	s32 mcu_2_shp_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  209  	s32 ata_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  210  	s32 mcu_2_ata_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  211  	s32 app_2_per_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  212  	s32 app_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  213  	s32 shp_2_per_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  214  	s32 shp_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  215  	s32 mshc_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  216  	s32 mcu_2_mshc_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  217  	s32 spdif_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  218  	s32 mcu_2_spdif_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  219  	s32 asrc_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  220  	s32 ext_mem_2_ipu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  221  	s32 descrambler_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  222  	s32 dptc_dvfs_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  223  	s32 utra_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  224  	s32 ram_code_start_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  225  	/* End of v1 array */
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  226  	s32 mcu_2_ssish_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  227  	s32 ssish_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  228  	s32 hdmi_dma_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  229  	/* End of v2 array */
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  230  	s32 zcanfd_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  231  	s32 zqspi_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  232  	s32 mcu_2_ecspi_addr;
b98ce2f4e32bef Robin Gong         2021-07-14  233  	s32 mcu_2_sai_addr;
b98ce2f4e32bef Robin Gong         2021-07-14  234  	s32 sai_2_mcu_addr;
6b8af9f967499e Kevin Groeneveld   2022-04-10  235  	s32 uart_2_mcu_rom_addr;
6b8af9f967499e Kevin Groeneveld   2022-04-10  236  	s32 uartsh_2_mcu_rom_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  237  	/* End of v3 array */
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  238  	s32 mcu_2_zqspi_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  239  	/* End of v4 array */
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20 @240  };
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  241  

:::::: The code at line 240 was first introduced by commit
:::::: 8d11cfb0c37547bd6b1cdc7c2653c1e6b5ec5abb dmaengine: imx-sdma: Remove platform data header

:::::: TO: Vladimir Zapolskiy <vz@mleia.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
