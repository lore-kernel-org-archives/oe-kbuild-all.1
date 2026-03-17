Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50C33F0778
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 18:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773772897; cv=none; b=r1hW2cQbdTpiaDzfw/Qeia1sZ41whzs/QWN3G6Qhof0yV2XOX1uOUHNlPNYGW7mfWuuNGx4Pd/xtvtnSmWIVItzfKEsAkzeal2HN7jg060HFKFD+jczCE33Jl9T61cmPxkjJr63wM9lcYfxOj2iJ0KPsYzBOmyrOedHhyTAKCoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773772897; c=relaxed/simple;
	bh=1x1ZJ7X3CFrV0LV0aFksvJ+hpQJ7n5qL8WyYRmXoG0E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IEkHliXNpAor2hwmLUOOKW5S0kvoqVVQFKgF4I0+K85d2n7xvClG22j/r4FRRavkxnGlmqPU1A/JtXz54q7CTxFphb0GrFtZsxmA9UB5pJPetw5IJjDZZVyYaXTVOfa5/rHLw0ll4MXtPFktiZXRztWXSzjxvXoGeOI2Ud3pkk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYMpxCRZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYMpxCRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773772891; x=1805308891;
  h=date:from:to:cc:subject:message-id;
  bh=1x1ZJ7X3CFrV0LV0aFksvJ+hpQJ7n5qL8WyYRmXoG0E=;
  b=XYMpxCRZ2AgczifGlaMmuGBPqSsxPuvNem2eBvjX5fo2rR2fFy2Fm3tL
   YdX/9BuvEHQcN+r3wIZqIo5CM+QtVxsElub+on+LG5LHqXVcvNuQbpU7f
   J/b/BMLpDzkJbWp4SUaeQMQ9m0rp2Heu7cjeH4ET8wJ3G6MZT1MpWIRKk
   91ncJ6Aj/qR4IQ/qcVDAgS7eLf78rKF/Jfj8hSLPF7p3q8UygWWmDmssx
   p+EvrK42UmaskXnLfBOQ5y0AocSaTaFiHP1yCQdNiXlziJlwoehqd5E5T
   vNYvowsM5d5MolVzTfoQYJ+owLYptRXnHVKN4Wlg1n1VPlIvbI/6ZvO0p
   A==;
X-CSE-ConnectionGUID: jZPU4mrVS2amR/9OXHUeOw==
X-CSE-MsgGUID: qb6T3gvDQvmQ65axLOdaHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74701675"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74701675"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 11:41:30 -0700
X-CSE-ConnectionGUID: C48LfdxATuWvnjd1aEksYg==
X-CSE-MsgGUID: iY8736uqTwWSdOgDlKa6iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="221427137"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Mar 2026 11:41:29 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2ZM5-000000001oh-3ieX;
	Tue, 17 Mar 2026 18:41:25 +0000
Date: Wed, 18 Mar 2026 02:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/virt/halla/hvm_vtimer.c:77:16: warning: variable 'ret' set but not
 used
Message-ID: <202603180258.IScUlx8m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   18ca40f8c454986a4e52dd4ffcc9c2c9582fd718
commit: 9007a992df6c7fbc50cbcc21613b3a5c3c019ab6 [1/1] ANDROID: drivers: virt: Initialization halla module
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603180258.IScUlx8m-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180258.IScUlx8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180258.IScUlx8m-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

   WARNING: modpost: module exfat uses symbol d_rehash from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ecryptfs uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ecryptfs uses symbol fsstack_copy_inode_size from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ecryptfs uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ecryptfs uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ecryptfs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ecryptfs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ecryptfs uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfs uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsv4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsv4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsv4 uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsv4 uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsv4 uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsd uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsd uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsd uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsd uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsd uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsd uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsd uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsd uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsd uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsd uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsd uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module nfsd uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cifs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cifs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cifs uses symbol d_rehash from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cifs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cifs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cifs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ksmbd uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ksmbd uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ksmbd uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ksmbd uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ksmbd uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ksmbd uses symbol vfs_path_lookup from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ksmbd uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ksmbd uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ksmbd uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ksmbd uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module autofs4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module autofs4 uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module autofs4 uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module fuse uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module fuse uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module fuse uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module fuse uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module fuse uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module fuse uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module fuse uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module fuse uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module fuse uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module fuse uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module overlay uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module overlay uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module overlay uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module overlay uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module overlay uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module overlay uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module overlay uses symbol vfs_path_lookup from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module overlay uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module overlay uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module overlay uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module overlay uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module orangefs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module incrementalfs uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module incrementalfs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module incrementalfs uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module incrementalfs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module incrementalfs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module incrementalfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module incrementalfs uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module incrementalfs uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module incrementalfs uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module incrementalfs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module kafs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module kafs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module kafs uses symbol d_rehash from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module kafs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cachefiles uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cachefiles uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cachefiles uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cachefiles uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cachefiles uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cachefiles uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module cachefiles uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ocfs2_dlmfs uses symbol mount_nodev from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module btrfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module gfs2 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ceph uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ceph uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module erofs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module erofs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module nbd uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module nbd uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ublk_drv uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module target_core_mod uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module target_core_mod uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module ubi uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
   WARNING: modpost: module sunrpc uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
   WARNING: modpost: module sunrpc uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
--
>> drivers/virt/halla/hvm_vtimer.c:77:16: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      77 |         unsigned long ret;
         |                       ^
   1 warning generated.
--
>> drivers/virt/halla/hvm_ioeventfd.c:27: warning: Function parameter or struct member 'hvm' not described in 'ioeventfd_check_collision'
>> drivers/virt/halla/hvm_ioeventfd.c:231: warning: Function parameter or struct member 'hvm' not described in 'hvm_ioeventfd'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/ret +77 drivers/virt/halla/hvm_vtimer.c

    74	
    75	static irqreturn_t hvm_arch_timer_handler(int irq, void *dev_id)
    76	{
  > 77		unsigned long ret;
    78		u32 tuple = *(u32 *)dev_id;
    79		u32 timer_ppi = guest_vtimer_irq - HVM_IRQ_PPI_START_NUM;
    80	
    81		if (tuple == (u32)(~0) || (read_sysreg(cntp_ctl_el0) & (u64)(2)))
    82			return IRQ_NONE;
    83	
    84		// mask timer
    85		write_sysreg(read_sysreg(cntp_ctl_el0) | (u64)(2), cntp_ctl_el0);
    86		isb();
    87	
    88		// call IRQ_LINE HVC
    89		ret = exynos_hvc(HVC_FID_HVM_IRQ_LINE, tuple,
    90				((u32)(1) << 31) | timer_ppi, true, 0);
    91	
    92		return IRQ_HANDLED;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
