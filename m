Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394D3266A0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 23:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecDjYqIt"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696462645; x=1727998645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WjTeddrP2UmzxS1SRRH6dp58jX5RK5vDjXVosA3YppI=;
  b=ecDjYqItxjBMB22n3DkwCJPXm8b8PGyguGJiRFetOnhzRrcBoUY7ZgvC
   hulzuuBoDo4VJZx0luu7YKKY8P7123HzpmqrQJeZeCk1/3RNysAEp7Xzl
   n/VC+P8vVCy6UYfBxrJY3ihkK43rc1qRp7tGrgotkYQIxT+oILGAgg8Ea
   tBsrIn1QhA1ObxXVZM3KXPr1F9m459PHd1sRd73R1glKvZ2NzAGAw3JJy
   Ky2kKaFp0/YmaY5IrZetMDHeo2q6hGs6MUf18gSHVYN/p7FKZqcH4oF7h
   xDfazKuDBLUhUuj8yJzIhgIJQoGluoGXx6CyLoBJwodrKHUldmsHOBku9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="4904437"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="4904437"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 16:37:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701399652"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="701399652"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Oct 2023 16:37:22 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoBQd-000Kkq-2x;
	Wed, 04 Oct 2023 23:37:19 +0000
Date: Thu, 5 Oct 2023 07:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:isp/t602x-v2 7/18]
 drivers/media/platform/apple/isp/isp-fw.c:42:5: warning: no previous
 prototype for 'apple_isp_power_up_domains'
Message-ID: <202310050723.2OmAiStO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux isp/t602x-v2
head:   cce1006b80f31d7795f8f5e3f8c6b4be731498ac
commit: 0120a27f25f904e4d1bb8a9aa83af6e25758fb68 [7/18] isp: Make sub-pmdomain handling explicit
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20231005/202310050723.2OmAiStO-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050723.2OmAiStO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050723.2OmAiStO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/isp/isp-fw.c:42:5: warning: no previous prototype for 'apple_isp_power_up_domains' [-Wmissing-prototypes]
      42 | int apple_isp_power_up_domains(struct apple_isp *isp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/apple/isp/isp-fw.c:65:6: warning: no previous prototype for 'apple_isp_power_down_domains' [-Wmissing-prototypes]
      65 | void apple_isp_power_down_domains(struct apple_isp *isp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_firmware_boot_stage2':
   drivers/media/platform/apple/isp/isp-fw.c:383:53: warning: right shift count >= width of type [-Wshift-count-overflow]
     383 |         isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
         |                                                     ^~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:5,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/mutex.h:14,
                    from drivers/media/platform/apple/isp/isp-drv.h:8,
                    from drivers/media/platform/apple/isp/isp-fw.h:7,
                    from drivers/media/platform/apple/isp/isp-fw.c:4:
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_fill_channel_info':
   drivers/media/platform/apple/isp/isp-drv.h:270:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 9 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     270 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
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
   drivers/media/platform/apple/isp/isp-drv.h:270:9: note: in expansion of macro 'dev_dbg'
     270 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:490:17: note: in expansion of macro 'isp_dbg'
     490 |                 isp_dbg(isp, "chan: %s type: %d src: %d num: %d iova: 0x%llx\n",
         |                 ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_collect_gc_surface':
   drivers/media/platform/apple/isp/isp-drv.h:270:29: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     270 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
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
   drivers/media/platform/apple/isp/isp-drv.h:270:9: note: in expansion of macro 'dev_dbg'
     270 |         dev_dbg((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |         ^~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:652:17: note: in expansion of macro 'isp_dbg'
     652 |                 isp_dbg(isp, "freeing iova: 0x%llx size: 0x%llx virt: %pS\n",
         |                 ^~~~~~~


vim +/apple_isp_power_up_domains +42 drivers/media/platform/apple/isp/isp-fw.c

    41	
  > 42	int apple_isp_power_up_domains(struct apple_isp *isp)
    43	{
    44		int ret;
    45	
    46		if (isp->pds_active)
    47			return 0;
    48	
    49		for (int i = 1; i < isp->pd_count; i++) {
    50			ret = pm_runtime_get_sync(isp->pd_dev[i]);
    51			if (ret < 0) {
    52				dev_err(isp->dev,
    53					"Failed to power up power domain %d: %d\n", i, ret);
    54				while (--i != 1)
    55					pm_runtime_put_sync(isp->pd_dev[i]);
    56				return ret;
    57			}
    58		}
    59	
    60		isp->pds_active = true;
    61	
    62		return 0;
    63	}
    64	
  > 65	void apple_isp_power_down_domains(struct apple_isp *isp)
    66	{
    67		int ret;
    68	
    69		if (!isp->pds_active)
    70			return;
    71	
    72		for (int i = isp->pd_count - 1; i >= 1; i--) {
    73			ret = pm_runtime_put_sync(isp->pd_dev[i]);
    74			if (ret < 0)
    75				dev_err(isp->dev,
    76					"Failed to power up power domain %d: %d\n", i, ret);
    77		}
    78	
    79		isp->pds_active = false;
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
