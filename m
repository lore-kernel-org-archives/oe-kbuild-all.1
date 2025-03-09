Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89D742A93
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741537909; cv=none; b=ao1Kt2r0/VEsg8Nyn12w7jEc+AuOjCTJye3ddIGbuuArKrT1XBBAsF8Y/r4ICUah7R/1dwHUiZyiQvv65u2MP+UtSGjlgXR8gk3Vf57TEl+4OQAeHYPc9cmzmULzwWJdH5g3GZVOa7htMcNNyRSXZwIhXGuA4UkOY166Mr3QQ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741537909; c=relaxed/simple;
	bh=9QM3cenmmN1f5M+9FnKD5QCORpaNFGGGuM5f/rbnOm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yf5r5sqMQ1hSMsGwPsM+btH5APRXIVWVTH0ZbhNvoM+Oc4aOWOwT//UkRevh/pdZ96re89EN2yFjLJkIDoQ/AeXrrWaaB1HCGmC7V1h1PtK0G4Ck10GuFHvsHIdvFqd4MJaM+RGoh0wzJRKoYQcr+J6OXkPESnSOvVUooEDarEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNYp4pjo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNYp4pjo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741537907; x=1773073907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9QM3cenmmN1f5M+9FnKD5QCORpaNFGGGuM5f/rbnOm4=;
  b=VNYp4pjoTGsKBj/wBQWF881OeBcBmTl9JMFEaIMWxImz3rIXFdB3XEds
   gCsfngR870Z53wB09owcxyNvqa6o8A8OWrSh8zpB/MgtCo8gq3rWZuamD
   yXYhPd6r/P53A3aD8iHwXi5X3ipA5/P9xpiy7Umy75/omfaDgihZYzlHX
   eM0a6ny1XYmPcmvZ8iDbonmVIOmeC1DR65xcWwiceudJE2CbH/wYbVmi+
   Jn3HaN8TjtdLlQiYZ60gaCoe6rQa2E6gWr1etH/ipJZKzlY7zA9Rf/MHF
   cim22gCHQ2CO4Ls82DRJXE8+7peCtgJNJjO1fu3kjFyE/usj0NyzskxFl
   A==;
X-CSE-ConnectionGUID: Z30BDXutQt+mYCG2CP6HtQ==
X-CSE-MsgGUID: PmpMYSEGQsyDAtD/U61vdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="67895660"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="67895660"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 09:31:46 -0700
X-CSE-ConnectionGUID: /kh5Q8+xTc24QcjMQplV+w==
X-CSE-MsgGUID: /DCzLUZjSz2saGBqgsCahA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="124700749"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 09 Mar 2025 09:31:45 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trJZ0-0003I8-2T;
	Sun, 09 Mar 2025 16:31:42 +0000
Date: Mon, 10 Mar 2025 00:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:asm-call 39/42] arch/x86/include/asm/percpu.h:355:31:
 error: expected ':' or ')' before '(' token
Message-ID: <202503100217.P7ZYZoJI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git asm-call
head:   44613874d65bd54453e4f3c595459870cf4a8c9c
commit: 33fe10339dd61d6f8c20c8d64cd393af50140fca [39/42] x86/percpu: Add __asm_call() and use it in percpu cmpxchg ops
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20250310/202503100217.P7ZYZoJI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100217.P7ZYZoJI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100217.P7ZYZoJI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/percpu.h:28,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/slub.c:13:
   mm/slub.c: In function '__update_cpu_freelist_fast':
>> arch/x86/include/asm/percpu.h:355:31: error: expected ':' or ')' before '(' token
     355 |                 ARG(CC_OUT(z) (success),                                \
         |                               ^
   arch/x86/include/asm/asm.h:248:24: note: in definition of macro '__asm_call'
     248 |         asm_inline vol(insns                                            \
         |                        ^~~~~
   arch/x86/include/asm/percpu.h:355:17: note: in expansion of macro 'ARG'
     355 |                 ARG(CC_OUT(z) (success),                                \
         |                 ^~~
   arch/x86/include/asm/percpu.h:368:57: note: in expansion of macro 'percpu_try_cmpxchg64_op'
     368 | #define this_cpu_try_cmpxchg64(pcp, ovalp, nval)        percpu_try_cmpxchg64_op(8, volatile, pcp, ovalp, nval)
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.h:31:41: note: in expansion of macro 'this_cpu_try_cmpxchg64'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:3573:16: note: in expansion of macro 'this_cpu_try_cmpxchg_freelist'
    3573 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid.full,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/percpu.h:346:18: warning: variable 'new__' set but not used [-Wunused-but-set-variable]
     346 |         } old__, new__;                                                 \
         |                  ^~~~~
   arch/x86/include/asm/percpu.h:368:57: note: in expansion of macro 'percpu_try_cmpxchg64_op'
     368 | #define this_cpu_try_cmpxchg64(pcp, ovalp, nval)        percpu_try_cmpxchg64_op(8, volatile, pcp, ovalp, nval)
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.h:31:41: note: in expansion of macro 'this_cpu_try_cmpxchg64'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:3573:16: note: in expansion of macro 'this_cpu_try_cmpxchg_freelist'
    3573 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid.full,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +355 arch/x86/include/asm/percpu.h

   336	
   337	#define percpu_try_cmpxchg64_op(size, qual, _var, _ovalp, _nval)	\
   338	({									\
   339		bool success;							\
   340		u64 *_oval = (u64 *)(_ovalp);					\
   341		union {								\
   342			u64 var;						\
   343			struct {						\
   344				u32 low, high;					\
   345			};							\
 > 346		} old__, new__;							\
   347										\
   348		old__.var = *_oval;						\
   349		new__.var = _nval;						\
   350										\
   351		__asm_call(qual,						\
   352			ALTERNATIVE("call this_cpu_cmpxchg8b_emu",		\
   353				    "cmpxchg8b " __percpu_arg([var]),		\
   354				    X86_FEATURE_CX8)				\
 > 355			ARG(CC_OUT(z) (success),				\
   356			    [var] "+m" (__my_cpu_var(_var)), "+a" (old__.low),	\
   357			    "+d" (old__.high)),					\
   358			ARG("b" (new__.low), "c" (new__.high), "S" (&(_var))),	\
   359			ARG("memory"));						\
   360										\
   361		if (unlikely(!success))						\
   362			*_oval = old__.var;					\
   363										\
   364		likely(success);						\
   365	})
   366	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
