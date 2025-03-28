Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E9413AA53
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162733; cv=none; b=reiEVrmnNOwyUucOAOjQeBDRmDLh1BomyYACxzUM/beas/KvL9F/0jh1/B4rqpGkOl8A6spD7cURK82rVBIBb7edsb1Shy3E5p8pa5jbDO5BudKZEU+0XHEixV/Cd21AbnzoZa8EH5kI+/ncuTYg3s9VQz48yV39zZNh3kA0BDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162733; c=relaxed/simple;
	bh=crwoBlFMHO4r8myexfmKrW+Q4+LUNw6/urQW0O3Sc0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O3oSWS5B7qLnlZfmI0g/XWdkLSoSsbEtpnDD0xKCanvlSfOUGldc6MzmV2Ctk7lss7eTCjus2jm15TAaqNT2H3vn1xfuH3XIH1PP7DFZg2YBVNWsV7ZZh2xqZCRlREBG+HoDktgdIhFkMBF851ZTsL5T0S0Cjr9p50iSVfh6N7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ny2CGpmh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ny2CGpmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743162731; x=1774698731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crwoBlFMHO4r8myexfmKrW+Q4+LUNw6/urQW0O3Sc0c=;
  b=ny2CGpmhoJXS/b0I8lWhH2sPjcTbGa6qqFg9UHgHbTPHNvOYUAkq2orz
   6sx6qsGYteooc8fjLdA0cnxOey0Z4lUTo8UprV/wH9KkLmkti9w9vZNyl
   kulQhMwBLZQZICVhREdUS38cTgRwfok4Su62aCeLry78GDcPWlSBlg/TX
   s/G7eFmkIj0w3wSwr7vR/inc2V8vx87omNJEmE59cCIezyzoHZ8Jrd3Oc
   smGlQEbleQuLkQr9KIkyAsDLhgzN1H8JQVE6U76ZVdDNJnNCEQikf+bGb
   4mEIeKaKZ+y01sNlpZWPOTWbqVhgE5CtUR6rOGO078aAA76+5tNiZ2tA5
   A==;
X-CSE-ConnectionGUID: ybx2SFJXQEeBCw9Vm74ofQ==
X-CSE-MsgGUID: SM/CtdZVTZWD6xkUtucA5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66993890"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="66993890"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 04:52:11 -0700
X-CSE-ConnectionGUID: /erSuERNTLm0X7pf8JAUDg==
X-CSE-MsgGUID: QOWCui6/SMO3vT7DnJroUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125428400"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Mar 2025 04:52:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty8Fq-0007Pw-3B;
	Fri, 28 Mar 2025 11:52:06 +0000
Date: Fri, 28 Mar 2025 19:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 13920/14010] arch/riscv/mm/tlbflush.c:195:16:
 error: 'start' redeclared as different kind of symbol
Message-ID: <202503281921.4kgbX9Ci-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e21edb1638e82460f126a6e49bcdd958d452929c
commit: 5744739d8ce78876d4b62a20fd6bc65f01ba142e [13920/14010] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
config: riscv-randconfig-001-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281921.4kgbX9Ci-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281921.4kgbX9Ci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281921.4kgbX9Ci-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/mm/tlbflush.c: In function 'arch_tlbbatch_add_pending':
>> arch/riscv/mm/tlbflush.c:195:16: error: 'start' redeclared as different kind of symbol
     unsigned long start = uaddr & PAGE_MASK;
                   ^~~~~
   arch/riscv/mm/tlbflush.c:193:39: note: previous definition of 'start' was here
      struct mm_struct *mm, unsigned long start, unsigned long end)
                            ~~~~~~~~~~~~~~^~~~~
>> arch/riscv/mm/tlbflush.c:195:24: error: 'uaddr' undeclared (first use in this function)
     unsigned long start = uaddr & PAGE_MASK;
                           ^~~~~
   arch/riscv/mm/tlbflush.c:195:24: note: each undeclared identifier is reported only once for each function it appears in


vim +/start +195 arch/riscv/mm/tlbflush.c

54d7431af73e2f Alexandre Ghiti 2024-01-08  191  
54d7431af73e2f Alexandre Ghiti 2024-01-08  192  void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
2f4ab3ac10e147 Barry Song      2025-02-14  193  		struct mm_struct *mm, unsigned long start, unsigned long end)
54d7431af73e2f Alexandre Ghiti 2024-01-08  194  {
d9be2b9b60497a Alexandre Ghiti 2025-01-13 @195  	unsigned long start = uaddr & PAGE_MASK;
d9be2b9b60497a Alexandre Ghiti 2025-01-13  196  
54d7431af73e2f Alexandre Ghiti 2024-01-08  197  	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
d9be2b9b60497a Alexandre Ghiti 2025-01-13  198  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, start + PAGE_SIZE);
54d7431af73e2f Alexandre Ghiti 2024-01-08  199  }
54d7431af73e2f Alexandre Ghiti 2024-01-08  200  

:::::: The code at line 195 was first introduced by commit
:::::: d9be2b9b60497a82aeceec3a98d8b37fdd2960f2 riscv: Call secondary mmu notifier when flushing the tlb

:::::: TO: Alexandre Ghiti <alexghiti@rivosinc.com>
:::::: CC: Alexandre Ghiti <alexghiti@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
