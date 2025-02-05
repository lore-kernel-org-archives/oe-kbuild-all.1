Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566B5205E3C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747337; cv=none; b=mmlkP3MB11IelBPwsbS6xFTT/Bj6TbTehlKLHzGs5nlkdlI2Lku55zZx+AvDFUkJBSThgA++jr/fQ79PZxyluZ/Qkrnob37K1RR3BObylAWXZC2jQtDjyW01g8XwJdzwDxGz2XDtekmtUCVOwIm7VyaJ2//YdLnjXYy9bTpC0Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747337; c=relaxed/simple;
	bh=27TuHeZ3QoArKq6IeSHlgP/UF+sqjphWBW7PYAJVjWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ru1nejs1/FGqeIivAErwPriXJGiAmmGLyZg986tzsQ9fDWy+zwnbrv+zrpL2fQAZ4AwHTptInQlk7YpV080dcW+ZfF3tUrsNoZsK3W0nfYASQdmnzR11IWwy9COLmAY4YDbk9BGHpdkzwAvEH1fU7hGJz+bdBIcoxNU8W2g9XE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFQ/m7EW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFQ/m7EW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738747336; x=1770283336;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=27TuHeZ3QoArKq6IeSHlgP/UF+sqjphWBW7PYAJVjWA=;
  b=EFQ/m7EWse/lMdlCRA7Ld4k2KXUtFnoJN76zg2RuUF331hVwqkd8JXW4
   Om9FmoO5VN0YgzV1ebloozUG3TWd/0FYNg3sSYI9INdYS0yM9rmPCezGu
   v+zvSr6GlYeihNpyizT2vHc8a4CE4EuPmv1nf9We4MqqYL1FmSOaUmh/5
   JsdPG9C0fqP8RGtXoXbm1SNyxtxz1LCGL78Sq7yoE8op7z6LRz9SelUEn
   MdSGZ+D03TuFBdWrQcqCORjtQ0yRgsa0lbSZ8VQOquxpXMAg3zgwIP84N
   bpKMsLan/9YzKzoLLfabeFw4oIZAA8xYuSKtmBfyop2abDtu0fLBcV+UO
   g==;
X-CSE-ConnectionGUID: /dKPr2t6TQK+Qwl8F1tb+g==
X-CSE-MsgGUID: 0gzv01/oQNGYZL8AkJrU8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39004315"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39004315"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:22:15 -0800
X-CSE-ConnectionGUID: Ebq1OlgUR4W3trb5v3djNA==
X-CSE-MsgGUID: 6Ud4xFe5TECBdQDgW5s9LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115819165"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Feb 2025 01:22:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfbbn-000tgl-1d;
	Wed, 05 Feb 2025 09:22:11 +0000
Date: Wed, 5 Feb 2025 17:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:device_private 9/22] mm/ksm.c:1255:15: warning:
 unused variable 'entry'
Message-ID: <202502051754.ghKyvga7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/davidhildenbrand/linux device_private
head:   ddc42f5fd72394838fc2d280ff2486ccb7178b9a
commit: e06705cb196ddea990ddec54bffd90ebff1ea85c [9/22] mm/ksm: handle device-exclusive entries correctly in write_protect_page()
config: i386-buildonly-randconfig-004-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051754.ghKyvga7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051754.ghKyvga7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051754.ghKyvga7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/ksm.c:17:
   mm/ksm.c: In function 'write_protect_page':
   mm/ksm.c:1276:39: error: incompatible type for argument 1 of 'pte_present'
    1276 |         if (unlikely(!pte_present(pvmw.pte))
         |                                   ~~~~^~~~
         |                                       |
         |                                       pte_t *
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   mm/ksm.c:1276:13: note: in expansion of macro 'unlikely'
    1276 |         if (unlikely(!pte_present(pvmw.pte))
         |             ^~~~~~~~
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/ksm.c:17:
   arch/x86/include/asm/pgtable.h:1010:37: note: expected 'pte_t' but argument is of type 'pte_t *'
    1010 | static inline int pte_present(pte_t a)
         |                               ~~~~~~^
   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/ksm.c:17:
   mm/ksm.c:1276:39: error: incompatible type for argument 1 of 'pte_present'
    1276 |         if (unlikely(!pte_present(pvmw.pte))
         |                                   ~~~~^~~~
         |                                       |
         |                                       pte_t *
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   mm/ksm.c:1276:13: note: in expansion of macro 'unlikely'
    1276 |         if (unlikely(!pte_present(pvmw.pte))
         |             ^~~~~~~~
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/ksm.c:17:
   arch/x86/include/asm/pgtable.h:1010:37: note: expected 'pte_t' but argument is of type 'pte_t *'
    1010 | static inline int pte_present(pte_t a)
         |                               ~~~~~~^
   mm/ksm.c:1277:17: error: expected ')' before 'goto'
    1277 |                 goto out_unlock;
         |                 ^~~~
   mm/ksm.c:1276:12: note: to match this '('
    1276 |         if (unlikely(!pte_present(pvmw.pte))
         |            ^
   mm/ksm.c:1334:1: error: expected expression before '}' token
    1334 | }
         | ^
   mm/ksm.c:1271:17: error: label 'out_unlock' used but not defined
    1271 |                 goto out_unlock;
         |                 ^~~~
   mm/ksm.c:1269:17: error: label 'out_mn' used but not defined
    1269 |                 goto out_mn;
         |                 ^~~~
   mm/ksm.c:1262:17: error: label 'out' used but not defined
    1262 |                 goto out;
         |                 ^~~~
>> mm/ksm.c:1255:15: warning: unused variable 'entry' [-Wunused-variable]
    1255 |         pte_t entry;
         |               ^~~~~
>> mm/ksm.c:1254:14: warning: unused variable 'anon_exclusive' [-Wunused-variable]
    1254 |         bool anon_exclusive;
         |              ^~~~~~~~~~~~~~
>> mm/ksm.c:1251:13: warning: unused variable 'swapped' [-Wunused-variable]
    1251 |         int swapped;
         |             ^~~~~~~
>> mm/ksm.c:1249:27: warning: unused variable 'mm' [-Wunused-variable]
    1249 |         struct mm_struct *mm = vma->vm_mm;
         |                           ^~
>> mm/ksm.c:1334:1: warning: control reaches end of non-void function [-Wreturn-type]
    1334 | }
         | ^


vim +/entry +1255 mm/ksm.c

31dbd01f314364 Izik Eidus              2009-09-21  1245  
40d707f33db5e6 Alex Shi (tencent       2024-04-11  1246) static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
31dbd01f314364 Izik Eidus              2009-09-21  1247  			      pte_t *orig_pte)
31dbd01f314364 Izik Eidus              2009-09-21  1248  {
31dbd01f314364 Izik Eidus              2009-09-21 @1249  	struct mm_struct *mm = vma->vm_mm;
40d707f33db5e6 Alex Shi (tencent       2024-04-11  1250) 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, 0, 0);
31dbd01f314364 Izik Eidus              2009-09-21 @1251  	int swapped;
31dbd01f314364 Izik Eidus              2009-09-21  1252  	int err = -EFAULT;
ac46d4f3c43241 Jérôme Glisse           2018-12-28  1253  	struct mmu_notifier_range range;
6c287605fd5646 David Hildenbrand       2022-05-09 @1254  	bool anon_exclusive;
c33c794828f212 Ryan Roberts            2023-06-12 @1255  	pte_t entry;
31dbd01f314364 Izik Eidus              2009-09-21  1256  
40d707f33db5e6 Alex Shi (tencent       2024-04-11  1257) 	if (WARN_ON_ONCE(folio_test_large(folio)))
40d707f33db5e6 Alex Shi (tencent       2024-04-11  1258) 		return err;
40d707f33db5e6 Alex Shi (tencent       2024-04-11  1259) 
713da0b33b3e9d Matthew Wilcox (Oracle  2024-10-05  1260) 	pvmw.address = page_address_in_vma(folio, folio_page(folio, 0), vma);
36eaff3364e8cd Kirill A. Shutemov      2017-02-24  1261  	if (pvmw.address == -EFAULT)
31dbd01f314364 Izik Eidus              2009-09-21  1262  		goto out;
31dbd01f314364 Izik Eidus              2009-09-21  1263  
7d4a8be0c4b2b7 Alistair Popple         2023-01-10  1264  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, pvmw.address,
ac46d4f3c43241 Jérôme Glisse           2018-12-28  1265  				pvmw.address + PAGE_SIZE);
ac46d4f3c43241 Jérôme Glisse           2018-12-28  1266  	mmu_notifier_invalidate_range_start(&range);
6bdb913f0a70a4 Haggai Eran             2012-10-08  1267  
36eaff3364e8cd Kirill A. Shutemov      2017-02-24  1268  	if (!page_vma_mapped_walk(&pvmw))
6bdb913f0a70a4 Haggai Eran             2012-10-08  1269  		goto out_mn;
36eaff3364e8cd Kirill A. Shutemov      2017-02-24  1270  	if (WARN_ONCE(!pvmw.pte, "Unexpected PMD mapping?"))
36eaff3364e8cd Kirill A. Shutemov      2017-02-24  1271  		goto out_unlock;
e06705cb196dde David Hildenbrand       2025-01-31  1272  	/*
e06705cb196dde David Hildenbrand       2025-01-31  1273  	 * Handle PFN swap entries, such as device-exclusive ones, that
e06705cb196dde David Hildenbrand       2025-01-31  1274  	 * actually map pages: give up just like the next folio_walk would.
e06705cb196dde David Hildenbrand       2025-01-31  1275  	 */
e06705cb196dde David Hildenbrand       2025-01-31  1276  	if (unlikely(!pte_present(pvmw.pte))
e06705cb196dde David Hildenbrand       2025-01-31  1277  		goto out_unlock;
31dbd01f314364 Izik Eidus              2009-09-21  1278  
40d707f33db5e6 Alex Shi (tencent       2024-04-11  1279) 	anon_exclusive = PageAnonExclusive(&folio->page);
c33c794828f212 Ryan Roberts            2023-06-12  1280  	entry = ptep_get(pvmw.pte);
c33c794828f212 Ryan Roberts            2023-06-12  1281  	if (pte_write(entry) || pte_dirty(entry) ||
6c287605fd5646 David Hildenbrand       2022-05-09  1282  	    anon_exclusive || mm_tlb_flush_pending(mm)) {
40d707f33db5e6 Alex Shi (tencent       2024-04-11  1283) 		swapped = folio_test_swapcache(folio);
40d707f33db5e6 Alex Shi (tencent       2024-04-11  1284) 		flush_cache_page(vma, pvmw.address, folio_pfn(folio));
31dbd01f314364 Izik Eidus              2009-09-21  1285  		/*
25985edcedea63 Lucas De Marchi         2011-03-30  1286  		 * Ok this is tricky, when get_user_pages_fast() run it doesn't
31dbd01f314364 Izik Eidus              2009-09-21  1287  		 * take any lock, therefore the check that we are going to make
f0953a1bbaca71 Ingo Molnar             2021-05-06  1288  		 * with the pagecount against the mapcount is racy and
31dbd01f314364 Izik Eidus              2009-09-21  1289  		 * O_DIRECT can happen right after the check.
31dbd01f314364 Izik Eidus              2009-09-21  1290  		 * So we clear the pte and flush the tlb before the check
31dbd01f314364 Izik Eidus              2009-09-21  1291  		 * this assure us that no O_DIRECT can happen after the check
31dbd01f314364 Izik Eidus              2009-09-21  1292  		 * or in the middle of the check.
0f10851ea475e0 Jérôme Glisse           2017-11-15  1293  		 *
0f10851ea475e0 Jérôme Glisse           2017-11-15  1294  		 * No need to notify as we are downgrading page table to read
0f10851ea475e0 Jérôme Glisse           2017-11-15  1295  		 * only not changing it to point to a new page.
0f10851ea475e0 Jérôme Glisse           2017-11-15  1296  		 *
ee65728e103bb7 Mike Rapoport           2022-06-27  1297  		 * See Documentation/mm/mmu_notifier.rst
31dbd01f314364 Izik Eidus              2009-09-21  1298  		 */
0f10851ea475e0 Jérôme Glisse           2017-11-15  1299  		entry = ptep_clear_flush(vma, pvmw.address, pvmw.pte);
31dbd01f314364 Izik Eidus              2009-09-21  1300  		/*
31dbd01f314364 Izik Eidus              2009-09-21  1301  		 * Check that no O_DIRECT or similar I/O is in progress on the
31dbd01f314364 Izik Eidus              2009-09-21  1302  		 * page
31dbd01f314364 Izik Eidus              2009-09-21  1303  		 */
40d707f33db5e6 Alex Shi (tencent       2024-04-11  1304) 		if (folio_mapcount(folio) + 1 + swapped != folio_ref_count(folio)) {
36eaff3364e8cd Kirill A. Shutemov      2017-02-24  1305  			set_pte_at(mm, pvmw.address, pvmw.pte, entry);
31dbd01f314364 Izik Eidus              2009-09-21  1306  			goto out_unlock;
31dbd01f314364 Izik Eidus              2009-09-21  1307  		}
6c287605fd5646 David Hildenbrand       2022-05-09  1308  
e3b4b1374f87c7 David Hildenbrand       2023-12-20  1309  		/* See folio_try_share_anon_rmap_pte(): clear PTE first. */
e3b4b1374f87c7 David Hildenbrand       2023-12-20  1310  		if (anon_exclusive &&
40d707f33db5e6 Alex Shi (tencent       2024-04-11  1311) 		    folio_try_share_anon_rmap_pte(folio, &folio->page)) {
6c287605fd5646 David Hildenbrand       2022-05-09  1312  			set_pte_at(mm, pvmw.address, pvmw.pte, entry);
6c287605fd5646 David Hildenbrand       2022-05-09  1313  			goto out_unlock;
6c287605fd5646 David Hildenbrand       2022-05-09  1314  		}
6c287605fd5646 David Hildenbrand       2022-05-09  1315  
4e31635c367a9e Hugh Dickins            2010-10-02  1316  		if (pte_dirty(entry))
40d707f33db5e6 Alex Shi (tencent       2024-04-11  1317) 			folio_mark_dirty(folio);
6a56ccbcf6c695 David Hildenbrand       2022-11-08  1318  		entry = pte_mkclean(entry);
6a56ccbcf6c695 David Hildenbrand       2022-11-08  1319  
6a56ccbcf6c695 David Hildenbrand       2022-11-08  1320  		if (pte_write(entry))
6a56ccbcf6c695 David Hildenbrand       2022-11-08  1321  			entry = pte_wrprotect(entry);
595cd8f256d24f Aneesh Kumar K.V        2017-02-24  1322  
f7842747d13d9f Paolo Bonzini           2024-04-05  1323  		set_pte_at(mm, pvmw.address, pvmw.pte, entry);
31dbd01f314364 Izik Eidus              2009-09-21  1324  	}
c33c794828f212 Ryan Roberts            2023-06-12  1325  	*orig_pte = entry;
31dbd01f314364 Izik Eidus              2009-09-21  1326  	err = 0;
31dbd01f314364 Izik Eidus              2009-09-21  1327  
31dbd01f314364 Izik Eidus              2009-09-21  1328  out_unlock:
36eaff3364e8cd Kirill A. Shutemov      2017-02-24  1329  	page_vma_mapped_walk_done(&pvmw);
6bdb913f0a70a4 Haggai Eran             2012-10-08  1330  out_mn:
ac46d4f3c43241 Jérôme Glisse           2018-12-28  1331  	mmu_notifier_invalidate_range_end(&range);
31dbd01f314364 Izik Eidus              2009-09-21  1332  out:
31dbd01f314364 Izik Eidus              2009-09-21  1333  	return err;
31dbd01f314364 Izik Eidus              2009-09-21 @1334  }
31dbd01f314364 Izik Eidus              2009-09-21  1335  

:::::: The code at line 1255 was first introduced by commit
:::::: c33c794828f21217f72ce6fc140e0d34e0d56bff mm: ptep_get() conversion

:::::: TO: Ryan Roberts <ryan.roberts@arm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
