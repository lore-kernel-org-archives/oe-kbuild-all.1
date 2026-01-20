Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B14364EAC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 21:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768945981; cv=none; b=cDiGaJZdpWhAQCPTMzwMSAC+v/KUe4lNmGFVL7NUHSpw2e5oiOPLw9m3ouAvwGoJgffgXENmZUx407vz4sEM2krQPyXj2HntKwojviE0L2UlKWLfkWhKUqh8gieKQFSO11FI2GxNNGNzo/AuZHqibw85nOsmhXgLjr4bOGDdJAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768945981; c=relaxed/simple;
	bh=Pt+HgTKC+21o0rPJF4ZTZAJS7QI4K8MS19fJZw7Jkn4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DcNMNlzrslPkjtYwiAUfeRIG4/GT9jMaf80J769CqbTgRnZ5XMINbJjsyBjG0iKS9yZs4xFQH1ecrGn29ZIhgBZTLjFrKm5mu1KLZiNeUuuAZY1IRAtYnscuuCeqpPss4LAWbqZ1tkfH4HqoyyS+x9XgUS+jsOvK0Q+fEaaDqVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSzuQYby; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSzuQYby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768945978; x=1800481978;
  h=date:from:to:cc:subject:message-id;
  bh=Pt+HgTKC+21o0rPJF4ZTZAJS7QI4K8MS19fJZw7Jkn4=;
  b=mSzuQYbyNFjks8l2wn2NgWXlayRECPQ8aCIkyJR7msefVpWpBcLNpp1r
   I7zUEMa2apeiNcNQdRVIAxWdi//20gOZf/4pWrYvspEwTGr7xAQi/tGcV
   +fsWfwXwsp7ZxWlhOvYNCqzCRlnNE9wkVe8yxLNEHDSGDde58bd2zb/wh
   IsPwwyUiVGcVZKpjEhKpGFQJqGMBw+sOtW8mNMWbccFjgF7fTOnSshlAD
   59K+kmcBqLFVWpmHexHpb4BPZzj2PUsSekvKmaOa+ESSO8PReig0POtyu
   b+5/1GLUKnfaHzr+oIm740HKDaMdkv60ihCWKa2Wi7tihqbJeOuufisqi
   Q==;
X-CSE-ConnectionGUID: VjSTdPMQRK+TqJZE3S4Aiw==
X-CSE-MsgGUID: tOEGcqmpRqq5atV9WpBgXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92834696"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="92834696"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 13:52:58 -0800
X-CSE-ConnectionGUID: /0Cgr3fUSQWQTyDRmsi+Pg==
X-CSE-MsgGUID: nzyhzsLgTYKlhWKV7e8bsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="229201054"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jan 2026 13:52:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viJef-00000000PbF-3x6U;
	Tue, 20 Jan 2026 21:52:53 +0000
Date: Wed, 21 Jan 2026 05:52:45 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Subject: [linux-next:master 6722/8302]
 arch/riscv/include/asm/uaccess.h:115:15: warning: cast to pointer from
 integer of different size
Message-ID: <202601210526.OT45dlOZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   053966c344dbd346e71305f530e91ea77916189f
commit: bdce162f2e57a969803e5e9375999a3e0546905f [6722/8302] riscv: Use 64-bit variable for output in __get_user_asm
config: riscv-randconfig-r064-20260121 (https://download.01.org/0day-ci/archive/20260121/202601210526.OT45dlOZ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210526.OT45dlOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210526.OT45dlOZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/mm.h:36,
                    from include/linux/migrate.h:5,
                    from mm/migrate.c:16:
   mm/migrate.c: In function 'do_pages_move':
>> arch/riscv/include/asm/uaccess.h:115:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     115 |         (x) = (__typeof__(x))__tmp;                             \
         |               ^
   arch/riscv/include/asm/uaccess.h:198:17: note: in expansion of macro '__get_user_asm'
     198 |                 __get_user_asm("lb", (x), __gu_ptr, label);     \
         |                 ^~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:218:9: note: in expansion of macro '__get_user_nocheck'
     218 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:255:9: note: in expansion of macro '__get_user_error'
     255 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:285:17: note: in expansion of macro '__get_user'
     285 |                 __get_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   mm/migrate.c:2358:29: note: in expansion of macro 'get_user'
    2358 |                         if (get_user(p, pages + i))
         |                             ^~~~~~~~
>> arch/riscv/include/asm/uaccess.h:115:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     115 |         (x) = (__typeof__(x))__tmp;                             \
         |               ^
   arch/riscv/include/asm/uaccess.h:201:17: note: in expansion of macro '__get_user_asm'
     201 |                 __get_user_asm("lh", (x), __gu_ptr, label);     \
         |                 ^~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:218:9: note: in expansion of macro '__get_user_nocheck'
     218 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:255:9: note: in expansion of macro '__get_user_error'
     255 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:285:17: note: in expansion of macro '__get_user'
     285 |                 __get_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   mm/migrate.c:2358:29: note: in expansion of macro 'get_user'
    2358 |                         if (get_user(p, pages + i))
         |                             ^~~~~~~~
>> arch/riscv/include/asm/uaccess.h:115:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     115 |         (x) = (__typeof__(x))__tmp;                             \
         |               ^
   arch/riscv/include/asm/uaccess.h:204:17: note: in expansion of macro '__get_user_asm'
     204 |                 __get_user_asm("lw", (x), __gu_ptr, label);     \
         |                 ^~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:218:9: note: in expansion of macro '__get_user_nocheck'
     218 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:255:9: note: in expansion of macro '__get_user_error'
     255 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:285:17: note: in expansion of macro '__get_user'
     285 |                 __get_user((x), __p) :                          \
         |                 ^~~~~~~~~~
   mm/migrate.c:2358:29: note: in expansion of macro 'get_user'
    2358 |                         if (get_user(p, pages + i))
         |                             ^~~~~~~~


vim +115 arch/riscv/include/asm/uaccess.h

    92	
    93	/*
    94	 * The "__xxx" versions of the user access functions do not verify the address
    95	 * space - it must have been done previously with a separate "access_ok()"
    96	 * call.
    97	 */
    98	
    99	#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
   100	/*
   101	 * Use a temporary variable for the output of the asm goto to avoid a
   102	 * triggering an LLVM assertion due to sign extending the output when
   103	 * it is used in later function calls:
   104	 * https://github.com/llvm/llvm-project/issues/143795
   105	 */
   106	#define __get_user_asm(insn, x, ptr, label)			\
   107	do {								\
   108		u64 __tmp;						\
   109		asm_goto_output(					\
   110			"1:\n"						\
   111			"	" insn " %0, %1\n"			\
   112			_ASM_EXTABLE_UACCESS_ERR(1b, %l2, %0)		\
   113			: "=&r" (__tmp)					\
   114			: "m" (*(ptr)) : : label);			\
 > 115		(x) = (__typeof__(x))__tmp;				\
   116	} while (0)
   117	#else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
   118	#define __get_user_asm(insn, x, ptr, label)			\
   119	do {								\
   120		long __gua_err = 0;					\
   121		__asm__ __volatile__ (					\
   122			"1:\n"						\
   123			"	" insn " %1, %2\n"			\
   124			"2:\n"						\
   125			_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 2b, %0, %1)	\
   126			: "+r" (__gua_err), "=&r" (x)			\
   127			: "m" (*(ptr)));				\
   128		if (__gua_err)						\
   129			goto label;					\
   130	} while (0)
   131	#endif /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
