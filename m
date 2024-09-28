Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F9C17736
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 21:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727558884; cv=none; b=c4gv2fD+uPfPQDhT4wjYj466S+4tDdExsmgCsoCE5KPCbBScbObUNrBcBiFZgUxJXje4C3AjXAqnrTOq2B/Er3F2g8M9wKVRJ81nbJx2+iknqQjr0BRtdES0+dooPHvz4cFxlKkppAned1xojm+YRFfKjFMBT3aCnPrflydNHHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727558884; c=relaxed/simple;
	bh=kJEwxj0hbNU7yOotx9jcrw+IjYI9kW8fq9Eue/IOdfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQHzoPMgFfgJ7qep5Q9l7dKHy02KfKPp8hTy0AQz2PP6MjmP/lH/b3aqjzTEEW5Mve6+UckemOo7aQy5UTiYJz00zCHVpYfYsGSdQTq/3sEPK6fwtkMfaKFqotsdGGOQKnnDyhdfw5mFITXYsLE4pqRLEKi/pbLRSFLJZI2RL70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g0w6t7Cv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g0w6t7Cv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727558881; x=1759094881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kJEwxj0hbNU7yOotx9jcrw+IjYI9kW8fq9Eue/IOdfg=;
  b=g0w6t7Cvvirg92UvUuaZTW5PKmSH9bIsMe/ZZl1SjLprtmovZHo+noDK
   N+Xe0bsuryY/1scayKtoQZXWfNsXmlGl2+PnuYfCYflsx4SbV8+B0vYDj
   70ckeO//AssANDvJ2ey5/ex06eBqPytsrjJvxsjxjo1lj1/CD/WUSPPby
   IDVQgxwspKl7agwyg/TFIlWTxDiIiKwIvmVj3l7i2VjwNZ91WsCgQc93b
   Wv4jhZNx2O6ma+UeOdqRGyHat0nAw9uc5xjXVTmUmZ9z/9s/w6Z/P9FDB
   G6uZib7gksyRMDmzDVELGpZqJ6XZN0XLhxEmZcEZfh7ceFRyQeMEXKAZ6
   Q==;
X-CSE-ConnectionGUID: dpvI3KaURBiMvgg6QirFxQ==
X-CSE-MsgGUID: uRGySS1fS9ivQm+H3pm7Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26553907"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26553907"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 14:28:01 -0700
X-CSE-ConnectionGUID: dv34OwGmTgGB3sYsRpJKcA==
X-CSE-MsgGUID: 2b//yrvUSYuKQkjzQBouUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72455200"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2024 14:27:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sueyr-000NfP-0R;
	Sat, 28 Sep 2024 21:27:57 +0000
Date: Sun, 29 Sep 2024 05:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 1188/16788]
 drivers/dma/imx-sdma.c:257: warning: Function parameter or member
 'i2c_2_mcu_addr' not described in 'sdma_script_start_addrs'
Message-ID: <202409290510.m2PEcqfL-lkp@intel.com>
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
commit: ea52796d5dd8aba0c0722ec6e886db6fd045875c [1188/16788] MLK-25266: dmaengine: imx-sdma: add i2c dma support
config: arm-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290510.m2PEcqfL-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290510.m2PEcqfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290510.m2PEcqfL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'ap_2_ap_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'ap_2_bp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'ap_2_ap_fixed_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'bp_2_ap_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'loopback_on_dsp_side_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mcu_interrupt_only_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'firi_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'firi_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'per_2_firi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mcu_2_firi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'uart_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'uart_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'per_2_app_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mcu_2_app_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'per_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'uartsh_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'uartsh_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'per_2_shp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mcu_2_shp_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'ata_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mcu_2_ata_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'app_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'app_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'shp_2_per_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'shp_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mshc_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mcu_2_mshc_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'spdif_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mcu_2_spdif_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'asrc_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'ext_mem_2_ipu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'descrambler_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'dptc_dvfs_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'utra_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'ram_code_start_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mcu_2_ssish_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'ssish_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'hdmi_dma_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'zcanfd_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'zqspi_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mcu_2_ecspi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mcu_2_sai_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'sai_2_mcu_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'uart_2_mcu_rom_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'uartsh_2_mcu_rom_addr' not described in 'sdma_script_start_addrs'
>> drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'i2c_2_mcu_addr' not described in 'sdma_script_start_addrs'
>> drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mcu_2_i2c_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:257: warning: Function parameter or member 'mcu_2_zqspi_addr' not described in 'sdma_script_start_addrs'
   drivers/dma/imx-sdma.c:477: warning: Function parameter or member 'audio_config' not described in 'sdma_channel'
   drivers/dma/imx-sdma.c:477: warning: Function parameter or member 'prio' not described in 'sdma_channel'


vim +257 drivers/dma/imx-sdma.c

824a0a02cd7477 Sascha Hauer       2022-04-14  197  
c705c35b1cebeb Robin Gong         2018-01-16  198  /**
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  199   * struct sdma_script_start_addrs - SDMA script start pointers
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  200   *
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  201   * start addresses of the different functions in the physical
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  202   * address space of the SDMA engine.
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  203   */
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  204  struct sdma_script_start_addrs {
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  205  	s32 ap_2_ap_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  206  	s32 ap_2_bp_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  207  	s32 ap_2_ap_fixed_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  208  	s32 bp_2_ap_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  209  	s32 loopback_on_dsp_side_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  210  	s32 mcu_interrupt_only_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  211  	s32 firi_2_per_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  212  	s32 firi_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  213  	s32 per_2_firi_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  214  	s32 mcu_2_firi_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  215  	s32 uart_2_per_addr;
a3ae97f4c87d95 Kevin Groeneveld   2022-04-10  216  	s32 uart_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  217  	s32 per_2_app_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  218  	s32 mcu_2_app_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  219  	s32 per_2_per_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  220  	s32 uartsh_2_per_addr;
a3ae97f4c87d95 Kevin Groeneveld   2022-04-10  221  	s32 uartsh_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  222  	s32 per_2_shp_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  223  	s32 mcu_2_shp_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  224  	s32 ata_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  225  	s32 mcu_2_ata_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  226  	s32 app_2_per_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  227  	s32 app_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  228  	s32 shp_2_per_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  229  	s32 shp_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  230  	s32 mshc_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  231  	s32 mcu_2_mshc_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  232  	s32 spdif_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  233  	s32 mcu_2_spdif_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  234  	s32 asrc_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  235  	s32 ext_mem_2_ipu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  236  	s32 descrambler_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  237  	s32 dptc_dvfs_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  238  	s32 utra_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  239  	s32 ram_code_start_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  240  	/* End of v1 array */
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  241  	s32 mcu_2_ssish_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  242  	s32 ssish_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  243  	s32 hdmi_dma_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  244  	/* End of v2 array */
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  245  	s32 zcanfd_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  246  	s32 zqspi_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  247  	s32 mcu_2_ecspi_addr;
b98ce2f4e32bef Robin Gong         2021-07-14  248  	s32 mcu_2_sai_addr;
b98ce2f4e32bef Robin Gong         2021-07-14  249  	s32 sai_2_mcu_addr;
a3ae97f4c87d95 Kevin Groeneveld   2022-04-10  250  	s32 uart_2_mcu_rom_addr;
a3ae97f4c87d95 Kevin Groeneveld   2022-04-10  251  	s32 uartsh_2_mcu_rom_addr;
ea52796d5dd8ab Robin Gong         2021-01-09  252  	s32 i2c_2_mcu_addr;
ea52796d5dd8ab Robin Gong         2021-01-09  253  	s32 mcu_2_i2c_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  254  	/* End of v3 array */
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  255  	s32 mcu_2_zqspi_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  256  	/* End of v4 array */
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20 @257  };
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  258  

:::::: The code at line 257 was first introduced by commit
:::::: 8d11cfb0c37547bd6b1cdc7c2653c1e6b5ec5abb dmaengine: imx-sdma: Remove platform data header

:::::: TO: Vladimir Zapolskiy <vz@mleia.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
