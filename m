Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB33E3264FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 04:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781237491; cv=none; b=FkaUFM+0fYV4th3Pr0cN0I2pN8xh0wZhtDCejFCl/XTs07s7wG+0I+sN0GXw+kIqJUAIjPegLYQWsLPoKCWgO++4gllviBTGxJoXOmIDXdxYEJEALP8tcicJFEZQHVOLLxgZo9fVIgYDG6HNY/unp3BPD2wUoMcI2qklUGEFs3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781237491; c=relaxed/simple;
	bh=F4H8lhYWaTrRFVodRXlYxl2I+HoenkEvyq0qXY+OuLk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E5yiM/y9TaJ+8FgzcLnDTxFarnCFtFLiEFXEtBAnf+kHIOQAHNqfBp5OppwBNdxDW1bli397plWyRiTNZ4qmJgC5fO18pLFy17VHwHkso8YwmH8YYJ8jjpqQqWmcd09CcYyEFHGAYP1X76SqK0voog1qu6J2GDZB4YZW+2oy+5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1oXwUvD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1oXwUvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781237490; x=1812773490;
  h=date:from:to:cc:subject:message-id;
  bh=F4H8lhYWaTrRFVodRXlYxl2I+HoenkEvyq0qXY+OuLk=;
  b=P1oXwUvDcuU88V1t9JK3cV1C0TANzmThJ7zcP4FKFY61pt04qJvqQSwD
   TegjHL3+wMNb+BnSPIv9X2NYvZJza1F8XXNWfzjuXQUvViq3qZg3JEXEL
   n/FdyKEPGpGUfuEfiNXcK7kzgkgo+BzLJIWFra2B4kXIMZ9EVzwPJpd76
   MNK3/gA0lwk2RRzdwZX/vdg5a7PkeNekZ/OOD32C9lV7DLIFYiZbR/HhV
   U7Jg0/HuKX1X+cFVn2K1o/ahf7jA3ndz6hXpSHMhk1ijpO/JXZzV/E80f
   GZNoShazrJMUKg+NDq6EWHaEihwKXQNO/tOsztlTf+zp07w7CbADPsWaQ
   Q==;
X-CSE-ConnectionGUID: gpL7QbrjTjuUaA3BhyTVQA==
X-CSE-MsgGUID: +2HqM6wvSdS4YfIyxbFeQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82128426"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82128426"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 21:11:30 -0700
X-CSE-ConnectionGUID: bb3dVkX6Q5mMSfn/neIHHQ==
X-CSE-MsgGUID: Jfw0ve/kSiuBZOJq51/P5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="242579169"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jun 2026 21:11:28 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXtEr-00000000OIX-2PAq;
	Fri, 12 Jun 2026 04:11:25 +0000
Date: Fri, 12 Jun 2026 12:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 38/38] ERROR: modpost: module
 ext4 uses symbol dget_parent from namespace
 VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not
 import it.
Message-ID: <202606121215.bTZlCebv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17584f778119ed93d9ae85feb43561e05f5254b0
commit: e2c81a7fa3cb3fe3ff19af6fcf11cf014a578f24 [38/38] ANDROID: Fix incorrect namespacing for ANDROID_GKI_VFS_EXPORT_ONLY
config: i386-randconfig-006-20260611 (https://download.01.org/0day-ci/archive/20260612/202606121215.bTZlCebv-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121215.bTZlCebv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121215.bTZlCebv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ucs2_string.o
ERROR: modpost: module nfsv4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module nfsv4 uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module ext4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module ext4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module cifs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
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
