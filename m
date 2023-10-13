Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A5210787
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRwvQiib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697197472; x=1728733472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XfOUM+MtDKDqrVCEI+i+2WqC6htgxw4jKdM6LdjgS4E=;
  b=kRwvQiibAOnYZVn81KthVQZxcd5Ee8DC1/PmZ+3F7TLSff7edsRj/8J8
   60NrzRFiHD+RTZ8tJ17vBxYCs1MNDEjZYfujAxlwo9Wwz6AaPKZFmx0t4
   lyDj/iNVDlzAPg6QXXM5jgFKU6FTv1mAcDwBxSRoTeqZ2EZ5WaOx3iqfk
   O0QZyFDWBjmET6tLl/rYyCyZ1FQMwrEBfkJrQ/0fiO5QF8Pu7S07sOsWT
   6N8USUpoQOLeGZrY/va7IIdKzbC4pjUkwhR0qtTY1+zuCvs4m/lleqUqP
   aFzHBmEOx7zPf6M/me3gqmSAxNxReiQChN29TrWCTjGTp+KzUYeTHhLk/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382393006"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="382393006"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001920120"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="1001920120"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Oct 2023 04:44:30 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrGai-0004h5-0l;
	Fri, 13 Oct 2023 11:44:28 +0000
Date: Fri, 13 Oct 2023 19:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 2861/15768]
 drivers/firmware/imx/ele_mu.h:16:47: warning: format '%ld' expects argument
 of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202310131915.SDoCbmWD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pankaj,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 0f48af6a075ccbe33eda05977a05995508e6d4a8 [2861/15768] LF-4776 sentnl-mu: added f_ops read-write & allcate IO buffer
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231013/202310131915.SDoCbmWD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131915.SDoCbmWD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131915.SDoCbmWD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:5,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/firmware/imx/ele_mu.c:8:
   drivers/firmware/imx/ele_mu.c: In function 'ele_mu_fops_write':
>> drivers/firmware/imx/ele_mu.h:16:47: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      16 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/firmware/imx/ele_mu.h:16:17: note: in expansion of macro 'dev_dbg'
      16 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/ele_mu.h:35:9: note: in expansion of macro 'miscdev_dbg'
      35 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/ele_mu.c:181:9: note: in expansion of macro 'devctx_dbg'
     181 |         devctx_dbg(dev_ctx, "write from buf (%p)%ld, ppos=%lld\n", buf, size,
         |         ^~~~~~~~~~
   drivers/firmware/imx/ele_mu.h:30:47: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      30 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/ele_mu.h:30:17: note: in expansion of macro 'dev_err'
      30 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/ele_mu.h:39:9: note: in expansion of macro 'miscdev_err'
      39 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/ele_mu.c:193:17: note: in expansion of macro 'devctx_err'
     193 |                 devctx_err(dev_ctx, "User buffer too small(%ld < %x)\n", size, 0x4);
         |                 ^~~~~~~~~~
   drivers/firmware/imx/ele_mu.h:30:47: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      30 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/ele_mu.h:30:17: note: in expansion of macro 'dev_err'
      30 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/ele_mu.h:39:9: note: in expansion of macro 'miscdev_err'
      39 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/ele_mu.c:201:17: note: in expansion of macro 'devctx_err'
     201 |                 devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
         |                 ^~~~~~~~~~
>> drivers/firmware/imx/ele_mu.h:30:47: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
      30 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/ele_mu.h:30:17: note: in expansion of macro 'dev_err'
      30 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/ele_mu.h:39:9: note: in expansion of macro 'miscdev_err'
      39 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/ele_mu.c:201:17: note: in expansion of macro 'devctx_err'
     201 |                 devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
         |                 ^~~~~~~~~~
   drivers/firmware/imx/ele_mu.c: In function 'ele_mu_fops_read':
>> drivers/firmware/imx/ele_mu.h:16:47: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      16 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/firmware/imx/ele_mu.h:16:17: note: in expansion of macro 'dev_dbg'
      16 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/ele_mu.h:35:9: note: in expansion of macro 'miscdev_dbg'
      35 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/ele_mu.c:286:9: note: in expansion of macro 'devctx_dbg'
     286 |         devctx_dbg(dev_ctx, "read to buf %p(%ld), ppos=%lld\n", buf, size,
         |         ^~~~~~~~~~
   drivers/firmware/imx/ele_mu.h:16:47: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      16 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/firmware/imx/ele_mu.h:16:17: note: in expansion of macro 'dev_dbg'
      16 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/ele_mu.h:35:9: note: in expansion of macro 'miscdev_dbg'
      35 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/ele_mu.c:313:17: note: in expansion of macro 'devctx_dbg'
     313 |                 devctx_dbg(dev_ctx, "User buffer too small (%ld < %d)\n",
         |                 ^~~~~~~~~~


vim +16 drivers/firmware/imx/ele_mu.h

e18e8a757c46a2 Pankaj Gupta 2021-11-18  11  
e18e8a757c46a2 Pankaj Gupta 2021-11-18  12  /* macro to log operation of a misc device */
e18e8a757c46a2 Pankaj Gupta 2021-11-18  13  #define miscdev_dbg(p_miscdev, fmt, va_args...)                                \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  14  	({                                                                     \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  15  		struct miscdevice *_p_miscdev = p_miscdev;                     \
e18e8a757c46a2 Pankaj Gupta 2021-11-18 @16  		dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  17  		##va_args);                                                    \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  18  	})
e18e8a757c46a2 Pankaj Gupta 2021-11-18  19  
e18e8a757c46a2 Pankaj Gupta 2021-11-18  20  #define miscdev_info(p_miscdev, fmt, va_args...)                               \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  21  	({                                                                     \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  22  		struct miscdevice *_p_miscdev = p_miscdev;                     \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  23  		dev_info((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name, \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  24  		##va_args);                                                    \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  25  	})
e18e8a757c46a2 Pankaj Gupta 2021-11-18  26  
e18e8a757c46a2 Pankaj Gupta 2021-11-18  27  #define miscdev_err(p_miscdev, fmt, va_args...)                                \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  28  	({                                                                     \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  29  		struct miscdevice *_p_miscdev = p_miscdev;                     \
e18e8a757c46a2 Pankaj Gupta 2021-11-18 @30  		dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  31  		##va_args);                                                    \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  32  	})
e18e8a757c46a2 Pankaj Gupta 2021-11-18  33  /* macro to log operation of a device context */
e18e8a757c46a2 Pankaj Gupta 2021-11-18  34  #define devctx_dbg(p_devctx, fmt, va_args...) \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  35  	miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
e18e8a757c46a2 Pankaj Gupta 2021-11-18  36  #define devctx_info(p_devctx, fmt, va_args...) \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  37  	miscdev_info(&((p_devctx)->miscdev), fmt, ##va_args)
e18e8a757c46a2 Pankaj Gupta 2021-11-18  38  #define devctx_err(p_devctx, fmt, va_args...) \
e18e8a757c46a2 Pankaj Gupta 2021-11-18  39  	miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
e18e8a757c46a2 Pankaj Gupta 2021-11-18  40  

:::::: The code at line 16 was first introduced by commit
:::::: e18e8a757c46a2b3086ef6e8c1d126776e96f036 firmware: imx: added the character driver

:::::: TO: Pankaj Gupta <pankaj.gupta@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
