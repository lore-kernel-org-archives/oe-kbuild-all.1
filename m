Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7CD1802B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 02:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723255462; cv=none; b=N3WGQVPlmGIJWpwMfJ1/otgD3ie4sUMzhZyyd1anHLvOL/yHhx7MX6+zls8hFag8FXo0o2DMwpUqrTghKt4Njd3qVnDUZiuTlM4ZNIjxs0eDxoqT+AAM3yJtFInu5x/Rg4gVGyXO+h4c7tUb2fgb3qNJxerCTuTDM+DvWV6PQCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723255462; c=relaxed/simple;
	bh=VdNqSLZwchLLTFLmYZ8F6u7CXk46e3qXtzPz7YWgIIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LXE4x7UmPYvGXSdsSGXVdGnwJfV1K154uY2eHaq5t45oHspWYfv9bnEMW73aY4CFuT3QePPcQnrAa2Ot4BSVBHJENDgcuCo+rXDKyQvMclU1OL7XbhzIfyol3wo3xbr7Dy3ksrulr4ksB9z3hQe/k4V/njkv6Ld6mGxz1oxXrlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAXEvMM7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAXEvMM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723255461; x=1754791461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VdNqSLZwchLLTFLmYZ8F6u7CXk46e3qXtzPz7YWgIIQ=;
  b=RAXEvMM7upIzUazr0qxu1CnoRc0Fowj3XfiBJ8ZSXAYfd6PRdJCGPkOy
   /FttUZYNVCmDhDUCRUMUMlsd9BBgduich9WEQExeDjDoBGzT8cWKV9iYq
   d6wo21gVFQTAZuGyQKgD3TOYV6LsUKTY30K4XeKx83nKJvPB06vM+uAqA
   sS86Kwnnrw5VkDYih3x3LrGEZAbJ2gT+44ClxHRqzxF0FhA2dVQAQgv7w
   G+Xjggfjgjtq9dRYVfqYevNlkhA0xj7Wu9LUF7+c1jgrgkmiCbXa43jCH
   4sTOPbH5jmT8hQ0O/7UCpGz/3BTYvcXvhHv21VAzNl4FzC00dT6ufOlGO
   g==;
X-CSE-ConnectionGUID: y/mLhS/vQOmcCoR3fPP8vA==
X-CSE-MsgGUID: dtr793JNRpSa+SXVn5Npmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="43962729"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="43962729"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 19:04:20 -0700
X-CSE-ConnectionGUID: GRjmKgHhScWESjNDAMxTjw==
X-CSE-MsgGUID: pizolwizRSin/NNPnaeodw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="88380958"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 09 Aug 2024 19:04:19 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scbSq-0009Ut-0x;
	Sat, 10 Aug 2024 02:04:16 +0000
Date: Sat, 10 Aug 2024 10:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 10/18]
 arch/powerpc/kvm/book3s_64_mmu_radix.c:760:30: error: incompatible pointer
 types passing 'pte_t *' to parameter of type 'struct ptdesc *'
Message-ID: <202408100923.tkjWtE8I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc
head:   105a369317c56f14df26b6ddbd83d0bd4e20a9cc
commit: ecd424d3e55998cd6d5d1643b46b732b332bddca [10/18] mm/pgtable: pass ptdesc to pte_free()
config: powerpc64-randconfig-002-20240810 (https://download.01.org/0day-ci/archive/20240810/202408100923.tkjWtE8I-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100923.tkjWtE8I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408100923.tkjWtE8I-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kvm/book3s_64_mmu_radix.c:10:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2234:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/powerpc/kvm/book3s_64_mmu_radix.c:760:30: error: incompatible pointer types passing 'pte_t *' to parameter of type 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]
     760 |                 pmd_populate(kvm->mm, pmd, new_ptep);
         |                                            ^~~~~~~~
   arch/powerpc/include/asm/book3s/64/pgalloc.h:165:20: note: passing argument to parameter 'pte_page' here
     165 |                                 struct ptdesc *pte_page)
         |                                                ^
   1 warning and 1 error generated.


vim +760 arch/powerpc/kvm/book3s_64_mmu_radix.c

878cf2bb2d8d61 Nicholas Piggin      2018-05-17  614  
fd10be257312b5 Suraj Jitindar Singh 2018-10-08  615  int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
04bae9d5b4c09a Suraj Jitindar Singh 2018-10-08  616  		      unsigned long gpa, unsigned int level,
dfcaacc8f970c6 Jordan Niethe        2023-09-14  617  		      unsigned long mmu_seq, u64 lpid,
8cf531ed48cfc7 Suraj Jitindar Singh 2018-10-08  618  		      unsigned long *rmapp, struct rmap_nested **n_rmap)
5a319350a46572 Paul Mackerras       2017-01-30  619  {
5a319350a46572 Paul Mackerras       2017-01-30  620  	pgd_t *pgd;
2fb4706057bcf8 Mike Rapoport        2020-06-04  621  	p4d_t *p4d;
5a319350a46572 Paul Mackerras       2017-01-30  622  	pud_t *pud, *new_pud = NULL;
5a319350a46572 Paul Mackerras       2017-01-30  623  	pmd_t *pmd, *new_pmd = NULL;
5a319350a46572 Paul Mackerras       2017-01-30  624  	pte_t *ptep, *new_ptep = NULL;
5a319350a46572 Paul Mackerras       2017-01-30  625  	int ret;
5a319350a46572 Paul Mackerras       2017-01-30  626  
5a319350a46572 Paul Mackerras       2017-01-30  627  	/* Traverse the guest's 2nd-level tree, allocate new levels needed */
04bae9d5b4c09a Suraj Jitindar Singh 2018-10-08  628  	pgd = pgtable + pgd_index(gpa);
2fb4706057bcf8 Mike Rapoport        2020-06-04  629  	p4d = p4d_offset(pgd, gpa);
2fb4706057bcf8 Mike Rapoport        2020-06-04  630  
5a319350a46572 Paul Mackerras       2017-01-30  631  	pud = NULL;
2fb4706057bcf8 Mike Rapoport        2020-06-04  632  	if (p4d_present(*p4d))
2fb4706057bcf8 Mike Rapoport        2020-06-04  633  		pud = pud_offset(p4d, gpa);
5a319350a46572 Paul Mackerras       2017-01-30  634  	else
5a319350a46572 Paul Mackerras       2017-01-30  635  		new_pud = pud_alloc_one(kvm->mm, gpa);
5a319350a46572 Paul Mackerras       2017-01-30  636  
5a319350a46572 Paul Mackerras       2017-01-30  637  	pmd = NULL;
bd18b688220c72 Peter Xu             2024-03-05  638  	if (pud && pud_present(*pud) && !pud_leaf(*pud))
5a319350a46572 Paul Mackerras       2017-01-30  639  		pmd = pmd_offset(pud, gpa);
58c5c276b4c2ce Paul Mackerras       2018-02-24  640  	else if (level <= 1)
21828c99ee91be Aneesh Kumar K.V     2018-04-16  641  		new_pmd = kvmppc_pmd_alloc();
5a319350a46572 Paul Mackerras       2017-01-30  642  
bd18b688220c72 Peter Xu             2024-03-05  643  	if (level == 0 && !(pmd && pmd_present(*pmd) && !pmd_leaf(*pmd)))
5a319350a46572 Paul Mackerras       2017-01-30  644  		new_ptep = kvmppc_pte_alloc();
5a319350a46572 Paul Mackerras       2017-01-30  645  
5a319350a46572 Paul Mackerras       2017-01-30  646  	/* Check if we might have been invalidated; let the guest retry if so */
5a319350a46572 Paul Mackerras       2017-01-30  647  	spin_lock(&kvm->mmu_lock);
5a319350a46572 Paul Mackerras       2017-01-30  648  	ret = -EAGAIN;
20ec3ebd707c77 Chao Peng            2022-08-16  649  	if (mmu_invalidate_retry(kvm, mmu_seq))
5a319350a46572 Paul Mackerras       2017-01-30  650  		goto out_unlock;
5a319350a46572 Paul Mackerras       2017-01-30  651  
5a319350a46572 Paul Mackerras       2017-01-30  652  	/* Now traverse again under the lock and change the tree */
5a319350a46572 Paul Mackerras       2017-01-30  653  	ret = -ENOMEM;
2fb4706057bcf8 Mike Rapoport        2020-06-04  654  	if (p4d_none(*p4d)) {
5a319350a46572 Paul Mackerras       2017-01-30  655  		if (!new_pud)
5a319350a46572 Paul Mackerras       2017-01-30  656  			goto out_unlock;
2fb4706057bcf8 Mike Rapoport        2020-06-04  657  		p4d_populate(kvm->mm, p4d, new_pud);
5a319350a46572 Paul Mackerras       2017-01-30  658  		new_pud = NULL;
5a319350a46572 Paul Mackerras       2017-01-30  659  	}
2fb4706057bcf8 Mike Rapoport        2020-06-04  660  	pud = pud_offset(p4d, gpa);
bd18b688220c72 Peter Xu             2024-03-05  661  	if (pud_leaf(*pud)) {
58c5c276b4c2ce Paul Mackerras       2018-02-24  662  		unsigned long hgpa = gpa & PUD_MASK;
58c5c276b4c2ce Paul Mackerras       2018-02-24  663  
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  664  		/* Check if we raced and someone else has set the same thing */
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  665  		if (level == 2) {
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  666  			if (pud_raw(*pud) == pte_raw(pte)) {
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  667  				ret = 0;
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  668  				goto out_unlock;
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  669  			}
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  670  			/* Valid 1GB page here already, add our extra bits */
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  671  			WARN_ON_ONCE((pud_val(*pud) ^ pte_val(pte)) &
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  672  							PTE_BITS_MUST_MATCH);
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  673  			kvmppc_radix_update_pte(kvm, (pte_t *)pud,
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  674  					      0, pte_val(pte), hgpa, PUD_SHIFT);
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  675  			ret = 0;
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  676  			goto out_unlock;
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  677  		}
58c5c276b4c2ce Paul Mackerras       2018-02-24  678  		/*
58c5c276b4c2ce Paul Mackerras       2018-02-24  679  		 * If we raced with another CPU which has just put
58c5c276b4c2ce Paul Mackerras       2018-02-24  680  		 * a 1GB pte in after we saw a pmd page, try again.
58c5c276b4c2ce Paul Mackerras       2018-02-24  681  		 */
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  682  		if (!new_pmd) {
58c5c276b4c2ce Paul Mackerras       2018-02-24  683  			ret = -EAGAIN;
58c5c276b4c2ce Paul Mackerras       2018-02-24  684  			goto out_unlock;
58c5c276b4c2ce Paul Mackerras       2018-02-24  685  		}
58c5c276b4c2ce Paul Mackerras       2018-02-24  686  		/* Valid 1GB page here already, remove it */
fd10be257312b5 Suraj Jitindar Singh 2018-10-08  687  		kvmppc_unmap_pte(kvm, (pte_t *)pud, hgpa, PUD_SHIFT, NULL,
fd10be257312b5 Suraj Jitindar Singh 2018-10-08  688  				 lpid);
58c5c276b4c2ce Paul Mackerras       2018-02-24  689  	}
58c5c276b4c2ce Paul Mackerras       2018-02-24  690  	if (level == 2) {
58c5c276b4c2ce Paul Mackerras       2018-02-24  691  		if (!pud_none(*pud)) {
58c5c276b4c2ce Paul Mackerras       2018-02-24  692  			/*
58c5c276b4c2ce Paul Mackerras       2018-02-24  693  			 * There's a page table page here, but we wanted to
58c5c276b4c2ce Paul Mackerras       2018-02-24  694  			 * install a large page, so remove and free the page
a5704e83aa3d67 Nicholas Piggin      2018-05-17  695  			 * table page.
58c5c276b4c2ce Paul Mackerras       2018-02-24  696  			 */
fd10be257312b5 Suraj Jitindar Singh 2018-10-08  697  			kvmppc_unmap_free_pud_entry_table(kvm, pud, gpa, lpid);
58c5c276b4c2ce Paul Mackerras       2018-02-24  698  		}
58c5c276b4c2ce Paul Mackerras       2018-02-24  699  		kvmppc_radix_set_pte_at(kvm, gpa, (pte_t *)pud, pte);
8cf531ed48cfc7 Suraj Jitindar Singh 2018-10-08  700  		if (rmapp && n_rmap)
8cf531ed48cfc7 Suraj Jitindar Singh 2018-10-08  701  			kvmhv_insert_nest_rmap(kvm, rmapp, n_rmap);
58c5c276b4c2ce Paul Mackerras       2018-02-24  702  		ret = 0;
58c5c276b4c2ce Paul Mackerras       2018-02-24  703  		goto out_unlock;
58c5c276b4c2ce Paul Mackerras       2018-02-24  704  	}
5a319350a46572 Paul Mackerras       2017-01-30  705  	if (pud_none(*pud)) {
5a319350a46572 Paul Mackerras       2017-01-30  706  		if (!new_pmd)
5a319350a46572 Paul Mackerras       2017-01-30  707  			goto out_unlock;
5a319350a46572 Paul Mackerras       2017-01-30  708  		pud_populate(kvm->mm, pud, new_pmd);
5a319350a46572 Paul Mackerras       2017-01-30  709  		new_pmd = NULL;
5a319350a46572 Paul Mackerras       2017-01-30  710  	}
5a319350a46572 Paul Mackerras       2017-01-30  711  	pmd = pmd_offset(pud, gpa);
bd18b688220c72 Peter Xu             2024-03-05  712  	if (pmd_leaf(*pmd)) {
c3856aeb29402e Paul Mackerras       2018-02-23  713  		unsigned long lgpa = gpa & PMD_MASK;
c3856aeb29402e Paul Mackerras       2018-02-23  714  
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  715  		/* Check if we raced and someone else has set the same thing */
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  716  		if (level == 1) {
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  717  			if (pmd_raw(*pmd) == pte_raw(pte)) {
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  718  				ret = 0;
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  719  				goto out_unlock;
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  720  			}
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  721  			/* Valid 2MB page here already, add our extra bits */
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  722  			WARN_ON_ONCE((pmd_val(*pmd) ^ pte_val(pte)) &
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  723  							PTE_BITS_MUST_MATCH);
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  724  			kvmppc_radix_update_pte(kvm, pmdp_ptep(pmd),
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  725  					0, pte_val(pte), lgpa, PMD_SHIFT);
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  726  			ret = 0;
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  727  			goto out_unlock;
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  728  		}
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  729  
c3856aeb29402e Paul Mackerras       2018-02-23  730  		/*
c3856aeb29402e Paul Mackerras       2018-02-23  731  		 * If we raced with another CPU which has just put
c3856aeb29402e Paul Mackerras       2018-02-23  732  		 * a 2MB pte in after we saw a pte page, try again.
c3856aeb29402e Paul Mackerras       2018-02-23  733  		 */
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  734  		if (!new_ptep) {
5a319350a46572 Paul Mackerras       2017-01-30  735  			ret = -EAGAIN;
5a319350a46572 Paul Mackerras       2017-01-30  736  			goto out_unlock;
5a319350a46572 Paul Mackerras       2017-01-30  737  		}
c3856aeb29402e Paul Mackerras       2018-02-23  738  		/* Valid 2MB page here already, remove it */
fd10be257312b5 Suraj Jitindar Singh 2018-10-08  739  		kvmppc_unmap_pte(kvm, pmdp_ptep(pmd), lgpa, PMD_SHIFT, NULL,
fd10be257312b5 Suraj Jitindar Singh 2018-10-08  740  				 lpid);
58c5c276b4c2ce Paul Mackerras       2018-02-24  741  	}
58c5c276b4c2ce Paul Mackerras       2018-02-24  742  	if (level == 1) {
58c5c276b4c2ce Paul Mackerras       2018-02-24  743  		if (!pmd_none(*pmd)) {
5a319350a46572 Paul Mackerras       2017-01-30  744  			/*
c4c8a7643e74eb Paul Mackerras       2018-02-23  745  			 * There's a page table page here, but we wanted to
c4c8a7643e74eb Paul Mackerras       2018-02-23  746  			 * install a large page, so remove and free the page
a5704e83aa3d67 Nicholas Piggin      2018-05-17  747  			 * table page.
5a319350a46572 Paul Mackerras       2017-01-30  748  			 */
fd10be257312b5 Suraj Jitindar Singh 2018-10-08  749  			kvmppc_unmap_free_pmd_entry_table(kvm, pmd, gpa, lpid);
5a319350a46572 Paul Mackerras       2017-01-30  750  		}
58c5c276b4c2ce Paul Mackerras       2018-02-24  751  		kvmppc_radix_set_pte_at(kvm, gpa, pmdp_ptep(pmd), pte);
8cf531ed48cfc7 Suraj Jitindar Singh 2018-10-08  752  		if (rmapp && n_rmap)
8cf531ed48cfc7 Suraj Jitindar Singh 2018-10-08  753  			kvmhv_insert_nest_rmap(kvm, rmapp, n_rmap);
58c5c276b4c2ce Paul Mackerras       2018-02-24  754  		ret = 0;
5a319350a46572 Paul Mackerras       2017-01-30  755  		goto out_unlock;
5a319350a46572 Paul Mackerras       2017-01-30  756  	}
5a319350a46572 Paul Mackerras       2017-01-30  757  	if (pmd_none(*pmd)) {
5a319350a46572 Paul Mackerras       2017-01-30  758  		if (!new_ptep)
5a319350a46572 Paul Mackerras       2017-01-30  759  			goto out_unlock;
5a319350a46572 Paul Mackerras       2017-01-30 @760  		pmd_populate(kvm->mm, pmd, new_ptep);
5a319350a46572 Paul Mackerras       2017-01-30  761  		new_ptep = NULL;
5a319350a46572 Paul Mackerras       2017-01-30  762  	}
5a319350a46572 Paul Mackerras       2017-01-30  763  	ptep = pte_offset_kernel(pmd, gpa);
5a319350a46572 Paul Mackerras       2017-01-30  764  	if (pte_present(*ptep)) {
c4c8a7643e74eb Paul Mackerras       2018-02-23  765  		/* Check if someone else set the same thing */
c4c8a7643e74eb Paul Mackerras       2018-02-23  766  		if (pte_raw(*ptep) == pte_raw(pte)) {
c4c8a7643e74eb Paul Mackerras       2018-02-23  767  			ret = 0;
c4c8a7643e74eb Paul Mackerras       2018-02-23  768  			goto out_unlock;
c4c8a7643e74eb Paul Mackerras       2018-02-23  769  		}
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  770  		/* Valid page here already, add our extra bits */
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  771  		WARN_ON_ONCE((pte_val(*ptep) ^ pte_val(pte)) &
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  772  							PTE_BITS_MUST_MATCH);
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  773  		kvmppc_radix_update_pte(kvm, ptep, 0, pte_val(pte), gpa, 0);
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  774  		ret = 0;
878cf2bb2d8d61 Nicholas Piggin      2018-05-17  775  		goto out_unlock;
5a319350a46572 Paul Mackerras       2017-01-30  776  	}
5a319350a46572 Paul Mackerras       2017-01-30  777  	kvmppc_radix_set_pte_at(kvm, gpa, ptep, pte);
8cf531ed48cfc7 Suraj Jitindar Singh 2018-10-08  778  	if (rmapp && n_rmap)
8cf531ed48cfc7 Suraj Jitindar Singh 2018-10-08  779  		kvmhv_insert_nest_rmap(kvm, rmapp, n_rmap);
5a319350a46572 Paul Mackerras       2017-01-30  780  	ret = 0;
5a319350a46572 Paul Mackerras       2017-01-30  781  
5a319350a46572 Paul Mackerras       2017-01-30  782   out_unlock:
5a319350a46572 Paul Mackerras       2017-01-30  783  	spin_unlock(&kvm->mmu_lock);
5a319350a46572 Paul Mackerras       2017-01-30  784  	if (new_pud)
5a319350a46572 Paul Mackerras       2017-01-30  785  		pud_free(kvm->mm, new_pud);
5a319350a46572 Paul Mackerras       2017-01-30  786  	if (new_pmd)
21828c99ee91be Aneesh Kumar K.V     2018-04-16  787  		kvmppc_pmd_free(new_pmd);
5a319350a46572 Paul Mackerras       2017-01-30  788  	if (new_ptep)
5a319350a46572 Paul Mackerras       2017-01-30  789  		kvmppc_pte_free(new_ptep);
5a319350a46572 Paul Mackerras       2017-01-30  790  	return ret;
5a319350a46572 Paul Mackerras       2017-01-30  791  }
5a319350a46572 Paul Mackerras       2017-01-30  792  

:::::: The code at line 760 was first introduced by commit
:::::: 5a319350a46572d073042a3194676099dd2c135d KVM: PPC: Book3S HV: Page table construction and page faults for radix guests

:::::: TO: Paul Mackerras <paulus@ozlabs.org>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
