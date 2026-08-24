Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76358372B3D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 02:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538840; cv=none; b=SydlTgLLJJZYr+kzuchQ7cKORjdevnKGqgWsEOHgskskSfecaEMJ8RnsJ15LqycfqUBCZySvVexm8+UPO++G4XNudNpuB22JnDc2h5YFkdxHO17TjjlbJuwI+5mZrHYhnUeAQpZjv4fyekRbwQMtH36MQMuvgBtvcMWI6mA3P5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538840; c=relaxed/simple;
	bh=kkqMHZwkeJ50Q0o3CmqXBQn39e60yGmd/fzJwVS6Pkk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KPqUiNEn3JfDsmXGCxpsaqkOWOQK3H1heVDRwoMIMI55MEhUdIQBliKhO96GP1mnTg9l9rfLvmKD3ebRTXmsPUyjdYYP8Zv1DkN9MWWWYzSVffpZIYqrAj0JpyO3AbGQ40T8B2bEQtOolpw1TUCyqqr/j2yHV5/YPrroPAhk90Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYWX7zDF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYWX7zDF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787538834; x=1819074834;
  h=date:from:to:cc:subject:message-id;
  bh=kkqMHZwkeJ50Q0o3CmqXBQn39e60yGmd/fzJwVS6Pkk=;
  b=VYWX7zDFoqhwFGEi4ffhWHM+WyzV/SospfsPJznTr0Fhf7WQsJe/n8xl
   2i7yHNNcZc8/XbSKnRAVAp0SdOlYNq79HoPJGIoDyzfFGVC4gEgqE46Xz
   5Po5q99xHbsJp7SE2tAyqo1zELeSlDPfMiqHsxdjHhWizJgeAZ75atG0n
   xvvTHBguTdBsti/YSdVec4j0VZ48oVfoUeRRFrE76SZ3o8HqKbkavQOIe
   WWznxAGCUGZRL6Z6XLUwkGwynm0x0s/w+rHI/NGsorgCKbTmZUEsc5YYF
   /THjdBua/NPj+ZesDivJ582tKdyoC48gZy7CLBS/3yi+ZLHznP12T0p8i
   w==;
X-CSE-ConnectionGUID: 9ZZxxpqFQTK0tuKls+sMHg==
X-CSE-MsgGUID: W1UjCERCT9ChfHo9auWjVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87996923"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="87996923"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 19:33:49 -0700
X-CSE-ConnectionGUID: 4LbEVxd4SeGuLlPTADWc4w==
X-CSE-MsgGUID: 6up1hFvTRs6/bVe/EvkALg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="266346741"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 23 Aug 2026 19:33:48 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyKVO-000000000Ch-24K9;
	Mon, 24 Aug 2026 02:33:46 +0000
Date: Mon, 24 Aug 2026 04:33:36 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 30/79] warning: reference as raw
 pointer
Message-ID: <202608240442.bCCNt6I5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e793b14f66e33b70363166d84886d82d462f1987
commit: 1dd83f8f25741b6844488bf0aec201b88d453c3b [30/79] rust: alloc: vec: Import .drain() / Drain from rust library
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260824/202608240442.bCCNt6I5-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240442.bCCNt6I5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240442.bCCNt6I5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: reference as raw pointer
   --> rust/kernel/alloc/kvec/drain.rs:90:43
   |
   90 |             .map(|elt| unsafe { ptr::read(elt as *const _) })
   |                                           ^^^^^^^^^^^^^^^ help: try: `core::ptr::from_ref(elt)`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#ref_as_ptr
   = note: requested on the command line with `-W clippy::ref-as-ptr`
--
>> warning: reference as raw pointer
   --> rust/kernel/alloc/kvec/drain.rs:104:43
   |
   104 |             .map(|elt| unsafe { ptr::read(elt as *const _) })
   |                                           ^^^^^^^^^^^^^^^ help: try: `core::ptr::from_ref(elt)`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#ref_as_ptr
--
>> warning: unresolved link to `mem::forget`
   --> rust/kernel/alloc/kvec.rs:795:11
   |
   795 |     /// [`mem::forget`], for example), the vector may have lost and leaked
   |           ^^^^^^^^^^^ no item named `mem` in scope
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
