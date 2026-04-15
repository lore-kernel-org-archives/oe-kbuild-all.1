Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9D42620DE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261253; cv=none; b=cb3ORqKrOBZ8fattf5utHH1TGEOmz7UmzGlcOXeP91kyoYOyfNf8sFlk9qDYA3aqxFJozrG0i9VBNTrQCh/2idqBgA5BnzsnGs6ub7xOvJA66JFTo8If8wrp47O1xxG1pzW66+qYGX9z0AzlxB/pKUdG/Ft1z2DgncEOXDDDIYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261253; c=relaxed/simple;
	bh=8CndE2bYEmi6GYRtRNkvlFzeLtW98eilH3WzVgxUQKQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RROm93yBvqL6X2oEaMptk3uq2KOzjk86Z8cPngrW+5fgCUKC9a6ANbPgar9jaeCFuk/L9/5NE3osxFzj6LDAlNwzXoFmYZGXrrqxWMpNaDn0KGrp8gcEPalGQLFht8YHxDiZbDnT8U41z0DD5PLXTr+T7tIRLc+3HLgWTr3AQEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGQE15eo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGQE15eo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776261252; x=1807797252;
  h=date:from:to:cc:subject:message-id;
  bh=8CndE2bYEmi6GYRtRNkvlFzeLtW98eilH3WzVgxUQKQ=;
  b=TGQE15eot0nmQTwXur1Wk33vkZqSaPumG3yiY1bkcErciQUtK54UUnt8
   JxaBAekgMFTFVqwZllnsnV2bNGSLMjyjvlunhSYHWnuDdZijDwhEAoreb
   B04ytXYmauzL17JVp+m8w3TG6VMd58ygw0jwNTjjh/sUv6DsXkmjZG9vX
   aTFe7L9UDkANOugJQzhsDgXSasknT9NCierp9/HvX6GJjlPQ8SsU4dTr8
   6kiv3SIfVYZh5cLRYe1kCTHhg213yvz2NGqzQ3CvVBEvy/eVs7n53JVEB
   gqmNUff0ZeJ3fYXwXx6MNKAxCMoMD/CmhivCqv0N3BNpyzNoYHtKiRiht
   Q==;
X-CSE-ConnectionGUID: OSXJ9SuvQbCuEomNGCBPyw==
X-CSE-MsgGUID: /nnMHvKSRVyd2DFAJrYupg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77348931"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77348931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 06:54:11 -0700
X-CSE-ConnectionGUID: tgCCZq30QDSoXWxlYcx+9Q==
X-CSE-MsgGUID: BV3SenV/SR60cJfBcrk5tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230278589"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Apr 2026 06:54:09 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD0gx-000000000YX-0tke;
	Wed, 15 Apr 2026 13:54:07 +0000
Date: Wed, 15 Apr 2026 21:53:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:uffd 4/12] mm/userfaultfd.c:427:17: error: implicit
 declaration of function 'pmd_modify'; did you mean 'pte_modify'?
Message-ID: <202604152151.rLdqv1sG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd
head:   bfa1e12c7a014c9ce5d1ae4b8b43dcb8e3d62965
commit: 83ce0c5a2d4e93266638ef2f1d2b58166bae1e8d [4/12] userfaultfd: UFFDIO_CONTINUE for anonymous memory
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260415/202604152151.rLdqv1sG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604152151.rLdqv1sG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604152151.rLdqv1sG-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/userfaultfd.c: In function 'mfill_atomic_pmd_continue_anon':
>> mm/userfaultfd.c:427:17: error: implicit declaration of function 'pmd_modify'; did you mean 'pte_modify'? [-Wimplicit-function-declaration]
     427 |         entry = pmd_modify(orig_pmd, vma->vm_page_prot);
         |                 ^~~~~~~~~~
         |                 pte_modify
>> mm/userfaultfd.c:427:17: error: incompatible types when assigning to type 'pmd_t' from type 'int'
>> mm/userfaultfd.c:428:17: error: implicit declaration of function 'pmd_mkyoung'; did you mean 'pmd_young'? [-Wimplicit-function-declaration]
     428 |         entry = pmd_mkyoung(entry);
         |                 ^~~~~~~~~~~
         |                 pmd_young
   mm/userfaultfd.c:428:17: error: incompatible types when assigning to type 'pmd_t' from type 'int'
>> mm/userfaultfd.c:430:25: error: implicit declaration of function 'pmd_wrprotect'; did you mean 'pte_wrprotect'? [-Wimplicit-function-declaration]
     430 |                 entry = pmd_wrprotect(entry);
         |                         ^~~~~~~~~~~~~
         |                         pte_wrprotect
   mm/userfaultfd.c:430:25: error: incompatible types when assigning to type 'pmd_t' from type 'int'
>> mm/userfaultfd.c:431:9: error: implicit declaration of function 'set_pmd_at'; did you mean 'set_pte_at'? [-Wimplicit-function-declaration]
     431 |         set_pmd_at(mm, addr & HPAGE_PMD_MASK, pmd, entry);
         |         ^~~~~~~~~~
         |         set_pte_at
>> mm/userfaultfd.c:432:9: error: implicit declaration of function 'update_mmu_cache_pmd'; did you mean 'update_mmu_cache'? [-Wimplicit-function-declaration]
     432 |         update_mmu_cache_pmd(vma, addr, pmd);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         update_mmu_cache


vim +427 mm/userfaultfd.c

   411	
   412	static int mfill_atomic_pmd_continue_anon(struct mm_struct *mm,
   413						  struct vm_area_struct *vma,
   414						  unsigned long addr,
   415						  pmd_t *pmd, pmd_t orig_pmd,
   416						  uffd_flags_t flags)
   417	{
   418		spinlock_t *ptl;
   419		pmd_t entry;
   420	
   421		ptl = pmd_lock(mm, pmd);
   422		if (unlikely(!pmd_same(pmdp_get(pmd), orig_pmd))) {
   423			spin_unlock(ptl);
   424			return -EAGAIN;
   425		}
   426	
 > 427		entry = pmd_modify(orig_pmd, vma->vm_page_prot);
 > 428		entry = pmd_mkyoung(entry);
   429		if (flags & MFILL_ATOMIC_WP)
 > 430			entry = pmd_wrprotect(entry);
 > 431		set_pmd_at(mm, addr & HPAGE_PMD_MASK, pmd, entry);
 > 432		update_mmu_cache_pmd(vma, addr, pmd);
   433		spin_unlock(ptl);
   434		return 0;
   435	}
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
