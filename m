Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F98B2264C0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 01:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956835; cv=none; b=OynmSrvkcXnA9ftVsVPRxg1BxIiScXko5QfzMjEZepQ2+85LCBjsEYX5bu0dENht723ykJ+MKdXHM4UoTyBH9NrQy0ivYcmFyGjVJBmqSh2yQB4pa0F48Tpu6DXCQJfq0kyhne+gyWKFyE9pgkW85ULDeS0ReOs2eWFSOr8LmQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956835; c=relaxed/simple;
	bh=eFK0eH7IzajStNYWcnHkcql6vBOiZ09SYrLCka5VhCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ipXKWfFX2lF1Hx43iLMwKphAYnFLlinzyK3o9lft+k0HbqzG4bqyUy5UphBpysarJM7IUrR55rQkBF9TVvzsLAGE9XTdSvlQDdHXmud01i5Ia7HuKLeEOTcREn9TTXceWoy/M9piRVSrCsg5US7Ok76Y9p/Ilf+UJQ7bUFH9oRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgSi5QWy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgSi5QWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782956834; x=1814492834;
  h=date:from:to:cc:subject:message-id;
  bh=eFK0eH7IzajStNYWcnHkcql6vBOiZ09SYrLCka5VhCY=;
  b=cgSi5QWytj1EBu5XKKx4ALFa2ut4vTV2SWZ/DHA/z2KloYF9x+1zz7iE
   LOUDlgbDM7Kx0JgKozAstTb5yEiYb+MDVRYzCgSioflkEcTznrD1hAG7y
   pUjvdVkf1YlwppC3aKn0Gm67r+IzO2vRADnCGAEQwCcabDu3ZW19qXNSb
   GYDqEfAu0ouiFBFCPv5sw4+hTV14d0StO4vSzuhXxE2NS39+gWJ4NjouR
   et1aLrXFYGPLaPufEUeZ1CQB58YlvDTgbjxxIOt8c5axl91Qp64qublhG
   SazkO3oIZKydh5AKYNxOGECvHTb0AU23j3jrQhQxF+pH/puBjiGo2FVPL
   A==;
X-CSE-ConnectionGUID: IgHr8XacRTGXjsv3oznMhw==
X-CSE-MsgGUID: huswuVO+QySaF9fL8aRhbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94298262"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="94298262"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 18:47:13 -0700
X-CSE-ConnectionGUID: SwQfJJ76RmCR7WT1GqaW/g==
X-CSE-MsgGUID: N/k7bgIIT/SxYMQaGiAaRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="248742949"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2026 18:47:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf6W1-000000009qZ-0qEQ;
	Thu, 02 Jul 2026 01:47:00 +0000
Date: Thu, 02 Jul 2026 09:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [davidhildenbrand:ptval_print 2/2]
 include/asm-generic/pgtable-nop4d.h:39:9: warning: returning 'long unsigned
 int *' from a function with return type 'int' makes integer from pointer
 without a cast
Message-ID: <202607020924.mFAOg2zW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux ptval_print
head:   dc3342ef64ac75a436edc8bfec8e3826e15f0a91
commit: dc3342ef64ac75a436edc8bfec8e3826e15f0a91 [2/2] mm: optimize pmdp_get() and friends for folded pagetable levels
config: arm-randconfig-004-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020924.mFAOg2zW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020924.mFAOg2zW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020924.mFAOg2zW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/pgtable-nopud.h:7,
                    from arch/arm/include/asm/pgtable.h:13,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:14:
   include/asm-generic/pgtable-nop4d.h:35:21: error: 'pgdp_get' declared as function returning an array
    static inline pgd_t pgdp_get(pgd_t *p4dp)
                        ^~~~~~~~
   include/asm-generic/pgtable-nop4d.h: In function 'pgdp_get':
>> include/asm-generic/pgtable-nop4d.h:39:9: warning: returning 'long unsigned int *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     return dummy;
            ^~~~~
>> include/asm-generic/pgtable-nop4d.h:39:9: warning: function returns address of local variable [-Wreturn-local-addr]
   make[3]: *** [scripts/Makefile.build:184: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=148501334
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2 shuffle=148501334
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=148501334
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=148501334
   make: Target 'prepare' not remade because of errors.


vim +39 include/asm-generic/pgtable-nop4d.h

    34	
    35	static inline pgd_t pgdp_get(pgd_t *p4dp)
    36	{
    37		pgd_t dummy = { 0 };
    38	
  > 39		return dummy;
    40	}
    41	#define pgdp_get pgdp_get
    42	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
