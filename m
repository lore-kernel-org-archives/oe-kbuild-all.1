Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C024B33F5B3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 03:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199681; cv=none; b=AYjbYV962vJr/+U7p7KZ/Gw3jllUcCoCbJwpDvLbU8718f7Nc5xGI0k53n23tCx1XcOVnkSwmO3zJWy+dLkPLgCs88DCHIYE0QJTuzz1U2ginRiYUdC0MHGtDKW4C7U9WIV+6xcx2UeXxUuoj2ifU5SaXkKYuCHUze9gmRPYKw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199681; c=relaxed/simple;
	bh=jCh5tD9oJBFD/nEXhRBnp8NhCw1lP91FMq8Gv2giwwY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q4+99UYKrFobk0ExrS2q342LzoQHe8FS0gvGr85E6oUWJsBOclJqzQ5SDLfJH5h6WHTGKQqhed/aPmMZKVg5NCtRYXwGHAwfL+nX68asEWtTUPeV3QAhrhO069sUydSnKt1cvyOmLjnalD7Q73RPqG9pTjGcAf08+NxVrFA1JEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flwerXEE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flwerXEE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773199680; x=1804735680;
  h=date:from:to:cc:subject:message-id;
  bh=jCh5tD9oJBFD/nEXhRBnp8NhCw1lP91FMq8Gv2giwwY=;
  b=flwerXEEtVLkZuQhWC5+qVTPxtgx1Fhg3is965FGPCwdkzsquKEbx4Fo
   ch0UJGw+O7e/MXSO8r6R0TtwCQTI+yK6fgGJ8qgG8an76u4M9plXh36jo
   zKwH+GkjVjxSc5YOwSDu39QnxQx+40djdGtALwG5uQiqgv7VtqQDn3xB0
   HWf/l9hCmSpOgBEWChvk6x0voE0vaDcj4Dva7+eco6/P4exIsYxp1pedG
   jDXK5L6Oq/OBGQDSQtj04dvXkO2u+WCWnlScHo0L5PtCWHCCb54P022S8
   I3uKF5wePlkUNnDwgPzLi7vfVzAkRYwM4/eUm18xlRh7BELSyReo1ll5k
   g==;
X-CSE-ConnectionGUID: D0kIOJV4RRiMxYLzUo7dLg==
X-CSE-MsgGUID: YCvF1siQSVy5TWXNROFkyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="76869500"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="76869500"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 20:27:59 -0700
X-CSE-ConnectionGUID: mZm5hkVuSBqaJ6rg2Z+IJA==
X-CSE-MsgGUID: BbeXX2fKRnCErJj3w2kxLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="218229239"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Mar 2026 20:27:58 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0AEl-000000000eb-36GK;
	Wed, 11 Mar 2026 03:27:55 +0000
Date: Wed, 11 Mar 2026 11:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] fs/binfmt_elf.c:2131:13:
 error: no member named 'min_coredump' in 'struct linux_binfmt'
Message-ID: <202603111134.KPorfAtQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c2d2bec89da852542669929ee4f04fbc64691318
commit: 7964dc9503054b0e617a38f92e9751a60c6ce975 [2/2] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: i386-randconfig-012-20260310 (https://download.01.org/0day-ci/archive/20260311/202603111134.KPorfAtQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111134.KPorfAtQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111134.KPorfAtQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/binfmt_elf.c:2131:13: error: no member named 'min_coredump' in 'struct linux_binfmt'
    2131 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |         ~~~~~~~~~~ ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
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


vim +2131 fs/binfmt_elf.c

  2128	
  2129	static int __init init_elf_binfmt(void)
  2130	{
> 2131		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2132		register_binfmt(&elf_format);
  2133		return 0;
  2134	}
  2135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
