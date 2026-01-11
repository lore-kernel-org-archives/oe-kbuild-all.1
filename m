Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00711F7580
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 06:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768114221; cv=none; b=nddTvxZ7Dd61TqvX2YvzluMoNWFp6i5hX+shrFHm/clkLw5bLsqIotvzwa5V4ehO0XAwl3NB5u30ZMY3s5EBgdyZAX7wyg8jl2Kj8vWITlp8ZpKdCVtznpzY7BaEBncfkqAsH77Wgmcn/eCsU1omhBcU14bjLXNCtNhe86cg0Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768114221; c=relaxed/simple;
	bh=xpwx/jOYB9SFFVoJtXCCyl3AFHNMnkxfM2CVIvztnOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FpOSMug7N8de737MJc3hQeoxwypJcJSzoyzqm39UnNQz02cZ4DrpkjiOzymFkgSuDppQyzM9S3tKiOfauBTwBmsEvUOuKRXAqq/xrRD98dmyAM5D5cVPMNavhNxi0i89ZiwIHzzZChMp/oJl6ORaoG12LiEzcfAfMommr301wsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTR50b9f; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTR50b9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768114219; x=1799650219;
  h=date:from:to:cc:subject:message-id;
  bh=xpwx/jOYB9SFFVoJtXCCyl3AFHNMnkxfM2CVIvztnOc=;
  b=aTR50b9f3uUvE6tocC+mmHpZWuS4WzuJ5RLDUzw4hBySp24oiFd2IRn6
   4WzH4eI5y+fg/xJGR9q5js43Sh/+9URLS7BY6abd6lBmIbADvDKB9L182
   oTYsqhkAr/kki3SAPDxRI+b0avVhK065jwBGJk407RRgfryNH7W/+dRPV
   BRqrX1CS/mExo0MTn+Js+Od05AzxNtdQa6ypVEW/uN11AF9dF+dIEsdzP
   t0I4SgG+r4kLZEMlGrisan9i9lzTQBeAeOT2ssrHs9eIPXFNnlcU1YuRb
   e+BDoAI2mJjg6VpGWb4/4r5nzi3/r5WUnaK7YqXm8X2b4H+faLrfc2iXI
   g==;
X-CSE-ConnectionGUID: WDczAZhTTUmJ53jVku1xQw==
X-CSE-MsgGUID: CVgiNjZVSQylVm+d4FwlGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69584331"
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="69584331"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 22:50:16 -0800
X-CSE-ConnectionGUID: qObzC5M1S+ux89Kxa0e5gQ==
X-CSE-MsgGUID: GY9mHTIXSVi5wr2DkJouVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="203891365"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Jan 2026 22:50:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vepHA-000000009i8-3I0q;
	Sun, 11 Jan 2026 06:50:12 +0000
Date: Sun, 11 Jan 2026 14:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 include/linux/page_size_compat.h:136:16: warning: division by zero is
 undefined
Message-ID: <202601111444.FmMEyC4Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f0901290e6c40511483b1976cf7abae6d0623b08
commit: d44ff7a3ed2e6df22bedad55abc1ac1c192095cc [2/2] ANDROID: 16K: Introduce rust __page_*() helpers
config: arm64-randconfig-r113-20260111 (https://download.01.org/0day-ci/archive/20260111/202601111444.FmMEyC4Q-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601111444.FmMEyC4Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601111444.FmMEyC4Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   make[3]: *** [rust/Makefile:332: rust/bindings/bindings_helpers_generated.rs] Error 1
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   include/linux/blkdev.h:1705:17: error: field has incomplete type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:239:11: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
   include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
>> include/linux/page_size_compat.h:136:16: warning: division by zero is undefined [-Wdivision-by-zero]
   clang diag: include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
   clang diag: include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
>> clang diag: include/linux/page_size_compat.h:136:16: warning: division by zero is undefined [-Wdivision-by-zero]
   Unable to generate bindings: clang diagnosed error: include/linux/blkdev.h:1705:17: error: field has incomplete type 'struct rq_list'
   include/linux/blk-mq.h:239:11: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +136 include/linux/page_size_compat.h

a9ccc1128eec04 Kalesh Singh 2024-02-06  116  
e076e9ff2c52d1 Kalesh Singh 2024-02-06  117  /*
e076e9ff2c52d1 Kalesh Singh 2024-02-06  118   * Conditional page-alignment based on mmap flags
e076e9ff2c52d1 Kalesh Singh 2024-02-06  119   *
e076e9ff2c52d1 Kalesh Singh 2024-02-06  120   * If the VMA is allowed to not respect the emulated page size, align using the
e076e9ff2c52d1 Kalesh Singh 2024-02-06  121   * base PAGE_SIZE, else align using the emulated __PAGE_SIZE.
e076e9ff2c52d1 Kalesh Singh 2024-02-06  122   */
e076e9ff2c52d1 Kalesh Singh 2024-02-06  123  #define __COMPAT_PAGE_ALIGN(size, flags) \
e076e9ff2c52d1 Kalesh Singh 2024-02-06  124  	(flags & __MAP_NO_COMPAT) ? PAGE_ALIGN(size) : __PAGE_ALIGN(size)
e076e9ff2c52d1 Kalesh Singh 2024-02-06  125  
e076e9ff2c52d1 Kalesh Singh 2024-02-06  126  /*
e076e9ff2c52d1 Kalesh Singh 2024-02-06  127   * Combines the mmap "flags" argument into "vm_flags"
e076e9ff2c52d1 Kalesh Singh 2024-02-06  128   *
e076e9ff2c52d1 Kalesh Singh 2024-02-06  129   * If page size emulation is enabled, adds translation of the no-compat flag.
e076e9ff2c52d1 Kalesh Singh 2024-02-06  130   */
e076e9ff2c52d1 Kalesh Singh 2024-02-06  131  static __always_inline unsigned long calc_vm_flag_bits(struct file *file, unsigned long flags)
a9ccc1128eec04 Kalesh Singh 2024-02-06  132  {
e076e9ff2c52d1 Kalesh Singh 2024-02-06  133  	unsigned long flag_bits = __calc_vm_flag_bits(file, flags);
e076e9ff2c52d1 Kalesh Singh 2024-02-06  134  
e076e9ff2c52d1 Kalesh Singh 2024-02-06  135  	if (static_branch_unlikely(&page_shift_compat_enabled))
e076e9ff2c52d1 Kalesh Singh 2024-02-06 @136  		flag_bits |= _calc_vm_trans(flags, __MAP_NO_COMPAT,  __VM_NO_COMPAT );
e076e9ff2c52d1 Kalesh Singh 2024-02-06  137  
e076e9ff2c52d1 Kalesh Singh 2024-02-06  138  	return flag_bits;
e076e9ff2c52d1 Kalesh Singh 2024-02-06  139  }
e076e9ff2c52d1 Kalesh Singh 2024-02-06  140  

:::::: The code at line 136 was first introduced by commit
:::::: e076e9ff2c52d14ee77aedc613f6112c3fe9238c ANDROID: 16K: Handle filemap faults

:::::: TO: Kalesh Singh <kaleshsingh@google.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
