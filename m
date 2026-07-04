Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108DE2ECD3A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 04:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783140061; cv=none; b=iGK1/Fo13qQNj8OCYOMWd8u37bK8IEttJJ3LdRjI2OT0Eeaq8AHxoY9a9aHg8+DeR7i+r9cmcudGJATcRJyebiqTziJge7H/kyJOGg6wIbFaoEKLHjqK7i/Y7n19se0a/jXx4A/GurqiFVaQyua+n59vek9QOD2TL7YeJhLYfe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783140061; c=relaxed/simple;
	bh=E7JFA8vdrqH2Lm588bsKXky+EBcydc8nTplcFXME7WQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F+kAAjYo8Fqgq7Ts/Whqn/HwD6AwQSIBDFhiEyDOnWz4Fk/8otoiTWRMxay3BV6yr18ki0l/UA9CISSwSiKBix4s5+1b+CHUUvfTNhIN8PtgrA4uEWHp//tPR32VyUbCZJVJd+lIKqZ5kt4SMjMVjflWD/v8OvA9h9NsuQWQYp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGnTopB6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGnTopB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783140056; x=1814676056;
  h=date:from:to:cc:subject:message-id;
  bh=E7JFA8vdrqH2Lm588bsKXky+EBcydc8nTplcFXME7WQ=;
  b=jGnTopB60TQSmzC+jwrKlTiSTTgyIaM9XDxI3t39TCMLp970QFaZhkbW
   UQgLOhsAfeRFuor8/E1Kuv1uCZswJxJWK04IuG11Oz206pcvKPHABNTrI
   HrstSNmLstXK8+UTmw4/Q5thpJgUhY5VKEj4lVjFhULok0Aow2UjRxPgd
   fjQaFXOpcJMpBS/mi1B9fsWGxqUqMPnEZKFB5XzIwG/KgfmVQMF81wYZv
   Xzv+xD5uhZzWbBEaB1noH3eQo2TDF4VeMG3isjtNLLPWDZkOeNxFgLdV2
   b9PoHz8WAlVYVT4ii9+Twhi2P12dzcQsTH0FdIsgyc4keZXsi573dqIb3
   w==;
X-CSE-ConnectionGUID: ddtyAsDNRFmFrkfIoQVnpA==
X-CSE-MsgGUID: KJUU5VQsT9WYdCbSoTK1DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="71394243"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="71394243"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 21:40:55 -0700
X-CSE-ConnectionGUID: 4biHdMIBS9C3SdA0rjlXbw==
X-CSE-MsgGUID: JbrRVJqJR1y+4y/bTh/mGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="248791145"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jul 2026 21:40:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfsBL-00000000Crr-1iaW;
	Sat, 04 Jul 2026 04:40:47 +0000
Date: Sat, 04 Jul 2026 12:40:20 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folded_pgtable 13/13]
 include/asm-generic/pgtable-nop4d.h:46:43: error: implicit declaration of
 function 'pgd_val'; did you mean 'pgd_bad'?
Message-ID: <202607041241.YlcPf6F0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   898b37f4865d94ff198bb62dfe2517a6d1b7d44e
commit: 898b37f4865d94ff198bb62dfe2517a6d1b7d44e [13/13] mm/pgtable: catch abuse of folded dummy pgd_t/p4d_t/pud_t
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260704/202607041241.YlcPf6F0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041241.YlcPf6F0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041241.YlcPf6F0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   include/asm-generic/pgtable-nop4d.h: In function 'p4d_offset':
>> include/asm-generic/pgtable-nop4d.h:46:43: error: implicit declaration of function 'pgd_val'; did you mean 'pgd_bad'? [-Wimplicit-function-declaration]
      46 |         BUILD_BUG_ON(__builtin_constant_p(pgd_val(*pgd)));
         |                                           ^~~~~~~
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
   include/asm-generic/pgtable-nop4d.h:46:9: note: in expansion of macro 'BUILD_BUG_ON'
      46 |         BUILD_BUG_ON(__builtin_constant_p(pgd_val(*pgd)));
         |         ^~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +46 include/asm-generic/pgtable-nop4d.h

    43	
    44	static __always_inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
    45	{
  > 46		BUILD_BUG_ON(__builtin_constant_p(pgd_val(*pgd)));
    47		return (p4d_t *)pgd;
    48	}
    49	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
