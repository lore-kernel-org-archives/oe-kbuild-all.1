Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D392438AC7C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773213269; cv=none; b=Cym0jgkvbRd6Nn3yxCW+A677rwnxMnAaVrXzut4r0M3a1ZLZlVB9YNeVKa6RY6X3ejsHpuAikadS+mpGmHBuD8TxgfG9I5P2Th1MdoM1gHouvVGVmex52pl0+baf4tvSWn6RIpjSLOPbh4k4vQaje8/hdEEJclith3AiO7ymZZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773213269; c=relaxed/simple;
	bh=KIpklYyzOJGSE1o30TlAMZa0/9+2TU5Ex8Kf0jXyLQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XGvkX/hrnQERuH+1OlwsT43GqDxqde1Fx2HEBRqoq3xJSL47KQiZ5BWzRTsdKWCRRMNtIM4N9Ovo6GYmLuaJ4MatPbkFimTQKPkXh1Yp5ypQGeJUhEml4qXQK3qARtL4GivNPkcbWLtg0NBLIqJ7oEHqWmOmSN21GiYXo599MEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hx7QJf7Z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hx7QJf7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773213263; x=1804749263;
  h=date:from:to:cc:subject:message-id;
  bh=KIpklYyzOJGSE1o30TlAMZa0/9+2TU5Ex8Kf0jXyLQY=;
  b=Hx7QJf7ZUn2mBNAyshXhbWVZ9j5E92zV9CHQNnAdeqIVn2oPoS+moR1Q
   WySxJ/HCmNTWS1cEt5q7Lxn3XT+/UqvXhCeNZUCSLB+6TlLIO1//azL35
   E7kqMUAUypstBifL4+tOsFcTfwTFfqJ6cQh+c69UdGsY+0JoYUCPE7Wn5
   x1f6QAF0kaJzrSdx3FyzGiFs3qxNGP0B0wKp4kpuW5vbKrHRgLFuU9wqO
   PsOjjEIlgC26dDK0M+rAimPhQiY9WWlX38UniNxQSJqQZwY0LYb9LOBQW
   B2+E6dkU5GWvRaVGUUSmlT8FwVdXeizl0lqsNsrALM1h4qjfINATajhAo
   w==;
X-CSE-ConnectionGUID: LPQ+AmzDQg6xK1Kk8SRUmw==
X-CSE-MsgGUID: 1ZMioNPuTTKU/KmBj5veUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="61846163"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="61846163"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 00:14:16 -0700
X-CSE-ConnectionGUID: CsA6/MmBSkuOCNtMDQ01sw==
X-CSE-MsgGUID: gRNEzwDCQaWlSDimEvDCAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="225071986"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2026 00:14:15 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Dll-000000000qP-00se;
	Wed, 11 Mar 2026 07:14:13 +0000
Date: Wed, 11 Mar 2026 15:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] ERROR: modpost:
 "put_ipc_ns" [drivers/android/binder/rust_binder.ko] undefined!
Message-ID: <202603111554.xcg9RfuJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alice,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0104b0412b0a41935ece11bfd31b3b309c734cd7
commit: 6441d34db3f500711cf5bcb3657c77a05f72b6e0 [2/2] ANDROID: support BINDER_IPC_RUST without BINDER_IPC
config: x86_64-randconfig-r131-20260310 (https://download.01.org/0day-ci/archive/20260311/202603111554.xcg9RfuJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111554.xcg9RfuJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111554.xcg9RfuJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma-buf/heaps/system_heap.o
ERROR: modpost: module nfsv4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module exfat uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module exfat uses symbol d_rehash from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol d_rehash from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module overlay uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module overlay uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module overlay uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module overlay uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module overlay uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module overlay uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module overlay uses symbol vfs_path_lookup from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module overlay uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module overlay uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module overlay uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module overlay uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module orangefs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module gfs2 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module erofs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module erofs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: "put_ipc_ns" [drivers/android/binder/rust_binder.ko] undefined!
>> ERROR: modpost: "init_ipc_ns" [drivers/android/binder/rust_binder.ko] undefined!
ERROR: modpost: module ubi uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
