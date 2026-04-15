Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448AC33B6DA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 23:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295410; cv=none; b=fivrl7MsGJXFWqL6Qke/WXaZxo8v8sp075xnPvQUrDtGV7WIe590BOoP0mP68cFSTXVhjMs+UILHw120d66qdI/l2LyCL42AqPKJFU/OUOwLrfgih0EqmttYn6tRxI0B6rSXWnfsxSiSr/pL1wK6BMTMySyqdxTKOzwBQ8o0Sbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295410; c=relaxed/simple;
	bh=T1afQ0UjZeWjoZBVy8nuN2TM33t+ngFnu1Y91xjbYl4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lSQmGYt+aBA53QYzqj2as1gn7lAMhaeltqdqXUpnoVZNLAJ8Ibvijo+mwnkkVMYUXltlTEHD183xwgA0PW0FAEXeE3MJY4ofCFQZ1uYTbvJrWQyikwcUkULeffPmlW8UHYSOgY5XmvQTrRqsAQf903AyRdMYtsY5xc9ZitQ23zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBInOGmP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBInOGmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776295406; x=1807831406;
  h=date:from:to:cc:subject:message-id;
  bh=T1afQ0UjZeWjoZBVy8nuN2TM33t+ngFnu1Y91xjbYl4=;
  b=OBInOGmPJpCq90qJUtiK7oaFiI1mzNLz9eXFA8vUmy6N86HDxMHNVilI
   /sKRKbFN/V61SLUeRwqyf478MCrlpmsh636DW7PMB+6Qp5+BQe2Qckiv/
   R31Yqu2yM6HoMWW4Xu4jNNaiZ/mXht9SAR+/u2FO8K97I1zIOrLd/TynH
   o2CZqtQ9ovYaTnShX5yFz0bHNHJIAG+jgt1aGQ6j88VeW5if/0xJBiboL
   ID8NwDa0yM+gyEi8jMtMSaVViCNNNd8CuFoXCz1V640f7/meZRCoz7ssW
   yO+goci1pZa0wadEOWIz+4tHqcoAwG26ySojFPfC3QZll06TjdhY0y7sg
   Q==;
X-CSE-ConnectionGUID: /Dzz35VaQi+EGT5yieL4bQ==
X-CSE-MsgGUID: H1FrCdwqQLqI91jROBNHaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77402371"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77402371"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 16:23:25 -0700
X-CSE-ConnectionGUID: PtkHnc19QiykOvzvfrOdBQ==
X-CSE-MsgGUID: NKRxmzdWQZ+9Jy5bBPC1uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="225856767"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Apr 2026 16:23:24 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD9Zq-000000000px-1sVU;
	Wed, 15 Apr 2026 23:23:22 +0000
Date: Thu, 16 Apr 2026 01:22:53 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 13/27] Diff in
 drivers/gpu/nova-core/mm/pagetable/ver2.rs:231:
Message-ID: <202604160104.fMiCtL1x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   8b41971bcf8f60f608baf4ff9f70bd04a6bc17a0
commit: e616961ecf55fe7647b6be398196c6148d1697cd [13/27] gpu: nova-core: mm: Add MMU v2 page table types
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260416/202604160104.fMiCtL1x-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160104.fMiCtL1x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160104.fMiCtL1x-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:231:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Create a dual `PDE` from raw 128-bit value (two `u64`s).
        pub(super) fn new(big: u64, small: u64) -> Self {
>> Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:231:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Create a dual `PDE` from raw 128-bit value (two `u64`s).
        pub(super) fn new(big: u64, small: u64) -> Self {
>> Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:231:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Create a dual `PDE` from raw 128-bit value (two `u64`s).
        pub(super) fn new(big: u64, small: u64) -> Self {
>> Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:231:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Create a dual `PDE` from raw 128-bit value (two `u64`s).
        pub(super) fn new(big: u64, small: u64) -> Self {
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: *** [Makefile:1916: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
