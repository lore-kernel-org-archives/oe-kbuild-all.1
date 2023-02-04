Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07D57C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 23:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675553881; x=1707089881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xx5stoqKnP3eUpqMOydnKXrUv4+NElOWhadWVPaDRKo=;
  b=T8stH33iwpojXhglhhcvGkP19FGQ3uQW8DzPihDNfmIWJYnoL03uDHPG
   F1kMN/MFiJML9gvUm39URdkyJKPzfXJOK5k1w0wwUWIpl/GKqh8iBEfKE
   BD5U7tlSMYqjJUo9juZYPGuZ1wZSVS70CZoILtbLHkre02JYpZQPlnihh
   sYr+9p9nNP68RFCKDb8ZiO/6vhpuyB/fjWK6/9InEWpAWFZar0Zv9uBwW
   ORkCmbSHYaKwZixKXYdSyf0w3+9jUCQk8Hc/GlRcraXQr1EH27SUC6yZU
   jEaTOrHrclOsw9QGJnTuux9R9/kv7OzL3s4K56Al5DlX/b+YGXxXWMOCU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="317005790"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="317005790"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 15:38:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="668038122"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="668038122"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Feb 2023 15:38:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOS6Z-0001Zw-1f;
	Sat, 04 Feb 2023 23:37:59 +0000
Date: Sun, 5 Feb 2023 07:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 3171/20208]
 drivers/firmware/imx/seco_mu.c:188:47: warning: format '%ld' expects
 argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned
 int'}
Message-ID: <202302050757.jNCETQsX-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: cbe5e27a90341a3c43c9457554c47475d0712d7b [3171/20208] LF-824: fw: imx: seco_mu: Add driver for SECO
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230205/202302050757.jNCETQsX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/cbe5e27a90341a3c43c9457554c47475d0712d7b
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout cbe5e27a90341a3c43c9457554c47475d0712d7b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/firmware/imx/ drivers/net/ethernet/freescale/fman/ drivers/pwm/ drivers/staging/ drivers/tty/serial/ net/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:555,
                    from include/linux/kernel.h:19,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/firmware/imx/seco_mu.c:57:
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
https://github.com/intel/lkp-tests
