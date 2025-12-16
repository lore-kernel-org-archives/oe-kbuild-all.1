Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687AD2EC553
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876144; cv=none; b=AyRwsll5CoR+lrJ/hu6eeYQYe+wRGluqM5eS5zasgtps/hRi5FvG3Bz2tG4nLEi4SVQRfKUHMKtoMxutlqdJdHtj1tE/bMYC/FaymGlPyV3D6FfqsZu24Br28U6p4I0H7okDlsSkT0DgbLo0wy5wAEwpefvccXe/GVT1ccZn9bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876144; c=relaxed/simple;
	bh=2PoSk09AY7ByPw2MAJsbZdXOA3osXIAjKsNjVuh9OUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=No7nn98iBPsUS/OcqP7aELXdFVBOCoHiNxKYEOFMDePxE21hHOlGLQYdPRrnRuAIFPvJgS8WlVjGwqB9Qk7yGMfBXe2kH38BeilZq4RiuXyi/pQ5lyZAq6FqMR8bpLkKRwNBNoV3gzt0UCD16NxeZG7xGP3mJwP3bJfq8o9m3o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWJHfAbw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWJHfAbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765876142; x=1797412142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2PoSk09AY7ByPw2MAJsbZdXOA3osXIAjKsNjVuh9OUU=;
  b=kWJHfAbwnyR6bziXlC1VDnyddZ5A1fKVlzc9GzLkq2RM0xCuIp7mkCG+
   itP7cUlIHke3cFTSZGhcc41bwpU0PLeVfTeTOeMxqDX+8XRwhtc3JARgp
   ct6eOP1VPDJoU/8jvyb3X6jiYUMKoBQMytQOHT7xB08UC82RllM9TeyTP
   pwllY2nC5NDIL433M/aC8YBKatAKMbEn7PjjCK13JDB+1afOtqSyklGDA
   /QAs0L/08Gwt/DZIS+8gYhn63/b5G1bnBpoUulvY7VfEju1O/QpMGtZa2
   hsBqDKi54fzmYO0Po5zBiMD/H0cQtK+TWhhBMcJ+Jzpzgw23VlAvWMpW8
   Q==;
X-CSE-ConnectionGUID: lGtYLXStQ5y06T9cjcBvOg==
X-CSE-MsgGUID: hYbOKvlKSjWaNGBIHmeoDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67671476"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67671476"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 01:09:02 -0800
X-CSE-ConnectionGUID: b+ib/xPyS2CJODwZoIii7g==
X-CSE-MsgGUID: vyEa6mbaQWO8SwsFNLD4bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197713422"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 01:09:01 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVR37-000000001Q6-2FcW;
	Tue, 16 Dec 2025 09:08:54 +0000
Date: Tue, 16 Dec 2025 17:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2] drivers/dma/imx-sdma.c:240:
 warning: Function parameter or member 'uart_2_mcu_rom_addr' not described in
 'sdma_script_start_addrs'
Message-ID: <202512161714.BSYItgVH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kevin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: 6b8af9f967499ed92676296615424601401d82a6 [2/2] dmaengine: imx-sdma: fix init of uart scripts
config: arm-randconfig-r072-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161714.BSYItgVH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161714.BSYItgVH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161714.BSYItgVH-lkp@intel.com/

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
