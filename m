Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D51255E58
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739362; cv=none; b=I3jeZDyS3XJunho2tixDaHCqghui2OSq133B8OLs4KZHrJGjsriHBpu4WFzmhhcMqc/D/GX5IT0rz2Jhxlsw5a8N1oSMueNq7pVQ3RAac0wtnNGKXqpJlvEUyrGAxC1l7ywC2uxyh4Y8VZISPzhFrxBO1xJ8fIBLs+gS9ZFxUFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739362; c=relaxed/simple;
	bh=jPOgu/BtrfZCjzm8EwPPCJ0T35Qlq98OF5r8iUuyCuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHalOSG8P7DCSLjTzS3t+rAEsMx4abdfT9vahkDtwx0xWnfO7hk7RDTXDvS1k7xJ5vDrAWSuhaeNGBT75E2js06tAkjtLbsy9QchFIC23Xq81pPXSQsRWKP+xWgunFpdrj5hnUynE4E2Pg6c0SqKi9XNWGb+UdaNDdOKNHnXeAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G50mUTGC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G50mUTGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740739361; x=1772275361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jPOgu/BtrfZCjzm8EwPPCJ0T35Qlq98OF5r8iUuyCuY=;
  b=G50mUTGCgkvDrWuS9jNn3gdDox0fV3/4cnSp51Z7GCI0wxQOA3p1OBeO
   17EoLDnyI/Rtedn7cZO9qBkHfbmtYyR4CyECq3eW1tPW0ury/KFQm+Xgd
   x/U4/9WpYKPbFYz3/MAO8JrbggobDJsPgBpzAYPnN+IFJbQvXW7K6Mqnb
   U2YzCqm++59ZKTPka+cBNOdClgs6A2D6NJ8kPl65yDTBVn9pbKjpAWvnl
   Rr7tjjoeDimTCGKD2amjGzdFmTxkVGO+tMcryDeuU7MnVx0fVTCAMxF1W
   1zoiU4L/XROCHI2RgrzEbiXZnZnpHgA8Dp+rJ+PJttpoE5FQDyeoaI4eI
   Q==;
X-CSE-ConnectionGUID: UEkNmAsjTpmKdTjc+mGH4g==
X-CSE-MsgGUID: ft4RiUFvTaKs8cOiPOzZQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45444618"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="45444618"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 02:42:40 -0800
X-CSE-ConnectionGUID: vXV2QCRBRUubBrgHvwnsgw==
X-CSE-MsgGUID: zWrV3utGQxm400CYdwuElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117067305"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Feb 2025 02:42:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnxpE-000ElK-24;
	Fri, 28 Feb 2025 10:42:36 +0000
Date: Fri, 28 Feb 2025 18:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/1] mm/slub.c:1904:1: warning: label
 'find' defined but not used
Message-ID: <202502281851.FiLzJgTI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   83b17ccb9899d35bc10eaa78f87da816e711f9e3
commit: 3d08021ea0c480fbdbc5f988309cc7684c35db4f [0/1] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250228/202502281851.FiLzJgTI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281851.FiLzJgTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281851.FiLzJgTI-lkp@intel.com/

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
