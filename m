Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5043A2FD1CF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 05:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764825115; cv=none; b=D++4xb/AW7sfXWqYe8S0fm9rv4iqbyUJH+axV8gQJCvqT0zSbOUU7SxXuUr6DOuq3wuv0bcNvJKi4kG/spLkn9Hoo+k8KvNSNdAuc7PC4LY/7lNE2bKUf7RJ1SE0Gkl09wer7dKDC/xIm044R5fMDQUfb4eRTO9fg/I0T0gjxFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764825115; c=relaxed/simple;
	bh=oJ12pto2zgYpCp6k5x1RPVuW+2eLFzZGGbZB1FbR63A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W6qGMVPjVDiMsp25NLcI31YcJgbedDMbCAtZh81N22VSaC/vMPeFxT67hd7SkHlIY8wHfjPSXmwruoV7UiX1FokjKrazqOiMjKtxC3XcZgbve6QJfUbH719uJYPey8ip4Y+zmFMCIBCo+SdBXCoM9xVpj3Sil2TF0y+rxhrL1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSY1TE+i; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSY1TE+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764825113; x=1796361113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oJ12pto2zgYpCp6k5x1RPVuW+2eLFzZGGbZB1FbR63A=;
  b=hSY1TE+ioDbhsaIFYGtm0xOBQRYOBLcPrXsWnIV4z9l4umtfJjLHYELa
   TnXOV9aO+h4Z/gb2xx8M1+3oYzwtYxV1STWybkVgk2fuKEPQ3VR3ulXHL
   DNUGx6FrZ1y1T5y9B7nHmVD1qW8tJhgYxbI+XkNCGvzjm0fqeJe3H64ND
   wMCaKp//G1L0QEtsxuvZLGnWUHGT3wfupFoNM7AzVGXCIRF7IqJqFq/5+
   1eKA8QRnU/CoQSgWElzasr+8ljRo2UtRXiBzYyZosLLFkhsdlQBBmVNYz
   uJG+WPVbyOQWXMHiYCOD445Xg5FFPSSXsgE4sFeAFtqzcwL62jlJi4OkI
   g==;
X-CSE-ConnectionGUID: l3KGqe9ER82iGeqqSomvkA==
X-CSE-MsgGUID: okecRa+dS9C0ZqcSTEOlxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77517410"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="77517410"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 21:11:51 -0800
X-CSE-ConnectionGUID: 80V/ixVsRjKF+gOCWyhc6g==
X-CSE-MsgGUID: my3RBpI5Tqut9mL4MHsOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="199058976"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Dec 2025 21:11:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR1d5-00000000DT8-2W6y;
	Thu, 04 Dec 2025 05:11:47 +0000
Date: Thu, 4 Dec 2025 13:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Isaac J. Manjarres" <isaacmanjarres@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:renesas-android/v6.18-rc6-2025-12-01 1/1]
 include/asm-generic/mm_hooks.h:20:15: error: unknown type name 'bool'
Message-ID: <202512041310.3d4IBgFM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-android/v6.18-rc6-2025-12-01
head:   9df6f95899e762009eb03fba18a18054a299ec34
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [1/1] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20251204/202512041310.3d4IBgFM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041310.3d4IBgFM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041310.3d4IBgFM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/openrisc/include/asm/mmu_context.h:18,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
>> include/asm-generic/mm_hooks.h:10:40: warning: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration
      10 | static inline int arch_dup_mmap(struct mm_struct *oldmm,
         |                                        ^~~~~~~~~
   include/asm-generic/mm_hooks.h:16:42: warning: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration
      16 | static inline void arch_exit_mmap(struct mm_struct *mm)
         |                                          ^~~~~~~~~
>> include/asm-generic/mm_hooks.h:20:15: error: unknown type name 'bool'
      20 | static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,
         |               ^~~~
   include/asm-generic/mm_hooks.h:1:1: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
     +++ |+#include <stdbool.h>
       1 | /* SPDX-License-Identifier: GPL-2.0 */
   include/asm-generic/mm_hooks.h:21:17: error: unknown type name 'bool'
      21 |                 bool write, bool execute, bool foreign)
         |                 ^~~~
   include/asm-generic/mm_hooks.h:21:17: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
   include/asm-generic/mm_hooks.h:21:29: error: unknown type name 'bool'
      21 |                 bool write, bool execute, bool foreign)
         |                             ^~~~
   include/asm-generic/mm_hooks.h:21:29: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
   include/asm-generic/mm_hooks.h:21:43: error: unknown type name 'bool'
      21 |                 bool write, bool execute, bool foreign)
         |                                           ^~~~
   include/asm-generic/mm_hooks.h:21:43: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
>> arch/openrisc/include/asm/mmu_context.h:21:61: warning: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration
      21 | extern int init_new_context(struct task_struct *tsk, struct mm_struct *mm);
         |                                                             ^~~~~~~~~
>> arch/openrisc/include/asm/mmu_context.h:21:36: warning: 'struct task_struct' declared inside parameter list will not be visible outside of this definition or declaration
      21 | extern int init_new_context(struct task_struct *tsk, struct mm_struct *mm);
         |                                    ^~~~~~~~~~~
   arch/openrisc/include/asm/mmu_context.h:23:36: warning: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration
      23 | extern void destroy_context(struct mm_struct *mm);
         |                                    ^~~~~~~~~
   arch/openrisc/include/asm/mmu_context.h:25:30: warning: 'struct task_struct' declared inside parameter list will not be visible outside of this definition or declaration
      25 |                       struct task_struct *tsk);
         |                              ^~~~~~~~~~~
   arch/openrisc/include/asm/mmu_context.h:24:30: warning: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration
      24 | extern void switch_mm(struct mm_struct *prev, struct mm_struct *next,
         |                              ^~~~~~~~~
>> arch/openrisc/include/asm/mmu_context.h:33:17: error: unknown type name 'pgd_t'
      33 | extern volatile pgd_t *current_pgd[]; /* defined in arch/openrisc/mm/fault.c */
         |                 ^~~~~
>> include/linux/mmu_context.h:40:15: error: unknown type name 'bool'
      40 | static inline bool arch_pgtable_dma_compat(struct mm_struct *mm)
         |               ^~~~
   include/linux/mmu_context.h:7:1: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
       6 | #include <asm/mmu.h>
     +++ |+#include <stdbool.h>
       7 | 
   include/linux/mmu_context.h: In function 'arch_pgtable_dma_compat':
>> include/linux/mmu_context.h:42:16: error: 'true' undeclared (first use in this function)
      42 |         return true;
         |                ^~~~
   include/linux/mmu_context.h:42:16: note: 'true' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
   include/linux/mmu_context.h:42:16: note: each undeclared identifier is reported only once for each function it appears in


vim +/bool +20 include/asm-generic/mm_hooks.h

d6dd61c831226f Jeremy Fitzhardinge 2007-05-02   9  
c10e83f598d080 Thomas Gleixner     2017-12-14 @10  static inline int arch_dup_mmap(struct mm_struct *oldmm,
d6dd61c831226f Jeremy Fitzhardinge 2007-05-02  11  				struct mm_struct *mm)
d6dd61c831226f Jeremy Fitzhardinge 2007-05-02  12  {
c10e83f598d080 Thomas Gleixner     2017-12-14  13  	return 0;
d6dd61c831226f Jeremy Fitzhardinge 2007-05-02  14  }
d6dd61c831226f Jeremy Fitzhardinge 2007-05-02  15  
d6dd61c831226f Jeremy Fitzhardinge 2007-05-02  16  static inline void arch_exit_mmap(struct mm_struct *mm)
d6dd61c831226f Jeremy Fitzhardinge 2007-05-02  17  {
d6dd61c831226f Jeremy Fitzhardinge 2007-05-02  18  }
d6dd61c831226f Jeremy Fitzhardinge 2007-05-02  19  
1b2ee1266ea647 Dave Hansen         2016-02-12 @20  static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,

:::::: The code at line 20 was first introduced by commit
:::::: 1b2ee1266ea647713dbaf44825967c180dfc8d76 mm/core: Do not enforce PKEY permissions on remote mm access

:::::: TO: Dave Hansen <dave.hansen@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
