Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BEC1EE7C6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 04:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776398810; cv=none; b=PAyEG1kfOof5l/xFz34ud1GQM29UyQusukiuzjqTpUHBPxd7q4AV0lJH/a4Af7h9qIA7C3Q6+m5jQTloxgtU13C4Xp5b1/bGyY+B6ibGs2R1oi7O0wwZp8HjdiVwGyzjH0qhfKyM+YjAk4JILdql0AIaSq0YyVY8dNv0ycbFZqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776398810; c=relaxed/simple;
	bh=jDUFSSa0vOKRVlnkWDQyP7Rd8t+CT8J/qFWHLpgtlHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hiOUve/0ecCarwubCq9HOvRanmwJUBn6kzdX4sWH/gjWbPbmTsCLw6BH8jTx2AYgGpDg16fq01DTWiCPaejvBb0zVNL8fpbWVuWQQjQ4ADkB5xXMa/ZZU1ZAn/AL4dNCKa3xFKL74k/6kx+iUK7bjMqxiM45y5zmBZc3d5hDz9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hj8p6kcK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hj8p6kcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776398808; x=1807934808;
  h=date:from:to:cc:subject:message-id;
  bh=jDUFSSa0vOKRVlnkWDQyP7Rd8t+CT8J/qFWHLpgtlHQ=;
  b=hj8p6kcK2uU5pBbrv4tiWp6VssmU0tH/b4cV+ByvUqPyGzIMj/zzDhsh
   GciSqm3BbWUfOi0U8UvtAM+qJk1/4dlPMy7407vnrhAddkFW2pxA8LcKB
   dDaS1pWbdPL70pWtYPjYHvK5VLNs1oYXic0Wo+YFO6G0Pf5NF1Xf+C/v9
   coxTF8k5DVxyQHNUI0XVvuosOfvCvRebh42F2OGRbrZe999uO9zNgtu3i
   rCj9eMC7CyFtxoXREi2yMjjOBk7A3TvNWrnnnWYSGX5GsKS2Y2czTGFSg
   R8PQvN125hWVvFDjTI+5A0Ls10R31q3/sXSx3P+t/f8UfKx/EIMAhDIWz
   g==;
X-CSE-ConnectionGUID: lWPrvMiRRC2iD4z16qngqg==
X-CSE-MsgGUID: PBJkT9+9R/Gk4Zc1XJGJiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94979605"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="94979605"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 21:06:48 -0700
X-CSE-ConnectionGUID: 1dPs4LJqT/msVcgC6F4nnA==
X-CSE-MsgGUID: uz43oa+ITHiREjOfaF/NsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="229919160"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Apr 2026 21:06:46 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDaTb-000000001Bp-3HTt;
	Fri, 17 Apr 2026 04:06:43 +0000
Date: Fri, 17 Apr 2026 06:06:11 +0200
From: kernel test robot <lkp@intel.com>
To: Atish Patra <Atish.Patra@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [atishp04:b4/unaccepted-mem-upstream_rfc 3/7]
 mm/unaccepted_memory.c:172:21: error: redeclaration of 'end' with no linkage
Message-ID: <202604170642.xcKhOfDx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Atish,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/atishp04/linux b4/unaccepted-mem-upstream_rfc
head:   e918a1c68de6191b0ca11b53fdfaa5cbe567d386
commit: 71f16d14236dda987b318c9fa30d037f795db93a [3/7] x86/unaccepted: rename struct efi_unaccepted_memory to unaccepted_memory
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260417/202604170642.xcKhOfDx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170642.xcKhOfDx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604170642.xcKhOfDx-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/unaccepted_memory.c: In function 'range_contains_unaccepted_memory':
>> mm/unaccepted_memory.c:172:21: error: redeclaration of 'end' with no linkage
     172 |         phys_addr_t end;
         |                     ^~~
   mm/unaccepted_memory.c:169:21: note: previous definition of 'end' with type 'phys_addr_t' {aka 'long long unsigned int'}
     169 |         phys_addr_t end = start + size;
         |                     ^~~


vim +/end +172 mm/unaccepted_memory.c

2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  165  
5adfeaecc487e7 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2024-08-09  166  bool range_contains_unaccepted_memory(phys_addr_t start, unsigned long size)
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  167  {
71f16d14236dda mm/unaccepted_memory.c                   Atish Patra            2026-04-10  168  	struct unaccepted_memory *unaccepted;
71f16d14236dda mm/unaccepted_memory.c                   Atish Patra            2026-04-10  169  	phys_addr_t end = start + size;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  170  	unsigned long flags;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  171  	bool ret = false;
948a013a54c47d drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau (Meta  2026-02-17 @172) 	phys_addr_t end;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  173  	u64 unit_size;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  174  
43455dead02cc1 mm/unaccepted_memory.c                   Atish Patra            2026-04-10  175  	unaccepted = get_unaccepted_table();
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  176  	if (!unaccepted)
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  177  		return false;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  178  
948a013a54c47d drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau (Meta  2026-02-17  179) 	end = PAGE_ALIGN(start + size);
948a013a54c47d drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau (Meta  2026-02-17  180) 	start = PAGE_ALIGN_DOWN(start);
948a013a54c47d drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau (Meta  2026-02-17  181) 
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  182  	unit_size = unaccepted->unit_size;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  183  
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  184  	/*
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  185  	 * Only care for the part of the range that is represented
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  186  	 * in the bitmap.
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  187  	 */
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  188  	if (start < unaccepted->phys_base)
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  189  		start = unaccepted->phys_base;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  190  	if (end < unaccepted->phys_base)
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  191  		return false;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  192  
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  193  	/* Translate to offsets from the beginning of the bitmap */
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  194  	start -= unaccepted->phys_base;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  195  	end -= unaccepted->phys_base;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  196  
c211c19e80d046 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  197  	/*
c211c19e80d046 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  198  	 * Also consider the unaccepted state of the *next* page. See fix #1 in
c211c19e80d046 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  199  	 * the comment on load_unaligned_zeropad() in accept_memory().
c211c19e80d046 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  200  	 */
c211c19e80d046 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  201  	if (!(end % unit_size))
c211c19e80d046 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  202  		end += unit_size;
c211c19e80d046 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  203  
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  204  	/* Make sure not to overrun the bitmap */
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  205  	if (end > unaccepted->size * unit_size * BITS_PER_BYTE)
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  206  		end = unaccepted->size * unit_size * BITS_PER_BYTE;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  207  
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  208  	spin_lock_irqsave(&unaccepted_memory_lock, flags);
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  209  	while (start < end) {
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  210  		if (test_bit(start / unit_size, unaccepted->bitmap)) {
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  211  			ret = true;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  212  			break;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  213  		}
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  214  
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  215  		start += unit_size;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  216  	}
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  217  	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  218  
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  219  	return ret;
2053bc57f36763 drivers/firmware/efi/unaccepted_memory.c Kiryl Shutsemau        2023-06-06  220  }
7cd34dd3c9bf1d drivers/firmware/efi/unaccepted_memory.c Adrian Hunter          2023-09-11  221  

:::::: The code at line 172 was first introduced by commit
:::::: 948a013a54c47d5eba06e644b99d4927a8bc62f8 efi: Align unaccepted memory range to page boundary

:::::: TO: Kiryl Shutsemau (Meta) <kas@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
