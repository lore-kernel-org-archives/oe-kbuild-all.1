Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C1A2B9A4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 05:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780549312; cv=none; b=lOn6tOLKlgsWtKdOqXl5TZ1Sv9S1XfcYK+W3tQ5k5wg4nYub9J+OCNuXVxwmb75NGA6rUR6dSTJ2H8dDO0zYikW1vDxlkIrB5HueElPJAKRNR6847RHjQc2gk5ss8nH66M6LYsHsX+3Nk230rMfrtk1EWG5K/PU2EWW0qNc5v4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780549312; c=relaxed/simple;
	bh=pk1zm1dbYZMmElgdN+o9kcCOmFLLWRXdNsEzQGJGOmQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T3uM3g2+u24vLUSezVZzR8sEmvjh3pmGfvZomuIT2VCc5bYIuvpiOvv5/OlGnpQE4jOZz5LXpQqCFmIExPonIOq+5z/WI+KPOPZPwPE1YJBLRM3EFboTvsHZNokqceM+VSP70MLiO6D4RDUIaM49wtdnjEGRnEtj5qamqEgaYw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXUUctMV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXUUctMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780549312; x=1812085312;
  h=date:from:to:cc:subject:message-id;
  bh=pk1zm1dbYZMmElgdN+o9kcCOmFLLWRXdNsEzQGJGOmQ=;
  b=RXUUctMVKWglExw1ibBrT6oChrUBn5muJuluOs0IfWq1R+anVnW5iJiG
   akng1gt2Q+YNqIFrpTeS7Z2dldd00SHmbDzxGl3vyysrGaHuuRzKuUQ4h
   iYboBVDoEea4jZ+TYcRU2sNYpQxLet0MFS6cqTyCKnSTBfFYHICZIUWqc
   ChnW3Zye4nsB82rIWtrtDddX0Th08Zbe/rw9FuLwfkRY4O6LSVUbrZZkZ
   1Zsc2YbdXoDttb6eKqHMplC5daMGUHO8DSySUsXjFWg/bX9LOaPsu/OTM
   yGCTWiQgcN2LJwHIiby6CHkGfZmLn0O9dr34of38c1J9W7jbuix3uIhmy
   g==;
X-CSE-ConnectionGUID: grr7jIV+SAWzbaMV8OB03Q==
X-CSE-MsgGUID: g0lR7dpVTEuDNLBKh2hHOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92854815"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="92854815"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 22:01:51 -0700
X-CSE-ConnectionGUID: kw/w2K9lQXqcXzsfUCqAlQ==
X-CSE-MsgGUID: CLk/yXsTTNqISMn/i4HvLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="244560544"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jun 2026 22:01:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV0DC-00000000EIg-0Qzi;
	Thu, 04 Jun 2026 05:01:46 +0000
Date: Thu, 04 Jun 2026 13:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: kernel/futex/core.c:1748:2-8: WARNING: NULL check before
 some freeing functions is not needed.
Message-ID: <202606041210.9DhsM1Gk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: 56180dd20c19e5b0fa34822997a9ac66b517e7b3 futex: Use RCU-based per-CPU reference counting instead of rcuref_t
date:   11 months ago
config: arm64-randconfig-r052-20260604 (https://download.01.org/0day-ci/archive/20260604/202606041210.9DhsM1Gk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 56180dd20c19 ("futex: Use RCU-based per-CPU reference counting instead of rcuref_t")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606041210.9DhsM1Gk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/futex/core.c:1748:2-8: WARNING: NULL check before some freeing functions is not needed.

vim +1748 kernel/futex/core.c

56180dd20c19e5 Peter Zijlstra            2025-07-10  1739  
80367ad01d93ac Sebastian Andrzej Siewior 2025-04-16  1740  void futex_hash_free(struct mm_struct *mm)
80367ad01d93ac Sebastian Andrzej Siewior 2025-04-16  1741  {
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16  1742  	struct futex_private_hash *fph;
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16  1743  
56180dd20c19e5 Peter Zijlstra            2025-07-10  1744  	free_percpu(mm->futex_ref);
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16  1745  	kvfree(mm->futex_phash_new);
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16  1746  	fph = rcu_dereference_raw(mm->futex_phash);
56180dd20c19e5 Peter Zijlstra            2025-07-10  1747  	if (fph)
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16 @1748  		kvfree(fph);
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16  1749  }
bd54df5ea7cada Sebastian Andrzej Siewior 2025-04-16  1750  

:::::: The code at line 1748 was first introduced by commit
:::::: bd54df5ea7cadac520e346d5f0fe5d58e635b6ba futex: Allow to resize the private local hash

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
