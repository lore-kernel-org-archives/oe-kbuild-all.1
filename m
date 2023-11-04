Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D655F2D623
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 07:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cotGpc+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699082055; x=1730618055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xrq/vAeBRPMj9+LA2d1+8RmOvXx5sMNSXIhN2QiPtiA=;
  b=cotGpc+KHBzVyy5yY9wyjKuC3Jf+c+hexlE0pb3Fvee7gYprPl0OVmjT
   t7pzGCyOTiBfTTCGJEazkDCcvQPuAwHQPN+0sbI4rzV4HFNfaQRnZnQ0J
   pbzx4NaKtsL7BFZ41O+89nfzPDbBxtD4W+cHfwV1jolLX/7JvjEMKUrnr
   HhS1QDOXzgnOoxEDjzEUnRcpBtskLmBiFm4Ml7y/6LB0w5ImQeQ2rb1MJ
   Fneq2PBju59e6ILJIJ5oybXBzHNkYvX7c4/+z9XsXhNRw2gPVU1n9nvl/
   2vpsvE2qe1cRNMsBN/8PK+wYKuwo040JZvWshaBp1LMWsiAuncvXSVFb1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="2027628"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="2027628"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 00:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="885420177"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="885420177"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Nov 2023 00:14:11 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzArB-0003cC-0C;
	Sat, 04 Nov 2023 07:14:09 +0000
Date: Sat, 4 Nov 2023 15:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/240-isp 37/56]
 drivers/media/platform/apple/isp/isp-fw.c:42:5: warning: no previous
 prototype for 'apple_isp_power_up_domains'
Message-ID: <202311041537.aeb3wsEi-lkp@intel.com>
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
commit: 34b060f63773b359661354e20ba0ac197ad3b4ee [37/56] media: apple: isp: Make sub-pmdomain handling explicit
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041537.aeb3wsEi-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041537.aeb3wsEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041537.aeb3wsEi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/isp/isp-fw.c:42:5: warning: no previous prototype for 'apple_isp_power_up_domains' [-Wmissing-prototypes]
      42 | int apple_isp_power_up_domains(struct apple_isp *isp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:65:6: warning: no previous prototype for 'apple_isp_power_down_domains' [-Wmissing-prototypes]
      65 | void apple_isp_power_down_domains(struct apple_isp *isp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_firmware_boot_stage2':
   drivers/media/platform/apple/isp/isp-fw.c:383:53: warning: right shift count >= width of type [-Wshift-count-overflow]
     383 |         isp_gpio_write32(isp, ISP_GPIO_1, args_iova >> 32);
         |                                                     ^~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/xtensa/include/asm/current.h:18,
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
