Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E71DDE9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 19:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742067775; cv=none; b=J643aO3dBFXnM05OgRZ2CW8yQ6WyycOw/W5mWx6fx5qNykD2aoc85Z558vNcqGJKMtbKkNouyX9SaBw21DKqI6PbuuzzcNfXRySA/gKsNsFrBF+HcNVwlOwijDZmlaNl5+7vuqvgUHDhSi40Q7UDwg8zEwsYW2Xp347VCFg1AqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742067775; c=relaxed/simple;
	bh=V8w6+bbb4mGXZDj9EE6RqzMt73ftsOPdl0+TNH6/Qrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLDqVMsjcVjtXSlYEt1orxbn51zA0Z0qa4UAr3add4WXTThSrAk64ZGfvSUauRMAs0CEX6xsyBzZtOhDpGDCQHVC7MfkXXaefOGPyUTCRN9ukc7t09EbKpWVnx3fYWiZH1bUd1hD2K2yyzVweuNaRqMG20fxHEMW2WHlYeiaGBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVsBRpm4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVsBRpm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742067773; x=1773603773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V8w6+bbb4mGXZDj9EE6RqzMt73ftsOPdl0+TNH6/Qrk=;
  b=nVsBRpm4kXYO9StbOG307Zg+wMnxgl9PaJxlI0axV0bzxnUWpLlpHfc/
   o2QkODnHauzESWdLnjTYUH/v5RJCZ4GRSd0wsnYZFVTSN/tfT1Plt5yik
   5z3MRjv9zc48bHp0c2QIW1SmloUh2xE4qfs4g6ViH8oiCkmN25C+NS18q
   CUiEvepvn7L18QSaY7u0kinJYnkBS/HlscSECohmyfEU8UK85z5OPUg63
   wO/eBm+qw9Eb3AjM3m3d2EMo0yMTu6IwLGYVlWDhmU3G3NqPJs06Zjy8y
   /0k+kGOKI4yPsWYkqs6uZ//P6pkDPeEwFDr0kx/N9T8rrGKKrI/T6JiA2
   w==;
X-CSE-ConnectionGUID: 1bQpSe3yQXa1GX+tTaixaA==
X-CSE-MsgGUID: bxJKFrf0R6OJ9iJa2L+U4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="65663104"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="65663104"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 12:42:50 -0700
X-CSE-ConnectionGUID: AoNAofzwRYiY8dgAQxMMnQ==
X-CSE-MsgGUID: j/aXgeuoQ72UNpayobxWeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="122065476"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Mar 2025 12:42:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttXPC-000Bbn-1N;
	Sat, 15 Mar 2025 19:42:46 +0000
Date: Sun, 16 Mar 2025 03:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:res-lock-v4 17/25] kernel/bpf/rqspinlock.c:100:39:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202503160343.3uVjlMdk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kumar,

First bad commit (maybe != root cause):

tree:   https://github.com/kkdwivedi/linux res-lock-v4
head:   899336fd553b7b1c285936a76027e305a2f7e58f
commit: 78b8828eae603e326faa2784533ab560ff3979ce [17/25] rqspinlock: Add entry to Makefile, MAINTAINERS
config: alpha-randconfig-r112-20250316 (https://download.01.org/0day-ci/archive/20250316/202503160343.3uVjlMdk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250316/202503160343.3uVjlMdk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503160343.3uVjlMdk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/rqspinlock.c:100:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:100:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:100:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:122:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:122:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:122:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:135:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:135:51: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:135:51: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:205:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:205:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:205:39: sparse:     got struct rqspinlock_held *

vim +100 kernel/bpf/rqspinlock.c

99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18   96  
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18   97  static noinline int check_deadlock_AA(rqspinlock_t *lock, u32 mask,
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18   98  				      struct rqspinlock_timeout *ts)
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18   99  {
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18 @100  	struct rqspinlock_held *rqh = this_cpu_ptr(&rqspinlock_held_locks);
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  101  	int cnt = min(RES_NR_HELD, rqh->cnt);
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  102  
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  103  	/*
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  104  	 * Return an error if we hold the lock we are attempting to acquire.
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  105  	 * We'll iterate over max 32 locks; no need to do is_lock_released.
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  106  	 */
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  107  	for (int i = 0; i < cnt - 1; i++) {
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  108  		if (rqh->locks[i] == lock)
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  109  			return -EDEADLK;
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  110  	}
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  111  	return 0;
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  112  }
99912729e50455f Kumar Kartikeya Dwivedi 2024-11-18  113  

:::::: The code at line 100 was first introduced by commit
:::::: 99912729e50455f6606bff1dcf3360686477ecae rqspinlock: Add deadlock detection and recovery

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
