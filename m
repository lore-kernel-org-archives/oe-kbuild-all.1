Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0736C17C21C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 02:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749435932; cv=none; b=MdHItBxQlZxs0iFqqjd+U/xnkiXcdSyoRZZXysduLehPItpOhbmItfc6YcY3ePJXfFKRLBGWQKJkkIMMVTZjHSRMOEb3H6waUySLxLzBvFC0pbZuZB4gpSbfCk6K8MS1QF3aNl3AgtecKmaKG2CjD2DnR8Dib1lLzPceR5/ktoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749435932; c=relaxed/simple;
	bh=HFcb9ZKOPx+bTvrsZ71bvOPVTOf9lM7hrCzQpD2oYfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EymvhzAFk1mM+HaumaKb3aAjn5hAXpOisAxudGLfHekndfx9buqIPayTu/+bvUv1Rjsm5nCuqYmTsF8yEzH9cy1xhYtfUNxpXCdJFR2kFIRe1QDMwiekrxQDiD5GgrOjLVpjeLHbpgUhN7Y/XEMe7f9PwU9M088AwJTJJngk9ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fL2uc9uE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fL2uc9uE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749435931; x=1780971931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HFcb9ZKOPx+bTvrsZ71bvOPVTOf9lM7hrCzQpD2oYfo=;
  b=fL2uc9uEI8SCmEWit+qaHCpAhGvHsvVs3gu5L9e7kFwfI5ywDWnDSqSp
   uotppVi5lbRatHKaXDnVf8i8oec8RdodU3lTuW5KNbcecI+7ptmlXpkQD
   cvOt9yCDfOb1Cii8PzmTeu/Gb9MXLOo1HrhDZxSgFy9Nznx4W9b2ejG0m
   j1aRCPcKmqNrEakSg4R6uYFq2rV8HnUdo/U/3PHJBWJppyt7UDw08R6vu
   5HRKbekvfMi6lBCKunjBC2vE/0AlhoywWPmJSTjoNAsZzCmeq26gYz9OT
   iyACWzi/EYRN/78fzAnHUsq7VPGgi8Wp3MKp9tXU9MZlFjfHxsLy3t9YX
   Q==;
X-CSE-ConnectionGUID: is/Qs9pgQxOiS6TJgb94Ag==
X-CSE-MsgGUID: hfAeBCMuTkObltgTj/s7XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62157354"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="62157354"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 19:25:30 -0700
X-CSE-ConnectionGUID: yzSH2nvPS0y9SjUustQhmg==
X-CSE-MsgGUID: GUTjApFJQLGUAxU7k+RwMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="146729676"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jun 2025 19:25:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOSCV-0006jR-2H;
	Mon, 09 Jun 2025 02:25:27 +0000
Date: Mon, 9 Jun 2025 10:25:02 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-atomic-v1 4/12] Diff in
 rust/kernel/sync/atomic/generic.rs at line 195:
Message-ID: <202506091045.OvEunWN9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-atomic-v1
head:   2a6c20292f74293d9c7ed435de77edcbd1bb36c4
commit: ba3295a1b6827fc8728bc1e7507004e6a58f2305 [4/12] rust: sync: atomic: Add generic atomics
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250609/202506091045.OvEunWN9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506091045.OvEunWN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506091045.OvEunWN9-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/sync/atomic/generic.rs at line 195:
        ///
        /// assert_eq!(0, n.load(Relaxed).0);
        /// ```
   -    #[doc(alias(
   -        "atomic_read",
   -        "atomic64_read"
   -    ))]
   +    #[doc(alias("atomic_read", "atomic64_read"))]
        #[inline(always)]
        pub fn load<Ordering: AcquireOrRelaxed>(&self, _: Ordering) -> T {
            let a = self.as_ptr().cast::<T::Repr>();
   Diff in rust/kernel/sync/atomic/generic.rs at line 237:
        /// assert_eq!(43, x.load(Relaxed));
        /// ```
        ///
   -    #[doc(alias(
   -        "atomic_set",
   -        "atomic64_set"
   -    ))]
   +    #[doc(alias("atomic_set", "atomic64_set"))]
        #[inline(always)]
        pub fn store<Ordering: ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
            let v = T::into_repr(v);
>> Diff in rust/kernel/sync/atomic/generic.rs at line 195:
        ///
        /// assert_eq!(0, n.load(Relaxed).0);
        /// ```
   -    #[doc(alias(
   -        "atomic_read",
   -        "atomic64_read"
   -    ))]
   +    #[doc(alias("atomic_read", "atomic64_read"))]
        #[inline(always)]
        pub fn load<Ordering: AcquireOrRelaxed>(&self, _: Ordering) -> T {
            let a = self.as_ptr().cast::<T::Repr>();
   Diff in rust/kernel/sync/atomic/generic.rs at line 237:
        /// assert_eq!(43, x.load(Relaxed));
        /// ```
        ///
   -    #[doc(alias(
   -        "atomic_set",
   -        "atomic64_set"
   -    ))]
   +    #[doc(alias("atomic_set", "atomic64_set"))]
        #[inline(always)]
        pub fn store<Ordering: ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
            let v = T::into_repr(v);
>> Diff in rust/kernel/sync/atomic/generic.rs at line 195:
        ///
        /// assert_eq!(0, n.load(Relaxed).0);
        /// ```
   -    #[doc(alias(
   -        "atomic_read",
   -        "atomic64_read"
   -    ))]
   +    #[doc(alias("atomic_read", "atomic64_read"))]
        #[inline(always)]
        pub fn load<Ordering: AcquireOrRelaxed>(&self, _: Ordering) -> T {
            let a = self.as_ptr().cast::<T::Repr>();
   Diff in rust/kernel/sync/atomic/generic.rs at line 237:
        /// assert_eq!(43, x.load(Relaxed));
        /// ```
        ///
   -    #[doc(alias(
   -        "atomic_set",
   -        "atomic64_set"
   -    ))]
   +    #[doc(alias("atomic_set", "atomic64_set"))]
        #[inline(always)]
        pub fn store<Ordering: ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
            let v = T::into_repr(v);
>> Diff in rust/kernel/sync/atomic/generic.rs at line 195:
        ///
        /// assert_eq!(0, n.load(Relaxed).0);
        /// ```
   -    #[doc(alias(
   -        "atomic_read",
   -        "atomic64_read"
   -    ))]
   +    #[doc(alias("atomic_read", "atomic64_read"))]
        #[inline(always)]
        pub fn load<Ordering: AcquireOrRelaxed>(&self, _: Ordering) -> T {
            let a = self.as_ptr().cast::<T::Repr>();
   Diff in rust/kernel/sync/atomic/generic.rs at line 237:
        /// assert_eq!(43, x.load(Relaxed));
        /// ```
        ///
   -    #[doc(alias(
   -        "atomic_set",
   -        "atomic64_set"
   -    ))]
   +    #[doc(alias("atomic_set", "atomic64_set"))]
        #[inline(always)]
        pub fn store<Ordering: ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
            let v = T::into_repr(v);
   make[2]: *** [Makefile:1825: rustfmt] Error 123
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
