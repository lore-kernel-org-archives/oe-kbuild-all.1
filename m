Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3562918EAB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 19:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727636992; cv=none; b=mIqUkMsMe4dwxR4weDJQJfOPyd/wEDLUEreZy1CGhsdvdDjZo3AA/yRdLPpHS8z1wH/IvTl1dzeC35K4bwANvU9Pnzr/G5865mrwCIp6Yl+qZnmghCjFnOTbtLr00rlSmDROri4X/84TP/7GmFGsUbq9s9xhcygC/LLHRiDkl9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727636992; c=relaxed/simple;
	bh=ckOWOdQvuLV6XZtIt21+VX8r2swTcc0GGqL6j4WaOU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wfh88hfQ1vGx5UFnwDk1MIQUVDVME2L7QiP7nGIqjtK3Y/CiFj+2qlIhe0w+7B6V6hXZiABfs879XiJfswX2HBHgobAUj/c3StAIONmk6IxNkJx6lOPUMvLnUiQLLZfjGmUpELnBuXqghCbRkKnyU5loFqbNXt7k6A4Sg1QwBR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blbf7pzd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blbf7pzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727636990; x=1759172990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ckOWOdQvuLV6XZtIt21+VX8r2swTcc0GGqL6j4WaOU8=;
  b=blbf7pzdliNmu3GIbYaTi71qeJBeUp1bmd7j+YUaA5/pVIG4x21flrPE
   ue3S3AuwGvn1SI3tNL8IKhHNQ50A9pISShNmDu/e3k9XLuMe9Yv1hpF5F
   1nHOL+PtdZRqV5oYSgLGd/aVjEuss5yI3zAztoY/CyYuPSy2U4owcNrQn
   JMzeKE2SqnveInWt/U7i1/KUWocRPeY87kFiqLbohhEI854yuJRLx4fKH
   cYxOF5IF85wa+5shAzOsnpIXaobHcBW4HDTrLIA+Dj3O7uizZXR+5WlMS
   cngey4kuKYBTw2BQIlmDJ5KwfS27+LgDZSaxC5knuJNGdQdYZi7KS3okG
   Q==;
X-CSE-ConnectionGUID: UAlkcIe6SJmPhddb15311w==
X-CSE-MsgGUID: qCS+43HNRLORVTe3rju03A==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="38107842"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="38107842"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 12:09:50 -0700
X-CSE-ConnectionGUID: L2+d4XkrSyCK2WTWZm38kw==
X-CSE-MsgGUID: zq2z+1XYStuoD8iVmeYoGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73403247"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Sep 2024 12:09:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suzIg-000Oct-26;
	Sun, 29 Sep 2024 19:09:46 +0000
Date: Mon, 30 Sep 2024 03:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4/5]
 drivers/firmware/imx/seco.c:277:20: error: incomplete definition of type
 'struct file'
Message-ID: <202409300305.ISppKx4q-lkp@intel.com>
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
config: arm-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240930/202409300305.ISppKx4q-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300305.ISppKx4q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300305.ISppKx4q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/imx/seco.c:277:20: error: incomplete definition of type 'struct file'
     277 |                 = container_of(fp->private_data,
         |                                ~~^
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/pid.h:77:8: note: forward declaration of 'struct file'
      77 | struct file;
         |        ^
>> drivers/firmware/imx/seco.c:277:20: error: incomplete definition of type 'struct file'
     277 |                 = container_of(fp->private_data,
         |                                ~~^
   include/linux/container_of.h:20:30: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                     ^~~
   include/linux/compiler_types.h:373:63: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/pid.h:77:8: note: forward declaration of 'struct file'
      77 | struct file;
         |        ^
>> drivers/firmware/imx/seco.c:277:20: error: incomplete definition of type 'struct file'
     277 |                 = container_of(fp->private_data,
         |                                ~~^
   include/linux/container_of.h:21:23: note: expanded from macro 'container_of'
      21 |                       __same_type(*(ptr), void),                        \
         |                                     ^~~
   include/linux/compiler_types.h:373:63: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/pid.h:77:8: note: forward declaration of 'struct file'
      77 | struct file;
         |        ^
   drivers/firmware/imx/seco.c:314:20: error: incomplete definition of type 'struct file'
     314 |                 = container_of(fp->private_data,
         |                                ~~^
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/pid.h:77:8: note: forward declaration of 'struct file'
      77 | struct file;
         |        ^
   drivers/firmware/imx/seco.c:314:20: error: incomplete definition of type 'struct file'
     314 |                 = container_of(fp->private_data,
         |                                ~~^
   include/linux/container_of.h:20:30: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                     ^~~
   include/linux/compiler_types.h:373:63: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/pid.h:77:8: note: forward declaration of 'struct file'
      77 | struct file;
         |        ^
   drivers/firmware/imx/seco.c:314:20: error: incomplete definition of type 'struct file'
     314 |                 = container_of(fp->private_data,
         |                                ~~^
   include/linux/container_of.h:21:23: note: expanded from macro 'container_of'
      21 |                       __same_type(*(ptr), void),                        \
         |                                     ^~~
   include/linux/compiler_types.h:373:63: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/pid.h:77:8: note: forward declaration of 'struct file'
      77 | struct file;
         |        ^
   6 errors generated.


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
