Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21334207F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747499098; cv=none; b=Bfq9XaKEVWkkZUT60edv0Wwf5q7xJM+qeFQDpY0Vy00s+LFKX2wzFVgr+Bnjw/nTpJxmMOa7lIBYbU2tJBrKdL7vu++vOdck0JJl9BQMrePmbFbnHU+vvkzsQzKuzs5+jiWdc3iTLaW0L/2V1Jvl/rdoUkvujlBHJSHsgAFXnNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747499098; c=relaxed/simple;
	bh=N5pil9C0aTqqAZwmHuJG6XqNQBrHKj98VhId+ZkYKKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uMksCaGeYOFdH6H7fJmV7AF3DROI19/EEnhkh4IzSfmSN94PcN7hVHuaqW338OXqsb/U8a+lihoiBNuw5KRETeI8YAme3e+gAENMVx6VccTjBnqg9n1ItpI2iNUYK7t5cdiZJoAJONRMfHr8XvWomkepJoXnVzMzVZxJgc0VmUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHjeVOoX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHjeVOoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747499096; x=1779035096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N5pil9C0aTqqAZwmHuJG6XqNQBrHKj98VhId+ZkYKKw=;
  b=LHjeVOoXzjIfFDKjSeNVE56XMx7ZjcNsJnUm+34pKLnp5h7FSQ4XDIa4
   7M2ahH49UoO+qP4rno5K2eQBg1yObi9f808HJHSCU1fFmR5xJIlTQUaSH
   nGxwM37w7bAH4PzYOT39p5g3EU2xT3PRbgyCywXzz6I3kJ9dw5HJmF2FP
   Z4oNWmgmy4uCdjb8O63wr3fXDoUGKHvu09fPP51A+IRVWVCQ3tU5uoUhW
   0taq/qn3Gq30TKMS+l9LPDoGSGTFsVR7fHLqVMOesFaZoa+b+Lp2CicNU
   cD+ERMRM3HKkhcjugcrBQgTxLoNp7inRJ/dbuNIHZOvuGk1U/CtzMDZgh
   g==;
X-CSE-ConnectionGUID: GpOzi2EDTYKbu1gUL2db7w==
X-CSE-MsgGUID: ot+X4MBUQaCkrFoPB6NTgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="53254631"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="53254631"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 09:24:55 -0700
X-CSE-ConnectionGUID: 95A0OTZMReGFMV91SEcmaA==
X-CSE-MsgGUID: TMcfmBzvSqGMB1Bk2G3aEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="138890875"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 May 2025 09:24:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGKLD-000KFP-39;
	Sat, 17 May 2025 16:24:51 +0000
Date: Sun, 18 May 2025 00:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/27] WARNING: modpost: module
 binfmt_misc uses symbol dentry_open from namespace
 VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not
 import it.
Message-ID: <202505180025.GYjO177l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   147b27e8d66c20bee7541b52cd32243cd495c94c
commit: e2c81a7fa3cb3fe3ff19af6fcf11cf014a578f24 [0/27] ANDROID: Fix incorrect namespacing for ANDROID_GKI_VFS_EXPORT_ONLY
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250518/202505180025.GYjO177l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180025.GYjO177l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180025.GYjO177l-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma-buf/heaps/system_heap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/md/dm-bow.o
WARNING: modpost: module binfmt_misc uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module binfmt_misc uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module binfmt_misc uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module reiserfs uses symbol d_set_d_op from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module ext4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module ext4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module coda uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module exfat uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module exfat uses symbol d_rehash from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module ecryptfs uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module ecryptfs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module ecryptfs uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module ecryptfs uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module ecryptfs uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module ecryptfs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module ecryptfs uses symbol fsstack_copy_inode_size from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module nfs uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module nfs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module nfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module nfs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsv4 uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module nfsv4 uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module nfsv4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsv4 uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsv4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol vfs_path_lookup from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module autofs4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module autofs4 uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module autofs4 uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol vfs_path_lookup from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module orangefs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module xfs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module xfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module xfs uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module kafs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module kafs uses symbol d_rehash from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module kafs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module kafs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ocfs2_dlmfs uses symbol mount_nodev from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module btrfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module gfs2 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ceph uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ceph uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ublk_drv uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module target_core_mod uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module target_core_mod uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ubi uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
WARNING: modpost: module sunrpc uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module sunrpc uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
