Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E22980C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 20:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747081406; cv=none; b=uZ0H4c0v7InFn4UsbQfsvtgbWgQ4vr7rh+9uRvbB7FjAlkwkp6X+/tNk2ngKGPkcrWE4pMqQzThWnRkD/Z5EuP0tfma7Nlgkkbu1GXYnaDU9gt23iPw88IvydzRTUUlczTu4k69Kum+gYAflA/6H6Lr3Gk/jPs8yd4YM0g5NVYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747081406; c=relaxed/simple;
	bh=pBsONt9wt1PBFzpY8xbZOCZZscpJY+Tg6I9SJ5M7fNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqQRXhCUPjlI6N3cU30bJ8KrZUJKirscartAooDU27zRvTTmGISIYdfmRFwjZ4UXubJFrkBJd7cT0NmLm1rIVHDuDbE/fJjwOMG5WP/87OarUEul6+woq+n1mFbrYiSPZL521f21R/60OLt6qYn1RApYRSLqhQ7GIzbkY4W/Do4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZxJYwSI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZxJYwSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747081404; x=1778617404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pBsONt9wt1PBFzpY8xbZOCZZscpJY+Tg6I9SJ5M7fNs=;
  b=nZxJYwSI1Uoz4/KCAoXhHpsU6+Li4X6AqfsnWO1ebnyshMGjrZ69yvYD
   Ai75bq60hchyCXS5dNFd1XcKK0nAAiIpByHdt7K0rFOFVTVnRVaJ8CRAv
   +GDRMvkZMKsDGcWEqU7QjU/vIRDtGhMdwnhs61MnEUQCFo/RlgVs9gAu8
   vrmKuJTfzAbtNIx4VFngBj16+rpEz84x4uaiyGrSP93rsxG8XyVsUezLK
   hVh3O0/0LfO53tADvhBkEycorRzZzP7LAImJv69mvo8DMBWWblvbPr4fx
   1jcN4ycWYMeubF9iEPKWzHcCrSdPz6jQnzBdRvzgQtHn17rH3zeR0fP94
   A==;
X-CSE-ConnectionGUID: 8byZYRb8Siykxd5lyvRvBg==
X-CSE-MsgGUID: +5pj7whPSJWY4rNlV5ANqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74295465"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="74295465"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 13:23:21 -0700
X-CSE-ConnectionGUID: s+qXivsqTsuvZgAWGNGULw==
X-CSE-MsgGUID: B/3nMRnxSC6Z8wJ1w/qXVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="168568116"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 May 2025 13:23:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEZfv-000FOR-0I;
	Mon, 12 May 2025 20:22:59 +0000
Date: Tue, 13 May 2025 04:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/vfio/vfio_pkvm_iommu.c:76:43: error: variable has incomplete type
 'const struct vfio_iommu_driver_ops'
Message-ID: <202505130420.ahobs9E8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d574cb3cc1f6d322d0add4788af2086ca221b303
commit: 0ef77a1bee1ef820e09e72dd91bfa9b05abd7c95 [1/1] ANDROID: drivers/vfio: Add VFIO_PKVM_IOMMU
config: arm64-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250513/202505130420.ahobs9E8-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130420.ahobs9E8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130420.ahobs9E8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/vfio_pkvm_iommu.c:76:43: error: variable has incomplete type 'const struct vfio_iommu_driver_ops'
      76 | static const struct vfio_iommu_driver_ops pkvm_iommu_ops = {
         |                                           ^
   drivers/vfio/vfio_pkvm_iommu.c:76:21: note: forward declaration of 'struct vfio_iommu_driver_ops'
      76 | static const struct vfio_iommu_driver_ops pkvm_iommu_ops = {
         |                     ^
>> drivers/vfio/vfio_pkvm_iommu.c:90:9: error: call to undeclared function 'vfio_register_iommu_driver'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      90 |         return vfio_register_iommu_driver(&pkvm_iommu_ops);
         |                ^
>> drivers/vfio/vfio_pkvm_iommu.c:95:2: error: call to undeclared function 'vfio_unregister_iommu_driver'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      95 |         vfio_unregister_iommu_driver(&pkvm_iommu_ops);
         |         ^
   drivers/vfio/vfio_pkvm_iommu.c:95:2: note: did you mean 'vfio_unregister_group_dev'?
   include/linux/vfio.h:283:6: note: 'vfio_unregister_group_dev' declared here
     283 | void vfio_unregister_group_dev(struct vfio_device *device);
         |      ^
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]


vim +76 drivers/vfio/vfio_pkvm_iommu.c

    75	
  > 76	static const struct vfio_iommu_driver_ops pkvm_iommu_ops = {
    77		.name			= "vfio-pkvm-iommu",
    78		.owner			= THIS_MODULE,
    79		.open			= pkvm_iommu_open,
    80		.release		= pkvm_iommu_release,
    81		.ioctl			= pkvm_iommu_ioctl,
    82		.attach_group		= pkvm_iommu_attach_group,
    83		.detach_group		= pkvm_iommu_detach_group,
    84		.register_device	= pkvm_iommu_register_device,
    85		.unregister_device	= pkvm_iommu_unregister_device,
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
