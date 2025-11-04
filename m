Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D8D32C33E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 22:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762296275; cv=none; b=tt8MRhbsB29pfVCrBsU35gmyV51jDrHQggl0qLkVzWVI4/RIpLmbLM/DkvwxkiJd87BhyRIV7P1/xJJoWSwPaYp2tG9eu5u1cmTqQkQSZ0IvLvSU64A0AbWv30zpQvGmLQhhpcPqYpi4YtqDQvsYvxqrLyzPTy5NtFUGJVJ/vj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762296275; c=relaxed/simple;
	bh=kDesm5qOuTF0gAtHzmQhMIs3wb7mK5H5rb7JjDtb4XE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DS1N9F8ZP1taETiio91UeUEDPvG9iyodjUazJdB1Y9gEHu6oR9CjTt3EtWatq8WgZa6jML47NZNOE23J1GnqTDFjLOm9PyUvGRWm7PTbI/8V5oFg3DujFSmWmluIyuSde3YJaTa1btLEgy1mqMWirMExGQHNG3jhgzsAbbh2JdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfAsiSIQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfAsiSIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762296273; x=1793832273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDesm5qOuTF0gAtHzmQhMIs3wb7mK5H5rb7JjDtb4XE=;
  b=jfAsiSIQWNjCRmFw2ypJua7o2nKjDv49AmP3iReC6PzBpBAY8Eh0xvDV
   xyVbptM66qeZJXKCefzRgtAWI6lBTVqlfzU+nNgeAMGqEPrDgMrnQcmH6
   MmPN9ewVApkaxYaPjEcCJLN2knGk+M/iDLYGqohsqgCCbJ9etltwhvba1
   XA2PZyuNhIRj5Txf2fD/4SeV0/kJ2xZem3/iivohnbXB5eA0aSykJrxNd
   wyzZSIWDyqY+BeEoiMdXfpVtZctr+KXBeTC6/Qc4JFYrwcwkcVbVvGh8s
   P4J1ael0JfuLmhTDNMbZ0Hk6+bRW3eZTDKknJzIU5ZAPH8eIMOPL8kzOn
   g==;
X-CSE-ConnectionGUID: 1r7+QlNdR9OvvzQ+Wv7esw==
X-CSE-MsgGUID: EE82fvgBRwiaH768EcO/IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="51973908"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="51973908"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 14:44:33 -0800
X-CSE-ConnectionGUID: ldpDJCVrRRKBsOrvtB+Kxg==
X-CSE-MsgGUID: C2iByEIZQA6a2DxLvDsatQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="192448062"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2025 14:44:32 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGPlN-000Rtg-1U;
	Tue, 04 Nov 2025 22:44:29 +0000
Date: Wed, 5 Nov 2025 06:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 4/4] mm/slub.c:1904:1: warning: label
 'find' defined but not used
Message-ID: <202511050639.FFhQA63f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   788b1c9f47ec15f115d5709c98220c2c17992476
commit: 0763da468566b4d9761378a01f42a36aa984d5d0 [4/4] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251105/202511050639.FFhQA63f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050639.FFhQA63f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050639.FFhQA63f-lkp@intel.com/

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
