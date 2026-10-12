Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B01F42586B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 19:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833080; cv=none; b=c/JqksnenGVo2TEUZ/JIIaFlCKLzEjIw4Y1nz8k8n92WxOeUqN3zZUjGOwlmf3FInLpQJNLAN0ZSpCTIF0YUkCDWzqCtxVXH9eNn4KdEuEBeFRsCzu0ywrPvRx4D1FM88hnkqUvRwQrcYRcUCivDZYmy0msHqCwaQek6MSfLUjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833080; c=relaxed/simple;
	bh=Xn4cdIIkZ6z3599yaUVr8P7ui6BasAs1hkIyfBUDfdM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iKLlcKqRX0ERUyHDclXPuAqyaVJ6ZK6JYSPodMEX2orwlXPvVWf1+jXJdCs4Mz2IeP7X/WwExODm9MOO0yusVqBJ7JauYHuZgeQisu3vyWGbn8nZTrLj2GQLsP8b3ZfnD3b0LvEAmBiSWb6lxs5aOYEYJZb1Ytt15TEl8YQkmcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYAWbSTR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYAWbSTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791833080; x=1823369080;
  h=date:from:to:cc:subject:message-id;
  bh=Xn4cdIIkZ6z3599yaUVr8P7ui6BasAs1hkIyfBUDfdM=;
  b=fYAWbSTREbBN4dDOvTDikAKUyvpQepmB44qANhmgOfCySrY7SWFFmjhH
   UIlgh27M4SWIengzQqsQZTQR9dZ50pvXtYbeXS5v0Mt0I0GhmmOUUAS0g
   65+IY5FZi5GA6FCbFCYUZjmWzJo2uZGefRpE/iNCqpSWiSC8mVCoruDqP
   2/yGgahJgabGkp23s+q0iYjgDLho3NatL6MM3CjGCGAZ2k8RRnkmCDAck
   XQ+gvb1eRwp4HyG0WB14WN1IcMxNPELSU/RprC2efpiR088dsMiKM5xxe
   gwsOYl8wyaSrQi97Qys6qvv4F+nQ7ySQf5vw8aP1vWIGUJEOMQuuSoYOM
   w==;
X-CSE-ConnectionGUID: N4ildJztQAGEf03G9OPI4Q==
X-CSE-MsgGUID: ZK/4G6RkT8ehrKCBSTYSmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="433270"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="433270"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:24:39 -0700
X-CSE-ConnectionGUID: FNKyeOfySgKSIXUqn4e89Q==
X-CSE-MsgGUID: wBb65IVFQX+md1oZ/6McSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1338480"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 12 Oct 2026 12:24:37 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGLdT-00000000AAh-1MKe;
	Mon, 12 Oct 2026 19:24:35 +0000
Date: Mon, 12 Oct 2026 21:24:09 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 21/30] warning: linking module
 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of
 different target triples: 'lib/xarray.o' is 'aarch64-unknown-linux-gnu'
 whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is
 'x86_64-unknown-linux-...
Message-ID: <202610122118.UGhuQZuH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   04931fc5641da29be2c7c71b030762f3e7d50874
commit: 5008137d63dda329a38c1a2538fe6884f0f9a7e9 [21/30] iommupt: Add a kunit to test the iotlb invalidation flow
config: arm64-randconfig-r2101-20261010 (https://download.01.org/0day-ci/archive/20261012/202610122118.UGhuQZuH-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610122118.UGhuQZuH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610122118.UGhuQZuH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'arch/arm64/mm/init.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'drivers/iommu/iommu.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'lib/kunit/try-catch.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'lib/string.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'lib/xarray.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'mm/vmstat.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   '+outline-atomics' is not a recognized feature for this target (ignoring feature)
   '+v8a' is not a recognized feature for this target (ignoring feature)
   '-fmv' is not a recognized feature for this target (ignoring feature)
   '-fp-armv8' is not a recognized feature for this target (ignoring feature)
   '-neon' is not a recognized feature for this target (ignoring feature)
   '+outline-atomics' is not a recognized feature for this target (ignoring feature)
   '+v8a' is not a recognized feature for this target (ignoring feature)
   '-fmv' is not a recognized feature for this target (ignoring feature)
   '-fp-armv8' is not a recognized feature for this target (ignoring feature)
   '-neon' is not a recognized feature for this target (ignoring feature)
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB34_14
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB34_20
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB42_76
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
           dmb ish
           ^~~
   <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
           dmb ish
           ^~~
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB43_32
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
           dmb ish
           ^~~
   <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
           dmb ish
           ^~~
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB44_7
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
           dmb ish
           ^~~
   <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
           dmb ish
           ^~~
--
   warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'arch/arm64/mm/init.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'drivers/iommu/iommu.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/kunit/try-catch.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'lib/xarray.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o': Linking two modules of different target triples: 'mm/vmstat.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_riscv64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   '+outline-atomics' is not a recognized feature for this target (ignoring feature)
   '+v8a' is not a recognized feature for this target (ignoring feature)
   '-fmv' is not a recognized feature for this target (ignoring feature)
   '-fp-armv8' is not a recognized feature for this target (ignoring feature)
   '-neon' is not a recognized feature for this target (ignoring feature)
   '+outline-atomics' is not a recognized feature for this target (ignoring feature)
   '+v8a' is not a recognized feature for this target (ignoring feature)
   '-fmv' is not a recognized feature for this target (ignoring feature)
   '-fp-armv8' is not a recognized feature for this target (ignoring feature)
   '-neon' is not a recognized feature for this target (ignoring feature)
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB32_15
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB32_22
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   8 warnings and 20 errors generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
