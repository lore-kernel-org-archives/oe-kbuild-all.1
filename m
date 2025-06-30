Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E911B0435
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 23:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751326224; cv=none; b=is9jHLmctaFY/0gEdwrIwF0WbWYzoQOerJuHtT3NHFTw5VTgCuxcw9bVHqEkQAJ9+gU/5LFF1+RtOXOOFbhpiS18CyniiUuw93wwEVHVIlgkBzEUEG8+mij+wsu5O2RA1XZJ08u64lg3rdOiRSqELXG/zpZiGnlqlhrtHBFEaLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751326224; c=relaxed/simple;
	bh=XLpr5I9Ur0lAyxgMCZ+o7SzSq2FzWYEpKpXmCGU6v2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j5NiHjSlD4o+wtf9shguYmKiJXwPmEO3eW2jjMQkcUbNHH2J8fKPHqC5VfpousHvf7OBbcwaAsr4evw38gCMqsSDpW/DMn9Cht9VlA7Vc29uxr1qF9lxYjDd/XWYrEyrPZvEKORGiaes49pQHLLGTHn6uZ75x6HF4fAds5eOBZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AThIsN4I; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AThIsN4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751326223; x=1782862223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XLpr5I9Ur0lAyxgMCZ+o7SzSq2FzWYEpKpXmCGU6v2s=;
  b=AThIsN4IhpDdukw5j8UT1RQvrJON3jRt9Whoow7abECA2pFKpE9n8pOs
   OCdSCabzI8ojT3EFQSapnqlOBxU5x40QfL85/EL3F2t7m97AdymlFCNA1
   xJUfZ+nHtzlQgoJJe3lxjItTVZhG4uk03B/L3si9u0dpEG0kD8QSbkaOH
   IrJcTn7Qr5HcnNhdGrolf7NLgdxD1ofCpd7b7lbFUop7l1iMvAWcZa8kV
   ZDdrUC6R9uyHq4AmoI52OssomH/gL609UpHXWGBndqaFj6rXqLBEQyfhV
   BRyB77F6ThMjhsQl2nOvEihF4ckOUb29LIpaPr96Ed73ZY5sFas9pTF5w
   g==;
X-CSE-ConnectionGUID: Y4Bi6vLPSpS2U0xPCHk6EA==
X-CSE-MsgGUID: RdKmyfApRsGpS0OvUfjP2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53659429"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="53659429"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 16:30:22 -0700
X-CSE-ConnectionGUID: vdwGghieTlSUaKZbitEWqg==
X-CSE-MsgGUID: m+Y/cFv+QE2oKrSty7fN5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153772898"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Jun 2025 16:30:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWNx4-000ZRe-1L;
	Mon, 30 Jun 2025 23:30:18 +0000
Date: Tue, 1 Jul 2025 07:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v6.16-rc1 17/17]
 kernel/exit.c:799:15: error: redefinition of 'stack_not_used'
Message-ID: <202507010705.DvB32cgT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v6.16-rc1
head:   668824aa31e280b4931eae15eb9661f849378fd7
commit: 668824aa31e280b4931eae15eb9661f849378fd7 [17/17] arm64: Support dynamic kernel stacks
config: arm64-randconfig-004-20250701 (https://download.01.org/0day-ci/archive/20250701/202507010705.DvB32cgT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010705.DvB32cgT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010705.DvB32cgT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/exit.c:799:15: error: redefinition of 'stack_not_used'
    unsigned long stack_not_used(struct task_struct *p)
                  ^~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/compat.h:29,
                    from arch/arm64/include/asm/stat.h:13,
                    from include/linux/stat.h:6,
                    from include/linux/fs.h:11,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1014,
                    from kernel/exit.c:8:
   include/linux/sched/task_stack.h:115:29: note: previous definition of 'stack_not_used' was here
    static inline unsigned long stack_not_used(struct task_struct *p)
                                ^~~~~~~~~~~~~~


vim +/stack_not_used +799 kernel/exit.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  785  
e18eecb8b35703a Jeff Dike      2007-07-15  786  #ifdef CONFIG_DEBUG_STACK_USAGE
9e7d2766d8023ef Pasha Tatashin 2024-03-11  787  #ifdef CONFIG_STACK_GROWSUP
fbe76a6557a83af Pasha Tatashin 2024-07-24  788  unsigned long stack_not_used(struct task_struct *p)
fbe76a6557a83af Pasha Tatashin 2024-07-24  789  {
fbe76a6557a83af Pasha Tatashin 2024-07-24  790  	unsigned long *n = end_of_stack(p);
fbe76a6557a83af Pasha Tatashin 2024-07-24  791  
fbe76a6557a83af Pasha Tatashin 2024-07-24  792  	do {	/* Skip over canary */
fbe76a6557a83af Pasha Tatashin 2024-07-24  793  		n--;
fbe76a6557a83af Pasha Tatashin 2024-07-24  794  	} while (!*n);
fbe76a6557a83af Pasha Tatashin 2024-07-24  795  
fbe76a6557a83af Pasha Tatashin 2024-07-24  796  	return (unsigned long)end_of_stack(p) - (unsigned long)n;
9e7d2766d8023ef Pasha Tatashin 2024-03-11  797  }
9e7d2766d8023ef Pasha Tatashin 2024-03-11  798  #else /* !CONFIG_STACK_GROWSUP */
9e7d2766d8023ef Pasha Tatashin 2024-03-11 @799  unsigned long stack_not_used(struct task_struct *p)
9e7d2766d8023ef Pasha Tatashin 2024-03-11  800  {
9e7d2766d8023ef Pasha Tatashin 2024-03-11  801  	unsigned long *n = end_of_stack(p);
9e7d2766d8023ef Pasha Tatashin 2024-03-11  802  
9e7d2766d8023ef Pasha Tatashin 2024-03-11  803  	do {	/* Skip over canary */
9e7d2766d8023ef Pasha Tatashin 2024-03-11  804  		n++;
9e7d2766d8023ef Pasha Tatashin 2024-03-11  805  	} while (!*n);
9e7d2766d8023ef Pasha Tatashin 2024-03-11  806  
fbe76a6557a83af Pasha Tatashin 2024-07-24  807  	return (unsigned long)n - (unsigned long)end_of_stack(p);
fbe76a6557a83af Pasha Tatashin 2024-07-24  808  }
9e7d2766d8023ef Pasha Tatashin 2024-03-11  809  #endif /* CONFIG_STACK_GROWSUP */
fbe76a6557a83af Pasha Tatashin 2024-07-24  810  

:::::: The code at line 799 was first introduced by commit
:::::: 9e7d2766d8023efa16eb55fe321007a977f7fc98 task_stack.h: Clean-up stack_not_used() implementation

:::::: TO: Pasha Tatashin <pasha.tatashin@soleen.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
