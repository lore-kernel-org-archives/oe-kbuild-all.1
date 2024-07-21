Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D8633EC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 03:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721533386; cv=none; b=o7KH3lwLEdQJcvyUlH4m5+9Pui3neHYENErfS/xZY8IgeIwzuRTR/Q2/XOPPBXdKZRAZqFfhIDobQKtJhsZulvCJ+36kM45WC0+XiZ99P89b0ZS3EpmnqH1wh8MvSEkfOGUWWLJ8/2aplVAxd0HSUtf2W1j9kYm6NcdWbas9WNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721533386; c=relaxed/simple;
	bh=TNmTrOqztYlqQ8kuoeEtZ8O969BmB+pOkFQQQa7Yyio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a4MuEp5YbbouhdxnKGZnugkE9qeBnvaNHdGkCr294g+qnyOWMJQ6D8zODElquaSoehhde6FT88wgI58APLnxbS2I0ijY7Xvg7XuWZ07Am37EfKNS8IpK0QJaTZN3Mk1IVZDa2Xqz9RzkFKB4Ge/MlRPIhMz8Sqm8O/SFWZfPzaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PU3sgLmY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PU3sgLmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721533385; x=1753069385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TNmTrOqztYlqQ8kuoeEtZ8O969BmB+pOkFQQQa7Yyio=;
  b=PU3sgLmYXK3RuVSmVnZ0/zAYqgbVgdhQIW3d5P4StDVMZ9JIpINtfZFJ
   OhpPANy/x2y1vRluKgYjzEoemxHgTHXADLcnavRgN9a/SBFE7upkVu6dl
   yjwHIBTLpk1RBJffpU+OlZGCGZ6MN5f3cJbvHYpaiv1Rv48NaascClRZi
   3m81xtGtm9B8I0pxIERyivlVijtkEFuBO5EKVf5gOWAB6YIIzwdz0lizf
   BRnvqbPVCxuuXn+l8UjfG+X9FSUuzVIrx9uaQx3KRk96ERSUF4LJpshFY
   NzJKlAD9751XxSXW/jyD9QtbkaFN+qmP1OpKdKNIPddwM18ntDuh2kf0c
   Q==;
X-CSE-ConnectionGUID: wmSQJEFPS1m2kV3+gLPD2A==
X-CSE-MsgGUID: jC3jrTxTQAS5aJTVrIX1Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19081822"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="19081822"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 20:43:04 -0700
X-CSE-ConnectionGUID: J0dmdf9iSEqsW0Zlj7VmQw==
X-CSE-MsgGUID: O7Rd/JSMS5WUJPVFgRGK3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="56366279"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jul 2024 20:43:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVNTR-000ju6-0t;
	Sun, 21 Jul 2024 03:43:01 +0000
Date: Sun, 21 Jul 2024 11:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 38/43] mm/memory.c:440:39: error: passing
 argument 2 of 'pmd_set' from incompatible pointer type
Message-ID: <202407211128.J9jJq2lg-lkp@intel.com>
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
commit: 5baeabf28d6409ed54635d50b27c377aa4a670a9 [38/43] mm/pgtable: pass ptdesc to pmd_install
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20240721/202407211128.J9jJq2lg-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211128.J9jJq2lg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211128.J9jJq2lg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/pgalloc.h:7,
                    from mm/memory.c:86:
   mm/memory.c: In function 'pmd_install':
>> mm/memory.c:440:39: error: passing argument 2 of 'pmd_set' from incompatible pointer type [-Wincompatible-pointer-types]
     440 |                 pmd_populate(mm, pmd, *pte);
         |                                       ^~~~
         |                                       |
         |                                       struct ptdesc *
   arch/sparc/include/asm/pgalloc_32.h:53:54: note: in definition of macro 'pmd_populate'
      53 | #define pmd_populate(mm, pmd, pte)      pmd_set(pmd, pte)
         |                                                      ^~~
   arch/sparc/include/asm/pgalloc_32.h:55:34: note: expected 'pte_t *' {aka 'long unsigned int *'} but argument is of type 'struct ptdesc *'
      55 | void pmd_set(pmd_t *pmdp, pte_t *ptep);
         |                           ~~~~~~~^~~~
   mm/memory.c: In function '__pte_alloc':
   mm/memory.c:448:33: error: initialization of 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'long unsigned int *'} [-Wincompatible-pointer-types]
     448 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                                 ^~~~~~~~~~~~~
   mm/memory.c:454:30: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     454 |                 pte_free(mm, ptdesc);
         |                              ^~~~~~
         |                              |
         |                              struct ptdesc *
   arch/sparc/include/asm/pgalloc_32.h:74:48: note: expected 'pgtable_t' {aka 'long unsigned int *'} but argument is of type 'struct ptdesc *'
      74 | void pte_free(struct mm_struct * mm, pgtable_t pte);
         |                                      ~~~~~~~~~~^~~
   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sparc/include/asm/hardirq_32.h:11,
                    from arch/sparc/include/asm/hardirq.h:7,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   mm/memory.c: In function '__do_fault':
   include/linux/mm_types.h:502:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:4650:37: note: in expansion of macro 'ptdesc_page'
    4650 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                     ^~~~~~~~~~~
   mm/memory.c: In function 'do_fault_around':
   include/linux/mm_types.h:502:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:5013:37: note: in expansion of macro 'ptdesc_page'
    5013 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
         |                                     ^~~~~~~~~~~
   mm/memory.c: In function 'do_fault':
   include/linux/mm_types.h:510:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/memory.c:5199:33: note: in expansion of macro 'page_ptdesc'
    5199 |                 pte_free(vm_mm, page_ptdesc(vmf->prealloc_pte));
         |                                 ^~~~~~~~~~~


vim +/pmd_set +440 mm/memory.c

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
