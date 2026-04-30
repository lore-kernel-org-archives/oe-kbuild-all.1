Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4CDC2EA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 00:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777507636; cv=none; b=NYiMDyC3LNnEX8i0go208cCzHwsP78sALJGyufRpI9TUbAMrhE1bnOEoT3fZUsQUDwJptCQTjHZ5JAzKS5JBx24yQRyaLwwhfLIjBe4exDTEpcgHw5iBckomskioVvaUEU4IhzJVT57O0o7iI5zzWSn6flmNOr8OIYoQpx8XJJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777507636; c=relaxed/simple;
	bh=kUuPK2Upzb3skF4hDU00RTgPlhwNtBKSeVP5pUjhA7Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rLJPcuyDa4X2MfraB7sh4+QaG2twSY7ZyOqwkuo3bOoTkNhHL/FRl88Zs0hsMzFBSP8ebZCWBZFl3dmXxhRT57Jc0pKOE9/GUo4YEO7FNghWPLm8Z686wmA7+uG5I8Jw3ySV4/M9qWT9yaExzVJhU18MyEcJzt8dKGUJahjJz1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sg5Rr/Yp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sg5Rr/Yp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777507635; x=1809043635;
  h=date:from:to:cc:subject:message-id;
  bh=kUuPK2Upzb3skF4hDU00RTgPlhwNtBKSeVP5pUjhA7Y=;
  b=Sg5Rr/YpnH/e8PxyIyN/p3d16T6XDO/HzqHIli8giD7BRFvV1C3ntJzO
   tvljiwNtdEdFOGmR2ZmpZx20g4iiLmiF8XUDj5Zht8M5KDVbGJH1VfJtF
   f72PCzaNmL3Wk0ilfmfNV02FNtM1Aql55ywYk5KXVXJQZlXFVuhRljYVh
   WaY4ov6tcCoNfx0IVw9S+9ppysP7SpxmtVM5x0Z1goV9olzalkDyKX0d0
   u6xFdnsUNDizooJMp7UodNQtScN008WWaEULrlf33jHX9gI5QWYDkO2Ho
   5YWXScfV/3fyh/YOsrzyq09gcfVhmHLFzjuiiXcDwNFBw/P3f4uzqhc5u
   A==;
X-CSE-ConnectionGUID: HmcShiDBTCqVOionSjA22Q==
X-CSE-MsgGUID: yvKmWiYeSsyFYmYw/4yhQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="96014449"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="96014449"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 17:07:13 -0700
X-CSE-ConnectionGUID: Ur9IlTKZSCS8yOb0IRsjGA==
X-CSE-MsgGUID: v8eTJKtzSmG1wUFsOq9hnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="239402354"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2026 17:07:11 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIEvs-00000000Bgg-3aB9;
	Thu, 30 Apr 2026 00:07:08 +0000
Date: Thu, 30 Apr 2026 08:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260407 13/19]
 mm/mmu_gather.c:90:25: sparse: sparse: incompatible types in comparison
 expression (different base types):
Message-ID: <202604300741.UELmFWex-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260407
head:   9505f43094e1efb72854c166160fb7666517f07a
commit: c9b77f29ae08cb9afc5965f0d31fc8e5d3d44497 [13/19] mm/mmu_gather: avoid dozens of -Wflex-array-member-not-at-end warnings
config: sparc64-randconfig-r112-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300741.UELmFWex-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300741.UELmFWex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300741.UELmFWex-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mmu_gather.c:90:25: sparse: sparse: incompatible types in comparison expression (different base types):
   mm/mmu_gather.c:90:25: sparse:    struct mmu_gather_batch *
   mm/mmu_gather.c:90:25: sparse:    struct mmu_gather_batch_hdr *

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
