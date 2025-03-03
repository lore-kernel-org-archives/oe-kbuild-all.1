Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C946D13D539
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 03:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740974251; cv=none; b=ZnUe4W8UHc4BcODp5h4JLj8iw0fM+Vz01xo3zrEmQnhpaxoOFo7PeCpQQhOkGfhpKCfnhlzLy3r+ir1mRN91qOV6pAAVC5Ac3wQ7BGWA2aMGbJrccTqUjo/6SATrfWcRtK3F4inbK68iTWfjoxk8+WP0fRy+NuYmNQzzTPpHcMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740974251; c=relaxed/simple;
	bh=avz4Txll5aI7rHkpGekpZJMvQ/BiqVqw88lLLhtPMWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INYXot7rAt0/qO0s+o10jk82pyONFJH258kee8nZpkVCDNYIjjnQSky+DdFUU42zJwXTboyxbd0LahLvIsbIPcFr5mbuEtlWTQkptAr3nwxIBybKofO1pbJi6+2L7RS0mqJeIQwTBieTpdLYsqf9pQg/Jdoekuns4J53OPJwYyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpWuXZB5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpWuXZB5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740974249; x=1772510249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=avz4Txll5aI7rHkpGekpZJMvQ/BiqVqw88lLLhtPMWA=;
  b=fpWuXZB5/UjmqPu5oxfkB/eHPq44KM9OXxoXmuAYEfkBLDZtylj/mzYY
   NDFVU4KRPSm0PLiOOhrF++Bq91LN9/5SIbzabvWpEynMxQQ/Ba5KfCFtU
   B49jdIdU81PKYyJZCIns3XTeX3+d5KTIViaaCt78KlpCsWtSsDHXLbVbO
   EkKDXKZev6hhM+vu+uyrX4dl/cB7SzgdToUmT7H2SMahQnfxSrjVO11KJ
   fTZQpJ71JiZ4EW1VFl/ru3w4xcqQTtnPN4rPjPzPFGnylc7P3wzWN0oKH
   Ut7KGediL5u22aXyFT4llTvZC7/11fcQsq7rRY3KKIuG4+HcCnCvDUBWY
   Q==;
X-CSE-ConnectionGUID: bvWNVTKMQ1yMrSjGaU2hRg==
X-CSE-MsgGUID: 207qGwWYSVK+K0x2p2p8Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41685272"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="41685272"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 19:57:28 -0800
X-CSE-ConnectionGUID: /bAHI5jZQCSJHNYEwt8Z9w==
X-CSE-MsgGUID: sXRT/24XQ0K/jpmynuEHCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148795203"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Mar 2025 19:57:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1towv1-000Huc-2c;
	Mon, 03 Mar 2025 03:56:46 +0000
Date: Mon, 3 Mar 2025 11:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1424/1424] mm/page_alloc.c:3005:
 warning: Function parameter or member 'mt' not described in
 '__putback_isolated_page'
Message-ID: <202503031153.NCtb0XuW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df3541670ca99b09f2f70d1733516ef7a2289b29
commit: 91bac2310ae7eca9d9869222c96fcc3d02851eea [1424/1424] mm: add function __putback_isolated_page
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250303/202503031153.NCtb0XuW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503031153.NCtb0XuW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503031153.NCtb0XuW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page_alloc.c:21:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/page_alloc.c:58:
   include/linux/mm_inline.h:32:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      32 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:34:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      34 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/page_alloc.c:1419:6: warning: no previous prototype for function 'set_zone_contiguous' [-Wmissing-prototypes]
    1419 | void set_zone_contiguous(struct zone *zone)
         |      ^
   mm/page_alloc.c:1419:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1419 | void set_zone_contiguous(struct zone *zone)
         | ^
         | static 
   mm/page_alloc.c:1441:6: warning: no previous prototype for function 'clear_zone_contiguous' [-Wmissing-prototypes]
    1441 | void clear_zone_contiguous(struct zone *zone)
         |      ^
   mm/page_alloc.c:1441:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1441 | void clear_zone_contiguous(struct zone *zone)
         | ^
         | static 
   mm/page_alloc.c:2304:5: warning: no previous prototype for function 'find_suitable_fallback' [-Wmissing-prototypes]
    2304 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         |     ^
   mm/page_alloc.c:2304:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2304 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         | ^
         | static 
   mm/page_alloc.c:3081:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3081 |                 __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:127:34: note: expanded from macro '__count_zid_vm_events'
     127 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/page_alloc.c:3129:2: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    3129 |         __count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:127:34: note: expanded from macro '__count_zid_vm_events'
     127 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings generated.
>> mm/page_alloc.c:3005: warning: Function parameter or member 'mt' not described in '__putback_isolated_page'
   mm/page_alloc.o: warning: objtool: missing symbol for section .ref.text


vim +3005 mm/page_alloc.c

  2995	
  2996	/**
  2997	 * __putback_isolated_page - Return a now-isolated page back where we got it
  2998	 * @page: Page that was isolated
  2999	 * @order: Order of the isolated page
  3000	 *
  3001	 * This function is meant to return a page pulled from the free lists via
  3002	 * __isolate_free_page back to the free lists they were pulled from.
  3003	 */
  3004	void __putback_isolated_page(struct page *page, unsigned int order, int mt)
> 3005	{
  3006		struct zone *zone = page_zone(page);
  3007	
  3008		/* zone lock should be held when this function is called */
  3009		lockdep_assert_held(&zone->lock);
  3010	
  3011		/* Return isolated page to tail of freelist. */
  3012		__free_one_page(page, page_to_pfn(page), zone, order, mt);
  3013	}
  3014	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
