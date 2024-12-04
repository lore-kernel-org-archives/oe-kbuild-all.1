Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963AA1CEADF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 14:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321040; cv=none; b=i9QXaf3Bde09eizmMyCN6XCTEYsHMbFMlHUxTCn0nN+FVzZoHvWkj6WKke3MJdnTnWNlxhGn7PrWbqKUjnSRBEPJvEx24tlwEdETOt8AKYpVU3ZNw9MYCn9LSZc8PCspekIb95zZgXEVtBTuzcoe8uPJuZ+v3bIzq1AJ6LUL5XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321040; c=relaxed/simple;
	bh=81gpKJadFSvTKvMx7otkmqU74yODTXZmBugbQWFc5wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKtrFdN6cq+QWVPA9ghXufq7Xpsfw+nkRcIPRH00JVF3sFUY9wSpYmbyhwXOIq4cUQid6pjPLpDuqPm16mApFywFqCXsm4KmADb98QCJSXtcOwT6159lOHfP2NVO1DPlQ7IqiM9jl+fEttTFfYt6tWTL+w02KLCR/Xhya3w6oQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4idMuyr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4idMuyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733321038; x=1764857038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=81gpKJadFSvTKvMx7otkmqU74yODTXZmBugbQWFc5wE=;
  b=U4idMuyrajyPqVkf90uCteRQRYCFPNpQS5w78o1rowntALjN6kwWQFf2
   nSfVTby/GYVjKhX/Nk7peVoN1GoIYfR/tM9udSnPZQJjaP3wlpn6vGtI5
   SGPkQHAulLimeQi37WalZpDQ2mvv+nT1ES6AWYb6x+9F936+m0y86ULGP
   DI5AQ8ih6qT4kwX3wmH2axc1At0ij6i+4JjlpkZW0byvzFsc1N6eceC03
   kAEzdh5TpWRTVsxqyMvDfbLB/3E7bAIEL2wQRqOj3GJ4tOroEZNWSjWi8
   izxhoIKDKXbzoSm8C22Qazxx99Dndf2dG0VzvG9AYQFRNWfxBdtfm9DB1
   g==;
X-CSE-ConnectionGUID: Pgxh8KNZQPWl99gzead7vA==
X-CSE-MsgGUID: r7cpYsPWSwqZSOIwk5wQEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44617543"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44617543"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:03:58 -0800
X-CSE-ConnectionGUID: kfkFvelOQ2SbGPFjpmJwiA==
X-CSE-MsgGUID: 9BUe2tI6T9CsJLjgwyH1nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94600324"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 06:03:57 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIpys-00035F-2E;
	Wed, 04 Dec 2024 14:03:54 +0000
Date: Wed, 4 Dec 2024 22:03:36 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 1/2] mm: vmascan: add find_folios_written_back()
 helper
Message-ID: <202412042108.Mu208bDJ-lkp@intel.com>
References: <20241204040158.2768519-2-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204040158.2768519-2-chenridong@huaweicloud.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/mm-vmascan-add-find_folios_written_back-helper/20241204-123817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241204040158.2768519-2-chenridong%40huaweicloud.com
patch subject: [RFC PATCH v3 1/2] mm: vmascan: add find_folios_written_back() helper
config: i386-buildonly-randconfig-004 (https://download.01.org/0day-ci/archive/20241204/202412042108.Mu208bDJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042108.Mu208bDJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042108.Mu208bDJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/thread_info.h:27,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/vmscan.c:15:
   mm/vmscan.c: In function 'find_folios_written_back':
>> mm/vmscan.c:318:78: error: 'LRU_REFS_FLAGS' undeclared (first use in this function); did you mean 'LRU_REFS_MASK'?
     318 |                                 set_mask_bits(&folio->flags, LRU_REFS_MASK | LRU_REFS_FLAGS,
         |                                                                              ^~~~~~~~~~~~~~
   include/linux/bitops.h:330:40: note: in definition of macro 'set_mask_bits'
     330 |         const typeof(*(ptr)) mask__ = (mask), bits__ = (bits);  \
         |                                        ^~~~
   mm/vmscan.c:318:78: note: each undeclared identifier is reported only once for each function it appears in
     318 |                                 set_mask_bits(&folio->flags, LRU_REFS_MASK | LRU_REFS_FLAGS,
         |                                                                              ^~~~~~~~~~~~~~
   include/linux/bitops.h:330:40: note: in definition of macro 'set_mask_bits'
     330 |         const typeof(*(ptr)) mask__ = (mask), bits__ = (bits);  \
         |                                        ^~~~


vim +318 mm/vmscan.c

   285	
   286	/**
   287	 * find_folios_written_back - Find and move the written back folios to a new list.
   288	 * @list: filios list
   289	 * @clean: the written back folios list
   290	 * @skip: whether skip to move the written back folios to clean list.
   291	 */
   292	static inline void find_folios_written_back(struct list_head *list,
   293			struct list_head *clean, bool skip)
   294	{
   295		struct folio *folio;
   296		struct folio *next;
   297	
   298		list_for_each_entry_safe_reverse(folio, next, list, lru) {
   299			if (!folio_evictable(folio)) {
   300				list_del(&folio->lru);
   301				folio_putback_lru(folio);
   302				continue;
   303			}
   304	
   305			if (folio_test_reclaim(folio) &&
   306			    (folio_test_dirty(folio) || folio_test_writeback(folio))) {
   307				/* restore LRU_REFS_FLAGS cleared by isolate_folio() */
   308				if (lru_gen_enabled() && folio_test_workingset(folio))
   309					folio_set_referenced(folio);
   310				continue;
   311			}
   312	
   313			if (skip || folio_test_active(folio) || folio_test_referenced(folio) ||
   314			    folio_mapped(folio) || folio_test_locked(folio) ||
   315			    folio_test_dirty(folio) || folio_test_writeback(folio)) {
   316				/* don't add rejected folios to the oldest generation */
   317				if (lru_gen_enabled())
 > 318					set_mask_bits(&folio->flags, LRU_REFS_MASK | LRU_REFS_FLAGS,
   319						      BIT(PG_active));
   320				continue;
   321			}
   322	
   323			/* retry folios that may have missed folio_rotate_reclaimable() */
   324			list_move(&folio->lru, clean);
   325		}
   326	}
   327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
