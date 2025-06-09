Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6500213C918
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749478690; cv=none; b=mrYE4MzfSu7MadRzJ0m1BYwjZV7fOhMZhsmIGqM5L9H2ZPK1MT4HuzqDggqhQgecXnu6eb+77UdfQw7FPin3FH9UVOhFIBvnCj2bqE/UowVOhPfKUZwkFiRJ1oFWEhZ+CLX0YPLMow0Yl3vz2p4RG7+XevJ/dBkXWPwZ5yJHqY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749478690; c=relaxed/simple;
	bh=ap7qINg1vr4zwBOtAsw1svU6DBMmTbiI2GUIl4c/6N8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cT1rTuP/OMRWTM/iLI645SG7ymJba0y3UZKS+ylRwnfFV+IB6BuHO74LyvSYJPr9eTTCM7q7ME8MSoEVqq+Hdb1YN9n4RXTG/ZP8aftcuwxFP2bdDdhbKKfLvJ6sC33QdTdguUjGb52xcmKjV3qFIOXntJEb/vop4Soy/cGdr8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIcg9cN/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIcg9cN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749478689; x=1781014689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ap7qINg1vr4zwBOtAsw1svU6DBMmTbiI2GUIl4c/6N8=;
  b=LIcg9cN/Vp6p/mn1XHVx6/6YitEApmAuGEIAKbKmu2aGWhClVQz9pNLY
   8kCeiNgm0USoW4JOZAzTUhOTVi0gLHo7ZVBz3cJJoPpGmMJ9Df0GhnnGl
   gqgwRv7/HSLSPAsqiiW3996Zq4WCTkJd8L/K4eMyFOMbZs1hg/xy6eCLQ
   HxHkDruTV8lups/JZ9Xy/jAvnSHLsgdd1GT41ee2owLa3HlIPUSdsp76Y
   WRK61YY8CjOUGm9X+F6pO6JyR84phD8fOEX6son8WTGLH5TeIxNYsgoeb
   riOjWLvmUWPPBjdGML2bJ5nHKkIrWkOBQymvHHJ7YdXiZATN76H3Rfhal
   w==;
X-CSE-ConnectionGUID: ozRohwlMTmOVDpccVOv1+w==
X-CSE-MsgGUID: 2d1CQeqyQ9OULkPIfcb/GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55362378"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="55362378"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 07:18:08 -0700
X-CSE-ConnectionGUID: BmGLVbrjQDGzj2uYyBXmeg==
X-CSE-MsgGUID: aD5/l7HzQGy0oCKxXYIGvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="147107133"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jun 2025 07:18:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOdK8-00075J-1I;
	Mon, 09 Jun 2025 14:18:04 +0000
Date: Mon, 9 Jun 2025 22:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1] ERROR: modpost:
 "__i915_to_display" [drivers/gpu/drm/i915/kvmgt.ko] undefined!
Message-ID: <202506092253.QrTv4XLJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   8c54d26d6e5d3a3812a721f86ed7fa74594355e4
commit: dedf061dd416a65a919b221ce2b895506866c8f7 [0/1] UPSTREAM: drm/i915/display: add intel_display_conversion.c to hide stuff better
config: x86_64-buildonly-randconfig-005-20250609 (https://download.01.org/0day-ci/archive/20250609/202506092253.QrTv4XLJ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506092253.QrTv4XLJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506092253.QrTv4XLJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: vmlinux: section mismatch in reference: mc_debug_data+0x0 (section: .data) -> mc_debug_data_early (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
WARNING: modpost: module ext4 uses symbol dget_parent from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module ext4 uses symbol d_drop from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module exfat uses symbol d_drop from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module exfat uses symbol d_rehash from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module autofs4 uses symbol d_drop from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module autofs4 uses symbol path_get from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module autofs4 uses symbol dentry_open from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module orangefs uses symbol dget_parent from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module btrfs uses symbol dget_parent from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
WARNING: modpost: module gfs2 uses symbol dget_parent from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
ERROR: modpost: "of_regulator_bulk_get_all" [drivers/pci/pwrctrl/pci-pwrctl-slot.ko] undefined!
WARNING: modpost: module drm uses symbol dentry_open from namespace ANDROID_GKI_VFS_EXPORT_ONLY, but does not import it.
>> ERROR: modpost: "__i915_to_display" [drivers/gpu/drm/i915/kvmgt.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
