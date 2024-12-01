Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624A62CA8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 03:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733023057; cv=none; b=jtS0aiPTQsevrcWp968DI/LWnT2iQB0l+ZZfHZgjTO5E2MOtVIUYq1+Vk16tkxqOYSe65XvVChdcxxpSZqdcIaXPuYSNi/b9cd9DDPB8Q3gqyYzLf9zo34X3993mHXohygIL1V7h/tG69SfuL0+d+780H+KZtoYpRQRGOAXjtwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733023057; c=relaxed/simple;
	bh=JDdv/P9Ss926YzR+KD3B5wxJ+WpeFsztxH+zvftyJ90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jWt6Y/FSzIvRSEBXuctbslmgiVGX8i4UH+6Yat8tULRYoHC0ML5X5PJTw79d2/vxnpJ7aQH58JqohSrCepsG1ALhbCLVTcuoEX+4I6Lw/CK4Btkh8ZilA6E75hQ0SeOo3wwFMuzCyS/Pkx5+h8j04jiaRdujWxKu60I0RHtVv5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RA0pC9zd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RA0pC9zd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733023056; x=1764559056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JDdv/P9Ss926YzR+KD3B5wxJ+WpeFsztxH+zvftyJ90=;
  b=RA0pC9zdbLf6OsniTELqPwIrXXpxTs2KRR5kV6Gp0oi142Qn6IBei+0q
   PFdpIiVHO3ey4+sNQ7WbAzS6P3dzAr/jKe04bYNRt3G4p/Gumm9vLmoRL
   9DPDIJaztBh5umw55Xau3GCTALsNRe5k/0X+iBiWEEuaVSx7dOdEA59/q
   0PXXbDXD2aibeiO09c7UkcjG/5JNsTebR0/A971L1Vk8qJd9UOrwN5e3N
   wse4AiTWgQm9jLx09IH8iAD1clOe/9AhDzC7yM0FcnRnzqdHykZ+RoWTX
   UcRpGVzb+rxeVduSMi7Il2MOsFvVnnxWEEtfe6ZvOhlRUAr3zzVyHkelD
   Q==;
X-CSE-ConnectionGUID: EU5B7rZBT4+gQzFumfXPOA==
X-CSE-MsgGUID: sktU9VL2Rq6/O4w+WU2kUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="43689090"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="43689090"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 19:17:35 -0800
X-CSE-ConnectionGUID: 7dYYymIhS46drX+0I9/kLA==
X-CSE-MsgGUID: PrzOCY2xQcmyFscnHa42/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="97892804"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Nov 2024 19:17:34 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHaSh-0001BX-1Z;
	Sun, 01 Dec 2024 03:17:31 +0000
Date: Sun, 1 Dec 2024 11:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:trylock 19/20] mm/page_alloc.c:2896:40: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202412011116.Yo7WmzJY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   246f17ab718a8fa28d8d2a68d5972cec768ee23d
commit: d115d192d94c6ce6ea38ac969ee023f110de8c42 [19/20] mm, bpf: Introduce __GFP_TRYLOCK for best effort page allocation
config: x86_64-randconfig-123-20241116 (https://download.01.org/0day-ci/archive/20241201/202412011116.Yo7WmzJY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011116.Yo7WmzJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011116.Yo7WmzJY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c:2630:6: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c:2723:33: sparse: sparse: context imbalance in 'free_unref_folios' - unexpected unlock
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c:3011:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
>> mm/page_alloc.c:2896:40: sparse: sparse: Using plain integer as NULL pointer
   mm/page_alloc.c:4694:9: sparse: sparse: context imbalance in 'alloc_pages_bulk_noprof' - different lock contexts for basic block
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +2896 mm/page_alloc.c

  2883	
  2884	static __always_inline
  2885	struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
  2886				   unsigned int order, unsigned int alloc_flags,
  2887				   int migratetype)
  2888	{
  2889		struct page *page;
  2890		unsigned long flags;
  2891	
  2892		do {
  2893			page = NULL;
  2894			if (alloc_flags & ALLOC_TRYLOCK) {
  2895				if (!spin_trylock_irqsave(&zone->lock, flags))
> 2896					return 0;
  2897			} else {
  2898				spin_lock_irqsave(&zone->lock, flags);
  2899			}
  2900			if (alloc_flags & ALLOC_HIGHATOMIC)
  2901				page = __rmqueue_smallest(zone, order, MIGRATE_HIGHATOMIC);
  2902			if (!page) {
  2903				page = __rmqueue(zone, order, migratetype, alloc_flags);
  2904	
  2905				/*
  2906				 * If the allocation fails, allow OOM handling access
  2907				 * to HIGHATOMIC reserves as failing now is worse than
  2908				 * failing a high-order atomic allocation in the
  2909				 * future.
  2910				 */
  2911				if (!page && (alloc_flags & ALLOC_OOM))
  2912					page = __rmqueue_smallest(zone, order, MIGRATE_HIGHATOMIC);
  2913	
  2914				if (!page) {
  2915					spin_unlock_irqrestore(&zone->lock, flags);
  2916					return NULL;
  2917				}
  2918			}
  2919			spin_unlock_irqrestore(&zone->lock, flags);
  2920		} while (check_new_pages(page, order));
  2921	
  2922		__count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
  2923		zone_statistics(preferred_zone, zone, 1);
  2924	
  2925		return page;
  2926	}
  2927	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
