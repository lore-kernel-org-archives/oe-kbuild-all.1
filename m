Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233D028FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 03:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712977780; cv=none; b=GLemibTBNEi+UEcS9EFSWnJmrbEawU8f8wxfY60ak0M8fSJn3iM6oWnGVseaeogEQTIkMUu/LyaDCUFMbp2bqBBf2bW6pyPaPcnFUa0ngS8Q68UGZCQv6MPqZ1+WUEzMTa3wXVHDojArmFo2O9+2jXCMsbadp0qkWL2Y6pzk3+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712977780; c=relaxed/simple;
	bh=e6FHh9eebHxjAxZDH4cv8d5d8AxKufWTkLEt/OgDe9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ku/IN+KZRmfINaP4BwtToYQnvs9XkOuTkLNMVywGtYFOtU5sV+Ihaq68X/iDlvASPGG3YvzSK56Y28aO+A9MeGPAARdxjBo20b0awOA7KnXkxnFUmzhJnuAYJNPokIWGxYkH2GkF+n8HFP2v9XLM+hSGVj4qvVfpeAQ9imZPI0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yd8804Np; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yd8804Np"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712977778; x=1744513778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e6FHh9eebHxjAxZDH4cv8d5d8AxKufWTkLEt/OgDe9s=;
  b=Yd8804NpzXxYCuHHDXJ3aA3Ps7nXmQbHC2FkOVfn+tAYMU0sTNZaWK23
   lbXpT6F85mdX7hDnbHW6mFzk79Kb0dhB6gETQtS0cfa/2+Rc+QQwHujJV
   Enjlh++MEEU90IZV3Ag3zVdWMard8qTq8iB5QQZgA1puzy10RgsX8o1Rl
   fwQFBi2E1oi18uDiLCxSnVJS9coqBnHBfTsfYcssjLEQqTW3KHsAjuTOr
   cYhekhj+D2ucOyUiN1a8zSqFSP5egqv3RNMhSifZFlcncfAPug7+FJQT6
   zVhXNfS5x43JAIrsqpQUv2oSfA7ueNai5Cab/FUSRq3M+I7ouZWllm+sk
   w==;
X-CSE-ConnectionGUID: /c5Hbq+KRmuqpVI8LzTcwQ==
X-CSE-MsgGUID: gUsGAF9/TjypzkU1dkhT3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="25964386"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="25964386"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 20:09:37 -0700
X-CSE-ConnectionGUID: 8IxPQ/vuQOaOShmTFnWMaA==
X-CSE-MsgGUID: 3teSiEaKQ26IgxU8mZxVmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="21897457"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 12 Apr 2024 20:09:36 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvTlY-0001F0-1V;
	Sat, 13 Apr 2024 03:09:27 +0000
Date: Sat, 13 Apr 2024 11:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:bhi-fixes 3/4] include/linux/mmzone.h:1854:40: error: too
 few arguments to function call, expected 2, have 1
Message-ID: <202404131043.umAkZOMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git bhi-fixes
head:   37c4996142ca475889b13c1aaede6a24140c5ed7
commit: 7c0ac333f0ddd60b0b6e5de7210a903fd22e7703 [3/4] x86/bugs: Remove support for Spectre v2 LFENCE "retpolines"
config: x86_64-randconfig-161-20240413 (https://download.01.org/0day-ci/archive/20240413/202404131043.umAkZOMv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404131043.umAkZOMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131043.umAkZOMv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:49:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   arch/x86/include/asm/tsc.h:26:3: error: expected ')'
      26 |                 return 0;
         |                 ^
   arch/x86/include/asm/tsc.h:24:5: note: to match this '('
      24 |         if (!IS_ENABLED(CONFIG_X86_TSC) &&
         |            ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:49:
   In file included from arch/x86/include/asm/uprobes.h:13:
   In file included from include/linux/notifier.h:16:
   In file included from include/linux/srcu.h:21:
   In file included from include/linux/workqueue.h:9:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   arch/x86/include/asm/timex.h:12:3: error: expected ')'
      12 |                 return random_get_entropy_fallback();
         |                 ^
   arch/x86/include/asm/timex.h:10:5: note: to match this '('
      10 |         if (!IS_ENABLED(CONFIG_X86_TSC) &&
         |            ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1854:20: warning: relational comparison result unused [-Wunused-comparison]
    1854 |         if (unlikely(root >= NR_SECTION_ROOTS))
         |             ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^~
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1854:40: error: too few arguments to function call, expected 2, have 1
    1854 |         if (unlikely(root >= NR_SECTION_ROOTS))
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
>> include/linux/mmzone.h:1855:3: error: expected ')'
    1855 |                 return NULL;
         |                 ^
   include/linux/mmzone.h:1854:5: note: to match this '('
    1854 |         if (unlikely(root >= NR_SECTION_ROOTS))
         |            ^
   include/linux/mmzone.h:2017:3: error: expected ')'
    2017 |                 return 0;
         |                 ^
   include/linux/mmzone.h:2016:5: note: to match this '('
    2016 |         if (pfn_to_section_nr(pfn) >= NR_MEM_SECTIONS)
         |            ^
   include/linux/mmzone.h:2038:3: error: expected ')'
    2038 |                 return 0;
         |                 ^
   include/linux/mmzone.h:2037:5: note: to match this '('
    2037 |         if (pfn_to_section_nr(pfn) >= NR_MEM_SECTIONS)
         |            ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:218:
   In file included from include/linux/kasan.h:34:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/x86/include/asm/pgtable.h:21:
   arch/x86/include/asm/pkru.h:38:3: error: expected ')'
      38 |                 return rdpkru();
         |                 ^
   arch/x86/include/asm/pkru.h:37:5: note: to match this '('
      37 |         if (cpu_feature_enabled(X86_FEATURE_OSPKE))
         |            ^
   arch/x86/include/asm/pkru.h:45:3: error: expected ')'
      45 |                 return;
         |                 ^
   arch/x86/include/asm/pkru.h:44:5: note: to match this '('
      44 |         if (!cpu_feature_enabled(X86_FEATURE_OSPKE))
         |            ^
   arch/x86/include/asm/pkru.h:57:3: error: expected ')'
      57 |                 return;
         |                 ^
   arch/x86/include/asm/pkru.h:56:5: note: to match this '('
      56 |         if (!cpu_feature_enabled(X86_FEATURE_OSPKE))
         |            ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:218:
   In file included from include/linux/kasan.h:34:
   In file included from include/linux/pgtable.h:6:
   arch/x86/include/asm/pgtable.h:135:67: error: expected ')'
     135 |                (pte_flags(pte) & (_PAGE_RW | _PAGE_DIRTY)) == _PAGE_DIRTY;
         |                                                                          ^
   arch/x86/include/asm/pgtable.h:134:9: note: to match this '('
     134 |         return cpu_feature_enabled(X86_FEATURE_SHSTK) &&
         |                ^
   arch/x86/include/asm/cpufeature.h:144:2: note: expanded from macro 'cpu_feature_enabled'
     144 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:218:
   In file included from include/linux/kasan.h:34:
   In file included from include/linux/pgtable.h:6:
   arch/x86/include/asm/pgtable.h:153:34: error: expected ')'
     153 |                (_PAGE_DIRTY | _PAGE_PSE);
         |                                         ^
   arch/x86/include/asm/pgtable.h:151:9: note: to match this '('
     151 |         return cpu_feature_enabled(X86_FEATURE_SHSTK) &&
         |                ^
   arch/x86/include/asm/cpufeature.h:144:2: note: expanded from macro 'cpu_feature_enabled'
     144 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:218:
   In file included from include/linux/kasan.h:34:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/x86/include/asm/pgtable.h:938:
>> arch/x86/include/asm/pgtable_64.h:59:30: error: expected ')'
      59 |         return !pgtable_l5_enabled();
         |                                     ^
   arch/x86/include/asm/pgtable_64.h:59:10: note: to match this '('
      59 |         return !pgtable_l5_enabled();
         |                 ^
   arch/x86/include/asm/pgtable_64_types.h:37:30: note: expanded from macro 'pgtable_l5_enabled'
      37 | #define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_LA57)
         |                              ^
   arch/x86/include/asm/cpufeature.h:144:2: note: expanded from macro 'cpu_feature_enabled'
     144 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:218:
   In file included from include/linux/kasan.h:34:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/x86/include/asm/pgtable.h:938:
>> arch/x86/include/asm/pgtable_64.h:146:6: warning: '&&' within '||' [-Wlogical-op-parentheses]
     146 |         if (pgtable_l5_enabled() ||
         |             ^~~~~~~~~~~~~~~~~~~~ ~~
   arch/x86/include/asm/pgtable_64_types.h:37:30: note: expanded from macro 'pgtable_l5_enabled'
      37 | #define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_LA57)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cpufeature.h:144:29: note: expanded from macro 'cpu_feature_enabled'
     144 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64.h:146:6: note: place parentheses around the '&&' expression to silence this warning
     146 |         if (pgtable_l5_enabled() ||
         |             ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64_types.h:37:30: note: expanded from macro 'pgtable_l5_enabled'
      37 | #define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_LA57)
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cpufeature.h:144:29: note: expanded from macro 'cpu_feature_enabled'
     144 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:218:
   In file included from include/linux/kasan.h:34:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/x86/include/asm/pgtable.h:938:
   arch/x86/include/asm/pgtable_64.h:147:59: error: expected ')'
     147 |             !IS_ENABLED(CONFIG_MITIGATION_PAGE_TABLE_ISOLATION)) {
         |                                                                  ^
   arch/x86/include/asm/pgtable_64.h:146:5: note: to match this '('
     146 |         if (pgtable_l5_enabled() ||
         |            ^
   arch/x86/include/asm/pgtable_64.h:267:3: error: expected ')'
     267 |                 return false;
         |                 ^
   arch/x86/include/asm/pgtable_64.h:266:5: note: to match this '('
     266 |         if (end >> __VIRTUAL_MASK_SHIFT)
         |            ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:218:
   In file included from include/linux/kasan.h:34:
   In file included from include/linux/pgtable.h:6:
   arch/x86/include/asm/pgtable.h:1143:3: error: expected ')'
    1143 |                 return 1;
         |                 ^
   arch/x86/include/asm/pgtable.h:1142:5: note: to match this '('
    1142 |         if (!pgtable_l5_enabled())
         |            ^
   arch/x86/include/asm/pgtable.h:1162:3: error: expected ')'
    1162 |                 return (p4d_t *)pgd;
         |                 ^
   arch/x86/include/asm/pgtable.h:1161:5: note: to match this '('
    1161 |         if (!pgtable_l5_enabled())
         |            ^
   arch/x86/include/asm/pgtable.h:1171:3: error: expected ')'
    1171 |                 return 0;
         |                 ^
   arch/x86/include/asm/pgtable.h:1170:5: note: to match this '('
    1170 |         if (!pgtable_l5_enabled())
         |            ^
   arch/x86/include/asm/pgtable.h:1182:3: error: expected ')'
    1182 |                 return 0;
         |                 ^
   arch/x86/include/asm/pgtable.h:1181:5: note: to match this '('
    1181 |         if (!pgtable_l5_enabled())
         |            ^
   arch/x86/include/asm/pgtable.h:1686:48: error: expected ')'
    1686 |         return !cpu_feature_enabled(X86_FEATURE_XENPV);
         |                                                       ^
   arch/x86/include/asm/pgtable.h:1686:10: note: to match this '('
    1686 |         return !cpu_feature_enabled(X86_FEATURE_XENPV);
         |                 ^
   arch/x86/include/asm/cpufeature.h:144:2: note: expanded from macro 'cpu_feature_enabled'
     144 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:


vim +1854 include/linux/mmzone.h

f1eca35a0dc7cb Dan Williams   2019-07-18  1849  
29751f6991e845 Andy Whitcroft 2005-06-23  1850  static inline struct mem_section *__nr_to_section(unsigned long nr)
29751f6991e845 Andy Whitcroft 2005-06-23  1851  {
a431dbbc540532 Waiman Long    2022-04-08  1852  	unsigned long root = SECTION_NR_TO_ROOT(nr);
a431dbbc540532 Waiman Long    2022-04-08  1853  
a431dbbc540532 Waiman Long    2022-04-08 @1854  	if (unlikely(root >= NR_SECTION_ROOTS))
a431dbbc540532 Waiman Long    2022-04-08 @1855  		return NULL;
a431dbbc540532 Waiman Long    2022-04-08  1856  

:::::: The code at line 1854 was first introduced by commit
:::::: a431dbbc540532b7465eae4fc8b56a85a9fc7d17 mm/sparsemem: fix 'mem_section' will never be NULL gcc 12 warning

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
