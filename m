Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6293EBF38
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 00:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771027375; cv=none; b=Zai+xdbDi3vW9U/O96ZFR4eRWFW0Elq4jzxr4lAOX+z99sSSAswlbiEOiKrSDYt4WZ7Th+t3b4Xawm/7coELtrZI504kEJvKlaUa0HKEGADlcPKANxuA3NfdP/VhQGF+NhrjW93fHD05KVfbz05IRxdw4UWGK4wosK52PWbt8C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771027375; c=relaxed/simple;
	bh=Jf4fPTMUMWoAnmfQs/+HVtYHi4pI431QO+TeByLcvUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=natP+iP8nlUGo2k8BuDeH+uSiwKtt1bvDqJSDj5QjQv9NMQCYFHlic1y8jfuOfFB9e3XjrKz7ao0i6FhvgdQcSmVLv6bPwLokOYnMKjMHS2xggE1cfsxAu59rBn9+ZiyNsYDeVOjNCYFq+mzfuO1l+UYTAaKiVkbwAqAK/o/U68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OK2UaaKT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OK2UaaKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771027375; x=1802563375;
  h=date:from:to:cc:subject:message-id;
  bh=Jf4fPTMUMWoAnmfQs/+HVtYHi4pI431QO+TeByLcvUc=;
  b=OK2UaaKT/JuJ2+3WcOy7b3w55d63NTKCOfk7SUWWwVVYVu/hnMLhjHYa
   wHECep+CNaulA1XXqfgS1KWCDh5p7tl2mKyA+rk7Qosplh96enq8Y9oAF
   GOXQGMhzGvhq3zDp5wTSwPQEUAk4RYCbbQu8mYYo2MaXpVBS4TrpiCAt+
   7a+MXWI0fjTUgqEUEP3FC6cFPBiGQeZCBap/tU3kgRHf8T+Vd6BTk7k+t
   6LI8tn2Ym7az1p5uNuWz+SPJwph1ZEWq/Gt1Pv6V3zQ75EjduiIP25o6f
   IViITrsgFf7oldeZKPnC/5CGtQhaYt8VrbnGr84W+Fgc1eTRh4C5bbGUf
   g==;
X-CSE-ConnectionGUID: KBpragQLQgeSNiZpv+fKnw==
X-CSE-MsgGUID: r8YydUlbQQqahQLQUEvQ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71242346"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="71242346"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 16:02:54 -0800
X-CSE-ConnectionGUID: PEx/Bp7MSjShOEgIED2Dsw==
X-CSE-MsgGUID: HzPZqEh5T0mA++2FEbuPjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="218027948"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Feb 2026 16:02:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr37a-00000000vwO-2iup;
	Sat, 14 Feb 2026 00:02:50 +0000
Date: Sat, 14 Feb 2026 08:01:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 79/84] include/linux/mm.h:3370:9:
 error: implicit declaration of function 'pte_unmap'; did you mean
 'pmb_unmap'?
Message-ID: <202602140728.Iy4TDkOh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   d4418ddb34578f2e04647ee7cc4f35c86975bffc
commit: c9fea611f0d500e82d97b83a927e2d01a0b52efa [79/84] treewide: Add lock context annotations in all include files
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260214/202602140728.Iy4TDkOh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140728.Iy4TDkOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140728.Iy4TDkOh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sh/kernel/asm-offsets.c:15:
   include/linux/mm.h: In function 'pte_unmap_unlock':
>> include/linux/mm.h:3370:9: error: implicit declaration of function 'pte_unmap'; did you mean 'pmb_unmap'? [-Wimplicit-function-declaration]
    3370 |         pte_unmap(pte);
         |         ^~~~~~~~~
         |         pmb_unmap
   make[3]: *** [scripts/Makefile.build:184: arch/sh/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +3370 include/linux/mm.h

  3355	
  3356	pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
  3357				   unsigned long addr, spinlock_t **ptlp)
  3358		__cond_acquires(nonnull, *ptlp);
  3359	
  3360	pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
  3361					unsigned long addr, spinlock_t **ptlp);
  3362	pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
  3363					unsigned long addr, pmd_t *pmdvalp,
  3364					spinlock_t **ptlp);
  3365	
  3366	static inline void pte_unmap_unlock(pte_t *pte, spinlock_t *ptl)
  3367		__releases(ptl)
  3368	{
  3369		spin_unlock(ptl);
> 3370		pte_unmap(pte);
  3371	}
  3372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
