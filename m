Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3365511CA0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 07:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765006852; cv=none; b=VXPbbuswaiOoLZ6bKGOoGpKh8XyLok9OwKABNfOT6HsoPoXWFugaipGWL+0QGGfXv57XxwrmL34IWUSBL8SpEBlGs/1PHiuaJEdgQJLokNuLYRhP1D8HCxITDBeJYdgVm6+aqRUG8oXwBiHN6+4xdnwSQ/yjqx1Vd1HVg65EeVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765006852; c=relaxed/simple;
	bh=ZM38GQL89ZfYfh1BQ6evBlP3cB3JhANziztJpk3Cxw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JL1bbugjuPaTTRo9d+I52xMhEIYHQO6xfm3rtLVMLBroCLhk83HaIM+YeuOjHa+f5HNy3qMhZRGJA9ux76fZox4kmOKK6gaNyzbkviN98EsWg92wXSCOtcXU0M6xQN7WJtiNR9tE6ci1B4rx1PeJfODnRlMoGSj85NwwQUJnX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQI10+rS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQI10+rS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765006850; x=1796542850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZM38GQL89ZfYfh1BQ6evBlP3cB3JhANziztJpk3Cxw8=;
  b=XQI10+rSW6qiKLxyWE8fqiRiGpBYAvZV06F/luGtce3YA0RvefCGudfU
   +GZ981aUTKPcmkKCBRJTK28xzPH23qwsamf9JBA2nlAww3jGzusiOtZZ5
   wcFrJx+0CdBx45gPSRVSzyV0VUZ1l+Zcdl/MLt2vp5km2ghsd/s1yuTqm
   BWXAXRWe1x54+85/VzfmwEnBrC4pbWf7OGgkyl0HF7/TmE+pR26JKuys2
   czyoNfn/qDHob08cpgUiEcHEG7HK1zhI698RDGu2nIMX62uq0v7SMlNOD
   5clBCk1UaF0aiLrOBh+IoKJYsscTr/GTvSSc0nSDeYyTsldi+R0n9QlNX
   Q==;
X-CSE-ConnectionGUID: 56vOC37LTWm1WqgLhu0j5A==
X-CSE-MsgGUID: hFDPAQb1RwKMpUWP2e+5PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67111695"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="67111695"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 23:40:49 -0800
X-CSE-ConnectionGUID: 3uOYlQ7yRMyLjlxI+BKMOA==
X-CSE-MsgGUID: OnNqNVB6RW6AH8OBfCaiVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="200624751"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Dec 2025 23:40:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRmuM-00000000Fzx-0Ric;
	Sat, 06 Dec 2025 07:40:46 +0000
Date: Sat, 6 Dec 2025 15:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 72/72] mm/slub.c:1904:1: warning:
 label 'find' defined but not used
Message-ID: <202512061506.CHG33Ea0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   f1faca50b3bea84daacf1a51eb1d3e038ee83e14
commit: 0763da468566b4d9761378a01f42a36aa984d5d0 [72/72] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251206/202512061506.CHG33Ea0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061506.CHG33Ea0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061506.CHG33Ea0-lkp@intel.com/

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
