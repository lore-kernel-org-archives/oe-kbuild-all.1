Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B3C22068F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 06:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765434583; cv=none; b=d2Dhsf0sIV765JMiHy6+5Qpgq512bYJ5fXJirENI17v3qSvpMglP+7iSgKBkHQnhc8dzaWUaN6WzyD8Nk8gUlO20yBL1qYZMG6Sc2NxelYdMgnuHH9RNSJ1xIgR4CXOhgknidOnN9FPNgGdv4MVpaa/J8ELleF/Gh05KwWCTDRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765434583; c=relaxed/simple;
	bh=ORGddO30f0p5OXN0YfnKxgDRZx7L4QyHQl69IuKBLqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BFyEjUM6raJfRMW7g3lhH9Fs9cVfg9z1RzSjckcF3gvTZsAtFaDgaRHE5nZVVvT5HbjYDYhgrZAL/MhaJbneUnj9kIqlIkNMY2lKLOtEtA3isTZM1ijqo+14qb+B+8Tg9JnyiAOGkT5s2u8EogAqKrEKcL3AVxMIVZ4VpkiL3bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QychoJej; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QychoJej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765434581; x=1796970581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ORGddO30f0p5OXN0YfnKxgDRZx7L4QyHQl69IuKBLqw=;
  b=QychoJejfIT1W42Ll2J+6SiacyX/laJFTVUzBYIClf413Ylm7On2UhgT
   1UkIEVRDwdv+A5QbaDclallhMxdq63LTou/unJu/1QazNEZMPHmsRAtLj
   fdjKgljegztJk9SqTxLGd/qW/Z7zlXtH0Emsjr+ihM/Na6kC5YfnlbtXU
   seSA7A09hDp8jRcdoazvqT2DRtSRWspwPHLJ8zGQFhkvcUm1qk4IpVMXi
   vTNUC1DkrE2S9n6jCG2BZoqgAQBNSXr5jfZCAmxlYT3GDbP7spK89cIgh
   h/OtPl4LEeGftMMxEEYXrpc6/RNUDtISWPQSNk6liXQoQDSG61qLTETFb
   w==;
X-CSE-ConnectionGUID: AVorYua2R/qz1/7aeZhV2g==
X-CSE-MsgGUID: 45de+yv8Rz+6NwhnyVo1zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67461939"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67461939"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 22:29:41 -0800
X-CSE-ConnectionGUID: ZHZhhyG+RPKtDQI2hN1XgA==
X-CSE-MsgGUID: Gs9QQFt7RX6IF2YnBmRI4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="195981863"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 10 Dec 2025 22:29:40 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTaBF-000000000w8-3D4u;
	Thu, 11 Dec 2025 06:29:37 +0000
Date: Thu, 11 Dec 2025 07:29:23 +0100
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:locking/core 1/4] Diff in rust/kernel/sync/atomic.rs:21:
Message-ID: <202512110753.8B3YlvtX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   43decb6b628eb033a1b6188e5018773c0d38be1d
commit: 14e9a18b07ec463a85094cc8942788336164319f [1/4] rust: sync: atomic: Make Atomic*Ops pub(crate)
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251211/202512110753.8B3YlvtX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110753.8B3YlvtX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110753.8B3YlvtX-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/sync/atomic.rs:21:
    mod predefine;
    
    pub use internal::AtomicImpl;
   -pub use ordering::{Acquire, Full, Relaxed, Release};
    pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
   +pub use ordering::{Acquire, Full, Relaxed, Release};
    
    use crate::build_error;
    use internal::AtomicRepr;
>> Diff in rust/kernel/sync/atomic.rs:21:
    mod predefine;
    
    pub use internal::AtomicImpl;
   -pub use ordering::{Acquire, Full, Relaxed, Release};
    pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
   +pub use ordering::{Acquire, Full, Relaxed, Release};
    
    use crate::build_error;
    use internal::AtomicRepr;
>> Diff in rust/kernel/sync/atomic.rs:21:
    mod predefine;
    
    pub use internal::AtomicImpl;
   -pub use ordering::{Acquire, Full, Relaxed, Release};
    pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
   +pub use ordering::{Acquire, Full, Relaxed, Release};
    
    use crate::build_error;
    use internal::AtomicRepr;
   make[2]: *** [Makefile:1832: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make: Leaving directory '/kbuild/src/consumer'
   make[1]: Target 'rustfmtcheck' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
