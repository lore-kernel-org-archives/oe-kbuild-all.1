Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABDE30E844
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 06:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750401582; cv=none; b=apTI4atiPbMFyrwb1w8sM6HCnNbMbyuYz5ww0P4M818MrR4dOTz3moFsG3beUQtO4bRwrrVv6BE3DJLUkAzLPnM9j8IEk9FIqaTb4lM0vvh1Pv9bm+v+wzPzAbxMu/yVQkPqsJ4IBZWKp0dxT+zcciz7lNKAzNwbZhKEamLtNIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750401582; c=relaxed/simple;
	bh=wXQYAzGsmK4G54k+xjD1gztfXjGNtcHhdNbvzkYIZbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TntitCHpLwA3VUD/gLytJ4vp1RT8xgd5ov7sNCNnJN88FFnuPQSkZ5P+zrDwhdLEwhf5d+JFKkIJX8HiUucR6lqtfufKnvhu3rR7z0tc+R4rhsma8/S/Xoh++Cq6ocCrggUj1szzQLdOV+uXl3C0bm9PHsQPvKR/kqUVBH8ElqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MidyQzhe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MidyQzhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750401581; x=1781937581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wXQYAzGsmK4G54k+xjD1gztfXjGNtcHhdNbvzkYIZbg=;
  b=MidyQzheQrX5RC726JF82jHx4DRKfqqjpB9lG0itzVdbQeUCxT6atS1l
   lNarE+OCv4UvkGexRfvROZw9g+xasDB3nMnTYZOtBiyxVzqQq1TY/bVVt
   aY4yYM1qv2wm4vv7AD50HMr9obCZlMYQYk3hP6W8lRSJVpE+rtKmH3Kiy
   2GIW2CgXXmQtGVkSDjcx1LdI/UwoerIuJrNigYRAPRR6fKmfiEbv+S1au
   y8N6/8pWjmM0fTQB2RFeyqdOx50V7DMY2AzsvAWdFWC+UgAjn6tEBuFRY
   nh5EQ3muaWvYy6/TAvSJ54MVQBg71hXqe3fIOj7QZHFblzirhgTCEUImr
   Q==;
X-CSE-ConnectionGUID: L77ro5H5TRac1k0KvWxehg==
X-CSE-MsgGUID: x2HONiTPRDW93NH8Uhr+Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="75186247"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="75186247"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 23:39:40 -0700
X-CSE-ConnectionGUID: ns56m4mMRa66pHHM1wh9VA==
X-CSE-MsgGUID: mUOP1lfrTLWTMzTMl4NLEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="151360725"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Jun 2025 23:39:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSVPU-000LRa-1U;
	Fri, 20 Jun 2025 06:39:36 +0000
Date: Fri, 20 Jun 2025 14:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 45/45] mm/slub.c:1904:1: warning:
 label 'find' defined but not used
Message-ID: <202506201457.m9Zciv9g-lkp@intel.com>
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
head:   02e191b0ef283fbec8ae2b0f92e0e8d8165cfb47
commit: c0ddc144af5dedb37b3bc9324538d9f234f58d04 [45/45] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250620/202506201457.m9Zciv9g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201457.m9Zciv9g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201457.m9Zciv9g-lkp@intel.com/

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
