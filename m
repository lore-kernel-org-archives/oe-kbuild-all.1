Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA448AE3C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998551; cv=none; b=Wcmx0cl2P/yS1QDy1LqxC6miQs/pdaOntFhzJuNlNodaPVyDOSJ9P0/+QqBHMthS1Wlr1/MaxukvS7BgbJiREdjoWEnB9iBc+v1uZw09Eps0CWcD+6DolX1r7KmSMz6+Aq3aw+Ptlb/uNDs5cX68JDiaCf0RSThsLEDZ46NKNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998551; c=relaxed/simple;
	bh=wr2O7HeefUSIkxiSLsuIXL2mbI3SS4QIq2EPdozkFR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hhDWur85V5ZK9tOEVETSn68QVBtHRTqVghgZxfYbPhfdSg1urfv3ZzY2f4Qik81tCL6bR7Liesw23Aj5M7dm3s/XnI55fmj7e0pexoXsmgDL3MFGGQz9/EwQppF/TIXMXqlOsJr6Mkbf2ALQ8sWuH51LUhL31FEFculzNsn6/0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCO56DD1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCO56DD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777998549; x=1809534549;
  h=date:from:to:cc:subject:message-id;
  bh=wr2O7HeefUSIkxiSLsuIXL2mbI3SS4QIq2EPdozkFR4=;
  b=hCO56DD1SjnnNI6Zhnkm7SlQ0dyEIrmQuBJeta1gSX2POuDG1feLnbF4
   q+LI0bLBxiL+R6hGfEMLph61W5hZk1ACpE+4KToAjUXrQqMFn1PqWDTqW
   XPdmYSCd9iuYN53fm4rOAUV14amg/zVN8zMzzNXjRvrSazQnegvhM1FGw
   FAxWBorSXI/J1BBdQVABlKEapidaxljfzwOHLm4+VwbL88TpAxWs5XjSo
   /8dajxvNTLPI9fnv9rLmpZTHd57hnFZMCP990Rv2dfYvxwuGrBNQkUrBr
   KP/eMYwlUfPsly/DwlKwrjv2FbvGxvg+TuAue+JMnQixfLZD+QJsEVzmr
   w==;
X-CSE-ConnectionGUID: eJ18egetTUuOlvgDlrvhFA==
X-CSE-MsgGUID: 3/sgZKrJSECsSNXELH/vVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="81437144"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="81437144"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 09:29:09 -0700
X-CSE-ConnectionGUID: 3OMcIye1TP2s9Dwg7CYrvQ==
X-CSE-MsgGUID: OAY1UV7QR868PoXbgjDDcA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2026 09:29:07 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKIdt-000000000Hj-0a7Z;
	Tue, 05 May 2026 16:29:05 +0000
Date: Wed, 06 May 2026 00:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-sync 9/12] include/linux/kconfig.h:43:75: error:
 expected string literal before numeric constant
Message-ID: <202605060008.cHdbvwtS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   082cc4c201e4450ff9456c9bd093fd70d103595a
commit: 40c3e04e2248c0e5d78d23e6767a1c58d5678eac [9/12] preempt: x86: Avoid tracking NMI separately when 64BIT=y
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260506/202605060008.cHdbvwtS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060008.cHdbvwtS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060008.cHdbvwtS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/preempt.h:5,
                    from include/linux/preempt.h:92,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/preempt.h: In function '__preempt_count_dec_and_test':
>> include/linux/kconfig.h:43:75: error: expected string literal before numeric constant
      43 | #define ____is_defined(arg1_or_junk)    __take_second_arg(arg1_or_junk 1, 0)
         |                                                                           ^
   arch/x86/include/asm/rmwcc.h:12:30: note: in definition of macro '__GEN_RMWcc'
      12 |         asm_inline volatile (fullop                                     \
         |                              ^~~~~~
   include/linux/args.h:25:24: note: in expansion of macro 'GEN_UNARY_RMWcc_4'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   arch/x86/include/asm/preempt.h:126:16: note: in expansion of macro 'GEN_UNARY_RMWcc'
     126 |         return GEN_UNARY_RMWcc(IS_ENABLED(CONFIG_PREEMPT_LONG) ? "decq":
         |                ^~~~~~~~~~~~~~~
   include/linux/kconfig.h:26:41: note: in expansion of macro '__take_second_arg'
      26 | #define ____or(arg1_or_junk, y)         __take_second_arg(arg1_or_junk 1, y)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/kconfig.h:25:41: note: in expansion of macro '____or'
      25 | #define ___or(x, y)                     ____or(__ARG_PLACEHOLDER_##x, y)
         |                                         ^~~~~~
   include/linux/kconfig.h:24:41: note: in expansion of macro '___or'
      24 | #define __or(x, y)                      ___or(x, y)
         |                                         ^~~~~
   include/linux/kconfig.h:73:28: note: in expansion of macro '__or'
      73 | #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
         |                            ^~~~
   include/linux/kconfig.h:43:41: note: in expansion of macro '__take_second_arg'
      43 | #define ____is_defined(arg1_or_junk)    __take_second_arg(arg1_or_junk 1, 0)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/kconfig.h:42:41: note: in expansion of macro '____is_defined'
      42 | #define ___is_defined(val)              ____is_defined(__ARG_PLACEHOLDER_##val)
         |                                         ^~~~~~~~~~~~~~
   include/linux/kconfig.h:41:41: note: in expansion of macro '___is_defined'
      41 | #define __is_defined(x)                 ___is_defined(x)
         |                                         ^~~~~~~~~~~~~
   include/linux/kconfig.h:57:27: note: in expansion of macro '__is_defined'
      57 | #define IS_MODULE(option) __is_defined(option##_MODULE)
         |                           ^~~~~~~~~~~~
   include/linux/kconfig.h:73:53: note: in expansion of macro 'IS_MODULE'
      73 | #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
         |                                                     ^~~~~~~~~
   arch/x86/include/asm/preempt.h:126:32: note: in expansion of macro 'IS_ENABLED'
     126 |         return GEN_UNARY_RMWcc(IS_ENABLED(CONFIG_PREEMPT_LONG) ? "decq":
         |                                ^~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1373: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +43 include/linux/kconfig.h

5e8754fd80b0a59 Masahiro Yamada 2016-06-14  27  
2a11c8ea20bf850 Michal Marek    2011-07-20  28  /*
69349c2dc01c489 Paul Gortmaker  2012-04-12  29   * Helper macros to use CONFIG_ options in C/CPP expressions. Note that
2a11c8ea20bf850 Michal Marek    2011-07-20  30   * these only work with boolean and tristate options.
2a11c8ea20bf850 Michal Marek    2011-07-20  31   */
2a11c8ea20bf850 Michal Marek    2011-07-20  32  
69349c2dc01c489 Paul Gortmaker  2012-04-12  33  /*
69349c2dc01c489 Paul Gortmaker  2012-04-12  34   * Getting something that works in C and CPP for an arg that may or may
69349c2dc01c489 Paul Gortmaker  2012-04-12  35   * not be defined is tricky.  Here, if we have "#define CONFIG_BOOGER 1"
69349c2dc01c489 Paul Gortmaker  2012-04-12  36   * we match on the placeholder define, insert the "0," for arg1 and generate
69349c2dc01c489 Paul Gortmaker  2012-04-12  37   * the triplet (0, 1, 0).  Then the last step cherry picks the 2nd arg (a one).
69349c2dc01c489 Paul Gortmaker  2012-04-12  38   * When CONFIG_BOOGER is not defined, we generate a (... 1, 0) pair, and when
69349c2dc01c489 Paul Gortmaker  2012-04-12  39   * the last step cherry picks the 2nd arg, we get a zero.
69349c2dc01c489 Paul Gortmaker  2012-04-12  40   */
4f920843d248946 Masahiro Yamada 2016-06-14  41  #define __is_defined(x)			___is_defined(x)
4f920843d248946 Masahiro Yamada 2016-06-14  42  #define ___is_defined(val)		____is_defined(__ARG_PLACEHOLDER_##val)
4f920843d248946 Masahiro Yamada 2016-06-14 @43  #define ____is_defined(arg1_or_junk)	__take_second_arg(arg1_or_junk 1, 0)
69349c2dc01c489 Paul Gortmaker  2012-04-12  44  

:::::: The code at line 43 was first introduced by commit
:::::: 4f920843d248946545415c1bf6120942048708ed kconfig.h: use __is_defined() to check if MODULE is defined

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Michal Marek <mmarek@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
