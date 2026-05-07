Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC13F3BA249
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144713; cv=none; b=UHyEYIQCC7Zm4xS8gHeRQJqsJsx0vwrfao+OR44dOp5rh3o4zguM5ONzuI1aLjF0piNzFuBmnqtR75MR/OHvkJZ63LJhA9yzhLghTbryPaSno4iwVSHrHMO3AOI5YM2UrraNOUFEkzNgrP6JcyTlURxPRN0VNHJjMk/eqEMSWz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144713; c=relaxed/simple;
	bh=Kl2UGv1ckwIvjHm1Eee8kFv5WZ7GTxztCsKoOgyl7Gs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TkzG3IVFuXYJ5jo9EIRehX6rr/0LXxr19ENw0SbvZ6wcgQryJAB7RT8KUFn57HanQrS8hY42zXfynBGQl4IhbgpqIn8z0G3hzEdAucsT7ZLWsBKHb7l3YDVchmOTm2gKo01k6TTFoT07VyZsmVuwxd1vRiTOkWABYeix7ldNgKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpqjk/0t; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpqjk/0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778144709; x=1809680709;
  h=date:from:to:cc:subject:message-id;
  bh=Kl2UGv1ckwIvjHm1Eee8kFv5WZ7GTxztCsKoOgyl7Gs=;
  b=dpqjk/0tn9UReRcSBM9cXhqD+Jb8uK9NF5g1APt0ufmrw1VE7GE3+X3G
   LlCy7WonM6MZ5mx09nVjx0N8RrV7zCXn4mleo8xBk3C/7FkIVNKgSN7PV
   rzjfwVD1/6JdW3TtFBYT92aoEB8ozhrXu3BAeRA7kYZ0jycmDh0UC5xH7
   Dc4fUkTq9IP23/rC2qtNOC81RFAi+ixOtJnD+VOBJhS7ecG13k2gnJIJ5
   q9/idmzEUBiDNyQFwD/hCST2EluC5tO4vekxCYAdA3z0IPLG2VFyJSs4Y
   bD0jZgY6I6k05rP+oWklkb/TOfPQQZLFYJXPJ5wk7giNYJPgPmeMRpnLF
   A==;
X-CSE-ConnectionGUID: 1plkI3Q/QJGkFxeIrFdwGQ==
X-CSE-MsgGUID: mMBUhue1S1ugAxk3wZx/LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82934607"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="82934607"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:04:56 -0700
X-CSE-ConnectionGUID: 0H3NHlC1QP6GSBAGsvWY/A==
X-CSE-MsgGUID: LBn453aITR2SvOs3FabGtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="241390847"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2026 02:04:55 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKuf6-0000000008v-3tui;
	Thu, 07 May 2026 09:04:52 +0000
Date: Thu, 07 May 2026 17:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 20/20] mm/slub.c:1904:1:
 warning: label 'find' defined but not used
Message-ID: <202605071631.wxUH8RVo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7869ad90f786f903dadc68707ecf94fd3e89b98c
commit: 0763da468566b4d9761378a01f42a36aa984d5d0 [20/20] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260507/202605071631.wxUH8RVo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071631.wxUH8RVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071631.wxUH8RVo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/slub.c: In function 'alloc_slab_page':
>> mm/slub.c:1904:1: warning: label 'find' defined but not used [-Wunused-label]
    1904 | find:
         | ^~~~
>> mm/slub.c:1874:13: warning: unused variable 'nid' [-Wunused-variable]
    1874 |         int nid;
         |             ^~~
>> mm/slub.c:1872:29: warning: unused variable 't' [-Wunused-variable]
    1872 |         struct slab *slab, *t;
         |                             ^


vim +/find +1904 mm/slub.c

  1864	
  1865	/*
  1866	 * Slab allocation and freeing
  1867	 */
  1868	static inline struct slab *alloc_slab_page(struct kmem_cache *s,
  1869			gfp_t flags, int node, struct kmem_cache_order_objects oo)
  1870	{
  1871		struct folio *folio;
> 1872		struct slab *slab, *t;
  1873		unsigned int order = oo_order(oo);
> 1874		int nid;
  1875	
  1876		flags |= __GFP_NOKFENCE;
  1877	
  1878	#ifdef CONFIG_MODULES
  1879		if (unlikely(s->is_oot)) {
  1880			spin_lock(&s->oot_lock);
  1881			list_for_each_entry_safe(slab, t, &s->oot_page_list, slab_list) {
  1882				nid = page_to_nid(&(slab_folio(slab)->page));
  1883				if (nid == node ||
  1884				   (node == NUMA_NO_NODE && nid == numa_node_id())) {
  1885					list_del(&slab->slab_list);
  1886					s->oot_page_num--;
  1887					spin_unlock(&s->oot_lock);
  1888					folio = slab_folio(slab);
  1889					goto find;
  1890				}
  1891			}
  1892			spin_unlock(&s->oot_lock);
  1893		}
  1894	#endif
  1895	
  1896		if (node == NUMA_NO_NODE)
  1897			folio = (struct folio *)alloc_pages(flags, order);
  1898		else
  1899			folio = (struct folio *)__alloc_pages_node(node, flags, order);
  1900	
  1901		if (!folio)
  1902			return NULL;
  1903	
> 1904	find:
  1905		slab = folio_slab(folio);
  1906		__folio_set_slab(folio);
  1907		/* Make the flag visible before any changes to folio->mapping */
  1908		smp_wmb();
  1909		if (folio_is_pfmemalloc(folio))
  1910			slab_set_pfmemalloc(slab);
  1911	
  1912		return slab;
  1913	}
  1914	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
