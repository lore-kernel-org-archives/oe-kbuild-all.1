Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A943224
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 00:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712362093; cv=none; b=DfdrUJ4sWz8VWLbBbk6+Yg1D4kytpqhltWxkG92ioNeoUcDQUpPjcGMHTTSn/EmlHOI7y5bTzHCNV/B/pEsPEDWWUBLCH66mCYUfwiA1cyGnCA3h70DBHlzELxX/avwkUhXNWg0OggD6iYrKJIDDm49ZAOfxGFom2mT1XmT0zDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712362093; c=relaxed/simple;
	bh=wek1R8y/fyrAWcPW6bFFYjUtJdaBJDHu+T71W3hA78k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b7wzlKZn8qXSFycz87ao2R3cjBsuRXURiRV7TrLkbSD2SFjIaL788zIW1nZqnQuzcm9stDvd5A4QRmISpiOfRKmBJeq6wQ8wQHxojreuhe+CjaquV8ioPBAVfWPiXCIo4Cf8ua+tFPqIaZcCU6dgPTk7AbuABVFwE6/rPI+Mxpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+TL4OUD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+TL4OUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712362092; x=1743898092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wek1R8y/fyrAWcPW6bFFYjUtJdaBJDHu+T71W3hA78k=;
  b=S+TL4OUDO7nm+VFCmACzlMZtVZAMLlCjp6V5DEm15rMMGnLzeM14qexJ
   rFd7JA95i8D+vBDpwyE14zx1T1q4YxpRrrBUw/pqnzb8P26tQasyPZGFB
   82N6MJWCWx180zvxNokYdtGVPqzbJUsxxLrgO6RjeSP7mRFKustv6culQ
   7tZSat3QxW47ISLE5QFzEuWfrAiHTgR+8AjdkeDfk6T4PxpsSYcx84+5U
   9Z+l8sF4Koz4HrWCFWkLkgVFVWohPQlu0oD+Kt7MeVgX3dixxAKfzrFra
   iWGH1PXsppQb/m4246FHPZF/bxa6eLP7hj8hkImD+wSmzTQC1iykOb8AW
   Q==;
X-CSE-ConnectionGUID: dqvnKD6HT2uGjSDTcbwKeQ==
X-CSE-MsgGUID: eZxFNUL3SxK0ybLbCXRyqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="19071704"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19071704"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 17:08:11 -0700
X-CSE-ConnectionGUID: 5YGO6v1nQxqbXJhmEfca+Q==
X-CSE-MsgGUID: kJtLl/TASseXdVBfCam4hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="24048287"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Apr 2024 17:08:11 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rstbM-0002tu-0o;
	Sat, 06 Apr 2024 00:08:08 +0000
Date: Sat, 6 Apr 2024 08:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:large_mapcount 19/27] mm/ksm.c:1310:27: error:
 implicit declaration of function 'folio_test_swap_cache'; did you mean
 'folio_test_swapcache'?
Message-ID: <202404060845.r2wyat84-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/davidhildenbrand/linux large_mapcount
head:   7e8a03fbcd6b8b5a7e2b6ea60f620c5d816cb44b
commit: 906b1f017658669524416d2e59ef8ea3def1393a [19/27] mm/ksm: remove page_mapcount() usage
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060845.r2wyat84-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060845.r2wyat84-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060845.r2wyat84-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/ksm.c: In function 'write_protect_page':
>> mm/ksm.c:1310:27: error: implicit declaration of function 'folio_test_swap_cache'; did you mean 'folio_test_swapcache'? [-Werror=implicit-function-declaration]
    1310 |                 swapped = folio_test_swap_cache(folio);
         |                           ^~~~~~~~~~~~~~~~~~~~~
         |                           folio_test_swapcache
   cc1: some warnings being treated as errors


vim +1310 mm/ksm.c

  1277	
  1278	static int write_protect_page(struct vm_area_struct *vma, struct page *page,
  1279				      pte_t *orig_pte)
  1280	{
  1281		struct mm_struct *mm = vma->vm_mm;
  1282		DEFINE_PAGE_VMA_WALK(pvmw, page, vma, 0, 0);
  1283		struct folio *folio = page_folio(page);
  1284		int swapped;
  1285		int err = -EFAULT;
  1286		struct mmu_notifier_range range;
  1287		bool anon_exclusive;
  1288		pte_t entry;
  1289	
  1290		if (WARN_ON_ONCE(folio_test_large(folio)))
  1291			goto out;
  1292	
  1293		pvmw.address = page_address_in_vma(page, vma);
  1294		if (pvmw.address == -EFAULT)
  1295			goto out;
  1296	
  1297		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, pvmw.address,
  1298					pvmw.address + PAGE_SIZE);
  1299		mmu_notifier_invalidate_range_start(&range);
  1300	
  1301		if (!page_vma_mapped_walk(&pvmw))
  1302			goto out_mn;
  1303		if (WARN_ONCE(!pvmw.pte, "Unexpected PMD mapping?"))
  1304			goto out_unlock;
  1305	
  1306		anon_exclusive = PageAnonExclusive(page);
  1307		entry = ptep_get(pvmw.pte);
  1308		if (pte_write(entry) || pte_dirty(entry) ||
  1309		    anon_exclusive || mm_tlb_flush_pending(mm)) {
> 1310			swapped = folio_test_swap_cache(folio);
  1311			flush_cache_page(vma, pvmw.address, folio_pfn(folio));
  1312			/*
  1313			 * Ok this is tricky, when get_user_pages_fast() run it doesn't
  1314			 * take any lock, therefore the check that we are going to make
  1315			 * with the pagecount against the mapcount is racy and
  1316			 * O_DIRECT can happen right after the check.
  1317			 * So we clear the pte and flush the tlb before the check
  1318			 * this assure us that no O_DIRECT can happen after the check
  1319			 * or in the middle of the check.
  1320			 *
  1321			 * No need to notify as we are downgrading page table to read
  1322			 * only not changing it to point to a new page.
  1323			 *
  1324			 * See Documentation/mm/mmu_notifier.rst
  1325			 */
  1326			entry = ptep_clear_flush(vma, pvmw.address, pvmw.pte);
  1327			/*
  1328			 * Check that no O_DIRECT or similar I/O is in progress on the
  1329			 * folio.
  1330			 */
  1331			if (folio_mapcount(folio) + 1 + swapped !=
  1332			    folio_ref_count(folio)) {
  1333				set_pte_at(mm, pvmw.address, pvmw.pte, entry);
  1334				goto out_unlock;
  1335			}
  1336	
  1337			/* See folio_try_share_anon_rmap_pte(): clear PTE first. */
  1338			if (anon_exclusive &&
  1339			    folio_try_share_anon_rmap_pte(folio, page)) {
  1340				set_pte_at(mm, pvmw.address, pvmw.pte, entry);
  1341				goto out_unlock;
  1342			}
  1343	
  1344			if (pte_dirty(entry))
  1345				folio_mark_dirty(folio);
  1346			entry = pte_mkclean(entry);
  1347	
  1348			if (pte_write(entry))
  1349				entry = pte_wrprotect(entry);
  1350	
  1351			set_pte_at_notify(mm, pvmw.address, pvmw.pte, entry);
  1352		}
  1353		*orig_pte = entry;
  1354		err = 0;
  1355	
  1356	out_unlock:
  1357		page_vma_mapped_walk_done(&pvmw);
  1358	out_mn:
  1359		mmu_notifier_invalidate_range_end(&range);
  1360	out:
  1361		return err;
  1362	}
  1363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
