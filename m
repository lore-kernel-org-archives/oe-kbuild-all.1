Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D147C29D288
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 23:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194197; cv=none; b=Jnzmjjc6IquhMQg7JzZ+IvMsXy6lktgB+8Q0VczjnCG2x48aC8JfVrjOqJFqGz4f8xG5dkAHmz3WGW2ysMzImbXv04yzBy6qhA9zwHQwWbnfJTW4xAaD9MislKZxa9LJBw11pE1ytR3Z9tRayJ1u40EYPkguovtClAKTvh5T2aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194197; c=relaxed/simple;
	bh=1+N20Ki41ZAv9cM1Dej6mUOi9/r1V+ksSxCl0OscLVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aBA+NYApAGMWuFTIBuqrfSSfA5+UIX/t/w9+7p4SAQ+MKoZ8+COQG+LDhtQmgRbzOKBRjQtcXQKRoB5H09MZE1Qc88gnCidRlcVxUnBlh3EpOC6fNTxgqd6zIw+pwuYP6MEjAq6M+Iw3zYGS38eadaowla4eOjL59qOGUngEFU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIw6akID; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIw6akID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792194195; x=1823730195;
  h=date:from:to:cc:subject:message-id;
  bh=1+N20Ki41ZAv9cM1Dej6mUOi9/r1V+ksSxCl0OscLVg=;
  b=PIw6akIDA1yGa36qTKIP1pLb7xAW9UkFDTvzXcy0kPbEJvY840dq5cmJ
   nxtNtNYDusypmtTGF6tNMPZ+0aG1rB+8QEitGeuMgdOKnY3hyIMsQiX20
   bEFEb149FxJvbjbxFewL2b5YPaPHTgcd8lj/9XgEjGzDabykFJPHtyx7E
   gOT5qoX1OYcamGxry3GB/VkhRqPAGmMBE1MQyCzcWGOC2txOyRqRvIIGC
   pAIuBAj7futDgRkv3ThvWztm03GrFTWuMLiZwqd1e9PpCqHDhfSN21AZl
   Mke6m1oGfUQNPzASvUeiiZa1W4yrha2ulz+RagMv/nmoxPsW5fSLxyYxa
   Q==;
X-CSE-ConnectionGUID: nq6KLfrHRZOk3NKHo26niw==
X-CSE-MsgGUID: 6DE4ip6/S0W6f0q9PhvdpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="872724"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="872724"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 16:43:14 -0700
X-CSE-ConnectionGUID: mcxOBhnNSlK7pHKsrk7Xyw==
X-CSE-MsgGUID: LZ/eNLFCTH6Yw3qlmKTatg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2061765"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Oct 2026 16:43:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHrZu-00000000IoI-0WFn;
	Fri, 16 Oct 2026 23:43:10 +0000
Date: Sat, 17 Oct 2026 07:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-add-OMR-event-ANBZ51468 11/11]
 mm/slub.c:1904:1: warning: label 'find' defined but not used
Message-ID: <202610170759.yYnRRvOp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-add-OMR-event-ANBZ51468
head:   2ee4460ef69eb7f1a40741d26df51a3565558ea4
commit: 140de6f5ca5e2e49e0b9547b3b47fe986e95dd99 [11/11] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20261017/202610170759.yYnRRvOp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610170759.yYnRRvOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610170759.yYnRRvOp-lkp@intel.com/

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
