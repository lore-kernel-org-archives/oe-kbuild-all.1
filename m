Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F6F54704D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 05:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792127467; cv=none; b=Hfdl6PuR0w4chx4hCBcTZYIe+O1m4Ikg/RmmlVpFUB1dodqu+CYAMUrH//0Zu4M9Bkw2djsst6dqlUMXrZRbKRSIIep7vUBD4ylHFSPUfU0o3n6jodnZF0/hZqJdwoP7/TkfWhYMz+G2YgEQI0FkWXAYK56ZRURdwYOH1TcrmIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792127467; c=relaxed/simple;
	bh=49F2PfDrjzmrV1bbV95Y0iHKiCJRs7wpu8ijYpO3nqw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X+SHoPbwJrwh4T0KFIAgxeuK6gqfwzuBImY4BFP0ayniXe+eDMhBtrQ5cW+P6hRETecs3qCqZpEuAqzsUO0HnyhElKpCj2ZutG6tuCXY2ZuYn4KVDrJrc1xCgYkbDShP0HC0MBjSClXt+mXRFitX40uMmQ7Q0lkSC97ax/PE7ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALxVHxIX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALxVHxIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792127466; x=1823663466;
  h=date:from:to:cc:subject:message-id;
  bh=49F2PfDrjzmrV1bbV95Y0iHKiCJRs7wpu8ijYpO3nqw=;
  b=ALxVHxIX0Ya1zBTzHDcMfhPbrrNwQgdeXZIP6Oo/6rOZxfQosKXZWQC3
   kGdO6RbhM24URkA4b1DtVLKL33hOKZoo95TmtiUXo2ByhDE9hvpkgAhfX
   yNxw2lh2S+eqQXXt0lZfzVIdbRmzaAEwxegJbpXIY1TLjsuVqt8ctQEVz
   cDmwp9La+TapB/BfQHuzwM/Gu2wrcM0vxPA9f9xLZyjqd59HPkVCdPkMn
   5HKB3aahzqWDdJR95y3zAIPdwRmtE2BonpR4uDu3rMosI7Gwshlbez2bz
   mtTlwsA2x2wrsvZDrkbhGqy+OzACe/FV94E0HLY6GLI7sTC2PyZA/+qZx
   A==;
X-CSE-ConnectionGUID: QAqS0wePRoG38MFhtHrgyQ==
X-CSE-MsgGUID: /qqe+r99Re+kCj98r9sXhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="903900"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="903900"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 22:11:05 -0700
X-CSE-ConnectionGUID: 8wwwKUnVToOXq3iDXxZ/hQ==
X-CSE-MsgGUID: DxUNZ0OKTka9XZdc3+aklg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1934052"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 Oct 2026 22:11:04 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHaDc-00000000C3n-3qEk;
	Fri, 16 Oct 2026 05:11:00 +0000
Date: Fri, 16 Oct 2026 07:10:38 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 25/25]
 include/linux/p3s_user_pages.h:11:2: error: "Must not include
 <linux/p3s_user_pages.h> from header files"
Message-ID: <202610160737.pn8K9bbl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   b4108abbd0e1cb0df40452dee77291f106e1d711
commit: 856798080ed545d2fa2ac46a8fc3608e077337e1 [25/25] ANDROID: P3S: binfmt_elf: Support 4KB process page geometry on ELF exec
config: x86_64-randconfig-2104-20261016 (https://download.01.org/0day-ci/archive/20261016/202610160737.pn8K9bbl-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610160737.pn8K9bbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610160737.pn8K9bbl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/compat_binfmt_elf.c:154:
   In file included from fs/binfmt_elf.c:52:
>> include/linux/p3s_user_pages.h:11:2: error: "Must not include <linux/p3s_user_pages.h> from header files"
      11 | #error "Must not include <linux/p3s_user_pages.h> from header files"
         |  ^
   In file included from fs/compat_binfmt_elf.c:154:
   fs/binfmt_elf.c:2136:13: error: no member named 'min_coredump' in 'struct linux_binfmt'
    2136 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |         ~~~~~~~~~~ ^
   2 errors generated.


vim +11 include/linux/p3s_user_pages.h

a2f18a09888311 Kalesh Singh 2026-09-21   4  
a2f18a09888311 Kalesh Singh 2026-09-21   5  /*
a2f18a09888311 Kalesh Singh 2026-09-21   6   * <linux/p3s_user_pages.h> must ONLY be included as the last header in
a2f18a09888311 Kalesh Singh 2026-09-21   7   * C source files (.c) that opt into dynamic PAGE_SIZE for user address
a2f18a09888311 Kalesh Singh 2026-09-21   8   * spaces. It must NEVER be included in header files (.h).
a2f18a09888311 Kalesh Singh 2026-09-21   9   */
a2f18a09888311 Kalesh Singh 2026-09-21  10  #if defined(__INCLUDE_LEVEL__) && __INCLUDE_LEVEL__ > 1
a2f18a09888311 Kalesh Singh 2026-09-21 @11  #error "Must not include <linux/p3s_user_pages.h> from header files"
a2f18a09888311 Kalesh Singh 2026-09-21  12  #endif
a2f18a09888311 Kalesh Singh 2026-09-21  13  

:::::: The code at line 11 was first introduced by commit
:::::: a2f18a09888311a25f609f1ac52a922b8d6f0725 ANDROID: P3S: mm: Add dynamic PAGE_SIZE macro redirection header

:::::: TO: Kalesh Singh <kaleshsingh@google.com>
:::::: CC: android-test-infra-autosubmit@system.gserviceaccount.com <android-test-infra-autosubmit@system.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
