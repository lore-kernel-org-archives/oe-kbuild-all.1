Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C76A191F6F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 19:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731785584; cv=none; b=MhIFtkPH5jeQ3rSZ9fQWVwvKdC1BwWegCv65ioFMspmKv/ugZWovGtz1BrypI+qHsDbvr3P19g3500dRpYbFG9u79y4GEx4MmnfMvzdUJZW7xOtt6gKw5ECYMh405bYh9cTib+3lnBO4R5liJ/WyZiOSX1Ata29yXGZsYUGIstA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731785584; c=relaxed/simple;
	bh=B4T9QYm5LcXuko+RR+60pRxQ/xocSLjPfOc7LcUZCgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jVpAKx8h+zuXkZfuT089q9L/kua+XEKgFlPNdY8GqLUXelY6RYpSuO7RW3mPnYnWO2ebE2vkiNJkyA166sp8JRL37KBJA20GlneePVQMBjfD3S5XBsSSGxgDvwylnkYBHKuWceqxQVUrJsMc3hP0Avsm3RiAVFth76SCpOQMqeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcdfOhPo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcdfOhPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731785583; x=1763321583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B4T9QYm5LcXuko+RR+60pRxQ/xocSLjPfOc7LcUZCgo=;
  b=lcdfOhPoxvfG5MlTDeWoflaXP45lpkuDUQWNHGr9GZp5Vr+MuqaZJ4gP
   R9mUA7zkJcXVKdBb6DcGb+nplla307uwudVH2IGtxvANlfLtX1Z5FHnZX
   aThdodvS+iHmB3lYkAzHYKMGo2uSiiHQx/I16eGxUNKwMSmMW7Oz0NSYv
   yu+r5zusY33dJS0EL+HfZbcHMV2MSRT8j7ahBAzt0lUcskliIcXu+EEF5
   8uB2PsvlSy0+2gdm4IDZHnqSua6ymLRyFX+64ejG7VIZXXwh8xOz9VE0l
   5DPdakpkHXf8GgISTIFA0p9bvdTEk/6QEdFJtF0h1qYdgpgYdqIh8ZWUk
   Q==;
X-CSE-ConnectionGUID: eRUhYWaSTSOmo3f0ksZLhw==
X-CSE-MsgGUID: IxMMJtzmRqudOCSitDttxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="49304890"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="49304890"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 11:33:03 -0800
X-CSE-ConnectionGUID: DEpxR7pITqm61ZxKbzv2FA==
X-CSE-MsgGUID: 3rFoeZz/SnKbeeFTKn2JwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93311282"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Nov 2024 11:33:01 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCOXT-00013t-1j;
	Sat, 16 Nov 2024 19:32:59 +0000
Date: Sun, 17 Nov 2024 03:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:trylock 19/20] mm/page_alloc.c:2896:40: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202411170306.Wz6PUPbG-lkp@intel.com>
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
config: x86_64-randconfig-123-20241116 (https://download.01.org/0day-ci/archive/20241117/202411170306.Wz6PUPbG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170306.Wz6PUPbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170306.Wz6PUPbG-lkp@intel.com/

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
