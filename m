Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A92935C6B9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 04:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915338; cv=none; b=W3NSdZ5CQ/yhrrSkioRjVUHc0J1LZzZTrdLcBZhkY0E15lhoinygkXe1mTqR7n0ov9sYXOJl9DdTfgdKyvJ8qAWEb+rw/kFS3Lv1jM5hDE3xDLHvnoedk2HYaOEKEo1HmkgMCYWH+CI+TNPin8bBdH8iqeVDbojL5YpUkxhP0e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915338; c=relaxed/simple;
	bh=3nSf/waaYWLWRW6KRbQn3NwPeUvagJ+b9c9YoksEYJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hhFdoeCNCdgoaVWNeLJUqFnXigWrArwLLMOKzVjkwQWMTY/9ng88vYCtxfpii9qpoWb9tAXQJiNiC04pEAYh2QW1hQFIsDoWHJheZlJjbaO57bjk0qu8Pa7OB0ukk/jqGynfPx1Si2hZHCegOX2/55jp0IVDjHzOnZXyN/eL7Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjj88GAd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjj88GAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790915335; x=1822451335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3nSf/waaYWLWRW6KRbQn3NwPeUvagJ+b9c9YoksEYJQ=;
  b=kjj88GAd0OKh5TJn/16ppQezVtqJWsyMgllspe/QUKpBs6UM5XAQHWwG
   6DlCPYOjElfPD5Hchh6R+W2JfcssDgds04zZXrTniLHsxJDMsDCX0pfmL
   E/mK6dqT+KRlHowh4kjrK1JBMeME3L4af7udcE9Jncq9LRIqLkvW7yB2a
   bM/BtcMqxzSQ6o5Vf0Fx94utTbvwWteJwM52d1ddYYxoaFgWgGPOpJVla
   J5PWs52yvRqcLi1cRPJ0bER06Cfr2gXKJ9f/HQKy/CSekXmG3jEyWM2yn
   qOc6+MJSJarSOssCkAxXQ0FbtppRH8QQldBPdoZPv+3p2XsC5pByBaWbN
   Q==;
X-CSE-ConnectionGUID: +fU4xxmrT6i2N4KrWQXnHQ==
X-CSE-MsgGUID: 2VdTTudCRYq0lxSGU78bFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91702710"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91702710"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 21:28:52 -0700
X-CSE-ConnectionGUID: T77+tDBXQZ2Vdy9iYjhqwA==
X-CSE-MsgGUID: 8mITWS1ARSaOYqnyjsSWBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="273984005"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 01 Oct 2026 21:28:51 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCUt6-000000000PJ-2ndO;
	Fri, 02 Oct 2026 04:28:48 +0000
Date: Fri, 02 Oct 2026 06:27:59 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-kunit-assertion 9/10] Diff in
 rust/kernel/kunit.rs:228:
Message-ID: <202610020610.dDtUCI7n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-kunit-assertion
head:   fbe73450cefcca4ff86e4228d44e205327d15c7f
commit: f82c57ed5a465d99b7a06d7aacc8f7541872cc4d [9/10] kunit: msg
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261002/202610020610.dDtUCI7n-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020610.dDtUCI7n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020610.dDtUCI7n-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in rust/kernel/sync/atomic/predefine.rs:305:
            let x = Atomic::new(&raw const v);
    
            assert_eq!(x.load(Acquire), &raw const v);
   -        assert_matches!(
   -            x.cmpxchg(&raw const u, &raw const u, Relaxed),
   -            Err(_)
   -        );
   -        assert_matches!(
   -            x.cmpxchg(&raw const v, &raw const u, Relaxed),
   -            Ok(_)
   -        );
   +        assert_matches!(x.cmpxchg(&raw const u, &raw const u, Relaxed), Err(_));
   +        assert_matches!(x.cmpxchg(&raw const v, &raw const u, Relaxed), Ok(_));
            assert_eq!(x.load(Relaxed), &raw const u);
        }
    
   Diff in rust/kernel/sync/atomic/predefine.rs:305:
            let x = Atomic::new(&raw const v);
    
            assert_eq!(x.load(Acquire), &raw const v);
   -        assert_matches!(
   -            x.cmpxchg(&raw const u, &raw const u, Relaxed),
   -            Err(_)
   -        );
   -        assert_matches!(
   -            x.cmpxchg(&raw const v, &raw const u, Relaxed),
   -            Ok(_)
   -        );
   +        assert_matches!(x.cmpxchg(&raw const u, &raw const u, Relaxed), Err(_));
   +        assert_matches!(x.cmpxchg(&raw const v, &raw const u, Relaxed), Ok(_));
            assert_eq!(x.load(Relaxed), &raw const u);
        }
    
   Diff in rust/kernel/sync/atomic/predefine.rs:305:
            let x = Atomic::new(&raw const v);
    
            assert_eq!(x.load(Acquire), &raw const v);
   -        assert_matches!(
   -            x.cmpxchg(&raw const u, &raw const u, Relaxed),
   -            Err(_)
   -        );
   -        assert_matches!(
   -            x.cmpxchg(&raw const v, &raw const u, Relaxed),
   -            Ok(_)
   -        );
   +        assert_matches!(x.cmpxchg(&raw const u, &raw const u, Relaxed), Err(_));
   +        assert_matches!(x.cmpxchg(&raw const v, &raw const u, Relaxed), Ok(_));
            assert_eq!(x.load(Relaxed), &raw const u);
        }
    
>> Diff in rust/kernel/kunit.rs:228:
            // For the moment, we just forward to the expression assert because, for binary asserts,
            // KUnit supports only a few types (e.g. integers).
            match $left {
   -            $right => {},
   -            _ => {
   -                match $crate::prelude::fmt!("{:?} ?? {:?}", $left, ::core::stringify!($right)) {
   -                    fmt => {
   -                        $crate::kunit_assert!($name, $file, $diff, false, Some(fmt))
   -                    }
   +            $right => {}
   +            _ => match $crate::prelude::fmt!("{:?} ?? {:?}", $left, ::core::stringify!($right)) {
   +                fmt => {
   +                    $crate::kunit_assert!($name, $file, $diff, false, Some(fmt))
                    }
                },
            };
   Diff in rust/kernel/sync/atomic/predefine.rs:305:
            let x = Atomic::new(&raw const v);
    
            assert_eq!(x.load(Acquire), &raw const v);
   -        assert_matches!(
   -            x.cmpxchg(&raw const u, &raw const u, Relaxed),
   -            Err(_)
   -        );
   -        assert_matches!(
   -            x.cmpxchg(&raw const v, &raw const u, Relaxed),
   -            Ok(_)
   -        );
   +        assert_matches!(x.cmpxchg(&raw const u, &raw const u, Relaxed), Err(_));
   +        assert_matches!(x.cmpxchg(&raw const v, &raw const u, Relaxed), Ok(_));
            assert_eq!(x.load(Relaxed), &raw const u);
        }
    
>> Diff in rust/kernel/kunit.rs:228:
            // For the moment, we just forward to the expression assert because, for binary asserts,
            // KUnit supports only a few types (e.g. integers).
            match $left {
   -            $right => {},
   -            _ => {
   -                match $crate::prelude::fmt!("{:?} ?? {:?}", $left, ::core::stringify!($right)) {
   -                    fmt => {
   -                        $crate::kunit_assert!($name, $file, $diff, false, Some(fmt))
   -                    }
   +            $right => {}
   +            _ => match $crate::prelude::fmt!("{:?} ?? {:?}", $left, ::core::stringify!($right)) {
   +                fmt => {
   +                    $crate::kunit_assert!($name, $file, $diff, false, Some(fmt))
                    }
                },
            };
   make[2]: *** [Makefile:2038: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'
--
>> warning: missing documentation for a function
   --> rust/kernel/kunit.rs:195:1
   |
   195 | / pub fn compare_and_format<'a, L, R>(l: &'a L, r: &'a R) -> bool
   196 | | where
   197 | |     L: fmt::Debug + core::cmp::PartialEq<R> + Into<R>,
   198 | |     R: fmt::Debug,
   | |__________________^
   |
   = note: requested on the command line with `-W missing-docs`
--
>> warning: empty doc comment
   --> rust/kernel/kunit.rs:62:1
   |
   62 | ///
   | ^^^
   |
   = help: consider removing or filling it
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#empty_docs
   = note: `-W clippy::empty-docs` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::empty_docs)]`
--
>> warning: empty doc comment
   --> rust/kernel/kunit.rs:64:5
   |
   64 |     ///
   |     ^^^
   |
   = help: consider removing or filling it
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#empty_docs
--
>> warning: empty doc comment
   --> rust/kernel/kunit.rs:67:5
   |
   67 |     ///
   |     ^^^
   |
   = help: consider removing or filling it
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#empty_docs
--
>> warning: empty doc comment
   --> rust/kernel/kunit.rs:74:1
   |
   74 | ///
   | ^^^
   |
   = help: consider removing or filling it
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#empty_docs
--
>> warning: this public function might dereference a raw pointer but is not marked `unsafe`
   --> rust/kernel/kunit.rs:82:27
   |
   82 |     let stream = unsafe { stream.as_mut_unchecked() };
   |                           ^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#not_unsafe_ptr_arg_deref
   = note: `-W clippy::not-unsafe-ptr-arg-deref` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::not_unsafe_ptr_arg_deref)]`
--
>> warning: this public function might dereference a raw pointer but is not marked `unsafe`
   --> rust/kernel/kunit.rs:83:28
   |
   83 |     let message = unsafe { message.as_ref_unchecked() };
   |                            ^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#not_unsafe_ptr_arg_deref

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
