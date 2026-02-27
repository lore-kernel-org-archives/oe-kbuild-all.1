Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27BF266576
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 01:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772154676; cv=none; b=u0oV7DcX9EaW8eP0/2fAMWzghSxbf0NcXSc7z6Vr4ikCvN4G71JWQITG3ESoaOy4Evej1AN8u5snVfXk5869KVYqhVeVjUdk/EY0ilzrqqkALVfYc15iS0APwqYrep2RGVfPkfkpq1IQoHdgq/Lb3mr2lpgI3UKbKoqCyhOTHVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772154676; c=relaxed/simple;
	bh=LU9ihV475rpSblzF+5hbRURgbEFkHsnZ9jGPn1gRQQ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lq4T5bbrCNi5lpIxvRQ5ru99CxQ89ox8RL3NoIfW3gkdLkDB2VnrJSsQZX+/dBC9wwuWzcDH2OwGSwtrSvNVPYEKDV5MrEXVMYGAc2yaRkQ5t89aG0miJqGCdgXZRqprE1GRrmOLT+KruwGF41RxKsq/ZA/E9lOuE0cn00Ssdlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKRjfa6h; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKRjfa6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772154673; x=1803690673;
  h=date:from:to:cc:subject:message-id;
  bh=LU9ihV475rpSblzF+5hbRURgbEFkHsnZ9jGPn1gRQQ0=;
  b=SKRjfa6hdz6Cien19EPNCk611kkE/mpCEsUDsNhhjyEuLE+WOtNp/BC+
   bEfxB0K3g25VTKRQbEacCam9MiqrVMc6afWiAv0Frjkf+AOBQqCZYKWVZ
   HqZyiNkibw3+4lJqcullB5I/0IWOaG/kfKnp98HhJzkVKkOJ6oCdt02jX
   G6k9r2KM8lfCUd2OiRJG25zH7415Opb53kO8XLT6kQo+F3VtgRfeODNh4
   f7WP8cK7qZQbygWzAHBcie8RrP1fmc4x1mBAu7Hr4ZIP9IgtAgzZ/IlbK
   Avpv91EbDrhNydRqOkSkUmUVxoRCc+i/yThS6xAes7Jzi7YxuMyrW3GgK
   Q==;
X-CSE-ConnectionGUID: cbwWWALcSj6GQeM3Uesltw==
X-CSE-MsgGUID: 8H1+71ByRfSjJJdX9HjSlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73339479"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73339479"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 17:11:13 -0800
X-CSE-ConnectionGUID: AsQmXHksRvie7rWpMC4oqA==
X-CSE-MsgGUID: l8dUQR67Ru2HTcIudLg7Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="216647010"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2026 17:11:12 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvmNM-00000000A4V-3O5q;
	Fri, 27 Feb 2026 01:10:48 +0000
Date: Fri, 27 Feb 2026 09:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2] ERROR: modpost: module
 ublk_drv uses symbol vfs_getattr from namespace
 VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not
 import it.
Message-ID: <202602270927.57P61bch-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e95e3fa60f58a6428b10ee89bd7c0c8935559240
commit: e2c81a7fa3cb3fe3ff19af6fcf11cf014a578f24 [0/2] ANDROID: Fix incorrect namespacing for ANDROID_GKI_VFS_EXPORT_ONLY
config: i386-randconfig-004-20260227 (https://download.01.org/0day-ci/archive/20260227/202602270927.57P61bch-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270927.57P61bch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270927.57P61bch-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
ERROR: modpost: module nfsv4 uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module xfs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module xfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module xfs uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module btrfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module ublk_drv uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ubi uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module target_core_mod uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module target_core_mod uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
