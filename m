Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754DF2741B6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 03:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431297; cv=none; b=K8X00nK+qxRpV9WiIwFVJE5Rit9BJ77sqaISYCI9cTGdSG0d/GJRUVdnGaZ2A+Typb0hSO3ZxTKfUrZanxLIHk9064L7/Xuo01lC1gdER4CeJusWnT4vZwUS68nHKTAgHtFi6P5rkHUTxtCrLoxFoAVDKYt5TsrCXrmsrexVUB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431297; c=relaxed/simple;
	bh=nPflPde1rB99Fn0emiuFtE5bnjJ4k4oiXHSRuGkuUC8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DL2FoZT6N/q5jjT3Wzb3hkU26fdI8lvVOAGeAOPuf7dCQDWbDxc3TCqH9pOFzSlWtV9n6EstkTUnudUNecThao+STS70lhiGWdIhLSeUjF6vJB7sXY5VJoiuHUOntLCqiCx64QRhTxXaQ7myO6iRSAMQ4Zfg9SYKzIdzw1JdK+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msMxbXAz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msMxbXAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791431295; x=1822967295;
  h=date:from:to:cc:subject:message-id;
  bh=nPflPde1rB99Fn0emiuFtE5bnjJ4k4oiXHSRuGkuUC8=;
  b=msMxbXAzaKmaahuIse77tJG9JQ7wiPiIh9vgTT9dBwpN6XAXP4xgKGZB
   hTjZ4l4RB8WGP/VOkdHYxCK2nNDe7X/u1MfsFi+fVjAwogtD2eIK04E6q
   lVIoqGKiPOniH6OfTsCkg7WTdjMBls6McEF+KHRNkHMO84yZKmIWPnzbH
   y7ndnEF6jb50pcFD9jmbMKvDI1IhDObJ2LJ0I0B607kjkYD3VsBkNKmIS
   BOGcdgwbevuh5OrcQ0x+wv5Ry72S1cCY2hJtUISpnOvx5ophMMdaeoj8+
   n63elj5LOH0iJQbxEe8WjYEKsgjvdnjEbsikpep/JNz0R5qPmWpU4vHZ0
   Q==;
X-CSE-ConnectionGUID: zaUWottVSm6hGuassVfJ9w==
X-CSE-MsgGUID: XD5rYaZyQcGYuglLs5/Aug==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="207788"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="207788"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 20:48:15 -0700
X-CSE-ConnectionGUID: ml1F55ITRi+K0Mk13GmgAQ==
X-CSE-MsgGUID: BmTg3H+KS0OulSLDgBeGZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="280911167"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 07 Oct 2026 20:48:14 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEf75-000000004iN-1flV;
	Thu, 08 Oct 2026 03:48:11 +0000
Date: Thu, 08 Oct 2026 05:47:12 +0200
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rcu-box 3/3] error[E0080]: evaluation panicked:
 assertion failed: core::mem::align_of::<Node<(), 4, 16>>() == 8
Message-ID: <202610080541.SO22CbzC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rcu-box
head:   f1c075753df152d44131ae64530e23ec3193aa60
commit: f1c075753df152d44131ae64530e23ec3193aa60 [3/3] WIP
config: um-randconfig-r2201-20261008 (https://download.01.org/0day-ci/archive/20261008/202610080541.SO22CbzC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project dbeca9a3a3ba0b46471efb339b0ea8f2194f6f68)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080541.SO22CbzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080541.SO22CbzC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0080]: evaluation panicked: assertion failed: core::mem::align_of::<Node<(), 4, 16>>() == 8
   --> rust/kernel/build_assert.rs:112:23
   |
   112 |         const _: () = ::core::assert!($condition $(,$arg)?);
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `rxarray::_` failed here
   |
   ::: rust/kernel/rxarray.rs:661:1
   |
   661 | static_assert!(core::mem::align_of::<Node::<(), 4, 16>>() == 8);
   | --------------------------------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
