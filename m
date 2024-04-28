Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43116EB75
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714320460; cv=none; b=W/QMf4UhK0uxWPOJVxl+bkvtaWGMJ4QOASIeqQ9VGZ2QANejvmAYMsjQMdoJa9eSLFuIsoFLJ3QrRwO3Dty5OIsB1Vr5eOA165W6DfhZouQ5sVO/5pjvF/Z2szYBZ6Ap5XXIs9A7sLTFs4lNrlSLpYz3g4s7oCrVJ0C3r6feves=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714320460; c=relaxed/simple;
	bh=Cjy/k67uSGRyYSMowfRT/YV763HTHsgNFSHuDy+PFqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EaA+KjhGBVs3dzuAmMamXuECG7Jeg3XrlRQFBOW1pZY6r084Dhj3N9s0Qz+2nj5xWUGF62hrLwfQg7CyhJD8EyZOcxPJPZETR8zK9quVPKLBUn0IHuNp9SZ5UOEvZ0OQhv29/D3FLp7cT+ec6tH/NXxnlnfFBohx7hdCZS95DQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcI3I9NP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcI3I9NP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714320458; x=1745856458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cjy/k67uSGRyYSMowfRT/YV763HTHsgNFSHuDy+PFqE=;
  b=BcI3I9NPwM7Y9PJY6+wrNo+f9nASyFxY1JOKQua25AEKJL4EhytcF/6h
   X9Z82ULAv96HamIENAhT2Fm172zT+kKTCZddBjuU/an0q2iElPYzDGaq+
   mNPLnD4DBeJywpUEyBPK+zVCdGgEa25i3d8O6GgHcWhO8edpi0U6zeT3c
   qnio2dJ7atvXzoT/Fa1JXDt1hov/SVe1PEgTkxcmgDNiLZ9ILxQoTOt7q
   j6d73AdK7o2BJBtZZquRd1TQ/973wR3a2QhLUhkY3kn8jwOI35OYYEiqb
   ZHsRain2PyQfq+gHfPmUKebpWSreHmurlRhhok4QzmsSnabqbFdKI9zTU
   A==;
X-CSE-ConnectionGUID: pSO4p7oqSkuPe73HZU8jhw==
X-CSE-MsgGUID: Al8GMrF1TDabxYHL84q6WA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27507316"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="27507316"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 09:07:37 -0700
X-CSE-ConnectionGUID: 33K0sYGhQIqxse/fmE5Ocg==
X-CSE-MsgGUID: b4k208/rSKmqLkYZDPjvYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="30708361"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Apr 2024 09:07:36 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s173t-0006SS-1g;
	Sun, 28 Apr 2024 16:07:33 +0000
Date: Mon, 29 Apr 2024 00:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5784/11728]
 drivers/media/platform/mxc/capture/ov5647_mipi.c:319:12: error: incompatible
 function pointer types initializing 'int (*)(struct i2c_client *)' with an
 expression of type 'int (struct i2c_client *, const struct i2c_device_id *)'
Message-ID: <202404290000.noKkpD4R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: a5b79f65b3e476d02b1684409304720f7b0a0ebc [5784/11728] Merge remote-tracking branch 'origin/capture/ov5640' into capture/next
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404290000.noKkpD4R-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290000.noKkpD4R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290000.noKkpD4R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/mxc/capture/ov5647_mipi.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/mxc/capture/ov5647_mipi.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/mxc/capture/ov5647_mipi.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/platform/mxc/capture/ov5647_mipi.c:15:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:319:12: error: incompatible function pointer types initializing 'int (*)(struct i2c_client *)' with an expression of type 'int (struct i2c_client *, const struct i2c_device_id *)' [-Wincompatible-function-pointer-types]
     319 |         .probe  = ov5647_probe,
         |                   ^~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:320:12: error: incompatible function pointer types initializing 'void (*)(struct i2c_client *)' with an expression of type 'int (struct i2c_client *)' [-Wincompatible-function-pointer-types]
     320 |         .remove = ov5647_remove,
         |                   ^~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1442:3: error: call to undeclared function 'pr_warning'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1442 |                 pr_warning("Please assign pixel format, width and height.\n");
         |                 ^
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1442:3: note: did you mean 'acpi_warning'?
   include/acpi/acpixf.h:912:5: note: 'acpi_warning' declared here
     912 |                                 acpi_warning(const char *module_name,
         |                                 ^
   include/acpi/acpixf.h:334:21: note: expanded from macro 'ACPI_MSG_DEPENDENT_RETURN_VOID'
     334 |         static ACPI_INLINE prototype {return;}
         |                            ^
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1522:27: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_size_enum *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_size_enum *)' [-Wincompatible-function-pointer-types]
    1522 |         .enum_frame_size       = ov5647_enum_framesizes,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1523:27: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_frame_interval_enum *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_frame_interval_enum *)' [-Wincompatible-function-pointer-types]
    1523 |         .enum_frame_interval   = ov5647_enum_frameintervals,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1524:27: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_mbus_code_enum *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_mbus_code_enum *)' [-Wincompatible-function-pointer-types]
    1524 |         .enum_mbus_code        = ov5647_enum_mbus_code,
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1525:27: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    1525 |         .set_fmt               = ov5647_set_fmt,
         |                                  ^~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1526:27: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_pad_config *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    1526 |         .get_fmt               = ov5647_get_fmt,
         |                                  ^~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1532:16: error: use of undeclared identifier 'ov5647_get_register'; did you mean 'ov5647_get_shutter'?
    1532 |         .g_register     = ov5647_get_register,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           ov5647_get_shutter
   drivers/media/platform/mxc/capture/ov5647_mipi.c:767:12: note: 'ov5647_get_shutter' declared here
     767 | static int ov5647_get_shutter(void)
         |            ^
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1533:16: error: use of undeclared identifier 'ov5647_set_register'; did you mean 'ov5647_set_shutter'?
    1533 |         .s_register     = ov5647_set_register,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           ov5647_set_shutter
   drivers/media/platform/mxc/capture/ov5647_mipi.c:780:12: note: 'ov5647_set_shutter' declared here
     780 | static int ov5647_set_shutter(int shutter)
         |            ^
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1532:16: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, struct v4l2_dbg_register *)' with an expression of type 'int (void)' [-Wincompatible-function-pointer-types]
    1532 |         .g_register     = ov5647_get_register,
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1533:16: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_dbg_register *)' with an expression of type 'int (int)' [-Wincompatible-function-pointer-types]
    1533 |         .s_register     = ov5647_set_register,
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1645:3: error: call to undeclared function 'pr_warning'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1645 |                 pr_warning("camera ov5647_mipi is not found\n");
         |                 ^
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1651:3: error: call to undeclared function 'pr_warning'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1651 |                 pr_warning("camera ov5647_mipi is not found\n");
         |                 ^
   drivers/media/platform/mxc/capture/ov5647_mipi.c:1659:3: error: call to undeclared function 'pr_warning'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1659 |                 pr_warning("camera ov5647 init failed\n");
         |                 ^
   7 warnings and 15 errors generated.


vim +319 drivers/media/platform/mxc/capture/ov5647_mipi.c

1fbc9a5cc7bd37 Robby Cai 2019-09-27  313  
1fbc9a5cc7bd37 Robby Cai 2019-09-27  314  static struct i2c_driver ov5647_i2c_driver = {
1fbc9a5cc7bd37 Robby Cai 2019-09-27  315  	.driver = {
1fbc9a5cc7bd37 Robby Cai 2019-09-27  316  		  .owner = THIS_MODULE,
1fbc9a5cc7bd37 Robby Cai 2019-09-27  317  		  .name  = "ov5647_mipi",
1fbc9a5cc7bd37 Robby Cai 2019-09-27  318  		  },
1fbc9a5cc7bd37 Robby Cai 2019-09-27 @319  	.probe  = ov5647_probe,
1fbc9a5cc7bd37 Robby Cai 2019-09-27  320  	.remove = ov5647_remove,
1fbc9a5cc7bd37 Robby Cai 2019-09-27  321  	.id_table = ov5647_id,
1fbc9a5cc7bd37 Robby Cai 2019-09-27  322  };
1fbc9a5cc7bd37 Robby Cai 2019-09-27  323  

:::::: The code at line 319 was first introduced by commit
:::::: 1fbc9a5cc7bd373cf32dc3f66bbadfc57000e43f media: capture: add mipi camera ov5647 driver

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
