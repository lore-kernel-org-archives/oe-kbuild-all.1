Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F393C942B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Oct 2026 06:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791699873; cv=none; b=E/NTiKdo51JacwDRb4aqc4RVXTbwyFxagX6vtSY+tWJs//+UWMZjbggGmdVmIlLqMKwUiZOilYZr1WpJWAa9Mh409+n9TeGawj3r5H0Cy8dgSkDDu3pfHJNnxO3Wydchn73yohkzfCuq74MBj0tJTvDsV0lUF30o1ljadwbulxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791699873; c=relaxed/simple;
	bh=jPvTSJ8Q0dnXYaru7Mi7ydiDEd63kXdJEC6p9++GBSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dDMEFzpNhHz8s8OipJQgfbOyZRYgkq7J2mahQ6XW2RtdJJoyY0zsrClDm7Lacsuqe1JoV2qUX3M5WJPNH8sB6yON4rBDuDAHlxnPNaeMXd9X2zZuXq8+QVqfc5Qal1tBufTpHNK2xdaaclrn1tJR0jnzUuorw7/h4J5F0vDsDkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EO0+GiPe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EO0+GiPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791699871; x=1823235871;
  h=date:from:to:cc:subject:message-id;
  bh=jPvTSJ8Q0dnXYaru7Mi7ydiDEd63kXdJEC6p9++GBSA=;
  b=EO0+GiPeQ9bxqYhI8/Ac9yu9O4qsuMDLRF109bGtVY3zTUy7yNRU0YvM
   EM7z/k5X0MdFGBB2frrUZ9/b7sSTE8oguS3p+VF69cUd1tbvdJ0TJ2i8d
   oQRt0f33Cw5W8IcXLYD0ScYwtJo37+eMk3+Z3GyfmOIMs7XS+f5ihqivv
   FlMbb60TfXE83zQ7CnWSN5wnJOxtcZkBHRuVSh1+y2RNBgA/N+vE1kKPA
   Dui0TCFFLKqe0yIQ+7vhSdMXeh1TR7O9UNoJjMAz8OZbCB9Bnv8/fNsR9
   GpD3fjBZZY/iPAwdUlbivtvIg6EBI3nC20j85xxug+zfnYn310I/EszQE
   A==;
X-CSE-ConnectionGUID: FYR4LetGRAy7JrHwDil1tw==
X-CSE-MsgGUID: PfGyTD3SSYWLEfeH7pV6jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="433530"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="433530"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 23:24:30 -0700
X-CSE-ConnectionGUID: xUr6hhXHQNeScM9U3St0zA==
X-CSE-MsgGUID: sYaGZVU9Qa+LOasmyZH66g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="2428461"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 10 Oct 2026 23:24:28 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFmyw-000000009QZ-0ddl;
	Sun, 11 Oct 2026 06:24:26 +0000
Date: Sun, 11 Oct 2026 08:23:50 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 19/30] warning: linking module
 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of
 different target triples: 'drivers/iommu/iommu.o' is
 'aarch64-unknown-linux-gnu' whereas
 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unkno...
Message-ID: <202610110841.120JzAJG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   04931fc5641da29be2c7c71b030762f3e7d50874
commit: af24b312ee7beb03883f0a86f6703873096204d9 [19/30] iommupt/kunit: Use batching iommu operations
config: arm64-randconfig-r2101-20261010 (https://download.01.org/0day-ci/archive/20261011/202610110841.120JzAJG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610110841.120JzAJG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610110841.120JzAJG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'arch/arm64/mm/init.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'drivers/iommu/iommu.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'lib/kunit/try-catch.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o': Linking two modules of different target triples: 'lib/string.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o' is 'x86_64-unknown-linux-gnu'
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
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB22_14
           ^
   error: cannot compile inline asm
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   error: cannot compile inline asm
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB22_20
           ^
   error: cannot compile inline asm
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   error: cannot compile inline asm
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB30_76
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
           b       .LBB31_32
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
           b       .LBB32_7
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
           dmb ish
--
   warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o': Linking two modules of different target triples: 'arch/arm64/mm/init.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o': Linking two modules of different target triples: 'drivers/iommu/iommu.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o': Linking two modules of different target triples: 'lib/kunit/try-catch.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o': Linking two modules of different target triples: 'lib/string.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o': Linking two modules of different target triples: 'mm/vmstat.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o' is 'x86_64-unknown-linux-gnu'
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
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB21_17
           ^
   error: cannot compile inline asm
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   error: cannot compile inline asm
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB21_24
           ^
   error: cannot compile inline asm
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   error: cannot compile inline asm
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
           dmb ish
           ^~~
   <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
           dmb ish
           ^~~
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB29_27
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
           b       .LBB30_5
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
           b       .LBB30_30
--
   warning: overriding the module target triple with x86_64-unknown-linux-gnu [-Woverride-module]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o': Linking two modules of different target triples: 'arch/arm64/mm/init.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
>> warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o': Linking two modules of different target triples: 'drivers/iommu/iommu.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o': Linking two modules of different target triples: 'lib/kunit/test.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o': Linking two modules of different target triples: 'lib/kunit/try-catch.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o': Linking two modules of different target triples: 'lib/maple_tree.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o': Linking two modules of different target triples: 'lib/string.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o' is 'x86_64-unknown-linux-gnu'
    [-Wlinker-warnings]
   warning: linking module 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o': Linking two modules of different target triples: 'mm/vmstat.o' is 'aarch64-unknown-linux-gnu' whereas 'drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o' is 'x86_64-unknown-linux-gnu'
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
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB22_21
           ^
   error: cannot compile inline asm
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   error: cannot compile inline asm
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB22_28
           ^
   error: cannot compile inline asm
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   error: cannot compile inline asm
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   error: Don't know how to handle indirect register inputs yet for constraint 'Q'
   note: expanded from here
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   <inline asm>:3:2: error: invalid instruction mnemonic 'b'
           b       .LBB31_31
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
           b       .LBB32_31
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
           b       .LBB33_8
           ^
   <inline asm>:8:2: error: unknown directive
    .hword (1 << 15) | ($43)
    ^
   <inline asm>:1:2: error: invalid instruction mnemonic 'dmb'
           dmb ish
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
