Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA5A52F82
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 15:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710949942; cv=none; b=IE5UTR29xf0G59xQnqxWytrwbuQpUxSKORb8+Gk80pvQ9eh6EZe/zOL3W4GWEHyPkvH1gdklcnbA1q0SgHaB8Hlh3EK03z9e4LaGweq3T2fvht2S1n81dKIK7ApGF2c9o3vogrZnogYgLisImvIhFhdEqRDzjFk2jZJlAGiYsl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710949942; c=relaxed/simple;
	bh=908m/55Z3IS9sIxjOUaSDDRSgX+3BTckLy8gpey6ooI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kNa3rXTPKkxEMdXtAeLXDVpn2EtbxAF86nXMZMP/YjeX379Ezu1nc6a9Qzl5+5UHK+5guZcsgn9+Pp30W4erdqFxs/9E9oQ4r5yc+TteIUNQm9sByhX5Np/ow/VlQy+2ivWS14+ldq7sMheG/k8L7dDtW08m+uJDS3xQk3b7NfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGSEK+g/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGSEK+g/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710949940; x=1742485940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=908m/55Z3IS9sIxjOUaSDDRSgX+3BTckLy8gpey6ooI=;
  b=BGSEK+g/r7bTXVCCwFdaoSNGSv0bZVE6Bfk/eB8miqinj1sZ4wxA0a+5
   j62RqiBiVt2WsVS9wXB9BFmxJSeW4WRaLdwZGZlJz3iUjUkfAGmETo9+4
   C9kBgjK6P2GCVUW203FY3B9YAZcJTBmWiNAr50NRzNQYK5Wz2ua8hv68z
   dsOUl93j7yXY5MRh0DEAkIrE7CwHfZxGuQRgp+ZCVkVic1ntySKcFk+MA
   mwVGbgOysrQ2Dl7gFm98eCgsHLM+vGx6f+tUe8P92hzxmjXQorFCNVkUE
   9BvG556xWnpOBYITP2EWRslxlAAFCAVGJU4w6tSUzKVzepH+MYoUb7cgu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6001822"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="6001822"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 08:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="14075181"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Mar 2024 08:52:17 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmyEg-000Ijz-0Z;
	Wed, 20 Mar 2024 15:52:14 +0000
Date: Wed, 20 Mar 2024 23:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 26/52] mm/internal.h:1128:1: warning: control
 reaches end of non-void function
Message-ID: <202403202323.Il6OdbUR-lkp@intel.com>
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
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240320/202403202323.Il6OdbUR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403202323.Il6OdbUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403202323.Il6OdbUR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/migrate.c:58:
   mm/internal.h: In function 'get_deferred_split_queue':
   mm/internal.h:1127:22: error: 'struct pglist_data' has no member named 'deferred_split_queue'
    1127 |         return &pgdat->deferred_split_queue;
         |                      ^~
   In file included from include/linux/spinlock.h:314,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/migrate.h:5,
                    from mm/migrate.c:16:
   mm/migrate.c: In function 'migrate_pages_batch':
   mm/migrate.c:1683:68: error: invalid use of undefined type 'struct deferred_split'
    1683 |                                         spin_lock_irqsave(&ds_queue->split_queue_lock,
         |                                                                    ^~
   include/linux/spinlock_api_up.h:28:32: note: in definition of macro '___LOCK'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |                                ^~~~
   include/linux/spinlock_api_up.h:40:31: note: in expansion of macro '__LOCK'
      40 |   do { local_irq_save(flags); __LOCK(lock); } while (0)
         |                               ^~~~~~
   include/linux/spinlock_api_up.h:69:49: note: in expansion of macro '__LOCK_IRQSAVE'
      69 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/spinlock.h:266:17: note: in expansion of macro '_raw_spin_lock_irqsave'
     266 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   mm/migrate.c:1683:41: note: in expansion of macro 'spin_lock_irqsave'
    1683 |                                         spin_lock_irqsave(&ds_queue->split_queue_lock,
         |                                         ^~~~~~~~~~~~~~~~~
   mm/migrate.c:1697:73: error: invalid use of undefined type 'struct deferred_split'
    1697 |                                         spin_unlock_irqrestore(&ds_queue->split_queue_lock,
         |                                                                         ^~
   mm/internal.h: In function 'get_deferred_split_queue':
>> mm/internal.h:1128:1: warning: control reaches end of non-void function [-Wreturn-type]
    1128 | }
         | ^


vim +1128 mm/internal.h

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
  1117			return &memcg->deferred_split_queue;
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
> 1128	}
  1129	#endif
  1130	
  1131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
