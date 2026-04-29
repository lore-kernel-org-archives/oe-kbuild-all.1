Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0F3148D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486102; cv=none; b=Oe+e9zn/np5iUdOonOfYl8ELmf4NG3xun4XNoHbIpdJMZE1VRp/3N+uCROr7NlFraolZI5sHjJseMw/xukblexZRy+58Rz9TFHlHIZUyKRpKK94gQGJs0y+SKJQCjw5G7HmuiIysmMYzRXzI1r5Q3FgbswFLGZ1soPFCtPFxC/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486102; c=relaxed/simple;
	bh=C3ABFjD6RgNlYEfmnMOiTrz40n4+AjVIYLul8owY5tE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j81LZtDZJdIvY+0GuPCDsWooISTOzEl/NgO0Gak33dYnfGDeg5rjy031NRupX3FxgAWzDF1lpwBSs1jw23GjbM+7MYpD44WxVbmgn0kPNtyC1QH6dR3D5VJ8088WRXr0nHpwDQIXAN4AGQJXjqkFXN4As9mIj9jYPzSfhQlQteY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOWax/Lj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOWax/Lj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777486101; x=1809022101;
  h=date:from:to:cc:subject:message-id;
  bh=C3ABFjD6RgNlYEfmnMOiTrz40n4+AjVIYLul8owY5tE=;
  b=IOWax/LjKLXk24iQijqSGtWP1YAsgsr1XKu86nIHIHDuxV8tI2XZ7VKU
   JEPRYrqzShCzUtbwQ+hxRSyFFTDzXfqi+iQOkGHHGt0k/Z21b4KND4kXn
   mqlBnLY61dNJU0NSc0ORKCkFHvuaMEHEUWwUJnebKW6cFeq0vTJBJlG14
   diLAG6Hr6+cFef9zqkCcCVRBZoJ2IiGD9eiX9VVlF6Zk/tDSQV3myb92Y
   haKGxGtl9uoWPvQh4OYfocnuKLcJ4xeA0jVmASNlh1tKACMb1202Mfm4J
   G03owq5RZUwuqkEk9aPTRGhFwj6E7+kT0TaWZye/HMNxa9YT20LCSa8HO
   g==;
X-CSE-ConnectionGUID: 6S/WrQMmQiConnWnZUkMCA==
X-CSE-MsgGUID: KqFF+9ofSYqKbledQuElew==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77451451"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="77451451"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 11:08:19 -0700
X-CSE-ConnectionGUID: FtJe4HP0Rd2zaGHAtKB9/g==
X-CSE-MsgGUID: jYFQv4ZtTHCZhyjMJ4iSOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="234219750"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2026 11:08:18 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wI9KY-00000000BLM-3y3x;
	Wed, 29 Apr 2026 18:08:14 +0000
Date: Thu, 30 Apr 2026 02:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260408 12/20]
 mm/mmu_gather.c:90:18: warning: comparison of distinct pointer types ('struct
 mmu_gather_batch *' and 'struct mmu_gather_batch_hdr *')
Message-ID: <202604300202.KAqBB6Qb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260408
head:   6d701ba0454b8785a162a4ed3af4a26b4bd592e9
commit: 8f75bd4b2651d0fc1d9335ce0c94748cabf7d16f [12/20] mm/mmu_gather: avoid dozens of -Wflex-array-member-not-at-end warnings
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260430/202604300202.KAqBB6Qb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300202.KAqBB6Qb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300202.KAqBB6Qb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mmu_gather.c:90:18: warning: comparison of distinct pointer types ('struct mmu_gather_batch *' and 'struct mmu_gather_batch_hdr *') [-Wcompare-distinct-pointer-types]
      90 |         if (tlb->active != &tlb->local)
         |             ~~~~~~~~~~~ ^  ~~~~~~~~~~~
   1 warning generated.


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
8f75bd4b2651d0 Gustavo A. R. Silva     2026-03-10  89  	tlb_flush_rmap_batch(MMU_GATHER_BATCH_FROM_HDR(&tlb->local), vma);
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
