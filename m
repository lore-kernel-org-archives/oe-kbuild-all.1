Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38AF392C34
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 05:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782712364; cv=none; b=B4b+JHqGaNf2UGQgffYxBcqUShx2Bn2XeNMsYGyq/xsJXNqyMvWXIrEmYeq3BL4xKcJjiFafBEB16J0eGYDSpNUhTQ0UG0XhFGgFvnpH7RTE5fgsrImHXV/YaxAU2toQfm+MFgBYulL1sQxMcGS1FEn3/1NvfpmC4dSVcfDq45g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782712364; c=relaxed/simple;
	bh=yymBmu+qG8xN6hornWL4Q52x3zRaCMvP+6JK8ebqhMI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DoE2qyD/fQnljFaKjSSUqQgKJHukTcl4e4pXRQV+9NqtuaKUMBuig9AWicc819d1GZWkRZAcAW2QT5nGqj63M2AJgE4aXd/3FCJcPyD5WyeXud/zeGDgKk9TyFmfA6h6u0kzH2r//v/hFATZlO1T00cRKksCmKK+ElP35tqr1Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ycn1b1Cm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ycn1b1Cm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782712363; x=1814248363;
  h=date:from:to:cc:subject:message-id;
  bh=yymBmu+qG8xN6hornWL4Q52x3zRaCMvP+6JK8ebqhMI=;
  b=Ycn1b1CmyR4uXJ7VgCvoMEXH+6YI/+zofr+y99090rtKSYGKmpApuvER
   08sGLl2FEzQOcipj0MOmVDZ4pMG4/Rp361Aby890KZuilMQ0z1bLIBmW/
   6k2wVF88Zxxtp0iAABIJ2gxeZhhlSBwF9eS8scIhEvrFrgw0rLOPBBIFf
   Zz6rsWpGgvZqtg7d1e6TtDrNogU4Y1395CmEOdllpWNGG5/ZpSqz2t4Un
   ykEbhbqG6NjynAMZRrAva6ES6GIT38ZtPpJYN04FuzfpqnLXReS8FrJiq
   6O0ESxk7BYGHbPu5DLltNQErxmz1rZrLeBjVPjSeMBP8/Ci5De6x35OWR
   w==;
X-CSE-ConnectionGUID: VkvTlH2yRdiNlnIF6yiCPA==
X-CSE-MsgGUID: YOpZSur+T7ywTC3wXkyn0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="93744189"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="93744189"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 22:52:41 -0700
X-CSE-ConnectionGUID: GQHIUG6PSbWIBmDr0eWI6g==
X-CSE-MsgGUID: 7cIBOEneQqm/Ew3nLC58Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="255820613"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 Jun 2026 22:52:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1we4v6-00000000733-1NvA;
	Mon, 29 Jun 2026 05:52:36 +0000
Date: Mon, 29 Jun 2026 13:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 20/53]
 drivers/media/platform/apple/isp/isp-fw.c:295:61: warning: right shift count
 >= width of type
Message-ID: <202606291315.bBStSTEP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   df907add385f43a49d493c59afd3762ae1598548
commit: f295ca6ad4b4662ba63cfb311d4582352cd03132 [20/53] media: apple: isp: Support >32bit VAs for t602x
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260629/202606291315.bBStSTEP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291315.bBStSTEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291315.bBStSTEP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from include/media/v4l2-common.h:106,
                    from include/media/v4l2-subdev.h:15,
                    from include/media/v4l2-device.h:13,
                    from drivers/media/platform/apple/isp/isp-drv.h:13,
                    from drivers/media/platform/apple/isp/isp-cmd.h:7,
                    from drivers/media/platform/apple/isp/isp-fw.c:8:
   include/linux/highmem.h: In function 'clear_user_pages':
   include/linux/highmem.h:234:63: warning: parameter 'vaddr' set but not used [-Wunused-but-set-parameter=]
     234 | static inline void clear_user_pages(void *addr, unsigned long vaddr,
         |                                                 ~~~~~~~~~~~~~~^~~~~
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_firmware_boot_stage2':
>> drivers/media/platform/apple/isp/isp-fw.c:295:61: warning: right shift count >= width of type [-Wshift-count-overflow]
     295 |                 isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
         |                                                             ^~


vim +295 drivers/media/platform/apple/isp/isp-fw.c

   246	
   247	static int isp_firmware_boot_stage2(struct apple_isp *isp)
   248	{
   249		struct isp_firmware_bootargs args;
   250		dma_addr_t args_iova;
   251		int err, retries;
   252	
   253		u32 num_ipc_chans = isp_gpio_read32(isp, ISP_GPIO_0);
   254		u32 args_offset = isp_gpio_read32(isp, ISP_GPIO_1);
   255		u32 extra_size = isp_gpio_read32(isp, ISP_GPIO_3);
   256		isp->num_ipc_chans = num_ipc_chans;
   257	
   258		if (!isp->num_ipc_chans) {
   259			dev_err(isp->dev, "No IPC channels found\n");
   260			return -ENODEV;
   261		}
   262	
   263		if (isp->num_ipc_chans != 7)
   264			dev_warn(isp->dev, "unexpected channel count (%d)\n",
   265				 num_ipc_chans);
   266	
   267		isp->extra_surf = isp_alloc_surface_vmap(isp, extra_size);
   268		if (!isp->extra_surf) {
   269			isp_err(isp, "failed to alloc surface for extra heap\n");
   270			return -ENOMEM;
   271		}
   272	
   273		args_iova = isp->ipc_surf->iova + args_offset + 0x40;
   274		isp->cmd_iova = args_iova + sizeof(args) + 0x40;
   275	
   276		memset(&args, 0, sizeof(args));
   277		args.ipc_iova = isp->ipc_surf->iova;
   278		args.ipc_size = isp->ipc_surf->size;
   279		args.shared_base = isp->fw.heap_top & 0xffffffff;
   280		args.shared_size = 0x10000000UL - args.shared_base;
   281		args.extra_iova = isp->extra_surf->iova;
   282		args.extra_size = isp->extra_surf->size;
   283		args.platform_id = isp->hw->platform_id;
   284		args.unk5 = 0x40;
   285		args.unk7 = 0x1;
   286		args.unk_iova1 = args_iova + sizeof(args) - 0xc;
   287		args.unk9 = 0x3;
   288		isp_iowrite(isp, args_iova, &args, sizeof(args));
   289	
   290		isp_gpio_write32(isp, ISP_GPIO_0, args_iova);
   291		/* TODO: handle this via Kconfig depends? hardware is only present on
   292		 *       64-bit SoCs.
   293		 */
   294		if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
 > 295			isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
   296		wmb();
   297	
   298		/* Wait for ISP_GPIO_7 to 0xf7fbdff9 -> 0x8042006 */
   299		isp_gpio_write32(isp, ISP_GPIO_7, 0xf7fbdff9);
   300	
   301		for (retries = 0; retries < ISP_FIRMWARE_MAX_TRIES; retries++) {
   302			u32 val = isp_gpio_read32(isp, ISP_GPIO_7);
   303			if (val == 0x8042006) {
   304				isp_dbg(isp,
   305					"got second magic number (0x%x) from firmware\n",
   306					val);
   307				break;
   308			}
   309			mdelay(ISP_FIRMWARE_MDELAY);
   310		}
   311		if (retries >= ISP_FIRMWARE_MAX_TRIES) {
   312			isp_err(isp,
   313				"never received second magic number from firmware\n");
   314			err = -ENODEV;
   315			goto free_extra;
   316		}
   317	
   318		return 0;
   319	
   320	free_extra:
   321		isp_free_surface(isp, isp->extra_surf);
   322		return err;
   323	}
   324	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
