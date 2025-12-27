Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6092F242D84
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766820374; cv=none; b=WMuV42L4y8zr8xHgSq/Qm3ZpjyAjpRhSg7ehCXtnatDFys25SJPo1n1xhvt5O30NRUU/CycOYTaD39hIe7FZwojQTVH4k7+aLW+cOGwhj9qjOvSzNZL3zvrFqxDQVCX9lBnyjDefZcNydmgYWJvhvMdb+Q2zE2pKImJBQmmfv0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766820374; c=relaxed/simple;
	bh=NhjO257SUAYcVXkNF3qGIdJk2WXl1TjDqDhe8s2NRs0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oZvcCOce/Wp4j9PcETlEsZyeiywvbGGbQ5+Ar1ldpD/lb5XTApHeVU8I3IjgroWQ44iDEYVpG1YetPi5CGKXsB2DpKuhyQUaQQCJTIRVIY+e9yk+7AyMihGKk4+H2Z2D+Xxuzui3+PerbuxgKw972PzOJDq5eN1LCNe9wSj8VEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBgjHRIC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBgjHRIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766820373; x=1798356373;
  h=date:from:to:cc:subject:message-id;
  bh=NhjO257SUAYcVXkNF3qGIdJk2WXl1TjDqDhe8s2NRs0=;
  b=TBgjHRIC3R5uXoeSxTmXKT2xWJXOaQpLfEyR6pmJ6AFyxZnK1MC6Cqky
   BAhI1w43dlvK6wn3wxPOzeeTyNtNJt2K4P45/0ne6VsDNB+tFDMYZPp4l
   t2EKvdf05egKbjpNl+tSoJ046ujUInI1XnRVVIBt3ozGH60eCW89ZVqo5
   HGvCs7zagPjLwmW63zty/fGCpao6Vq5686vC2KIwT+EPvN56xd3oBIC06
   lIYXSGbDZwJcLtslhKF5uB5coCPmMrxZbCKg2Kwuw/mwMiERy5EJ7hfkq
   Yr06cgp9qFO1DjVN4UOsrKGsHblp32xkjPOfQJ2tovvNlKjKJ5vDOEhqt
   Q==;
X-CSE-ConnectionGUID: 2naJG2ivTnK1fjXF02ESWg==
X-CSE-MsgGUID: hwd8eFNiT4e6PYDG+sLs1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="72390759"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="72390759"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 23:26:12 -0800
X-CSE-ConnectionGUID: kPBnB+ltRmiB6b4pLD4DPw==
X-CSE-MsgGUID: 0+r2an6ZSBmbZWsVWh3CTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200530545"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Dec 2025 23:26:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZOgi-000000005dr-0Q5u;
	Sat, 27 Dec 2025 07:26:08 +0000
Date: Sat, 27 Dec 2025 15:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pmdunify 1/6]
 arch/x86/include/asm/pgtable-3level.h:58:2: error: use of undeclared
 identifier 'pudval_t'
Message-ID: <202512271531.oRkjs0xt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alex,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/alexshi/linux.git pmdunify
head:   694b5dc7bcd7ba28db0bc95b24a78861bdffefc7
commit: 7c4dfaf03d4105a4daf3dc7baa6070bcab92a7fb [1/6] replace pudval_t by pmdval_t
config: i386-buildonly-randconfig-001-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271531.oRkjs0xt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271531.oRkjs0xt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271531.oRkjs0xt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:17:
   In file included from arch/x86/include/asm/pgtable.h:936:
   In file included from arch/x86/include/asm/pgtable_32.h:36:
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: expected expression
      58 |         pxx_xchg64(pud, pudp, native_pud_val(pud));
         |         ^
   arch/x86/include/asm/pgtable-3level.h:23:34: note: expanded from macro 'pxx_xchg64'
      23 |         _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
         |                                         ^
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: use of undeclared identifier 'pudval_t'
   arch/x86/include/asm/pgtable-3level.h:23:21: note: expanded from macro 'pxx_xchg64'
      23 |         _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
         |                            ^
   <scratch space>:90:1: note: expanded from here
      90 | pudval_t
         | ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:17:
   In file included from arch/x86/include/asm/pgtable.h:936:
   In file included from arch/x86/include/asm/pgtable_32.h:36:
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: use of undeclared identifier 'pudval_t'
   arch/x86/include/asm/pgtable-3level.h:23:2: note: expanded from macro 'pxx_xchg64'
      23 |         _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
         |         ^
   <scratch space>:89:1: note: expanded from here
      89 | pudval_t
         | ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:17:
   In file included from arch/x86/include/asm/pgtable.h:936:
   In file included from arch/x86/include/asm/pgtable_32.h:36:
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: use of undeclared identifier '_p'
   arch/x86/include/asm/pgtable-3level.h:23:15: note: expanded from macro 'pxx_xchg64'
      23 |         _pxx##val_t *_p = (_pxx##val_t *)_ptr;                          \
         |                      ^
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: expected ';' after expression
   arch/x86/include/asm/pgtable-3level.h:24:14: note: expanded from macro 'pxx_xchg64'
      24 |         _pxx##val_t _o = *_p;                                           \
         |                     ^
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: use of undeclared identifier 'pudval_t'
   arch/x86/include/asm/pgtable-3level.h:24:2: note: expanded from macro 'pxx_xchg64'
      24 |         _pxx##val_t _o = *_p;                                           \
         |         ^
   <scratch space>:91:1: note: expanded from here
      91 | pudval_t
         | ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:13:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:17:
   In file included from arch/x86/include/asm/pgtable.h:936:
   In file included from arch/x86/include/asm/pgtable_32.h:36:
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: use of undeclared identifier '_o'
   arch/x86/include/asm/pgtable-3level.h:24:14: note: expanded from macro 'pxx_xchg64'
      24 |         _pxx##val_t _o = *_p;                                           \
         |                     ^
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: use of undeclared identifier '_p'
   arch/x86/include/asm/pgtable-3level.h:24:20: note: expanded from macro 'pxx_xchg64'
      24 |         _pxx##val_t _o = *_p;                                           \
         |                           ^
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: use of undeclared identifier '_p'
   arch/x86/include/asm/pgtable-3level.h:25:31: note: expanded from macro 'pxx_xchg64'
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                                      ^
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: use of undeclared identifier '_p'
   arch/x86/include/asm/pgtable-3level.h:25:31: note: expanded from macro 'pxx_xchg64'
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                                      ^
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: use of undeclared identifier '_o'
   arch/x86/include/asm/pgtable-3level.h:25:36: note: expanded from macro 'pxx_xchg64'
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                                           ^
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: use of undeclared identifier '_o'
   arch/x86/include/asm/pgtable-3level.h:25:36: note: expanded from macro 'pxx_xchg64'
      25 |         do { } while (!try_cmpxchg64(_p, &_o, (_val)));                 \
         |                                           ^
>> arch/x86/include/asm/pgtable-3level.h:58:2: error: use of undeclared identifier '_o'
   arch/x86/include/asm/pgtable-3level.h:26:21: note: expanded from macro 'pxx_xchg64'
      26 |         native_make_##_pxx(_o);                                         \
         |                            ^
   13 errors generated.
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=1314997945
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2 shuffle=1314997945
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1314997945
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1314997945
   make: Target 'prepare' not remade because of errors.


vim +/pudval_t +58 arch/x86/include/asm/pgtable-3level.h

4b01fef89a10ce include/asm-x86/pgtable-3level.h      Joe Perches         2008-03-23  52  
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  53  static inline void native_set_pud(pud_t *pudp, pud_t pud)
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  54  {
ea4654e0885348 arch/x86/include/asm/pgtable-3level.h Breno Leitao        2023-11-21  55  #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
9b7b8bbd7f6ba4 arch/x86/include/asm/pgtable-3level.h Joerg Roedel        2018-07-18  56  	pud.p4d.pgd = pti_set_user_pgtbl(&pudp->p4d.pgd, pud.p4d.pgd);
9b7b8bbd7f6ba4 arch/x86/include/asm/pgtable-3level.h Joerg Roedel        2018-07-18  57  #endif
d4a72e7fe61a1e arch/x86/include/asm/pgtable-3level.h Peter Zijlstra      2022-10-21 @58  	pxx_xchg64(pud, pudp, native_pud_val(pud));
3dc494e86d1c93 include/asm-i386/pgtable-3level.h     Jeremy Fitzhardinge 2007-05-02  59  }
^1da177e4c3f41 include/asm-i386/pgtable-3level.h     Linus Torvalds      2005-04-16  60  

:::::: The code at line 58 was first introduced by commit
:::::: d4a72e7fe61a1ea9ad4accf3532411ca685eaead x86/mm/pae: Get rid of set_64bit()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
