Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B713B8BC4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144720; cv=none; b=f42uPUM5oIihYs1q5N8lxOr5cH8xt9ILy8Qnta4Nr1kvR7pM3Q6sswbD4TNuhWOxb1CJKasjJ5v+t01qIo32uUtgesAU3MpRz5xRqXaByTTqLX7SdrjUXBfYo2oPisceoN0ghDrSNxUh8n1ttHZ6JWnEsCX7kWTQvWEyYxraDWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144720; c=relaxed/simple;
	bh=dY0LInwQrpUaRIDBhQuutboTO7m/DVhcoPICej4gdHA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ajH+IRHxKLiDitPCkvy2rukzUP0y2nuDdpAucRcWtRl8WtaMALqkQR7Mn5lDQex/uUuW1kng0ZKV6v6wNttW0obtlApcJKyCcd+5JdnCW5rzm+qKVXTaeJQ9fW/8n09nnXU7O1LOlHH+B+F9Hmhh+R9AUB5wiTOl7bXJ8EhnjuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxbFq3RW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxbFq3RW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778144711; x=1809680711;
  h=date:from:to:cc:subject:message-id;
  bh=dY0LInwQrpUaRIDBhQuutboTO7m/DVhcoPICej4gdHA=;
  b=LxbFq3RWtlJMu0s8/OsBRQoC2jyXJBY7Uq+R6u/s/MEA6Iq0JHd7e5ey
   JbfNqZUbPv68Q6TKz+DY7bkSQfAC3yFoF9tdGmlu/LkQwKIFNgjXXviXF
   YJ0m2zn8WqTN/bnNg3YGDjhttLlFiyRjOvoEWjd/BtiL3P2BiX2i9Q9z7
   7DhiicKt9mpynqahpllQy5RdHYlFr/ImXg9HYs3FZ+/EFIGwPvUxWe9HS
   9vL4weD+WeyO+7XMLUOVxGHrxrrzjMyRsHvE9jEECmo0YK126leXEcxKa
   tyoXZYFz4zFPuiwGib5jp4CTm0BMKNfUqIzX5yYu9jdvZkaBt51yN6Bth
   A==;
X-CSE-ConnectionGUID: VD4i2QYxTnuxa9oViHHwzA==
X-CSE-MsgGUID: 6eJk9eGQRj6CoPv1jOgL0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82934609"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="82934609"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:04:56 -0700
X-CSE-ConnectionGUID: zahW7HOcRee1CjDkupenSQ==
X-CSE-MsgGUID: DdGOBKtZR9ertM+apxW/sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="241390849"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2026 02:04:55 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKuf7-0000000008z-0m6N;
	Thu, 07 May 2026 09:04:53 +0000
Date: Thu, 07 May 2026 17:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ljs:project/cow-context 17/18] mm/page_idle.c:105:18:
 error: 'struct rmap_walk_control' has no member named 'anon_lock'
Message-ID: <202605071710.Q8kPmDYc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: d91a1a12c5871a70ef97dc4725f0ca758f210524 [17/18] HACK, tbh: mm: add pure CoW context mode
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260507/202605071710.Q8kPmDYc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071710.Q8kPmDYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071710.Q8kPmDYc-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_idle.c: In function 'page_idle_clear_pte_refs':
>> mm/page_idle.c:105:18: error: 'struct rmap_walk_control' has no member named 'anon_lock'
     105 |                 .anon_lock = folio_lock_anon_vma_read,
         |                  ^~~~~~~~~
>> mm/page_idle.c:105:30: error: 'folio_lock_anon_vma_read' undeclared (first use in this function)
     105 |                 .anon_lock = folio_lock_anon_vma_read,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_idle.c:105:30: note: each undeclared identifier is reported only once for each function it appears in
--
   mm/damon/ops-common.c: In function 'damon_folio_mkold':
>> mm/damon/ops-common.c:175:18: error: 'struct rmap_walk_control' has no member named 'anon_lock'
     175 |                 .anon_lock = folio_lock_anon_vma_read,
         |                  ^~~~~~~~~
>> mm/damon/ops-common.c:175:30: error: 'folio_lock_anon_vma_read' undeclared (first use in this function)
     175 |                 .anon_lock = folio_lock_anon_vma_read,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/ops-common.c:175:30: note: each undeclared identifier is reported only once for each function it appears in
   mm/damon/ops-common.c: In function 'damon_folio_young':
   mm/damon/ops-common.c:239:18: error: 'struct rmap_walk_control' has no member named 'anon_lock'
     239 |                 .anon_lock = folio_lock_anon_vma_read,
         |                  ^~~~~~~~~
   mm/damon/ops-common.c:239:30: error: 'folio_lock_anon_vma_read' undeclared (first use in this function)
     239 |                 .anon_lock = folio_lock_anon_vma_read,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~


vim +105 mm/page_idle.c

33c3fc71c8cfa3 Vladimir Davydov        2015-09-09   96  
5acc17fd35e627 Kefeng Wang             2022-12-30   97  static void page_idle_clear_pte_refs(struct folio *folio)
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09   98  {
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09   99  	/*
6d4675e6013578 Minchan Kim             2022-05-19  100  	 * Since rwc.try_lock is unused, rwc is effectively immutable, so we
6d4675e6013578 Minchan Kim             2022-05-19  101  	 * can make it static to save some cycles and stack.
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  102  	 */
6d4675e6013578 Minchan Kim             2022-05-19  103  	static struct rmap_walk_control rwc = {
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  104  		.rmap_one = page_idle_clear_pte_refs_one,
2f031c6f042cb8 Matthew Wilcox (Oracle  2022-01-29 @105) 		.anon_lock = folio_lock_anon_vma_read,
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  106  	};
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  107  
4aed23a2f8aaaa Matthew Wilcox (Oracle  2022-01-29  108) 	if (!folio_mapped(folio) || !folio_raw_mapping(folio))
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  109  		return;
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  110  
95b34d66480bbc Lokesh Gidra            2025-09-23  111  	if (!folio_trylock(folio))
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  112  		return;
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  113  
84fbbe21894bb9 Matthew Wilcox (Oracle  2022-01-29  114) 	rmap_walk(folio, &rwc);
4aed23a2f8aaaa Matthew Wilcox (Oracle  2022-01-29  115) 	folio_unlock(folio);
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  116  }
33c3fc71c8cfa3 Vladimir Davydov        2015-09-09  117  

:::::: The code at line 105 was first introduced by commit
:::::: 2f031c6f042cb8a9b221a8b6b80e69de5170f830 mm/rmap: Convert rmap_walk() to take a folio

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
