Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944DF31355C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 04:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484382; cv=none; b=dvSJPOPrrIURLgvgppQ3uSFxs1cvAmVHI/3SlDaYyVYiBuZfJ+arvM0nIK60nBDN552mduvEVwp+ENclq/VuMVxXfS/S9z81XgXMnPOeuSx/PLQHjoZPUsdUVtPwOYBt/0r+vX3f8wmTx/8X9AdM7d7l4DMc6A/1VoXPTAx5Ia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484382; c=relaxed/simple;
	bh=0eKQVml0TaItxopUMWFBS5QiXZWm70ce8c3gCqwlplk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qzyFccIMu2LhQ4MeHqx39rKpefgv81MC4ymRqPwMXMERrEw6WSd/Ra3Z5//+9un7HyAlDlG+CSbAuPquG3fK9uRa13f869/I0iIzBsS8C19WFCq5WUJt05/PrdmpXN4rwiEmwnoX1XszZ/WFEtqwu6g+AVBCCMFzmse4EN06Nmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lk0p7zAD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lk0p7zAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783484380; x=1815020380;
  h=date:from:to:cc:subject:message-id;
  bh=0eKQVml0TaItxopUMWFBS5QiXZWm70ce8c3gCqwlplk=;
  b=Lk0p7zADYXouJ8eom9qRzcN2EDYFVHjkM3ZScgA3dWwRrJiABR4EL23C
   V0Xs8LUGg76IzStI9VYVDapUczoaLFQWS6CZ12HrrpFoEJKS4RSzqoVzh
   5EQySyLCjxqUKls6s707Mt972kVmoQovlul7SKXZbIRPACyiV6hQfWiId
   WgaPb5SyTaUv2UjIS2iK3XTWxl+rUsJ1utWWYBjxcxwOVHlFMt5I+hmCW
   9DkYBcI7yb+dy3k9f0m0yw+FS0y3955TZKYkGlMUYcT4PYmJ2P5ZEwdeW
   3S0+LwdpqYrdxHlYTBUgfXfMqmRNVU7vgYq255nGsTNIGfi28AdfFlalA
   w==;
X-CSE-ConnectionGUID: KdaE9kEqSqylzmf0ZI5d/Q==
X-CSE-MsgGUID: hvKdu8sjSKuRuKg4O/gYaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="95655889"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95655889"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 21:19:40 -0700
X-CSE-ConnectionGUID: slO4xKDZQmClNG1Mqwp1wA==
X-CSE-MsgGUID: C+CiTwivQqyogM6I2CaRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253086116"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Jul 2026 21:19:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whJkz-00000000G1t-1vD4;
	Wed, 08 Jul 2026 04:19:33 +0000
Date: Wed, 08 Jul 2026 12:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folded_pgtable 28/28]
 include/asm-generic/pgtable-nopmd.h:60:25: error: invalid type argument of
 unary '*' (have 'pud_t')
Message-ID: <202607081246.Z9NhVAt6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   710c0f29eb829f67c4c0d1c2a3f764b286282229
commit: 710c0f29eb829f67c4c0d1c2a3f764b286282229 [28/28] mm/pgtable: catch abuse of folded dummy pgd_t/p4d_t/pud_t
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260708/202607081246.Z9NhVAt6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081246.Z9NhVAt6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081246.Z9NhVAt6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/nios2/mm/fault.c: In function 'do_page_fault':
   arch/nios2/mm/fault.c:231:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'p4d_k'
     231 |                 p4d_t *p4dp, *p4dp_k  p4d_k;
         |                                       ^~~~~
   arch/nios2/mm/fault.c:245:17: error: 'p4dp_k' undeclared (first use in this function); did you mean 'pmdp_k'?
     245 |                 p4dp_k = p4d_offset(pgdp_k, address);
         |                 ^~~~~~
         |                 pmdp_k
   arch/nios2/mm/fault.c:245:17: note: each undeclared identifier is reported only once for each function it appears in
   arch/nios2/mm/fault.c:246:17: error: 'p4d_k' undeclared (first use in this function); did you mean 'pmd_k'?
     246 |                 p4d_k = p4dp_get(p4dp_k);
         |                 ^~~~~
         |                 pmd_k
   arch/nios2/mm/fault.c:252:17: error: 'pud' undeclared (first use in this function); did you mean 'pudp'?
     252 |                 pud = pud_offset(p4dp, address);
         |                 ^~~
         |                 pudp
   In file included from <command-line>:
>> include/asm-generic/pgtable-nopmd.h:60:25: error: invalid type argument of unary '*' (have 'pud_t')
      60 |         pud_check_dummy(*(pudp));                                       \
         |                         ^~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:51:30: note: in expansion of macro 'BUILD_BUG_ON'
      51 | #define pud_check_dummy(pud) BUILD_BUG_ON(__builtin_constant_p(pud_val(pud)))
         |                              ^~~~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:67:50: note: in expansion of macro 'pgd_val'
      67 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:74:50: note: in expansion of macro 'p4d_val'
      74 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:51:64: note: in expansion of macro 'pud_val'
      51 | #define pud_check_dummy(pud) BUILD_BUG_ON(__builtin_constant_p(pud_val(pud)))
         |                                                                ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:60:9: note: in expansion of macro 'pud_check_dummy'
      60 |         pud_check_dummy(*(pudp));                                       \
         |         ^~~~~~~~~~~~~~~
   arch/nios2/mm/fault.c:261:26: note: in expansion of macro 'pmd_offset'
     261 |                 pmdp_k = pmd_offset(pud_k, address);
         |                          ^~~~~~~~~~
   In file included from arch/nios2/include/asm/pgtable.h:25,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/mm/fault.c:22:
>> arch/nios2/mm/fault.c:261:37: error: incompatible type for argument 1 of '__pmd_offset'
     261 |                 pmdp_k = pmd_offset(pud_k, address);
         |                                     ^~~~~
         |                                     |
         |                                     pud_t
   include/asm-generic/pgtable-nopmd.h:61:22: note: in definition of macro 'pmd_offset'
      61 |         __pmd_offset(pudp, address);                                    \
         |                      ^~~~
   include/asm-generic/pgtable-nopmd.h:53:51: note: expected 'pud_t *' but argument is of type 'pud_t'
      53 | static __always_inline pmd_t *__pmd_offset(pud_t *pudp, unsigned long address)
         |                                            ~~~~~~~^~~~


vim +60 include/asm-generic/pgtable-nopmd.h

    57	
    58	#define pmd_offset(pudp, address)					\
    59	({									\
  > 60		pud_check_dummy(*(pudp));					\
    61		__pmd_offset(pudp, address);					\
    62	})
    63	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
