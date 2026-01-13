Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFF3CA5A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 03:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768276417; cv=none; b=GPausSSo/jHNzqOMyrIXw9cEqn8wOaM675zlOpEW1TMjJ53VKuajcmAH29s3FIEgdHNUTLQRwAra/Uaujy2DoXxw6SCCOCKoGjMTZG25Trfl5I55CFzpRC4VtAecVxfOsXzdOkT+Gx1I7Fd9mGXtvOBfKUyKT2qo/NsDWRCpV7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768276417; c=relaxed/simple;
	bh=1Pzw4iy6b6C+WrtMoADUcLs8J7QLpPq6eM84fu4GUeU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DEbAB27IDV7nJACSHRxsRSgCLg97Cl2wJ8dElsnkQpHDLAmrbSBhPt6htl2GyWGy0u6mel3taZ+dpYIaVgxejZDhYQkzfy6XZ3DPiJ2u0g8lIVmuTsjdaINGUDFqZD+5fJmMVyxS3623KVFrrL0iOsFtGUYKQ6CNJtFfgz348zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WceeHA+7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WceeHA+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768276416; x=1799812416;
  h=date:from:to:cc:subject:message-id;
  bh=1Pzw4iy6b6C+WrtMoADUcLs8J7QLpPq6eM84fu4GUeU=;
  b=WceeHA+7npG8/8VuRyyfNfbNsUPwQHi9EwyYe2N7r9AfKz53ryy06RId
   gxZ2RRFcdO3Ry4zksPICc8IzK/evlxfMiQFH1Kib7NWUINGcqPKc/piyw
   OsNxZgzvbvUTwEBhUC4iypdKuK8m/874peqRRd/hEZT+zGxWXBMQxydd3
   nevMmKBwNJPwA4ha4uOVGzPRj/62ea149yUqyChPY2ygN13kNkVSQqvDr
   K38A6pF+XVkmDzLNOkZdq0MLThT4CGkGf4AdSVDgYIhfJTX9LL8EBVd7r
   OjZehyNB3uAPWamfsDDGkhCCDjF29Acd+rD5zce3j6nMahNYL2o1W1ntu
   w==;
X-CSE-ConnectionGUID: a0835MfGQkGCjVInK7OlHQ==
X-CSE-MsgGUID: +GKkBkz+RhStFJlhQ8Nm3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69613553"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69613553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:53:36 -0800
X-CSE-ConnectionGUID: voatKPOBRJOXBHj3qd59mw==
X-CSE-MsgGUID: DzJP+VHiS4u/vTzdE1y1mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="227496208"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2026 19:53:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfVTH-00000000EBY-24Zw;
	Tue, 13 Jan 2026 03:53:31 +0000
Date: Tue, 13 Jan 2026 11:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] mm/rmap.c:902
 folio_referenced_one() warn: inconsistent indenting
Message-ID: <202601131111.EtzmJ9uC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c818542ead502009bd003c189fcc86795005133e
commit: 45aaa4d09fecd1c6fa743c38c14d66789640dd4d [6/6] ANDROID: vendor_hooks: Add hooks for lookaround
config: i386-randconfig-141-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131111.EtzmJ9uC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131111.EtzmJ9uC-lkp@intel.com/

smatch warnings:
mm/rmap.c:902 folio_referenced_one() warn: inconsistent indenting

vim +902 mm/rmap.c

1acbc3f936146d1 Yin Fengwei             2023-09-18  847  
8749cfea11f3fff Vladimir Davydov        2016-01-15  848  /*
b3ac04132c4b9bc Matthew Wilcox (Oracle  2022-01-21  849)  * arg: folio_referenced_arg will be passed
8749cfea11f3fff Vladimir Davydov        2016-01-15  850   */
2f031c6f042cb8a Matthew Wilcox (Oracle  2022-01-29  851) static bool folio_referenced_one(struct folio *folio,
2f031c6f042cb8a Matthew Wilcox (Oracle  2022-01-29  852) 		struct vm_area_struct *vma, unsigned long address, void *arg)
8749cfea11f3fff Vladimir Davydov        2016-01-15  853  {
b3ac04132c4b9bc Matthew Wilcox (Oracle  2022-01-21  854) 	struct folio_referenced_arg *pra = arg;
b3ac04132c4b9bc Matthew Wilcox (Oracle  2022-01-21  855) 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
a2880202767dade Kiryl Shutsemau         2025-09-23  856  	int ptes = 0, referenced = 0;
8749cfea11f3fff Vladimir Davydov        2016-01-15  857  
8eaedede825a02d Kiryl Shutsemau         2017-02-24  858  	while (page_vma_mapped_walk(&pvmw)) {
8eaedede825a02d Kiryl Shutsemau         2017-02-24  859  		address = pvmw.address;
71e3aac0724ffe8 Andrea Arcangeli        2011-01-13  860  
1acbc3f936146d1 Yin Fengwei             2023-09-18  861  		if (vma->vm_flags & VM_LOCKED) {
a2880202767dade Kiryl Shutsemau         2025-09-23  862  			ptes++;
a2880202767dade Kiryl Shutsemau         2025-09-23  863  			pra->mapcount--;
a2880202767dade Kiryl Shutsemau         2025-09-23  864  
a2880202767dade Kiryl Shutsemau         2025-09-23  865  			/* Only mlock fully mapped pages */
a2880202767dade Kiryl Shutsemau         2025-09-23  866  			if (pvmw.pte && ptes != pvmw.nr_pages)
a2880202767dade Kiryl Shutsemau         2025-09-23  867  				continue;
a2880202767dade Kiryl Shutsemau         2025-09-23  868  
a2880202767dade Kiryl Shutsemau         2025-09-23  869  			/*
a2880202767dade Kiryl Shutsemau         2025-09-23  870  			 * All PTEs must be protected by page table lock in
a2880202767dade Kiryl Shutsemau         2025-09-23  871  			 * order to mlock the page.
a2880202767dade Kiryl Shutsemau         2025-09-23  872  			 *
a2880202767dade Kiryl Shutsemau         2025-09-23  873  			 * If page table boundary has been cross, current ptl
a2880202767dade Kiryl Shutsemau         2025-09-23  874  			 * only protect part of ptes.
a2880202767dade Kiryl Shutsemau         2025-09-23  875  			 */
a2880202767dade Kiryl Shutsemau         2025-09-23  876  			if (pvmw.flags & PVMW_PGTABLE_CROSSED)
a2880202767dade Kiryl Shutsemau         2025-09-23  877  				continue;
a2880202767dade Kiryl Shutsemau         2025-09-23  878  
47d4f3eeef5f7fd Hugh Dickins            2022-02-14  879  			/* Restore the mlock which got missed */
1acbc3f936146d1 Yin Fengwei             2023-09-18  880  			mlock_vma_folio(folio, vma);
8eaedede825a02d Kiryl Shutsemau         2017-02-24  881  			page_vma_mapped_walk_done(&pvmw);
9f32624be943538 Joonsoo Kim             2014-01-21  882  			pra->vm_flags |= VM_LOCKED;
e4b82222712ed15 Minchan Kim             2017-05-03  883  			return false; /* To break the loop */
2da28bfd9665f49 Andrea Arcangeli        2011-03-11  884  		}
2da28bfd9665f49 Andrea Arcangeli        2011-03-11  885  
c495b97624d0c05 Zhiguo Jiang            2024-07-10  886  		/*
c495b97624d0c05 Zhiguo Jiang            2024-07-10  887  		 * Skip the non-shared swapbacked folio mapped solely by
c495b97624d0c05 Zhiguo Jiang            2024-07-10  888  		 * the exiting or OOM-reaped process. This avoids redundant
c495b97624d0c05 Zhiguo Jiang            2024-07-10  889  		 * swap-out followed by an immediate unmap.
c495b97624d0c05 Zhiguo Jiang            2024-07-10  890  		 */
c495b97624d0c05 Zhiguo Jiang            2024-07-10  891  		if ((!atomic_read(&vma->vm_mm->mm_users) ||
c495b97624d0c05 Zhiguo Jiang            2024-07-10  892  		    check_stable_address_space(vma->vm_mm)) &&
c495b97624d0c05 Zhiguo Jiang            2024-07-10  893  		    folio_test_anon(folio) && folio_test_swapbacked(folio) &&
003fde4492c88ac David Hildenbrand       2025-03-03  894  		    !folio_maybe_mapped_shared(folio)) {
c495b97624d0c05 Zhiguo Jiang            2024-07-10  895  			pra->referenced = -1;
c495b97624d0c05 Zhiguo Jiang            2024-07-10  896  			page_vma_mapped_walk_done(&pvmw);
c495b97624d0c05 Zhiguo Jiang            2024-07-10  897  			return false;
c495b97624d0c05 Zhiguo Jiang            2024-07-10  898  		}
c495b97624d0c05 Zhiguo Jiang            2024-07-10  899  
1d4832becdc2cdb Yu Zhao                 2024-10-19  900  		if (lru_gen_enabled() && pvmw.pte) {
45aaa4d09fecd1c Peifeng Li              2022-09-13  901  				trace_android_vh_look_around(&pvmw, folio, vma, &referenced);
1d4832becdc2cdb Yu Zhao                 2024-10-19 @902  			if (lru_gen_look_around(&pvmw))
018ee47f14893d5 Yu Zhao                 2022-09-18  903  				referenced++;
1d4832becdc2cdb Yu Zhao                 2024-10-19  904  		} else if (pvmw.pte) {
8eaedede825a02d Kiryl Shutsemau         2017-02-24  905  			if (ptep_clear_flush_young_notify(vma, address,
8788f6781486769 Yu Zhao                 2022-12-30  906  						pvmw.pte))
^1da177e4c3f415 Linus Torvalds          2005-04-16  907  				referenced++;
8749cfea11f3fff Vladimir Davydov        2016-01-15  908  		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
8eaedede825a02d Kiryl Shutsemau         2017-02-24  909  			if (pmdp_clear_flush_young_notify(vma, address,
8eaedede825a02d Kiryl Shutsemau         2017-02-24  910  						pvmw.pmd))
8749cfea11f3fff Vladimir Davydov        2016-01-15  911  				referenced++;
8749cfea11f3fff Vladimir Davydov        2016-01-15  912  		} else {
b3ac04132c4b9bc Matthew Wilcox (Oracle  2022-01-21  913) 			/* unexpected pmd-mapped folio? */
8749cfea11f3fff Vladimir Davydov        2016-01-15  914  			WARN_ON_ONCE(1);
8749cfea11f3fff Vladimir Davydov        2016-01-15  915  		}
8eaedede825a02d Kiryl Shutsemau         2017-02-24  916  
8eaedede825a02d Kiryl Shutsemau         2017-02-24  917  		pra->mapcount--;
8eaedede825a02d Kiryl Shutsemau         2017-02-24  918  	}
^1da177e4c3f415 Linus Torvalds          2005-04-16  919  
33c3fc71c8cfa3c Vladimir Davydov        2015-09-09  920  	if (referenced)
b3ac04132c4b9bc Matthew Wilcox (Oracle  2022-01-21  921) 		folio_clear_idle(folio);
b3ac04132c4b9bc Matthew Wilcox (Oracle  2022-01-21  922) 	if (folio_test_clear_young(folio))
33c3fc71c8cfa3c Vladimir Davydov        2015-09-09  923  		referenced++;
33c3fc71c8cfa3c Vladimir Davydov        2015-09-09  924  
9f32624be943538 Joonsoo Kim             2014-01-21  925  	if (referenced) {
9f32624be943538 Joonsoo Kim             2014-01-21  926  		pra->referenced++;
47d4f3eeef5f7fd Hugh Dickins            2022-02-14  927  		pra->vm_flags |= vma->vm_flags & ~VM_LOCKED;
^1da177e4c3f415 Linus Torvalds          2005-04-16  928  	}
^1da177e4c3f415 Linus Torvalds          2005-04-16  929  
9f32624be943538 Joonsoo Kim             2014-01-21  930  	if (!pra->mapcount)
e4b82222712ed15 Minchan Kim             2017-05-03  931  		return false; /* To break the loop */
34bbd704051c9d0 Oleg Nesterov           2007-02-28  932  
e4b82222712ed15 Minchan Kim             2017-05-03  933  	return true;
^1da177e4c3f415 Linus Torvalds          2005-04-16  934  }
^1da177e4c3f415 Linus Torvalds          2005-04-16  935  

:::::: The code at line 902 was first introduced by commit
:::::: 1d4832becdc2cdb2cffe2a6050c9d9fd8ff1c58c mm: multi-gen LRU: use {ptep,pmdp}_clear_young_notify()

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
