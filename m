Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C7419A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 00:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744591464; cv=none; b=uq6gfjyDUZr6tpfthm2U0T5O29ND1gKJWVWAn72TBFX4dEPxmDLXngvcQdI+CvsA9RvJkG2kH8auO/d/d4rCbb9y/gSaBFg3LeBIcmq+llBYfOD5VmhB3+UbMLCoZhTndTWMQsSorDlSdMrEP6MORJmWUUQUADMSC+2O3bbA1XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744591464; c=relaxed/simple;
	bh=VKiVq88nkFxD1qElu85t1tHeut03/OMM2e57IwxPs0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Geq6HYCC5aqfGg5a+qSNPLWOA3kgHEeF6B2BRCsay8an+qCt5NT/blSZ0oMwMuaUepj+wV9seqBxQSDt1kf4yBrb81pxS0EyClxr9ZfUQyk8y7C5jitxlHrrGp50pVbWgxZjTJD3uOjRlEazK5p5pBWrU8SU5gSa7CqWkAdnusk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eo7M2IDp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eo7M2IDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744591462; x=1776127462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VKiVq88nkFxD1qElu85t1tHeut03/OMM2e57IwxPs0c=;
  b=eo7M2IDpexvDzDBkFnhJcM5LsgSkdyIOhhm4859Fd4iQ3O6R4mYw5syZ
   nphT5unFV+KnBH37ufGk10cOTZPeZP6VSXBnlBNwnQYbjv/b5yP6oYt5C
   x1nYRb2Fw8+xcCFt2MIH1K9DzcHvjFrwgUlJRJra9OfHU3PbEnDWKv4Ln
   gXwy7VRATK79ssy0S/Mw5HxPRYGuexKfKLWxLqCLjQxSgi4MrA688J2dO
   p9oIkOeOIGXqnRi4vGXsVvwyWesroeKOkab/lqehoO75iTdANNPGjLQb2
   v9MVBpUTtHH+8hpbZdJlJ/fHWYm1x96+dn46ySGXLWFpD4XxOW3kkn24P
   w==;
X-CSE-ConnectionGUID: XYtXjnirTgqM/4xV3SJZ8w==
X-CSE-MsgGUID: fMOCWNOkSTaQxffh76d3TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57433291"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="57433291"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 17:44:22 -0700
X-CSE-ConnectionGUID: tXobmyIbTUeoTTdsXekgQg==
X-CSE-MsgGUID: BqedZdGKRamqirNCl3gGcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130220343"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Apr 2025 17:44:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u47vu-000Czz-2s;
	Mon, 14 Apr 2025 00:44:18 +0000
Date: Mon, 14 Apr 2025 08:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 8/16] mm/migrate.c:68: warning: Function
 parameter or struct member 'mode' not described in 'isolate_non_folio_page'
Message-ID: <202504140819.Et4b8g2L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   07b1b56f4f50e3b2ce6818d9ca0fbdbcd138d66f
commit: d1f83db9b1bc5d67282b625b124f8b18051d77f6 [8/16] mm/migrate: rename isolate_movable_page() to isolate_non_folio_page()
config: arc-randconfig-001-20250414 (https://download.01.org/0day-ci/archive/20250414/202504140819.Et4b8g2L-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504140819.Et4b8g2L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140819.Et4b8g2L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/migrate.c:68: warning: Function parameter or struct member 'mode' not described in 'isolate_non_folio_page'


vim +68 mm/migrate.c

b20a35035f983f Christoph Lameter       2006-03-22   53  
d1f83db9b1bc5d David Hildenbrand       2025-04-10   54  /**
d1f83db9b1bc5d David Hildenbrand       2025-04-10   55   * isolate_non_folio_page - isolate a non-folio page for migration
d1f83db9b1bc5d David Hildenbrand       2025-04-10   56   * @page: The page.
d1f83db9b1bc5d David Hildenbrand       2025-04-10   57   *
d1f83db9b1bc5d David Hildenbrand       2025-04-10   58   * Try to isolate a non-folio page for migration. Will fail if the page is
d1f83db9b1bc5d David Hildenbrand       2025-04-10   59   * not a non-folio page that is movable, including if the page is already
d1f83db9b1bc5d David Hildenbrand       2025-04-10   60   * isolated or just was released by its owner.
d1f83db9b1bc5d David Hildenbrand       2025-04-10   61   *
d1f83db9b1bc5d David Hildenbrand       2025-04-10   62   * Once isolated, the page cannot get freed until it is either putback
d1f83db9b1bc5d David Hildenbrand       2025-04-10   63   * or migrated.
d1f83db9b1bc5d David Hildenbrand       2025-04-10   64   *
d1f83db9b1bc5d David Hildenbrand       2025-04-10   65   * Returns true if isolation succeeded, otherwise false.
d1f83db9b1bc5d David Hildenbrand       2025-04-10   66   */
d1f83db9b1bc5d David Hildenbrand       2025-04-10   67  bool isolate_non_folio_page(struct page *page, isolate_mode_t mode)
bda807d4445414 Minchan Kim             2016-07-26  @68  {
d1f83db9b1bc5d David Hildenbrand       2025-04-10   69  	/*
d1f83db9b1bc5d David Hildenbrand       2025-04-10   70  	 * TODO: these pages will not be folios in the future. All
d1f83db9b1bc5d David Hildenbrand       2025-04-10   71  	 * folio dependencies will have to be removed.
d1f83db9b1bc5d David Hildenbrand       2025-04-10   72  	 */
19979497c02a36 Vishal Moola (Oracle    2023-01-30   73) 	struct folio *folio = folio_get_nontail_page(page);
68f2736a858324 Matthew Wilcox (Oracle  2022-06-07   74) 	const struct movable_operations *mops;
bda807d4445414 Minchan Kim             2016-07-26   75  
bda807d4445414 Minchan Kim             2016-07-26   76  	/*
bda807d4445414 Minchan Kim             2016-07-26   77  	 * Avoid burning cycles with pages that are yet under __free_pages(),
bda807d4445414 Minchan Kim             2016-07-26   78  	 * or just got freed under us.
bda807d4445414 Minchan Kim             2016-07-26   79  	 *
bda807d4445414 Minchan Kim             2016-07-26   80  	 * In case we 'win' a race for a movable page being freed under us and
bda807d4445414 Minchan Kim             2016-07-26   81  	 * raise its refcount preventing __free_pages() from doing its job
bda807d4445414 Minchan Kim             2016-07-26   82  	 * the put_page() at the end of this block will take care of
bda807d4445414 Minchan Kim             2016-07-26   83  	 * release this page, thus avoiding a nasty leakage.
bda807d4445414 Minchan Kim             2016-07-26   84  	 */
19979497c02a36 Vishal Moola (Oracle    2023-01-30   85) 	if (!folio)
bda807d4445414 Minchan Kim             2016-07-26   86  		goto out;
bda807d4445414 Minchan Kim             2016-07-26   87  
bda807d4445414 Minchan Kim             2016-07-26   88  	/*
8b8817630ae800 Vlastimil Babka         2022-11-04   89  	 * Check movable flag before taking the page lock because
8b8817630ae800 Vlastimil Babka         2022-11-04   90  	 * we use non-atomic bitops on newly allocated page flags so
8b8817630ae800 Vlastimil Babka         2022-11-04   91  	 * unconditionally grabbing the lock ruins page's owner side.
bda807d4445414 Minchan Kim             2016-07-26   92  	 */
d1f83db9b1bc5d David Hildenbrand       2025-04-10   93  	if (unlikely(!__PageMovable(page)))
19979497c02a36 Vishal Moola (Oracle    2023-01-30   94) 		goto out_putfolio;
8b8817630ae800 Vlastimil Babka         2022-11-04   95  
bda807d4445414 Minchan Kim             2016-07-26   96  	/*
bda807d4445414 Minchan Kim             2016-07-26   97  	 * As movable pages are not isolated from LRU lists, concurrent
bda807d4445414 Minchan Kim             2016-07-26   98  	 * compaction threads can race against page migration functions
bda807d4445414 Minchan Kim             2016-07-26   99  	 * as well as race against the releasing a page.
bda807d4445414 Minchan Kim             2016-07-26  100  	 *
bda807d4445414 Minchan Kim             2016-07-26  101  	 * In order to avoid having an already isolated movable page
bda807d4445414 Minchan Kim             2016-07-26  102  	 * being (wrongly) re-isolated while it is under migration,
bda807d4445414 Minchan Kim             2016-07-26  103  	 * or to avoid attempting to isolate pages being released,
bda807d4445414 Minchan Kim             2016-07-26  104  	 * lets be sure we have the page lock
bda807d4445414 Minchan Kim             2016-07-26  105  	 * before proceeding with the movable page isolation steps.
bda807d4445414 Minchan Kim             2016-07-26  106  	 */
19979497c02a36 Vishal Moola (Oracle    2023-01-30  107) 	if (unlikely(!folio_trylock(folio)))
19979497c02a36 Vishal Moola (Oracle    2023-01-30  108) 		goto out_putfolio;
bda807d4445414 Minchan Kim             2016-07-26  109  
d1f83db9b1bc5d David Hildenbrand       2025-04-10  110  	if (!PageMovable(page) || PageIsolated(page))
bda807d4445414 Minchan Kim             2016-07-26  111  		goto out_no_isolated;
bda807d4445414 Minchan Kim             2016-07-26  112  
d1f83db9b1bc5d David Hildenbrand       2025-04-10  113  	mops = page_movable_ops(page);
d1f83db9b1bc5d David Hildenbrand       2025-04-10  114  	if (WARN_ON_ONCE(!mops))
d1f83db9b1bc5d David Hildenbrand       2025-04-10  115  		goto out_no_isolated;
bda807d4445414 Minchan Kim             2016-07-26  116  
d1f83db9b1bc5d David Hildenbrand       2025-04-10  117  	if (!mops->isolate_page(page, mode))
bda807d4445414 Minchan Kim             2016-07-26  118  		goto out_no_isolated;
bda807d4445414 Minchan Kim             2016-07-26  119  
4dc7d37370951f Matthew Wilcox (Oracle  2024-03-26  120) 	/* Driver shouldn't use the isolated flag */
d1f83db9b1bc5d David Hildenbrand       2025-04-10  121  	VM_WARN_ON_ONCE_PAGE(PageIsolated(page), page);
d1f83db9b1bc5d David Hildenbrand       2025-04-10  122  	SetPageIsolated(page);
19979497c02a36 Vishal Moola (Oracle    2023-01-30  123) 	folio_unlock(folio);
bda807d4445414 Minchan Kim             2016-07-26  124  
cd7755800eb54e Baolin Wang             2023-02-15  125  	return true;
bda807d4445414 Minchan Kim             2016-07-26  126  
bda807d4445414 Minchan Kim             2016-07-26  127  out_no_isolated:
19979497c02a36 Vishal Moola (Oracle    2023-01-30  128) 	folio_unlock(folio);
19979497c02a36 Vishal Moola (Oracle    2023-01-30  129) out_putfolio:
19979497c02a36 Vishal Moola (Oracle    2023-01-30  130) 	folio_put(folio);
bda807d4445414 Minchan Kim             2016-07-26  131  out:
cd7755800eb54e Baolin Wang             2023-02-15  132  	return false;
bda807d4445414 Minchan Kim             2016-07-26  133  }
bda807d4445414 Minchan Kim             2016-07-26  134  

:::::: The code at line 68 was first introduced by commit
:::::: bda807d4445414e8e77da704f116bb0880fe0c76 mm: migrate: support non-lru movable page migration

:::::: TO: Minchan Kim <minchan@kernel.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
