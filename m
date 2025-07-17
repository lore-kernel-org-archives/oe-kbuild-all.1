Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C6E2F6F97
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752767413; cv=none; b=RScoxWjJxC7Y5+zqLsIgdDkgNqkzrNJbaKwJEIxMn5NPb0/H14xYTPLtaVvXqtS4s7aPoJuMpqJlRjaAiO1y38gvWx8rlydWl1Rd9Q3j663KdJztGALMIoB4vuhISxiBuCMqBJiISwqXgCzjIjr574d09uxyI5P3LMSWxYj0gvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752767413; c=relaxed/simple;
	bh=mFN+qt90NTLPVkK0n72bietqKRMIRyf13Q6LEEcHiSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nvH62bD6uwVhX5ZU/3xnqENjRqZ4y+p79qg1b0cwsOGUzSw0WNrceb+z+JXdN5QIn+ePBNaJCAreYE2med90FmA8g3fdU8jJhDxk0L9tkoOStkFEIHhaWi8+DbUBZkQVGey7DHKGVR4K3qe2QOfjkBNpm4STkX9osknkdDsdZHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRMNtUkx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRMNtUkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752767409; x=1784303409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mFN+qt90NTLPVkK0n72bietqKRMIRyf13Q6LEEcHiSw=;
  b=SRMNtUkxthiICg+jGqA/Mf82eyU/9GdL+fxJJs5dEPIuMUa8Rxuwz4x2
   /HO+Ty96e+Mp+Yp2Qm4OchwdcBojFnSkMiz9ggixUkVsQ50+ZngE1FX30
   ZQywfnOqqYZz8Ss6z0N1ap2azO0yfXfT10gGIp4zu/GTWz/h+TSDx4sNK
   im6K6thoXwopj0Mm26x9YZgOOXWPSSu0hEUwr4JupSASApYpjWHaP0ABi
   w6JbM8UQFqQYhclKEOtpDd/mgrq1iKpEMdTff8GLDoRWaiYIPkpYXo74F
   jBfzVSOze4eDemSsk8mAS5lS1YtNe6cqz27m5eCYg0xfeGd4Nb/IFpKaf
   w==;
X-CSE-ConnectionGUID: hldAI8kDSmCg1GJnQPh2RQ==
X-CSE-MsgGUID: KeEUiwb/SDCwDftQIbPJWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54923570"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="54923570"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 08:50:01 -0700
X-CSE-ConnectionGUID: 0ZUu+b8nSHmVCRjcLwhShQ==
X-CSE-MsgGUID: OPvAtDTARsqxX4AcXeekKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="157932194"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2025 08:49:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucQrs-000DmR-2j;
	Thu, 17 Jul 2025 15:49:56 +0000
Date: Thu, 17 Jul 2025 23:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [tip:locking/futex 2/6] kernel/futex/core.c:1748:2-8: WARNING: NULL
 check before some freeing functions is not needed.
Message-ID: <202507172340.xrO8KXQq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/futex
head:   7497e947bc1d3f761b46c2105c8ae37af98add54
commit: 56180dd20c19e5b0fa34822997a9ac66b517e7b3 [2/6] futex: Use RCU-based per-CPU reference counting instead of rcuref_t
config: microblaze-randconfig-r052-20250717 (https://download.01.org/0day-ci/archive/20250717/202507172340.xrO8KXQq-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507172340.xrO8KXQq-lkp@intel.com/

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
