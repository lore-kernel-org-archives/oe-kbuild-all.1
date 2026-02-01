Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E4826CE05
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769964000; cv=none; b=cYvGZgfbjojJhEftQBrCsFg7pqCkAEcHw6DH73B5lgsSzEQjFALYER+TM94jJ9cPe/ENiezxE2A+qCpxwUF3ye7vCaEc+CNNhldETO7gSrYimVmrCMndnuT4HBLfUYEj6kqzHHbCvZdCG7hOWBiGrnssv1Q4ndmEI4XP1hC3s1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769964000; c=relaxed/simple;
	bh=3HTb0YPDd65e572M5YmxiZECIbQIMv7TSMohnUqkbM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p+TDFZxk2zD+SvNu8+YSYiyVjHHbrAdDsVAo6I3wmjNJxUl+xNpQwXcyMmaXrd8Uw9yO4KqcLT/3c80bzyyj+s60rmr+fec5fCD18UsyKSh/1kR3hc+YoXA7kadXzPxfhzJBlRUJ+wl33k1bROoewSfljdSTxlBhHlHzt24GkvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UV6jwvvY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UV6jwvvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769963998; x=1801499998;
  h=date:from:to:cc:subject:message-id;
  bh=3HTb0YPDd65e572M5YmxiZECIbQIMv7TSMohnUqkbM8=;
  b=UV6jwvvY563O3HiuzVSLGlmG5g9/m33cxHzyuu9lSpHeKuqUtgeSL2Cv
   Hq4p8xwCuhdUYTXi26zFksPS72PnvQJo+7TdLvSrVGeZjoS/cMni3Witx
   3KM0usZoFcvtOIXBXb8LqVjti21o49Hg61NrA90TKskNhOHTQkrncv4N/
   bvmzuizhVak4BmkhMWLtEBZ+f3ybE1wLGKV3ViDxbJKbIqGH9TJmbQX0g
   hVXV5jjnhyBwUy6W6MVMTdV9A+8sX2+wXMbCC5uTzARvWTpiepUQKzDWs
   pEe+GnrAYo9UAo1w8eDw/lSDGN9W8V9f3PxU5p4psmyWK397eqbElqJMC
   w==;
X-CSE-ConnectionGUID: Vv2vfhjRSN+gOdDUDY7Ufw==
X-CSE-MsgGUID: Y8CSIA7HTPinNRjQ4hkBFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="70343141"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="70343141"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 08:39:57 -0800
X-CSE-ConnectionGUID: GIcSVop5Rbi6+5w/RtvL9g==
X-CSE-MsgGUID: XLusxyhoSjKR3/R9jOn4rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="213400079"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Feb 2026 08:39:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmaUL-00000000erc-3R7y;
	Sun, 01 Feb 2026 16:39:53 +0000
Date: Mon, 02 Feb 2026 00:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: kernel/futex/core.c:1748:2-8: WARNING: NULL check before
 some freeing functions is not needed.
Message-ID: <202602020051.j6qD61S7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   162b42445b585cd89f45475848845db353539605
commit: 56180dd20c19e5b0fa34822997a9ac66b517e7b3 futex: Use RCU-based per-CPU reference counting instead of rcuref_t
date:   7 months ago
config: x86_64-randconfig-r061-20260201 (https://download.01.org/0day-ci/archive/20260202/202602020051.j6qD61S7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020051.j6qD61S7-lkp@intel.com/

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
