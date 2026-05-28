Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23025313550
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 06:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779948673; cv=none; b=e9MubUhUeJvNdimfhgcPsevyRsC8FWn+YWvj3IDE6n2I05CG3VhWVkRzvurkKkydORGmCP1YFrXtl9x4A1MzgJhxsNtWu+acqdN86jn1j4q/nR4fXc9jb4KonM7LlCg8Rpa5qvpg8bQLtZYWNwCicH4iBTwXssZaVxybGZNjpSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779948673; c=relaxed/simple;
	bh=7nHTFjRpVi+JfXuX41y5vmRrefrnQl0N7LbXwO+Hz/k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nw3Y55q0rq1H5msQy8v3nqmfFHtnU3M4FaS2kwxPcP5ba+aL/encZaii2IQRoPJPE4beqEkgIjTgg125eHswDD1rrEGVxtccUYs/nQD9K4NL0R09DdfrJ2x7XOuPYtD6SI+cWiPyRYLQQCEu3MMfncLi7qjLQ8+KVVetFagQxg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnKEPwYD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnKEPwYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779948671; x=1811484671;
  h=date:from:to:cc:subject:message-id;
  bh=7nHTFjRpVi+JfXuX41y5vmRrefrnQl0N7LbXwO+Hz/k=;
  b=CnKEPwYDoUP3VpkdfoPoHecVR5XBBNR/PU04Sz5B/tSyLXbq93DaKBzF
   X06z1Hvs5l4bBbGPPrpe0ZwUfeB2KELjXoi3agfBsqIlqctvUA+H8QUv2
   vToXlfHZa9RbWRYKcqVPxqI7F0bB1xk/Ls/NKHwf7om+tuEDElxPPnbXj
   MvNfdTZsAOHOSW9PV1MqeVewAqX8cPxOAeZ7oqUlfFUQ26rtckbptP805
   wmoypfyimypGL3IIL4+DyiN7N+njavjZO/DdgReiwsTsbPog4KgEr6dUB
   RfLX6JItBlka2t/n8X/BH6eeeTxAhUXU7mQjCZBt9UhMf4H+JW1rIXyat
   g==;
X-CSE-ConnectionGUID: K293O+rEToewuEGt04Dbew==
X-CSE-MsgGUID: 9vMLXR+cTXmEt0cA6T00Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="106238317"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="106238317"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 23:11:10 -0700
X-CSE-ConnectionGUID: LBCq6A6ARZiXNIpqRJZDKw==
X-CSE-MsgGUID: R56w3UoBRHupPjtBDnho7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="246490500"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 27 May 2026 23:11:09 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSTxS-000000000Iz-257A;
	Thu, 28 May 2026 06:11:06 +0000
Date: Thu, 28 May 2026 08:10:54 +0200
From: kernel test robot <lkp@intel.com>
To: tao <tao.wangtao@honor.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./include/linux/rmap.h:399:64: error: 'struct
 vm_area_struct' has no member named 'vm_rcuref'
Message-ID: <202605280842.cVIcBVHT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/tao/mm-rmap-introduce-anon_rmap-APIs-for-anonymous-folios/20260527-191029
head:   d6b84c27ac44f1ad64e0c96150f128acfc1be38e
commit: 559daa35a1b4293cef83dcdc547cd724bf4fee5c mm: support setup and upgrade of ANON_VMA_LAZY folios
date:   19 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260528/202605280842.cVIcBVHT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280842.cVIcBVHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605280842.cVIcBVHT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/init.h:5,
                    from ./include/linux/printk.h:6,
                    from ./include/asm-generic/bug.h:31,
                    from ./arch/x86/include/asm/bug.h:193,
                    from ./include/linux/bug.h:5,
                    from ./include/linux/mmdebug.h:5,
                    from ./include/linux/mm.h:7,
                    from ./include/linux/pagewalk.h:5,
                    from fs/proc/task_mmu.c:2:
   ./include/linux/rmap.h: In function '__folio_rmap_sanity_checks':
>> ./include/linux/rmap.h:399:64: error: 'struct vm_area_struct' has no member named 'vm_rcuref'
     399 |                         VM_WARN_ON_FOLIO(!rcuref_read(&root_vma->vm_rcuref), folio);
         |                                                                ^~
   ./include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   ./include/linux/rmap.h:399:25: note: in expansion of macro 'VM_WARN_ON_FOLIO'
     399 |                         VM_WARN_ON_FOLIO(!rcuref_read(&root_vma->vm_rcuref), folio);
         |                         ^~~~~~~~~~~~~~~~


vim +399 ./include/linux/rmap.h

   330	
   331	static __always_inline void __folio_rmap_sanity_checks(const struct folio *folio,
   332			const struct page *page, int nr_pages, enum pgtable_level level)
   333	{
   334		/* hugetlb folios are handled separately. */
   335		VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
   336	
   337		/* When (un)mapping zeropages, we should never touch ref+mapcount. */
   338		VM_WARN_ON_FOLIO(is_zero_folio(folio), folio);
   339	
   340		/*
   341		 * TODO: we get driver-allocated folios that have nothing to do with
   342		 * the rmap using vm_insert_page(); therefore, we cannot assume that
   343		 * folio_test_large_rmappable() holds for large folios. We should
   344		 * handle any desired mapcount+stats accounting for these folios in
   345		 * VM_MIXEDMAP VMAs separately, and then sanity-check here that
   346		 * we really only get rmappable folios.
   347		 */
   348	
   349		VM_WARN_ON_ONCE(nr_pages <= 0);
   350		VM_WARN_ON_FOLIO(page_folio(page) != folio, folio);
   351		VM_WARN_ON_FOLIO(page_folio(page + nr_pages - 1) != folio, folio);
   352	
   353		switch (level) {
   354		case PGTABLE_LEVEL_PTE:
   355			break;
   356		case PGTABLE_LEVEL_PMD:
   357			/*
   358			 * We don't support folios larger than a single PMD yet. So
   359			 * when PGTABLE_LEVEL_PMD is set, we assume that we are creating
   360			 * a single "entire" mapping of the folio.
   361			 */
   362			VM_WARN_ON_FOLIO(folio_nr_pages(folio) != HPAGE_PMD_NR, folio);
   363			VM_WARN_ON_FOLIO(nr_pages != HPAGE_PMD_NR, folio);
   364			break;
   365		case PGTABLE_LEVEL_PUD:
   366			/*
   367			 * Assume that we are creating a single "entire" mapping of the
   368			 * folio.
   369			 */
   370			VM_WARN_ON_FOLIO(folio_nr_pages(folio) != HPAGE_PUD_NR, folio);
   371			VM_WARN_ON_FOLIO(nr_pages != HPAGE_PUD_NR, folio);
   372			break;
   373		default:
   374			BUILD_BUG();
   375		}
   376	
   377		/*
   378		 * Anon folios must have an associated live anon_vma as long as they're
   379		 * mapped into userspace.
   380		 * Note that the atomic_read() mainly does two things:
   381		 *
   382		 * 1. In KASAN builds with CONFIG_SLUB_RCU_DEBUG, it causes KASAN to
   383		 *    check that the associated anon_vma has not yet been freed (subject
   384		 *    to KASAN's usual limitations). This check will pass if the
   385		 *    anon_vma's refcount has already dropped to 0 but an RCU grace
   386		 *    period hasn't passed since then.
   387		 * 2. If the anon_vma has not yet been freed, it checks that the
   388		 *    anon_vma still has a nonzero refcount (as opposed to being in the
   389		 *    middle of an RCU delay for getting freed).
   390		 */
   391		if (folio_test_anon(folio) && !folio_test_ksm(folio)) {
   392			unsigned long mapping = (unsigned long)folio->mapping;
   393			struct anon_vma *anon_vma;
   394	
   395			if (folio_test_anon_vma_lazy(folio)) {
   396				struct vm_area_struct *root_vma =
   397					(void *)(mapping - FOLIO_MAPPING_ANON_VMA_LAZY);
   398	
 > 399				VM_WARN_ON_FOLIO(!rcuref_read(&root_vma->vm_rcuref), folio);
   400				return;
   401			}
   402	
   403			anon_vma = (void *)(mapping - FOLIO_MAPPING_ANON);
   404			VM_WARN_ON_FOLIO(atomic_read(&anon_vma->refcount) == 0, folio);
   405		}
   406	}
   407	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
