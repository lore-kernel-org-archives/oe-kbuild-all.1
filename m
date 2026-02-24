Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A598A369224
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 09:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925206; cv=none; b=mQbLSEtIoShcaZMhbgsY2cZXGCbU4IwdvGjFc1Y0TSC7a3BuesDaAjRUW7Itr5tk6y3usXQUbDlb8vLYuuoahqdZB3cy2X7Ct05DQVd7u7bpq5oE+mO14noPjglUj19+1aAXG5FbbFXlKxVL3mjL5/dVRLJaY3BLNhf3O9dxxQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925206; c=relaxed/simple;
	bh=7X+LZNOw8VkR5IRIfgnRA/19S1ijZgzuoH+r7ViG9CY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VCEPGKCoD1hgTl3XF3soDsKUiragsV3TBezRhlM+jJ9lLmXQzKnDlfXbXbRUFqp8jT5yqTcWG3pc6tivxewNqrZRMM/aRIkK51EluRExUpsi4hMJP7L2DZcCKwd6VRXH14n7E0sonO+Dz+2GHI4Z6EhrxsZhyiVPACbLsm/Qxf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDDBosjM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDDBosjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771925204; x=1803461204;
  h=date:from:to:cc:subject:message-id;
  bh=7X+LZNOw8VkR5IRIfgnRA/19S1ijZgzuoH+r7ViG9CY=;
  b=aDDBosjMhA+Ek+xUoVOTQyzVVoPfNH7jXQdPPzsLv8wl/ASg273F1mMM
   rU4NY6AJ0cNatQ1fVoQjQB9JJw8nNHnq8qnZrsvzt4cG3M7hgBwNYLEt7
   SNo0IU5ov+3pwtTuWOdO4LIA5TfXwsynvxp9QQIl/Kt4qOplh8ZVWCTyX
   Ho1BKWuZ2vyuonj97lNY6Mjt2nSmsvyC8rx5VeTIm8LHxT7GxS3dOgqte
   0HqVwu8zfrbgkxyk2c2ruVxy57V86V95zn1dd32dD0mKHg7yPCxJHAk+J
   XHza53aQGgR6DTCQoAmNeMg9NniYhmvKaOgeM2RdkAFd8/LLby6zdAw3t
   w==;
X-CSE-ConnectionGUID: RWZXeg0NRR2VhGN72YkSKQ==
X-CSE-MsgGUID: jgOCWSNCQ5Khzsq5ygcCdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84391035"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="84391035"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 01:26:44 -0800
X-CSE-ConnectionGUID: OaV2bfGyQsyywAhsEnZUyQ==
X-CSE-MsgGUID: ea67WUGmSR+pObIAsIrzaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="238825855"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Feb 2026 01:26:42 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuogE-000000001kx-0Y9D;
	Tue, 24 Feb 2026 09:26:20 +0000
Date: Tue, 24 Feb 2026 17:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-DMR-APX-ANBZ29353 30/30]
 mm/slub.c:1904:1: warning: label 'find' defined but not used
Message-ID: <202602241749.5SlObXRa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-DMR-APX-ANBZ29353
head:   d8e6957edead90297a4f8cb1f247c54e559dbf8c
commit: 0763da468566b4d9761378a01f42a36aa984d5d0 [30/30] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260224/202602241749.5SlObXRa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241749.5SlObXRa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241749.5SlObXRa-lkp@intel.com/

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
