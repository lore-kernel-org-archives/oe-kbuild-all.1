Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BA34D17A0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471098; cv=none; b=UT+2XZ/NjnwmcQcepkFzD0njtmCy/K2LVdrh4kBAcDxF/PMyG6Z+B7S2v7kNrsHrsw650UD1MFpNjYFgojtbvi6On6fR1Dxk4RrJ3iWAegQUlgrExAHodGU+qUCwiteHfnbQRPGze5Wbm0Vbfoua35lNrz8ngJ00Heo/9HMseME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471098; c=relaxed/simple;
	bh=sWgqMphe0xLAtvwqbgbBjA/5ZeNAoOYhgQaQXXZjQoo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H5fW4YWttZRgfKpUy5lH1v7SvjESVjtuxCWfBepdJludMNBiEKUQV7AT67o8NB/kFuP0amyHy10xKq0OpDdgGS54BDkdrNPeqZruNCOYxatzAIAT/6CkZ9IDcY/ia8fjpv35HbTBe+e1uzLzBBbdvw8H4ify9oIntVUQmGEV3nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsFg5PmA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsFg5PmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791471091; x=1823007091;
  h=date:from:to:cc:subject:message-id;
  bh=sWgqMphe0xLAtvwqbgbBjA/5ZeNAoOYhgQaQXXZjQoo=;
  b=hsFg5PmAmM60pxhCZjhYcLlophMpwneRA1noc9nhEXYowTsOhZeeYfq4
   gMU0i/VVR4cofOcWmOD+oIl4H/vvHR5+7cMATOYQE5gvk57ypz3I3/ABM
   OHtoRd5HMJD8Bq1Zki7uSy+hObaYQ98RxjlaX2PTulevDzACOfYD+BOQU
   Q0MfibugBieVjiQM8CTlxh/oE9x3lxws+d416K6Q+NombNnOfxZl3jNeB
   V9h0p5u2CiG0YisaQ/w2afEZqt15JsHysj7JTweq+Ah1AxAdCgdT03Q85
   qVZBaXuJXwrn8Pj3Tn9hmuEspBZWrlWocHcQBu0NrjXtOmtqA4oE8rXFc
   A==;
X-CSE-ConnectionGUID: gmQzs8yzSi6cfrInDVXtxw==
X-CSE-MsgGUID: zDyb+HtXTUevHsspEdLr7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="144198"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="144198"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 07:51:30 -0700
X-CSE-ConnectionGUID: 1UUS4wm9RJaBlBb7S+qOhg==
X-CSE-MsgGUID: K8/phYZDS5+cOtGjwtLFoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1893123"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 08 Oct 2026 07:51:30 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEpSw-000000005bv-3Ndf;
	Thu, 08 Oct 2026 14:51:26 +0000
Date: Thu, 08 Oct 2026 16:51:04 +0200
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rcu-box 3/3] warning: unused import: `Release`
Message-ID: <202610081654.mVuI8d5Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rcu-box
head:   f1c075753df152d44131ae64530e23ec3193aa60
commit: f1c075753df152d44131ae64530e23ec3193aa60 [3/3] WIP
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20261008/202610081654.mVuI8d5Y-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081654.mVuI8d5Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081654.mVuI8d5Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `Release`
   --> rust/kernel/rxarray.rs:106:29
   |
   106 |     sync::atomic::{Relaxed, Release, Atomic},
   |                             ^^^^^^^
   |
   = note: `#[warn(unused_imports)]` (part of `#[warn(unused)]`) on by default
--
>> warning: variable does not need to be mutable
   --> rust/kernel/rxarray.rs:729:13
   |
   729 |         let mut node = match KBox::new(Self::new(), flags) {
   |             ----^^^^
   |             |
   |             help: remove this `mut`
   |
   = note: `#[warn(unused_mut)]` (part of `#[warn(unused)]`) on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
