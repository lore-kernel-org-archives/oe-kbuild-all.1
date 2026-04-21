Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7A426C39E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 03:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776742284; cv=none; b=M0R9DQZYwkiov1MaTOTgxKiyHxQguAok+DqHOu1oPAFRYwZccn7AVX/4LNeTybLza9IhqngS1S4bs4T/F4HZz5XK7nkrtBQgBfPO1J/eITwTS3Apurob/6Rl4mhpyyEtw1hVOKJ0ELywpGZmls9QCU47PmTJodvR/xrjyYMv8sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776742284; c=relaxed/simple;
	bh=qKz+q3dhTjceIzN5qRESOwrGR7RS+2kVm3F5LnTnQOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B5i/VCbGb9UYJnOGSGiWN4hWDU4Tx+t6JJMLamV516KVrxRjc17Kgipz/Yc88AkB2ci1LMuh+r++Y9xZ+UK3JETjx7pgS10bAmP1Wh3YUQ7i5RLp1B+C5Xj0OoVCzLGsFPosgSzhSxpWC9AVpSKXY9t7CrVNTEIpVxcr+5JPIL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBfbByGK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBfbByGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776742282; x=1808278282;
  h=date:from:to:cc:subject:message-id;
  bh=qKz+q3dhTjceIzN5qRESOwrGR7RS+2kVm3F5LnTnQOc=;
  b=UBfbByGKAX/gAdLFDyrmoWYFDk+8fSEb94qQLRkMu3d3Ou4WPyhIivki
   6pAV1x73eaz4uhRsmfmV0EuDnvJuzEX2l9/pr1mWwsg9LFRna/78c0GjI
   YyclRrqYz02brGd0M2cicBkPS9MbToKMmOpSDTHR96hHUDFxomlRsJUYt
   dmrLcKist6WxXQ0xJezuUidk1BSk+gE1kAmiL994+ie2sGMSZ2wtrdb3v
   fhR0uOKgM3BGNBRaveVjU5pfByZfeQH+O4Ab8zC07n8hwPHF48UzKHcOQ
   yEd4q7FmzLpyD/+KOOwcAKorRsWLuUqIzVZtGkRmL3NVtNfRYhhfMOPjX
   A==;
X-CSE-ConnectionGUID: ALHiETlhQ12OeKeAPYJuLQ==
X-CSE-MsgGUID: eJ6RCJ8tSwWj8oKxRXVrrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77792174"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77792174"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 20:31:22 -0700
X-CSE-ConnectionGUID: EWxYd6uERB67xIbROvsGCQ==
X-CSE-MsgGUID: tKfP5lSsRRuPQdEg1aI4uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="231779962"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Apr 2026 20:31:21 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wF1pV-000000003BS-204v;
	Tue, 21 Apr 2026 03:31:17 +0000
Date: Tue, 21 Apr 2026 11:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: include/asm-generic/tlb.h:609:42: sparse: sparse: cast
 truncates bits from constant value (1000000000 becomes 0)
Message-ID: <202604211126.7cN4M93P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4e07588e743c989499ca24d49e752c074924a9a
commit: c090868f59ce888db838cf543d18f731d13ed498 Revert "hugetlb: make hugetlb depends on SYSFS or SYSCTL"
date:   7 months ago
config: arm64-randconfig-r112-20260420 (https://download.01.org/0day-ci/archive/20260421/202604211126.7cN4M93P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604211126.7cN4M93P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c090868f59ce ("Revert "hugetlb: make hugetlb depends on SYSFS or SYSCTL"")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604211126.7cN4M93P-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/hugetlb.c:665:12: sparse: sparse: context imbalance in 'allocate_file_region_entries' - wrong count at exit
   mm/hugetlb.c:736:13: sparse: sparse: context imbalance in 'region_add' - wrong count at exit
   mm/hugetlb.c:803:13: sparse: sparse: context imbalance in 'region_chg' - wrong count at exit
   mm/hugetlb.c:5778:20: sparse: sparse: context imbalance in 'move_huge_pte' - different lock contexts for basic block
   mm/hugetlb.c: note: in included file (through arch/arm64/include/asm/tlb.h):
>> include/asm-generic/tlb.h:609:42: sparse: sparse: cast truncates bits from constant value (1000000000 becomes 0)
   mm/hugetlb.c: note: in included file (through arch/arm64/include/asm/barrier.h, include/linux/list.h):
   arch/arm64/include/asm/alternative-macros.h:232:9: sparse: sparse: context imbalance in 'hugetlb_wp' - unexpected unlock

vim +609 include/asm-generic/tlb.h

2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  605) 
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  606) static inline void tlb_flush_pmd_range(struct mmu_gather *tlb,
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  607) 				     unsigned long address, unsigned long size)
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  608) {
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25 @609) 	__tlb_adjust_range(tlb, address, size);
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  610) 	tlb->cleared_pmds = 1;
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  611) }
2631ed00b04988 Peter Zijlstra (Intel  2020-06-25  612) 

:::::: The code at line 609 was first introduced by commit
:::::: 2631ed00b0498810f8d5c2163c6b5270d893687b tlb: mmu_gather: add tlb_flush_*_range APIs

:::::: TO: Peter Zijlstra (Intel) <peterz@infradead.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
