Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE00331A44
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 04:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772769657; cv=none; b=mpNHYsMIXWKh65H7sD/917wQ3zHaZGdQk/xQv94Ju3y3bVso8imz5tMYaHjVbaGie8d11Y3iiPvMPIDpNVwyHHu5otpHYtF6HBS5UJaTUShxKW9TxeUC2399cnL/l1ECsbf2Z118wl5Hc7uD+cWxr1JB1YfnyTmzOliQcbSpq3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772769657; c=relaxed/simple;
	bh=w8elW/R9ORgB9M1b0Sk5JOqdS0a+JArFwzMzl2VKdXY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ccJ8f1kFlxGuNYO1iOSeHjLdFufmVDKO8T/UBS37tunKqt2OazqUDOfgnzU+8Rmy6qw1Kra/ecFUGUYlVTRIpoIkXc2i7kkgNrrVIc7TAhcdVSw6XYVGvtJUmnjlte5u7SvSbvXhQB7YMrx/3+gmM4VyO8BJrL8wuy6tdf/B7eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xk1LtrXE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xk1LtrXE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772769655; x=1804305655;
  h=date:from:to:cc:subject:message-id;
  bh=w8elW/R9ORgB9M1b0Sk5JOqdS0a+JArFwzMzl2VKdXY=;
  b=Xk1LtrXE+GyZSOLgYdLkirwJiHHjecbAuZWhH0snJQwb8z7Y3Re8I6CB
   IEoSEceUUkOTeiqsNqw+JZlGMk80aBDJljjiThtlzsObeww4x4k8qAxnm
   wtuWR4v4ctGkbL+MKOslO3kplRbmc95JFsbEbhC5sNBWudtdvOhgr28es
   pKd/Ggyp3eYnGInTy4BZkGeMhD/HM73pR8c5jFJWKb1UnlhrMGk2Vp3mm
   dCEpMVo2l20Mq8WYar5QhY21SwE8wnzL5xxt+MZIzI6GdNlOakb0pWG8k
   pG8wQFnrVOxHetRSxhNDv8PNdVr0ubHeziFxNFg/j7zl1PSzxB7msPqGB
   w==;
X-CSE-ConnectionGUID: FedIF10cS1KS3HnFiFiwlg==
X-CSE-MsgGUID: WvIwTNI5R6Cfrl0w6sGQyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73748280"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73748280"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 20:00:55 -0800
X-CSE-ConnectionGUID: pMTXQkVtT82NAruHC1DmKQ==
X-CSE-MsgGUID: Hre6vIryTFOTr06ot8wKdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218888638"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2026 20:00:53 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyMMs-000000002BZ-2tu5;
	Fri, 06 Mar 2026 04:00:50 +0000
Date: Fri, 06 Mar 2026 05:00:43 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 25/29] Diff in
 drivers/gpu/nova-core/mm/pagetable.rs:132:
Message-ID: <202603060452.CHNvqmdA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   c51ee29fc563974ca03eab72d33819b471f8cfc3
commit: 1ec60f03d1438ec703095960c35cd2a5631dba7c [25/29] gpu: nova-core: mm: Fix MMU v2 VirtualAddress bitfield and entries_per_page
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260306/202603060452.CHNvqmdA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060452.CHNvqmdA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060452.CHNvqmdA-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/regs.rs:14:
    
    use crate::{
        driver::Bar0,
   -    mm::pramin::Bar0WindowTarget,
        falcon::{
            DmaTrfCmdSize,
            FalconCoreRev,
   Diff in drivers/gpu/nova-core/regs.rs:33:
            Architecture,
            Chipset, //
        },
   +    mm::pramin::Bar0WindowTarget,
        num::FromSafeCast,
    };
    
   Diff in drivers/gpu/nova-core/gpu.rs:369:
            // PRAMIN aperture self-tests.
            let buddy = self.mm.buddy();
            let vram_region = buddy.base_offset()..buddy.base_offset() + buddy.size();
   -        crate::mm::pramin::run_self_test(pdev.as_ref(), self.bar.clone(), vram_region, mmu_version)?;
   +        crate::mm::pramin::run_self_test(
   +            pdev.as_ref(),
   +            self.bar.clone(),
   +            vram_region,
   +            mmu_version,
   +        )?;
    
            // BAR1 self-tests.
            let bar1 = Arc::pin_init(
>> Diff in drivers/gpu/nova-core/mm/pagetable.rs:132:
        pub(crate) fn entries_per_page(&self, level: PageTableLevel) -> usize {
            match self {
                Self::V2 => match level {
   -                PageTableLevel::Pdb => 4,   // PD3 root: bits [48:47] = 2 bits
   -                PageTableLevel::L3 => 256,  // PD0 dual: bits [28:21] = 8 bits
   -                _ => 512,                   // PD2, PD1, PT: 9 bits each
   +                PageTableLevel::Pdb => 4,  // PD3 root: bits [48:47] = 2 bits
   +                PageTableLevel::L3 => 256, // PD0 dual: bits [28:21] = 8 bits
   +                _ => 512,                  // PD2, PD1, PT: 9 bits each
                },
                Self::V3 => PAGE_SIZE / self.entry_size(level),
            }
   Diff in drivers/gpu/nova-core/mm/pramin.rs:75:
    use kernel::devres::Devres;
    use kernel::io::Io;
    use kernel::new_mutex;
   -use kernel::revocable::RevocableGuard;
    use kernel::prelude::*;
   +use kernel::revocable::RevocableGuard;
    use kernel::sizes::{
        SZ_1M,
        SZ_64K, //
   Diff in drivers/gpu/nova-core/mm/pramin.rs:179:
        /// Create a pin-initializer for PRAMIN.
        ///
        /// `vram_region` specifies the valid VRAM address range.
   -    pub(crate) fn new(bar: Arc<Devres<Bar0>>, vram_region: Range<u64>) -> Result<impl PinInit<Self>> {
   +    pub(crate) fn new(
   +        bar: Arc<Devres<Bar0>>,
   +        vram_region: Range<u64>,
   +    ) -> Result<impl PinInit<Self>> {
            let bar_access = bar.try_access().ok_or(ENODEV)?;
            let current_base = Self::read_window_base(&bar_access);
    
   Diff in drivers/gpu/nova-core/mm/pramin.rs:293:
    
    /// Test read/write at byte-aligned locations.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn test_byte_readwrite(dev: &kernel::device::Device, win: &mut PraminWindow<'_>, base: usize) -> Result {
   +fn test_byte_readwrite(
   +    dev: &kernel::device::Device,
   +    win: &mut PraminWindow<'_>,
   +    base: usize,
   +) -> Result {
        for i in 0u8..4 {
            let offset = base + 1 + usize::from(i);
            let val = 0xA0 + i;
   Diff in drivers/gpu/nova-core/mm/pramin.rs:315:
    
    /// Test writing a `u32` and reading back as individual `u8`s.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn test_u32_as_bytes(dev: &kernel::device::Device, win: &mut PraminWindow<'_>, base: usize) -> Result {
   +fn test_u32_as_bytes(
   +    dev: &kernel::device::Device,
   +    win: &mut PraminWindow<'_>,
   +    base: usize,
   +) -> Result {
        let offset = base + 0x10;
        let val: u32 = 0xDEADBEEF;
        win.try_write32(offset, val)?;
   Diff in drivers/gpu/nova-core/mm/pramin.rs:340:
    
    /// Test window repositioning across 1MB boundaries.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn test_window_reposition(dev: &kernel::device::Device, win: &mut PraminWindow<'_>, base: usize) -> Result {
   +fn test_window_reposition(
   +    dev: &kernel::device::Device,
   +    win: &mut PraminWindow<'_>,
   +    base: usize,
   +) -> Result {
        let offset_a: usize = base;
        let offset_b: usize = base + 0x200000; // base + 2MB (different 1MB region).
        let val_a: u32 = 0x11111111;
   Diff in drivers/gpu/nova-core/mm/pramin.rs:397:
    
    /// Test that misaligned multi-byte accesses are rejected.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn test_misaligned_access(dev: &kernel::device::Device, win: &mut PraminWindow<'_>, base: usize) -> Result {
   +fn test_misaligned_access(
   +    dev: &kernel::device::Device,
   +    win: &mut PraminWindow<'_>,
   +    base: usize,
   +) -> Result {
        // `u16` at odd offset (not 2-byte aligned).
        let offset_u16 = base + 0x21;
        if win.try_write16(offset_u16, 0xABCD).is_ok() {
   Diff in drivers/gpu/nova-core/gsp/commands.rs:207:
            msg: &Self::Message,
            _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
        ) -> Result<Self, Self::InitError> {
   -        let (base, size) = msg
   -            .first_usable_fb_region()
   -            .ok_or(ENODEV)?;
   +        let (base, size) = msg.first_usable_fb_region().ok_or(ENODEV)?;
    
            let total_fb_end = msg.total_fb_end().ok_or(ENODEV)?;
    
   Diff in drivers/gpu/nova-core/gsp/commands.rs:244:
                .to_str()
                .map_err(GpuNameError::InvalidUtf8)
        }
   -
    }
    
    /// Send the [`GetGspInfo`] command and awaits for its reply.
   Diff in drivers/gpu/nova-core/gsp/commands.rs:207:
            msg: &Self::Message,
            _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
        ) -> Result<Self, Self::InitError> {
   -        let (base, size) = msg
   -            .first_usable_fb_region()
   -            .ok_or(ENODEV)?;
   +        let (base, size) = msg.first_usable_fb_region().ok_or(ENODEV)?;
    
            let total_fb_end = msg.total_fb_end().ok_or(ENODEV)?;
    
   Diff in drivers/gpu/nova-core/gsp/commands.rs:244:
                .to_str()
                .map_err(GpuNameError::InvalidUtf8)
        }
   -
    }
    
    /// Send the [`GetGspInfo`] command and awaits for its reply.
>> Diff in drivers/gpu/nova-core/mm/pagetable.rs:132:
        pub(crate) fn entries_per_page(&self, level: PageTableLevel) -> usize {
            match self {
                Self::V2 => match level {
   -                PageTableLevel::Pdb => 4,   // PD3 root: bits [48:47] = 2 bits
   -                PageTableLevel::L3 => 256,  // PD0 dual: bits [28:21] = 8 bits
   -                _ => 512,                   // PD2, PD1, PT: 9 bits each
   +                PageTableLevel::Pdb => 4,  // PD3 root: bits [48:47] = 2 bits
   +                PageTableLevel::L3 => 256, // PD0 dual: bits [28:21] = 8 bits
   +                _ => 512,                  // PD2, PD1, PT: 9 bits each
                },
                Self::V3 => PAGE_SIZE / self.entry_size(level),
            }
   Diff in drivers/gpu/nova-core/mm/pramin.rs:75:
    use kernel::devres::Devres;
    use kernel::io::Io;
    use kernel::new_mutex;
   -use kernel::revocable::RevocableGuard;
    use kernel::prelude::*;
   +use kernel::revocable::RevocableGuard;
    use kernel::sizes::{
        SZ_1M,
        SZ_64K, //
   Diff in drivers/gpu/nova-core/mm/pramin.rs:179:
        /// Create a pin-initializer for PRAMIN.
        ///
        /// `vram_region` specifies the valid VRAM address range.
   -    pub(crate) fn new(bar: Arc<Devres<Bar0>>, vram_region: Range<u64>) -> Result<impl PinInit<Self>> {
   +    pub(crate) fn new(
   +        bar: Arc<Devres<Bar0>>,
   +        vram_region: Range<u64>,
   +    ) -> Result<impl PinInit<Self>> {
            let bar_access = bar.try_access().ok_or(ENODEV)?;
            let current_base = Self::read_window_base(&bar_access);
    
   Diff in drivers/gpu/nova-core/mm/pramin.rs:293:
    
    /// Test read/write at byte-aligned locations.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn test_byte_readwrite(dev: &kernel::device::Device, win: &mut PraminWindow<'_>, base: usize) -> Result {
   +fn test_byte_readwrite(
   +    dev: &kernel::device::Device,
   +    win: &mut PraminWindow<'_>,
   +    base: usize,
   +) -> Result {
        for i in 0u8..4 {
            let offset = base + 1 + usize::from(i);
            let val = 0xA0 + i;
   Diff in drivers/gpu/nova-core/mm/pramin.rs:315:
    
    /// Test writing a `u32` and reading back as individual `u8`s.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn test_u32_as_bytes(dev: &kernel::device::Device, win: &mut PraminWindow<'_>, base: usize) -> Result {
   +fn test_u32_as_bytes(
   +    dev: &kernel::device::Device,
   +    win: &mut PraminWindow<'_>,
   +    base: usize,
   +) -> Result {
        let offset = base + 0x10;
        let val: u32 = 0xDEADBEEF;
        win.try_write32(offset, val)?;
   Diff in drivers/gpu/nova-core/mm/pramin.rs:340:
    
    /// Test window repositioning across 1MB boundaries.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn test_window_reposition(dev: &kernel::device::Device, win: &mut PraminWindow<'_>, base: usize) -> Result {
   +fn test_window_reposition(
   +    dev: &kernel::device::Device,
   +    win: &mut PraminWindow<'_>,
   +    base: usize,
   +) -> Result {
        let offset_a: usize = base;
        let offset_b: usize = base + 0x200000; // base + 2MB (different 1MB region).
        let val_a: u32 = 0x11111111;
   Diff in drivers/gpu/nova-core/mm/pramin.rs:397:
    
    /// Test that misaligned multi-byte accesses are rejected.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn test_misaligned_access(dev: &kernel::device::Device, win: &mut PraminWindow<'_>, base: usize) -> Result {
   +fn test_misaligned_access(
   +    dev: &kernel::device::Device,
   +    win: &mut PraminWindow<'_>,
   +    base: usize,
   +) -> Result {
        // `u16` at odd offset (not 2-byte aligned).
        let offset_u16 = base + 0x21;
        if win.try_write16(offset_u16, 0xABCD).is_ok() {
   Diff in drivers/gpu/nova-core/gpu.rs:369:
            // PRAMIN aperture self-tests.
            let buddy = self.mm.buddy();
            let vram_region = buddy.base_offset()..buddy.base_offset() + buddy.size();
   -        crate::mm::pramin::run_self_test(pdev.as_ref(), self.bar.clone(), vram_region, mmu_version)?;
   +        crate::mm::pramin::run_self_test(
   +            pdev.as_ref(),
   +            self.bar.clone(),
   +            vram_region,
   +            mmu_version,
   +        )?;
    
            // BAR1 self-tests.
            let bar1 = Arc::pin_init(
   Diff in drivers/gpu/nova-core/gsp/commands.rs:207:
            msg: &Self::Message,
            _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
        ) -> Result<Self, Self::InitError> {
   -        let (base, size) = msg
   -            .first_usable_fb_region()
   -            .ok_or(ENODEV)?;
   +        let (base, size) = msg.first_usable_fb_region().ok_or(ENODEV)?;
    
            let total_fb_end = msg.total_fb_end().ok_or(ENODEV)?;
    
   Diff in drivers/gpu/nova-core/gsp/commands.rs:244:
                .to_str()
                .map_err(GpuNameError::InvalidUtf8)
        }
   -
    }
    
    /// Send the [`GetGspInfo`] command and awaits for its reply.
>> Diff in drivers/gpu/nova-core/mm/pagetable.rs:132:
        pub(crate) fn entries_per_page(&self, level: PageTableLevel) -> usize {
            match self {
                Self::V2 => match level {
   -                PageTableLevel::Pdb => 4,   // PD3 root: bits [48:47] = 2 bits
   -                PageTableLevel::L3 => 256,  // PD0 dual: bits [28:21] = 8 bits
   -                _ => 512,                   // PD2, PD1, PT: 9 bits each
   +                PageTableLevel::Pdb => 4,  // PD3 root: bits [48:47] = 2 bits
   +                PageTableLevel::L3 => 256, // PD0 dual: bits [28:21] = 8 bits
   +                _ => 512,                  // PD2, PD1, PT: 9 bits each
                },
                Self::V3 => PAGE_SIZE / self.entry_size(level),
            }
   Diff in drivers/gpu/nova-core/mm/pramin.rs:75:
    use kernel::devres::Devres;
    use kernel::io::Io;
    use kernel::new_mutex;
   -use kernel::revocable::RevocableGuard;
    use kernel::prelude::*;
   +use kernel::revocable::RevocableGuard;
    use kernel::sizes::{
        SZ_1M,
        SZ_64K, //
   Diff in drivers/gpu/nova-core/mm/pramin.rs:179:
        /// Create a pin-initializer for PRAMIN.
        ///
        /// `vram_region` specifies the valid VRAM address range.
   -    pub(crate) fn new(bar: Arc<Devres<Bar0>>, vram_region: Range<u64>) -> Result<impl PinInit<Self>> {
   +    pub(crate) fn new(
   +        bar: Arc<Devres<Bar0>>,
   +        vram_region: Range<u64>,
   +    ) -> Result<impl PinInit<Self>> {
            let bar_access = bar.try_access().ok_or(ENODEV)?;
            let current_base = Self::read_window_base(&bar_access);
    
   Diff in drivers/gpu/nova-core/mm/pramin.rs:293:
    
    /// Test read/write at byte-aligned locations.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn test_byte_readwrite(dev: &kernel::device::Device, win: &mut PraminWindow<'_>, base: usize) -> Result {
   +fn test_byte_readwrite(
   +    dev: &kernel::device::Device,
   +    win: &mut PraminWindow<'_>,
   +    base: usize,
   +) -> Result {
        for i in 0u8..4 {
            let offset = base + 1 + usize::from(i);
            let val = 0xA0 + i;
   Diff in drivers/gpu/nova-core/mm/pramin.rs:315:
    
    /// Test writing a `u32` and reading back as individual `u8`s.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn test_u32_as_bytes(dev: &kernel::device::Device, win: &mut PraminWindow<'_>, base: usize) -> Result {
   +fn test_u32_as_bytes(
   +    dev: &kernel::device::Device,
   +    win: &mut PraminWindow<'_>,
   +    base: usize,
   +) -> Result {
        let offset = base + 0x10;
        let val: u32 = 0xDEADBEEF;
        win.try_write32(offset, val)?;
   Diff in drivers/gpu/nova-core/mm/pramin.rs:340:
    
    /// Test window repositioning across 1MB boundaries.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn test_window_reposition(dev: &kernel::device::Device, win: &mut PraminWindow<'_>, base: usize) -> Result {
   +fn test_window_reposition(
   +    dev: &kernel::device::Device,
   +    win: &mut PraminWindow<'_>,
   +    base: usize,
   +) -> Result {
        let offset_a: usize = base;
        let offset_b: usize = base + 0x200000; // base + 2MB (different 1MB region).
        let val_a: u32 = 0x11111111;
   Diff in drivers/gpu/nova-core/mm/pramin.rs:397:
    
    /// Test that misaligned multi-byte accesses are rejected.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn test_misaligned_access(dev: &kernel::device::Device, win: &mut PraminWindow<'_>, base: usize) -> Result {
   +fn test_misaligned_access(
   +    dev: &kernel::device::Device,
   +    win: &mut PraminWindow<'_>,
   +    base: usize,
   +) -> Result {
        // `u16` at odd offset (not 2-byte aligned).
        let offset_u16 = base + 0x21;
        if win.try_write16(offset_u16, 0xABCD).is_ok() {
   Diff in drivers/gpu/nova-core/regs.rs:14:
    
    use crate::{
        driver::Bar0,
   -    mm::pramin::Bar0WindowTarget,
        falcon::{
            DmaTrfCmdSize,
            FalconCoreRev,
   Diff in drivers/gpu/nova-core/regs.rs:33:
            Architecture,
            Chipset, //
        },
   +    mm::pramin::Bar0WindowTarget,
        num::FromSafeCast,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
