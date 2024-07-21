Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910138F58
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721568021; cv=none; b=fNNoJoMlqVstn//x56FB0oq0/ozChDHWj5kFekuzhZoK66ZQxc5zQhTt1kThzVmy3++HKVjbKSdRWJy0OmwbN136McOUg74ZxsraL8EOO7B61FUioQvKisIMJGihsivxgcHDMj0ROV5SojQPmW8XTfShgr3eEZIslILOae43byc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721568021; c=relaxed/simple;
	bh=c5DuYWLMVSKtQPIhyZsdzajNM8hUZfM69fjR/eZKOVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T3cIxzxDhbyL+FLP8A7Ombkd+hE3eTPnkeplwaPSPNggfwWFH2wbdYRGw/EDOTsj1K9ak+6CUUbvTzTY+sZ3Ju6pWv+30zEvsNYxzNXlypeyPiuQXNm9bWAs0bmB6YJcZrIeh370d19JYFqpzcbAdPKFrC4eAgL7Htj8Orys04w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqsmnfcl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqsmnfcl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721568020; x=1753104020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c5DuYWLMVSKtQPIhyZsdzajNM8hUZfM69fjR/eZKOVM=;
  b=bqsmnfclZi7HH6jaxef46N6dzqqepJwWitlt/ANn2phSUMIResn7z7WQ
   CNG+fs+MFk05CUKpnWRphzzLaIaJdTJG+NArtyrpAWIE8pjpxymZT9qKj
   KSx/6bN5SEex51A6JpT3s67442UoEExtOP35C0TKa6dhxMpxBX6PTfTaK
   dgOg5RMKOzxbhM1s5OU8XTK8J5YUEJGfZTVwsXwYC+l5ZiyVMPMt+fRY0
   0vBYaQwlwAN2zIEC/Tdxy/i209aqgYZlT0/s1o3/Gx8jeBHWwSVFW7fTN
   66MY1wEhmKOQpeOuTD2w/pSjDEzLgzAZavHn9KIi+PrSyh2wPkvD/YrFR
   w==;
X-CSE-ConnectionGUID: YNXAbR/xSXK6QVuHS7uksg==
X-CSE-MsgGUID: 3BX/fSKVTbisDFDMcFGzQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="36574606"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="36574606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 06:20:19 -0700
X-CSE-ConnectionGUID: qP6lEWsxS5mahW5xzCmp7A==
X-CSE-MsgGUID: xwg8GXyDT6KsucbqXFXyqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51264812"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2024 06:20:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVWU4-000kI2-0D;
	Sun, 21 Jul 2024 13:20:16 +0000
Date: Sun, 21 Jul 2024 21:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 35/43] fs/dax.c:1237:66: error: passing argument
 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type
Message-ID: <202407212133.6QWWnrNr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   6c298a18633e397b8be4d6f48fc8cd1f860dd896
commit: 7e49c7e572a22b165bd9a3f2e9e1fd4085a40fb8 [35/43] pgtable: use ptdesc in pgtable_trans_huge_deposit
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240721/202407212133.6QWWnrNr-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407212133.6QWWnrNr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407212133.6QWWnrNr-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/dax.c: In function 'dax_pmd_load_hole':
>> fs/dax.c:1237:66: error: passing argument 3 of 'pgtable_trans_huge_deposit' from incompatible pointer type [-Wincompatible-pointer-types]
    1237 |                 pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, ptdesc);
         |                                                                  ^~~~~~
         |                                                                  |
         |                                                                  struct ptdesc *
   In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                    from arch/powerpc/include/asm/book3s/64/mmu.h:32,
                    from arch/powerpc/include/asm/mmu.h:385,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from fs/dax.c:10:
   arch/powerpc/include/asm/book3s/64/pgtable.h:1368:70: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
    1368 |                                               pmd_t *pmdp, pgtable_t pgtable)
         |                                                            ~~~~~~~~~~^~~~~~~
   fs/dax.c:1249:38: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    1249 |                 pte_free(vma->vm_mm, ptdesc);
         |                                      ^~~~~~
         |                                      |
         |                                      struct ptdesc *
   In file included from fs/dax.c:28:
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~


vim +/pgtable_trans_huge_deposit +1237 fs/dax.c

  1200	
  1201	#ifdef CONFIG_FS_DAX_PMD
  1202	static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
  1203			const struct iomap_iter *iter, void **entry)
  1204	{
  1205		struct address_space *mapping = vmf->vma->vm_file->f_mapping;
  1206		unsigned long pmd_addr = vmf->address & PMD_MASK;
  1207		struct vm_area_struct *vma = vmf->vma;
  1208		struct inode *inode = mapping->host;
  1209		struct ptdesc *ptdesc = NULL;
  1210		struct folio *zero_folio;
  1211		spinlock_t *ptl;
  1212		pmd_t pmd_entry;
  1213		pfn_t pfn;
  1214	
  1215		zero_folio = mm_get_huge_zero_folio(vmf->vma->vm_mm);
  1216	
  1217		if (unlikely(!zero_folio))
  1218			goto fallback;
  1219	
  1220		pfn = page_to_pfn_t(&zero_folio->page);
  1221		*entry = dax_insert_entry(xas, vmf, iter, *entry, pfn,
  1222					  DAX_PMD | DAX_ZERO_PAGE);
  1223	
  1224		if (arch_needs_pgtable_deposit()) {
  1225			ptdesc = pte_alloc_one(vma->vm_mm);
  1226			if (!ptdesc)
  1227				return VM_FAULT_OOM;
  1228		}
  1229	
  1230		ptl = pmd_lock(vmf->vma->vm_mm, vmf->pmd);
  1231		if (!pmd_none(*(vmf->pmd))) {
  1232			spin_unlock(ptl);
  1233			goto fallback;
  1234		}
  1235	
  1236		if (ptdesc) {
> 1237			pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, ptdesc);
  1238			mm_inc_nr_ptes(vma->vm_mm);
  1239		}
  1240		pmd_entry = mk_pmd(&zero_folio->page, vmf->vma->vm_page_prot);
  1241		pmd_entry = pmd_mkhuge(pmd_entry);
  1242		set_pmd_at(vmf->vma->vm_mm, pmd_addr, vmf->pmd, pmd_entry);
  1243		spin_unlock(ptl);
  1244		trace_dax_pmd_load_hole(inode, vmf, zero_folio, *entry);
  1245		return VM_FAULT_NOPAGE;
  1246	
  1247	fallback:
  1248		if (ptdesc)
  1249			pte_free(vma->vm_mm, ptdesc);
  1250		trace_dax_pmd_load_hole_fallback(inode, vmf, zero_folio, *entry);
  1251		return VM_FAULT_FALLBACK;
  1252	}
  1253	#else
  1254	static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
  1255			const struct iomap_iter *iter, void **entry)
  1256	{
  1257		return VM_FAULT_FALLBACK;
  1258	}
  1259	#endif /* CONFIG_FS_DAX_PMD */
  1260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
