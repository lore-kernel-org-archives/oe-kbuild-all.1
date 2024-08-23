Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888E12AEF5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 03:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724382798; cv=none; b=nPteSI5gRdHbMy0Mqa2YGzpXYX2vZxUxCRfaBOUybU9OfqeWuN1zcD4ghRUCVrRN4UEQCYnsa5dYO2JbfDPxlCqJ+LCB7BhUqvhPtzWAwmmJdmgNSQBY8xoKJUJbIci283E0yV1ZwexEKQ2ieJTE/85Xkg3zMDgaMxZoVjW1CIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724382798; c=relaxed/simple;
	bh=OnUwXYffCky88IQnwmydQo+ZDiPdY9gNpRfdqFkGhYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jhvhEIgbxCo7jb54/Izomm7EbF4YA4Hq6jvNigw79rGvINIPKR0IH9qJ+n3YxSfgKSOALNGnzSLMbhlDSEQF/sOnEBQXVgN/rVjEJwH2Ifbo3BJ+BDQOEi9xp+4M6Fhtulp65sAXoNF6vVOPh1QTLPrzGUMDcuEKDSiJfUQFJ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gU4u2amy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gU4u2amy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724382796; x=1755918796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OnUwXYffCky88IQnwmydQo+ZDiPdY9gNpRfdqFkGhYs=;
  b=gU4u2amyXambQz6FZRZG9t4Mb6HhZfD5Ja5X8K2UqJ581fZ3x+rO+vo/
   /j6iMIR34anR4+lbZiViLp5soU0qKm5OCZGuHJakju3l16O4V0gvV/sYg
   YnxJ0YXUu4ztUutfHp0mMqoMbQMS+rHVRtkoQZFwSkSGeC2GrSbjbNy45
   sLQDiAJhTD5EQ87Mg9OXUU7jfadmUTQW/oLeJ736AMus4MounYGK7+uAh
   w4p6od0lg64S1gPSmQ65jMTFXH/ZxWt15bHC/zVTROPxo4D07pg7hWMC3
   IlDUA3ZGKTrtidqbsu7QOwVakEFHBDhzIPlOSZu0rEs8YOmYHE9ri3Oe5
   g==;
X-CSE-ConnectionGUID: xX1HyQXbRz678RQpJ1v+Zw==
X-CSE-MsgGUID: rpk7MaBWSMCoZsd6QtA/6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40347761"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="40347761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 20:13:15 -0700
X-CSE-ConnectionGUID: LJl61zUmRqKMVOes5Bh/Uw==
X-CSE-MsgGUID: d3LIm2qpT+OoIGNGB/XDEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="92395125"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Aug 2024 20:13:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shKje-000DQK-1e;
	Fri, 23 Aug 2024 03:13:10 +0000
Date: Fri, 23 Aug 2024 11:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [arnd-playground:mm-6.9-test-merge-for-roxell 62/421]
 mm/kmemleak.c:466:26: error: implicit declaration of function
 'kmem_cache_alloc_noprof'; did you mean 'kmem_cache_alloc_node'?
Message-ID: <202408231147.3U7tgk1x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git mm-6.9-test-merge-for-roxell
head:   f6cdadcb0c9861e379739044d6e4a20911da851a
commit: de0ecc240fae03c3bb887c6265bc9a1529b600fb [62/421] mm/slub: avoid recursive loop with kmemleak
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240823/202408231147.3U7tgk1x-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231147.3U7tgk1x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231147.3U7tgk1x-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/kmemleak.c: In function 'mem_pool_alloc':
>> mm/kmemleak.c:466:26: error: implicit declaration of function 'kmem_cache_alloc_noprof'; did you mean 'kmem_cache_alloc_node'? [-Werror=implicit-function-declaration]
     466 |                 object = kmem_cache_alloc_noprof(object_cache, gfp_kmemleak_mask(gfp));
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
         |                          kmem_cache_alloc_node
>> mm/kmemleak.c:466:24: warning: assignment to 'struct kmemleak_object *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     466 |                 object = kmem_cache_alloc_noprof(object_cache, gfp_kmemleak_mask(gfp));
         |                        ^
   mm/kmemleak.c: In function 'add_scan_area':
>> mm/kmemleak.c:950:22: warning: assignment to 'struct kmemleak_scan_area *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     950 |                 area = kmem_cache_alloc_noprof(scan_area_cache, gfp_kmemleak_mask(gfp));
         |                      ^
   cc1: some warnings being treated as errors


vim +466 mm/kmemleak.c

   455	
   456	/*
   457	 * Memory pool allocation and freeing. kmemleak_lock must not be held.
   458	 */
   459	static struct kmemleak_object *mem_pool_alloc(gfp_t gfp)
   460	{
   461		unsigned long flags;
   462		struct kmemleak_object *object;
   463	
   464		/* try the slab allocator first */
   465		if (object_cache) {
 > 466			object = kmem_cache_alloc_noprof(object_cache, gfp_kmemleak_mask(gfp));
   467			if (object)
   468				return object;
   469		}
   470	
   471		/* slab allocation failed, try the memory pool */
   472		raw_spin_lock_irqsave(&kmemleak_lock, flags);
   473		object = list_first_entry_or_null(&mem_pool_free_list,
   474						  typeof(*object), object_list);
   475		if (object)
   476			list_del(&object->object_list);
   477		else if (mem_pool_free_count)
   478			object = &mem_pool[--mem_pool_free_count];
   479		else
   480			pr_warn_once("Memory pool empty, consider increasing CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE\n");
   481		raw_spin_unlock_irqrestore(&kmemleak_lock, flags);
   482	
   483		return object;
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
