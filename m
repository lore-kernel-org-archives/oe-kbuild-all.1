Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D4318D65E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 19:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744487519; cv=none; b=OS5pzegmZF/Jz+DQxrBc381K6u2nAC+lZEfFTU3iuaj32N2SBbc2eCj7OfBZO2cyk8IfuNI45qW9HrbGZInONbg88c30yWQ8MlY8B0I5bzZ6V2YETQQvD3zBMjn232v21/MEKhB1AVn5F1/oS7qAkhshF2HsSDP6zkoWWZLEI5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744487519; c=relaxed/simple;
	bh=FnB/Pg4E+4V71kjRpKnUL+wzQF2U6bgfDhIEC0VBke4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0Hx05bdO6wFNggjAZdXQB7jxVTVSWgzdF+3iFuzlhKPuzsANnrXhyMnlosZBe9p6aRtAdPm6CMyPiBYDxoPa/qfwZ+GAf9IshRNcy6Zulp9D+jS6wlOd+GjskaB9/fBhhAh45sOtZ72UaaevZ2TIRnOL3vQl7dCfIWXvV45KE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5ucVMib; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5ucVMib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744487517; x=1776023517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FnB/Pg4E+4V71kjRpKnUL+wzQF2U6bgfDhIEC0VBke4=;
  b=I5ucVMib6VSDHieAP2VnmdLSKGYYb9COM9Wg4QOq7+Av8l6iHgJC4VEM
   FTe0dDeFG18xXBI2qA0CPaSKjR8tYBx74JmAtv/CbAkTslSMsbDdaKkaH
   NStj7/KYTAQ72tyQEOcUj7cgnliPdANnJHCCpDVLGNR1hUCTJgXCldELK
   azdFEmqAcY1QE5i7Ga6JQ0To7D90Pqf9N7+isifQkYPyRu9CctzKS1Qq7
   BgxpQEentx0sn8cPeV6o1RdvdNAPHCxR4FB/FxuJRe9TRsvFlUHYo3Ked
   j640zYCSaDTkt5RyW7YkYXLkZ/PUEQ5YHdGaxQm7U70IuREhNrzyBOMSy
   A==;
X-CSE-ConnectionGUID: 3cX31Kw2TmCVM30FKfBiug==
X-CSE-MsgGUID: 8i88nPwuQiaN3cASLW12GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45915438"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="45915438"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 12:51:56 -0700
X-CSE-ConnectionGUID: 74Xsw1YqSfixnUekTQQhmA==
X-CSE-MsgGUID: 8jj9JOq+QSqwlg6ddqacqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="134229532"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Apr 2025 12:51:55 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3gtM-000C5Q-1k;
	Sat, 12 Apr 2025 19:51:52 +0000
Date: Sun, 13 Apr 2025 03:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 16/16] mm/compaction.c:468:46: warning:
 'struct compact_control' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202504130320.5rup3EAJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   803af5b7e068ea5c68e5b908e799abf3f254c646
commit: 803af5b7e068ea5c68e5b908e799abf3f254c646 [16/16] tmp
config: sparc64-randconfig-002-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130320.5rup3EAJ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130320.5rup3EAJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130320.5rup3EAJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from mm/compaction.c:11:
   include/linux/page-flags.h: In function 'page_has_non_folio_type':
   include/linux/page-flags.h:989:45: error: 'const struct page' has no member named 'type'
     989 |         const int page_type = data_race(page->type);
         |                                             ^~
   include/linux/compiler.h:189:28: note: in definition of macro 'data_race'
     189 |         __auto_type __v = (expr);                                       \
         |                            ^~~~
   include/linux/compiler.h:191:9: error: '__v' undeclared (first use in this function)
     191 |         __v;                                                            \
         |         ^~~
   include/linux/page-flags.h:989:31: note: in expansion of macro 'data_race'
     989 |         const int page_type = data_race(page->type);
         |                               ^~~~~~~~~
   include/linux/compiler.h:191:9: note: each undeclared identifier is reported only once for each function it appears in
     191 |         __v;                                                            \
         |         ^~~
   include/linux/page-flags.h:989:31: note: in expansion of macro 'data_race'
     989 |         const int page_type = data_race(page->type);
         |                               ^~~~~~~~~
   In file included from include/linux/mmzone.h:23,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16:
   include/linux/page-flags.h: In function 'page_test_non_folio_movable':
   include/linux/page-flags.h:1198:74: error: expected ';' before '}' token
    1198 |         return PageNonFolioMovable(page) && page_has_non_folio_type(page)
         |                                                                          ^
         |                                                                          ;
    1199 | }
         | ~                                                                         
   mm/compaction.c: At top level:
>> mm/compaction.c:468:46: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
     468 | static inline bool isolation_suitable(struct compact_control *cc,
         |                                              ^~~~~~~~~~~~~~~
   mm/compaction.c:479:49: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
     479 | static inline void update_pageblock_skip(struct compact_control *cc,
         |                                                 ^~~~~~~~~~~~~~~
   mm/compaction.c:484:42: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
     484 | static void update_cached_migrate(struct compact_control *cc, unsigned long pfn)
         |                                          ^~~~~~~~~~~~~~~
   mm/compaction.c:488:38: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
     488 | static bool test_and_set_skip(struct compact_control *cc, struct page *page)
         |                                      ^~~~~~~~~~~~~~~
   mm/compaction.c:504:56: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
     504 |                                                 struct compact_control *cc)
         |                                                        ^~~~~~~~~~~~~~~
   mm/compaction.c: In function 'compact_lock_irqsave':
   mm/compaction.c:508:15: error: invalid use of undefined type 'struct compact_control'
     508 |         if (cc->mode == MIGRATE_ASYNC && !cc->contended) {
         |               ^~
   mm/compaction.c:508:45: error: invalid use of undefined type 'struct compact_control'
     508 |         if (cc->mode == MIGRATE_ASYNC && !cc->contended) {
         |                                             ^~
   mm/compaction.c:512:19: error: invalid use of undefined type 'struct compact_control'
     512 |                 cc->contended = true;
         |                   ^~
   mm/compaction.c: At top level:
   mm/compaction.c:532:59: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
     532 |                 unsigned long flags, bool *locked, struct compact_control *cc)
         |                                                           ^~~~~~~~~~~~~~~
   mm/compaction.c: In function 'compact_unlock_should_abort':
   mm/compaction.c:540:19: error: invalid use of undefined type 'struct compact_control'
     540 |                 cc->contended = true;
         |                   ^~
   mm/compaction.c: At top level:
   mm/compaction.c:554:53: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
     554 | static unsigned long isolate_freepages_block(struct compact_control *cc,
         |                                                     ^~~~~~~~~~~~~~~
   mm/compaction.c: In function 'isolate_freepages_block':
   mm/compaction.c:584:55: error: invalid use of undefined type 'struct compact_control'
     584 |                     && compact_unlock_should_abort(&cc->zone->lock, flags,
         |                                                       ^~
   mm/compaction.c:585:74: error: passing argument 4 of 'compact_unlock_should_abort' from incompatible pointer type [-Wincompatible-pointer-types]
     585 |                                                                 &locked, cc))
         |                                                                          ^~
         |                                                                          |
         |                                                                          struct compact_control *
   mm/compaction.c:532:76: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
     532 |                 unsigned long flags, bool *locked, struct compact_control *cc)
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/compaction.c:614:58: error: invalid use of undefined type 'struct compact_control'
     614 |                         locked = compact_lock_irqsave(&cc->zone->lock,
         |                                                          ^~
   mm/compaction.c:615:73: error: passing argument 3 of 'compact_lock_irqsave' from incompatible pointer type [-Wincompatible-pointer-types]
     615 |                                                                 &flags, cc);
         |                                                                         ^~
         |                                                                         |
         |                                                                         struct compact_control *
   mm/compaction.c:504:73: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
     504 |                                                 struct compact_control *cc)
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/compaction.c:631:19: error: invalid use of undefined type 'struct compact_control'
     631 |                 cc->nr_freepages += isolated;
         |                   ^~
   mm/compaction.c:634:34: error: invalid use of undefined type 'struct compact_control'
     634 |                 if (!strict && cc->nr_migratepages <= cc->nr_freepages) {
         |                                  ^~
   mm/compaction.c:634:57: error: invalid use of undefined type 'struct compact_control'
     634 |                 if (!strict && cc->nr_migratepages <= cc->nr_freepages) {
         |                                                         ^~
   mm/compaction.c:650:43: error: invalid use of undefined type 'struct compact_control'
     650 |                 spin_unlock_irqrestore(&cc->zone->lock, flags);
         |                                           ^~
   mm/compaction.c:658:9: error: implicit declaration of function 'trace_mm_compaction_isolate_freepages' [-Wimplicit-function-declaration]
     658 |         trace_mm_compaction_isolate_freepages(*start_pfn, blockpfn,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:672:11: error: invalid use of undefined type 'struct compact_control'
     672 |         cc->total_free_scanned += nr_scanned;
         |           ^~
   mm/compaction.c: At top level:
   mm/compaction.c:693:32: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
     693 | isolate_freepages_range(struct compact_control *cc,
         |                                ^~~~~~~~~~~~~~~
>> mm/compaction.c:693:1: warning: no previous prototype for 'isolate_freepages_range' [-Wmissing-prototypes]
     693 | isolate_freepages_range(struct compact_control *cc,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c: In function 'isolate_freepages_range':
   mm/compaction.c:700:35: error: invalid use of undefined type 'struct compact_control'
     700 |                 INIT_LIST_HEAD(&cc->freepages[order]);
         |                                   ^~
   mm/compaction.c:704:33: error: invalid use of undefined type 'struct compact_control'
     704 |         if (block_start_pfn < cc->zone->zone_start_pfn)
         |                                 ^~
   mm/compaction.c:705:37: error: invalid use of undefined type 'struct compact_control'
     705 |                 block_start_pfn = cc->zone->zone_start_pfn;
         |                                     ^~
   mm/compaction.c:727:58: error: invalid use of undefined type 'struct compact_control'
     727 |                                         block_end_pfn, cc->zone))
         |                                                          ^~
   mm/compaction.c:731:58: error: invalid use of undefined type 'struct compact_control'
     731 |                                         block_end_pfn, cc->freepages, 0, true);
         |                                                          ^~
   mm/compaction.c:730:52: error: passing argument 1 of 'isolate_freepages_block' from incompatible pointer type [-Wincompatible-pointer-types]
     730 |                 isolated = isolate_freepages_block(cc, &isolate_start_pfn,
         |                                                    ^~
         |                                                    |
         |                                                    struct compact_control *
   mm/compaction.c:554:70: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
     554 | static unsigned long isolate_freepages_block(struct compact_control *cc,
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/compaction.c:750:17: error: implicit declaration of function 'release_free_list'; did you mean 'release_region'? [-Wimplicit-function-declaration]
     750 |                 release_free_list(cc->freepages);
         |                 ^~~~~~~~~~~~~~~~~
         |                 release_region
   mm/compaction.c:750:37: error: invalid use of undefined type 'struct compact_control'
     750 |                 release_free_list(cc->freepages);
         |                                     ^~
   mm/compaction.c: At top level:
   mm/compaction.c:759:38: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
     759 | static bool too_many_isolated(struct compact_control *cc)
         |                                      ^~~~~~~~~~~~~~~
   mm/compaction.c: In function 'too_many_isolated':
   mm/compaction.c:761:30: error: invalid use of undefined type 'struct compact_control'
     761 |         pg_data_t *pgdat = cc->zone->zone_pgdat;
         |                              ^~
   mm/compaction.c:779:15: error: invalid use of undefined type 'struct compact_control'
     779 |         if (cc->gfp_mask & __GFP_FS) {
         |               ^~
   mm/compaction.c: At top level:
   mm/compaction.c:835:35: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
     835 | isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
         |                                   ^~~~~~~~~~~~~~~
   mm/compaction.c: In function 'isolate_migratepages_block':
   mm/compaction.c:838:30: error: invalid use of undefined type 'struct compact_control'
     838 |         pg_data_t *pgdat = cc->zone->zone_pgdat;
         |                              ^~
   mm/compaction.c:852:11: error: invalid use of undefined type 'struct compact_control'
     852 |         cc->migrate_pfn = low_pfn;
         |           ^~
   mm/compaction.c:859:43: error: passing argument 1 of 'too_many_isolated' from incompatible pointer type [-Wincompatible-pointer-types]
     859 |         while (unlikely(too_many_isolated(cc))) {
         |                                           ^~
         |                                           |
         |                                           struct compact_control *
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   mm/compaction.c:759:55: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
     759 | static bool too_many_isolated(struct compact_control *cc)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/compaction.c:861:23: error: invalid use of undefined type 'struct compact_control'
     861 |                 if (cc->nr_migratepages)
         |                       ^~
   mm/compaction.c:865:23: error: invalid use of undefined type 'struct compact_control'
     865 |                 if (cc->mode == MIGRATE_ASYNC)
         |                       ^~
   mm/compaction.c:876:15: error: invalid use of undefined type 'struct compact_control'
     876 |         if (cc->direct_compaction && (cc->mode == MIGRATE_ASYNC)) {
         |               ^~
   mm/compaction.c:876:41: error: invalid use of undefined type 'struct compact_control'
     876 |         if (cc->direct_compaction && (cc->mode == MIGRATE_ASYNC)) {
         |                                         ^~
   mm/compaction.c:878:33: error: implicit declaration of function 'block_end_pfn'; did you mean 'zone_end_pfn'? [-Wimplicit-function-declaration]
     878 |                 next_skip_pfn = block_end_pfn(low_pfn, cc->order);
         |                                 ^~~~~~~~~~~~~
         |                                 zone_end_pfn
   mm/compaction.c:878:58: error: invalid use of undefined type 'struct compact_control'
     878 |                 next_skip_pfn = block_end_pfn(low_pfn, cc->order);
         |                                                          ^~
   mm/compaction.c:904:66: error: invalid use of undefined type 'struct compact_control'
     904 |                         next_skip_pfn = block_end_pfn(low_pfn, cc->order);
         |                                                                  ^~
   mm/compaction.c:919:35: error: invalid use of undefined type 'struct compact_control'
     919 |                                 cc->contended = true;
         |                                   ^~
   mm/compaction.c:939:50: error: invalid use of undefined type 'struct compact_control'
     939 |                                     low_pfn == cc->zone->zone_start_pfn)) {
         |                                                  ^~
   mm/compaction.c:940:49: error: passing argument 1 of 'isolation_suitable' from incompatible pointer type [-Wincompatible-pointer-types]
     940 |                         if (!isolation_suitable(cc, page)) {
         |                                                 ^~
         |                                                 |
         |                                                 struct compact_control *
   mm/compaction.c:468:63: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
     468 | static inline bool isolation_suitable(struct compact_control *cc,
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/compaction.c:955:32: error: invalid use of undefined type 'struct compact_control'
     955 |                         if (!cc->alloc_contig) {
         |                                ^~
   mm/compaction.c:969:70: error: invalid use of undefined type 'struct compact_control'
     969 |                         ret = isolate_or_dissolve_huge_page(page, &cc->migratepages);
         |                                                                      ^~
   mm/compaction.c:1031:46: error: invalid use of undefined type 'struct compact_control'
    1031 |                 if (PageCompound(page) && !cc->alloc_contig) {
         |                                              ^~
   mm/compaction.c:1035:62: error: invalid use of undefined type 'struct compact_control'
    1035 |                         if (skip_isolation_on_order(order, cc->order)) {
         |                                                              ^~
   mm/compaction.c:1087:25: error: invalid use of undefined type 'struct compact_control'
    1087 |                 if (!(cc->gfp_mask & __GFP_FS) && mapping)
         |                         ^~
   mm/compaction.c:1159:73: error: passing argument 3 of 'compact_lock_irqsave' from incompatible pointer type [-Wincompatible-pointer-types]
    1159 |                         compact_lock_irqsave(&lruvec->lru_lock, &flags, cc);
         |                                                                         ^~
         |                                                                         |
         |                                                                         struct compact_control *
   mm/compaction.c:504:73: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
     504 |                                                 struct compact_control *cc)
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/compaction.c:1171:55: error: passing argument 1 of 'test_and_set_skip' from incompatible pointer type [-Wincompatible-pointer-types]
    1171 |                                 if (test_and_set_skip(cc, valid_page) &&
         |                                                       ^~
         |                                                       |
         |                                                       struct compact_control *
   mm/compaction.c:488:55: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
     488 | static bool test_and_set_skip(struct compact_control *cc, struct page *page)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/compaction.c:1172:40: error: invalid use of undefined type 'struct compact_control'
    1172 |                                     !cc->finish_pageblock) {
         |                                        ^~
   mm/compaction.c:1182:64: error: invalid use of undefined type 'struct compact_control'
    1182 |                                                              cc->order) &&
         |                                                                ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   mm/compaction.c:1183:41: error: invalid use of undefined type 'struct compact_control'
    1183 |                                      !cc->alloc_contig)) {
         |                                         ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   mm/compaction.c:1202:42: error: invalid use of undefined type 'struct compact_control'
    1202 |                 list_add(&folio->lru, &cc->migratepages);
         |                                          ^~
   mm/compaction.c:1204:19: error: invalid use of undefined type 'struct compact_control'
    1204 |                 cc->nr_migratepages += folio_nr_pages(folio);
         |                   ^~
   mm/compaction.c:1214:23: error: invalid use of undefined type 'struct compact_control'
    1214 |                 if (cc->nr_migratepages >= COMPACT_CLUSTER_MAX &&
         |                       ^~
   mm/compaction.c:1215:24: error: invalid use of undefined type 'struct compact_control'
    1215 |                     !cc->finish_pageblock && !cc->contended) {
         |                        ^~
   mm/compaction.c:1215:49: error: invalid use of undefined type 'struct compact_control'
    1215 |                     !cc->finish_pageblock && !cc->contended) {
         |                                                 ^~
   mm/compaction.c:1244:50: error: invalid use of undefined type 'struct compact_control'
    1244 |                         putback_movable_pages(&cc->migratepages);
         |                                                  ^~
   mm/compaction.c:1245:27: error: invalid use of undefined type 'struct compact_control'
    1245 |                         cc->nr_migratepages = 0;
         |                           ^~
   mm/compaction.c:1255:51: error: invalid use of undefined type 'struct compact_control'
    1255 |                         next_skip_pfn += 1UL << cc->order;
         |                                                   ^~
   mm/compaction.c:1287:54: error: invalid use of undefined type 'struct compact_control'
    1287 |         if (low_pfn == end_pfn && (!nr_isolated || cc->finish_pageblock)) {
         |                                                      ^~
   mm/compaction.c:1288:24: error: invalid use of undefined type 'struct compact_control'
    1288 |                 if (!cc->no_set_skip_hint && valid_page && !skip_updated)
         |                        ^~
   mm/compaction.c:1290:39: error: passing argument 1 of 'update_cached_migrate' from incompatible pointer type [-Wincompatible-pointer-types]
    1290 |                 update_cached_migrate(cc, low_pfn);
         |                                       ^~
         |                                       |
         |                                       struct compact_control *
   mm/compaction.c:484:59: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
     484 | static void update_cached_migrate(struct compact_control *cc, unsigned long pfn)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/compaction.c:1293:9: error: implicit declaration of function 'trace_mm_compaction_isolate_migratepages' [-Wimplicit-function-declaration]
    1293 |         trace_mm_compaction_isolate_migratepages(start_pfn, low_pfn,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:1297:11: error: invalid use of undefined type 'struct compact_control'
    1297 |         cc->total_migrate_scanned += nr_scanned;
         |           ^~
   mm/compaction.c:1301:11: error: invalid use of undefined type 'struct compact_control'
    1301 |         cc->migrate_pfn = low_pfn;
         |           ^~
   mm/compaction.c: At top level:
   mm/compaction.c:1316:35: warning: 'struct compact_control' declared inside parameter list will not be visible outside of this definition or declaration
    1316 | isolate_migratepages_range(struct compact_control *cc, unsigned long start_pfn,
         |                                   ^~~~~~~~~~~~~~~
>> mm/compaction.c:1316:1: warning: no previous prototype for 'isolate_migratepages_range' [-Wmissing-prototypes]
    1316 | isolate_migratepages_range(struct compact_control *cc, unsigned long start_pfn,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c: In function 'isolate_migratepages_range':
   mm/compaction.c:1325:33: error: invalid use of undefined type 'struct compact_control'
    1325 |         if (block_start_pfn < cc->zone->zone_start_pfn)
         |                                 ^~
   mm/compaction.c:1326:37: error: invalid use of undefined type 'struct compact_control'
    1326 |                 block_start_pfn = cc->zone->zone_start_pfn;
         |                                     ^~
   mm/compaction.c:1336:58: error: invalid use of undefined type 'struct compact_control'
    1336 |                                         block_end_pfn, cc->zone))
         |                                                          ^~
   mm/compaction.c:1339:50: error: passing argument 1 of 'isolate_migratepages_block' from incompatible pointer type [-Wincompatible-pointer-types]
    1339 |                 ret = isolate_migratepages_block(cc, pfn, block_end_pfn,
         |                                                  ^~
         |                                                  |
         |                                                  struct compact_control *
   mm/compaction.c:835:52: note: expected 'struct compact_control *' but argument is of type 'struct compact_control *'
     835 | isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/compaction.c:1345:23: error: invalid use of undefined type 'struct compact_control'
    1345 |                 if (cc->nr_migratepages >= COMPACT_CLUSTER_MAX)
         |                       ^~
   mm/compaction.c: At top level:
   mm/compaction.c:1352:2: error: #endif without #if
    1352 | #endif /* CONFIG_COMPACTION || CONFIG_CMA */
         |  ^~~~~


vim +468 mm/compaction.c

e380bebe477154 Mel Gorman      2019-03-05  449  
bb13ffeb9f6bfe Mel Gorman      2012-10-08  450  /*
bb13ffeb9f6bfe Mel Gorman      2012-10-08  451   * If no pages were isolated then mark this pageblock to be skipped in the
62997027ca5b3d Mel Gorman      2012-10-08  452   * future. The information is later cleared by __reset_isolation_suitable().
bb13ffeb9f6bfe Mel Gorman      2012-10-08  453   */
c89511ab2f8fe2 Mel Gorman      2012-10-08  454  static void update_pageblock_skip(struct compact_control *cc,
d097a6f6352254 Mel Gorman      2019-03-05  455  			struct page *page, unsigned long pfn)
bb13ffeb9f6bfe Mel Gorman      2012-10-08  456  {
c89511ab2f8fe2 Mel Gorman      2012-10-08  457  	struct zone *zone = cc->zone;
6815bf3f233e0b Joonsoo Kim     2013-12-18  458  
2583d6713267a4 Vlastimil Babka 2017-11-17  459  	if (cc->no_set_skip_hint)
6815bf3f233e0b Joonsoo Kim     2013-12-18  460  		return;
6815bf3f233e0b Joonsoo Kim     2013-12-18  461  
bb13ffeb9f6bfe Mel Gorman      2012-10-08  462  	set_pageblock_skip(page);
c89511ab2f8fe2 Mel Gorman      2012-10-08  463  
35979ef3393110 David Rientjes  2014-06-04  464  	if (pfn < zone->compact_cached_free_pfn)
c89511ab2f8fe2 Mel Gorman      2012-10-08  465  		zone->compact_cached_free_pfn = pfn;
c89511ab2f8fe2 Mel Gorman      2012-10-08  466  }
bb13ffeb9f6bfe Mel Gorman      2012-10-08  467  #else
bb13ffeb9f6bfe Mel Gorman      2012-10-08 @468  static inline bool isolation_suitable(struct compact_control *cc,
bb13ffeb9f6bfe Mel Gorman      2012-10-08  469  					struct page *page)
bb13ffeb9f6bfe Mel Gorman      2012-10-08  470  {
bb13ffeb9f6bfe Mel Gorman      2012-10-08  471  	return true;
bb13ffeb9f6bfe Mel Gorman      2012-10-08  472  }
bb13ffeb9f6bfe Mel Gorman      2012-10-08  473  

:::::: The code at line 468 was first introduced by commit
:::::: bb13ffeb9f6bfeb301443994dfbf29f91117dfb3 mm: compaction: cache if a pageblock was scanned and no pages were isolated

:::::: TO: Mel Gorman <mgorman@suse.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
