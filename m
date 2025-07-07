Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545ED1C5D55
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 21:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751924315; cv=none; b=vEx1z4frD3tzsM4QkMK3vY/A6jkeVCpi4QO5RaIXngsJEhXIDygqYgDPJI1ILlAeFCO/WpU4AJzumDBjMqCzBZLy3fn8xvGSkyaSpww6o3RK25uJiGOKFM9OD7l1gYR7DeUgIvdvXU+6YpCwASdUlyk32huOnGvVumtAwr6lXZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751924315; c=relaxed/simple;
	bh=nUPQjbUzjyWSHWL0blBZyC0Ncv1+L/elGMTfU7OpyV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IIGb1W2pJxfGlgApox9XzdV0CxZsuNNbOQBVjxXRZQfRF1xyvu8SDcAfOvG20/15ozKWR1KdeQSbhVoJRuZmIkKdHKBjX5aI5ufm6CHoDXAazQ3T7F1xagK86JbDsreMTXgCFo6Z+4pwGzLbN2RQzN3HRPrtfe4IlyTHLQPVvhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGMtBOHs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGMtBOHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751924314; x=1783460314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nUPQjbUzjyWSHWL0blBZyC0Ncv1+L/elGMTfU7OpyV8=;
  b=nGMtBOHsL+DZNzCIhYtxBzLajkpdR0BuVknWFVPY4FtKvlhXH0w4NvGe
   BUiAjHZIuibfF47JRJPZktB8YSMvg3H6Ee0jH00ilaaI/NkN3BbHGsoNS
   6iOQtdOD26pYZE+XTari+uZRx43dwyhmGDPm6ijf4aPhFBQsV6M1ANRId
   KmvQB+fTQjKoNng2UBMQ8XJIVvHsgfKLq68F3Uqnih4JxB9AN9FRYHKNv
   YB3PAYIk+Z0J981vYWKUOBuOo3iTh4YalxsmKTz3/45JaO6U323Jb0nQu
   Z/4AdxFWwNQHSQJ3HwJ8Nr1NkYrH6pL0IzopmBZFSRwcbikyMi7WGpdbZ
   Q==;
X-CSE-ConnectionGUID: PxmsKr2dTXWbZgw3BDj5Ow==
X-CSE-MsgGUID: +7vMb27nRRuUoMxz3wWJkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54125351"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="54125351"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 14:38:33 -0700
X-CSE-ConnectionGUID: e45zr7jZRqa50WC9uoO0HQ==
X-CSE-MsgGUID: poFnKSfDRtmLeRNxtj6J3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="159655365"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jul 2025 14:38:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYtXh-0000lP-22;
	Mon, 07 Jul 2025 21:38:29 +0000
Date: Tue, 8 Jul 2025 05:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] ERROR: modpost: module fuse uses
 symbol dget_parent from namespace
 VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not
 import it.
Message-ID: <202507080551.jXZm37No-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f6ca783ba264dd369e8cc3ae35cb42ceeaf0f915
commit: e2c81a7fa3cb3fe3ff19af6fcf11cf014a578f24 [2/2] ANDROID: Fix incorrect namespacing for ANDROID_GKI_VFS_EXPORT_ONLY
config: x86_64-randconfig-161-20250708 (https://download.01.org/0day-ci/archive/20250708/202507080551.jXZm37No-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080551.jXZm37No-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507080551.jXZm37No-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma-buf/heaps/system_heap.o
ERROR: modpost: module reiserfs uses symbol d_set_d_op from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol fsstack_copy_inode_size from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module fuse uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module fuse uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module fuse uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module fuse uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: "of_regulator_bulk_get_all" [drivers/pci/pwrctrl/pci-pwrctl-slot.ko] undefined!
ERROR: modpost: module target_core_mod uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module target_core_mod uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module snd-compress uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
ERROR: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
