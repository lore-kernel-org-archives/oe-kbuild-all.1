Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E3876026
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 18:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727636402; cv=none; b=RHXHYbt02uq4K2Fwls2kWZk5DFw4D9nzm0PrPJiUSkk2QZEPDhf6noUaHqtM8k5iqZg4Lue0tQjrtYGFaN+isFaIH+1ezXDs5s5mVx4kmf7LOttt5wtWLwl8tbymDy5n2gBdK8bCR5BYXeaVaEueD+Zu/MzoXdY6DZzPh6OgBaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727636402; c=relaxed/simple;
	bh=53VuJw+EET3jj0DPWKFeA7uoAbRNcT41hTwAz11HdMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SvS0oUirbBUmwBHHUU5+KL4sQmNoIr19LO5QMCrOyBdUJuuEkeEingmi7IbuuzLULC89MQmz/eAH4uof1+PNNu4qtY36ldc62z+6VQmlHqfBPh/9OolEeQREGFXw7Yqjme5VuUeoGxLNaizr8FqK0K2UjecLKC/Km4KreLWxQxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hpe0oDFk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hpe0oDFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727636397; x=1759172397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53VuJw+EET3jj0DPWKFeA7uoAbRNcT41hTwAz11HdMg=;
  b=Hpe0oDFkkhDJypWGdif20UGmA8aurt8AH/UpkYMcKVSqOWO74Mzt5zXK
   z85Ezjf3lAi7SM8QBqNUmIYn3W5oC/0IS7VkHnmA14BjRPSdgouyvm6b/
   bFSZK9+Hxv8CtzGOrICWYXF3vK1Zz+dTR2blMfvsOJn/zjd2QtxGSJ5+/
   b9m6ynbQzfCnAnFWBcRfTIsihvkV91uNPnlM6Ty7mQTn/ZNRhh1gkrXGO
   dncahZTrCrNdSiUmYrPS82S+LGdtkUWrKJKE62mc6uyFON7NL+VOtitQ/
   U6WKa1J9x2s7B3Mahuov75RI168YcbqoqgcksKlcK12lJ29YGOKAb7P5O
   A==;
X-CSE-ConnectionGUID: U64yVgkGT3W0LjCbgzw6oA==
X-CSE-MsgGUID: 31tYaS8oT3C3N1lchdGf1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26881215"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26881215"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 11:59:50 -0700
X-CSE-ConnectionGUID: F2SyLgabQWyP5INqf3cn/w==
X-CSE-MsgGUID: fEIpSuPNRd+FnjWGGLyQow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="77894011"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Sep 2024 11:59:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suz90-000OcH-0s;
	Sun, 29 Sep 2024 18:59:46 +0000
Date: Mon, 30 Sep 2024 02:59:09 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4/5]
 drivers/firmware/imx/seco.c:277:34: error: invalid use of undefined type
 'struct file'
Message-ID: <202409300233.oorU9qyc-lkp@intel.com>
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
commit: da4e1bbc0a6a9ae65def99247d386ae9e6d6c98c [4/5] LF-12593-4 driver: firmware: enable she support
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240930/202409300233.oorU9qyc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300233.oorU9qyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300233.oorU9qyc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:21,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/firmware/imx/ipc.h:11,
                    from include/linux/firmware/imx/sci.h:14,
                    from drivers/firmware/imx/seco.c:9:
   drivers/firmware/imx/seco.c: In function 'imx_scu_sec_mem_cfg':
>> drivers/firmware/imx/seco.c:277:34: error: invalid use of undefined type 'struct file'
     277 |                 = container_of(fp->private_data,
         |                                  ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   In file included from include/linux/bits.h:21,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5:
>> drivers/firmware/imx/seco.c:277:34: error: invalid use of undefined type 'struct file'
     277 |                 = container_of(fp->private_data,
         |                                  ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/firmware/imx/seco.c:277:19: note: in expansion of macro 'container_of'
     277 |                 = container_of(fp->private_data,
         |                   ^~~~~~~~~~~~
>> drivers/firmware/imx/seco.c:277:34: error: invalid use of undefined type 'struct file'
     277 |                 = container_of(fp->private_data,
         |                                  ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   drivers/firmware/imx/seco.c:277:19: note: in expansion of macro 'container_of'
     277 |                 = container_of(fp->private_data,
         |                   ^~~~~~~~~~~~
   include/linux/compiler_types.h:373:27: error: expression in static assertion is not an integer
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/firmware/imx/seco.c:277:19: note: in expansion of macro 'container_of'
     277 |                 = container_of(fp->private_data,
         |                   ^~~~~~~~~~~~
   drivers/firmware/imx/seco.c: In function 'imx_scu_mem_access':
   drivers/firmware/imx/seco.c:314:34: error: invalid use of undefined type 'struct file'
     314 |                 = container_of(fp->private_data,
         |                                  ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/firmware/imx/seco.c:314:34: error: invalid use of undefined type 'struct file'
     314 |                 = container_of(fp->private_data,
         |                                  ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/firmware/imx/seco.c:314:19: note: in expansion of macro 'container_of'
     314 |                 = container_of(fp->private_data,
         |                   ^~~~~~~~~~~~
   drivers/firmware/imx/seco.c:314:34: error: invalid use of undefined type 'struct file'
     314 |                 = container_of(fp->private_data,
         |                                  ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   drivers/firmware/imx/seco.c:314:19: note: in expansion of macro 'container_of'
     314 |                 = container_of(fp->private_data,
         |                   ^~~~~~~~~~~~
   include/linux/compiler_types.h:373:27: error: expression in static assertion is not an integer
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/firmware/imx/seco.c:314:19: note: in expansion of macro 'container_of'
     314 |                 = container_of(fp->private_data,
         |                   ^~~~~~~~~~~~


vim +277 drivers/firmware/imx/seco.c

   273	
   274	int imx_scu_sec_mem_cfg(struct file *fp, uint32_t offset, uint32_t size)
   275	{
   276		struct ele_mu_device_ctx *dev_ctx
 > 277			= container_of(fp->private_data,
   278				       struct ele_mu_device_ctx,
   279				       miscdev);
   280		u64 high_boundary;
   281		int ret = 0;
   282	
   283		high_boundary = offset;
   284		if (high_boundary > SECURE_RAM_SIZE) {
   285			dev_err(dev_ctx->priv->dev, "base offset is over secure memory\n");
   286			return -ENOMEM;
   287		}
   288	
   289		high_boundary += size;
   290		if (high_boundary > SECURE_RAM_SIZE) {
   291			dev_err(dev_ctx->priv->dev, "total memory is over secure memory\n");
   292			return -ENOMEM;
   293		}
   294	
   295		dev_ctx->secure_mem.dma_addr = (dma_addr_t)offset;
   296		dev_ctx->secure_mem.size = size;
   297		dev_ctx->secure_mem.pos = 0;
   298		dev_ctx->secure_mem.ptr = devm_ioremap(dev_ctx->dev,
   299						      (phys_addr_t)(SECURE_RAM_BASE_ADDRESS +
   300						      (u64)dev_ctx->secure_mem.dma_addr),
   301						      dev_ctx->secure_mem.size);
   302		if (!dev_ctx->secure_mem.ptr) {
   303			dev_err(dev_ctx->priv->dev, "Failed to map secure memory\n");
   304			return -ENOMEM;
   305		}
   306	
   307		return ret;
   308	}
   309	EXPORT_SYMBOL(imx_scu_sec_mem_cfg);
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
