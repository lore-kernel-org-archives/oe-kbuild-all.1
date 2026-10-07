Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738B32D9797
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 16:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791390524; cv=none; b=JUZLPqC0eDCuWo/+DmGqoZL5VH3w/0eeJd3xF/uS/s8rU/ZDp1ekryuxJ5LjoRhHN4lH4A+MDWnFTYLpyC/r5sutH3YAuUTAme3x2NvLB/fZ19g7rDVsycnc9hv/zNva6XVHNCMMOM8jeRv97/RH31U+irc6xzy5g8cjZHJdRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791390524; c=relaxed/simple;
	bh=l8kuny9omrWI9xxP8jnsne7GjH238Dm4A9+wVXcmnhM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HKn2kqPPa2Z/f27e0+foC28MtZCxOvcJYybSf6AdxQRj8YlGpayfvb+HtpGvHRQWNzxC7oQrXS+xOvbYA5e/yh9uP4tP18w27c5l7KG1ExH7yduBPTyZUkFuq5NVDpxdsJnKLWutxtLZemfzAeNRnDTj8AieDJVCG1023FmthaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMOy83Xw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMOy83Xw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791390524; x=1822926524;
  h=date:from:to:cc:subject:message-id;
  bh=l8kuny9omrWI9xxP8jnsne7GjH238Dm4A9+wVXcmnhM=;
  b=NMOy83XwavW+ODbB6rMs4jasSvy1PJn1EZdVB7qQ1J4fGkaHdrVg+kHc
   aQUn/SQSj0OoqF7xygxvYaNlh+m1d/6Kk1mlthVixUu1JIcMDL7HwdPjm
   iLcSq15qRim0Fh/9fCoCa9DU5CO+EkP6S6pxnG/U7UzPEyEDycBUj4J/u
   1wfud2b/k2fMgY9jw45QCcD3M2+4vTY2VmLi/Z5RL7V2kils5sERh4Xgx
   m6fIHMKMZ0/DNP1zHCrWle+fm2TAPbH/MbqzWV4/REWd76XmDG8vlmjWf
   3Ye0EPeqQcRg58eg3zsv2LlBcWpDs2jPFr1qRA6RPeCZhMI9XZk64seoU
   Q==;
X-CSE-ConnectionGUID: h8VgkxZgT0+WuDZ8nymgmg==
X-CSE-MsgGUID: ghLKpwHyRKGpo+J+FT5iaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="45572"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="45572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 09:28:36 -0700
X-CSE-ConnectionGUID: i8OyYD8SQ8qYz/kTsbq1Gg==
X-CSE-MsgGUID: T1WSeR9yShu/U0yMSkz/Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="306954121"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Oct 2026 09:28:35 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEUVM-000000003cZ-0WP8;
	Wed, 07 Oct 2026 16:28:32 +0000
Date: Wed, 07 Oct 2026 18:28:28 +0200
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rcu-box 3/3] Diff in
 rust/kernel/alloc/allocator.rs:131:
Message-ID: <202610071800.kpHKZ3sT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rcu-box
head:   f1c075753df152d44131ae64530e23ec3193aa60
commit: f1c075753df152d44131ae64530e23ec3193aa60 [3/3] WIP
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261007/202610071800.kpHKZ3sT-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071800.kpHKZ3sT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610071800.kpHKZ3sT-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/alloc/allocator.rs:131:
                NonNull::new(raw_ptr).ok_or(AllocError)?
            };
    
   -        debug_assert!(raw_ptr.is_null() || (raw_ptr.addr() & 3 == 0), "{:x}", raw_ptr.addr() );
   +        debug_assert!(
   +            raw_ptr.is_null() || (raw_ptr.addr() & 3 == 0),
   +            "{:x}",
   +            raw_ptr.addr()
   +        );
    
            Ok(NonNull::slice_from_raw_parts(ptr, size))
        }
>> Diff in rust/kernel/alloc/allocator.rs:131:
                NonNull::new(raw_ptr).ok_or(AllocError)?
            };
    
   -        debug_assert!(raw_ptr.is_null() || (raw_ptr.addr() & 3 == 0), "{:x}", raw_ptr.addr() );
   +        debug_assert!(
   +            raw_ptr.is_null() || (raw_ptr.addr() & 3 == 0),
   +            "{:x}",
   +            raw_ptr.addr()
   +        );
    
            Ok(NonNull::slice_from_raw_parts(ptr, size))
        }
>> Diff in rust/kernel/rxarray.rs:103:
        fmt,
        num::Bounded,
        prelude::*,
   -    sync::atomic::{Relaxed, Release, Atomic},
   +    sync::atomic::{Atomic, Relaxed, Release},
        types::ForeignOwnable, //
    };
    use core::{
   Diff in rust/kernel/rxarray.rs:388:
    // This implementation only creates node pointers via `mk_node()`. The other sub-types are reserved
    // for future RCU and multi-index support. See include/linux/xarray.h.
    #[repr(transparent)]
   -struct Slot<T: ForeignOwnable, const SHIFT: usize, const SIZE: usize>(Atomic<usize>, PhantomData<T>);
   +struct Slot<T: ForeignOwnable, const SHIFT: usize, const SIZE: usize>(
   +    Atomic<usize>,
   +    PhantomData<T>,
   +);
    
    impl<T: ForeignOwnable, const SHIFT: usize, const SIZE: usize> Default for Slot<T, SHIFT, SIZE> {
        fn default() -> Self {
   Diff in rust/kernel/rxarray.rs:585:
                return None;
            }
            let ptr = self.0.load(Relaxed) & !3;
   -        pr_info!("as_node_mut() {:x}\n",  ptr);
   +        pr_info!("as_node_mut() {:x}\n", ptr);
            let ptr = core::ptr::with_exposed_provenance_mut(ptr);
    
            // SAFETY:
   Diff in rust/kernel/rxarray.rs:737:
            };
    
            let ptr = KBox::into_raw(node);
   -        debug_assert!(core::mem::align_of::<Self>() & 3 == 0, "Self aligned should be >=4");
   -        debug_assert!(ptr.addr() & 3 == 0, "subtree is not aligned {:x}", ptr.addr());
   +        debug_assert!(
   +            core::mem::align_of::<Self>() & 3 == 0,
   +            "Self aligned should be >=4"
   +        );
   +        debug_assert!(
   +            ptr.addr() & 3 == 0,
   +            "subtree is not aligned {:x}",
   +            ptr.addr()
   +        );
            // SAFETY: TODO
            let mut node = unsafe { KBox::from_raw(ptr) };
    
   Diff in rust/kernel/rxarray.rs:768:
        ) -> Result<Option<Entry<T>>, StoreError<T>> {
            let slot_index = Self::slot_index(index, level);
            let slot = &mut self.slots[slot_index];
   -        pr_info!("{:x}\n",  slot as *mut _ as usize);
   +        pr_info!("{:x}\n", slot as *mut _ as usize);
            if level == 0 {
                debug_assert!(!slot.is_node(), "Found node pointer at leaf level");
                // INVARIANT: `Slot::encode` returns an `Int` or `Pointer` slot, both of which are
>> Diff in rust/kernel/rxarray.rs:103:
        fmt,
        num::Bounded,
        prelude::*,
   -    sync::atomic::{Relaxed, Release, Atomic},
   +    sync::atomic::{Atomic, Relaxed, Release},
        types::ForeignOwnable, //
    };
    use core::{
   Diff in rust/kernel/rxarray.rs:388:
    // This implementation only creates node pointers via `mk_node()`. The other sub-types are reserved
    // for future RCU and multi-index support. See include/linux/xarray.h.
    #[repr(transparent)]
   -struct Slot<T: ForeignOwnable, const SHIFT: usize, const SIZE: usize>(Atomic<usize>, PhantomData<T>);
   +struct Slot<T: ForeignOwnable, const SHIFT: usize, const SIZE: usize>(
   +    Atomic<usize>,
   +    PhantomData<T>,
   +);
    
    impl<T: ForeignOwnable, const SHIFT: usize, const SIZE: usize> Default for Slot<T, SHIFT, SIZE> {
        fn default() -> Self {
   Diff in rust/kernel/rxarray.rs:585:
                return None;
            }
            let ptr = self.0.load(Relaxed) & !3;
   -        pr_info!("as_node_mut() {:x}\n",  ptr);
   +        pr_info!("as_node_mut() {:x}\n", ptr);
            let ptr = core::ptr::with_exposed_provenance_mut(ptr);
    
            // SAFETY:
   Diff in rust/kernel/rxarray.rs:737:
            };
    
            let ptr = KBox::into_raw(node);
   -        debug_assert!(core::mem::align_of::<Self>() & 3 == 0, "Self aligned should be >=4");
   -        debug_assert!(ptr.addr() & 3 == 0, "subtree is not aligned {:x}", ptr.addr());
   +        debug_assert!(
   +            core::mem::align_of::<Self>() & 3 == 0,
   +            "Self aligned should be >=4"
   +        );
   +        debug_assert!(
   +            ptr.addr() & 3 == 0,
   +            "subtree is not aligned {:x}",
   +            ptr.addr()
   +        );
            // SAFETY: TODO
            let mut node = unsafe { KBox::from_raw(ptr) };
    
   Diff in rust/kernel/rxarray.rs:768:
        ) -> Result<Option<Entry<T>>, StoreError<T>> {
            let slot_index = Self::slot_index(index, level);
            let slot = &mut self.slots[slot_index];
   -        pr_info!("{:x}\n",  slot as *mut _ as usize);
   +        pr_info!("{:x}\n", slot as *mut _ as usize);
            if level == 0 {
                debug_assert!(!slot.is_node(), "Found node pointer at leaf level");
                // INVARIANT: `Slot::encode` returns an `Int` or `Pointer` slot, both of which are
>> Diff in rust/kernel/alloc/allocator.rs:131:
                NonNull::new(raw_ptr).ok_or(AllocError)?
            };
    
   -        debug_assert!(raw_ptr.is_null() || (raw_ptr.addr() & 3 == 0), "{:x}", raw_ptr.addr() );
   +        debug_assert!(
   +            raw_ptr.is_null() || (raw_ptr.addr() & 3 == 0),
   +            "{:x}",
   +            raw_ptr.addr()
   +        );
    
            Ok(NonNull::slice_from_raw_parts(ptr, size))
        }
   make[2]: *** [Makefile:2038: rustfmt] Error 123
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
