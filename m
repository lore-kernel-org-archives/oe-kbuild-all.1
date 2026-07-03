Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF934349B02
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 06:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061681; cv=none; b=nFshlMwjWqN3P2wBk7wFf7UlsC0DPPB+qoQeUEU2MIftDJzbSaZLZD9z+wNf4dDX4R68YVhZGAHhnfNNW78DZdl+MLtbPE/UCoVxwMsptoYm/wwvaoPsrxwP1smDQ0EiRSM7JQjyel/PJQgiu6jzl2qnVZo7iIOrtZoBRMunWpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061681; c=relaxed/simple;
	bh=FDq60SHgWfyn003JS+RK2EH0rzVnsTAnKw6En0F/f8I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xa6TEtHAn0c9A+1t4MTOtPASME1sdkHz2rUxdfEnsfnnnKsiLRPI3Jh8eSuHP33o968ttSu8a6hH77ZuvBPgLuk/ms8J0x8VOcTSRETHgG7zgMc3rYpCvoob5v65cl/ttlHq4XdOeBCGHzdJZkVnSCtmgPZ+mX74ne1XdQqdS4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbbsmnK5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbbsmnK5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783061679; x=1814597679;
  h=date:from:to:cc:subject:message-id;
  bh=FDq60SHgWfyn003JS+RK2EH0rzVnsTAnKw6En0F/f8I=;
  b=RbbsmnK540nTj7KPASHNfE5bYm4uagfrg7VmkHy+i0OcfPL4E6x3hkao
   99v4Pl2/cJe8H1mj0ZWX+c/31yigVkNt9WinemCMV0DKd5MYQ3okY/eVE
   VK0DttbNtURXUYp+QuBjjd5IgTWw0tkmDggPoUZVTJev3u23kglTo3BHX
   1kT+SA4/ASvpXPw0o0Anywpg52hGQ5JlNQphwQJgCleQ4WdaDRbq6lHRz
   UPttWxud5nORm2tVqrDnQznIuXM/WPCcDAc8ccf+TR6iBK5lMFDz69qQJ
   3z8pdw/VIOJS8P2iSpNEJlVmzbGBwnKTLwqW6x60Pmicq9d5qJFwgkclA
   w==;
X-CSE-ConnectionGUID: moT2YteISzmIXTlo1bEsQw==
X-CSE-MsgGUID: /4h9PI98Ss2s/2BqyreeSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82799051"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="82799051"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 23:54:38 -0700
X-CSE-ConnectionGUID: 0iq481F2TUuOoiabOKtD0Q==
X-CSE-MsgGUID: XLoDNTmBQdODvp88MdE+fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="249075271"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jul 2026 23:54:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfXn7-00000000Bmh-3VpZ;
	Fri, 03 Jul 2026 06:54:28 +0000
Date: Fri, 03 Jul 2026 14:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] ERROR: modpost: module
 erofs uses symbol override_creds from namespace
 VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not
 import it.
Message-ID: <202607031400.SC4bximg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tatsuyuki,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d36feda1de5741a9d2bfe0fd6a0391c77047f5bb
commit: c40c54e66959c2a9a1040bd28c8fe797807f834e [1/1] UPSTREAM: erofs: impersonate the opener's credentials when accessing backing file
config: x86_64-randconfig-r062-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031400.SC4bximg-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031400.SC4bximg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031400.SC4bximg-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_module.o
ERROR: modpost: module nfsv4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module binfmt_misc uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module binfmt_misc uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module binfmt_misc uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ext4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ext4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol fsstack_copy_inode_size from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ecryptfs uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
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
ERROR: modpost: module cachefiles uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cachefiles uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cachefiles uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cachefiles uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cachefiles uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cachefiles uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cachefiles uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module erofs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module erofs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module target_core_mod uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module target_core_mod uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
