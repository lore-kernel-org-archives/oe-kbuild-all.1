Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7402BE639
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 05:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772776443; cv=none; b=FfKcK/A0nkToHq13qJm5JbtbUbXtk6Jooj0LXhcRIjbpeVNyuGAIhfFob8JVaShVQcq+OlS4yNU8NwJeGr4zmZe74EifL3SLQ2o5Kwovww+XhLIzTX6V/E4F8VDRYV6lFfOogs8YA8jDK+XnzD5wU+qp5wM1JrsK9FwkYw6aZp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772776443; c=relaxed/simple;
	bh=A2TOHTuujOX4/fF5LocVXmepjCbt47G6X0nYc3D613s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=odD2GX990MB+rhfg48bhEFEGfOgynU40WuvI60TOACkU8JvE/LT2OrFwjsEsBVE/Z+2fuTncm4b5OPKFRRV9lL8HEZ8aedRtbV3cD9aN1qCuI1+q1TZgE18m8064w+dnK+1R/O8WbV0V5CcpMaOWW/yzZfYVytVvudwDuhjdzSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hh/J6e7U; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hh/J6e7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772776441; x=1804312441;
  h=date:from:to:cc:subject:message-id;
  bh=A2TOHTuujOX4/fF5LocVXmepjCbt47G6X0nYc3D613s=;
  b=hh/J6e7UF/HgadbhJXH9QNRWp2xLu+3I2rBGZQkDw2kyODYPPbX+Cyfd
   LQBm/cDCDXinclO68GdnSRC4DGL0Bs3FiQih+jwkRgWg1Owe6KllgnlVH
   qcO+7kpbcKuQbBlssXcOQec47tZjhLzdWMRFNTJBk6ARHn5ftlqnPvhDf
   iJyzplaza8J5h0rld60y1sloRB73EwF9wQNZMMVjE+VbmZUKAYYrfgXqh
   ZeIjkdsonSiUhEjMLME60yQ2+qSWzE/zRzQTEj65AZrD1DEYsEtp7HP1P
   LE4Wxk7qW1rVvhaF9fYuAzcEEzQQgDCllfbvSKLenj7QMtlaRn/AjvZOX
   w==;
X-CSE-ConnectionGUID: /eTTG6AfQIGpurql5ThDEw==
X-CSE-MsgGUID: FkiemOQJT6SfEibDOG7Q7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91270407"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91270407"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 21:54:00 -0800
X-CSE-ConnectionGUID: JajwcGS+TpWE6oR0oWrcEQ==
X-CSE-MsgGUID: DVi8E3u6SA2esj10QoI3KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="215634069"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 21:53:59 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyO8K-000000000QX-2n7R;
	Fri, 06 Mar 2026 05:53:56 +0000
Date: Fri, 06 Mar 2026 13:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2] ERROR: modpost: module
 ceph uses symbol d_drop from namespace
 VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not
 import it.
Message-ID: <202603061309.zggoYocd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   6a6bc2e596fed8d1574eca852772273befbb255e
commit: e2c81a7fa3cb3fe3ff19af6fcf11cf014a578f24 [0/2] ANDROID: Fix incorrect namespacing for ANDROID_GKI_VFS_EXPORT_ONLY
config: i386-randconfig-061-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061309.zggoYocd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061309.zggoYocd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061309.zggoYocd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/bpf/preload/bpf_preload.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/md/dm-bow.o
ERROR: modpost: module nfsv4 uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ext4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ext4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module exfat uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module exfat uses symbol d_rehash from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module incrementalfs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module incrementalfs uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module incrementalfs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module incrementalfs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module incrementalfs uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module incrementalfs uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module incrementalfs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module incrementalfs uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module incrementalfs uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module incrementalfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module xfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module xfs uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module xfs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module btrfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module ceph uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module ceph uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ublk_drv uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module snd-compress uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
ERROR: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
