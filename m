Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF1622B8DA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752751; cv=none; b=qQZPZCEeYmHL+8N6lQr6TqESYxjRjQaRdsC/lOb1DhOE/gJm0lfP4Dy/FKbyezHY2XW4qQ7cV080vqjdP9ZYcdt6fYxVIC/7TAsTNK+PYNRwbtSnJvO/QfoiBCAz/OfD4iEffR27IWNvi2bw/omnLWAjnSRddT0mQi5JLR4zqIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752751; c=relaxed/simple;
	bh=CJf/gZI4RfCF8iBBLXWHEU801ltgYtsjYWtM2wAGxxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z4zyW9I4iNrlH/LuB27d521w5bXPPLibsr9v5tRlcTvm9bqAxp56/mYbJuWXN16q8vqDqagAlIbbVNzkHK8mz7wfhaOIR54rsa5oZ/RLvYilw5ortG5ImRN4nINtL7djyGfk/kSZxnBti+Iwq7NzY6GNbjKuvK5oF1Jt1oF+Gmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qk20CkJb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qk20CkJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738752749; x=1770288749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CJf/gZI4RfCF8iBBLXWHEU801ltgYtsjYWtM2wAGxxM=;
  b=Qk20CkJbJNjuW3/nP6gXMRqWtdarg0fQIlha8G9VCv11pmeqH/8Jh8pj
   B9EP2DwkuqESYTzidgUvt+0pe16nym1sGs6owca2DvRPzn6C8Lb9HS3L6
   tVv4/yEvqslHG28LFqrk85YMeKm+/9petIlM7V8uVxsdFEZsbzIrdnOpA
   Tb1bue3Mxd8VuYajC3yyf0eMi9dgJq20IZMW1VoH+oHGsreL3qqkyNnQ4
   7r+SrfL5ZAb22zMjrzKhqCIiNVwmqSs66rQ89DnR6+4GHIPjFuBFkyEa1
   wVTd8VcboxcgnQjENYgsTdP43BF+J5KSm+CD8xecCR4gqnZLxLxaZyM8E
   g==;
X-CSE-ConnectionGUID: QC/vh/VYRAqEhbLw8jwx4Q==
X-CSE-MsgGUID: aqGgXJGeTaKXgm+apVsiTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39423651"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39423651"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 02:52:26 -0800
X-CSE-ConnectionGUID: BEMXtr0aTNKYSwEYPNk14A==
X-CSE-MsgGUID: OlR4fU40SmWEw7bos8do8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111751082"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 02:52:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfd14-000tnR-1K;
	Wed, 05 Feb 2025 10:52:22 +0000
Date: Wed, 5 Feb 2025 18:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:device_private 9/22] mm/ksm.c:1276:39: error:
 incompatible type for argument 1 of 'pte_present'
Message-ID: <202502051828.hYCnUN07-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux device_private
head:   ddc42f5fd72394838fc2d280ff2486ccb7178b9a
commit: e06705cb196ddea990ddec54bffd90ebff1ea85c [9/22] mm/ksm: handle device-exclusive entries correctly in write_protect_page()
config: i386-buildonly-randconfig-004-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051828.hYCnUN07-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051828.hYCnUN07-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051828.hYCnUN07-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/ksm.c:17:
   mm/ksm.c: In function 'write_protect_page':
>> mm/ksm.c:1276:39: error: incompatible type for argument 1 of 'pte_present'
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
>> mm/ksm.c:1276:39: error: incompatible type for argument 1 of 'pte_present'
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
>> mm/ksm.c:1277:17: error: expected ')' before 'goto'
    1277 |                 goto out_unlock;
         |                 ^~~~
   mm/ksm.c:1276:12: note: to match this '('
    1276 |         if (unlikely(!pte_present(pvmw.pte))
         |            ^
>> mm/ksm.c:1334:1: error: expected expression before '}' token
    1334 | }
         | ^
>> mm/ksm.c:1271:17: error: label 'out_unlock' used but not defined
    1271 |                 goto out_unlock;
         |                 ^~~~
>> mm/ksm.c:1269:17: error: label 'out_mn' used but not defined
    1269 |                 goto out_mn;
         |                 ^~~~
>> mm/ksm.c:1262:17: error: label 'out' used but not defined
    1262 |                 goto out;
         |                 ^~~~
   mm/ksm.c:1255:15: warning: unused variable 'entry' [-Wunused-variable]
    1255 |         pte_t entry;
         |               ^~~~~
   mm/ksm.c:1254:14: warning: unused variable 'anon_exclusive' [-Wunused-variable]
    1254 |         bool anon_exclusive;
         |              ^~~~~~~~~~~~~~
   mm/ksm.c:1251:13: warning: unused variable 'swapped' [-Wunused-variable]
    1251 |         int swapped;
         |             ^~~~~~~
   mm/ksm.c:1249:27: warning: unused variable 'mm' [-Wunused-variable]
    1249 |         struct mm_struct *mm = vma->vm_mm;
         |                           ^~
   mm/ksm.c:1334:1: warning: control reaches end of non-void function [-Wreturn-type]
    1334 | }
         | ^


vim +/pte_present +1276 mm/ksm.c

  1245	
  1246	static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
  1247				      pte_t *orig_pte)
  1248	{
  1249		struct mm_struct *mm = vma->vm_mm;
  1250		DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, 0, 0);
  1251		int swapped;
  1252		int err = -EFAULT;
  1253		struct mmu_notifier_range range;
  1254		bool anon_exclusive;
  1255		pte_t entry;
  1256	
  1257		if (WARN_ON_ONCE(folio_test_large(folio)))
  1258			return err;
  1259	
  1260		pvmw.address = page_address_in_vma(folio, folio_page(folio, 0), vma);
  1261		if (pvmw.address == -EFAULT)
> 1262			goto out;
  1263	
  1264		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, pvmw.address,
  1265					pvmw.address + PAGE_SIZE);
  1266		mmu_notifier_invalidate_range_start(&range);
  1267	
  1268		if (!page_vma_mapped_walk(&pvmw))
> 1269			goto out_mn;
  1270		if (WARN_ONCE(!pvmw.pte, "Unexpected PMD mapping?"))
> 1271			goto out_unlock;
  1272		/*
  1273		 * Handle PFN swap entries, such as device-exclusive ones, that
  1274		 * actually map pages: give up just like the next folio_walk would.
  1275		 */
> 1276		if (unlikely(!pte_present(pvmw.pte))
> 1277			goto out_unlock;
  1278	
  1279		anon_exclusive = PageAnonExclusive(&folio->page);
  1280		entry = ptep_get(pvmw.pte);
  1281		if (pte_write(entry) || pte_dirty(entry) ||
  1282		    anon_exclusive || mm_tlb_flush_pending(mm)) {
  1283			swapped = folio_test_swapcache(folio);
  1284			flush_cache_page(vma, pvmw.address, folio_pfn(folio));
  1285			/*
  1286			 * Ok this is tricky, when get_user_pages_fast() run it doesn't
  1287			 * take any lock, therefore the check that we are going to make
  1288			 * with the pagecount against the mapcount is racy and
  1289			 * O_DIRECT can happen right after the check.
  1290			 * So we clear the pte and flush the tlb before the check
  1291			 * this assure us that no O_DIRECT can happen after the check
  1292			 * or in the middle of the check.
  1293			 *
  1294			 * No need to notify as we are downgrading page table to read
  1295			 * only not changing it to point to a new page.
  1296			 *
  1297			 * See Documentation/mm/mmu_notifier.rst
  1298			 */
  1299			entry = ptep_clear_flush(vma, pvmw.address, pvmw.pte);
  1300			/*
  1301			 * Check that no O_DIRECT or similar I/O is in progress on the
  1302			 * page
  1303			 */
  1304			if (folio_mapcount(folio) + 1 + swapped != folio_ref_count(folio)) {
  1305				set_pte_at(mm, pvmw.address, pvmw.pte, entry);
  1306				goto out_unlock;
  1307			}
  1308	
  1309			/* See folio_try_share_anon_rmap_pte(): clear PTE first. */
  1310			if (anon_exclusive &&
  1311			    folio_try_share_anon_rmap_pte(folio, &folio->page)) {
  1312				set_pte_at(mm, pvmw.address, pvmw.pte, entry);
  1313				goto out_unlock;
  1314			}
  1315	
  1316			if (pte_dirty(entry))
  1317				folio_mark_dirty(folio);
  1318			entry = pte_mkclean(entry);
  1319	
  1320			if (pte_write(entry))
  1321				entry = pte_wrprotect(entry);
  1322	
  1323			set_pte_at(mm, pvmw.address, pvmw.pte, entry);
  1324		}
  1325		*orig_pte = entry;
  1326		err = 0;
  1327	
  1328	out_unlock:
  1329		page_vma_mapped_walk_done(&pvmw);
  1330	out_mn:
  1331		mmu_notifier_invalidate_range_end(&range);
  1332	out:
  1333		return err;
> 1334	}
  1335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
