Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386804AEE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710947416; cv=none; b=FnCCxGHqjA3U1J2I3xNkarmStt95buGPGMIGoXnRz9SVjBf/nXpEGTUEHmAEo1qTo8vj6GXfC3sI4Ylz0+FPpf2zlxOlu3GSwBXYs3osP1RJjUR/YaV8JVSVlX5wyRtHVEYvU7pQIu9RF6yXmGHXG0SXTlkzLz/gDEB95zrMSv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710947416; c=relaxed/simple;
	bh=523kjhpgoAAFz/qba+HD2YJ+eOdFKeDiKBUr6WY/PK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BMa8rZTfLxNG6Fo2TX+9iBkiUhke9iAbHU4HltOVo2mczxRNMQp0s+WL0K7dg2H7yui0D1GQENXpcPyqH7jLGhB3PMQDX6fV0lGskeypqTuY2kmkt3q4+q+3Ze5TfBxvln/rDQniG7iw4iR+9zFTqcx3CfOalBSEXglvZdXWVqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7Bu4EyP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7Bu4EyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710947415; x=1742483415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=523kjhpgoAAFz/qba+HD2YJ+eOdFKeDiKBUr6WY/PK8=;
  b=f7Bu4EyPy4s+jN9q3u36lJxlr6iyr23ItHIuCT8uTI2ZyYBcDU0CzIT7
   QomZ7Zf0aMUSQ1cF4LAEMFh38/skBKD9ulLFoes1tXzw5k1Ny4tsMk0q4
   DVNOVm8/wmCo40m+eqoRpMqrAgEPsZ5UL1TX5njs7cmaelLufw/qqg+R4
   As6ODvcBep7oQOqi9JrwpkSLYP52fUrCzxtufjVBEKKRBxzBpw12n0woj
   wadZ5yhWJG1baebIIBk7I8VO2HGXhwqzz0pPVRz8b5v/ntxIBUkScU4TT
   wmPkVa1zxbEN1fFCJUNshHHnE9x2b6C36p48D3I9+r414fc3iSK916lMd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5753644"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5753644"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 08:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="14581180"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Mar 2024 08:10:13 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmxZz-000Iid-0m;
	Wed, 20 Mar 2024 15:10:11 +0000
Date: Wed, 20 Mar 2024 23:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 26/52] mm/internal.h:1117:30: error: 'struct
 mem_cgroup' has no member named 'deferred_split_queue'
Message-ID: <202403202244.AgXvkIgR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   a824831a082f1d8f9b51a4c0598e633d38555fcf
commit: 1166721383f8962e2c6c388b2adc7c6f1e9901d5 [26/52] mm/migrate: split source folio if it is on deferred split list
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240320/202403202244.AgXvkIgR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403202244.AgXvkIgR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403202244.AgXvkIgR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:51:
   mm/internal.h: In function 'get_deferred_split_queue':
>> mm/internal.h:1117:30: error: 'struct mem_cgroup' has no member named 'deferred_split_queue'
    1117 |                 return &memcg->deferred_split_queue;
         |                              ^~
   mm/internal.h:1119:30: error: 'struct pglist_data' has no member named 'deferred_split_queue'
    1119 |                 return &pgdat->deferred_split_queue;
         |                              ^~
--
   In file included from mm/migrate.c:58:
   mm/internal.h: In function 'get_deferred_split_queue':
>> mm/internal.h:1117:30: error: 'struct mem_cgroup' has no member named 'deferred_split_queue'
    1117 |                 return &memcg->deferred_split_queue;
         |                              ^~
   mm/internal.h:1119:30: error: 'struct pglist_data' has no member named 'deferred_split_queue'
    1119 |                 return &pgdat->deferred_split_queue;
         |                              ^~
   In file included from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/migrate.h:5,
                    from mm/migrate.c:16:
   mm/migrate.c: In function 'migrate_pages_batch':
   mm/migrate.c:1683:68: error: invalid use of undefined type 'struct deferred_split'
    1683 |                                         spin_lock_irqsave(&ds_queue->split_queue_lock,
         |                                                                    ^~
   include/linux/spinlock.h:244:48: note: in definition of macro 'raw_spin_lock_irqsave'
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   mm/migrate.c:1683:41: note: in expansion of macro 'spin_lock_irqsave'
    1683 |                                         spin_lock_irqsave(&ds_queue->split_queue_lock,
         |                                         ^~~~~~~~~~~~~~~~~
   mm/migrate.c:1697:73: error: invalid use of undefined type 'struct deferred_split'
    1697 |                                         spin_unlock_irqrestore(&ds_queue->split_queue_lock,
         |                                                                         ^~
   mm/internal.h: In function 'get_deferred_split_queue':
   mm/internal.h:1120:1: warning: control reaches end of non-void function [-Wreturn-type]
    1120 | }
         | ^
--
   In file included from mm/damon/paddr.c:16:
   mm/damon/../internal.h: In function 'get_deferred_split_queue':
>> mm/damon/../internal.h:1117:30: error: 'struct mem_cgroup' has no member named 'deferred_split_queue'
    1117 |                 return &memcg->deferred_split_queue;
         |                              ^~
>> mm/damon/../internal.h:1119:30: error: 'struct pglist_data' has no member named 'deferred_split_queue'
    1119 |                 return &pgdat->deferred_split_queue;
         |                              ^~


vim +1117 mm/internal.h

  1101	
  1102	/*
  1103	 * mm/huge_memory.c
  1104	 */
  1105	struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
  1106					   unsigned long addr, pmd_t *pmd,
  1107					   unsigned int flags);
  1108	
  1109	#ifdef CONFIG_MEMCG
  1110	static inline
  1111	struct deferred_split *get_deferred_split_queue(struct folio *folio)
  1112	{
  1113		struct mem_cgroup *memcg = folio_memcg(folio);
  1114		struct pglist_data *pgdat = NODE_DATA(folio_nid(folio));
  1115	
  1116		if (memcg)
> 1117			return &memcg->deferred_split_queue;
  1118		else
  1119			return &pgdat->deferred_split_queue;
  1120	}
  1121	#else
  1122	static inline
  1123	struct deferred_split *get_deferred_split_queue(struct folio *folio)
  1124	{
  1125		struct pglist_data *pgdat = NODE_DATA(folio_nid(folio));
  1126	
  1127		return &pgdat->deferred_split_queue;
  1128	}
  1129	#endif
  1130	
  1131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
