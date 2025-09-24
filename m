Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E681F4701
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 21:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758750455; cv=none; b=dMwecX1Vsd/SkgJsGwk+ju7/AizvaW2DsCxOuDbarKuFdKiJIGRSvWd6aW+Q7A26BaH2OTl+08FodieEfNikha70S1hA3S5gY4d9gCutL2vH+9hnb1j4LRsRzv2/bLl3n3xQYATdXnPJsUI0YDbJL8E8RNJkjsgKi9uq6AsqvYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758750455; c=relaxed/simple;
	bh=+VhMcOPLeFI05jbdMLJ7LBSZBO9BO59nQklPnoTb3WA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rnr9PJMNAGJfVjz12pq616Vj5iHYlWORlStZI/Y4KHF+tfml2b01C4l4LAsjxoHSUzHsxP4TE0fHIT4njDF3C1c8NbMywnLs+8TWOzRl3IYZbbnQlYbfk6fI4kK5L3m0VGJQCS9JIzaPYm1MQ4tYe8kEVvOR74/v60s0ca/zu90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExBZqdea; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExBZqdea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758750453; x=1790286453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+VhMcOPLeFI05jbdMLJ7LBSZBO9BO59nQklPnoTb3WA=;
  b=ExBZqdeaTEiwo/BsW0mbCj6EPifhpkfr6CEsiGAzntdSVl2gN9Nthn6H
   ni6vhe0bn3mZh1+ymqEgX0b/z6mzMq64wcAxYfNfQYDUtqF/oSIFuoWUS
   LiNpHwxvUk5nbtLpnpynmt3DjTbKpM981fB1N8t76+Yx/vxSpBCfFiDUn
   rajPqW3ubX9+bdOy4ZC8Htme2ryR3EhyQhAkAtuyPh3kdJBcbHw4rqQ0m
   Htly6qDwkM5YNNp1cAQApDJNYTu3363cAHD6U7LiBO/+XCrAyTwjg2DSA
   gAJcQA+uwnz6n4c1w8K3tFNVX98ZMdjeuOLkNR0NqEeFgwWy+D4Z91XJp
   Q==;
X-CSE-ConnectionGUID: 8VM3Out8Tb2/QDihvB82mg==
X-CSE-MsgGUID: VV5Ih1QjQveikYBueCRnIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60983928"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="60983928"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 14:47:29 -0700
X-CSE-ConnectionGUID: l/gpkGLxRQ+X+gy0FJqRrA==
X-CSE-MsgGUID: 4HiOuNo/TSaODhnlvMpK/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="181151649"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2025 14:47:26 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1XKd-0004az-0d;
	Wed, 24 Sep 2025 21:47:23 +0000
Date: Thu, 25 Sep 2025 05:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 3/3]
 drivers/vfio/vfio_pkvm_iommu.c:76:21: error: variable 'pkvm_iommu_ops' has
 initializer but incomplete type
Message-ID: <202509250534.1f4tl61p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   984793b0bc23293e84a4167285a410a2a8cd8b88
commit: 0ef77a1bee1ef820e09e72dd91bfa9b05abd7c95 [3/3] ANDROID: drivers/vfio: Add VFIO_PKVM_IOMMU
config: arm64-randconfig-001-20250925 (https://download.01.org/0day-ci/archive/20250925/202509250534.1f4tl61p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250534.1f4tl61p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250534.1f4tl61p-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/vfio/vfio_pkvm_iommu.c:76:21: error: variable 'pkvm_iommu_ops' has initializer but incomplete type
      76 | static const struct vfio_iommu_driver_ops pkvm_iommu_ops = {
         |                     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/vfio/vfio_pkvm_iommu.c:77:10: error: 'const struct vfio_iommu_driver_ops' has no member named 'name'
      77 |         .name                   = "vfio-pkvm-iommu",
         |          ^~~~
>> drivers/vfio/vfio_pkvm_iommu.c:77:35: warning: excess elements in struct initializer
      77 |         .name                   = "vfio-pkvm-iommu",
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:77:35: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:78:10: error: 'const struct vfio_iommu_driver_ops' has no member named 'owner'
      78 |         .owner                  = THIS_MODULE,
         |          ^~~~~
   In file included from arch/arm64/include/asm/alternative.h:9,
                    from arch/arm64/include/asm/sysreg.h:1112,
                    from arch/arm64/include/asm/cputype.h:228,
                    from arch/arm64/include/asm/cache.h:43,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/vfio/vfio_pkvm_iommu.c:20:
>> include/linux/init.h:182:21: warning: excess elements in struct initializer
     182 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   drivers/vfio/vfio_pkvm_iommu.c:78:35: note: in expansion of macro 'THIS_MODULE'
      78 |         .owner                  = THIS_MODULE,
         |                                   ^~~~~~~~~~~
   include/linux/init.h:182:21: note: (near initialization for 'pkvm_iommu_ops')
     182 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   drivers/vfio/vfio_pkvm_iommu.c:78:35: note: in expansion of macro 'THIS_MODULE'
      78 |         .owner                  = THIS_MODULE,
         |                                   ^~~~~~~~~~~
>> drivers/vfio/vfio_pkvm_iommu.c:79:10: error: 'const struct vfio_iommu_driver_ops' has no member named 'open'
      79 |         .open                   = pkvm_iommu_open,
         |          ^~~~
   drivers/vfio/vfio_pkvm_iommu.c:79:35: warning: excess elements in struct initializer
      79 |         .open                   = pkvm_iommu_open,
         |                                   ^~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:79:35: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:80:10: error: 'const struct vfio_iommu_driver_ops' has no member named 'release'
      80 |         .release                = pkvm_iommu_release,
         |          ^~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:80:35: warning: excess elements in struct initializer
      80 |         .release                = pkvm_iommu_release,
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:80:35: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:81:10: error: 'const struct vfio_iommu_driver_ops' has no member named 'ioctl'
      81 |         .ioctl                  = pkvm_iommu_ioctl,
         |          ^~~~~
   drivers/vfio/vfio_pkvm_iommu.c:81:35: warning: excess elements in struct initializer
      81 |         .ioctl                  = pkvm_iommu_ioctl,
         |                                   ^~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:81:35: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:82:10: error: 'const struct vfio_iommu_driver_ops' has no member named 'attach_group'
      82 |         .attach_group           = pkvm_iommu_attach_group,
         |          ^~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:82:35: warning: excess elements in struct initializer
      82 |         .attach_group           = pkvm_iommu_attach_group,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:82:35: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:83:10: error: 'const struct vfio_iommu_driver_ops' has no member named 'detach_group'
      83 |         .detach_group           = pkvm_iommu_detach_group,
         |          ^~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:83:35: warning: excess elements in struct initializer
      83 |         .detach_group           = pkvm_iommu_detach_group,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:83:35: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:84:10: error: 'const struct vfio_iommu_driver_ops' has no member named 'register_device'
      84 |         .register_device        = pkvm_iommu_register_device,
         |          ^~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:84:35: warning: excess elements in struct initializer
      84 |         .register_device        = pkvm_iommu_register_device,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:84:35: note: (near initialization for 'pkvm_iommu_ops')
>> drivers/vfio/vfio_pkvm_iommu.c:85:10: error: 'const struct vfio_iommu_driver_ops' has no member named 'unregister_device'
      85 |         .unregister_device      = pkvm_iommu_unregister_device,
         |          ^~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:85:35: warning: excess elements in struct initializer
      85 |         .unregister_device      = pkvm_iommu_unregister_device,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_pkvm_iommu.c:85:35: note: (near initialization for 'pkvm_iommu_ops')
   drivers/vfio/vfio_pkvm_iommu.c: In function 'pkvm_iommu_init':
>> drivers/vfio/vfio_pkvm_iommu.c:90:16: error: implicit declaration of function 'vfio_register_iommu_driver'; did you mean 'vfio_register_group_dev'? [-Werror=implicit-function-declaration]
      90 |         return vfio_register_iommu_driver(&pkvm_iommu_ops);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                vfio_register_group_dev
   drivers/vfio/vfio_pkvm_iommu.c: In function 'pkvm_iommu_exit':
>> drivers/vfio/vfio_pkvm_iommu.c:95:9: error: implicit declaration of function 'vfio_unregister_iommu_driver'; did you mean 'vfio_unregister_group_dev'? [-Werror=implicit-function-declaration]
      95 |         vfio_unregister_iommu_driver(&pkvm_iommu_ops);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         vfio_unregister_group_dev
   drivers/vfio/vfio_pkvm_iommu.c: At top level:
>> drivers/vfio/vfio_pkvm_iommu.c:76:43: error: storage size of 'pkvm_iommu_ops' isn't known
      76 | static const struct vfio_iommu_driver_ops pkvm_iommu_ops = {
         |                                           ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]


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
