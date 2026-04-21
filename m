Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B5536F41C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 20:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776804509; cv=none; b=RfGc+rzzJ+B+d4RVGAGglg8Y8d7BvtG86+zvsAF977Io377hxuuQAeMZql1ciWNnbblSpwdbWA6HM+XGY12znuA2Ym7pMKrr8VPWATpfW2LofHZGeIlVyh7IejhH4K/prJ9olCAbzkmTWu97EK2BF1HtsokUyrAOO/lY6Nhyz1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776804509; c=relaxed/simple;
	bh=ljlMEVgWX34lQzj0A7PTAd1FYMgRPgsY9JCHw65WOIw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZkDnnSqEpdnDhVmj5DlKRM/lIiNXMa10dpp+juGVpsIgnxj8LbbWF8YzR07V3aCUBgC2bbmcH7sR5sv3YL1oNqIGRZbwJd8I5O4taOC+9qw4aTuGATRCPNcrxECRSgX5PDtYNI8hpzCIMIJGMYZCmYvXhMqkEcYVtaxbtGt90is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdPBd2OM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdPBd2OM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776804508; x=1808340508;
  h=date:from:to:cc:subject:message-id;
  bh=ljlMEVgWX34lQzj0A7PTAd1FYMgRPgsY9JCHw65WOIw=;
  b=XdPBd2OMn+/Nt3Q1QnrvBQFsFTtwy39voFDj2RxzsJS8r1v+o/JNWlCv
   FUyXCfOsfOJk6DcG8KyLEDKFpFmkPtb2gjmfJs0uXP/e1AMnFx3J31y1Q
   fuEt83/wjZ4HWuvVkxyUt9fctwfd+LfFFrs/bIOQe4eboOCaMBRPWtLA5
   IOSqkYwIvJBf61kGzTGnlh732bq82mQS0vt60KEraaE7P2dMT0mc3LeMO
   o0BhHrjqlTnKUcjMGiRd+QsfzyFoIzY/UierCh7Ji19mdD1ZXDHm76KCi
   j8+crGGbVbiGlrMsdzbAx+/iHSxZN9JQF1taTMjaXJpDk1P7vhYP3oHy2
   Q==;
X-CSE-ConnectionGUID: J5IHP0EXQqa1thHEDsXrWg==
X-CSE-MsgGUID: oZnSBRfEQam7oOP1oGGTaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77819863"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77819863"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 13:48:27 -0700
X-CSE-ConnectionGUID: NFqicU6MRkaF5oFm7OFl2w==
X-CSE-MsgGUID: cc9oF9JUQpmFHgzelWpOCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="236520160"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 21 Apr 2026 13:48:26 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFI19-000000002e5-2gVy;
	Tue, 21 Apr 2026 20:48:23 +0000
Date: Tue, 21 Apr 2026 22:48:07 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 28/28] Diff in
 drivers/gpu/nova-core/mm/pagetable/map.rs:338:
Message-ID: <202604212255.zysx7hia-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   51a2b484ab4e185e0a8bc0a679f60e93986046ec
commit: 51a2b484ab4e185e0a8bc0a679f60e93986046ec [28/28] delta squash: gpu: nova-core: mm: use Device<Bound>::access() for BAR0 instead of try_access()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260421/202604212255.zysx7hia-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604212255.zysx7hia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604212255.zysx7hia-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/mm/pagetable/map.rs:338:
        ) -> Result {
            pt_map_dispatch!(
                self,
   -            install_mappings(dev, mm, pt_pages, page_table_allocs, vfn_start, pfns, writable)
   +            install_mappings(
   +                dev,
   +                mm,
   +                pt_pages,
   +                page_table_allocs,
   +                vfn_start,
   +                pfns,
   +                writable
   +            )
            )
        }
    
   Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:261:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Check if the big page table pointer is valid.
        fn has_big(&self) -> bool {
   Diff in drivers/gpu/nova-core/mm/vmm.rs:170:
        }
    
        /// Allocate a contiguous virtual frame number range.
   -    fn alloc_vfn_range(
   -        &self,
   -        num_pages: usize,
   -        va_range: Option<Range<u64>>,
   -    ) -> Result<Vfn> {
   +    fn alloc_vfn_range(&self, num_pages: usize, va_range: Option<Range<u64>>) -> Result<Vfn> {
            let page_size: u64 = PAGE_SIZE.into_safe_cast();
    
            let start_vfn = match va_range {
   Diff in drivers/gpu/nova-core/mm/vmm.rs:170:
        }
    
        /// Allocate a contiguous virtual frame number range.
   -    fn alloc_vfn_range(
   -        &self,
   -        num_pages: usize,
   -        va_range: Option<Range<u64>>,
   -    ) -> Result<Vfn> {
   +    fn alloc_vfn_range(&self, num_pages: usize, va_range: Option<Range<u64>>) -> Result<Vfn> {
            let page_size: u64 = PAGE_SIZE.into_safe_cast();
    
            let start_vfn = match va_range {
>> Diff in drivers/gpu/nova-core/mm/pagetable/map.rs:338:
        ) -> Result {
            pt_map_dispatch!(
                self,
   -            install_mappings(dev, mm, pt_pages, page_table_allocs, vfn_start, pfns, writable)
   +            install_mappings(
   +                dev,
   +                mm,
   +                pt_pages,
   +                page_table_allocs,
   +                vfn_start,
   +                pfns,
   +                writable
   +            )
            )
        }
    
   Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:261:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Check if the big page table pointer is valid.
        fn has_big(&self) -> bool {
>> Diff in drivers/gpu/nova-core/mm/pagetable/map.rs:338:
        ) -> Result {
            pt_map_dispatch!(
                self,
   -            install_mappings(dev, mm, pt_pages, page_table_allocs, vfn_start, pfns, writable)
   +            install_mappings(
   +                dev,
   +                mm,
   +                pt_pages,
   +                page_table_allocs,
   +                vfn_start,
   +                pfns,
   +                writable
   +            )
            )
        }
    
   Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:261:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Check if the big page table pointer is valid.
        fn has_big(&self) -> bool {
>> Diff in drivers/gpu/nova-core/mm/pagetable/map.rs:338:
        ) -> Result {
            pt_map_dispatch!(
                self,
   -            install_mappings(dev, mm, pt_pages, page_table_allocs, vfn_start, pfns, writable)
   +            install_mappings(
   +                dev,
   +                mm,
   +                pt_pages,
   +                page_table_allocs,
   +                vfn_start,
   +                pfns,
   +                writable
   +            )
            )
        }
    
   Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:261:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Check if the big page table pointer is valid.
        fn has_big(&self) -> bool {
   Diff in drivers/gpu/nova-core/mm/vmm.rs:170:
        }
    
        /// Allocate a contiguous virtual frame number range.
   -    fn alloc_vfn_range(
   -        &self,
   -        num_pages: usize,
   -        va_range: Option<Range<u64>>,
   -    ) -> Result<Vfn> {
   +    fn alloc_vfn_range(&self, num_pages: usize, va_range: Option<Range<u64>>) -> Result<Vfn> {
            let page_size: u64 = PAGE_SIZE.into_safe_cast();
    
            let start_vfn = match va_range {
   make[2]: *** [Makefile:1916: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
