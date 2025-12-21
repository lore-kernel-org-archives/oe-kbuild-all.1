Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFAF2494F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 23:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766358626; cv=none; b=emQPMK+Y0oiiFvLpIboW3Kfiks9SXTAsZvO3tbDj2sbu8/6b1JK2x4UU17HVxjswe+Z+j9RgKWQYItY3t/PnYaiBNzI5DK+gned2Mqx2NXcgO8OAsc3XcG4l1Y50OCtqHcWbjvXI8YrziluDq2XoWu/+eRvFu9+nJXgEkmzwsLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766358626; c=relaxed/simple;
	bh=ys/MnkQR1m2tdnS8W6ijXJtUBR+WSgN0mUMaRSVnUps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i/F7jowBtTVmRQPiPOZLJIBglllsCBEgBIl2Xy6lNLLVYqWLggM09vQ4Bqu6Doeko+ynPEUFhtu3hRU1ZE0HOl+5iqUnKB8PxQhJT3bSixFcdJfIo8vDA0ypc2vEGdwy9LYXas6+U4WuQKyUARgUA6VWqw8d8s8vJVa0rZE3EcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHJksWsg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHJksWsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766358625; x=1797894625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ys/MnkQR1m2tdnS8W6ijXJtUBR+WSgN0mUMaRSVnUps=;
  b=XHJksWsgAMdRdfAYpDh9yjTGt/mIOmenZk/P5YoLCxve8IjLIrDNmWlP
   B48tcIs+6gdfXoF7At1xC/FtNjXQiyXVCcerLe0VtWzBZlDjna3iGyfSN
   KcAa/+kRuMawu5ajnj63LQTWq9VuJ4sT7seaZPQdjCqKel21/Hkfpqnsv
   LchgdELU8y+WEQ+nZE7rn3PxblrSU/8xATW2PpROC3QYj/oLaNo8CtFdS
   aMyyZKwBT7PGg1yzK0LEUEveIddXXZ1lFudQ6DXlr5trlYGcj0PXzNdmE
   evSC7yXM692zgx+SR4ThpLF5vzd6I4X36Z8Tua8BLZAi3yZ8wyoScplTT
   g==;
X-CSE-ConnectionGUID: 70JRgcHYREGVRZD6nQ09Xw==
X-CSE-MsgGUID: xc1wZCOsRV2tEeMqN3HfYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67418572"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="67418572"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:10:22 -0800
X-CSE-ConnectionGUID: Y+4gCmHhT7+8NTmHZvmdtA==
X-CSE-MsgGUID: XFi8/cNSRuCKgje8VWOOig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199679065"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 15:10:21 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXSZ9-000000000HG-1fDe;
	Sun, 21 Dec 2025 23:10:19 +0000
Date: Mon, 22 Dec 2025 07:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc1217 1/1] mm/memory.c:194:2: error: controlling
 expression type 'pgtable_t' (aka 'struct ptdesc *') not compatible with any
 generic association type
Message-ID: <202512220733.RRsXtOyi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc1217
head:   5a13c35972782c993b40bf3d92ada4db87f4ee5e
commit: 5a13c35972782c993b40bf3d92ada4db87f4ee5e [1/1] mm/pgtable: convert pgtable_t to ptdesc pointer
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20251222/202512220733.RRsXtOyi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 42b3483ac4987cae1bdb632398e8a3ce2dea6633)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220733.RRsXtOyi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220733.RRsXtOyi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:194:2: error: controlling expression type 'pgtable_t' (aka 'struct ptdesc *') not compatible with any generic association type
     194 |         pte_free_tlb(tlb, token, addr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/tlb.h:731:3: note: expanded from macro 'pte_free_tlb'
     731 |                 __pte_free_tlb(tlb, ptep, address);             \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/um/include/asm/pgalloc.h:29:27: note: expanded from macro '__pte_free_tlb'
      29 |         tlb_remove_ptdesc((tlb), page_ptdesc(pte))
         |                                  ^~~~~~~~~~~~~~~~
   include/linux/mm_types.h:633:36: note: expanded from macro 'page_ptdesc'
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^~~
   1 error generated.


vim +194 mm/memory.c

d559db086ff5be9 KAMEZAWA Hiroyuki      2010-03-05  184  
^1da177e4c3f415 Linus Torvalds         2005-04-16  185  /*
^1da177e4c3f415 Linus Torvalds         2005-04-16  186   * Note: this doesn't free the actual pages themselves. That
^1da177e4c3f415 Linus Torvalds         2005-04-16  187   * has been handled earlier when unmapping all the memory regions.
^1da177e4c3f415 Linus Torvalds         2005-04-16  188   */
9e1b32caa525cb2 Benjamin Herrenschmidt 2009-07-22  189  static void free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
9e1b32caa525cb2 Benjamin Herrenschmidt 2009-07-22  190  			   unsigned long addr)
^1da177e4c3f415 Linus Torvalds         2005-04-16  191  {
2f569afd9ced9eb Martin Schwidefsky     2008-02-08  192  	pgtable_t token = pmd_pgtable(*pmd);
^1da177e4c3f415 Linus Torvalds         2005-04-16  193  	pmd_clear(pmd);
9e1b32caa525cb2 Benjamin Herrenschmidt 2009-07-22 @194  	pte_free_tlb(tlb, token, addr);
c4812909f5d5a9b Kiryl Shutsemau        2017-11-15  195  	mm_dec_nr_ptes(tlb->mm);
^1da177e4c3f415 Linus Torvalds         2005-04-16  196  }
^1da177e4c3f415 Linus Torvalds         2005-04-16  197  

:::::: The code at line 194 was first introduced by commit
:::::: 9e1b32caa525cb236e80e9c671e179bcecccc657 mm: Pass virtual address to [__]p{te,ud,md}_free_tlb()

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
