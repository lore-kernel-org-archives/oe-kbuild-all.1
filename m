Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00123D7D81
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 19:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294917; cv=none; b=lChfhpBba3jKU90QpHu7DvNgTDg2hOCdl+cEyCl1I3rTYKtWrPfGC+bRdPca7wn8vP7JQsopA++lQDQRaXTOifHPJP8EXwNw6axPl2S/RpJrx1IHuFqc4BFoQWN0GhUKutiJjaonR4mrundULtRIzVFeyVBvVZAb+hSRaz6ajvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294917; c=relaxed/simple;
	bh=Fv1htHQ4ZsAobIwv6JlD0dv3hsiPfJjskUQgouy4biI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sso/a3EaNZHuxMAHHGUWpcQOnBV/pKCWpTiIAIMhLutJG6FW2aN4CZnXqqLgh67lr5Ko1fEZtMTlbJ1CPV9vrMYEjxAm+o9YPxKizshw1AXEIhu92PuacSP9LXehxIfdXH3NkDSSFFlIgcyYKFpGoHX9tVukkv/tsx7oI46bMUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgB+BW0s; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgB+BW0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774294916; x=1805830916;
  h=date:from:to:cc:subject:message-id;
  bh=Fv1htHQ4ZsAobIwv6JlD0dv3hsiPfJjskUQgouy4biI=;
  b=kgB+BW0sblU1CL5hpRYUN1PLqmCPXIX9SB/HOfVsR2sLVFq3kc17ulZd
   iQyqgFFWWnaqNDVjqLG1ZV2Cl3yyQf0VQ7WKOQP6REJLH7kvctjmIljkt
   AtQNJ392LHAxY02K0WxAP+iKcpgiZyeza+7mxIF26nKxXSfGwmT2upCr6
   jdKWktArT6TmBiIPQ3Gp6WnYM4T2KuIeK9CjW+i1jEuBdDMxZF1eYSxZ/
   xsrbTPDF1wq6O6r1Zi7Waqx8tgIQsfYmb17L88+x2uR6uTIm8QcFjQkZN
   eefyl8Yq4BotY+tuITDUAPybjP1rprrS1Lqdo5t88BKxGt/VGAvsE8FFK
   A==;
X-CSE-ConnectionGUID: HRCft0AtSqOn/Ig8ZYyYAw==
X-CSE-MsgGUID: OWrVL10zS7OuaYJMRN3URQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="97922559"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="97922559"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 12:41:53 -0700
X-CSE-ConnectionGUID: yawJpuHFTC+TyARnYQ0nWw==
X-CSE-MsgGUID: 6wstae1yTTyn4OyrRH1NOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="221272997"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Mar 2026 12:41:52 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4l9p-0000000037x-0yjw;
	Mon, 23 Mar 2026 19:41:49 +0000
Date: Tue, 24 Mar 2026 03:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: kernel/futex/core.c:1748:2-8: WARNING: NULL check before
 some freeing functions is not needed.
Message-ID: <202603240307.SkGfaRsG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 56180dd20c19e5b0fa34822997a9ac66b517e7b3 futex: Use RCU-based per-CPU reference counting instead of rcuref_t
date:   9 months ago
config: s390-randconfig-r051-20260323 (https://download.01.org/0day-ci/archive/20260324/202603240307.SkGfaRsG-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240307.SkGfaRsG-lkp@intel.com/

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
