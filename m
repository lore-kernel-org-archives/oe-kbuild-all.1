Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07442FD1DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148996; cv=none; b=IDwN0ZpoKV8misn52J+wCQbQBBZcXTrCWh/Oq/tXfpioCHKUBUqfUv8eWbKh5AoolhEhafaiKAzvf+/6RJFCzlND+WESrWS3T1Yu0yY3LxvFb+8BMxrUXqlrw+z44RW56h8wtqRaimOSTfYeC7nMC1qB7sOerrB0AIpEB3CQPWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148996; c=relaxed/simple;
	bh=QlUkybDJS4ElbB1HrNGY1Q8h2OFp8xbhhoK/sIenH/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WjrDroB3Cek8bzz8qPWShR0E9t7pc+3EnGKC5mu/qtq5mABmfhjSSCO3M534ldPtp0uxfUMDi+Dh+orytiY/MFz/wmwZKgVNgnRbzGVlYqQJsZKXHk1YLivWW6A3/3SF9Bey412BP895387e9xSCVGhXYmlPX5ZaRtgxfFSRYVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyY3mob9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyY3mob9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792148994; x=1823684994;
  h=date:from:to:cc:subject:message-id;
  bh=QlUkybDJS4ElbB1HrNGY1Q8h2OFp8xbhhoK/sIenH/w=;
  b=gyY3mob9n+0M5iunCY0h+1DLOxM7UStujcT/X9BGqyqWlneziRsGyLxv
   uVdG0IVJSoDuRB2jMuUnQLFCRFQW5FK2oIsM41ajdJJEJd8ak/NNuzeKA
   +0OLAYjAbbNj1GuCNtmjrV6wdsFHZ57dS3kB1WSiAPcG7PMt1WnTdf3J2
   Eud6BjlNeetQFx7305KBr7kiCJa8qFqHQYwjSsQb7X6UkXctQuImrlHE5
   VxIFPtE3oDZ+3FW0Y5LkMFG3FUeTiKI9lMWFjO8+PjHt7Zx5YEh1mQzcF
   uAHrVheNp4pQbUu39ZIq3soGZRjqq6rwKk/fLPdhOo/WQp7//HVw6N1bV
   w==;
X-CSE-ConnectionGUID: 9pn2J+uuTk+pVCVqNDjhWw==
X-CSE-MsgGUID: 9gKmsD5cQse71YabrZiYjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="816526"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="816526"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 04:09:53 -0700
X-CSE-ConnectionGUID: efnbIl5oTgSLyLOQp+6Pzg==
X-CSE-MsgGUID: Z3xSHJ4RTpyQVCSm72chkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1806463"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Oct 2026 04:09:52 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHfor-00000000CCZ-2Bgf;
	Fri, 16 Oct 2026 11:09:49 +0000
Date: Fri, 16 Oct 2026 13:09:03 +0200
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 52/92]
 drivers/media/platform/apple/isp/isp-fw.c:416:61: warning: right shift count
 >= width of type
Message-ID: <202610161357.wN9Sa096-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   c792edd0ffb515a81db3e039bc6e2a611c51d65b
commit: 1379752d0e631dc84f4d25aac3b3a62900938e68 [52/92] media: apple: isp: Support system sleep
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261016/202610161357.wN9Sa096-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161357.wN9Sa096-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161357.wN9Sa096-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_firmware_boot_stage2':
>> drivers/media/platform/apple/isp/isp-fw.c:416:61: warning: right shift count >= width of type [-Wshift-count-overflow]
     416 |                 isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
         |                                                             ^~


vim +416 drivers/media/platform/apple/isp/isp-fw.c

ab29b0f6c9c3a2 Eileen Yoon 2023-09-14  364  
a4f0cf2bc24733 Eileen Yoon 2023-08-31  365  static int isp_firmware_boot_stage2(struct apple_isp *isp)
a4f0cf2bc24733 Eileen Yoon 2023-08-31  366  {
a4f0cf2bc24733 Eileen Yoon 2023-08-31  367  	struct isp_firmware_bootargs args;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  368  	dma_addr_t args_iova;
158df310e6b78b Asahi Lina  2023-09-29  369  	void *args_virt;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  370  	int err, retries;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  371  
bda49dae3a59c2 Eileen Yoon 2023-09-02  372  	u32 num_ipc_chans = isp_gpio_read32(isp, ISP_GPIO_0);
bda49dae3a59c2 Eileen Yoon 2023-09-02  373  	u32 args_offset = isp_gpio_read32(isp, ISP_GPIO_1);
bda49dae3a59c2 Eileen Yoon 2023-09-02  374  	u32 extra_size = isp_gpio_read32(isp, ISP_GPIO_3);
a4f0cf2bc24733 Eileen Yoon 2023-08-31  375  	isp->num_ipc_chans = num_ipc_chans;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  376  
a4f0cf2bc24733 Eileen Yoon 2023-08-31  377  	if (!isp->num_ipc_chans) {
a4f0cf2bc24733 Eileen Yoon 2023-08-31  378  		dev_err(isp->dev, "No IPC channels found\n");
a4f0cf2bc24733 Eileen Yoon 2023-08-31  379  		return -ENODEV;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  380  	}
a4f0cf2bc24733 Eileen Yoon 2023-08-31  381  
a4f0cf2bc24733 Eileen Yoon 2023-08-31  382  	if (isp->num_ipc_chans != 7)
a4f0cf2bc24733 Eileen Yoon 2023-08-31  383  		dev_warn(isp->dev, "unexpected channel count (%d)\n",
a4f0cf2bc24733 Eileen Yoon 2023-08-31  384  			 num_ipc_chans);
a4f0cf2bc24733 Eileen Yoon 2023-08-31  385  
a4f0cf2bc24733 Eileen Yoon 2023-08-31  386  	isp->extra_surf = isp_alloc_surface_vmap(isp, extra_size);
a4f0cf2bc24733 Eileen Yoon 2023-08-31  387  	if (!isp->extra_surf) {
a4f0cf2bc24733 Eileen Yoon 2023-08-31  388  		isp_err(isp, "failed to alloc surface for extra heap\n");
ab29b0f6c9c3a2 Eileen Yoon 2023-09-14  389  		return -ENOMEM;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  390  	}
a4f0cf2bc24733 Eileen Yoon 2023-08-31  391  
a4f0cf2bc24733 Eileen Yoon 2023-08-31  392  	args_iova = isp->ipc_surf->iova + args_offset + 0x40;
158df310e6b78b Asahi Lina  2023-09-29  393  	args_virt = isp->ipc_surf->virt + args_offset + 0x40;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  394  	isp->cmd_iova = args_iova + sizeof(args) + 0x40;
158df310e6b78b Asahi Lina  2023-09-29  395  	isp->cmd_virt = args_virt + sizeof(args) + 0x40;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  396  
a4f0cf2bc24733 Eileen Yoon 2023-08-31  397  	memset(&args, 0, sizeof(args));
a4f0cf2bc24733 Eileen Yoon 2023-08-31  398  	args.ipc_iova = isp->ipc_surf->iova;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  399  	args.ipc_size = isp->ipc_surf->size;
b0bf93df947b36 Asahi Lina  2023-09-24  400  	args.shared_base = isp->fw.heap_top & 0xffffffff;
b0bf93df947b36 Asahi Lina  2023-09-24  401  	args.shared_size = 0x10000000UL - args.shared_base;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  402  	args.extra_iova = isp->extra_surf->iova;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  403  	args.extra_size = isp->extra_surf->size;
d5b4f182087535 Asahi Lina  2023-09-24  404  	args.platform_id = isp->platform_id;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  405  	args.unk5 = 0x40;
d5b4f182087535 Asahi Lina  2023-09-24  406  	args.unk7 = 0x1; // 0?
1b040f995778df Eileen Yoon 2023-09-12  407  	args.unk_iova1 = args_iova + sizeof(args) - 0xc;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  408  	args.unk9 = 0x3;
158df310e6b78b Asahi Lina  2023-09-29  409  	memcpy(args_virt, &args, sizeof(args));
a4f0cf2bc24733 Eileen Yoon 2023-08-31  410  
bda49dae3a59c2 Eileen Yoon 2023-09-02  411  	isp_gpio_write32(isp, ISP_GPIO_0, args_iova);
b0bf93df947b36 Asahi Lina  2023-09-24  412  	/* TODO: handle this via Kconfig depends? hardware is only present on
b0bf93df947b36 Asahi Lina  2023-09-24  413  	 *       64-bit SoCs.
b0bf93df947b36 Asahi Lina  2023-09-24  414  	 */
b0bf93df947b36 Asahi Lina  2023-09-24  415  	if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
b0bf93df947b36 Asahi Lina  2023-09-24 @416  		isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
6c8c944c09abe5 Asahi Lina  2023-09-30  417  	dma_wmb();
a4f0cf2bc24733 Eileen Yoon 2023-08-31  418  
bda49dae3a59c2 Eileen Yoon 2023-09-02  419  	/* Wait for ISP_GPIO_7 to 0xf7fbdff9 -> 0x8042006 */
bda49dae3a59c2 Eileen Yoon 2023-09-02  420  	isp_gpio_write32(isp, ISP_GPIO_7, 0xf7fbdff9);
a4f0cf2bc24733 Eileen Yoon 2023-08-31  421  
a4f0cf2bc24733 Eileen Yoon 2023-08-31  422  	for (retries = 0; retries < ISP_FIRMWARE_MAX_TRIES; retries++) {
bda49dae3a59c2 Eileen Yoon 2023-09-02  423  		u32 val = isp_gpio_read32(isp, ISP_GPIO_7);
a4f0cf2bc24733 Eileen Yoon 2023-08-31  424  		if (val == 0x8042006) {
a4f0cf2bc24733 Eileen Yoon 2023-08-31  425  			isp_dbg(isp,
a4f0cf2bc24733 Eileen Yoon 2023-08-31  426  				"got second magic number (0x%x) from firmware\n",
a4f0cf2bc24733 Eileen Yoon 2023-08-31  427  				val);
a4f0cf2bc24733 Eileen Yoon 2023-08-31  428  			break;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  429  		}
a4f0cf2bc24733 Eileen Yoon 2023-08-31  430  		mdelay(ISP_FIRMWARE_MDELAY);
a4f0cf2bc24733 Eileen Yoon 2023-08-31  431  	}
a4f0cf2bc24733 Eileen Yoon 2023-08-31  432  	if (retries >= ISP_FIRMWARE_MAX_TRIES) {
a4f0cf2bc24733 Eileen Yoon 2023-08-31  433  		isp_err(isp,
a4f0cf2bc24733 Eileen Yoon 2023-08-31  434  			"never received second magic number from firmware\n");
a4f0cf2bc24733 Eileen Yoon 2023-08-31  435  		err = -ENODEV;
ab29b0f6c9c3a2 Eileen Yoon 2023-09-14  436  		goto free_extra;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  437  	}
a4f0cf2bc24733 Eileen Yoon 2023-08-31  438  
a4f0cf2bc24733 Eileen Yoon 2023-08-31  439  	return 0;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  440  
a4f0cf2bc24733 Eileen Yoon 2023-08-31  441  free_extra:
a4f0cf2bc24733 Eileen Yoon 2023-08-31  442  	isp_free_surface(isp, isp->extra_surf);
a4f0cf2bc24733 Eileen Yoon 2023-08-31  443  	return err;
a4f0cf2bc24733 Eileen Yoon 2023-08-31  444  }
a4f0cf2bc24733 Eileen Yoon 2023-08-31  445  

:::::: The code at line 416 was first introduced by commit
:::::: b0bf93df947b36673fabbcd0368c901caac60531 media: apple: isp: Support >32bit VAs for t602x

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Janne Grunau <j@jannau.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
