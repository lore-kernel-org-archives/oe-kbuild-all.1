Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B94A3EBF13
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 02:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771382177; cv=none; b=H5rDUMY8PtTnS0SZubSx1WKrCEzy2Swc6KIoWYwVXvTBDar4tan/IAGqPbwtWfeXb+VhIinoh5kx/GrJbxIsJtP3NwnRA4Ck5MZErSXS5EEYGckD/I6jsF4779j2T3GyQV2V7ZwyZ1c9eYBKcwlw/9tj3ZZQE/ponHD7LeoZAUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771382177; c=relaxed/simple;
	bh=F7QmxLEcFbzzsXQp14JfA/PknPm03H54WVV+lcDkUME=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y4VHcBz/QHKnd2cE1WZVHT6a1JeCD2whR85F/DyAMDTh57RbhKHChaOfq2vq2qAq1OaY5Qtr6jOyQY9cGWhwKQBQZJT5EmrtUgOnFzTxnTzH1E54pg0AffGYvPSrsyATgCwvIsXWpbkNMldTD5mQv6wUgFTbaTjzKafWFZACius=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EU4r9zcW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EU4r9zcW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771382175; x=1802918175;
  h=date:from:to:cc:subject:message-id;
  bh=F7QmxLEcFbzzsXQp14JfA/PknPm03H54WVV+lcDkUME=;
  b=EU4r9zcWder1tsRuZToNvbu9NwDoR2hDU2/odyJ5UkD7D0IcxXj7N1Vj
   9fe0VYD9FVF55+PfLQc/vTb96sAMRjJ69qNwAClJ7nqpoqSjOm2zE+/Td
   B7E4rYTMMOZ4UD/odkERCUWG7BQBltlyRnyPKxxMu7vk6UvWk8z5aVpNt
   gJ1cOm4yqIXo4zFryjCFknJhJEkOMxR5JUM8QH4N0tJ8xT6VQs3HjdVUV
   N4puIZS6EPo11NFSfW08tJRB+v+J7w4ZvW6pCXzCSv0G/DO82MgnO/b46
   f7rOJW6q0WjcyrqmqHuIAwY5OHrBhtrxbVP+fbfPHUI20rmQowI1gRTWG
   w==;
X-CSE-ConnectionGUID: yBW4o1nqQmWXs+S9bvdqlw==
X-CSE-MsgGUID: cYSa9ZD3SVeHSZWQIIeHOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83083798"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="83083798"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 18:36:14 -0800
X-CSE-ConnectionGUID: IZPpdP1aSpGPeDO1ubX2ng==
X-CSE-MsgGUID: 52u463RQSrO9KDhtsWE2Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="251755338"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2026 18:36:14 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsXQA-000000003RN-3TOO;
	Wed, 18 Feb 2026 02:36:10 +0000
Date: Wed, 18 Feb 2026 03:35:34 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 15/29] Diff in
 drivers/gpu/nova-core/mm/pagetable/mod.rs:298:
Message-ID: <202602180308.XywRaTPu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   37b89e17139395c3a1a0871785230f02e8c65622
commit: 26a67ee3a41fd6a684566ef2b9157c1e48d29dab [15/29] nova-core: mm: Add unified page table entry wrapper enums
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260218/202602180308.XywRaTPu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180308.XywRaTPu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180308.XywRaTPu-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:298:
        }
    
        /// Write this `PTE` to VRAM.
   -    pub(crate) fn write(
   -        &self,
   -        window: &mut pramin::PraminWindow<'_>,
   -        addr: VramAddress,
   -    ) -> Result {
   +    pub(crate) fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
            window.try_write64(addr.raw(), self.raw_u64())
        }
    }
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:382:
        }
    
        /// Write this `PDE` to VRAM.
   -    pub(crate) fn write(
   -        &self,
   -        window: &mut pramin::PraminWindow<'_>,
   -        addr: VramAddress,
   -    ) -> Result {
   +    pub(crate) fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
            window.try_write64(addr.raw(), self.raw_u64())
        }
    }
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:467:
        }
    
        /// Write this dual PDE (128-bit) to VRAM.
   -    pub(crate) fn write(
   -        &self,
   -        window: &mut pramin::PraminWindow<'_>,
   -        addr: VramAddress,
   -    ) -> Result {
   +    pub(crate) fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
            window.try_write64(addr.raw(), self.big_raw_u64())?;
            window.try_write64(addr.raw() + 8, self.small_raw_u64())
        }
>> Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:298:
        }
    
        /// Write this `PTE` to VRAM.
   -    pub(crate) fn write(
   -        &self,
   -        window: &mut pramin::PraminWindow<'_>,
   -        addr: VramAddress,
   -    ) -> Result {
   +    pub(crate) fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
            window.try_write64(addr.raw(), self.raw_u64())
        }
    }
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:382:
        }
    
        /// Write this `PDE` to VRAM.
   -    pub(crate) fn write(
   -        &self,
   -        window: &mut pramin::PraminWindow<'_>,
   -        addr: VramAddress,
   -    ) -> Result {
   +    pub(crate) fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
            window.try_write64(addr.raw(), self.raw_u64())
        }
    }
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:467:
        }
    
        /// Write this dual PDE (128-bit) to VRAM.
   -    pub(crate) fn write(
   -        &self,
   -        window: &mut pramin::PraminWindow<'_>,
   -        addr: VramAddress,
   -    ) -> Result {
   +    pub(crate) fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
            window.try_write64(addr.raw(), self.big_raw_u64())?;
            window.try_write64(addr.raw() + 8, self.small_raw_u64())
        }
>> Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:298:
        }
    
        /// Write this `PTE` to VRAM.
   -    pub(crate) fn write(
   -        &self,
   -        window: &mut pramin::PraminWindow<'_>,
   -        addr: VramAddress,
   -    ) -> Result {
   +    pub(crate) fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
            window.try_write64(addr.raw(), self.raw_u64())
        }
    }
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:382:
        }
    
        /// Write this `PDE` to VRAM.
   -    pub(crate) fn write(
   -        &self,
   -        window: &mut pramin::PraminWindow<'_>,
   -        addr: VramAddress,
   -    ) -> Result {
   +    pub(crate) fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
            window.try_write64(addr.raw(), self.raw_u64())
        }
    }
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:467:
        }
    
        /// Write this dual PDE (128-bit) to VRAM.
   -    pub(crate) fn write(
   -        &self,
   -        window: &mut pramin::PraminWindow<'_>,
   -        addr: VramAddress,
   -    ) -> Result {
   +    pub(crate) fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
            window.try_write64(addr.raw(), self.big_raw_u64())?;
            window.try_write64(addr.raw() + 8, self.small_raw_u64())
        }
   Diff in rust/kernel/ffi/clist.rs:98:
    use pin_init::{
        pin_data,
        pin_init,
   -    PinInit //
   +    PinInit, //
    };
    
    /// FFI wrapper for a C `list_head` object used in intrusive linked lists.
   Diff in rust/kernel/ffi/clist.rs:98:
    use pin_init::{
        pin_data,
        pin_init,
   -    PinInit //
   +    PinInit, //
    };
    
    /// FFI wrapper for a C `list_head` object used in intrusive linked lists.
   Diff in rust/kernel/gpu/buddy.rs:132:
    //! ```
    
    use crate::{
   -    bindings,
   -    clist_create,
   -    ffi::clist::CListHead,
   +    bindings, clist_create,
        error::to_result,
   +    ffi::clist::CListHead,
        new_mutex,
        prelude::*,
        sync::{
   Diff in rust/kernel/gpu/buddy.rs:331:
        /// Creates a buddy allocator that manages a contiguous address space of the given
        /// size, with the specified minimum allocation unit (chunk_size must be at least 4KB).
        pub fn new(params: GpuBuddyParams) -> Result<Self> {
   -        Ok(Self(Arc::pin_init(
   -            GpuBuddyInner::new(params),
   -            GFP_KERNEL,
   -        )?))
   +        Ok(Self(Arc::pin_init(GpuBuddyInner::new(params), GFP_KERNEL)?))
        }
    
        /// Get the base offset for allocations.
   Diff in rust/kernel/gpu/buddy.rs:132:
    //! ```
    
    use crate::{
   -    bindings,
   -    clist_create,
   -    ffi::clist::CListHead,
   +    bindings, clist_create,
        error::to_result,
   +    ffi::clist::CListHead,
        new_mutex,
        prelude::*,
        sync::{
   Diff in rust/kernel/gpu/buddy.rs:331:
        /// Creates a buddy allocator that manages a contiguous address space of the given
        /// size, with the specified minimum allocation unit (chunk_size must be at least 4KB).
        pub fn new(params: GpuBuddyParams) -> Result<Self> {
   -        Ok(Self(Arc::pin_init(
   -            GpuBuddyInner::new(params),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
