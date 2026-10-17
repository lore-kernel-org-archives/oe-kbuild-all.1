Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813A43C09F3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792273383; cv=none; b=f1tIt+9FRSRKpc8iHr6cxPCRVUp1lMLpcE2dFBRr2+MhTaMnh5EQY5klJJWq0yGicWC5xbHb0a8RmxR+5lywH8E/94+T80AmvsAmxdtHl/GoQNyq64EqAG+z3nmYUMQWLS/DoY1RarQid3/QTRORaetYcYApNVRThAJ1HFG38XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792273383; c=relaxed/simple;
	bh=edxF9zRxjcb2fGcGNq5TzE6aHlncckKHYsf6MY3JJ8w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X6SeiqM1zZoIuA7IK7Ntp3xUFDmwf1clIANcsYcVCZr73AdCIJhH55Yqe6RVdrrKiPciHjXPd6VfrkzI817JIh3Od/uUztP5m/IK/CsLl7shJ8+XeMj/UKIgoifH5/SZwZKvw+XHSBwgzfGr1UKWRL3w8d8azcQaSItroLH9Xe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNogzkrI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNogzkrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792273382; x=1823809382;
  h=date:from:to:cc:subject:message-id;
  bh=edxF9zRxjcb2fGcGNq5TzE6aHlncckKHYsf6MY3JJ8w=;
  b=gNogzkrI5wHX5Yn1YB1Qv3ILu10vdH2d37lDHVeNX6GsbaA2nkGk2EQC
   cyxza6z6ztgW1mbvRYK9rPA70rfA7/vuoNrp1OrJW+K5Zc5adI28KY7fu
   ecF095e4/YlhxZRG41bINHfxUFz6SE49EJGEbjONGKbwFslRCdCrAzets
   QI53NrETtMrj9zU1Qn5mQ/rxJvOiYPObnOfh9VVMSp9Q+z2OLCZifVcMs
   J9KRgLTps/vmPtc81cJvoCzQ/OKZFrWlgdNoC/jt+zjbFe4u4E4qiGPbh
   4B7yi/Vq7WST5OLcc54cJmYXGnz00gRltoocAmfycErYB0LI1osNg7qXs
   Q==;
X-CSE-ConnectionGUID: ijdy4RfcTHaK33Yn+cil8A==
X-CSE-MsgGUID: 7ePnK5iWSS6PY7EMqCSAIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1037128"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1037128"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 14:43:01 -0700
X-CSE-ConnectionGUID: KAEnf/jcS8W6xN1dibtT3A==
X-CSE-MsgGUID: APL11jz8QGC0vIHslpLlQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2267608"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Oct 2026 14:42:59 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xICB7-00000000JmQ-0kws;
	Sat, 17 Oct 2026 21:42:57 +0000
Date: Sun, 18 Oct 2026 05:42:01 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 52/92]
 drivers/media/platform/apple/isp/isp-fw.c:416:61: warning: right shift count
 >= width of type
Message-ID: <202610180534.rL1ULUYQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   c792edd0ffb515a81db3e039bc6e2a611c51d65b
commit: 1379752d0e631dc84f4d25aac3b3a62900938e68 [52/92] media: apple: isp: Support system sleep
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261018/202610180534.rL1ULUYQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180534.rL1ULUYQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180534.rL1ULUYQ-lkp@intel.com/

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
