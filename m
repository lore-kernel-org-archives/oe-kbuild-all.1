Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E89B30B532
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768223920; cv=none; b=cmR8kVO/IPigE1adgkF8yUhH87yuJ4Gnmw2PVcoltpVDE50PUx7yOFG4XiIgr58we/H/+PaN6/CQmjEwXneQf9Q4puCIkAGknNNNhd/RkDleHF/f2lOuG2Nb4cEb1CQIs6WQ3F5lrtRbegdK6YKpq+CpB55lC//N+ORaWSL8saY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768223920; c=relaxed/simple;
	bh=EjoJyxNIQK4mBpuGRFHAi+Inq0Q7/ACGxbtaU8o/goE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AZZQRfnzZKHafwIYpiq0eANpj+EWLth/8dTtenWAo11fToj9CvmyAxOx0Xd0FxBXh2gJF4QekeUigL6/sfStG7pMw9oxUlZAhlKDHNihlQVHOmfOr3rxs+d5SeO4Fxlc+ggCxLXNjuVtW8EKilgf2KdW/Bm5/BVP5wJcjSDgvg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpEt5Yh3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpEt5Yh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768223918; x=1799759918;
  h=date:from:to:cc:subject:message-id;
  bh=EjoJyxNIQK4mBpuGRFHAi+Inq0Q7/ACGxbtaU8o/goE=;
  b=SpEt5Yh3TiC7Qaer2QNbiB2etUGuQNEdtTuHwBrELYNkh0EbtLTD7Kj9
   SWIwEgPSzSKucRbkFX7PIs6zaVLl4E7BJdQDLURfh/O4q8mj/Op1YzZzO
   9cr7o935KQnL6jHTg8+ye19PP6sIDUCvnWAK+jQVJTUCNWTR0QUH4mnns
   kbNRFL5el+kAofhSuaxwxrQDQBHhhghrip7jKwbWWk+g9hlqSbbY98BYX
   IphECLIg3CYNUAAT7TXQEIvBViGp02Yvbw59oY7jbKReAPlQxFptpWXrp
   ujjoM03ugHrC5BRI9gJV3LWLIVqgcZ5TnaOl+OpJ8qp04slQ11xlGbqUG
   w==;
X-CSE-ConnectionGUID: fIjqFT3CRduiI9HLlN53tQ==
X-CSE-MsgGUID: XWyG7TBkQ6ickkHKNkksLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69394508"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69394508"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:18:38 -0800
X-CSE-ConnectionGUID: 2B3ozXlTTZaj30xtAWw+HQ==
X-CSE-MsgGUID: 6UAh9vrqR/u0GUup0Idchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204169545"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 12 Jan 2026 05:18:37 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfHoX-000000000u9-3tUx;
	Mon, 12 Jan 2026 13:18:33 +0000
Date: Mon, 12 Jan 2026 14:17:34 +0100
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 13/15]
 kernel/sched/cputime.c:481:72: error: implicit declaration of function
 'vtime_enabled_this_cpu'; did you mean 'vtime_generic_enabled_this_cpu'?
Message-ID: <202601121404.067laRIW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   dbfc29e2be8d36d0159dc4337c7362bf51c8da9f
commit: 68fe31b4f141a343ee788815606d24da6609cb86 [13/15] sched/cputime: Handle idle irqtime gracefully
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260112/202601121404.067laRIW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121404.067laRIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601121404.067laRIW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:57:
   kernel/sched/cputime.c: In function 'kcpustat_irq_enter':
>> kernel/sched/cputime.c:481:72: error: implicit declaration of function 'vtime_enabled_this_cpu'; did you mean 'vtime_generic_enabled_this_cpu'? [-Wimplicit-function-declaration]
     481 |         if (!vtime_generic_enabled_this_cpu() && (irqtime_enabled() || vtime_enabled_this_cpu()))
         |                                                                        ^~~~~~~~~~~~~~~~~~~~~~
         |                                                                        vtime_generic_enabled_this_cpu


vim +481 kernel/sched/cputime.c

   476	
   477	void kcpustat_irq_enter(ktime_t now)
   478	{
   479		struct kernel_cpustat *kc = kcpustat_this_cpu;
   480	
 > 481		if (!vtime_generic_enabled_this_cpu() && (irqtime_enabled() || vtime_enabled_this_cpu()))
   482			kcpustat_idle_stop(kc, now);
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
