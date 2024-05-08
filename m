Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05DE85925
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715178306; cv=none; b=rhLOBeh5zNsJD2QdxbdhpO3uqywCstPzwDRepqja/mJNNYIxUAuDBsORYYerGjjpYAg5myRz4w7/QsePsVzaBz0lGq69X2Zc+BpgZbr9NDyoOunY3ZdLGpOdbU4aquIO/wSpqSqGrh2HA+qZIy30VzyzwqI0QJWnIOhAUl5bgQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715178306; c=relaxed/simple;
	bh=sykyE6bBb3smFiZj8Wo8ylUo762lAudpcVi0FWQ91Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kps1rQ4GFd4c0DFNM8A8P5/Hurj5WLAKJAmhbSZgtlQJCxOJuH5W8zGpL/LngFw7XCtj0SyEF2v8dW+w22jdBv1DZEXNQ3iXpSY1WAZxYIa2O6bI6pZmpU1eNnvJhW41MJ8h8NQWDIJYmMoKEf3/3aBK1rAyZIs0YCNOkBxN2kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYle9ChU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYle9ChU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715178305; x=1746714305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sykyE6bBb3smFiZj8Wo8ylUo762lAudpcVi0FWQ91Vc=;
  b=HYle9ChUcaT2kC7U7/HA484M9Vz8UnUZ8gkxr8a+rIqcMBsMPP9rEeoK
   rzYdBZ7FMKSnRpCWWBbdZ9NBV/pLhZzCEx3Is6T3wTxxGqA+nR6+JOSdQ
   Lbl/FIB/yVtSdoQgtmUbW6Q00ZmGMrA6JBgPb1wHIu9x/jjnZEfhxDhvy
   QCGL24dsArchCpLSG5v3QlRV1/jgvSJjgG22ZPUYdR34DKNFSszVNZPOA
   V/SC5brxvgxMNf89GdTdGrQ6IENuu+NqQAuagHtLFJ+gk4gXwM0vhgh3a
   FmfRwcThUk1Wt1CjZIHU0+/Ds4Kj0XW2f3p/dPy2AzmN0mznBoWpwG9vM
   g==;
X-CSE-ConnectionGUID: RJ0wcAmvTcyMicca/zDdSg==
X-CSE-MsgGUID: j6lO1gsESwGILRWQizqVuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11254907"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="11254907"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 07:25:04 -0700
X-CSE-ConnectionGUID: 25Z5QpENQPOp8+3VdnXmSQ==
X-CSE-MsgGUID: sEMogP7nQP+DTgxkkb/zMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28780475"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 May 2024 07:25:02 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4iE8-0003cq-0m;
	Wed, 08 May 2024 14:25:00 +0000
Date: Wed, 8 May 2024 22:24:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [linux-next:master 10159/12060]
 arch/arm64/include/asm/pgtable.h:1102:16: error: implicit declaration of
 function 'pud_valid'; did you mean 'pmd_valid'?
Message-ID: <202405082221.43rfWxz5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7b4ef8fffaca247809337bb78daceb406659f2d
commit: f0f5863a0fb0fb48a5881c3f6acca1958899dd76 [10159/12060] arm64/mm: Remove PTE_PROT_NONE bit
config: arm64-randconfig-r013-20230528 (https://download.01.org/0day-ci/archive/20240508/202405082221.43rfWxz5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405082221.43rfWxz5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405082221.43rfWxz5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm64/include/asm/hardirq.h:17,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from arch/arm64/kernel/asm-offsets.c:12:
   arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
>> arch/arm64/include/asm/pgtable.h:1102:16: error: implicit declaration of function 'pud_valid'; did you mean 'pmd_valid'? [-Werror=implicit-function-declaration]
    1102 |         return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
         |                ^~~~~~~~~
         |                pmd_valid
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: arch/arm64/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1102 arch/arm64/include/asm/pgtable.h

  1099	
  1100	static inline bool pud_user_accessible_page(pud_t pud)
  1101	{
> 1102		return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
  1103	}
  1104	#endif
  1105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
