Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283A7A2D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 01:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739670668; cv=none; b=WnKOKkqRPa1MXP1WjB4Q9rJQQN4od5r+aoNtkM/Wl0WF4gPvzsVmCf3a+JETQtFZw7MFz/+ZSAFabYVDKiiHG/NvYdUe35HIJ0wVmrXX12C60u5luJAQeZOAwe91rr1ASkTkz2GT3fdgVKqSpnCywmfdqpnuRvNO6IuaQImlanI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739670668; c=relaxed/simple;
	bh=yEQOkS1eCacXrjZUrcJcTBypBJdu3OQyX/Iwob66/VI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cP9qToJTFuhPi2K9hxbECyP6+97W1xZz+EK6yywJHGwqe153HVV7tkuJMyysXRNk72C0jyx8rcPR8H+ALGOCtHCAk65F7Qqe/LflInwe14TS12pYkSmmrTh524FmFS4ZYQZN07wyE2nys0sw48b2cTrrclG9yVD+P7BRU7RgCsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=anpWAA9u; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anpWAA9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739670666; x=1771206666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yEQOkS1eCacXrjZUrcJcTBypBJdu3OQyX/Iwob66/VI=;
  b=anpWAA9uT48jsFv5dHDmh/tWOBBkS58CQpEPqHHHV0AQGnDoWtf09mV0
   ift5Sg88fSWkVWJNj+XVd74t0d6eoVg3IEvZEeBdgr+a48HOHSt0Le7+U
   7ZDEey3DSL0A91RpUuJzPA5Z80E2cBGL77185xVhHMahC0RnvTeNA18Ag
   slJGnrNcMUMM0s3QctuWDe/kyWnRm1nabWlkmBNVmdvABxgkL2b3d2d0V
   UBlLy2Dy7srwJEgG0L9kmEaEuar3wCJvx1P2arMY9kVSyRzHZyME6mctp
   FO9tJEJYb8pnNwiaFjmyianqXq5wQAkXt8Lzmc7pJZnQKaYkJwTWlB1FN
   A==;
X-CSE-ConnectionGUID: FB31rSnOQwy7vR/jvaInkA==
X-CSE-MsgGUID: 7dBb99IBQeyUPVX+1OJk3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="50602821"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="50602821"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 17:51:06 -0800
X-CSE-ConnectionGUID: eRhYm7UtS96R3PElfWzHNg==
X-CSE-MsgGUID: DqBIzZsGTl2PmYUH5T++xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119003554"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Feb 2025 17:51:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjToE-001BUZ-05;
	Sun, 16 Feb 2025 01:51:02 +0000
Date: Sun, 16 Feb 2025 09:50:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2831/4011] include/linux/pgtable.h:1074:34:
 warning: parameter 'p4d_a' set but not used
Message-ID: <202502160901.XRtY7OOX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ae0fa3bf0b44c8611d114a9f69985bf451010c3
commit: 62ae45687e43574f6c13158f8b8c5e10d3d22fc4 [2831/4011] drm: ensure drm headers are self-contained and pass kernel-doc
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250216/202502160901.XRtY7OOX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160901.XRtY7OOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160901.XRtY7OOX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/alpha/include/asm/page.h:33:29: error: request for member 'pgd' in something not a structure or union
      33 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/alpha/include/asm/pgtable.h:245:58: note: in expansion of macro 'pud_val'
     245 | extern inline int pud_present(pud_t pud)        { return pud_val(pud) & _PAGE_VALID; }
         |                                                          ^~~~~~~
   arch/alpha/include/asm/pgtable.h:245:37: warning: parameter 'pud' set but not used [-Wunused-but-set-parameter]
     245 | extern inline int pud_present(pud_t pud)        { return pud_val(pud) & _PAGE_VALID; }
         |                               ~~~~~~^~~
   arch/alpha/include/asm/pgtable.h: In function 'pud_clear':
   arch/alpha/include/asm/page.h:33:29: error: request for member 'pgd' in something not a structure or union
      33 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/alpha/include/asm/pgtable.h:246:51: note: in expansion of macro 'pud_val'
     246 | extern inline void pud_clear(pud_t * pudp)      { pud_val(*pudp) = 0; }
         |                                                   ^~~~~~~
   include/linux/pgtable.h: In function 'pmd_off':
   include/linux/pgtable.h:186:38: error: implicit declaration of function 'p4d_offset'; did you mean 'pmd_offset'? [-Wimplicit-function-declaration]
     186 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~
         |                                      pmd_offset
   include/linux/pgtable.h:186:38: error: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     186 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'pmd_off_k':
   include/linux/pgtable.h:191:38: error: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     191 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'pud_same':
   arch/alpha/include/asm/page.h:33:29: error: request for member 'pgd' in something not a structure or union
      33 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1068:16: note: in expansion of macro 'pud_val'
    1068 |         return pud_val(pud_a) == pud_val(pud_b);
         |                ^~~~~~~
   arch/alpha/include/asm/page.h:33:29: error: request for member 'pgd' in something not a structure or union
      33 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1068:34: note: in expansion of macro 'pud_val'
    1068 |         return pud_val(pud_a) == pud_val(pud_b);
         |                                  ^~~~~~~
   include/linux/pgtable.h:1066:34: warning: parameter 'pud_a' set but not used [-Wunused-but-set-parameter]
    1066 | static inline int pud_same(pud_t pud_a, pud_t pud_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1066:47: warning: parameter 'pud_b' set but not used [-Wunused-but-set-parameter]
    1066 | static inline int pud_same(pud_t pud_a, pud_t pud_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'p4d_same':
   arch/alpha/include/asm/page.h:33:29: error: request for member 'pgd' in something not a structure or union
      33 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1076:16: note: in expansion of macro 'p4d_val'
    1076 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                ^~~~~~~
   arch/alpha/include/asm/page.h:33:29: error: request for member 'pgd' in something not a structure or union
      33 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1076:34: note: in expansion of macro 'p4d_val'
    1076 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                                  ^~~~~~~
>> include/linux/pgtable.h:1074:34: warning: parameter 'p4d_a' set but not used [-Wunused-but-set-parameter]
    1074 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                            ~~~~~~^~~~~
>> include/linux/pgtable.h:1074:47: warning: parameter 'p4d_b' set but not used [-Wunused-but-set-parameter]
    1074 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pgd_none_or_clear_bad':
   include/linux/pgtable.h:1236:13: error: implicit declaration of function 'pgd_none'; did you mean 'pud_none'? [-Wimplicit-function-declaration]
    1236 |         if (pgd_none(*pgd))
         |             ^~~~~~~~
         |             pud_none
   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8:
   include/linux/pgtable.h:1238:22: error: implicit declaration of function 'pgd_bad'; did you mean 'pud_bad'? [-Wimplicit-function-declaration]
    1238 |         if (unlikely(pgd_bad(*pgd))) {
         |                      ^~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^


vim +/p4d_a +1074 include/linux/pgtable.h

^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds 2005-04-16  1072  
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams   2018-12-04  1073  #ifndef __HAVE_ARCH_P4D_SAME
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams   2018-12-04 @1074  static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams   2018-12-04  1075  {
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams   2018-12-04  1076  	return p4d_val(p4d_a) == p4d_val(p4d_b);
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams   2018-12-04  1077  }
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams   2018-12-04  1078  #endif
0cebbb60f759a7 include/asm-generic/pgtable.h Dan Williams   2018-12-04  1079  

:::::: The code at line 1074 was first introduced by commit
:::::: 0cebbb60f759a709dabb3c87b9704f9844878850 generic/pgtable: Introduce {p4d,pgd}_same()

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
