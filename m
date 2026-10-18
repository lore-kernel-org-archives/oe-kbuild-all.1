Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39390242D62
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 19:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351045; cv=none; b=DfgZavGkW0twfh29dRY8fzy+cI6nzVFXng8X//DaRuvmUAc+viT9Xio7qzhAfL7oveETP0A1Vs5L4rxO5gnO+R3rQ/RzxHv0eWe5jxrt0t5nQzMGrrtIlTtsahjOs9LMeGvY5BSqBNJPMCW8W4zJVh6pl+ykPAO8c49YDrNeW5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351045; c=relaxed/simple;
	bh=vGyxblejnL/qNUSmPG/7TYuRuDZtCQCy87QQEWTFU40=;
	h=Date:From:To:Cc:Subject:Message-ID; b=icXaEQFAqrwDe48Bb3f82tVqUMwbW2Mf97Pz2utQPlMbLBV/0dn0lAf2eAIaoejS7q5VwmEwHJIQP6e9pBGXvy+ndqlpPb6pj7n/d2mEQ5+zqQNaOXnS4JyDdBUbYOLFDT+fUygSkD8zDwQGG6TzfBSKbtORwpUUqv6eLS7rXkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dusEBxRe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dusEBxRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792351044; x=1823887044;
  h=date:from:to:cc:subject:message-id;
  bh=vGyxblejnL/qNUSmPG/7TYuRuDZtCQCy87QQEWTFU40=;
  b=dusEBxRecd8N1vutcJoDfVaEHxj71tCheB+BTD82B9kL6IOVK0DMHDOT
   TPcC/1ocndv8HMHA4fVZV0Ga2cJ2HihhpwEseZLSOJ3VPpVdLXpLiqFqr
   FVWoWe1wSFZA5LJ5bQPxqjDcax/q3vd6vABBCQxMygN5Fmb+HjOcXkoFR
   UJKAKieZvDlI8jPqOwTSzX3Anj4pGiqRCyhVmFWgnNKJz6bl+/FFOYCwB
   rXlwkjRwkaGkiz248cqc8Tm1llI0QwOWK4DO+bhpj3b6IP25RcG8uRKut
   2t9BJ52EzkHvmEsjEtbxE6ZGnByCNRrXVHSEVuB5A8DE3sStjH73BkoZI
   A==;
X-CSE-ConnectionGUID: 7Luo2uH1R2OmCuhgrzW4uA==
X-CSE-MsgGUID: zXVLOpBGQgCCxO17vkRsWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="930162"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="930162"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 12:17:23 -0700
X-CSE-ConnectionGUID: g6eqGKO+Sl+8HWoQpxqw0g==
X-CSE-MsgGUID: Ikcc+jvWQ/2d+DvcuJMAig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2418221"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Oct 2026 12:17:21 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIWNi-00000000KjI-3JbL;
	Sun, 18 Oct 2026 19:17:18 +0000
Date: Mon, 19 Oct 2026 03:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss 24/32] arch/x86/mm/cpu_entry_area.c:97:16:
 warning: format '%llx' expects argument of type 'long long unsigned int', but
 argument 4 has type 'phys_addr_t' {aka 'unsigned int'}
Message-ID: <202610190326.fXFHYXZL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss
head:   1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d
commit: 2c3b2196343ffa5e0389c9a104fe9c00e0875799 [24/32] cea-estacks-shadows-debug1
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20261019/202610190326.fXFHYXZL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190326.fXFHYXZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190326.fXFHYXZL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:243,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from arch/x86/mm/cpu_entry_area.c:3:
   arch/x86/mm/cpu_entry_area.c: In function 'cea_set_pte':
>> arch/x86/mm/cpu_entry_area.c:97:16: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
      97 |         printk("%s(0x%016lx, 0x%016llx, 0x%016lx)\n", __func__, va, pa, pgprot_val(flags));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                ~~
         |                                                                     |
         |                                                                     phys_addr_t {aka unsigned int}
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   arch/x86/mm/cpu_entry_area.c:97:9: note: in expansion of macro 'printk'
      97 |         printk("%s(0x%016lx, 0x%016llx, 0x%016lx)\n", __func__, va, pa, pgprot_val(flags));
         |         ^~~~~~
   arch/x86/mm/cpu_entry_area.c:97:38: note: format string is defined here
      97 |         printk("%s(0x%016lx, 0x%016llx, 0x%016lx)\n", __func__, va, pa, pgprot_val(flags));
         |                                ~~~~~~^
         |                                      |
         |                                      long long unsigned int
         |                                %016x


vim +97 arch/x86/mm/cpu_entry_area.c

    78	
    79	void cea_set_pte(void *cea_vaddr, phys_addr_t pa, pgprot_t flags)
    80	{
    81		unsigned long va = (unsigned long) cea_vaddr;
    82		pte_t pte = pfn_pte(pa >> PAGE_SHIFT, flags);
    83	
    84		/*
    85		 * The cpu_entry_area is shared between the user and kernel
    86		 * page tables.  All of its ptes can safely be global.
    87		 * _PAGE_GLOBAL gets reused to help indicate PROT_NONE for
    88		 * non-present PTEs, so be careful not to set it in that
    89		 * case to avoid confusion.
    90		 */
    91		if (boot_cpu_has(X86_FEATURE_PGE) &&
    92		    (pgprot_val(flags) & _PAGE_PRESENT))
    93			pte = pte_set_flags(pte, _PAGE_GLOBAL);
    94	
    95		set_pte_vaddr(va, pte);
    96	
  > 97		printk("%s(0x%016lx, 0x%016llx, 0x%016lx)\n", __func__, va, pa, pgprot_val(flags));
    98	}
    99	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
