Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E5A3201
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 05:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721454482; cv=none; b=imnOf7tMttq1CpY669aGso38jlsdoQu60+r0g0QnPSgW1RIuELpeTcVbAUPf+QxPXLNU8flh16bRPI2zw0LO8fhD+z7WC+7D/Is06RNoiKUCYbT9Onnygq2XOJ0KZJQVsPSkhnfQlFNfX3UbwFHu/pNkPLM2Hdiq2qsl3FAHVwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721454482; c=relaxed/simple;
	bh=cYX6mhVIAmRAxitQ6DWXdYhWaJsWgYJYmRL2vpKhCZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKiV4iiuMf0dXYyg0Re2PsX3McDjKAxf+MvkFGzYC2Vb+zFby8jYwlA2o+mgtkCe1cWwqvGWwWhlft5/FQG4m/RzkOi9TgFS/WmaOq5jHSRuwRi6ZE6xnzhbsZg+Kzl7wuPyzWar+YKmkwu+glpmL5MW3YCgOwfPUmBTOnggXdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Au5USY47; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Au5USY47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721454480; x=1752990480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cYX6mhVIAmRAxitQ6DWXdYhWaJsWgYJYmRL2vpKhCZo=;
  b=Au5USY47GXL+dRL5iz8abdNo02fupkWz1y4lACwg1hnlqxhQpZkC7bSR
   jHw4qqT5fTGiYIvjp5KDTEGXGoDmj+ykxuU2VKkkV55wzhWx76m7oNwvY
   kn87SDFqZV1DH+SCjX7gv42IYQuflRPmNCq3+goFdOTj5tZJ6X1oPzS2w
   KF+BsSjRcn9NCHtjg9ejBKwECR1vbDzrQsybn7XiQLl1CuicUK+p1g+Dz
   PfhCMbzbGvtGTI38808OvXpQ1Wf2+C+GWGBw0Pk2wZmzDoJ/L1qixy2Dz
   z/VJSy5pzVIutQ6tcJBF3BNJZFQhR3V+L5QezBc/kA1uhPynJQ7kigtB1
   w==;
X-CSE-ConnectionGUID: dDzI5zyMSrW3UlV3Zh8XrQ==
X-CSE-MsgGUID: AjWZhddpSC+WE+7+0QxivQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22849559"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="22849559"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 22:48:00 -0700
X-CSE-ConnectionGUID: Gn1S2nSERnaqg414kRzw+A==
X-CSE-MsgGUID: zj5uUEL5S66bs4WxnUHtYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="51397197"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jul 2024 22:47:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV2wm-000itD-17;
	Sat, 20 Jul 2024 05:47:56 +0000
Date: Sat, 20 Jul 2024 13:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 37/38] mm/memory.c:440:39: error: passing
 argument 1 of 'lowmem_page_address' from incompatible pointer type
Message-ID: <202407201310.Xpxxxi1a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   b17c1bbf65811ff797f57b7ddc4fdf4b86d86030
commit: 6b1d115d7b654549585d26008d60cb71b1cbefc8 [37/38] pass ptdesc to pmd_install
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407201310.Xpxxxi1a-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407201310.Xpxxxi1a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407201310.Xpxxxi1a-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:88:
   mm/memory.c: In function 'free_pte_range':
   mm/memory.c:194:27: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     194 |         pte_free_tlb(tlb, token, addr);
         |                           ^~~~~
         |                           |
         |                           pgtable_t {aka struct page *}
   arch/parisc/include/asm/tlb.h:10:61: note: in definition of macro '__pte_free_tlb'
      10 | #define __pte_free_tlb(tlb, pte, addr)  pte_free((tlb)->mm, pte)
         |                                                             ^~~
   mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
     194 |         pte_free_tlb(tlb, token, addr);
         |         ^~~~~~~~~~~~
   In file included from arch/parisc/include/asm/pgalloc.h:16,
                    from mm/memory.c:86:
   include/asm-generic/pgalloc.h:108:66: note: expected 'struct ptdesc *' but argument is of type 'pgtable_t' {aka 'struct page *'}
     108 | static inline void pte_free(struct mm_struct *mm, struct ptdesc *ptdesc)
         |                                                   ~~~~~~~~~~~~~~~^~~~~~
   In file included from mm/memory.c:44:
   mm/memory.c: In function 'pmd_install':
>> mm/memory.c:440:39: error: passing argument 1 of 'lowmem_page_address' from incompatible pointer type [-Wincompatible-pointer-types]
     440 |                 pmd_populate(mm, pmd, *pte);
         |                                       ^~~~
         |                                       |
         |                                       struct ptdesc *
   include/linux/mm.h:2251:48: note: in definition of macro 'page_address'
    2251 | #define page_address(page) lowmem_page_address(page)
         |                                                ^~~~
   mm/memory.c:440:17: note: in expansion of macro 'pmd_populate'
     440 |                 pmd_populate(mm, pmd, *pte);
         |                 ^~~~~~~~~~~~
   include/linux/mm.h:2245:69: note: expected 'const struct page *' but argument is of type 'struct ptdesc *'
    2245 | static __always_inline void *lowmem_page_address(const struct page *page)
         |                                                  ~~~~~~~~~~~~~~~~~~~^~~~


vim +/lowmem_page_address +440 mm/memory.c

   419	
   420	void pmd_install(struct mm_struct *mm, pmd_t *pmd, struct ptdesc **pte)
   421	{
   422		spinlock_t *ptl = pmd_lock(mm, pmd);
   423	
   424		if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
   425			mm_inc_nr_ptes(mm);
   426			/*
   427			 * Ensure all pte setup (eg. pte page lock and page clearing) are
   428			 * visible before the pte is made visible to other CPUs by being
   429			 * put into page tables.
   430			 *
   431			 * The other side of the story is the pointer chasing in the page
   432			 * table walking code (when walking the page table without locking;
   433			 * ie. most of the time). Fortunately, these data accesses consist
   434			 * of a chain of data-dependent loads, meaning most CPUs (alpha
   435			 * being the notable exception) will already guarantee loads are
   436			 * seen in-order. See the alpha page table accessors for the
   437			 * smp_rmb() barriers in page table walking code.
   438			 */
   439			smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
 > 440			pmd_populate(mm, pmd, *pte);
   441			*pte = NULL;
   442		}
   443		spin_unlock(ptl);
   444	}
   445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
