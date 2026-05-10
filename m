Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF412FFDCC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 05:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778392358; cv=none; b=YAUDNWcWxbRDWGNmDdV1uV20wba7PHRTur0kYot+Wcj9D2Gx/ixnsRTE9jr3Z6hdP/uvRTaiEBYuWNuPjOYiklf/vlv+dtq3KngYSDGyLn9N6b3pNgH28t4zwBw6ANzrLbTH7QePigQzpxEN3hRlnHh1o8M/PCHxmLL+FTkivvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778392358; c=relaxed/simple;
	bh=PDsrG9rniHvzRmZ/MCuPJTKhgBLf3DI/kD+aAkOL7Fg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KgJsmw2K5ssyw2JDW8yBExalqBOiO9tpw31TBek1zpuqCM5EGk2rS4gp1rjiLHvBU3JVZRYtj97FlZQkD91b5RTVgKCsBpfB3L1QIicbF4B4+uNHtHI723/UPfM2FFkz6PQwdFihBjE0DiWpbIM0gpoAs99qOYQbfGtx34/0DV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hF+bymD9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hF+bymD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778392357; x=1809928357;
  h=date:from:to:cc:subject:message-id;
  bh=PDsrG9rniHvzRmZ/MCuPJTKhgBLf3DI/kD+aAkOL7Fg=;
  b=hF+bymD98Kh9e4uLSle36TRiSZkk6XyHNY67usYWqXz6Yg4P0YfOYKQy
   A8TqgDtHHJDXtFAM1vTct6MpMJELhaniI3tsiQPY2SuUr//U8wruZJ0jL
   LokE1DxM3iYWfOSblEIkP9gZGrhrowT3tbCeLkDO/f5dYeW9HCgJvCkyS
   JSKe28uSgbkUe1Dc46kWSQLama8FtFYFeRs01FS8L/NCu/ZYzyUxclFXc
   OWqx4Jbck127B+hHGLw1rz/hcbgadBmuUM+cSa4J4MgOzB+GRh9aRLvEK
   SFCtsvLkOhqS3BK/INg0JBuGk7Is5chAhlCZj2pq3H75wM35nJU1o2O5W
   w==;
X-CSE-ConnectionGUID: pHeuYbk8TISREZ5i7KmOsA==
X-CSE-MsgGUID: lb1g3iGVR8y+hHPJcQqxhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="89902379"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="89902379"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 22:52:34 -0700
X-CSE-ConnectionGUID: ZmiXjY51Qo+bCcxrT2iZFw==
X-CSE-MsgGUID: EQs/GKXOTzmADmMn2c5nCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="236310375"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 May 2026 22:52:32 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLx5Z-000000001oN-2nuj;
	Sun, 10 May 2026 05:52:29 +0000
Date: Sun, 10 May 2026 13:52:14 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 20/53]
 drivers/media/platform/apple/isp/isp-fw.c:290:53: warning: right shift count
 >= width of type
Message-ID: <202605101315.wClGqJyr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   50d4a0c32a10908320be6a9f3971221f726d4a20
commit: ea1d8ea146083e1beae8ebba03a97a558205cec6 [20/53] media: apple: isp: Support >32bit VAs for t602x
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260510/202605101315.wClGqJyr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101315.wClGqJyr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605101315.wClGqJyr-lkp@intel.com/

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
   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from include/asm-generic/bitops.h:31,
                    from ./arch/nios2/include/generated/asm/bitops.h:1,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/nios2/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12,
                    from drivers/media/platform/apple/isp/isp-fw.c:4:
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_fill_channel_info':
   drivers/media/platform/apple/isp/isp-drv.h:237:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 9 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                             ^~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
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
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
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
