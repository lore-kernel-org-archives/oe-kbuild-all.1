Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8049311C2A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772008941; cv=none; b=tjoSikhXOwl2VW5rq8yB5lvgtBl9cxi7uUOUa79/iYcWgVZmDs+jhrkLrce9KPNR1TuuMr+3VRmohw61rcqGbOSyR+h/AFz47uHZpos38RAIRdYr1X6N+13JM27e6dtOElqmrC7koZQttiZ9YaYiE3xkljmwf6G0iEHzQ5qsEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772008941; c=relaxed/simple;
	bh=2YJzbhwDCGayBTrjnyRw4Jkb0rw8FiPbyftyRTx2tpc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FnM3ET/V6/DNBkZq+fJZwaLONwmwwWNbmTFicMwC1D9zNPV7S2OqcUFUMHaWyx0UhFnL5/zAJpoPf3/ELcSu3VG1jhe4Madjfb6CJMuNgMywcd2I+SSXM4cuwxtGxmGPV9o2kc9/m5jqy4Ct/Z28f2HnNn1PVnnUlMnJP/WdM8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LixJ4oG4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LixJ4oG4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772008940; x=1803544940;
  h=date:from:to:cc:subject:message-id;
  bh=2YJzbhwDCGayBTrjnyRw4Jkb0rw8FiPbyftyRTx2tpc=;
  b=LixJ4oG4DaLkaBwAL6dAHP757FbnHU+ZwbIyqsKF+Zpb8ODTIh8+hd46
   Tm6KTnH2SY/OuXeoDqsCvefGCxS7C8eHQWrcQFinb4bbNxi79Qx/b3ADz
   XwAMXOwCT3wvs2pGa3QfR/AHsvzYe4h9wMtIyZPXq9LkM6jm/mY7+QEG9
   A8I0UcY5dERqoKoJGoLZMoZJAD7MMa/pk1p9i3giYPKAB+yP2UgfL+jZG
   4ulDBG0JJphGqxCgxJDl4UX/CYa8jclwDdWsmqL3iU1eXE4Dow2kbscsv
   oQEhSZI5+L1fKLe2smhI720sTayM5YkpYl/7VMYDPsKNgvP2t7T3OjXtV
   Q==;
X-CSE-ConnectionGUID: GEKlXKbpR8mQ7BA2/gwufg==
X-CSE-MsgGUID: gTAue9EGTSm8GIFznpBY6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72944946"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="72944946"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 00:42:19 -0800
X-CSE-ConnectionGUID: +d6grE7tRrGqEWWdQVSWzA==
X-CSE-MsgGUID: D6jp67O1RgOkTKHH2l8zYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="239173621"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Feb 2026 00:42:18 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvATH-000000004am-49E1;
	Wed, 25 Feb 2026 08:42:15 +0000
Date: Wed, 25 Feb 2026 16:41:28 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 106/145]
 mm/damon/core.c:3434:(.text.damon_set_region_system_rams_default+0x138):
 undefined reference to `__udivdi3'
Message-ID: <202602251636.PpfZGJU3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   2f2b1e72c03fda4cb12c7027c47840d955d77820
commit: 38a56aedfeccddd0f844633d1b4c55e2e12c4258 [106/145] mm/damon/lru_sort: cover all system rams
config: powerpc-randconfig-001-20260225 (https://download.01.org/0day-ci/archive/20260225/202602251636.PpfZGJU3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602251636.PpfZGJU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251636.PpfZGJU3-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: mm/damon/core.o: in function `damon_find_system_ram_range':
>> mm/damon/core.c:3434:(.text.damon_set_region_system_rams_default+0x138): undefined reference to `__udivdi3'
>> powerpc-linux-ld: mm/damon/core.c:3435:(.text.damon_set_region_system_rams_default+0x164): undefined reference to `__udivdi3'


vim +3434 mm/damon/core.c

39d332af1ac7f3 SeongJae Park 2026-02-04  3425  
39d332af1ac7f3 SeongJae Park 2026-02-04  3426  static bool damon_find_system_ram_range(unsigned long *start,
39d332af1ac7f3 SeongJae Park 2026-02-04  3427  		unsigned long *end, unsigned long addr_unit)
39d332af1ac7f3 SeongJae Park 2026-02-04  3428  {
39d332af1ac7f3 SeongJae Park 2026-02-04  3429  	struct damon_system_ram_range_walk_arg arg = {};
39d332af1ac7f3 SeongJae Park 2026-02-04  3430  
39d332af1ac7f3 SeongJae Park 2026-02-04  3431  	walk_system_ram_res(0, -1, &arg, damon_system_ram_walk_fn);
39d332af1ac7f3 SeongJae Park 2026-02-04  3432  	if (!arg.walked)
39d332af1ac7f3 SeongJae Park 2026-02-04  3433  		return false;
39d332af1ac7f3 SeongJae Park 2026-02-04 @3434  	*start = arg.res.start / addr_unit;
39d332af1ac7f3 SeongJae Park 2026-02-04 @3435  	*end = (arg.res.end + 1) / addr_unit;
39d332af1ac7f3 SeongJae Park 2026-02-04  3436  	return true;
39d332af1ac7f3 SeongJae Park 2026-02-04  3437  }
39d332af1ac7f3 SeongJae Park 2026-02-04  3438  

:::::: The code at line 3434 was first introduced by commit
:::::: 39d332af1ac7f38c3fee619718fa283995e6667c mm/damon/core: implement a function for setting all system rams as the target region

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: SeongJae Park <sj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
