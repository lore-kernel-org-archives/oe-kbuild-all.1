Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA889152196
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721834547; cv=none; b=QDimFgOFwn5qdZHx83848VdDWC+Qs/As0FHJBK4qphvSTVdD/5xtMKvEpVQdvpZfRQlt51NP//8w0het2BgWcoXSqAU9hKlLGDKtIegFjkwZYKz20uNJd1lu1bm/xjI9tYbmi2RkrBAPwPsaw8SFYjv2sQ+62zyuWbMjE6Y+MsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721834547; c=relaxed/simple;
	bh=Dp1qRmPwdOURMZJBDLf7SZrxXiAPHs211r/bU+j/fiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=clcBgD2udnnFkJTHoSRQM2plS1M5495Wem2n7CEdPUOuNMsDvK16g/ai3UhdJa6RpC56F0b8BTjX5Apl9kj3lWF7VPRszngnXOaUdHEpJ2FA3M85LkLbQDC+gW/VFIFZESdP/bnZ5b18s8dRSttHPMMSKCIpyIg5UlMrVqVY5LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6uNpLOv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6uNpLOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721834546; x=1753370546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dp1qRmPwdOURMZJBDLf7SZrxXiAPHs211r/bU+j/fiM=;
  b=G6uNpLOvHxHGn9hhvjIMWhAq6SwHfzQhziAc23esVweos78GHd+ZAUHd
   NZODfEwrwTP93IW8taxBGIiZEamMmNfcMa68SYoqmot3FcVPVRDHUJwVK
   mB4Nc4BZA3nPsO70ddjbF2mB3gyTPUBQjWph7hy/pnKCOgd1K28d6oLbe
   PUM/E3JWkeBS2CgLKIUVrHQ8lPwWndi42ua9rPY07n9ZdiyquulTrI+KR
   Kp7LmdUTptQvwJjZCVxDOhvYIQoOOc160dJ2/Ix1ypffvEnxCmdKjqez2
   dsttaDVHKLcWLlrSWyMDYzH4ZA7Mladea6Yi3+iw7IgJS7bke1M3xe294
   g==;
X-CSE-ConnectionGUID: k5XscmGGQ9igucrqmAaX3g==
X-CSE-MsgGUID: pyXOjt+wSwKQ6tzThtVC7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19374664"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="19374664"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 08:22:26 -0700
X-CSE-ConnectionGUID: K2g5ryLnSaigh9VetO6BOw==
X-CSE-MsgGUID: P8pIRnRPSK6IoFW6sdrpJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="52649093"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jul 2024 08:22:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWdor-000n6y-1g;
	Wed, 24 Jul 2024 15:22:21 +0000
Date: Wed, 24 Jul 2024 23:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 32/41] mm/memory.c:5199:19: error: controlling
 expression type 'pgtable_t' (aka 'pte_t *') not compatible with any generic
 association type
Message-ID: <202407242339.80QxMLjD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   45de53e1a6ceb1ede64b54126f9ee514f50c4e4c
commit: b5932eca5dda09f8073290ad7c923496c035ac40 [32/41] mm/pgtable: return ptdesc in pte_free
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240724/202407242339.80QxMLjD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242339.80QxMLjD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242339.80QxMLjD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:44:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:45:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   mm/memory.c:448:17: error: incompatible pointer types initializing 'struct ptdesc *' with an expression of type 'pte_t *' [-Werror,-Wincompatible-pointer-types]
     448 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                        ^        ~~~~~~~~~~~~~~~~~
   mm/memory.c:4650:35: error: controlling expression type 'pte_t *' not compatible with any generic association type
    4650 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                     ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgalloc.h:140:28: note: expanded from macro 'pte_alloc_one'
     140 | #define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
         |                            ^
   include/linux/mm_types.h:502:38: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                    ^~
   mm/memory.c:5013:35: error: controlling expression type 'pte_t *' not compatible with any generic association type
    5013 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
         |                                     ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgalloc.h:140:28: note: expanded from macro 'pte_alloc_one'
     140 | #define pte_alloc_one(mm) ((pte_t *)page_table_alloc(mm))
         |                            ^
   include/linux/mm_types.h:502:38: note: expanded from macro 'ptdesc_page'
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                    ^~
>> mm/memory.c:5199:19: error: controlling expression type 'pgtable_t' (aka 'pte_t *') not compatible with any generic association type
    5199 |                 pte_free(vm_mm, page_ptdesc(vmf->prealloc_pte));
         |                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:510:36: note: expanded from macro 'page_ptdesc'
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   arch/s390/include/asm/pgalloc.h:143:65: note: expanded from macro 'pte_free'
     143 | #define pte_free(mm, pte) page_table_free(mm, (unsigned long *) pte)
         |                                                                 ^~~
   15 warnings and 4 errors generated.


vim +5199 mm/memory.c

  5152	
  5153	/*
  5154	 * We enter with non-exclusive mmap_lock (to exclude vma changes,
  5155	 * but allow concurrent faults).
  5156	 * The mmap_lock may have been released depending on flags and our
  5157	 * return value.  See filemap_fault() and __folio_lock_or_retry().
  5158	 * If mmap_lock is released, vma may become invalid (for example
  5159	 * by other thread calling munmap()).
  5160	 */
  5161	static vm_fault_t do_fault(struct vm_fault *vmf)
  5162	{
  5163		struct vm_area_struct *vma = vmf->vma;
  5164		struct mm_struct *vm_mm = vma->vm_mm;
  5165		vm_fault_t ret;
  5166	
  5167		/*
  5168		 * The VMA was not fully populated on mmap() or missing VM_DONTEXPAND
  5169		 */
  5170		if (!vma->vm_ops->fault) {
  5171			vmf->pte = pte_offset_map_lock(vmf->vma->vm_mm, vmf->pmd,
  5172						       vmf->address, &vmf->ptl);
  5173			if (unlikely(!vmf->pte))
  5174				ret = VM_FAULT_SIGBUS;
  5175			else {
  5176				/*
  5177				 * Make sure this is not a temporary clearing of pte
  5178				 * by holding ptl and checking again. A R/M/W update
  5179				 * of pte involves: take ptl, clearing the pte so that
  5180				 * we don't have concurrent modification by hardware
  5181				 * followed by an update.
  5182				 */
  5183				if (unlikely(pte_none(ptep_get(vmf->pte))))
  5184					ret = VM_FAULT_SIGBUS;
  5185				else
  5186					ret = VM_FAULT_NOPAGE;
  5187	
  5188				pte_unmap_unlock(vmf->pte, vmf->ptl);
  5189			}
  5190		} else if (!(vmf->flags & FAULT_FLAG_WRITE))
  5191			ret = do_read_fault(vmf);
  5192		else if (!(vma->vm_flags & VM_SHARED))
  5193			ret = do_cow_fault(vmf);
  5194		else
  5195			ret = do_shared_fault(vmf);
  5196	
  5197		/* preallocated pagetable is unused: free it */
  5198		if (vmf->prealloc_pte) {
> 5199			pte_free(vm_mm, page_ptdesc(vmf->prealloc_pte));
  5200			vmf->prealloc_pte = NULL;
  5201		}
  5202		return ret;
  5203	}
  5204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
