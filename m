Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20EE7DA82
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 01:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744595254; cv=none; b=L9Ai73xRoHcfACRvldqJ3PpLnG5V2Cx7DruNdCTZZFGVEA67p0qPEEGElVYV0BM3dKECZ5SXPpZkJlaigWwUHtRofYaNphqbzcdcsIXKsU3bp6nFLtvtk8i1A9ReTFR1g7Mq5kxOPoDcIcQnMIiuNVJ0/TEtenKcAyc54CfOfiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744595254; c=relaxed/simple;
	bh=XJizUkJr5QFflIxdRvYYPp7XQHm9+cTXlKPpuyXwSpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pdkVneyn6EPfhj17Z8tR6dAdrI+/qT1Rl3CRTuZWBGaKbxeIJqP/wbZHCHj/MJl4i2N85LFMmrXtL2cwlc8xEpP9ydsDJ0aKPBrjTodFqbU++LfreumvElTXlyozcCCenlcsvpwlwv9fZOrmpU9MEFZCO8y/EMQtYxS1IlxNTrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5NnRgym; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5NnRgym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744595252; x=1776131252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XJizUkJr5QFflIxdRvYYPp7XQHm9+cTXlKPpuyXwSpw=;
  b=Q5NnRgymrxCYBadJuBimCX3RimrjWYKPCVxI+g/eLLxO6VHc+EK+BjsS
   WYre3qVDX8uwE2ZEosOQlYCY+JVmSZNpmm2DKKwOb09GNbCWXmn+JQHK7
   8y5mzs/2Hf1sNKRUfNUc4n3Bd0PFrNtTdZCmK87AEKYrlwY3OmW+m4n0t
   5ADYetImqzhuSzidLeokYji2oeECeSi6ZR7XfMrjEYSpvwXJ0MLXbfqK4
   aaZtdfygQ1iO+wgjLan9cwdyGMskFacws54dFqLAOvuNgOSAXAGg4bM58
   uuR6nlPlmNbvRnQwmVkwR7/ftUsBPacKUFNf/4eWIFo6xl2Ru56v/elcK
   w==;
X-CSE-ConnectionGUID: rARvp+lwQBGNz1gxsZBsAg==
X-CSE-MsgGUID: 5QlZiWW8SvCJAR77jml2RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="71437241"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="71437241"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 18:47:32 -0700
X-CSE-ConnectionGUID: BR9KczeSQwmIeZSe0sdarQ==
X-CSE-MsgGUID: W5KcPyQ5S66gllnHIjFVEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="133782999"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Apr 2025 18:47:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u48v3-000D63-0i;
	Mon, 14 Apr 2025 01:47:29 +0000
Date: Mon, 14 Apr 2025 09:47:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 10/16] mm/migrate.c:191: warning:
 Function parameter or struct member 'dst' not described in
 'migrate_non_folio_page'
Message-ID: <202504140956.XfOvdbF7-lkp@intel.com>
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
commit: a3d0a56997669e386379c8b016a041fa5264fcae [10/16] mm/migrate: factor out non-folio page handling into migrate_non_folio_page()
config: arc-randconfig-001-20250414 (https://download.01.org/0day-ci/archive/20250414/202504140956.XfOvdbF7-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504140956.XfOvdbF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140956.XfOvdbF7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/migrate.c:68: warning: Function parameter or struct member 'mode' not described in 'isolate_non_folio_page'
>> mm/migrate.c:191: warning: Function parameter or struct member 'dst' not described in 'migrate_non_folio_page'
>> mm/migrate.c:191: warning: Function parameter or struct member 'src' not described in 'migrate_non_folio_page'
>> mm/migrate.c:191: warning: Function parameter or struct member 'mode' not described in 'migrate_non_folio_page'
>> mm/migrate.c:191: warning: Excess function parameter 'page' description in 'migrate_non_folio_page'


vim +191 mm/migrate.c

    53	
    54	/**
    55	 * isolate_non_folio_page - isolate a non-folio page for migration
    56	 * @page: The page.
    57	 *
    58	 * Try to isolate a non-folio page for migration. Will fail if the page is
    59	 * not a non-folio page that is movable, including if the page is already
    60	 * isolated or just was released by its owner.
    61	 *
    62	 * Once isolated, the page cannot get freed until it is either putback
    63	 * or migrated.
    64	 *
    65	 * Returns true if isolation succeeded, otherwise false.
    66	 */
    67	bool isolate_non_folio_page(struct page *page, isolate_mode_t mode)
  > 68	{
    69		/*
    70		 * TODO: these pages will not be folios in the future. All
    71		 * folio dependencies will have to be removed.
    72		 */
    73		struct folio *folio = folio_get_nontail_page(page);
    74		const struct movable_operations *mops;
    75	
    76		/*
    77		 * Avoid burning cycles with pages that are yet under __free_pages(),
    78		 * or just got freed under us.
    79		 *
    80		 * In case we 'win' a race for a movable page being freed under us and
    81		 * raise its refcount preventing __free_pages() from doing its job
    82		 * the put_page() at the end of this block will take care of
    83		 * release this page, thus avoiding a nasty leakage.
    84		 */
    85		if (!folio)
    86			goto out;
    87	
    88		/*
    89		 * Check movable flag before taking the page lock because
    90		 * we use non-atomic bitops on newly allocated page flags so
    91		 * unconditionally grabbing the lock ruins page's owner side.
    92		 */
    93		if (unlikely(!__PageMovable(page)))
    94			goto out_putfolio;
    95	
    96		/*
    97		 * As movable pages are not isolated from LRU lists, concurrent
    98		 * compaction threads can race against page migration functions
    99		 * as well as race against the releasing a page.
   100		 *
   101		 * In order to avoid having an already isolated movable page
   102		 * being (wrongly) re-isolated while it is under migration,
   103		 * or to avoid attempting to isolate pages being released,
   104		 * lets be sure we have the page lock
   105		 * before proceeding with the movable page isolation steps.
   106		 */
   107		if (unlikely(!folio_trylock(folio)))
   108			goto out_putfolio;
   109	
   110		if (!PageMovable(page) || PageIsolated(page))
   111			goto out_no_isolated;
   112	
   113		mops = page_movable_ops(page);
   114		if (WARN_ON_ONCE(!mops))
   115			goto out_no_isolated;
   116	
   117		if (!mops->isolate_page(page, mode))
   118			goto out_no_isolated;
   119	
   120		/* Driver shouldn't use the isolated flag */
   121		VM_WARN_ON_ONCE_PAGE(PageIsolated(page), page);
   122		SetPageIsolated(page);
   123		folio_unlock(folio);
   124	
   125		return true;
   126	
   127	out_no_isolated:
   128		folio_unlock(folio);
   129	out_putfolio:
   130		folio_put(folio);
   131	out:
   132		return false;
   133	}
   134	
   135	/**
   136	 * putback_non_folio_page - putback a non-folio page
   137	 * @page: The page.
   138	 *
   139	 * Putback a non-folio page that was previously isolated
   140	 * with isolated_non_folio_page().
   141	 *
   142	 * After the page was putback, it might get freed at any time and must no
   143	 * longer be touched by the caller.
   144	 */
   145	static void putback_non_folio_page(struct page *page)
   146	{
   147		/*
   148		 * TODO: these pages will not be folios in the future. All
   149		 * folio dependencies will have to be removed.
   150		 */
   151		struct folio *folio = page_folio(page);
   152	
   153		VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
   154		folio_lock(folio);
   155		/* If the page was released by it's owner, there is nothing to do. */
   156		if (PageMovable(page))
   157			page_movable_ops(page)->putback_page(page);
   158		ClearPageIsolated(page);
   159		folio_unlock(folio);
   160		folio_put(folio);
   161	}
   162	
   163	/**
   164	 * migrate_non_folio_page - migrate a non-folio page
   165	 * @page: The page.
   166	 *
   167	 * Migrate a non-folio page that was previously isolated with
   168	 * isolated_non_folio_page().
   169	 *
   170	 * If the src page was already released by its owner, the src page is
   171	 * un-isolated and migration succeeds; the migration core will be the
   172	 * owner of both pages.
   173	 *
   174	 * If the src page was not released by its owner and the migration was
   175	 * successful, the owner of the src page and the dst page are swapped and
   176	 * the src page is un-isolated.
   177	 *
   178	 * If migration fails, the ownership stays unmodified and the src page
   179	 * remains isolated: migration may be retried later or the page can be putback.
   180	 *
   181	 * TODO: migration core will treat both pages as folios and lock them before
   182	 * this call to unlock them after this call. Further, the folio refcounts on
   183	 * src and dst are also released by migration core. These pages will not be
   184	 * folios in the future, so that must be reworked.
   185	 *
   186	 * Returns MIGRATEPAGE_SUCCESS on success, otherwise a negative error
   187	 * code.
   188	 */
   189	static int migrate_non_folio_page(struct page *dst, struct page *src,
   190			enum migrate_mode mode)
 > 191	{
   192		int rc = MIGRATEPAGE_SUCCESS;
   193	
   194		VM_WARN_ON_ONCE(!PageIsolated(src));
   195		/* If the page was released by it's owner, there is nothing to do. */
   196		if (PageMovable(src))
   197			rc = page_movable_ops(src)->migrate_page(dst, src, mode);
   198		if (rc == MIGRATEPAGE_SUCCESS)
   199			ClearPageIsolated(src);
   200		return rc;
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
