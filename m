Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1C5662
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693560336; x=1725096336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TsIKM4w+iFMRVT1tDTbkZPtkAsSKFFauaVhrNy/YL9c=;
  b=PF6NT/bW/myuJkzh58zWSZJtNwe91lcedFfTU6rEBLfVHRRY1Xm2cRT0
   dgB4hoRxJ/55/qqHmQPGwOE5Rc9wPxXJmMlDBjK7F2xPvp5AtDJS+Ox+8
   4TmVXbVfwnsVHxIxPoFvfexdUQaUUWfpdYmyVsgaIget92av0XZWd6z8z
   5w/dDVE4mQ9DAyvMHIXiYCT7p2HI+jSOk5XKo86GiB/IuKCpUJ97KQv2z
   BrOcB6cPmw4DwadWsLLRmEqDo3vDo5/sS7o7d2u8vncnA+zl/evfPbND4
   TZ98MIPwdM+dGQJcvRLRI8iFy6tw7CHDEKeatJpy4zVoOUWxDav7vsfXT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440157757"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="440157757"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 02:25:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863489977"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="863489977"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Sep 2023 02:25:32 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc0PC-000187-16;
	Fri, 01 Sep 2023 09:25:30 +0000
Date: Fri, 1 Sep 2023 17:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3171/24603]
 drivers/firmware/imx/seco_mu.c:188:47: warning: format '%ld' expects
 argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned
 int'}
Message-ID: <202309011701.nrNwkKUS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Silvano,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: cbe5e27a90341a3c43c9457554c47475d0712d7b [3171/24603] LF-824: fw: imx: seco_mu: Add driver for SECO
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230901/202309011701.nrNwkKUS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011701.nrNwkKUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011701.nrNwkKUS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/dma-mapping.h:7,
                    from drivers/firmware/imx/seco_mu.c:57:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1349:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1349 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1335:27: note: 'mem_section' declared here
    1335 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from include/linux/printk.h:555,
                    from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:5,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15:
   drivers/firmware/imx/seco_mu.c: In function 'seco_mu_fops_write':
>> drivers/firmware/imx/seco_mu.c:188:47: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     188 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dynamic_debug.h:134:29: note: in definition of macro '__dynamic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynamic_func_call'
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/firmware/imx/seco_mu.c:188:17: note: in expansion of macro 'dev_dbg'
     188 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:208:9: note: in expansion of macro 'miscdev_dbg'
     208 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:375:9: note: in expansion of macro 'devctx_dbg'
     375 |         devctx_dbg(dev_ctx, "write from buf (%p)%ld, ppos=%lld\n", buf, size,
         |         ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:202:47: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     202 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/seco_mu.c:202:17: note: in expansion of macro 'dev_err'
     202 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:212:9: note: in expansion of macro 'miscdev_err'
     212 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:387:17: note: in expansion of macro 'devctx_err'
     387 |                 devctx_err(dev_ctx, "User buffer too small(%ld < %lu)\n", size,
         |                 ^~~~~~~~~~
>> drivers/firmware/imx/seco_mu.c:202:47: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
     202 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/seco_mu.c:202:17: note: in expansion of macro 'dev_err'
     202 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:212:9: note: in expansion of macro 'miscdev_err'
     212 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:387:17: note: in expansion of macro 'devctx_err'
     387 |                 devctx_err(dev_ctx, "User buffer too small(%ld < %lu)\n", size,
         |                 ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:202:47: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     202 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/seco_mu.c:202:17: note: in expansion of macro 'dev_err'
     202 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:212:9: note: in expansion of macro 'miscdev_err'
     212 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:394:17: note: in expansion of macro 'devctx_err'
     394 |                 devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
         |                 ^~~~~~~~~~
>> drivers/firmware/imx/seco_mu.c:202:47: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
     202 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/seco_mu.c:202:17: note: in expansion of macro 'dev_err'
     202 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:212:9: note: in expansion of macro 'miscdev_err'
     212 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:394:17: note: in expansion of macro 'devctx_err'
     394 |                 devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
         |                 ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c: In function 'seco_mu_fops_read':
>> drivers/firmware/imx/seco_mu.c:188:47: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     188 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dynamic_debug.h:134:29: note: in definition of macro '__dynamic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynamic_func_call'
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/firmware/imx/seco_mu.c:188:17: note: in expansion of macro 'dev_dbg'
     188 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:208:9: note: in expansion of macro 'miscdev_dbg'
     208 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:501:9: note: in expansion of macro 'devctx_dbg'
     501 |         devctx_dbg(dev_ctx, "read to buf %p(%ld), ppos=%lld\n", buf, size,
         |         ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:188:47: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     188 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dynamic_debug.h:134:29: note: in definition of macro '__dynamic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynamic_func_call'
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/firmware/imx/seco_mu.c:188:17: note: in expansion of macro 'dev_dbg'
     188 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:208:9: note: in expansion of macro 'miscdev_dbg'
     208 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:528:17: note: in expansion of macro 'devctx_dbg'
     528 |                 devctx_dbg(dev_ctx, "User buffer too small (%ld < %d)\n",
         |                 ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c: In function 'seco_mu_ioctl_shared_mem_cfg_handler':
   drivers/firmware/imx/seco_mu.c:621:35: error: implicit declaration of function 'devm_ioremap_nocache'; did you mean 'devm_ioremap_release'? [-Werror=implicit-function-declaration]
     621 |         dev_ctx->secure_mem.ptr = devm_ioremap_nocache(dev_ctx->dev,
         |                                   ^~~~~~~~~~~~~~~~~~~~
         |                                   devm_ioremap_release
   drivers/firmware/imx/seco_mu.c:621:33: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     621 |         dev_ctx->secure_mem.ptr = devm_ioremap_nocache(dev_ctx->dev,
         |                                 ^
   cc1: some warnings being treated as errors


vim +188 drivers/firmware/imx/seco_mu.c

   183	
   184	/* macro to log operation of a misc device */
   185	#define miscdev_dbg(p_miscdev, fmt, va_args...)                                \
   186		({                                                                     \
   187			struct miscdevice *_p_miscdev = p_miscdev;                     \
 > 188			dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
   189			##va_args);                                                    \
   190		})
   191	
   192	#define miscdev_info(p_miscdev, fmt, va_args...)                               \
   193		({                                                                     \
   194			struct miscdevice *_p_miscdev = p_miscdev;                     \
   195			dev_info((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name, \
   196			##va_args);                                                    \
   197		})
   198	
   199	#define miscdev_err(p_miscdev, fmt, va_args...)                                \
   200		({                                                                     \
   201			struct miscdevice *_p_miscdev = p_miscdev;                     \
 > 202			dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
   203			##va_args);                                                    \
   204		})
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
