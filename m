Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F16D23EAB3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769589991; cv=none; b=om5uRT5dw/r84KUJVGz1Ay/LyyZ31fFpnzZxi2bmBPDypW9FuzVXxrHRa42ZG/lpCyetH0XGi0U0g7FM/8a2FljNS4mfan5ilYcxjqv7SKZJl/muiUkllUUTrwkaI2+q0qZ6z26puRtWm/D1tg9oiTB526r044QRPjuJmTGrLlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769589991; c=relaxed/simple;
	bh=bmEFB4j09MG6WU61Q2sNlai93DfcXErjiEkrKi/gOjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PF3SDU2ulri4ta+prkCq22gQ4yyjoYSwdEGdUu2NdVDsRKA2Fc6MoU9/H+Ty6fp0bpHxHz7IesqFanLR0jJzTUIf3sxh+JEH0V9rwKvgWwtxPWjyhsD05SWKn3r0JIp/6R+x3PGdHqK7z5UQbGIH1o89fSWEAZv+7enWpXcAvyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVgkbXWa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVgkbXWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769589990; x=1801125990;
  h=date:from:to:cc:subject:message-id;
  bh=bmEFB4j09MG6WU61Q2sNlai93DfcXErjiEkrKi/gOjI=;
  b=LVgkbXWawU8JMDqlzL5o8dhUxDDeHEnzL92MdYcxd9sLFTxgdJk6kU94
   9N3TDm3ZqgbzY/FG3lPxI+HspS05QCjJaHfEwqd2jVdBpq6nropDbPUc8
   Q/1W4R9IHDbiyK4bGgVcJJ44d7NGT+bClGSyT8AEPqXZZDO4nz1ByjPln
   ixBu73uVRzWIIUGyglL7cRS1A4jg/cAcbm0Y7pSXjYtPHWjXR7UN7d3k6
   t7kBYw8e3Ycr2OB1yYk2FYyW+U7zUOMGu16THq3DAS2DsYHc7gjgeIw6p
   4SRlMFILfxcxNUH5X1Xu4i3jPsZBAyyYMK0h1oLPXGT82cCH5lYJPpaXG
   Q==;
X-CSE-ConnectionGUID: bqrglQLOQm2SNTLTwPDWNA==
X-CSE-MsgGUID: 48Xi0XpsTgaEL/cFffASOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70691632"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70691632"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 00:46:27 -0800
X-CSE-ConnectionGUID: 1hTkKJLQTMKLH736A7/ncA==
X-CSE-MsgGUID: AG+h1owLQC6z1lCi2wUEeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212756784"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Jan 2026 00:46:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl1Bv-00000000ZTQ-3lTH;
	Wed, 28 Jan 2026 08:46:23 +0000
Date: Wed, 28 Jan 2026 16:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 2/2]
 drivers/vfio/vfio_pkvm_iommu.c:76:21: error: variable 'pkvm_iommu_ops' has
 initializer but incomplete type
Message-ID: <202601281645.dxctdXpv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   46c82cca3818ea70efcbe62840729ef313c95635
commit: 0ef77a1bee1ef820e09e72dd91bfa9b05abd7c95 [2/2] ANDROID: drivers/vfio: Add VFIO_PKVM_IOMMU
config: arm64-randconfig-r132-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281645.dxctdXpv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281645.dxctdXpv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281645.dxctdXpv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/vfio/vfio_pkvm_iommu.c:76:21: error: variable 'pkvm_iommu_ops' has initializer but incomplete type
    static const struct vfio_iommu_driver_ops pkvm_iommu_ops = {
                        ^~~~~~~~~~~~~~~~~~~~~
>> drivers/vfio/vfio_pkvm_iommu.c:77:3: error: 'const struct vfio_iommu_driver_ops' has no member named 'name'
     .name   = "vfio-pkvm-iommu",
      ^~~~
>> drivers/vfio/vfio_pkvm_iommu.c:77:12: warning: excess elements in struct initializer
     .name   = "vfio-pkvm-iommu",
               ^~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:77:12: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:78:3: error: 'const struct vfio_iommu_driver_ops' has no member named 'owner'
     .owner   = THIS_MODULE,
      ^~~~~
   In file included from arch/arm64/include/asm/alternative.h:9:0,
                    from arch/arm64/include/asm/lse.h:14,
                    from arch/arm64/include/asm/cmpxchg.h:14,
                    from arch/arm64/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:25,
                    from include/linux/bitops.h:68,
                    from arch/arm64/include/asm/cache.h:40,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from arch/arm64/include/asm/stat.h:12,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:13,
                    from drivers/vfio/vfio_pkvm_iommu.c:20:
>> include/linux/init.h:182:21: warning: excess elements in struct initializer
    #define THIS_MODULE ((struct module *)0)
                        ^
   drivers/vfio/vfio_pkvm_iommu.c:78:13: note: in expansion of macro 'THIS_MODULE'
     .owner   = THIS_MODULE,
                ^~~~~~~~~~~
   include/linux/init.h:182:21: note: (near initialization for 'pkvm_iommu_ops')
    #define THIS_MODULE ((struct module *)0)
                        ^
   drivers/vfio/vfio_pkvm_iommu.c:78:13: note: in expansion of macro 'THIS_MODULE'
     .owner   = THIS_MODULE,
                ^~~~~~~~~~~
>> drivers/vfio/vfio_pkvm_iommu.c:79:3: error: 'const struct vfio_iommu_driver_ops' has no member named 'open'
     .open   = pkvm_iommu_open,
      ^~~~
   drivers/vfio/vfio_pkvm_iommu.c:79:12: warning: excess elements in struct initializer
     .open   = pkvm_iommu_open,
               ^~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:79:12: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:80:3: error: 'const struct vfio_iommu_driver_ops' has no member named 'release'
     .release  = pkvm_iommu_release,
      ^~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:80:14: warning: excess elements in struct initializer
     .release  = pkvm_iommu_release,
                 ^~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:80:14: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:81:3: error: 'const struct vfio_iommu_driver_ops' has no member named 'ioctl'
     .ioctl   = pkvm_iommu_ioctl,
      ^~~~~
   drivers/vfio/vfio_pkvm_iommu.c:81:13: warning: excess elements in struct initializer
     .ioctl   = pkvm_iommu_ioctl,
                ^~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:81:13: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:82:3: error: 'const struct vfio_iommu_driver_ops' has no member named 'attach_group'
     .attach_group  = pkvm_iommu_attach_group,
      ^~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:82:19: warning: excess elements in struct initializer
     .attach_group  = pkvm_iommu_attach_group,
                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:82:19: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:83:3: error: 'const struct vfio_iommu_driver_ops' has no member named 'detach_group'
     .detach_group  = pkvm_iommu_detach_group,
      ^~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:83:19: warning: excess elements in struct initializer
     .detach_group  = pkvm_iommu_detach_group,
                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:83:19: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:84:3: error: 'const struct vfio_iommu_driver_ops' has no member named 'register_device'
     .register_device = pkvm_iommu_register_device,
      ^~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:84:21: warning: excess elements in struct initializer
     .register_device = pkvm_iommu_register_device,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:84:21: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:85:3: error: 'const struct vfio_iommu_driver_ops' has no member named 'unregister_device'
     .unregister_device = pkvm_iommu_unregister_device,
      ^~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:85:23: warning: excess elements in struct initializer
     .unregister_device = pkvm_iommu_unregister_device,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:85:23: note: (near initialization for 'pkvm_iommu_ops')
   drivers/vfio/vfio_pkvm_iommu.c: In function 'pkvm_iommu_init':
>> drivers/vfio/vfio_pkvm_iommu.c:90:9: error: implicit declaration of function 'vfio_register_iommu_driver'; did you mean 'vfio_register_group_dev'? [-Werror=implicit-function-declaration]
     return vfio_register_iommu_driver(&pkvm_iommu_ops);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
            vfio_register_group_dev
   drivers/vfio/vfio_pkvm_iommu.c: In function 'pkvm_iommu_exit':
>> drivers/vfio/vfio_pkvm_iommu.c:95:2: error: implicit declaration of function 'vfio_unregister_iommu_driver'; did you mean 'vfio_unregister_group_dev'? [-Werror=implicit-function-declaration]
     vfio_unregister_iommu_driver(&pkvm_iommu_ops);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
     vfio_unregister_group_dev
   drivers/vfio/vfio_pkvm_iommu.c: At top level:
>> drivers/vfio/vfio_pkvm_iommu.c:76:43: error: storage size of 'pkvm_iommu_ops' isn't known
    static const struct vfio_iommu_driver_ops pkvm_iommu_ops = {
                                              ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]


vim +/pkvm_iommu_ops +76 drivers/vfio/vfio_pkvm_iommu.c

    75	
  > 76	static const struct vfio_iommu_driver_ops pkvm_iommu_ops = {
  > 77		.name			= "vfio-pkvm-iommu",
  > 78		.owner			= THIS_MODULE,
  > 79		.open			= pkvm_iommu_open,
  > 80		.release		= pkvm_iommu_release,
  > 81		.ioctl			= pkvm_iommu_ioctl,
  > 82		.attach_group		= pkvm_iommu_attach_group,
  > 83		.detach_group		= pkvm_iommu_detach_group,
  > 84		.register_device	= pkvm_iommu_register_device,
  > 85		.unregister_device	= pkvm_iommu_unregister_device,
    86	};
    87	
    88	static int __init pkvm_iommu_init(void)
    89	{
  > 90		return vfio_register_iommu_driver(&pkvm_iommu_ops);
    91	}
    92	
    93	static void __exit pkvm_iommu_exit(void)
    94	{
  > 95		vfio_unregister_iommu_driver(&pkvm_iommu_ops);
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
