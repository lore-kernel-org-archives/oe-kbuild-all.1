Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8822434D93B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 19:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779305929; cv=none; b=h+5hRnD+o66HwMSpO9bR2ght/oKA+M32V+jR+1+4AxmUhR5NBinc0RCnd+6GtmGzr6eSrefno4wwbdY8Xq3GrrRWa87fiE/Ukxfo+AtpYo4Y1WNjDHgjhximXNTa3tdDBbNkgCflyzYSNLIhWWfVn7k6KOcNM6WotqvRaZfwCvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779305929; c=relaxed/simple;
	bh=xdY2E3yQQUyeRd0PtHSOyvebXC1swozw4tWkn7vI7ws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tHsUUDWR6Jw/TnWgzyP3/qRYriRhmfKcmENU71cISAtn/B1b8X0WJcLzifk/Xwop2dzeyM5H7oqVJtSohmTQEjIc6+SEdpHssvYkNqrbZJr0G9UJufgYn5xGF+TDNiSoL5F0etp8CyOyBPfCcOHPCkTn6MzIAMGita2nvvEoJOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y25csmtR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y25csmtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779305926; x=1810841926;
  h=date:from:to:cc:subject:message-id;
  bh=xdY2E3yQQUyeRd0PtHSOyvebXC1swozw4tWkn7vI7ws=;
  b=Y25csmtRUvJBu4VqnmwAKWVDNgQFkILASwvB+OW3pYxuf0wfUtbjN2KZ
   YmzU8OtDyR+U57aHqiRwupgsYRSXohNohdHcy9lKxyyIoBI6PU4iScfb0
   DcGsNlABi4OUNNdgtEkjgzp80VCycTJAbk5NBVnovZKBcuhoYXndsutty
   zxFydziLGW/D01l+ziC52DDuLDgtnaL/QckaIy0Rqr+AOoDFjt6MAaAb3
   PMXXWrOGfDQXGJylBMUBdfMP66kvWbCHhx/lxo6ZjIt1KlwgWyVsIHrxU
   sw644x4akq9MPfzhN1APJIsd09dIx1bfJ5rwhnbWfWgWYGw3G+y0+USs/
   Q==;
X-CSE-ConnectionGUID: 0M5mH+tjTEabE4W7NDnspw==
X-CSE-MsgGUID: Z4R/0BzSRRyGcK7lIfhyNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="82795820"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="82795820"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 12:38:45 -0700
X-CSE-ConnectionGUID: wrDYzSjtRY6YaCsb6IZarw==
X-CSE-MsgGUID: dg6L5p3zS5yqLb6Kou7oYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="239437535"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2026 12:38:43 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPmka-00000000Adp-0Lfl;
	Wed, 20 May 2026 19:38:40 +0000
Date: Wed, 20 May 2026 21:38:28 +0200
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in rust/kernel/sync/rcu.rs:5:
Message-ID: <202605202103.Qif3ukMU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/rust-rcu-Add-abstraction-for-call_rcu/20260520-212425
head:   3a25871cb3025767ab2c533e660bf12b5b2f9d14
commit: 3a25871cb3025767ab2c533e660bf12b5b2f9d14 rust: rcu: Add abstraction for call_rcu()
date:   6 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260520/202605202103.Qif3ukMU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605202103.Qif3ukMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605202103.Qif3ukMU-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/sync/rcu.rs:5:
    //! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcupdate.h)
    
    use crate::{
   +    alloc::Flags,
        bindings,
        prelude::*,
   -    types::{
   -        NotThreadSafe,
   -        Opaque,
   -    },
   -    alloc::Flags,
   +    types::{NotThreadSafe, Opaque},
    };
    
    /// Evidence that the RCU read side lock is held on the current thread/CPU.
   Diff in rust/kernel/sync/rcu.rs:58:
    pub fn read_lock() -> Guard {
        Guard::new()
    }
   -
    
    /// An RCU callback object. Carries the user's data to drop() it once a grace period ellapsed.
    ///
>> Diff in rust/kernel/sync/rcu.rs:5:
    //! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcupdate.h)
    
    use crate::{
   +    alloc::Flags,
        bindings,
        prelude::*,
   -    types::{
   -        NotThreadSafe,
   -        Opaque,
   -    },
   -    alloc::Flags,
   +    types::{NotThreadSafe, Opaque},
    };
    
    /// Evidence that the RCU read side lock is held on the current thread/CPU.
   Diff in rust/kernel/sync/rcu.rs:58:
    pub fn read_lock() -> Guard {
        Guard::new()
    }
   -
    
    /// An RCU callback object. Carries the user's data to drop() it once a grace period ellapsed.
    ///
>> Diff in rust/kernel/sync.rs:29:
    pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
    pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
    pub use locked_by::LockedBy;
   +pub use rcu::Callback;
    pub use refcount::Refcount;
    pub use set_once::SetOnce;
   -pub use rcu::Callback;
    
    /// Represents a lockdep class.
    ///
>> Diff in rust/kernel/sync/rcu.rs:5:
    //! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcupdate.h)
    
    use crate::{
   +    alloc::Flags,
        bindings,
        prelude::*,
   -    types::{
   -        NotThreadSafe,
   -        Opaque,
   -    },
   -    alloc::Flags,
   +    types::{NotThreadSafe, Opaque},
    };
    
    /// Evidence that the RCU read side lock is held on the current thread/CPU.
   Diff in rust/kernel/sync/rcu.rs:58:
    pub fn read_lock() -> Guard {
        Guard::new()
    }
   -
    
    /// An RCU callback object. Carries the user's data to drop() it once a grace period ellapsed.
    ///
>> Diff in rust/kernel/sync.rs:29:
    pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
    pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
    pub use locked_by::LockedBy;
   +pub use rcu::Callback;
    pub use refcount::Refcount;
    pub use set_once::SetOnce;
   -pub use rcu::Callback;
    
    /// Represents a lockdep class.
    ///
   make[2]: *** [Makefile:1954: rustfmt] Error 123
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
