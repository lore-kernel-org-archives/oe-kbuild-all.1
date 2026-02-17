Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27111DE3B5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 06:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310327; cv=none; b=eC3EDVNJYf4iyJ4SnTM5wOJqse9b9S+UrKvIfDWzhD1LEx87whAzWCS1bU7ARxgF+ow3bmAww1eJ2K44HjQK57m6D/H7zhBrqqbtK1I8Gu+RCRZBSYhFh0EBLtBxhrdDr4BL1dSocBxCX9DY0udLGXqF3sOxpaU3xMx1Fx5flkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310327; c=relaxed/simple;
	bh=aPglJELL5lcoqhc9l9NN09EQXfpfdEGJoBTTgG93DPc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uxsDFZ0CQFTm7g1RFcdCnDLTlDRrUflyJrD+oCWOECsWuhVyklqzccGtySCgnBDe/xFJwE/kudmvNwf0MkUv/Tjk6ZtT/tvrPq9TLLusVuC5fJy3ayL77EShR5WSaYZJLE0VD3rCUZ1NuqcriiErRKV6kMwAGh+r750HK/u/a0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gu71wH38; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gu71wH38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771310326; x=1802846326;
  h=date:from:to:cc:subject:message-id;
  bh=aPglJELL5lcoqhc9l9NN09EQXfpfdEGJoBTTgG93DPc=;
  b=Gu71wH38H6ePdt/xI7SblR+LIaDCt+wlJ9Tw8oc2moh+AP2fo8KXOyhu
   bYwCBQPbeLQIRI5Fxd7yhkPYoNq/wcHZO2DeWp1wiTi+lGzRAkNLpmgH3
   u8ODrFzhr5WCMLI/umtutvCuLOZQPnpDbrFqtQ9pNgPoD5l+0Zgd8Qe1D
   KdyNdwYhdimXYLm0lvqmsomVy2yvzYV8hMU5nqTSaDpMdbj+PXKYeQHly
   GOM1JkDpHB9gaXJWtwT/BQWNc3zwXpE5VYkAwTBJ8+3aEiA8h+n/Hbtaf
   TeMe8xEOosg5uWGp+mewSsEoWwr71YULWTpZemLU+hGZbpMLi9kPQ+GDO
   w==;
X-CSE-ConnectionGUID: w55KOaNVQhmDgfqjKQA2MA==
X-CSE-MsgGUID: XPKj6eQ7Q6OHhjCFcECMbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89789167"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="89789167"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 22:38:46 -0800
X-CSE-ConnectionGUID: Ae3PEd11RPCsoFvgFvuE4Q==
X-CSE-MsgGUID: TfAqeLu2TNSXvxWq2C6s5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="213808228"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 16 Feb 2026 22:38:44 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsEjK-000000002p7-01Xt;
	Tue, 17 Feb 2026 06:38:42 +0000
Date: Tue, 17 Feb 2026 07:38:35 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 36/36] kernel/sched/core.c:882:13:
 warning: 'hrtick_clear' defined but not used
Message-ID: <202602170756.E5wsrBDa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   b4fb5671d1c3610e5afbae296e258f8f5cd9d512
commit: b4fb5671d1c3610e5afbae296e258f8f5cd9d512 [36/36] sched: Optimize hrtimer handling
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260217/202602170756.E5wsrBDa-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170756.E5wsrBDa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170756.E5wsrBDa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:882:13: warning: 'hrtick_clear' defined but not used [-Wunused-function]
     882 | static void hrtick_clear(struct rq *rq)
         |             ^~~~~~~~~~~~


vim +/hrtick_clear +882 kernel/sched/core.c

b4fb5671d1c361 kernel/sched/core.c Thomas Gleixner 2026-02-05  881  
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra  2008-01-25 @882  static void hrtick_clear(struct rq *rq)
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra  2008-01-25  883  {
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra  2008-01-25  884  	if (hrtimer_active(&rq->hrtick_timer))
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra  2008-01-25  885  		hrtimer_cancel(&rq->hrtick_timer);
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra  2008-01-25  886  }
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra  2008-01-25  887  

:::::: The code at line 882 was first introduced by commit
:::::: 8f4d37ec073c17e2d4aa8851df5837d798606d6f sched: high-res preemption tick

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
