Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A84B1DAC92
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 08:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742198932; cv=none; b=fjNPWG1/kacmJ4LZg9CrC5UxCU5Dr1wh9y6Whn8wKh/KXAKdxGVGnFLluWcGGfI5ihNHQGScdjMH6ws73aDF2ASLikzUk5kST7Hhbx8u5BEnlQRlmF7MaxjYp0d/MmCfa6xibztKyHIafR52HKaybC590Xa4Us9EBSvHL1ChFAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742198932; c=relaxed/simple;
	bh=YuzFmYsKiLtZ5k3dgFL6GZAzC3Ee4oM7BxkDXcBNy/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j1H+e9nCXzrp86oZeMlKnWo/4M2fDQdodvkxtZXFit54lBaD2RnB54+qNiQj0GpdhFPDHLmJtslOIuhpu2dXGqadaturIzftNWYm8v2iLmQrFN4oPkW1V/kSeTUoWFQrWuAdNV5jqqf6swyjmEHQxacT+BLQETSCf5ze1PUKYtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaOmmQ9s; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaOmmQ9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742198928; x=1773734928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YuzFmYsKiLtZ5k3dgFL6GZAzC3Ee4oM7BxkDXcBNy/Q=;
  b=SaOmmQ9s4hrGLiBghFHaWhPLBQ/+eYgthSFa3srAS/RPHSRJRKoKVrsZ
   voOnVNASl+YAol12gqqUOE3D0egsL2RpjMplUTTNoXC51H2268gu3ma3q
   gkWB7BpvBtV5DFJfg+8Gg5g63x3ZTKJFwazSfybO2KTfZyz+n1v87liuc
   jz8jK+LlgTeGJORCJtoUan2AShAtULvkFMHQ8PHDU5juKE99czuCwpHfq
   Tn7Ra1XjZF0RxSQG1JZXc6hWxA9scEaRrii7Kn5eYLsBlM+SMNa5x5nV5
   LErie9Bea3I35/ANg4bnGXXkhP+vXiPNX03R8nUUv2HMS4e2LeyhJzBrM
   A==;
X-CSE-ConnectionGUID: o+vgfKYsTuiST/n5FNYU0g==
X-CSE-MsgGUID: eZV88Ql8RVyf1fzI+sA+qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="68640543"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="68640543"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 01:08:47 -0700
X-CSE-ConnectionGUID: E7v3TM3+T6uQ5ZBtQF/95Q==
X-CSE-MsgGUID: guXGeHiPTiu/zUdmolqF3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="122614047"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Mar 2025 01:08:47 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu5We-000Caf-2w;
	Mon, 17 Mar 2025 08:08:44 +0000
Date: Mon, 17 Mar 2025 16:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-atomic-v3 13/17] Diff in rust/kernel/sync.rs at line 77:
Message-ID: <202503171631.FRz9jMfT-lkp@intel.com>
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
commit: 8ca1287ecd53e1124d394449c78cab9ad9d1fe93 [13/17] WIP: introduce projectable
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250317/202503171631.FRz9jMfT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171631.FRz9jMfT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171631.FRz9jMfT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/sync.rs at line 77:
    ///
    /// The implement type must allow multiple immutable references and one pinned mutable references
    /// co-exist as the same time.
   -pub unsafe trait Projectable { }
   +pub unsafe trait Projectable {}
    
>> Diff in rust/kernel/sync.rs at line 77:
    ///
    /// The implement type must allow multiple immutable references and one pinned mutable references
    /// co-exist as the same time.
   -pub unsafe trait Projectable { }
   +pub unsafe trait Projectable {}
    
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'
   make[2]: *** [Makefile:1811: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
--
>> warning: unresolved link to `&Self`
   --> rust/kernel/sync.rs:74:36
   |
   74 | /// A trait that allows multiple [`&Self`] and one [`Pin<&mut Self>`] exists at the same time.
   |                                    ^^^^^ no item named `&Self` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`
--
>> warning: unresolved link to `Pin`
   --> rust/kernel/sync.rs:74:54
   |
   74 | /// A trait that allows multiple [`&Self`] and one [`Pin<&mut Self>`] exists at the same time.
   |                                                      ^^^^^^^^^^^^^^ no item named `Pin` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
