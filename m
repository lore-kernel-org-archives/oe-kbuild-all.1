Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBB23D525B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624222; cv=none; b=OM4JNlxIKkz8eJBo/Um9brtJG3mu3WeNGTpXPW62jXtk3XAL0tsctdgzNlJ8CZgIBL+FAOBNyf9wzO4skcNEn/A5JMlHHrx5b+/E+sxBIFh38r+Jwr1YDKGqxCJmw5T17jHeICWJKqIeByYgGZqfdBeb6JbEc3IRmJtzkairMdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624222; c=relaxed/simple;
	bh=t/baaD4XvGLQmCBmb1l0VxlRTbA7roxKpkb5Hnarjy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HQcRiwm8fVtv/8ERAladajHls1j3r6/qzKQMM3aeUcUbem6kb/lPNSSJkmqh3pvy/HkMgFwQCWT5QO0EwpIUdzmHvPNEVhkoYmdxMmTGI6+bDCv7m4/sc9Eg++TMQAfdbZP1taEK/R/A3mpP4WrrUjPTu4sIDMqOk/QYpgqweis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiorpmK7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiorpmK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791624220; x=1823160220;
  h=date:from:to:cc:subject:message-id;
  bh=t/baaD4XvGLQmCBmb1l0VxlRTbA7roxKpkb5Hnarjy4=;
  b=LiorpmK7f6qvaj2ATnaVsXFW0r8pSA0rLXzM72RHP0OgFHSHg1I0SwjV
   1aOpMeGxwVy7zg3gvaCQSZDYsU/6lilaggDnm/prhMxvaSPBxUXEwEzdc
   kc4yqsncqKSdr9VQeKgH9Ot8hx3hv9DKA40PTZlZOgd8PDKAZ22xOoJMd
   8pzo8XrbgWTDYoKVnQnXnhHHuM2O7Htr3rW9R0x416PJisb+0N/Tj2Isy
   39WJ+pLWtShxo6fIUkR9sEGnLzJ5bSuK+tcsmzajCm+OSQ+Zqm5nInJzk
   RB8/PzQMzrdUlwxRxa9jTbIUaBs/rKOKorbR8sH64luw8NjBar9+HVVAp
   A==;
X-CSE-ConnectionGUID: flzakDLKQEy4EdwVLKjdXQ==
X-CSE-MsgGUID: 97VXA4g5SGKor5eiobjCwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="300187"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="300187"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 02:23:40 -0700
X-CSE-ConnectionGUID: Z5r3vy21QUKEVXSq6QV9dA==
X-CSE-MsgGUID: qdemXaUDQUm7ybYAIsFSEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="2241415"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 10 Oct 2026 02:23:38 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFTIm-000000008dV-04db;
	Sat, 10 Oct 2026 09:23:36 +0000
Date: Sat, 10 Oct 2026 11:22:38 +0200
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:feat-secret-memfd-rfc-v1-0day 2/4]
 mm/secretmem.c:142:23: error: too few arguments to function
 'set_direct_map_invalid_noflush'
Message-ID: <202610101141.WQ2vkOKS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/riteshharjani/linux feat-secret-memfd-rfc-v1-0day
head:   80c52d3311e732619c0c339b4a03e92859ba98a1
commit: 744ed18f924d7aeb1a92993e90971120f0b7d4d4 [2/4] powerpc/64s/radix: Implement ARCH_HAS_SET_DIRECT_MAP
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261010/202610101141.WQ2vkOKS-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610101141.WQ2vkOKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101141.WQ2vkOKS-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmalloc.c: In function 'vm_reset_perms':
>> mm/vmalloc.c:3403:35: error: passing argument 2 of 'set_area_direct_map' from incompatible pointer type [-Wincompatible-pointer-types]
    3403 |         set_area_direct_map(area, set_direct_map_invalid_noflush);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   int (*)(struct page *, unsigned int)
   mm/vmalloc.c:3361:46: note: expected 'int (*)(struct page *)' but argument is of type 'int (*)(struct page *, unsigned int)'
    3361 |                                        int (*set_direct_map)(struct page *page))
         |                                        ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:3405:35: error: passing argument 2 of 'set_area_direct_map' from incompatible pointer type [-Wincompatible-pointer-types]
    3405 |         set_area_direct_map(area, set_direct_map_default_noflush);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   int (*)(struct page *, unsigned int)
   mm/vmalloc.c:3361:46: note: expected 'int (*)(struct page *)' but argument is of type 'int (*)(struct page *, unsigned int)'
    3361 |                                        int (*set_direct_map)(struct page *page))
         |                                        ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   mm/secretmem.c: In function 'secretmem_fault':
>> mm/secretmem.c:142:23: error: too few arguments to function 'set_direct_map_invalid_noflush'
     142 |                 err = set_direct_map_invalid_noflush(folio_page(folio, 0));
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from ./include/linux/set_memory.h:9,
                    from mm/secretmem.c:19:
   ./arch/powerpc/include/asm/set_memory.h:55:5: note: declared here
      55 | int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/secretmem.c:159:25: error: too few arguments to function 'set_direct_map_default_noflush'
     159 |                         set_direct_map_default_noflush(folio_page(folio, 0));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./arch/powerpc/include/asm/set_memory.h:56:5: note: declared here
      56 | int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/secretmem.c: In function 'secretmem_free_folio':
   mm/secretmem.c:231:9: error: too few arguments to function 'set_direct_map_default_noflush'
     231 |         set_direct_map_default_noflush(folio_page(folio, 0));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./arch/powerpc/include/asm/set_memory.h:56:5: note: declared here
      56 | int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/set_direct_map_invalid_noflush +142 mm/secretmem.c

97d34aa65c29cc Lorenzo Stoakes (ARM    2026-08-26  109) 
1507f51255c9ff Mike Rapoport           2021-07-07  110  static vm_fault_t secretmem_fault(struct vm_fault *vmf)
1507f51255c9ff Mike Rapoport           2021-07-07  111  {
1507f51255c9ff Mike Rapoport           2021-07-07  112  	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
1507f51255c9ff Mike Rapoport           2021-07-07  113  	struct inode *inode = file_inode(vmf->vma->vm_file);
97d34aa65c29cc Lorenzo Stoakes (ARM    2026-08-26  114) 	struct secretmem_inode_state *state = inode->i_private;
1507f51255c9ff Mike Rapoport           2021-07-07  115  	pgoff_t offset = vmf->pgoff;
1507f51255c9ff Mike Rapoport           2021-07-07  116  	gfp_t gfp = vmf->gfp_mask;
1507f51255c9ff Mike Rapoport           2021-07-07  117  	unsigned long addr;
7e2fca52ef918e ZhangPeng               2023-08-12  118  	struct folio *folio;
84ac013046ccc4 Mike Rapoport           2022-07-07  119  	vm_fault_t ret;
1507f51255c9ff Mike Rapoport           2021-07-07  120  	int err;
1507f51255c9ff Mike Rapoport           2021-07-07  121  
1507f51255c9ff Mike Rapoport           2021-07-07  122  	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
1507f51255c9ff Mike Rapoport           2021-07-07  123  		return vmf_error(-EINVAL);
1507f51255c9ff Mike Rapoport           2021-07-07  124  
84ac013046ccc4 Mike Rapoport           2022-07-07  125  	filemap_invalidate_lock_shared(mapping);
84ac013046ccc4 Mike Rapoport           2022-07-07  126  
1507f51255c9ff Mike Rapoport           2021-07-07  127  retry:
32925ee63beb7e Matthew Wilcox (Oracle  2025-06-13  128) 	folio = filemap_lock_folio(mapping, offset);
32925ee63beb7e Matthew Wilcox (Oracle  2025-06-13  129) 	if (IS_ERR(folio)) {
7e2fca52ef918e ZhangPeng               2023-08-12  130  		folio = folio_alloc(gfp | __GFP_ZERO, 0);
7e2fca52ef918e ZhangPeng               2023-08-12  131  		if (!folio) {
84ac013046ccc4 Mike Rapoport           2022-07-07  132  			ret = VM_FAULT_OOM;
84ac013046ccc4 Mike Rapoport           2022-07-07  133  			goto out;
84ac013046ccc4 Mike Rapoport           2022-07-07  134  		}
1507f51255c9ff Mike Rapoport           2021-07-07  135  
97d34aa65c29cc Lorenzo Stoakes (ARM    2026-08-26  136) 		if (!secretmem_account_folio(state, folio)) {
97d34aa65c29cc Lorenzo Stoakes (ARM    2026-08-26  137) 			folio_put(folio);
97d34aa65c29cc Lorenzo Stoakes (ARM    2026-08-26  138) 			ret = VM_FAULT_SIGBUS;
97d34aa65c29cc Lorenzo Stoakes (ARM    2026-08-26  139) 			goto out;
97d34aa65c29cc Lorenzo Stoakes (ARM    2026-08-26  140) 		}
97d34aa65c29cc Lorenzo Stoakes (ARM    2026-08-26  141) 
32925ee63beb7e Matthew Wilcox (Oracle  2025-06-13 @142) 		err = set_direct_map_invalid_noflush(folio_page(folio, 0));
1507f51255c9ff Mike Rapoport           2021-07-07  143  		if (err) {
97d34aa65c29cc Lorenzo Stoakes (ARM    2026-08-26  144) 			secretmem_unaccount_folio(state, folio);
7e2fca52ef918e ZhangPeng               2023-08-12  145  			folio_put(folio);
84ac013046ccc4 Mike Rapoport           2022-07-07  146  			ret = vmf_error(err);
84ac013046ccc4 Mike Rapoport           2022-07-07  147  			goto out;
1507f51255c9ff Mike Rapoport           2021-07-07  148  		}
1507f51255c9ff Mike Rapoport           2021-07-07  149  
7e2fca52ef918e ZhangPeng               2023-08-12  150  		__folio_mark_uptodate(folio);
7e2fca52ef918e ZhangPeng               2023-08-12  151  		err = filemap_add_folio(mapping, folio, offset, gfp);
1507f51255c9ff Mike Rapoport           2021-07-07  152  		if (unlikely(err)) {
97d34aa65c29cc Lorenzo Stoakes (ARM    2026-08-26  153) 			secretmem_unaccount_folio(state, folio);
1507f51255c9ff Mike Rapoport           2021-07-07  154  			/*
1507f51255c9ff Mike Rapoport           2021-07-07  155  			 * If a split of large page was required, it
1507f51255c9ff Mike Rapoport           2021-07-07  156  			 * already happened when we marked the page invalid
1507f51255c9ff Mike Rapoport           2021-07-07  157  			 * which guarantees that this call won't fail
1507f51255c9ff Mike Rapoport           2021-07-07  158  			 */
32925ee63beb7e Matthew Wilcox (Oracle  2025-06-13 @159) 			set_direct_map_default_noflush(folio_page(folio, 0));
6f86d0534fddfb Lance Yang              2025-10-31  160  			folio_put(folio);
1507f51255c9ff Mike Rapoport           2021-07-07  161  			if (err == -EEXIST)
1507f51255c9ff Mike Rapoport           2021-07-07  162  				goto retry;
1507f51255c9ff Mike Rapoport           2021-07-07  163  
84ac013046ccc4 Mike Rapoport           2022-07-07  164  			ret = vmf_error(err);
84ac013046ccc4 Mike Rapoport           2022-07-07  165  			goto out;
1507f51255c9ff Mike Rapoport           2021-07-07  166  		}
1507f51255c9ff Mike Rapoport           2021-07-07  167  
32925ee63beb7e Matthew Wilcox (Oracle  2025-06-13  168) 		addr = (unsigned long)folio_address(folio);
1507f51255c9ff Mike Rapoport           2021-07-07  169  		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
1507f51255c9ff Mike Rapoport           2021-07-07  170  	}
1507f51255c9ff Mike Rapoport           2021-07-07  171  
32925ee63beb7e Matthew Wilcox (Oracle  2025-06-13  172) 	vmf->page = folio_file_page(folio, vmf->pgoff);
84ac013046ccc4 Mike Rapoport           2022-07-07  173  	ret = VM_FAULT_LOCKED;
84ac013046ccc4 Mike Rapoport           2022-07-07  174  
84ac013046ccc4 Mike Rapoport           2022-07-07  175  out:
84ac013046ccc4 Mike Rapoport           2022-07-07  176  	filemap_invalidate_unlock_shared(mapping);
84ac013046ccc4 Mike Rapoport           2022-07-07  177  	return ret;
1507f51255c9ff Mike Rapoport           2021-07-07  178  }
1507f51255c9ff Mike Rapoport           2021-07-07  179  

:::::: The code at line 142 was first introduced by commit
:::::: 32925ee63beb7e1a3fad25e2f54cefa2d32612de secretmem: remove uses of struct page

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
