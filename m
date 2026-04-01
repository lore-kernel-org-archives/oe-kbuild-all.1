Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21F313A258
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 00:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003220; cv=none; b=VUoGfdCOerou9VenaUoYBFSV0CUwRVGd2+OuKT3RgBffMQnA5qMGDvzUQq0n0pqt9nWk0XPLyeSIzBj5uwsK0zk1hnHEBK2wK8DORqdrWgbJsWRwMZYb9/IafViPuzRJFZsfslQHKmnS9TRg4ghayG/Gc+wi4veFUf0J+g0gMok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003220; c=relaxed/simple;
	bh=Udd01V98vpNkzBy6mJjG2hKA68xN6pKV+xQT+SZR5As=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cDs9icITFSVemB1F5nsuPTnjP0Jzhn7eYga2FUqdwNDdox13deIZsKh++dsO3Z3CY9Mf9VX+yuTWThiI+xB+5TxTsQ3PPreXy7twE8KwD7wrSKIXlWb8lt6s65tJgiYSxqe+4SFVzD1XgdOkFwrwVZahM7OALq6SbSp4AFWPzyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UomBKcg8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UomBKcg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775003218; x=1806539218;
  h=date:from:to:cc:subject:message-id;
  bh=Udd01V98vpNkzBy6mJjG2hKA68xN6pKV+xQT+SZR5As=;
  b=UomBKcg8o4Km7B9Pdmak7zi8QQ/p/S9mXCZMOThVQzZIpZ4kpdmNqAxg
   NBoZP2wtxF/YR6eK3CSZBK38ElZLiM686Wv5nLHGDp3Hf5CnM68smUnux
   xZhZ5NMfYNYJoy7fcscFf4tlmNtpfqjhYIBw2e3n6Goeb9kSxp3cgV8Gr
   6qVohsO7vMU7Ys8rQMzLRkjl7hfcdYbwfOXRlS4nK3E0jExh+qBmMl9cV
   ERS4qv/2p8RAjxPhef7lB0jFdG3PbjhGZfOnr9llNBV4/WKbdCROqG0U1
   QIhq0ujpnHZ2ZGYkaocIlvqxlvbwnYOiBSJRZS16iwfwvtYmgUZgWSCkN
   Q==;
X-CSE-ConnectionGUID: BBiSJgMCRDysezUGi7Eomg==
X-CSE-MsgGUID: T7iz3oWSSoyavj3afQ1oOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87108097"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87108097"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 17:26:56 -0700
X-CSE-ConnectionGUID: gHk/qDVkRrigZ4IP/qfFRw==
X-CSE-MsgGUID: 89M3+rqVSVqSiSRV357TGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="221667802"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Mar 2026 17:26:55 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7jQ4-000000004TL-3DiJ;
	Wed, 01 Apr 2026 00:26:52 +0000
Date: Wed, 01 Apr 2026 08:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 190/190] mm/slub.c:1904:1:
 warning: label 'find' defined but not used
Message-ID: <202604010821.TDocm2bN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   369b313eb3d1541d6e16f69cc4d6c899cc0ee8bb
commit: 0763da468566b4d9761378a01f42a36aa984d5d0 [190/190] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260401/202604010821.TDocm2bN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010821.TDocm2bN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010821.TDocm2bN-lkp@intel.com/

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
