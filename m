Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235DA415F20
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 20:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788034777; cv=none; b=B8enpwiPlzodzWGX2uvxwTSJOjVBY3hsUOXRHoKS81zOx6g3k4ju7WwgJpYeZhnoMayf4IhONLFtkrbOB85oy5FQ6e67UKDhlOCD7PFlEjivCYrspQdowxFVwXSTn5W/5/MZ4AD0qAzD6pDJ4K7Z629KQYev+rR3bV8wqEIUYVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788034777; c=relaxed/simple;
	bh=bYEl1EWBVHUYgR/8hxfnTfoMKPKgkJM1TdwNwk9UHqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jJQz+piDYNk1FbRF/a7DYdVKR8T8N0wpKMcqv/wahBa1iJRF1OZJzMGS7cAcqe5UuTH/eeXmvI0h/Qq1pfiztre/dYNYtZqM4ikPT/c+gnIPNrfxZkmD9Gzq66ytA+kPXG1hXKDmIl0FozoHAMEizCJj3xhhPLu2iA6e6qZkvKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnPnqNlF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnPnqNlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788034775; x=1819570775;
  h=date:from:to:cc:subject:message-id;
  bh=bYEl1EWBVHUYgR/8hxfnTfoMKPKgkJM1TdwNwk9UHqM=;
  b=LnPnqNlFIAtvWNpYWo350Ja66b2o3dRVD1exxsc/bBmAjhykgBAtRNqS
   wY5BE7wRV/Qgj5cQCZaUtUTKroSy2SK2tW9FuSUJPoaJSJn8sYx1ypyhQ
   u3ra3O71aixRZ4sKyFNe3A85AAUHYCOBqI3EJl2kGfvl3BWzeYYTIbwi5
   P+5HUvijF2dCmBP1IBgL1Ek6JP4iZdbOyumqsOj54S+vLrgVmf4rhSxmJ
   2sHRdsufL+4ljpRGfdrsmWmBMibIbBINt0wmXNO0K29hnCg0yNDWbCMXz
   /mmMkvfxLSar9cnzlEoWGQC6ExxDQjGxkNTT/dMOH/tZLyzV8fGzMnx8z
   g==;
X-CSE-ConnectionGUID: mriUCin9SZaUzJZeEJApnw==
X-CSE-MsgGUID: 2v6nvXhVRbasb73iATz+cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="92186986"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="92186986"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 13:19:31 -0700
X-CSE-ConnectionGUID: fGK1eN2GRAalY+Y2GSOJ5w==
X-CSE-MsgGUID: 8wlmLMyFTJGis2XGCzgoDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="264699171"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Aug 2026 13:19:30 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0PWR-00000000DGG-27N2;
	Sat, 29 Aug 2026 20:19:27 +0000
Date: Sun, 30 Aug 2026 04:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 272/272] mm/slub.c:1904:1:
 warning: label 'find' defined but not used
Message-ID: <202608300407.f1hSocvH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   41cf029dd674935312f07b9ff27127f205008195
commit: 140de6f5ca5e2e49e0b9547b3b47fe986e95dd99 [272/272] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260830/202608300407.f1hSocvH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608300407.f1hSocvH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608300407.f1hSocvH-lkp@intel.com/

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
