Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264BD13E04C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 23:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722556259; cv=none; b=Dt/A2z7EN5tk9Wvnh15TdJa/OawueiWdBsIWulkZFQgDtcAeOkyY6JyVdBAnzpRkZXc3KL7+zcTayxwlOCXSsOs0qqAOZHb5zZeGJ//HvAWPf6QGAQJ6l3aG86q8mL+ABUnHXu/XG6n7uHV10UFBevWvizbAOczw8luKFIbThs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722556259; c=relaxed/simple;
	bh=Le5Ahh5wkmfGpmRUp+9pfLFyi7OCI/C8CHgbG2na/2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=giiq5JFKzCL85nwN8ZwC9ITb3RkSxCoQgMrQjgVKmuv4bWJhmD7XVeAwWLSFqBA8iEzj6FEwa5RkGoTxEu5uJBUWiS9XCs8+R+AsdQt7ZtbPriVlFfsot1ZpGKXS3P2znXTyuadAxQVoNKmjFYKaFD1RZRLSkpW3w1APFcwj2Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPJH0m/c; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPJH0m/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722556257; x=1754092257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Le5Ahh5wkmfGpmRUp+9pfLFyi7OCI/C8CHgbG2na/2E=;
  b=cPJH0m/cGYIXpKmfhKRyMMnTMPXG5peEobmQoBI48sJWyswebb1i3l4p
   pw9oNrIlEpqt7JJMS4RcWUfPTb2NbluYoxZyJqli0yrABFEsJDAWJaYCR
   wmQJ4tOO/P6K0bDhbbDovLQk1S1FC5+Zv6VZgqC9wVvUC7DzDLUsXuuBv
   UfnzUh8iy9dsTZHAIRMz9BjrsRAy+G40QAnp8qWL1AT8NgxJkwR+sfEKA
   sR64HQUFvVdzFK2xIGZt25is14AfkyRiQXbd/SC+i6YOffYlPbkFl035A
   QDdViX7Xmml1iF8SgOVLJiLS+q72/29Otnabn9IX/J5jzsK5TI2e92NAc
   g==;
X-CSE-ConnectionGUID: veCgKc8mSBmgQ3VaOudKHg==
X-CSE-MsgGUID: g3Iluj9TQ2qRGLmZrKv16w==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20726397"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="20726397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 16:50:57 -0700
X-CSE-ConnectionGUID: c9JESox/SGK5QH0V4a2xwQ==
X-CSE-MsgGUID: gsf6iYJuSY+WhPv3rKOrsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="55136267"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Aug 2024 16:50:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZfZL-000w96-3A;
	Thu, 01 Aug 2024 23:50:51 +0000
Date: Fri, 2 Aug 2024 07:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 6/11]
 arch/x86/include/asm/alternative.h:208:9: error: expected ':' or ')' before
 'FAKE_SYMBOL'
Message-ID: <202408020735.LGzleOqT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   9792deb86d2136e6f92b7b085b3bcefb1d3c63c9
commit: 2d3b706310cf49738d509258593dcd2e5a7251d5 [6/11] x86/alternative: Create symbols for special section entries
config: i386-buildonly-randconfig-001-20240802 (https://download.01.org/0day-ci/archive/20240802/202408020735.LGzleOqT-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020735.LGzleOqT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408020735.LGzleOqT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:34,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
   arch/x86/include/asm/arch_hweight.h: In function '__arch_hweight32':
>> arch/x86/include/asm/alternative.h:208:9: error: expected ':' or ')' before 'FAKE_SYMBOL'
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |         ^~~~~~~~~~~
   arch/x86/include/asm/alternative.h:228:9: note: in expansion of macro 'ALTINSTR_ENTRY'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/arch_hweight.h:19:14: note: in expansion of macro 'ALTERNATIVE'
      19 |         asm (ALTERNATIVE("call __sw_hweight32", "popcntl %1, %0", X86_FEATURE_POPCNT)
         |              ^~~~~~~~~~~
>> arch/x86/include/asm/alternative.h:208:29: error: invalid suffix "f" on integer constant
     208 |         FAKE_SYMBOL(__alt_, 681f)                                             \
         |                             ^~~~
   arch/x86/include/asm/alternative.h:228:9: note: in expansion of macro 'ALTINSTR_ENTRY'
     228 |         ALTINSTR_ENTRY(ft_flags, 1)                                     \
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/arch_hweight.h:19:14: note: in expansion of macro 'ALTERNATIVE'
      19 |         asm (ALTERNATIVE("call __sw_hweight32", "popcntl %1, %0", X86_FEATURE_POPCNT)
         |              ^~~~~~~~~~~
   In file included from <command-line>:
   arch/x86/include/asm/alternative.h:161:41: error: invalid suffix "f" on integer constant
     161 | #define __e_replacement(num)    __PASTE(665, num)
         |                                         ^~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   arch/x86/include/asm/alternative.h:218:35: note: in expansion of macro '__PASTE'
     218 |         FAKE_SYMBOL(__alt_instr_, __PASTE(__e_replacement(num), f))             \
         |                                   ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   arch/x86/include/asm/alternative.h:161:33: note: in expansion of macro '__PASTE'
     161 | #define __e_replacement(num)    __PASTE(665, num)
         |                                 ^~~~~~~
   arch/x86/include/asm/alternative.h:218:43: note: in expansion of macro '__e_replacement'
     218 |         FAKE_SYMBOL(__alt_instr_, __PASTE(__e_replacement(num), f))             \
         |                                           ^~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:231:9: note: in expansion of macro 'ALTINSTR_REPLACEMENT'
     231 |         ALTINSTR_REPLACEMENT(newinstr, 1)                               \
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/arch_hweight.h:19:14: note: in expansion of macro 'ALTERNATIVE'
      19 |         asm (ALTERNATIVE("call __sw_hweight32", "popcntl %1, %0", X86_FEATURE_POPCNT)
         |              ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1 shuffle=1934482830
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2 shuffle=1934482830
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=1934482830
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=1934482830
   make: Target 'prepare' not remade because of errors.


vim +208 arch/x86/include/asm/alternative.h

   184	
   185	/*
   186	 * Pad the second replacement alternative with additional NOPs if it is
   187	 * additionally longer than the first replacement alternative.
   188	 */
   189	#define OLDINSTR_2(oldinstr, num1, num2) \
   190		"# ALT: oldinstr2\n"									\
   191		"661:\n\t" oldinstr "\n662:\n"								\
   192		"# ALT: padding2\n"									\
   193		".skip -((" alt_max_short(alt_rlen(num1), alt_rlen(num2)) " - (" alt_slen ")) > 0) * "	\
   194			"(" alt_max_short(alt_rlen(num1), alt_rlen(num2)) " - (" alt_slen ")), 0x90\n"	\
   195		alt_end_marker ":\n"
   196	
   197	#define OLDINSTR_3(oldinsn, n1, n2, n3)								\
   198		"# ALT: oldinstr3\n"									\
   199		"661:\n\t" oldinsn "\n662:\n"								\
   200		"# ALT: padding3\n"									\
   201		".skip -((" alt_max_short(alt_max_short(alt_rlen(n1), alt_rlen(n2)), alt_rlen(n3))	\
   202			" - (" alt_slen ")) > 0) * "							\
   203			"(" alt_max_short(alt_max_short(alt_rlen(n1), alt_rlen(n2)), alt_rlen(n3))	\
   204			" - (" alt_slen ")), 0x90\n"							\
   205		alt_end_marker ":\n"
   206	
   207	#define ALTINSTR_ENTRY(ft_flags, num)					      \
 > 208		FAKE_SYMBOL(__alt_, 681f)					      \
   209		" .long 661b - .\n"				/* label           */ \
   210		" .long " b_replacement(num)"f - .\n"		/* new instruction */ \
   211		" .4byte " __stringify(ft_flags) "\n"		/* feature + flags */ \
   212		" .byte " alt_total_slen "\n"			/* source len      */ \
   213		" .byte " alt_rlen(num) "\n"			/* replacement len */ \
   214		"681:\n"
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
