Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40CF2F83A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 19:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781205817; cv=none; b=mMbiMJ7mKimroj0YhmnW5KBjT8qwlXcLp3yaYFb4RTnuH9Wqx5xeBaxDLyhv5LBagHA7oBQ2xzC0x7CeuNMimKEQlCOQAMtg4LyGwEF/wANmoGKh/oxWRs3TkTn+rejw8hPSnOIIhGEKYB/03Va++WPX4MEvbYTJc8pBSTQAgkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781205817; c=relaxed/simple;
	bh=jAlNxxzAl1Nga2r3V9nnfwz4I1yXyt/xb93bM6mEq6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ugz74v/CUtIzu02K8p+AG0UREegMSxnU8FEz1UNCiWH96eUVmaWczNz+5H+26SBy3f3YxjrxQwm+LK76rhT8A/09vl8EiXZH3QiOxOWXPmfEiIKHVRj6loRIcK9bEFJQE41kjtjbAZrpejsCJMPpCzi1hyoKJ5eG8XkXiwbp3pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbSSIT/i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbSSIT/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781205816; x=1812741816;
  h=date:from:to:cc:subject:message-id;
  bh=jAlNxxzAl1Nga2r3V9nnfwz4I1yXyt/xb93bM6mEq6g=;
  b=EbSSIT/ilSoaVfflBDRufHZybRicMa8MGSnkdQNHNdQZ7OWXIb1KxeZ7
   KzRkkgYKZhmTX3A61Z/hYuqzK4xHj4698E6AZ5T24f4188XVBNHtSvU2F
   uwEYf3gLN1+aVpn/bcLiT1abQgTLAwCU+rqMt9oa1wJ6Gl3KRWS/CjQ4o
   BIYNqNWzF59qYSTqd8avqnJciLbvqx9J9jWmJ28ShCyd35VFt7IWhKoJ7
   0VWootXmWT3dEbnXp9YRQ1JyH94HOSTelc+pprtjzXtCWR6Mg+zKfknF3
   mG6/ZPi+h2e3waQAl9fHXVcMrvim3sdtTf5LEJtcnB2xdrNThWfl9casB
   Q==;
X-CSE-ConnectionGUID: RRULJQtxTg2L6REzPRIXxQ==
X-CSE-MsgGUID: ayv189drR62Hif/iXaAAjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92598355"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="92598355"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:23:35 -0700
X-CSE-ConnectionGUID: swgfUYXITdyajDRpv0VQMg==
X-CSE-MsgGUID: 76mr7iVLRJa3YtRpH1l72A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246616305"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2026 12:23:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXkzz-00000000Nl0-0yap;
	Thu, 11 Jun 2026 19:23:31 +0000
Date: Fri, 12 Jun 2026 03:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 105/105] mm/slub.c:1904:1:
 warning: label 'find' defined but not used
Message-ID: <202606120315.JOcKMuGm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   17033c891775049d8437bf5fb55f35081b40440c
commit: 140de6f5ca5e2e49e0b9547b3b47fe986e95dd99 [105/105] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260612/202606120315.JOcKMuGm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120315.JOcKMuGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120315.JOcKMuGm-lkp@intel.com/

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
