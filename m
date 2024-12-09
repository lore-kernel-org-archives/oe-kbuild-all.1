Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3D51487C8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733762466; cv=none; b=st0Mz3MV3/vmDzugKqbDRcm8VFJipOc4rLg6ycCTz+d6YtuFd2IVPPRPAbOvWUrG9cPMa1LxoytX19Gj7YWXYPBpr6hhkiLlzoozcxQ9kbCm0NtpcAQ1Bn7i6FCD/VLdgkSFg7rXN8zMI+E+PEE8gqFIw0ZwcyvaTNSLs7bBwOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733762466; c=relaxed/simple;
	bh=Qfpqihupr35GOGLjW9EeThNffiNndhDp4HVQTLHGxbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=driPFapvOcDTs0BdFysrJZndeXqEDx72352stwg8O5p3oRz0oaY6s/bPZD1PxpeUlJn7NDttTetVQYnTb321CyxpqDnOp0ty4gGv/KatBH9sICzNcWHKO988utHvVVIPRpOiqLw491EHse7AKaxT1sz3tNvfpT8l7nl1XpawQgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLr1B7zK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLr1B7zK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733762462; x=1765298462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qfpqihupr35GOGLjW9EeThNffiNndhDp4HVQTLHGxbg=;
  b=lLr1B7zKZmY0BfloIjn0IJF/zS3Dx3C06rCw6uhjssvPJkY+4uCOAaXd
   wCl7+WnBIvU0EoFzTzrX/zbBeUISkavgPqlu6i9/7C+dymBh1rEg5Src2
   Vx2YvmrxYvHRu1JEv3GIACJ6E3UJgJTs7U6E4y6/CqLfZ8Pl5y5B9hCyi
   +lumuHy3H0iOEvDMLl/Y3IIVMrQyOHPKawKeWHCrUCZ+3AGcojsvjhHDV
   X2dYhYSDl/IAVgu39gxJFsoSCGIl9bu+b1mOlvR3nLNLYLJOd7HN0xc2+
   u2OUQXWOnpVGKIZJkx7Z0eC7R2yHjzKNH1b+pSHy6hC8nRWJfzvPa9y4/
   Q==;
X-CSE-ConnectionGUID: lMLyTFMcT/KGagc3ZXGV/w==
X-CSE-MsgGUID: PqtYzXkQQi+JmDUh8F0QzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="51486217"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="51486217"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 08:41:01 -0800
X-CSE-ConnectionGUID: isk1tsU2QQKa5oCob2flmQ==
X-CSE-MsgGUID: dVjjtgg8RPa3ghs5yVGiFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="126019683"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2024 08:41:00 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKgoc-0004cI-0c;
	Mon, 09 Dec 2024 16:40:58 +0000
Date: Tue, 10 Dec 2024 00:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Huaxin Lu <luhuaxin1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2570/2570]
 arch/arm64/include/asm/atomic_lse.h:364:1: error: unknown register name 'x0'
 in asm
Message-ID: <202412100013.zF4K3d9s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fbaada49082c23aa4e4ed43386a1ad4a457a0354
commit: 78568d28ad62c586e32e3989de5354fcb014c09f [2570/2570] scripts: Fix issue of module signing with openssl 3.x
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241210/202412100013.zF4K3d9s-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100013.zF4K3d9s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100013.zF4K3d9s-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                                    ^
   7 warnings generated.
   scripts/extract-cert.c:46:14: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
      46 |         while ((e = ERR_get_error_line(&file, &line))) {
         |                     ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:59:9: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
      59 |         while (ERR_get_error_line(&file, &line)) {}
         |                ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:124:3: warning: 'ENGINE_load_builtin_engines' is deprecated [-Wdeprecated-declarations]
     124 |                 ENGINE_load_builtin_engines();
         |                 ^
   /usr/include/openssl/engine.h:358:1: note: 'ENGINE_load_builtin_engines' has been explicitly marked deprecated here
     358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:126:7: warning: 'ENGINE_by_id' is deprecated [-Wdeprecated-declarations]
     126 |                 e = ENGINE_by_id("pkcs11");
         |                     ^
   /usr/include/openssl/engine.h:336:1: note: 'ENGINE_by_id' has been explicitly marked deprecated here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:128:7: warning: 'ENGINE_init' is deprecated [-Wdeprecated-declarations]
     128 |                 if (ENGINE_init(e))
         |                     ^
   /usr/include/openssl/engine.h:620:1: note: 'ENGINE_init' has been explicitly marked deprecated here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:133:9: warning: 'ENGINE_ctrl_cmd_string' is deprecated [-Wdeprecated-declarations]
     133 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
         |                              ^
   /usr/include/openssl/engine.h:478:1: note: 'ENGINE_ctrl_cmd_string' has been explicitly marked deprecated here
     478 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:134:3: warning: 'ENGINE_ctrl_cmd' is deprecated [-Wdeprecated-declarations]
     134 |                 ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
         |                 ^
   /usr/include/openssl/engine.h:450:1: note: 'ENGINE_ctrl_cmd' has been explicitly marked deprecated here
     450 | OSSL_DEPRECATEDIN_3_0 int ENGINE_ctrl_cmd(ENGINE *e, const char *cmd_name,
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   7 warnings generated.
   In file included from kernel/bounds.c:10:
   In file included from include/linux/page-flags.h:10:
   In file included from include/linux/bug.h:5:
   In file included from arch/arm64/include/asm/bug.h:26:
   In file included from include/asm-generic/bug.h:20:
   In file included from include/linux/kernel.h:12:
   In file included from include/linux/bitops.h:29:
   In file included from arch/arm64/include/asm/bitops.h:26:
   In file included from include/asm-generic/bitops/atomic.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm64/include/asm/atomic.h:16:
   In file included from arch/arm64/include/asm/cmpxchg.h:14:
   In file included from arch/arm64/include/asm/lse.h:16:
>> arch/arm64/include/asm/atomic_lse.h:364:1: error: unknown register name 'x0' in asm
     364 | __CMPXCHG_CASE(w, b,     ,  8,   )
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
>> arch/arm64/include/asm/atomic_lse.h:364:1: error: unknown register name 'x1' in asm
   arch/arm64/include/asm/atomic_lse.h:347:25: note: expanded from macro '__CMPXCHG_CASE'
     347 |         register u##sz x1 asm ("x1") = old;                             \
         |                                ^
>> arch/arm64/include/asm/atomic_lse.h:364:1: error: unknown register name 'x2' in asm
   arch/arm64/include/asm/atomic_lse.h:348:25: note: expanded from macro '__CMPXCHG_CASE'
     348 |         register u##sz x2 asm ("x2") = new;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:365:1: error: unknown register name 'x0' in asm
     365 | __CMPXCHG_CASE(w, h,     , 16,   )
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
   arch/arm64/include/asm/atomic_lse.h:365:1: error: unknown register name 'x1' in asm
   arch/arm64/include/asm/atomic_lse.h:347:25: note: expanded from macro '__CMPXCHG_CASE'
     347 |         register u##sz x1 asm ("x1") = old;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:365:1: error: unknown register name 'x2' in asm
   arch/arm64/include/asm/atomic_lse.h:348:25: note: expanded from macro '__CMPXCHG_CASE'
     348 |         register u##sz x2 asm ("x2") = new;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:366:1: error: unknown register name 'x0' in asm
     366 | __CMPXCHG_CASE(w,  ,     , 32,   )
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
   arch/arm64/include/asm/atomic_lse.h:366:1: error: unknown register name 'x1' in asm
   arch/arm64/include/asm/atomic_lse.h:347:25: note: expanded from macro '__CMPXCHG_CASE'
     347 |         register u##sz x1 asm ("x1") = old;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:366:1: error: unknown register name 'x2' in asm
   arch/arm64/include/asm/atomic_lse.h:348:25: note: expanded from macro '__CMPXCHG_CASE'
     348 |         register u##sz x2 asm ("x2") = new;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:367:1: error: unknown register name 'x0' in asm
     367 | __CMPXCHG_CASE(x,  ,     , 64,   )
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
   arch/arm64/include/asm/atomic_lse.h:367:1: error: unknown register name 'x1' in asm
   arch/arm64/include/asm/atomic_lse.h:347:25: note: expanded from macro '__CMPXCHG_CASE'
     347 |         register u##sz x1 asm ("x1") = old;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:367:1: error: unknown register name 'x2' in asm
   arch/arm64/include/asm/atomic_lse.h:348:25: note: expanded from macro '__CMPXCHG_CASE'
     348 |         register u##sz x2 asm ("x2") = new;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:368:1: error: unknown register name 'x0' in asm
     368 | __CMPXCHG_CASE(w, b, acq_,  8,  a, "memory")
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
   arch/arm64/include/asm/atomic_lse.h:368:1: error: unknown register name 'x1' in asm
   arch/arm64/include/asm/atomic_lse.h:347:25: note: expanded from macro '__CMPXCHG_CASE'
     347 |         register u##sz x1 asm ("x1") = old;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:368:1: error: unknown register name 'x2' in asm
   arch/arm64/include/asm/atomic_lse.h:348:25: note: expanded from macro '__CMPXCHG_CASE'
     348 |         register u##sz x2 asm ("x2") = new;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:369:1: error: unknown register name 'x0' in asm
     369 | __CMPXCHG_CASE(w, h, acq_, 16,  a, "memory")
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
   arch/arm64/include/asm/atomic_lse.h:369:1: error: unknown register name 'x1' in asm
   arch/arm64/include/asm/atomic_lse.h:347:25: note: expanded from macro '__CMPXCHG_CASE'
     347 |         register u##sz x1 asm ("x1") = old;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:369:1: error: unknown register name 'x2' in asm
   arch/arm64/include/asm/atomic_lse.h:348:25: note: expanded from macro '__CMPXCHG_CASE'
     348 |         register u##sz x2 asm ("x2") = new;                             \
         |                                ^
   arch/arm64/include/asm/atomic_lse.h:370:1: error: unknown register name 'x0' in asm
     370 | __CMPXCHG_CASE(w,  , acq_, 32,  a, "memory")
         | ^
   arch/arm64/include/asm/atomic_lse.h:346:33: note: expanded from macro '__CMPXCHG_CASE'
     346 |         register unsigned long x0 asm ("x0") = (unsigned long)ptr;      \
         |                                        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
   make[2]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1238: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:187: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/x0 +364 arch/arm64/include/asm/atomic_lse.h

c0385b24af15020 Will Deacon   2015-02-03  339  
5ef3fe4cecdf82f Will Deacon   2018-09-13  340  #define __CMPXCHG_CASE(w, sfx, name, sz, mb, cl...)			\
a48e61de758c6b4 Will Deacon   2019-10-01  341  static __always_inline u##sz						\
a48e61de758c6b4 Will Deacon   2019-10-01  342  __lse__cmpxchg_case_##name##sz(volatile void *ptr,			\
b4f9209bfcd5964 Will Deacon   2018-09-13  343  					      u##sz old,		\
5ef3fe4cecdf82f Will Deacon   2018-09-13  344  					      u##sz new)		\
c342f78217e822d Will Deacon   2015-04-23  345  {									\
c342f78217e822d Will Deacon   2015-04-23 @346  	register unsigned long x0 asm ("x0") = (unsigned long)ptr;	\
b4f9209bfcd5964 Will Deacon   2018-09-13  347  	register u##sz x1 asm ("x1") = old;				\
5ef3fe4cecdf82f Will Deacon   2018-09-13  348  	register u##sz x2 asm ("x2") = new;				\
3337cb5aea594e4 Andrew Murray 2019-08-28  349  	unsigned long tmp;						\
c342f78217e822d Will Deacon   2015-04-23  350  									\
addfc38672c73ef Andrew Murray 2019-08-28  351  	asm volatile(							\
e0d5896bd356cd5 Sami Tolvanen 2019-10-31  352  	__LSE_PREAMBLE							\
3337cb5aea594e4 Andrew Murray 2019-08-28  353  	"	mov	%" #w "[tmp], %" #w "[old]\n"			\
3337cb5aea594e4 Andrew Murray 2019-08-28  354  	"	cas" #mb #sfx "\t%" #w "[tmp], %" #w "[new], %[v]\n"	\
3337cb5aea594e4 Andrew Murray 2019-08-28  355  	"	mov	%" #w "[ret], %" #w "[tmp]"			\
3337cb5aea594e4 Andrew Murray 2019-08-28  356  	: [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr),		\
3337cb5aea594e4 Andrew Murray 2019-08-28  357  	  [tmp] "=&r" (tmp)						\
c342f78217e822d Will Deacon   2015-04-23  358  	: [old] "r" (x1), [new] "r" (x2)				\
3337cb5aea594e4 Andrew Murray 2019-08-28  359  	: cl);								\
c342f78217e822d Will Deacon   2015-04-23  360  									\
c342f78217e822d Will Deacon   2015-04-23  361  	return x0;							\
c342f78217e822d Will Deacon   2015-04-23  362  }
c342f78217e822d Will Deacon   2015-04-23  363  
5ef3fe4cecdf82f Will Deacon   2018-09-13 @364  __CMPXCHG_CASE(w, b,     ,  8,   )
5ef3fe4cecdf82f Will Deacon   2018-09-13  365  __CMPXCHG_CASE(w, h,     , 16,   )
5ef3fe4cecdf82f Will Deacon   2018-09-13  366  __CMPXCHG_CASE(w,  ,     , 32,   )
5ef3fe4cecdf82f Will Deacon   2018-09-13  367  __CMPXCHG_CASE(x,  ,     , 64,   )
5ef3fe4cecdf82f Will Deacon   2018-09-13  368  __CMPXCHG_CASE(w, b, acq_,  8,  a, "memory")
5ef3fe4cecdf82f Will Deacon   2018-09-13  369  __CMPXCHG_CASE(w, h, acq_, 16,  a, "memory")
5ef3fe4cecdf82f Will Deacon   2018-09-13  370  __CMPXCHG_CASE(w,  , acq_, 32,  a, "memory")
5ef3fe4cecdf82f Will Deacon   2018-09-13  371  __CMPXCHG_CASE(x,  , acq_, 64,  a, "memory")
5ef3fe4cecdf82f Will Deacon   2018-09-13  372  __CMPXCHG_CASE(w, b, rel_,  8,  l, "memory")
5ef3fe4cecdf82f Will Deacon   2018-09-13  373  __CMPXCHG_CASE(w, h, rel_, 16,  l, "memory")
5ef3fe4cecdf82f Will Deacon   2018-09-13  374  __CMPXCHG_CASE(w,  , rel_, 32,  l, "memory")
5ef3fe4cecdf82f Will Deacon   2018-09-13  375  __CMPXCHG_CASE(x,  , rel_, 64,  l, "memory")
5ef3fe4cecdf82f Will Deacon   2018-09-13  376  __CMPXCHG_CASE(w, b,  mb_,  8, al, "memory")
5ef3fe4cecdf82f Will Deacon   2018-09-13  377  __CMPXCHG_CASE(w, h,  mb_, 16, al, "memory")
5ef3fe4cecdf82f Will Deacon   2018-09-13  378  __CMPXCHG_CASE(w,  ,  mb_, 32, al, "memory")
5ef3fe4cecdf82f Will Deacon   2018-09-13  379  __CMPXCHG_CASE(x,  ,  mb_, 64, al, "memory")
c342f78217e822d Will Deacon   2015-04-23  380  

:::::: The code at line 364 was first introduced by commit
:::::: 5ef3fe4cecdf82fdd71ce78988403963d01444d4 arm64: Avoid redundant type conversions in xchg() and cmpxchg()

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
