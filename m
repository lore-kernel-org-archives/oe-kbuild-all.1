Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6766AA2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 05:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBND7JPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699074695; x=1730610695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZetTN3N1fi2mQt8G+MEkP9rDjTU6qKdrLWmQy9IVTU=;
  b=MBND7JPoHBq+B0cR9THdvEOXBFLDs36hMGxsIpZjrfn0yXuKQdUkH6S1
   xksnPNTXVCXEhdI4tAX2A4i9OFYNzKOxKqf9yLBXKwIHBr9MGoj5eipjx
   cptOHsiP2eJv0yS1DYiad+WPfkiija1Q6qpCBGC3zOfXl7O3Os1oZgvlP
   8i5zEJfdpHy1Qyf9u8RzZ7JnirdGEoVNIv8Rn1ebDR9SrZu2e2fSel2/Q
   HB3wCnJFEi0s69dZZI2GK5ZJXdKc4H8WNQU7E8qqKr8jzODvqXt0MhUIl
   9l2RkHrGG1hxhsPcEMP+zBG+Oi7RdMx/TVSMilPdALk2IOAiB5z3bhXDd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="2018598"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="2018598"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 22:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1093275068"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="1093275068"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Nov 2023 22:11:31 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz8wT-0003Sm-1m;
	Sat, 04 Nov 2023 05:11:29 +0000
Date: Sat, 4 Nov 2023 13:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/240-isp 20/56]
 drivers/media/platform/apple/isp/isp-fw.c:289:53: warning: right shift count
 >= width of type
Message-ID: <202311041306.GPBNIBCI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   b5b7f780ce17699202c057aff11992dbde545241
commit: b87aed78442345ce0de4a0d39f00d92eb5d41090 [20/56] media: apple: isp: Support >32bit VAs for t602x
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041306.GPBNIBCI-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041306.GPBNIBCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041306.GPBNIBCI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/apple/isp/isp-fw.c:215:5: warning: no previous prototype for 'apple_isp_alloc_firmware_surface' [-Wmissing-prototypes]
     215 | int apple_isp_alloc_firmware_surface(struct apple_isp *isp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:234:6: warning: no previous prototype for 'apple_isp_free_firmware_surface' [-Wmissing-prototypes]
     234 | void apple_isp_free_firmware_surface(struct apple_isp *isp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_firmware_boot_stage2':
>> drivers/media/platform/apple/isp/isp-fw.c:289:53: warning: right shift count >= width of type [-Wshift-count-overflow]
     289 |         isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
         |                                                     ^~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/xtensa/include/asm/current.h:18,
                    from include/linux/sched.h:12,
                    from include/linux/delay.h:23,
                    from drivers/media/platform/apple/isp/isp-fw.c:4:
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_fill_channel_info':
   drivers/media/platform/apple/isp/isp-drv.h:237:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 9 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                             ^~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:237:9: note: in expansion of macro 'dev_dbg'
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:381:17: note: in expansion of macro 'isp_dbg'
     381 |                 isp_dbg(isp, "chan: %s type: %d src: %d num: %d iova: 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_collect_gc_surface':
   drivers/media/platform/apple/isp/isp-drv.h:237:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                             ^~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:237:9: note: in expansion of macro 'dev_dbg'
     237 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:532:17: note: in expansion of macro 'isp_dbg'
     532 |                 isp_dbg(isp, "freeing iova: 0x%llx size: 0x%llx virt: %pS\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c: At top level:
   drivers/media/platform/apple/isp/isp-fw.c:600:5: warning: no previous prototype for 'apple_isp_firmware_boot' [-Wmissing-prototypes]
     600 | int apple_isp_firmware_boot(struct apple_isp *isp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:621:6: warning: no previous prototype for 'apple_isp_firmware_shutdown' [-Wmissing-prototypes]
     621 | void apple_isp_firmware_shutdown(struct apple_isp *isp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +289 drivers/media/platform/apple/isp/isp-fw.c

   244	
   245	static int isp_firmware_boot_stage2(struct apple_isp *isp)
   246	{
   247		struct isp_firmware_bootargs args;
   248		dma_addr_t args_iova;
   249		int err, retries;
   250	
   251		u32 num_ipc_chans = isp_gpio_read32(isp, ISP_GPIO_0);
   252		u32 args_offset = isp_gpio_read32(isp, ISP_GPIO_1);
   253		u32 extra_size = isp_gpio_read32(isp, ISP_GPIO_3);
   254		isp->num_ipc_chans = num_ipc_chans;
   255	
   256		if (!isp->num_ipc_chans) {
   257			dev_err(isp->dev, "No IPC channels found\n");
   258			return -ENODEV;
   259		}
   260	
   261		if (isp->num_ipc_chans != 7)
   262			dev_warn(isp->dev, "unexpected channel count (%d)\n",
   263				 num_ipc_chans);
   264	
   265		isp->extra_surf = isp_alloc_surface_vmap(isp, extra_size);
   266		if (!isp->extra_surf) {
   267			isp_err(isp, "failed to alloc surface for extra heap\n");
   268			return -ENOMEM;
   269		}
   270	
   271		args_iova = isp->ipc_surf->iova + args_offset + 0x40;
   272		isp->cmd_iova = args_iova + sizeof(args) + 0x40;
   273	
   274		memset(&args, 0, sizeof(args));
   275		args.ipc_iova = isp->ipc_surf->iova;
   276		args.ipc_size = isp->ipc_surf->size;
   277		args.shared_base = isp->fw.heap_top & 0xffffffff;
   278		args.shared_size = 0x10000000UL - args.shared_base;
   279		args.extra_iova = isp->extra_surf->iova;
   280		args.extra_size = isp->extra_surf->size;
   281		args.platform_id = isp->hw->platform_id;
   282		args.unk5 = 0x40;
   283		args.unk7 = 0x1;
   284		args.unk_iova1 = args_iova + sizeof(args) - 0xc;
   285		args.unk9 = 0x3;
   286		isp_iowrite(isp, args_iova, &args, sizeof(args));
   287	
   288		isp_gpio_write32(isp, ISP_GPIO_0, args_iova);
 > 289		isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
   290		wmb();
   291	
   292		/* Wait for ISP_GPIO_7 to 0xf7fbdff9 -> 0x8042006 */
   293		isp_gpio_write32(isp, ISP_GPIO_7, 0xf7fbdff9);
   294	
   295		for (retries = 0; retries < ISP_FIRMWARE_MAX_TRIES; retries++) {
   296			u32 val = isp_gpio_read32(isp, ISP_GPIO_7);
   297			if (val == 0x8042006) {
   298				isp_dbg(isp,
   299					"got second magic number (0x%x) from firmware\n",
   300					val);
   301				break;
   302			}
   303			mdelay(ISP_FIRMWARE_MDELAY);
   304		}
   305		if (retries >= ISP_FIRMWARE_MAX_TRIES) {
   306			isp_err(isp,
   307				"never received second magic number from firmware\n");
   308			err = -ENODEV;
   309			goto free_extra;
   310		}
   311	
   312		return 0;
   313	
   314	free_extra:
   315		isp_free_surface(isp, isp->extra_surf);
   316		return err;
   317	}
   318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
