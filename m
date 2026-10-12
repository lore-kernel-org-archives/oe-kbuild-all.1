Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012422264B0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842339; cv=none; b=reqSqB4LW8y+ZvUP0zsEso3BLFvf+uQXmrF1thqJOq9465M/oHOtuAPMc2qLgpOtXQMyNkPOaB/yW2TlPrIhdr6OkUngZdg32TZfXBjEU26NQvHN/wylNcxUixYAun1C+gSnzeZ4B9ZZ3/TBoeOmR1kvezFnyXQEzL+SUIHjzy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842339; c=relaxed/simple;
	bh=IkmH/GweSTEQn5m9vu5zOz/Voll0dsn7opyQdZkqjo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F2GYau2ysgDJDMy9bdy6dlObJHxz1qKQbBFGH0THOaNPWqt3GTEe5Csm48qq9KYW+IOTC7nLPUEvk7xETkWK3vEB6BvKlgb149eGCbBpyyraA5VreqUpgtu37I98F6zlCv5epsDUuojGuZ6sHym7KaDnlkwhLtWFLeck2mrLr3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZuU6bRe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZuU6bRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791842338; x=1823378338;
  h=date:from:to:cc:subject:message-id;
  bh=IkmH/GweSTEQn5m9vu5zOz/Voll0dsn7opyQdZkqjo4=;
  b=aZuU6bReuFVzMGCh+FUvKt1wyZ8nk0AuJGbQnW2bUEDimK7l3s+2i+Ck
   ByKe8g02dd7YbHa/sHdcLXV1szyES/0DR2xi5d6+Cn1tteWYyZxomLAZI
   Ki/UR18+5i9tMkHNjGxbkVEWpl6VrHbmx2qd8mvqJUQ0BzDu5eemtImYB
   7jSvZypnJcnVRkYw/OIPgmCAovzUhMx3yS2l8SJMIYMumv1wpNlfyU1RB
   e9Zu9j/RzTzQwV2qqRn1GIL3VOrOI1ZkMcGFpeMHrY0xGUjoybuGVpHr4
   cJEBXbIC3rA5lFSrr/JpUi8rUwJNVa8S19At4MS+bQsm6z85PSlf7/Xmu
   g==;
X-CSE-ConnectionGUID: +F/dvYZJSM2bwhaf1kqF1A==
X-CSE-MsgGUID: 1IY8iJSQTaCfIP1Wy8y2Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="569297"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="569297"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:58:58 -0700
X-CSE-ConnectionGUID: AmlbbybXR5qmNPh54aDSlA==
X-CSE-MsgGUID: EuPw4ySBSt2RVpVP8bm5yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1008941"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 Oct 2026 14:58:56 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGO2o-00000000AD1-0sWT;
	Mon, 12 Oct 2026 21:58:54 +0000
Date: Mon, 12 Oct 2026 23:58:24 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rxe-rust-v1 59/88] warning: casting to the same
 type is unnecessary (`usize` -> `usize`)
Message-ID: <202610122328.VelgjrRL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   fe52737deab42b438e356282106b9418915da058
commit: ed890b3e682f3d63fa94f23c99b3adbf20c98ff5 [59/88] rust: rdma: Guard CPU access to on-demand user memory
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261012/202610122328.VelgjrRL-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610122328.VelgjrRL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610122328.VelgjrRL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: casting to the same type is unnecessary (`usize` -> `usize`)
   --> rust/kernel/rdma/odp.rs:25:22
   |
   25 | const VALID: usize = bindings::hmm_pfn_flags_HMM_PFN_VALID as usize;
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::hmm_pfn_flags_HMM_PFN_VALID`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
   = note: `-W clippy::unnecessary-cast` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::unnecessary_cast)]`
--
>> warning: casting to the same type is unnecessary (`usize` -> `usize`)
   --> rust/kernel/rdma/odp.rs:26:22
   |
   26 | const WRITE: usize = bindings::hmm_pfn_flags_HMM_PFN_WRITE as usize;
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::hmm_pfn_flags_HMM_PFN_WRITE`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
