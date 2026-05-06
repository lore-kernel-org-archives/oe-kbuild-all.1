Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8B73ED118
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082866; cv=none; b=aVDNqv6xDWrBz+2MwTZMX2Vfgoxh5UuNiEJteC6iTq0YVAnr16hfGdj6FHvPNsWgyFWxgsrpo0Kr8qpHr14W2S/bpDOOkpIBA+FEWdT6LE5Aoz4JKtipdyafXlQ0lqgL15bVbNctOfGJNsfXU+i9dg7WJeeG0UJlQYYr6jtM0Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082866; c=relaxed/simple;
	bh=ChjKsXd/hd/U+1SXfC/lRAXl0I0z3EJZK4v2qpTk6bQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PxZ5cZx387aIhZEXClzesFhTgu9qmrXkkPKUiKCtVi+rQmiFNQoN+lVUMTmUNKFgg9HJEMh/itqaz2bXIST/ttFnBmFWiJQ9I+vw5LAmLuP+cgEhi0x1rf+8OESIhXvZ9pU7pFA2JKvdFXM2G+E2PD3Zsn0c4l3GhT5IolbPm1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDBE5fYh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDBE5fYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778082863; x=1809618863;
  h=date:from:to:cc:subject:message-id;
  bh=ChjKsXd/hd/U+1SXfC/lRAXl0I0z3EJZK4v2qpTk6bQ=;
  b=dDBE5fYhVA1RDC/VboDBRWGKlvBh9phu/tcJjDBepNpTWfgcsEN1LhQ0
   JAfmnVwZKKMiHsaqOsR8LooMxcBuAJHDrgDBtz1kQ3nu/VZXIWSOC5jqm
   kZ3+YZV4q2cToElUhunSMXdQsJAmx1TcRzpm2GxHhhcKzB8dNnmApDjsc
   Ve0SOHRGNm7U0mpSfZgWy9DfrWyFwE7H9V2rRGwHdGQHtP8h0rvGt+7LQ
   n3uL4R8uVcU5dAcAC09gH/PKnbwZITChov74KSU7rn7ZiciC/fNAF/z/5
   xN9dGEXXNpvzWDR0ilRDzOJwiGcZcmE8VdGb35fRzmGg/4n6Bshz9eC8S
   g==;
X-CSE-ConnectionGUID: yXgfhwp6T8GCVA5OJgx40g==
X-CSE-MsgGUID: canUS/qEQny7sij9RO2fOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78168289"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78168289"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 08:54:21 -0700
X-CSE-ConnectionGUID: vI+aohJlSDeOth1BVd8Mjg==
X-CSE-MsgGUID: TAteGqEJSeyL7v6Pp9HFVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259881011"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 06 May 2026 08:54:19 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKeZl-000000006Zx-206o;
	Wed, 06 May 2026 15:54:17 +0000
Date: Wed, 06 May 2026 17:53:26 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 36/43] Diff in
 drivers/gpu/nova-core/mm/pramin.rs:248:
Message-ID: <202605061726.qwyyqg2S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   94c1c9a3687ff84f37d3d11f833f48d695c88ee9
commit: b0d28aad025ee75fe018ea16091aa877c0b8bb76 [36/43] fixup! gpu: nova-core: mm: Add support to use PRAMIN windows to write to VRAM
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260506/202605061726.qwyyqg2S-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061726.qwyyqg2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061726.qwyyqg2S-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/mm/pramin.rs:248:
        /// Returns (`bar_offset`, `new_base`) where:
        /// - `bar_offset`: The BAR0 offset to use for the access.
        /// - `new_base`: `Some(base)` if window needs repositioning, `None` otherwise.
   -    fn compute_window(
   -        &self,
   -        vram_offset: u64,
   -        access_size: usize,
   -    ) -> Result<(usize, Option<u64>)> {
   +    fn compute_window(&self, vram_offset: u64, access_size: usize) -> Result<(usize, Option<u64>)> {
            // Validate VRAM offset is within the valid VRAM region.
            let end_addr = vram_offset.checked_add(access_size as u64).ok_or(EINVAL)?;
            if vram_offset < self.vram_region.start || end_addr > self.vram_region.end {
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
   Diff in drivers/gpu/nova-core/mm/pagetable/map.rs:340:
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
    
   Diff in drivers/gpu/nova-core/mm/pagetable/map.rs:340:
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
    
   Diff in drivers/gpu/nova-core/regs.rs:587:
    
    /// Write a new BAR0 PRAMIN window base address.
    pub(crate) fn pramin_window_write_base(arch: Architecture, bar: &Bar0, base: u64) -> Result {
   -    // Reject VRAM addresses that do not fit the 40-bit hardware range. 
   +    // Reject VRAM addresses that do not fit the 40-bit hardware range.
        let window_base = u32::try_from(base >> 16).map_err(|_| EINVAL)?;
        match arch {
            Architecture::Turing | Architecture::Ampere | Architecture::Ada => bar.write_reg(
   Diff in drivers/gpu/nova-core/mm/pagetable/map.rs:340:
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
    
>> Diff in drivers/gpu/nova-core/mm/pramin.rs:248:
        /// Returns (`bar_offset`, `new_base`) where:
        /// - `bar_offset`: The BAR0 offset to use for the access.
        /// - `new_base`: `Some(base)` if window needs repositioning, `None` otherwise.
   -    fn compute_window(
   -        &self,
   -        vram_offset: u64,
   -        access_size: usize,
   -    ) -> Result<(usize, Option<u64>)> {
   +    fn compute_window(&self, vram_offset: u64, access_size: usize) -> Result<(usize, Option<u64>)> {
            // Validate VRAM offset is within the valid VRAM region.
            let end_addr = vram_offset.checked_add(access_size as u64).ok_or(EINVAL)?;
            if vram_offset < self.vram_region.start || end_addr > self.vram_region.end {
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
   Diff in drivers/gpu/nova-core/regs.rs:587:
    
    /// Write a new BAR0 PRAMIN window base address.
    pub(crate) fn pramin_window_write_base(arch: Architecture, bar: &Bar0, base: u64) -> Result {
   -    // Reject VRAM addresses that do not fit the 40-bit hardware range. 
   +    // Reject VRAM addresses that do not fit the 40-bit hardware range.
        let window_base = u32::try_from(base >> 16).map_err(|_| EINVAL)?;
        match arch {
            Architecture::Turing | Architecture::Ampere | Architecture::Ada => bar.write_reg(
   Diff in drivers/gpu/nova-core/mm/pagetable/map.rs:340:
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
    
>> Diff in drivers/gpu/nova-core/mm/pramin.rs:248:
        /// Returns (`bar_offset`, `new_base`) where:
        /// - `bar_offset`: The BAR0 offset to use for the access.
        /// - `new_base`: `Some(base)` if window needs repositioning, `None` otherwise.
   -    fn compute_window(
   -        &self,
   -        vram_offset: u64,
   -        access_size: usize,
   -    ) -> Result<(usize, Option<u64>)> {
   +    fn compute_window(&self, vram_offset: u64, access_size: usize) -> Result<(usize, Option<u64>)> {
            // Validate VRAM offset is within the valid VRAM region.
            let end_addr = vram_offset.checked_add(access_size as u64).ok_or(EINVAL)?;
            if vram_offset < self.vram_region.start || end_addr > self.vram_region.end {
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
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
