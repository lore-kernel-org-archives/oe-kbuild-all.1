Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB7118633
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727554476; cv=none; b=pOG3SeWwvzpHrsDWefkhnFrvnpIi4rsKbUNloX0MySJed0hxCbhdNrTDUluKA4dmFs8EolfOpMYahi9YIhRcRpoK7WG8ciIesZkcIT1FJZKbCncvI/92eiAfeeBQRdWlYrVJ8sOFdi2/azJi/YNvmyKrWAhCH0KBxpMjSGyK/sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727554476; c=relaxed/simple;
	bh=HpV7DKe+F8V9Gyxt3TWZfdbNx0R+bDlxt/23vjW6PGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ryoQh8FqvY9qIJ2gB0MtYyD+J4zKV898s4lV6BNk5+x83st3r+oR+aSQN3XMKISJk/RalssAa7WXUIWGYjjdqZrwo1MB7BpMxDN+kZyJMwbsubtiZ9rVOUy+PZ/uy9lQWcqfHMaT0eiIEXYygRWEBUeDCrLvwhMD3Ktr9n4G6sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIh1TPZI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIh1TPZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727554474; x=1759090474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HpV7DKe+F8V9Gyxt3TWZfdbNx0R+bDlxt/23vjW6PGg=;
  b=oIh1TPZIrl3UYbfhuk7GwiiLO/3f88aJ2hKI+N9BWcGLNk5aeJEgq1hV
   g97Pf/HWveNPGb9jyrZ5q36mMEV66E3kA5L3kW//F+psaYpE1Ssd3+kR6
   IhUE+Cy4f6EnKeukpR+YhlviU+rY/3QnsuV2OAfUt04VrRM0biSTon76E
   uyWm1tZrtGEw5nk/rInivBskXPdI5cLv4ylu9S+jlvBgDpFB7rNkGt3Di
   4N0cSQVsHGhWs++iQedlfPgdRN1qixiym776wSgO/BWgmdGweWXgD3+12
   ktC89wK8LH0R3mMMa2AtATxUylWoAfiTCVzQ5VI0jO4zaaTDFp+lhvM1f
   Q==;
X-CSE-ConnectionGUID: evpCk8T/SbmnMNJgw5aLsQ==
X-CSE-MsgGUID: E6YL9y6aTfCGsKXUPv0pvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26840610"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26840610"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 13:14:33 -0700
X-CSE-ConnectionGUID: peToTkoOSK+ZVjE7/y1ynQ==
X-CSE-MsgGUID: /f/U9yboRo6vlADmG50j6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73669669"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Sep 2024 13:14:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sudpl-000NZt-1Y;
	Sat, 28 Sep 2024 20:14:29 +0000
Date: Sun, 29 Sep 2024 04:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4915/16788]
 drivers/firmware/imx/seco_mu.c:173:47: warning: format '%ld' expects
 argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned
 int'}
Message-ID: <202409290452.XnvEM4kj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 5b8f160ce229e143c7ce69cf619a7b3fc947d9d5 [4915/16788] LF-824: fw: imx: seco_mu: Add driver for SECO
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290452.XnvEM4kj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290452.XnvEM4kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290452.XnvEM4kj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:30,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:8,
                    from drivers/firmware/imx/seco_mu.c:57:
   drivers/firmware/imx/seco_mu.c: In function 'seco_mu_fops_write':
>> drivers/firmware/imx/seco_mu.c:173:47: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     173 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/firmware/imx/seco_mu.c:173:17: note: in expansion of macro 'dev_dbg'
     173 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:193:9: note: in expansion of macro 'miscdev_dbg'
     193 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:359:9: note: in expansion of macro 'devctx_dbg'
     359 |         devctx_dbg(dev_ctx, "write from buf (%p)%ld, ppos=%lld\n", buf, size,
         |         ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:187:47: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     187 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/seco_mu.c:187:17: note: in expansion of macro 'dev_err'
     187 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:197:9: note: in expansion of macro 'miscdev_err'
     197 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:371:17: note: in expansion of macro 'devctx_err'
     371 |                 devctx_err(dev_ctx, "User buffer too small(%ld < %lu)\n", size,
         |                 ^~~~~~~~~~
>> drivers/firmware/imx/seco_mu.c:187:47: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
     187 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/seco_mu.c:187:17: note: in expansion of macro 'dev_err'
     187 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:197:9: note: in expansion of macro 'miscdev_err'
     197 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:371:17: note: in expansion of macro 'devctx_err'
     371 |                 devctx_err(dev_ctx, "User buffer too small(%ld < %lu)\n", size,
         |                 ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:187:47: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     187 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/seco_mu.c:187:17: note: in expansion of macro 'dev_err'
     187 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:197:9: note: in expansion of macro 'miscdev_err'
     197 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:378:17: note: in expansion of macro 'devctx_err'
     378 |                 devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
         |                 ^~~~~~~~~~
>> drivers/firmware/imx/seco_mu.c:187:47: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
     187 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/seco_mu.c:187:17: note: in expansion of macro 'dev_err'
     187 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:197:9: note: in expansion of macro 'miscdev_err'
     197 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:378:17: note: in expansion of macro 'devctx_err'
     378 |                 devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
         |                 ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c: In function 'seco_mu_fops_read':
>> drivers/firmware/imx/seco_mu.c:173:47: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     173 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/firmware/imx/seco_mu.c:173:17: note: in expansion of macro 'dev_dbg'
     173 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:193:9: note: in expansion of macro 'miscdev_dbg'
     193 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:462:9: note: in expansion of macro 'devctx_dbg'
     462 |         devctx_dbg(dev_ctx, "read to buf %p(%ld), ppos=%lld\n", buf, size,
         |         ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:173:47: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     173 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/firmware/imx/seco_mu.c:173:17: note: in expansion of macro 'dev_dbg'
     173 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:193:9: note: in expansion of macro 'miscdev_dbg'
     193 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:489:17: note: in expansion of macro 'devctx_dbg'
     489 |                 devctx_dbg(dev_ctx, "User buffer too small (%ld < %d)\n",
         |                 ^~~~~~~~~~


vim +173 drivers/firmware/imx/seco_mu.c

   168	
   169	/* macro to log operation of a misc device */
   170	#define miscdev_dbg(p_miscdev, fmt, va_args...)                                \
   171		({                                                                     \
   172			struct miscdevice *_p_miscdev = p_miscdev;                     \
 > 173			dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
   174			##va_args);                                                    \
   175		})
   176	
   177	#define miscdev_info(p_miscdev, fmt, va_args...)                               \
   178		({                                                                     \
   179			struct miscdevice *_p_miscdev = p_miscdev;                     \
   180			dev_info((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name, \
   181			##va_args);                                                    \
   182		})
   183	
   184	#define miscdev_err(p_miscdev, fmt, va_args...)                                \
   185		({                                                                     \
   186			struct miscdevice *_p_miscdev = p_miscdev;                     \
 > 187			dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
   188			##va_args);                                                    \
   189		})
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
