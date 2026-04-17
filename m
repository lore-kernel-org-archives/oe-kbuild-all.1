Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278D1BA21
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 01:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776387828; cv=none; b=mQ3E8K91FGeIAwnXfOT+Hd8Ls5dhFo9dU7MgW6ciQT7WQtdoq+SmPrWCwJTRq7+KnocA76H+HlToQ4ZceLjIq0efjtrGlqGhJtLrg6bgUlW1Ph5r9ABcFTjIV3mb8fwx48XWaP9UPbaxkbmQqrOjJty4+Po67RxAajJZ4fTtmi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776387828; c=relaxed/simple;
	bh=+Nsid1ARCUPYUKZE57Z2gSw/7GyeoUDAgR8IqzLWDao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LQcCJ85Qhku3kXWvc/tPveL71GX3vTs175mT5DhDRPajQdc3u0kLC2opRmHhA5oN6uGchm/dGhZ41eJwA5LcwCDLInAymLyNcB/EdU0LXYLVB6CctFICrFN5+Ckorv88ARQXG5oHsPim0slqHF3+M4fVXtBp8NgXEux2TTIFhsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JV6dFDQx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JV6dFDQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776387827; x=1807923827;
  h=date:from:to:cc:subject:message-id;
  bh=+Nsid1ARCUPYUKZE57Z2gSw/7GyeoUDAgR8IqzLWDao=;
  b=JV6dFDQx7QDuhG8yTuludZ9ZtQOjNVCs4Po3hWrBYR0O/W3dG//v8bcC
   lKczs/kN0LijRvcv43MYDJWsqejFaIgsU1umGPl3bBqH0+m02GMkd0CS3
   mKniSEmvLn9bRH3z1hFO9t1tzdQN7c6WHrTL1tpD+G2RACfo/r7CLTUZa
   xEd8uNGgn9jkI37X4AnEQgkJWBrhcH1SMZz3d953gS9NIxzntyJ+4pHOC
   ny9wHTh3M+PtpQCbzMWcIrJZ9TST6bKU6cYlQpGfuDu1SYcIUakKLvuf3
   K7yDOPXm79Qx0amwNMrwtFSCQQZmygE+cPfutYcdE79NS7XCe5TqD7Py8
   w==;
X-CSE-ConnectionGUID: 64k6ZTgpQ0elBiwviS19oQ==
X-CSE-MsgGUID: EV3V4x0kRgC6XoJMgUqPCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88102547"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="88102547"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 18:03:46 -0700
X-CSE-ConnectionGUID: xlSDIHyYRhSKmn4DrBT19A==
X-CSE-MsgGUID: podYH7+jSy2xyXL4qQXKeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="229883829"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Apr 2026 18:03:46 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDXcU-000000001AP-2Zgd;
	Fri, 17 Apr 2026 01:03:42 +0000
Date: Fri, 17 Apr 2026 03:03:26 +0200
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dakr:devres/chain 11/12] Diff in rust/kernel/devres.rs:483:
Message-ID: <202604170315.9ckJlmsc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git devres/chain
head:   3444693467b5d3f3c9b7c5c9f0a30993bb23f249
commit: 208eedf311c90c891bf3b671b0d24a85429982bd [11/12] devres: add DevresChain for resources with dependencies
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260417/202604170315.9ckJlmsc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170315.9ckJlmsc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170315.9ckJlmsc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/devres.rs:483:
        where
            G: for<'a> FnOnce(&'a F::Of<'a>) -> R,
        {
   -        self.inner
   -            .data
   -            .try_access_with(|data| f(F::cast_ref(data)))
   +        self.inner.data.try_access_with(|data| f(F::cast_ref(data)))
        }
    
        /// [`DevresChain`] accessor for [`Revocable::try_access_with_guard`].
>> Diff in rust/kernel/devres.rs:483:
        where
            G: for<'a> FnOnce(&'a F::Of<'a>) -> R,
        {
   -        self.inner
   -            .data
   -            .try_access_with(|data| f(F::cast_ref(data)))
   +        self.inner.data.try_access_with(|data| f(F::cast_ref(data)))
        }
    
        /// [`DevresChain`] accessor for [`Revocable::try_access_with_guard`].
   make[2]: *** [Makefile:1916: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'
--
>> warning: `ForLt` is both a trait and a macro
   --> rust/kernel/devres.rs:211:72
   |
   211 | /// Use the [`ForLt!`] macro to associate the resource type with its [`ForLt`] implementation.
   |                                                                        ^^^^^ ambiguous link
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
   help: to link to the trait, prefix with `trait@`
   |
   211 | /// Use the [`ForLt!`] macro to associate the resource type with its [`trait@ForLt`] implementation.
   |                                                                        ++++++
   help: to link to the macro, add an exclamation mark
   |
   211 | /// Use the [`ForLt!`] macro to associate the resource type with its [`ForLt!`] implementation.
   |                                                                             +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
