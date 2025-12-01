Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05659219A89
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 20:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764622418; cv=none; b=bAAMJ9iSJqr/jbfOMFIAMmKHZDV7u1m8mY+BQ4cNp1JT2dHRGSpYwr4ACSXkj6JHnfZ3DzOPsnAqBgYtRlovxWmlsbCVuPH+wswIodp+za9XzCEMfUNsXueX/Wdo+JOWsOwJSynn30jzXl9MJ/sRqqudK0/iaf9WCXdJ8U2gIW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764622418; c=relaxed/simple;
	bh=e2k8MTS6fcb/DkNgPqo7pGJb/JrILMGQckyF/cUO/DU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kb3qXSTaQuiaFNU7WZVMqBjgqazbjj0kEGrdWeeSQrBjfM2Mg75FSgtRa134QcHops+IS4vSWZ/FXIvhh+PYvhGlKFhp4WL1fdnwynjuUIekXie3jXCEqw7/i7fy3T+V18mTQUq7XO9SJP/Y76vEXhtELYO1PjSrrX1WfhRrT7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjwKVZ1e; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjwKVZ1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764622417; x=1796158417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e2k8MTS6fcb/DkNgPqo7pGJb/JrILMGQckyF/cUO/DU=;
  b=IjwKVZ1eUVn33H+43cUj5Hpu2hhPNcBqB5tgkw+9J0mruidr1A/4tkZB
   XMYXxNqyXIOiKB5YYCj8I6SHD16q6tkyWOt7YSzNLGuY+K0DEdJJv+JnH
   gFMhta9Tt8DPlRplh5TkwDytNepn7HXSS3BggW6XgDp4VTtotp92xPg66
   xG+yLL5tzW1ikr5OTINgEZ3WDLXvSN/X8h+76PrfDXkgx2GlrVNy6Pvwz
   4UbmQXDC1IpuRpRM0Mum/RE/XZ+pCTjyH7HckYkmtGqQ1GCzJTGhZ60S2
   87ECH+0fOi/axhJHMBgmlErdDUryifYkPivdQ1GObCfw0My3XSfDRtAMQ
   g==;
X-CSE-ConnectionGUID: UOryvRGYR5G/2H/SUqJpJg==
X-CSE-MsgGUID: JBeNpIMDSBu4QUVW2+IXSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70191668"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="70191668"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 12:53:37 -0800
X-CSE-ConnectionGUID: QbxxbonMSxGnlUGvionB8g==
X-CSE-MsgGUID: /WE5LY6pQ7qIaoieOEwJnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194006693"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2025 12:53:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQAtp-0000000098Y-0Ymi;
	Mon, 01 Dec 2025 20:53:33 +0000
Date: Tue, 2 Dec 2025 04:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Subject: [thesofproject:topic/sof-dev 1/2] sof-client-fw-gdb.c:undefined
 reference to `sof_client_ipc4_find_debug_slot_offset_by_type'
Message-ID: <202512020419.NLmVcheW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   719a32e28d1c6578fd8f87977a5d4d2d8fc4ba0b
commit: d3741c24e014995094ed83665def277828ef881b [1/2] ASoC: SOF: mediatek: mt8195: Add prefixes to avoid duplicate symbols
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20251202/202512020419.NLmVcheW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020419.NLmVcheW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020419.NLmVcheW-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/mtd/nand/ecc-realtek.o: in function `rtl_ecc_remove':
   ecc-realtek.c:(.text+0x2d4): undefined reference to `dma_free_pages'
   sh4-linux-ld: drivers/mtd/nand/ecc-realtek.o: in function `rtl_ecc_probe':
   ecc-realtek.c:(.text+0x41c): undefined reference to `dma_alloc_pages'
   sh4-linux-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_resume':
   air_en8811h.c:(.text+0x948): undefined reference to `clk_restore_context'
   sh4-linux-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_suspend':
   air_en8811h.c:(.text+0x984): undefined reference to `clk_save_context'
   sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
   tc358746.c:(.text+0x19f0): undefined reference to `devm_clk_hw_register'
   sh4-linux-ld: tc358746.c:(.text+0x19fc): undefined reference to `devm_of_clk_add_hw_provider'
   sh4-linux-ld: tc358746.c:(.text+0x1a00): undefined reference to `of_clk_hw_simple_get'
   sh4-linux-ld: sound/soc/sof/sof-client-fw-gdb.o: in function `sof_fw_gdb_dfs_write':
>> sof-client-fw-gdb.c:(.text+0x3f0): undefined reference to `sof_client_ipc4_find_debug_slot_offset_by_type'
   sh4-linux-ld: sound/soc/sof/sof-client-fw-gdb.o: in function `sof_fw_gdb_poll_work':
   sof-client-fw-gdb.c:(.text+0x908): undefined reference to `sof_client_ipc4_find_debug_slot_offset_by_type'
   sh4-linux-ld: sound/soc/sof/sof-client-fw-gdb.o: in function `sof_fw_gdb_dfs_poll':
   sof-client-fw-gdb.c:(.text+0xa74): undefined reference to `sof_client_ipc4_find_debug_slot_offset_by_type'
   sh4-linux-ld: sound/soc/sof/sof-client-fw-gdb.o: in function `sof_fw_gdb_dfs_read':
   sof-client-fw-gdb.c:(.text+0xc3c): undefined reference to `sof_client_ipc4_find_debug_slot_offset_by_type'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
