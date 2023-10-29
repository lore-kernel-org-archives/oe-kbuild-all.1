Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6EF6111
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 11:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbVWtRbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698579660; x=1730115660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33YDBlt/BMck9HFBWI+TIx95FlQNCGt3xUgidYlfKZg=;
  b=IbVWtRbLZxTRNYbOObEbRz1+ZkY56YYSNNoURo+w47VettxCtr+XROrr
   RUH9Mk4GGjXQQpj823H1heD+KUpCRpPWNsAZxxVQjMG5tnd/uxmgKboWK
   E70WQt59Zpdx9867uz7M5Kaju+4aN4mc5OYiht8nhGvyw/aM0TB7rQY6e
   MxZNL0S7e8bu34kIciZxJtWoly/QFxE0Ix4zWwubhyHhTYKOxUwRkco/b
   U7n8fkMA5MRWHif3/R2DHdVBYjmVD8UAaEbx7HNKiWfIMddn/oT2K1Jpe
   djAYcmQfcolvUS65LLcXCt1A3wbgXt9S9F8RWBRsU55DZV1iv+Cdp/++o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452198154"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="452198154"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 04:41:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="903720666"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="903720666"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Oct 2023 04:38:25 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qx4A4-000CXT-2K;
	Sun, 29 Oct 2023 11:40:56 +0000
Date: Sun, 29 Oct 2023 19:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id 1/14] mm/rmap.c:1265
 folio_add_anon_rmap_range() warn: unsigned 'nr' is never less than zero.
Message-ID: <202310291903.RyS3KTtX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id
head:   8265b592aade50ec91a5fb9568c5f53b34b4037e
commit: b06ebce81d1073a54653febf97b5395c9e0f912e [1/14] mm/rmap: introduce folio_add_anon_rmap_range()
config: x86_64-randconfig-161-20231029 (https://download.01.org/0day-ci/archive/20231029/202310291903.RyS3KTtX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231029/202310291903.RyS3KTtX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310291903.RyS3KTtX-lkp@intel.com/

smatch warnings:
mm/rmap.c:1265 folio_add_anon_rmap_range() warn: unsigned 'nr' is never less than zero.

vim +/nr +1265 mm/rmap.c

c97a9e10eaee32 Nicholas Piggin         2007-05-16  1213  
9617d95e6e9ffd Nicholas Piggin         2006-01-06  1214  /**
b06ebce81d1073 David Hildenbrand       2023-09-25  1215   * folio_add_anon_rmap_range - add mappings to a page range of an anon folio
b06ebce81d1073 David Hildenbrand       2023-09-25  1216   * @folio:	The folio to add the mapping to
b06ebce81d1073 David Hildenbrand       2023-09-25  1217   * @page:	The first page to add
b06ebce81d1073 David Hildenbrand       2023-09-25  1218   * @nr_pages:	The number of pages which will be mapped
b06ebce81d1073 David Hildenbrand       2023-09-25  1219   * @vma:	The vm area in which the mapping is added
b06ebce81d1073 David Hildenbrand       2023-09-25  1220   * @address:	The user virtual address of the first page to map
b06ebce81d1073 David Hildenbrand       2023-09-25  1221   * @flags:	The rmap flags
b06ebce81d1073 David Hildenbrand       2023-09-25  1222   *
b06ebce81d1073 David Hildenbrand       2023-09-25  1223   * The page range of folio is defined by [first_page, first_page + nr_pages)
9617d95e6e9ffd Nicholas Piggin         2006-01-06  1224   *
5ad6468801d28c Hugh Dickins            2009-12-14  1225   * The caller needs to hold the pte lock, and the page must be locked in
80e14822602825 Hugh Dickins            2009-12-14  1226   * the anon_vma case: to serialize mapping,index checking after setting,
b06ebce81d1073 David Hildenbrand       2023-09-25  1227   * and to ensure that an anon folio is not being upgraded racily to a KSM folio
b06ebce81d1073 David Hildenbrand       2023-09-25  1228   * (but KSM folios are never downgraded).
9617d95e6e9ffd Nicholas Piggin         2006-01-06  1229   */
b06ebce81d1073 David Hildenbrand       2023-09-25  1230  void folio_add_anon_rmap_range(struct folio *folio, struct page *page,
b06ebce81d1073 David Hildenbrand       2023-09-25  1231  		unsigned int nr_pages, struct vm_area_struct *vma,
ee0800c2f6a9e6 Matthew Wilcox (Oracle  2023-01-11  1232) 		unsigned long address, rmap_t flags)
9617d95e6e9ffd Nicholas Piggin         2006-01-06  1233  {
ee0800c2f6a9e6 Matthew Wilcox (Oracle  2023-01-11  1234) 	atomic_t *mapped = &folio->_nr_pages_mapped;
b06ebce81d1073 David Hildenbrand       2023-09-25  1235  	unsigned int i, first, nr = 0, nr_pmdmapped = 0;
d281ee61451835 Kirill A. Shutemov      2016-01-15  1236  	bool compound = flags & RMAP_COMPOUND;
b06ebce81d1073 David Hildenbrand       2023-09-25  1237  
b06ebce81d1073 David Hildenbrand       2023-09-25  1238  	VM_WARN_ON_FOLIO(compound && !folio_test_pmd_mappable(folio), folio);
b06ebce81d1073 David Hildenbrand       2023-09-25  1239  	VM_WARN_ON_FOLIO(compound && nr_pages != folio_nr_pages(folio), folio);
53f9263baba69f Kirill A. Shutemov      2016-01-15  1240  
be5ef2d9b006bb Hugh Dickins            2022-11-22  1241  	/* Is page being mapped by PTE? Is this its first map to be added? */
be5ef2d9b006bb Hugh Dickins            2022-11-22  1242  	if (likely(!compound)) {
b06ebce81d1073 David Hildenbrand       2023-09-25  1243  		for (i = 0; i < nr_pages; i++) {
b06ebce81d1073 David Hildenbrand       2023-09-25  1244  			struct page *cur_page = page + i;
b06ebce81d1073 David Hildenbrand       2023-09-25  1245  
b06ebce81d1073 David Hildenbrand       2023-09-25  1246  			first = atomic_inc_and_test(&cur_page->_mapcount);
ee0800c2f6a9e6 Matthew Wilcox (Oracle  2023-01-11  1247) 			if (first && folio_test_large(folio)) {
b06ebce81d1073 David Hildenbrand       2023-09-25  1248  				first = atomic_inc_return_relaxed(mapped);
b06ebce81d1073 David Hildenbrand       2023-09-25  1249  				first = (first < COMPOUND_MAPPED);
b06ebce81d1073 David Hildenbrand       2023-09-25  1250  			}
b06ebce81d1073 David Hildenbrand       2023-09-25  1251  
b06ebce81d1073 David Hildenbrand       2023-09-25  1252  			if (first)
b06ebce81d1073 David Hildenbrand       2023-09-25  1253  				nr++;
be5ef2d9b006bb Hugh Dickins            2022-11-22  1254  		}
ee0800c2f6a9e6 Matthew Wilcox (Oracle  2023-01-11  1255) 	} else if (folio_test_pmd_mappable(folio)) {
be5ef2d9b006bb Hugh Dickins            2022-11-22  1256  		/* That test is redundant: it's for safety or to optimize out */
d8dd5e979d09c7 Hugh Dickins            2022-11-09  1257  
ee0800c2f6a9e6 Matthew Wilcox (Oracle  2023-01-11  1258) 		first = atomic_inc_and_test(&folio->_entire_mapcount);
9bd3155ed83b72 Hugh Dickins            2022-11-02  1259  		if (first) {
4b51634cd16a01 Hugh Dickins            2022-11-22  1260  			nr = atomic_add_return_relaxed(COMPOUND_MAPPED, mapped);
6287b7dae80944 Hugh Dickins            2022-12-04  1261  			if (likely(nr < COMPOUND_MAPPED + COMPOUND_MAPPED)) {
ee0800c2f6a9e6 Matthew Wilcox (Oracle  2023-01-11  1262) 				nr_pmdmapped = folio_nr_pages(folio);
eec20426d48bd7 Matthew Wilcox (Oracle  2023-01-11  1263) 				nr = nr_pmdmapped - (nr & FOLIO_PAGES_MAPPED);
6287b7dae80944 Hugh Dickins            2022-12-04  1264  				/* Raced ahead of a remove and another add? */
6287b7dae80944 Hugh Dickins            2022-12-04 @1265  				if (unlikely(nr < 0))
6287b7dae80944 Hugh Dickins            2022-12-04  1266  					nr = 0;
6287b7dae80944 Hugh Dickins            2022-12-04  1267  			} else {
6287b7dae80944 Hugh Dickins            2022-12-04  1268  				/* Raced ahead of a remove of COMPOUND_MAPPED */
6287b7dae80944 Hugh Dickins            2022-12-04  1269  				nr = 0;
6287b7dae80944 Hugh Dickins            2022-12-04  1270  			}
9bd3155ed83b72 Hugh Dickins            2022-11-02  1271  		}
53f9263baba69f Kirill A. Shutemov      2016-01-15  1272  	}
cb67f4282bf969 Hugh Dickins            2022-11-02  1273  
9bd3155ed83b72 Hugh Dickins            2022-11-02  1274  	if (nr_pmdmapped)
ee0800c2f6a9e6 Matthew Wilcox (Oracle  2023-01-11  1275) 		__lruvec_stat_mod_folio(folio, NR_ANON_THPS, nr_pmdmapped);
9bd3155ed83b72 Hugh Dickins            2022-11-02  1276  	if (nr)
ee0800c2f6a9e6 Matthew Wilcox (Oracle  2023-01-11  1277) 		__lruvec_stat_mod_folio(folio, NR_ANON_MAPPED, nr);
5ad6468801d28c Hugh Dickins            2009-12-14  1278  
c5c540034747df David Hildenbrand       2023-09-13  1279  	if (unlikely(!folio_test_anon(folio))) {
c5c540034747df David Hildenbrand       2023-09-13  1280  		VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
a1f34ee1de2c3a David Hildenbrand       2023-09-13  1281  		/*
a1f34ee1de2c3a David Hildenbrand       2023-09-13  1282  		 * For a PTE-mapped large folio, we only know that the single
a1f34ee1de2c3a David Hildenbrand       2023-09-13  1283  		 * PTE is exclusive. Further, __folio_set_anon() might not get
a1f34ee1de2c3a David Hildenbrand       2023-09-13  1284  		 * folio->index right when not given the address of the head
a1f34ee1de2c3a David Hildenbrand       2023-09-13  1285  		 * page.
a1f34ee1de2c3a David Hildenbrand       2023-09-13  1286  		 */
a1f34ee1de2c3a David Hildenbrand       2023-09-13  1287  		VM_WARN_ON_FOLIO(folio_test_large(folio) && !compound, folio);
c66db8c0702c0a David Hildenbrand       2023-09-13  1288  		__folio_set_anon(folio, vma, address,
14f9135d547060 David Hildenbrand       2022-05-09  1289  				 !!(flags & RMAP_EXCLUSIVE));
c5c540034747df David Hildenbrand       2023-09-13  1290  	} else if (likely(!folio_test_ksm(folio))) {
dba438bd7663fe Matthew Wilcox (Oracle  2023-07-06  1291) 		__page_check_anon_rmap(folio, page, vma, address);
c7c3dec1c9db97 Johannes Weiner         2022-12-06  1292  	}
b06ebce81d1073 David Hildenbrand       2023-09-25  1293  
b06ebce81d1073 David Hildenbrand       2023-09-25  1294  	if (flags & RMAP_EXCLUSIVE) {
b06ebce81d1073 David Hildenbrand       2023-09-25  1295  		for (i = 0; i < nr_pages; i++)
b06ebce81d1073 David Hildenbrand       2023-09-25  1296  			SetPageAnonExclusive(page + i);
b06ebce81d1073 David Hildenbrand       2023-09-25  1297  	}
b06ebce81d1073 David Hildenbrand       2023-09-25  1298  	for (i = 0; i < nr_pages; i++) {
b06ebce81d1073 David Hildenbrand       2023-09-25  1299  		struct page *cur_page = page + i;
b06ebce81d1073 David Hildenbrand       2023-09-25  1300  
132b180f06a74d David Hildenbrand       2023-09-13  1301  		/* While PTE-mapping a THP we have a PMD and a PTE mapping. */
b06ebce81d1073 David Hildenbrand       2023-09-25  1302  		VM_WARN_ON_FOLIO((atomic_read(&cur_page->_mapcount) > 0 ||
b06ebce81d1073 David Hildenbrand       2023-09-25  1303  				  (folio_test_large(folio) &&
b06ebce81d1073 David Hildenbrand       2023-09-25  1304  				   folio_entire_mapcount(folio) > 1)) &&
b06ebce81d1073 David Hildenbrand       2023-09-25  1305  				 PageAnonExclusive(cur_page), folio);
b06ebce81d1073 David Hildenbrand       2023-09-25  1306  	}
cea86fe246b694 Hugh Dickins            2022-02-14  1307  
1acbc3f936146d Yin Fengwei             2023-09-18  1308  	/*
1acbc3f936146d Yin Fengwei             2023-09-18  1309  	 * For large folio, only mlock it if it's fully mapped to VMA. It's
1acbc3f936146d Yin Fengwei             2023-09-18  1310  	 * not easy to check whether the large folio is fully mapped to VMA
1acbc3f936146d Yin Fengwei             2023-09-18  1311  	 * here. Only mlock normal 4K folio and leave page reclaim to handle
1acbc3f936146d Yin Fengwei             2023-09-18  1312  	 * large folio.
1acbc3f936146d Yin Fengwei             2023-09-18  1313  	 */
1acbc3f936146d Yin Fengwei             2023-09-18  1314  	if (!folio_test_large(folio))
1acbc3f936146d Yin Fengwei             2023-09-18  1315  		mlock_vma_folio(folio, vma);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1316  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  1317  

:::::: The code at line 1265 was first introduced by commit
:::::: 6287b7dae80944bfa37784a8f9d6861a4facaa6e mm,thp,rmap: fix races between updates of subpages_mapcount

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
