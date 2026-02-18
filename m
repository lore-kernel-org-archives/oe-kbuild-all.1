Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548B830BBB6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771455572; cv=none; b=oL7EAh/R/ejN23whjbPFOY8oy9yggZUjUTbWJxbJ5aJZ8SlJx1asyQS321KD+jX1ckcfXUSy+KSwO/lRNtewrlSKQrLAm56j+CcOwj5u8qVX690e6AUy5xyJYMx2MyJ4fzAg6hQmDSRePKl/oe+b4JNJUxMmLnU5EpDJaRnohQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771455572; c=relaxed/simple;
	bh=yI5oCk6bT2qKmcbOCdvz8tLALx5JM6uaorNmWrSCLIQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uP41iknPZ57uJedFXdzbGqiAN9K4jv/NnQ0s85Ea0p9ktg2uhpSnNnnXkawsF9mhG8+EK3FgHix7c4uiHuH++EKcJ605RS9DyRs4EGDVrEJNjv7a8dAj7m32nRqMkqLu6gHZVp8xz7uLa6F51OGjbh9NskfK4Jij75zJ8TnQSq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYGByY2j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYGByY2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771455570; x=1802991570;
  h=date:from:to:cc:subject:message-id;
  bh=yI5oCk6bT2qKmcbOCdvz8tLALx5JM6uaorNmWrSCLIQ=;
  b=dYGByY2j4pzaFU9cURfbSjWVEf6ue5oua8TQU2TSE4dcY9rbahb0dyNv
   adsEAdXL0TISW4CTPtntGjmXq/pMZXJwUwjlpvUOSLAlqbs55DAInQpeE
   Ds/ciein+y3XBJHj0VaEtAYemEoGjzENFHkYMLyNLvl8J9RFrh3r4SyRm
   9dZd8MSWBUvjhUrqJaQDU/t3dAOlLHLSDYbEfEGYd6R4aPSoHc9SHdHZg
   biiAR6a+e+Qw97K0QZLcmS+nwFRgwXty3/QUwuXyrxiwu57+Lln7+X3WJ
   MQKHQs/dNMZdl6WzgkvVW92FSiRRUVIc674911oJL3VwF4eoMm8jnB4Fo
   Q==;
X-CSE-ConnectionGUID: x1SYUSDwQgOL60u1fA35Eg==
X-CSE-MsgGUID: mVVdr7T1Q0W5uao+2SQzHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76158943"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="76158943"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 14:59:29 -0800
X-CSE-ConnectionGUID: WhyCkxjdRPeOPwg+Fa1Fdg==
X-CSE-MsgGUID: rSlPuuMXQTCglw4LPeZeKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="243072920"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 18 Feb 2026 14:59:28 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsqVy-000000003mH-1uzr;
	Wed, 18 Feb 2026 22:59:26 +0000
Date: Wed, 18 Feb 2026 23:58:59 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 26/31] Diff in
 drivers/gpu/nova-core/gpu.rs:330:
Message-ID: <202602182333.khjupdIX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   26f0eeaf8779ffc8b97f03f9aa9d84df9db3bcb4
commit: 8eb9a63f7a618fcf41eaf783f0d452460886bed1 [26/31] nova-core: mm: Add BAR1 memory management self-tests
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260218/202602182333.khjupdIX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602182333.khjupdIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602182333.khjupdIX-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:299:
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
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:383:
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
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:468:
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
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:299:
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
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:383:
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
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:468:
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
>> Diff in drivers/gpu/nova-core/gpu.rs:330:
        }
    
        #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -    fn run_mm_selftests(
   -        mut self: Pin<&mut Self>,
   -        pdev: &pci::Device<device::Bound>,
   -    ) -> Result {
   +    fn run_mm_selftests(mut self: Pin<&mut Self>, pdev: &pci::Device<device::Bound>) -> Result {
            use crate::driver::BAR1_SIZE;
    
            let mmu_version = MmuVersion::from(self.spec.chipset.arch());
   Diff in drivers/gpu/nova-core/gpu.rs:361:
        }
    
        #[cfg(not(CONFIG_NOVA_MM_SELFTESTS))]
   -    fn run_mm_selftests(
   -        self: Pin<&mut Self>,
   -        _pdev: &pci::Device<device::Bound>,
   -    ) -> Result {
   +    fn run_mm_selftests(self: Pin<&mut Self>, _pdev: &pci::Device<device::Bound>) -> Result {
            Ok(())
        }
    }
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:299:
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
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:383:
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
   Diff in drivers/gpu/nova-core/mm/pagetable/mod.rs:468:
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
>> Diff in drivers/gpu/nova-core/gpu.rs:330:
        }
    
        #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -    fn run_mm_selftests(
   -        mut self: Pin<&mut Self>,
   -        pdev: &pci::Device<device::Bound>,
   -    ) -> Result {
   +    fn run_mm_selftests(mut self: Pin<&mut Self>, pdev: &pci::Device<device::Bound>) -> Result {
            use crate::driver::BAR1_SIZE;
    
            let mmu_version = MmuVersion::from(self.spec.chipset.arch());
   Diff in drivers/gpu/nova-core/gpu.rs:361:
        }
    
        #[cfg(not(CONFIG_NOVA_MM_SELFTESTS))]
   -    fn run_mm_selftests(
   -        self: Pin<&mut Self>,
   -        _pdev: &pci::Device<device::Bound>,
   -    ) -> Result {
   +    fn run_mm_selftests(self: Pin<&mut Self>, _pdev: &pci::Device<device::Bound>) -> Result {
            Ok(())
        }
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
   +    bindings, clist_create,
        error::to_result,
        ffi::clist::CListHead,
        new_mutex,
   Diff in rust/kernel/gpu/buddy.rs:132:
    //! ```
    
    use crate::{
   -    bindings,
   -    clist_create,
   +    bindings, clist_create,
        error::to_result,
        ffi::clist::CListHead,
        new_mutex,
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
   +    bindings, clist_create,
        error::to_result,
        ffi::clist::CListHead,
        new_mutex,
   make[2]: *** [Makefile:1903: rustfmt] Error 123
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
