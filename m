Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ABB235375
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209021; cv=none; b=Pdow+bZ4DyHGgNUSAKXFVDrJ0D1vR6xaa1cYqE3vYLE88/C65tkFAW0rHwdpdYLKUCw5L67hMjtnfGiJ7ELRjAGD8HqWOlOj+3g2LDTAl0S5XqzGABrDYXHwycQcuxbsY3HDazLud9u3f3N22+VKWmP0xl+/qzvAD85T2iYrTao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209021; c=relaxed/simple;
	bh=rfrhnMJgKBpGkJl8NU4TZ0iC/ly3Ue49Ra+i+3uQZGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l1EP9tJ39qs7HYrOM2QHDN2mRqTS29suCZLKIX/Wu+TrBoy52ijqWxFnprHaFkiZlinwloWlsKOIvwIFv4loeyVeYMn8jrBuA46HMEvQb2ZCK7STHlmBK1BJhOGwYMlLwvQRkHiQZnnp9xADfCAF9iIyPgqsPCEhfmuxfiNVbFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrjR6XQr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrjR6XQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742209020; x=1773745020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rfrhnMJgKBpGkJl8NU4TZ0iC/ly3Ue49Ra+i+3uQZGs=;
  b=YrjR6XQr2wyWKHhJQMTOYr1TXGD2T2uhxrRlyEXhXPzA+iwq/CLHG9i7
   3rd2k2Tumbe4Pbel3ytuqxe77i/zD0Z0Im3eEif23CAmztlvgcJo3ODZN
   oEJPOZtGZqOwJ0ReuYarG0T2/hyilGRmBvAcxrc7PMYEdrhqi3oH79ZG5
   3cmfGbC21tEuDTSjHXWPdbRUgpOiWznHwL741XGwTH4Jg6eurj3ksNjEB
   rzPAOHjyZMj1n0Tuxt7hNHsK8KZpwpqtf9CAI1RXzfQ0MS8z2uoEYlXp7
   0b+hnOy6lJlNLBOSr00CZYclt3zAfWtXFrD8TC4jOCmx1ohg9t9R4ABtz
   A==;
X-CSE-ConnectionGUID: PoYzuZPVRriIwUvMpgbS/w==
X-CSE-MsgGUID: 3iNu8S7zQpCM5JGc/aZqHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="65760975"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="65760975"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:57:00 -0700
X-CSE-ConnectionGUID: H4h7JbCpReuKyN4ye0N1fA==
X-CSE-MsgGUID: YQxYgDJfRMKxHKhAdPksnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="122417605"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Mar 2025 03:56:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu89P-000CgT-32;
	Mon, 17 Mar 2025 10:56:55 +0000
Date: Mon, 17 Mar 2025 18:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-atomic-v3 16/17] Diff in rust/kernel/sync/lock/global.rs
 at line 217:
Message-ID: <202503171804.E5sdTIEj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-atomic-v3
head:   9b0ff2cf7026f93d299434f0484d283c61418661
commit: 82fffc1e5c45a95453dc84c03f3658cc8b50943d [16/17] WIP: rcu: sync: Add GlobalLockedy for Projectiable
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250317/202503171804.E5sdTIEj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171804.E5sdTIEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171804.E5sdTIEj-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/sync/lock/global.rs at line 217:
    
    use core::pin::Pin;
    
   -impl<T: ?Sized + Projectable, B: GlobalLockBackend> core::ops::Deref for ProjectableGlobalLockedBy<T, B> {
   +impl<T: ?Sized + Projectable, B: GlobalLockBackend> core::ops::Deref
   +    for ProjectableGlobalLockedBy<T, B>
   +{
        type Target = T;
        /// Access the value immutably.
        ///
   Diff in rust/kernel/sync/rcu.rs at line 61:
    
    // SAFETY: `Rcu` is safe to have multiple immutable references co-existing with one pinned mutable
    // reference.
   -unsafe impl<P: ForeignOwnable> crate::sync::Projectable for Rcu<P> { }
   +unsafe impl<P: ForeignOwnable> crate::sync::Projectable for Rcu<P> {}
    
    /// A pointer that has been unpublished, but hasn't waited for a grace period yet.
    ///
>> Diff in rust/kernel/sync/lock/global.rs at line 217:
    
    use core::pin::Pin;
    
   -impl<T: ?Sized + Projectable, B: GlobalLockBackend> core::ops::Deref for ProjectableGlobalLockedBy<T, B> {
   +impl<T: ?Sized + Projectable, B: GlobalLockBackend> core::ops::Deref
   +    for ProjectableGlobalLockedBy<T, B>
   +{
        type Target = T;
        /// Access the value immutably.
        ///
>> Diff in rust/kernel/sync/lock/global.rs at line 217:
    
    use core::pin::Pin;
    
   -impl<T: ?Sized + Projectable, B: GlobalLockBackend> core::ops::Deref for ProjectableGlobalLockedBy<T, B> {
   +impl<T: ?Sized + Projectable, B: GlobalLockBackend> core::ops::Deref
   +    for ProjectableGlobalLockedBy<T, B>
   +{
        type Target = T;
        /// Access the value immutably.
        ///
   Diff in rust/kernel/sync/rcu.rs at line 61:
    
    // SAFETY: `Rcu` is safe to have multiple immutable references co-existing with one pinned mutable
    // reference.
   -unsafe impl<P: ForeignOwnable> crate::sync::Projectable for Rcu<P> { }
   +unsafe impl<P: ForeignOwnable> crate::sync::Projectable for Rcu<P> {}
    
    /// A pointer that has been unpublished, but hasn't waited for a grace period yet.
    ///
   Diff in rust/kernel/sync.rs at line 18:
    
    pub use arc::{Arc, ArcBorrow, UniqueArc};
    pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
   -pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy, ProjectableGlobalLockedBy};
   +pub use lock::global::{
   +    global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy,
   +    ProjectableGlobalLockedBy,
   +};
    pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
    pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
    pub use locked_by::LockedBy;
   Diff in rust/kernel/sync.rs at line 77:
    ///
    /// The implement type must allow multiple immutable references and one pinned mutable references
    /// co-exist as the same time.
   -pub unsafe trait Projectable { }
   +pub unsafe trait Projectable {}
    
>> Diff in rust/kernel/sync/lock/global.rs at line 217:
    
    use core::pin::Pin;
    
   -impl<T: ?Sized + Projectable, B: GlobalLockBackend> core::ops::Deref for ProjectableGlobalLockedBy<T, B> {
   +impl<T: ?Sized + Projectable, B: GlobalLockBackend> core::ops::Deref
   +    for ProjectableGlobalLockedBy<T, B>
   +{
        type Target = T;
        /// Access the value immutably.
        ///
   Diff in rust/kernel/sync/rcu.rs at line 61:
    
    // SAFETY: `Rcu` is safe to have multiple immutable references co-existing with one pinned mutable
    // reference.
   -unsafe impl<P: ForeignOwnable> crate::sync::Projectable for Rcu<P> { }
   +unsafe impl<P: ForeignOwnable> crate::sync::Projectable for Rcu<P> {}
    
    /// A pointer that has been unpublished, but hasn't waited for a grace period yet.
    ///
   Diff in rust/kernel/sync.rs at line 18:
    
    pub use arc::{Arc, ArcBorrow, UniqueArc};
    pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
   -pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy, ProjectableGlobalLockedBy};
   +pub use lock::global::{
   +    global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy,
   +    ProjectableGlobalLockedBy,
   +};
    pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
    pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
    pub use locked_by::LockedBy;
   Diff in rust/kernel/sync.rs at line 77:
    ///
    /// The implement type must allow multiple immutable references and one pinned mutable references
    /// co-exist as the same time.
   -pub unsafe trait Projectable { }
   +pub unsafe trait Projectable {}
    
   make[2]: *** [Makefile:1811: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
