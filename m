Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F362A256C84
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768668972; cv=none; b=iudQIChFd/Tzi7oeLRbJPjpDbpc9FhQnD1+BDbJK0UDbG4tLmz5F+DDoRyJplQ1Abks+9gl9hqiUcZrWtiidDK4veletZzXtY0YfCEKBJTnhuIlASy88HNPmWd6tGy65FnHDbJyRt8vL70YP6M7clCdWC3Vk6jF0q3N2xRWk0CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768668972; c=relaxed/simple;
	bh=qbKcp7g/G5sAz7Zby8JPDYJjU+6JJcK0l4uhSh54Njo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BdQI9WTNY3krK7cGetbUtOG9uO5MBR8ZeuMOR8pqxigwxmTTI1dA5VDHl22ynhnArZc3GftuOtCx9+w7LEILuqaKagCjWW+pEa7A7+5+ywrn7DtThdhSQnd53nBENLg+AyY5ZsnFvC35kbWFHjGVEG7PJ6oLVUjNNhy2j0CLiv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsUYOcov; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsUYOcov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768668970; x=1800204970;
  h=date:from:to:cc:subject:message-id;
  bh=qbKcp7g/G5sAz7Zby8JPDYJjU+6JJcK0l4uhSh54Njo=;
  b=jsUYOcov6z0ipA6y3GDeFc1GjCFFk3muXkXU/CDy7ooFQ55zF3QvjZps
   bekhG0y7V15ne4p1FFXuOzTj5/IFIncNFFv0cVuAWXJzk9KeflyqbJOEo
   uKMu/K8HB6QoDtgAxyK2s+MVCHPUqgMDFKfPg0wmBzcnJXPmdUf/BdpxC
   cL14faFblhVnJ1WvN6rPtRY+sMmitdQg4c9SOFZozfMsuFw2EFY0MXvLT
   5UWVFg2UyYnspEbcSVy0QdMZWSo4EKdF5Vt6hsA8aqNpT4BqQkILjr1tu
   afwd/Xi8IlegV6lRTz6yX9xVL4iRlxACBrb4ysgs5wwbJGJ0oqX5gXzDy
   w==;
X-CSE-ConnectionGUID: /ni+89WkQ6Ssi/yv5TYYHw==
X-CSE-MsgGUID: 9M2rfgWtRWG5lVIsavRNYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69848167"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69848167"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 08:56:10 -0800
X-CSE-ConnectionGUID: 2ux/6DicRR+dfwRpe+x3Ow==
X-CSE-MsgGUID: ijG7LI60QDOT5vCCa1M3PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205774857"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jan 2026 08:56:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh9an-00000000M3w-2Cc9;
	Sat, 17 Jan 2026 16:56:05 +0000
Date: Sun, 18 Jan 2026 00:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1/1] mm/slub.c:1904:1:
 warning: label 'find' defined but not used
Message-ID: <202601180000.RKsX4wyZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   3b02b5ff38d9bf8ba9316914539c133bfbc2343b
commit: 0763da468566b4d9761378a01f42a36aa984d5d0 [1/1] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260118/202601180000.RKsX4wyZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180000.RKsX4wyZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180000.RKsX4wyZ-lkp@intel.com/

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
