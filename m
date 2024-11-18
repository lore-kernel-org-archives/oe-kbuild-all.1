Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD648126BF5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 05:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731909197; cv=none; b=Je32cdnW2CyJL2pD+r7ini+GMrOk+6OaEz32DA7nEy3K2XHp0dHBroVUyCrqFB6YhpAtOu5F4XK8ZNqBZEFewHsRuvl9cVi8FLIfM0P0ITM6li9EYLTV53cBLO0Tg14X4n5aHe2vpF16+wiuFUlhFX/uaaGj4pLT9qaZ8dB8Fao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731909197; c=relaxed/simple;
	bh=Oq8RjwoLmF7zmH+oj+stJZbJ/ba5SGHffUmho6tv4zA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DZ+l+bo2gq4Nf73f/SGQ5aJgrwZGcYKMNdvoUUUkfD9e0gYITLPBpyVbMzArXs/T+wMy8zFcGYY2QMJJBDX94lM5/0rdhNoNCZp1kkPWAMZ51f5A5HuniiYvw2DbwqoypHH3OEmcAbEXux+NtyVhcb5YWRHuZsK2y7XOerEfWUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4de2cVI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4de2cVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731909195; x=1763445195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oq8RjwoLmF7zmH+oj+stJZbJ/ba5SGHffUmho6tv4zA=;
  b=Q4de2cVIop6n86M87u1CxfVtohyoOvPvfH0DAyZZrooGjW/djK+B+/zy
   l9SSm7TmFRtCv2cDrCkkm/5W8dHw9/0bV7stp4UyuGkCES7lZ+N9oWYvh
   f2jdMbvSxrzNZWpeHJIceVccTxv/qGOGbJ5oVw5/aC/vUltM15O2B/7uo
   Oghy+SCO+Fa+U8Qiyz5vCRxmZ+j8sLALtTBhhbpZsOWey0bIazOwBwvr1
   ZsP5Tu7UXtDTrvwvIHOe3l47nVOBu+C+mYm4Z6R6fX2WRp1WScIuSdrNi
   5n9iChR+tMyGEJhEzmoa5azynWKGWBvT7iY7+Zis2/vLEkwWVnNzEk5FC
   Q==;
X-CSE-ConnectionGUID: 9dhBmux4Rla3/Y0JNggc9g==
X-CSE-MsgGUID: xGdAZJ7IQSmYduaB03o8og==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35763217"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="35763217"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 21:53:14 -0800
X-CSE-ConnectionGUID: hFQ1k4VHTLiNoD1JEWkgaA==
X-CSE-MsgGUID: +9hwr25PQjKf6UE38mi3Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="93196584"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Nov 2024 21:53:12 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCuhC-0002If-1K;
	Mon, 18 Nov 2024 05:53:10 +0000
Date: Mon, 18 Nov 2024 13:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 20/54]
 drivers/media/platform/apple/isp/isp-fw.c:290:53: warning: right shift count
 >= width of type
Message-ID: <202411181305.zq9iQDPp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   168f992948f0f021255ff3cfb365098fd122a225
commit: 71fe5bbcb639393e679bc25ba6a99e477f33b942 [20/54] media: apple: isp: Support >32bit VAs for t602x
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241118/202411181305.zq9iQDPp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181305.zq9iQDPp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181305.zq9iQDPp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/apple/isp/isp-fw.c:216:5: warning: no previous prototype for 'apple_isp_alloc_firmware_surface' [-Wmissing-prototypes]
     216 | int apple_isp_alloc_firmware_surface(struct apple_isp *isp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:235:6: warning: no previous prototype for 'apple_isp_free_firmware_surface' [-Wmissing-prototypes]
     235 | void apple_isp_free_firmware_surface(struct apple_isp *isp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_firmware_boot_stage2':
>> drivers/media/platform/apple/isp/isp-fw.c:290:53: warning: right shift count >= width of type [-Wshift-count-overflow]
     290 |         isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
         |                                                     ^~
   In file included from include/linux/printk.h:599,
                    from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/processor.h:11,
                    from include/linux/sched.h:13,
                    from include/linux/delay.h:23,
                    from drivers/media/platform/apple/isp/isp-fw.c:4:
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_fill_channel_info':
   drivers/media/platform/apple/isp/isp-drv.h:237:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 9 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                             ^~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:237:9: note: in expansion of macro 'dev_dbg'
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:382:17: note: in expansion of macro 'isp_dbg'
     382 |                 isp_dbg(isp, "chan: %s type: %d src: %d num: %d iova: 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_collect_gc_surface':
   drivers/media/platform/apple/isp/isp-drv.h:237:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                             ^~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:237:9: note: in expansion of macro 'dev_dbg'
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:533:17: note: in expansion of macro 'isp_dbg'
     533 |                 isp_dbg(isp, "freeing iova: 0x%llx size: 0x%llx virt: %pS\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c: At top level:
   drivers/media/platform/apple/isp/isp-fw.c:601:5: warning: no previous prototype for 'apple_isp_firmware_boot' [-Wmissing-prototypes]
     601 | int apple_isp_firmware_boot(struct apple_isp *isp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:622:6: warning: no previous prototype for 'apple_isp_firmware_shutdown' [-Wmissing-prototypes]
     622 | void apple_isp_firmware_shutdown(struct apple_isp *isp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +290 drivers/media/platform/apple/isp/isp-fw.c

   245	
   246	static int isp_firmware_boot_stage2(struct apple_isp *isp)
   247	{
   248		struct isp_firmware_bootargs args;
   249		dma_addr_t args_iova;
   250		int err, retries;
   251	
   252		u32 num_ipc_chans = isp_gpio_read32(isp, ISP_GPIO_0);
   253		u32 args_offset = isp_gpio_read32(isp, ISP_GPIO_1);
   254		u32 extra_size = isp_gpio_read32(isp, ISP_GPIO_3);
   255		isp->num_ipc_chans = num_ipc_chans;
   256	
   257		if (!isp->num_ipc_chans) {
   258			dev_err(isp->dev, "No IPC channels found\n");
   259			return -ENODEV;
   260		}
   261	
   262		if (isp->num_ipc_chans != 7)
   263			dev_warn(isp->dev, "unexpected channel count (%d)\n",
   264				 num_ipc_chans);
   265	
   266		isp->extra_surf = isp_alloc_surface_vmap(isp, extra_size);
   267		if (!isp->extra_surf) {
   268			isp_err(isp, "failed to alloc surface for extra heap\n");
   269			return -ENOMEM;
   270		}
   271	
   272		args_iova = isp->ipc_surf->iova + args_offset + 0x40;
   273		isp->cmd_iova = args_iova + sizeof(args) + 0x40;
   274	
   275		memset(&args, 0, sizeof(args));
   276		args.ipc_iova = isp->ipc_surf->iova;
   277		args.ipc_size = isp->ipc_surf->size;
   278		args.shared_base = isp->fw.heap_top & 0xffffffff;
   279		args.shared_size = 0x10000000UL - args.shared_base;
   280		args.extra_iova = isp->extra_surf->iova;
   281		args.extra_size = isp->extra_surf->size;
   282		args.platform_id = isp->hw->platform_id;
   283		args.unk5 = 0x40;
   284		args.unk7 = 0x1;
   285		args.unk_iova1 = args_iova + sizeof(args) - 0xc;
   286		args.unk9 = 0x3;
   287		isp_iowrite(isp, args_iova, &args, sizeof(args));
   288	
   289		isp_gpio_write32(isp, ISP_GPIO_0, args_iova);
 > 290		isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
   291		wmb();
   292	
   293		/* Wait for ISP_GPIO_7 to 0xf7fbdff9 -> 0x8042006 */
   294		isp_gpio_write32(isp, ISP_GPIO_7, 0xf7fbdff9);
   295	
   296		for (retries = 0; retries < ISP_FIRMWARE_MAX_TRIES; retries++) {
   297			u32 val = isp_gpio_read32(isp, ISP_GPIO_7);
   298			if (val == 0x8042006) {
   299				isp_dbg(isp,
   300					"got second magic number (0x%x) from firmware\n",
   301					val);
   302				break;
   303			}
   304			mdelay(ISP_FIRMWARE_MDELAY);
   305		}
   306		if (retries >= ISP_FIRMWARE_MAX_TRIES) {
   307			isp_err(isp,
   308				"never received second magic number from firmware\n");
   309			err = -ENODEV;
   310			goto free_extra;
   311		}
   312	
   313		return 0;
   314	
   315	free_extra:
   316		isp_free_surface(isp, isp->extra_surf);
   317		return err;
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
