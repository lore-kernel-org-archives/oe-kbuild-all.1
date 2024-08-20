Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE250194A48
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724167486; cv=none; b=i0lVZdOQuK2IQ7zIY4b/M9Nvcm+EGi9JmNQmMjy0kqIqeo3GYejlG0AovJEUmWdxjHM4leFMYDr4Vg9JM0smcXzSrARwTEKytL/B2asKTEIjgY7JvsD6DRBiW7hAZjvcJn07vpUCi4MwOTA7yiaUqwgjHpRLdOrgpzx/KqXcFqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724167486; c=relaxed/simple;
	bh=rFeNgvud5GmFpddJ7ELpN1rEtXG19hprD/0w8ciABzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfQmBKwO3JCmlQXHW/1vIIuhF3R/o7xpEczB1/tmEOM87G0fRy5DOkD4SnhF6Y3KpGdf/ep9vRLHhIbvPjos34JVIY/r7I9Udaso7HAKZ8LJ4FENOwvB/yYdnwbk4o3nDGZN+5wlbckq5GceOPJSNVBij/8Gov9TLtr72yca3vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRH0nREB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRH0nREB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724167483; x=1755703483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rFeNgvud5GmFpddJ7ELpN1rEtXG19hprD/0w8ciABzY=;
  b=JRH0nREB+ypfWxZ/AQCtM9U/857+5eKtbVkB4uARHhHOpm4QqLi+BuG4
   Bsx7oKk1EoER9jk6KLVflsyc3q0eJCEsvU5Fv3toZU+iUAAQDOAuI+Riw
   JOW1CIpDMnvWMOP2G0JX8zQklzF1Tk/U0l2OV5w9KjFjEvq4yOo1phwzY
   37H09sDD8E2PHa1U2x1anjToOipXQW6P7lFSvl5mpk2OqrKajNRUYxfMU
   c6f5dGjqnSr2Q3rGH7Qn6XtQUWTV6ZpN9IFoeLl3C8MmR5XoTsYpPfuv3
   mqGQDQmzUaLnXruspdAt9G7tPKqILRONadjOjq7q/BDKXl5dQ7Acc51Dl
   A==;
X-CSE-ConnectionGUID: 2QyCr4y9SmGj/WQ9yduTew==
X-CSE-MsgGUID: HKD5QVUZQEmdg+8PpWT0LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22445217"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="22445217"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 08:24:42 -0700
X-CSE-ConnectionGUID: p7Noo6gQQsi6nISviYAEGA==
X-CSE-MsgGUID: 8c19r7lLTaqy+aH+1za0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="64971459"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2024 08:24:41 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgQit-000AL0-2X;
	Tue, 20 Aug 2024 15:24:39 +0000
Date: Tue, 20 Aug 2024 23:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/4] mm: zswap: zswap_store() extended to handle mTHP
 folios.
Message-ID: <202408202320.trSaY2o4-lkp@intel.com>
References: <20240819021621.29125-3-kanchana.p.sridhar@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819021621.29125-3-kanchana.p.sridhar@intel.com>

Hi Kanchana,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8c0b4f7b65fd1ca7af01267f491e815a40d77444]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchana-P-Sridhar/mm-zswap-zswap_is_folio_same_filled-takes-an-index-in-the-folio/20240819-101738
base:   8c0b4f7b65fd1ca7af01267f491e815a40d77444
patch link:    https://lore.kernel.org/r/20240819021621.29125-3-kanchana.p.sridhar%40intel.com
patch subject: [PATCH v4 2/4] mm: zswap: zswap_store() extended to handle mTHP folios.
config: sparc-randconfig-002-20240820 (https://download.01.org/0day-ci/archive/20240820/202408202320.trSaY2o4-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408202320.trSaY2o4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408202320.trSaY2o4-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/zswap.c: In function 'zswap_store_page':
>> mm/zswap.c:1534:17: error: implicit declaration of function 'obj_cgroup_get'; did you mean 'obj_cgroup_put'? [-Wimplicit-function-declaration]
    1534 |                 obj_cgroup_get(objcg);
         |                 ^~~~~~~~~~~~~~
         |                 obj_cgroup_put


vim +1534 mm/zswap.c

  1517	
  1518	/*
  1519	 * Stores the page at specified "index" in a folio.
  1520	 */
  1521	static bool zswap_store_page(struct folio *folio, long index,
  1522				     struct obj_cgroup *objcg,
  1523				     struct zswap_pool *pool)
  1524	{
  1525		swp_entry_t swp = folio->swap;
  1526		int type = swp_type(swp);
  1527		pgoff_t offset = swp_offset(swp) + index;
  1528		struct page *page = folio_page(folio, index);
  1529		struct xarray *tree = swap_zswap_tree(swp);
  1530		struct zswap_entry *entry;
  1531		unsigned long value;
  1532	
  1533		if (objcg)
> 1534			obj_cgroup_get(objcg);
  1535	
  1536		if (zswap_check_limits())
  1537			goto reject;
  1538	
  1539		/* allocate entry */
  1540		entry = zswap_entry_cache_alloc(GFP_KERNEL, folio_nid(folio));
  1541		if (!entry) {
  1542			zswap_reject_kmemcache_fail++;
  1543			goto reject;
  1544		}
  1545	
  1546		if (zswap_is_folio_same_filled(folio, index, &value)) {
  1547			entry->length = 0;
  1548			entry->value = value;
  1549			atomic_inc(&zswap_same_filled_pages);
  1550			goto store_entry;
  1551		}
  1552	
  1553		/* if entry is successfully added, it keeps the reference */
  1554		if (!zswap_pool_get(pool))
  1555			goto freepage;
  1556	
  1557		entry->pool = pool;
  1558	
  1559		if (!zswap_compress(page, entry))
  1560			goto put_pool;
  1561	
  1562	store_entry:
  1563		entry->swpentry = swp_entry(type, offset);
  1564		entry->objcg = objcg;
  1565		entry->referenced = true;
  1566	
  1567		if (!zswap_store_entry(tree, entry))
  1568			goto store_failed;
  1569	
  1570		if (objcg) {
  1571			obj_cgroup_charge_zswap(objcg, entry->length);
  1572			count_objcg_event(objcg, ZSWPOUT);
  1573		}
  1574	
  1575		/*
  1576		 * We finish initializing the entry while it's already in xarray.
  1577		 * This is safe because:
  1578		 *
  1579		 * 1. Concurrent stores and invalidations are excluded by folio lock.
  1580		 *
  1581		 * 2. Writeback is excluded by the entry not being on the LRU yet.
  1582		 *    The publishing order matters to prevent writeback from seeing
  1583		 *    an incoherent entry.
  1584		 */
  1585		if (entry->length) {
  1586			INIT_LIST_HEAD(&entry->lru);
  1587			zswap_lru_add(&zswap_list_lru, entry);
  1588		}
  1589	
  1590		/* update stats */
  1591		atomic_inc(&zswap_stored_pages);
  1592		count_vm_event(ZSWPOUT);
  1593	
  1594		return true;
  1595	
  1596	store_failed:
  1597		if (!entry->length)
  1598			atomic_dec(&zswap_same_filled_pages);
  1599		else {
  1600			zpool_free(entry->pool->zpool, entry->handle);
  1601	put_pool:
  1602			zswap_pool_put(pool);
  1603		}
  1604	freepage:
  1605		zswap_entry_cache_free(entry);
  1606	reject:
  1607		obj_cgroup_put(objcg);
  1608		if (zswap_pool_reached_full)
  1609			queue_work(shrink_wq, &zswap_shrink_work);
  1610	
  1611		return false;
  1612	}
  1613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
