Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F7E221721
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 19:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490325; cv=none; b=eGcOhQnFtrYw1h6O50WJ3vxtSmTH/5Ak85xpIpc1ZDen/mvD0FYySrdRUCrG7iSSN7quavuU5cNeUQOFP7PJhK29gdmKUfbli/MMTbkT+B1n14tlJfYN/zUE3hRb0fT43QUuVe/28zrtcX6sqPiu0HfONx90Y/FGOMaU0Agl7qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490325; c=relaxed/simple;
	bh=tASvReIqW1KCS2Bpliai1U+u+AjkaHcAk3qu8zrZgCU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a3qvf5/tLJCmRvHh0Ded+1WufNqsf5XAElwRTMxu62QD3bwgYYanGGzFSCOHN0J8Ll/uZesQLkbH1k5USYB8b+dqzFoey0g6E8RxGVjOtxh5720r6ulVyhAJWgHYMeFLbxTDQXZoW0jTOqK1kqIKprPRbBNMrQ6GbEDtH4AZogU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YW6cicU7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YW6cicU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777490324; x=1809026324;
  h=date:from:to:cc:subject:message-id;
  bh=tASvReIqW1KCS2Bpliai1U+u+AjkaHcAk3qu8zrZgCU=;
  b=YW6cicU7I4eJnVIdl8/oWWNpzWt/8RV/VyCaLj8lKLo7N9jU2uLhB57v
   ruUsA0ZXpaFLgE/fYAxbuceV2sQbb8cA6mxdTBslQ7rn0HyKx4F2DrFCS
   GZUZBBBfoCQtTqCwMg9ytz/VstSqnn+DrxFSDGm8dRxceImuEaE/5hOip
   5LHoJnP4qBicj3cpsxwtqnXmY+wO0lAmuxhyduIFT8enuOcEpuIl5gAd5
   gknQNeEr5ih/xovWH2v8RTC3ovFKy2disF1M/sk4647tHXfD2VLZCByZF
   dhwuZ/TB2Sc96ofrsqbHchAn9ZGf5dh8fVKTR+1M0xT1Gkvz+QRER5fz+
   A==;
X-CSE-ConnectionGUID: OalOlUNIRSqENy8hEWgymw==
X-CSE-MsgGUID: cNyLqzVtTCyRMEQpvTXZ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65960852"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="65960852"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:18:43 -0700
X-CSE-ConnectionGUID: ZgxkGyAjROGuUrn9qsyUtQ==
X-CSE-MsgGUID: 4hWZ4j6hSMeA52017DurUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="264744517"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Apr 2026 12:18:42 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIAQg-00000000BRs-3FDa;
	Wed, 29 Apr 2026 19:18:38 +0000
Date: Thu, 30 Apr 2026 03:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260407 13/19]
 mm/mmu_gather.c:90:25: warning: comparison of distinct pointer types lacks a
 cast
Message-ID: <202604300341.itquwlXM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260407
head:   9505f43094e1efb72854c166160fb7666517f07a
commit: c9b77f29ae08cb9afc5965f0d31fc8e5d3d44497 [13/19] mm/mmu_gather: avoid dozens of -Wflex-array-member-not-at-end warnings
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260430/202604300341.itquwlXM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300341.itquwlXM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300341.itquwlXM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mmu_gather.c: In function 'tlb_flush_rmaps':
>> mm/mmu_gather.c:90:25: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
      90 |         if (tlb->active != &tlb->local)
         |                         ^~


vim +90 mm/mmu_gather.c

c47454823bd4e3 Linus Torvalds          2022-12-06  73  
5df397dec7c4c0 Linus Torvalds          2022-11-09  74  /**
5df397dec7c4c0 Linus Torvalds          2022-11-09  75   * tlb_flush_rmaps - do pending rmap removals after we have flushed the TLB
5df397dec7c4c0 Linus Torvalds          2022-11-09  76   * @tlb: the current mmu_gather
19134bc23500a0 Matthew Wilcox (Oracle  2023-08-18  77)  * @vma: The memory area from which the pages are being removed.
5df397dec7c4c0 Linus Torvalds          2022-11-09  78   *
5df397dec7c4c0 Linus Torvalds          2022-11-09  79   * Note that because of how tlb_next_batch() above works, we will
c47454823bd4e3 Linus Torvalds          2022-12-06  80   * never start multiple new batches with pending delayed rmaps, so
c47454823bd4e3 Linus Torvalds          2022-12-06  81   * we only need to walk through the current active batch and the
c47454823bd4e3 Linus Torvalds          2022-12-06  82   * original local one.
5df397dec7c4c0 Linus Torvalds          2022-11-09  83   */
5df397dec7c4c0 Linus Torvalds          2022-11-09  84  void tlb_flush_rmaps(struct mmu_gather *tlb, struct vm_area_struct *vma)
5df397dec7c4c0 Linus Torvalds          2022-11-09  85  {
f036c8184f8b67 Alexander Gordeev       2022-11-16  86  	if (!tlb->delayed_rmap)
f036c8184f8b67 Alexander Gordeev       2022-11-16  87  		return;
f036c8184f8b67 Alexander Gordeev       2022-11-16  88  
c9b77f29ae08cb Gustavo A. R. Silva     2026-03-10  89  	tlb_flush_rmap_batch(MMU_GATHER_BATCH_FROM_HDR(&tlb->local), vma);
c47454823bd4e3 Linus Torvalds          2022-12-06 @90  	if (tlb->active != &tlb->local)
c47454823bd4e3 Linus Torvalds          2022-12-06  91  		tlb_flush_rmap_batch(tlb->active, vma);
5df397dec7c4c0 Linus Torvalds          2022-11-09  92  	tlb->delayed_rmap = 0;
5df397dec7c4c0 Linus Torvalds          2022-11-09  93  }
5df397dec7c4c0 Linus Torvalds          2022-11-09  94  #endif
5df397dec7c4c0 Linus Torvalds          2022-11-09  95  

:::::: The code at line 90 was first introduced by commit
:::::: c47454823bd4e3ab34ed3f795afd4479ab938a3f mm: mmu_gather: allow more than one batch of delayed rmaps

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
