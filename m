Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE9B12C499
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 14:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231296; cv=none; b=FRQlrJDcwE8zR9n6/WEc4fCeFR3oFc861PcAmoLaZs8bai+O9MNWG/DNUuoTMcQLuGJI2RV8Wzpmy2fN2dpmSYDHP1bDTPq/EhjlvY3QyMyA2M27gis37HlevYskU7PTE7FMNBw8d2VF1ZuiySnuTaTnFdpZBHafnma2jxrcBSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231296; c=relaxed/simple;
	bh=SKQjC5iJVN1p6hBIyNDb2NqNQoARuDowR/cop0RZ6L0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zp2H9Nu16cJQp+EUaaW3XvGRKAReTrxcrQI8BNos51PhWEA04EFsEn3DyPfMpm7zoCTP3u9enkXjlEeTLvP3RMjykzUVd322S28IOwE3oQXXikgljicpVD6Ia55hITmlm4ceZgR4Pjuk4xX+iObxcMhh/LV8b1yUK3U6cFhbWV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5rqQ6Lg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5rqQ6Lg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747231294; x=1778767294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SKQjC5iJVN1p6hBIyNDb2NqNQoARuDowR/cop0RZ6L0=;
  b=M5rqQ6Lg1qXWgW22gzGppmv6Mf7zjXZy9HCEVEoxnV577Bb4RWneqbJx
   BjN2Yn9RcGOHFcqGq7ci+37PRSyR0bi3F0I9o7z/qYsQ8BZs9A0NqvAuV
   ROFozl6DrljmNijxvNU3g3OdqToCVOFu16H5MNR7cZo5ggVulEWXB7P5h
   6FdmZ77eNpZDb63jN+kfvqVfxXNfzp3q9tkJgAwy0GiKhT2Ga3fGaoQ0H
   C0hRboGJmQEyucfoP7xNQBkeujTiyMNlf0c+djoE44SHrW13zVw2nB/9m
   DFZKxOf4ILXdCalSc5NHK+7+5rEGhKvitqxnWi4BvjXT7U6kqAdc/cNI+
   g==;
X-CSE-ConnectionGUID: eba6xa2ISNK6+tKuwOQOwQ==
X-CSE-MsgGUID: vjqZT8JjTp6g5e1fWXbsQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52937416"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="52937416"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 07:01:33 -0700
X-CSE-ConnectionGUID: rn727UZ3RO+4Vqukbs1m+g==
X-CSE-MsgGUID: AGo3W4msRa6BiA2WM7ifcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138098578"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2025 07:01:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFCfp-000HC5-0f;
	Wed, 14 May 2025 14:01:29 +0000
Date: Wed, 14 May 2025 22:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 56/56] mm/slub.c:1904:1: warning:
 label 'find' defined but not used
Message-ID: <202505142155.pZDTz3TV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   962678f628e6378bd0b60eeb52c2e28ec5881096
commit: c0ddc144af5dedb37b3bc9324538d9f234f58d04 [56/56] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250514/202505142155.pZDTz3TV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142155.pZDTz3TV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142155.pZDTz3TV-lkp@intel.com/

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
