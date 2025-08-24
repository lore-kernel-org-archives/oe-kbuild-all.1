Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CB92B2D7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756033184; cv=none; b=ax5tgz3bJG8iQ/DLAV+r3acgc81F0USRescNoiudKYWPUxTm8ItM5M0RD71ZKbCCsHx3t5WV8am1Eb/vw+PX7bw5sywnzkZZRsRSaId4XmzrDDs3AB/4UhUI47NpRW/zORt4fgJ4QhjjCZX5GNq0bR9LP+z7PIaFPU2o6cZm3iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756033184; c=relaxed/simple;
	bh=F0lWeHRbdG/4Nlqj7hTHDy63+PkTIai8BN9s+1ojUZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oRyEroYyutf0G1G2uLzKl0Qc+r+Uf6RprUWiozYQaQP44mgxf3sas+7nKq5a9IfYeAQ7nflY3afJG7rvUyZaDSYZ8k+fYaOq+kMhtQvH+NGtoD+p3jUCzN0EU2LZ3Ofcr3F/Sm3QCZl8ZDUxuJB3oZ3pnOwkrTKNacTdqrTVwmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjoLZxqS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjoLZxqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756033182; x=1787569182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F0lWeHRbdG/4Nlqj7hTHDy63+PkTIai8BN9s+1ojUZU=;
  b=ZjoLZxqSDQkMkqq8jfMldDCMd+uXfoCgXSXOcNvux8Q15kKiAClI8FPH
   SwhIq5+LD1hLJFN+xadEMG32tB2x73owmz0EjqLnCmOfDQrELKO9M4x8+
   jlc5nDY2ruGN20KIAL02+EYovYN7VSSlUxfiDo4r6LB2+0JeHAXc8rJDY
   tRQo8qAHuOmW6g3czZaPch09j4VbyA72RLU2q7fLY/zhCJEYb2qKsy5nC
   ne9luqZ6ycf+BFH1kliq8AKlIa9utevpcWm3kSAdiqxZCVMfbv4ot4pNm
   GZMa+CCb4C9Cy28sjJsC7lOEg+9zAv8Av6nzY939ktn2MNAL0jfuii4tO
   A==;
X-CSE-ConnectionGUID: Odjx+Lx/Q+mDiPYomYdEGg==
X-CSE-MsgGUID: iDFbS0SgRqSz/FPFXa70KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="45842673"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="45842673"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 03:59:41 -0700
X-CSE-ConnectionGUID: rQRz4ha9QDaP+C9BtzTEHw==
X-CSE-MsgGUID: esxzoi6OQQKNh2gBmJmnqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168577898"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2025 03:59:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq8R4-000MxD-1c;
	Sun, 24 Aug 2025 10:58:57 +0000
Date: Sun, 24 Aug 2025 18:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Quanmin Yan <yanquanmin1@huawei.com>
Subject: [akpm-mm:mm-new 237/249] mm/damon/paddr.c:193: undefined reference
 to `__udivdi3'
Message-ID: <202508241831.EKwdwXZL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   fad61af0eb8692a522c1f75241e36d405249cebd
commit: 9c8b46a2965cff89ee6d5025ab95a83ff1d59826 [237/249] mm/damon/paddr: support addr_unit for DAMOS_PAGEOUT
config: i386-randconfig-052-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241831.EKwdwXZL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241831.EKwdwXZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241831.EKwdwXZL-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/damon/paddr.o: in function `damon_pa_pageout':
>> mm/damon/paddr.c:193: undefined reference to `__udivdi3'


vim +193 mm/damon/paddr.c

   137	
   138	static unsigned long damon_pa_pageout(struct damon_region *r,
   139			unsigned long addr_unit, struct damos *s,
   140			unsigned long *sz_filter_passed)
   141	{
   142		phys_addr_t addr, applied;
   143		LIST_HEAD(folio_list);
   144		bool install_young_filter = true;
   145		struct damos_filter *filter;
   146		struct folio *folio;
   147	
   148		/* check access in page level again by default */
   149		damos_for_each_ops_filter(filter, s) {
   150			if (filter->type == DAMOS_FILTER_TYPE_YOUNG) {
   151				install_young_filter = false;
   152				break;
   153			}
   154		}
   155		if (install_young_filter) {
   156			filter = damos_new_filter(
   157					DAMOS_FILTER_TYPE_YOUNG, true, false);
   158			if (!filter)
   159				return 0;
   160			damos_add_filter(s, filter);
   161		}
   162	
   163		addr = damon_pa_phys_addr(r->ar.start, addr_unit);
   164		while (addr < damon_pa_phys_addr(r->ar.end, addr_unit)) {
   165			folio = damon_get_folio(PHYS_PFN(addr));
   166			if (damon_pa_invalid_damos_folio(folio, s)) {
   167				addr += PAGE_SIZE;
   168				continue;
   169			}
   170	
   171			if (damos_pa_filter_out(s, folio))
   172				goto put_folio;
   173			else
   174				*sz_filter_passed += folio_size(folio) / addr_unit;
   175	
   176			folio_clear_referenced(folio);
   177			folio_test_clear_young(folio);
   178			if (!folio_isolate_lru(folio))
   179				goto put_folio;
   180			if (folio_test_unevictable(folio))
   181				folio_putback_lru(folio);
   182			else
   183				list_add(&folio->lru, &folio_list);
   184	put_folio:
   185			addr += folio_size(folio);
   186			folio_put(folio);
   187		}
   188		if (install_young_filter)
   189			damos_destroy_filter(filter);
   190		applied = reclaim_pages(&folio_list);
   191		cond_resched();
   192		s->last_applied = folio;
 > 193		return applied * PAGE_SIZE / addr_unit;
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
