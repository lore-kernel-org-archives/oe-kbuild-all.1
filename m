Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793304801;
	b=C1zYrdY5ORaQXDr8ym64O8HrZk1bUmXGsRkZ9VZzDvOSmUWhqrHmtUzgIuoJbeh+IUMQ
	 ETCRWenBSMXbc/lnZg1btLzJRNm14OYKzoSjtP9cMjXablPE8qfSNRPRqt24XuT7OGvgb
	 O0wkwtY4zwUVjB22XQS9+Szdwa0J6k1p5GMymB4idmqFv+fsS9DrGS/kA4bSP9YlOryBA
	 fmlj4jDAc9+LySEw9Tt3p7WyTExHuXXnex5+lLGgV1orRkqgNeeX9W0qCCq+OA6b7E6sx
	 ruoaT2lP3T25VOJs3//iR9g5xoR+I6dtF3wEzSvVX4KXw1Y8Vs2yJK3TFsfiwG2bxRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793304801;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WUVE2h0BDxKC0G22G0A1P6b67SG64BoW1r8s84KkXr4=;
	b=Zx+HBmJVyKu+zJUY7HnnJ/Yblxj8LsEQCwqBOZFTLb/Q9CqUDSGF24r4KPlYSCaiPngl
	 nrn8A/ZD+qiUEQUA2JBxRjxg/9JASJNqNQl106zxTm5Pf0tERSqoWiMz6NSXg102YSZdA
	 98moXUoCsHOOo67GH+1Bk53BrQIDUnMnh4j4uhmhFS30FJSy0WJLy4TOJBbkF/E7+6ctm
	 G+irIOvawa2FuBoHMsqODqX6UGngEu0731T/h1+sLQ68ginZAiJS9gk6v4WkLsF9zIP+0
	 f+EI283KnmO0GE/00Qgtic14ViRBHH9rcpGMc9uNQNAHbFjBkgjScsBUQMOh2meMzvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=igMcA1z1;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EF7606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 20:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41EF7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=igMcA1z1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793304799; x=1824840799;
  h=date:from:to:cc:subject:message-id;
  bh=1vME+IYHLnnIz39+Ib3HNx+cIDCKoRZ2c5RoEAyrxzQ=;
  b=igMcA1z1E9dm0m1jXMxuBrZHSZ8+4pCq1IluNVWHDfx9JYLPr9taJPZC
   OCCLzdkBfZ1GYOTtV8RRZiyjwx6kGWISO+1pAKBVsZ3XvbxMHpVpSxJpq
   90rBdf61voG+Dsw04TD0tCbsZSBM8q8wUC6NPQ+SE6s8Zs8AykzRcdXTG
   GaxRW1Hk0/8j6preCybOyu2RBL4BYc6gbIomkAu5wUmG0IY2icjVjbsAh
   MzRbuGZTg+I8oQCNSdnfLD8qTWBhlp2SjSLjjMROygxrPrwlRqfjNumJB
   GpQDSTnwwVM4oKfoG3AS1Ya2E/KxPM6zwp/0bW2QsnOnnlKnP/czkXRy+
   g==;
X-CSE-ConnectionGUID: pmwT8aWzTfS6fNWqtGAY0w==
X-CSE-MsgGUID: x6ZNimJhS9++fEOjxv7N+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1955916"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1955916"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 13:13:18 -0700
X-CSE-ConnectionGUID: y4XNKrgsQK+8zkOy7q7dGQ==
X-CSE-MsgGUID: IE/B7cQ2QtiWHtCa8CaEcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5782651"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2026 13:13:18 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMWUs-000000005Kt-3cut;
	Thu, 29 Oct 2026 20:13:14 +0000
Date: Thu, 29 Oct 2026 21:12:35 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/syscall 4/5]
 arch/x86/include/asm/syscall_wrapper.h:101:21: error: conflicting types for
 '__x64_sys_gettimeofday'; have 'long int(const struct pt_regs *)'
Message-ID: <202610292140.C00OahQG-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/syscall
head:   57a2da426dba48424406ee52c0c931c6d024138a
commit: 91b5c0df2a770d3c281a82da51feb9b488bd7ace [4/5] x86_64/entry: Mark all syscalls __noendbr
config: x86_64-randconfig-2300-20261029 (https://download.01.org/0day-ci/archive/20261029/202610292140.C00OahQG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610292140.C00OahQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610292140.C00OahQG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sys_ni.c:10:
>> arch/x86/include/asm/syscall_wrapper.h:101:21: error: conflicting types for '__x64_sys_gettimeofday'; have 'long int(const struct pt_regs *)'
     101 |         __weak long __##abi##_##name(const struct pt_regs *__unused);   \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:116:9: note: in expansion of macro '__COND_SYSCALL'
     116 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:253:9: note: in expansion of macro '__X64_COND_SYSCALL'
     253 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:354:1: note: in expansion of macro 'COND_SYSCALL'
     354 | COND_SYSCALL(gettimeofday);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:262:16: note: previous declaration of '__x64_sys_gettimeofday' with type 'long int(const struct pt_regs *)'
     262 | long __noendbr __x64_sys_gettimeofday(const struct pt_regs *regs);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:102:21: error: conflicting types for '__x64_sys_gettimeofday'; have 'long int(const struct pt_regs *)'
     102 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:116:9: note: in expansion of macro '__COND_SYSCALL'
     116 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:253:9: note: in expansion of macro '__X64_COND_SYSCALL'
     253 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:354:1: note: in expansion of macro 'COND_SYSCALL'
     354 | COND_SYSCALL(gettimeofday);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:262:16: note: previous declaration of '__x64_sys_gettimeofday' with type 'long int(const struct pt_regs *)'
     262 | long __noendbr __x64_sys_gettimeofday(const struct pt_regs *regs);
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/syscall_wrapper.h:101:21: error: conflicting types for '__x64_sys_time'; have 'long int(const struct pt_regs *)'
     101 |         __weak long __##abi##_##name(const struct pt_regs *__unused);   \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:116:9: note: in expansion of macro '__COND_SYSCALL'
     116 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:253:9: note: in expansion of macro '__X64_COND_SYSCALL'
     253 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:356:1: note: in expansion of macro 'COND_SYSCALL'
     356 | COND_SYSCALL(time);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:263:16: note: previous declaration of '__x64_sys_time' with type 'long int(const struct pt_regs *)'
     263 | long __noendbr __x64_sys_time(const struct pt_regs *regs);
         |                ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:102:21: error: conflicting types for '__x64_sys_time'; have 'long int(const struct pt_regs *)'
     102 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:116:9: note: in expansion of macro '__COND_SYSCALL'
     116 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:253:9: note: in expansion of macro '__X64_COND_SYSCALL'
     253 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:356:1: note: in expansion of macro 'COND_SYSCALL'
     356 | COND_SYSCALL(time);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:263:16: note: previous declaration of '__x64_sys_time' with type 'long int(const struct pt_regs *)'
     263 | long __noendbr __x64_sys_time(const struct pt_regs *regs);
         |                ^~~~~~~~~~~~~~


vim +101 arch/x86/include/asm/syscall_wrapper.h

56062d60f117dcc Richard Palethorpe 2024-01-10   76  
56062d60f117dcc Richard Palethorpe 2024-01-10   77  #define __SC_COMPAT_CAST(t, a)						\
56062d60f117dcc Richard Palethorpe 2024-01-10   78  	(__typeof(__builtin_choose_expr(__TYPE_IS_L(t), 0, 0U)))	\
56062d60f117dcc Richard Palethorpe 2024-01-10   79  	(unsigned int)a
56062d60f117dcc Richard Palethorpe 2024-01-10   80  
ebeb8c82ffaf944 Dominik Brodowski  2018-04-05   81  /* Mapping of registers to parameters for syscalls on i386 */
ebeb8c82ffaf944 Dominik Brodowski  2018-04-05   82  #define SC_IA32_REGS_TO_ARGS(x, ...)					\
56062d60f117dcc Richard Palethorpe 2024-01-10   83  	SYSCALL_PT_ARGS(x, __SC_COMPAT_CAST,				\
56062d60f117dcc Richard Palethorpe 2024-01-10   84  			__MAP(x, __SC_TYPE, __VA_ARGS__))		\
ebeb8c82ffaf944 Dominik Brodowski  2018-04-05   85  
d2b5de495ee9838 Brian Gerst        2020-03-13   86  #define __SYS_STUB0(abi, name)						\
91b5c0df2a770d3 Peter Zijlstra     2026-06-19   87  	long __noendbr __##abi##_##name(const struct pt_regs *regs);		\
d2b5de495ee9838 Brian Gerst        2020-03-13   88  	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
91b5c0df2a770d3 Peter Zijlstra     2026-06-19   89  	long __noendbr __##abi##_##name(const struct pt_regs *regs)		\
d2b5de495ee9838 Brian Gerst        2020-03-13   90  		__alias(__do_##name);
d2b5de495ee9838 Brian Gerst        2020-03-13   91  
4399e0cf494f739 Brian Gerst        2020-03-13   92  #define __SYS_STUBx(abi, name, ...)					\
91b5c0df2a770d3 Peter Zijlstra     2026-06-19   93  	long __noendbr __##abi##_##name(const struct pt_regs *regs);		\
4399e0cf494f739 Brian Gerst        2020-03-13   94  	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
91b5c0df2a770d3 Peter Zijlstra     2026-06-19   95  	long __noendbr __##abi##_##name(const struct pt_regs *regs)		\
4399e0cf494f739 Brian Gerst        2020-03-13   96  	{								\
4399e0cf494f739 Brian Gerst        2020-03-13   97  		return __se_##name(__VA_ARGS__);			\
4399e0cf494f739 Brian Gerst        2020-03-13   98  	}
4399e0cf494f739 Brian Gerst        2020-03-13   99  
6cc8d2b286d9e71 Brian Gerst        2020-03-13  100  #define __COND_SYSCALL(abi, name)					\
7dfe553affd0d00 Masahiro Yamada    2021-03-01 @101  	__weak long __##abi##_##name(const struct pt_regs *__unused);	\
0f78ff17112d8b3 Brian Gerst        2020-03-13  102  	__weak long __##abi##_##name(const struct pt_regs *__unused)	\
6cc8d2b286d9e71 Brian Gerst        2020-03-13  103  	{								\
6cc8d2b286d9e71 Brian Gerst        2020-03-13  104  		return sys_ni_syscall();				\
6cc8d2b286d9e71 Brian Gerst        2020-03-13  105  	}
6cc8d2b286d9e71 Brian Gerst        2020-03-13  106  

:::::: The code at line 101 was first introduced by commit
:::::: 7dfe553affd0d003c7535b7ba60d09193471ea9d x86/syscalls: Fix -Wmissing-prototypes warnings from COND_SYSCALL()

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
