Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA761DBB3A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 19:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776366464; cv=none; b=kWG33uDpr1IsEjwL2Oot1EqdnEL7WoIasv1HwLcrVrnDt/OTMpDZ08Jzg4aGJJJMEFyIrjyX/E6FX1Ofy6dPSn3gCSSWBkV4/BydgvENs6qOxw0GVdKP15GxeGHrbeqIis+dSqW8d1dEGbbnnTKOZnGEFvNxUqrJx7duCTC2Gig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776366464; c=relaxed/simple;
	bh=IXgTsC4a121JP1Owbf6qvwL65FZXMmaGtEAh1+3EqC0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AXrVF73fqWPeY+n/5piiv5Ras4Y9X3GgSh/ehRQzn82b41vH/BKeB/80LKOx20K9oQt7SE16Mt5kCDvZfXWAP0L0buJCFSK9iO0nOIBX9ts1q0YOvkP/9MR30e8i1hIXDHJlMTNlwZS2kLlxNtJImIzNyF/ZpvyXEfRqhLh4egk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsTMDWah; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsTMDWah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776366462; x=1807902462;
  h=date:from:to:cc:subject:message-id;
  bh=IXgTsC4a121JP1Owbf6qvwL65FZXMmaGtEAh1+3EqC0=;
  b=jsTMDWahw6hA4SduoJJKoJTNw5EI6QoLQH45wwEV2rCqW8VRfBQnZuco
   0KP1I67Nl+ljM9i9hYnJP73KIRqOqyyTYWVXkpkmJ1uWK36YI0NJTG3ll
   MgLS/DZ2EdIcl76zQZIqU24/5QG4teKZ7o7q3K71ZtTFML9rGw+xI2ZL1
   E7fxPo0u10aAnoodcGSlNIWZQ3lNMSqZVY7evJHEdCQyxt/qAcNLkvIJW
   D9XvvQw5UPQOtYsFis+lmsRrC9g0uicfzw7JlEWtiP1LTK5G/N/bobQ6l
   3MIFHsjHBQDE59WoQBKalr5Z/oFvg7Ft+do9mb0mUsl+k/QHqTb6oPD9Y
   A==;
X-CSE-ConnectionGUID: 6Ei6d+XISYaiCD/yByd7Zw==
X-CSE-MsgGUID: XMzJh5OcQcqBYuGnMMLnLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88762910"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="88762910"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 12:07:41 -0700
X-CSE-ConnectionGUID: IykdzIQiQjqVtjU4f6DjxA==
X-CSE-MsgGUID: /N/W7eiSRiKXBMltFZOV5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="227677004"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 16 Apr 2026 12:07:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDS3u-00000000153-0zLI;
	Thu, 16 Apr 2026 19:07:38 +0000
Date: Thu, 16 Apr 2026 21:07:11 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 28/28] Diff in
 drivers/gpu/nova-core/mm/vmm.rs:138:
Message-ID: <202604162038.OXb6IFqC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   4bed490f13a32c5794ec870aab7e701fbae65220
commit: 4bed490f13a32c5794ec870aab7e701fbae65220 [28/28] fixup! gpu: nova-core: mm: Add virtual address range tracking to VMM
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260416/202604162038.OXb6IFqC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604162038.OXb6IFqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604162038.OXb6IFqC-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:261:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Check if the big page table pointer is valid.
        fn has_big(&self) -> bool {
   Diff in drivers/gpu/nova-core/mm/pagetable.rs:385:
    
    /// Check if the PDB has valid, VRAM-backed page tables.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn check_pdb_inner<M: MmuConfig>(
   -    pramin: &pramin::Pramin,
   -    pdb_addr: VramAddress,
   -) -> Result {
   +fn check_pdb_inner<M: MmuConfig>(pramin: &pramin::Pramin, pdb_addr: VramAddress) -> Result {
        let mut window = pramin.get_window()?;
        let raw = window.try_read64(pdb_addr.raw())?;
    
>> Diff in drivers/gpu/nova-core/mm/vmm.rs:138:
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
   Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:261:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Check if the big page table pointer is valid.
        fn has_big(&self) -> bool {
   Diff in drivers/gpu/nova-core/mm/pagetable.rs:385:
    
    /// Check if the PDB has valid, VRAM-backed page tables.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn check_pdb_inner<M: MmuConfig>(
   -    pramin: &pramin::Pramin,
   -    pdb_addr: VramAddress,
   -) -> Result {
   +fn check_pdb_inner<M: MmuConfig>(pramin: &pramin::Pramin, pdb_addr: VramAddress) -> Result {
        let mut window = pramin.get_window()?;
        let raw = window.try_read64(pdb_addr.raw())?;
    
>> Diff in drivers/gpu/nova-core/mm/vmm.rs:138:
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
   Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:261:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Check if the big page table pointer is valid.
        fn has_big(&self) -> bool {
   Diff in drivers/gpu/nova-core/mm/pagetable.rs:385:
    
    /// Check if the PDB has valid, VRAM-backed page tables.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn check_pdb_inner<M: MmuConfig>(
   -    pramin: &pramin::Pramin,
   -    pdb_addr: VramAddress,
   -) -> Result {
   +fn check_pdb_inner<M: MmuConfig>(pramin: &pramin::Pramin, pdb_addr: VramAddress) -> Result {
        let mut window = pramin.get_window()?;
        let raw = window.try_read64(pdb_addr.raw())?;
    
   Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:261:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Check if the big page table pointer is valid.
        fn has_big(&self) -> bool {
>> Diff in drivers/gpu/nova-core/mm/vmm.rs:138:
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
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
