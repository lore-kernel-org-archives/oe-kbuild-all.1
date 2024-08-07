Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE398198A39
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 05:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723010129; cv=none; b=lbv3CuR0c1GaZrKBz9n0yzAgEq4qyt6IVbcGgkW9D1Y51nJVBqA+JRDyQM0vb+pviZA1Fj1tpIVEHGNsOV0O+ENmpBGKnzxTGADiacpbRzAZskvcDaWbjlhRicbCE6EW1+3DZlmpoIeolDNRJmppGJavdZ5vzxAGaitZF7Vk610=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723010129; c=relaxed/simple;
	bh=3XY118eRWLXq2h99WjvE8CgXOWDIVDR/p5JBCnpdzYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zi6aIXHI8N9/Jwo1SuWhYvjIgjFKIQiLZc3hzCoY3w7ss13PW4PMYnLX/nfdNq+mVvNHMmodN095uNZY3nSCMEVdBjJLLUtgBDILJ0RIS/AYgn3V/vP5ShW8ndWU19yl6KDW53epWkm9MJfVjgfqVH5E7NIUmAAbCiSe2fZ8VLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Js88tBnY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Js88tBnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723010127; x=1754546127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3XY118eRWLXq2h99WjvE8CgXOWDIVDR/p5JBCnpdzYs=;
  b=Js88tBnYL3WKFcxbqBaN/fIX1u6U9B9s5HXD3+igLO64Wng7AFvMn2s3
   27NpwPZT7ZF48m8O4iif2Q3w7NeUGkgLDHbdEO5fl2NegPRzBLwji8vUV
   Foq0hhk0PFj/FcwMUCZwLtPEydbCvTdHJtfm0gyQn+F6WVtgC42MC1ADF
   Gy3i8rFp4JFSCggITDRbPfE9YwCFyxOvmE/blyWLDMgY2CLPdWXPnrRb2
   uMueTA4fxwtXD0wjG2jg5lWjaAJ9PKch24pTiNiQzo9EZEDRFllh+V4pW
   +dZmEaTHQ3sS3ZUmt3wLfdUCkQ9xMorRSzu40WZymaqEq2SqemXvzdWZQ
   w==;
X-CSE-ConnectionGUID: 1vGum7c3Tea+EeaVaVJEtg==
X-CSE-MsgGUID: VNiB/qPDTjuQJEdX8je8lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="12895800"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="12895800"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 22:55:25 -0700
X-CSE-ConnectionGUID: aN66RqmUQS+PWwcVORUOQQ==
X-CSE-MsgGUID: RS+sandXQrC0NKRncZgTAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="94299744"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Aug 2024 22:55:24 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbZdp-0005AC-0u;
	Wed, 07 Aug 2024 05:55:21 +0000
Date: Wed, 7 Aug 2024 13:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] percpu/x86: [RFH] Enable strict percpu checks
 via named AS qualifiers
Message-ID: <202408071315.cTqH5CME-lkp@intel.com>
References: <20240805184012.358023-4-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805184012.358023-4-ubizjak@gmail.com>

Hi Uros,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools tj-wq/for-next linus/master v6.11-rc2 next-20240806]
[cannot apply to tip/locking/core tip/x86/core dennis-percpu/for-next acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/percpu-Define-__pcpu_typeof/20240806-024253
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240805184012.358023-4-ubizjak%40gmail.com
patch subject: [RFC PATCH 3/3] percpu/x86: [RFH] Enable strict percpu checks via named AS qualifiers
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240807/202408071315.cTqH5CME-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071315.cTqH5CME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408071315.cTqH5CME-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/sched/user.h:7,
                    from include/linux/cred.h:18,
                    from include/linux/sched/signal.h:10,
                    from include/linux/ptrace.h:7,
                    from arch/openrisc/kernel/asm-offsets.c:28:
>> include/linux/alloc_tag.h:30:49: error: expected ':', ',', ';', '}' or '__attribute__' before '*' token
      30 |         struct alloc_tag_counters __percpu      *counters;
         |                                                 ^
>> include/linux/percpu.h:136:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
     136 | extern void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
         |                      ^
>> include/linux/percpu.h:138:45: error: expected ';', ',' or ')' before '*' token
     138 | extern size_t pcpu_alloc_size(void __percpu *__pdata);
         |                                             ^
   include/linux/percpu.h:157:39: error: expected ';', ',' or ')' before '*' token
     157 | extern void free_percpu(void __percpu *__pdata);
         |                                       ^
   In file included from include/linux/irqflags.h:17,
                    from arch/openrisc/include/asm/bitops.h:24,
                    from include/linux/bitops.h:68,
                    from include/linux/signal.h:61,
                    from arch/openrisc/kernel/asm-offsets.c:22:
   include/linux/percpu.h: In function '__free_free_percpu':
   include/linux/percpu.h:159:40: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
     159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
         |                                        ^
   include/linux/cleanup.h:62:54: note: in definition of macro 'DEFINE_FREE'
      62 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                      ^~~~~
>> include/linux/cleanup.h:62:60: error: '_T' undeclared (first use in this function)
      62 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                            ^~
   include/linux/percpu.h:159:1: note: in expansion of macro 'DEFINE_FREE'
     159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
         | ^~~~~~~~~~~
   include/linux/cleanup.h:62:60: note: each undeclared identifier is reported only once for each function it appears in
      62 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                            ^~
   include/linux/percpu.h:159:1: note: in expansion of macro 'DEFINE_FREE'
     159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
         | ^~~~~~~~~~~
>> include/linux/compiler_types.h:60:25: error: expected ')' before '__percpu_qual'
      60 | # define __percpu       __percpu_qual BTF_TYPE_TAG(percpu)
         |                         ^~~~~~~~~~~~~
   include/linux/cleanup.h:62:67: note: in definition of macro 'DEFINE_FREE'
      62 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                                   ^~~~~
   include/linux/percpu.h:159:31: note: in expansion of macro '__percpu'
     159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
         |                               ^~~~~~~~
   include/linux/cleanup.h:62:66: note: to match this '('
      62 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                                  ^
   include/linux/percpu.h:159:1: note: in expansion of macro 'DEFINE_FREE'
     159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
         | ^~~~~~~~~~~
>> include/linux/cleanup.h:62:66: error: void value not ignored as it ought to be
      62 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                                  ^~~~~~~~~~
   include/linux/percpu.h:159:1: note: in expansion of macro 'DEFINE_FREE'
     159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
         | ^~~~~~~~~~~
>> include/linux/percpu.h:159:43: error: implicit declaration of function 'free_percpu'; did you mean 'kfree_rcu'? [-Wimplicit-function-declaration]
     159 | DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
         |                                           ^~~~~~~~~~~
   include/linux/cleanup.h:62:78: note: in definition of macro 'DEFINE_FREE'
      62 |         static inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                                              ^~~~~
   In file included from <command-line>:
   include/linux/hrtimer.h: At top level:
>> include/linux/compiler_types.h:60:25: error: type defaults to 'int' in declaration of '__percpu_qual' [-Wimplicit-int]
      60 | # define __percpu       __percpu_qual BTF_TYPE_TAG(percpu)
         |                         ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:50:9: note: in expansion of macro '__percpu'
      50 |         __percpu __attribute__((section(PER_CPU_BASE_SECTION sec)))     \
         |         ^~~~~~~~
   include/linux/percpu-defs.h:101:16: note: in expansion of macro '__PCPU_ATTRS'
     101 |         extern __PCPU_ATTRS(sec) __typeof__(type) name
         |                ^~~~~~~~~~~~
   include/linux/percpu-defs.h:112:9: note: in expansion of macro 'DECLARE_PER_CPU_SECTION'
     112 |         DECLARE_PER_CPU_SECTION(type, name, "")
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hrtimer.h:215:1: note: in expansion of macro 'DECLARE_PER_CPU'
     215 | DECLARE_PER_CPU(struct tick_device, tick_cpu_device);
         | ^~~~~~~~~~~~~~~
   In file included from include/asm-generic/percpu.h:7,
                    from ./arch/openrisc/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19:
>> include/linux/percpu-defs.h:101:34: error: expected ',' or ';' before '__typeof__'
     101 |         extern __PCPU_ATTRS(sec) __typeof__(type) name
         |                                  ^~~~~~~~~~
   include/linux/percpu-defs.h:112:9: note: in expansion of macro 'DECLARE_PER_CPU_SECTION'
     112 |         DECLARE_PER_CPU_SECTION(type, name, "")
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hrtimer.h:215:1: note: in expansion of macro 'DECLARE_PER_CPU'
     215 | DECLARE_PER_CPU(struct tick_device, tick_cpu_device);
         | ^~~~~~~~~~~~~~~
   In file included from include/linux/random.h:153,
                    from include/linux/nodemask.h:98,
                    from include/linux/mmzone.h:18,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10:
>> include/linux/prandom.h:22:56: error: expected ';', ',' or ')' before '*' token
      22 | void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state);
         |                                                        ^
>> include/linux/local_lock.h:54:47: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
      54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
         |                                               ^
   include/linux/cleanup.h:108:9: note: in definition of macro 'DEFINE_CLASS'
     108 | typedef _type class_##_name##_t;                                        \
         |         ^~~~~
   include/linux/local_lock.h:54:1: note: in expansion of macro 'DEFINE_GUARD'
      54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
         | ^~~~~~~~~~~~
>> include/linux/local_lock.h:54:47: error: expected ';', ',' or ')' before '*' token
      54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
         |                                               ^
   include/linux/cleanup.h:109:47: note: in definition of macro 'DEFINE_CLASS'
     109 | static inline void class_##_name##_destructor(_type *p)                 \
         |                                               ^~~~~
   include/linux/local_lock.h:54:1: note: in expansion of macro 'DEFINE_GUARD'
      54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
         | ^~~~~~~~~~~~
>> include/linux/local_lock.h:54:47: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
      54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
         |                                               ^
   include/linux/cleanup.h:111:15: note: in definition of macro 'DEFINE_CLASS'
     111 | static inline _type class_##_name##_constructor(_init_args)             \
         |               ^~~~~
   include/linux/local_lock.h:54:1: note: in expansion of macro 'DEFINE_GUARD'
      54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
         | ^~~~~~~~~~~~
>> include/linux/cleanup.h:156:55: error: unknown type name 'class_local_lock_t'; did you mean 'class_read_lock_t'?
     156 |         static inline void * class_##_name##_lock_ptr(class_##_name##_t *_T) \
         |                                                       ^~~~~~
   include/linux/local_lock.h:54:1: note: in expansion of macro 'DEFINE_GUARD'
      54 | DEFINE_GUARD(local_lock, local_lock_t __percpu*,
         | ^~~~~~~~~~~~
   include/linux/local_lock.h:57:51: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
      57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
         |                                                   ^
   include/linux/cleanup.h:108:9: note: in definition of macro 'DEFINE_CLASS'
     108 | typedef _type class_##_name##_t;                                        \
         |         ^~~~~
   include/linux/local_lock.h:57:1: note: in expansion of macro 'DEFINE_GUARD'
      57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
         | ^~~~~~~~~~~~
   include/linux/local_lock.h:57:51: error: expected ';', ',' or ')' before '*' token
      57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
         |                                                   ^
   include/linux/cleanup.h:109:47: note: in definition of macro 'DEFINE_CLASS'
     109 | static inline void class_##_name##_destructor(_type *p)                 \
         |                                               ^~~~~
   include/linux/local_lock.h:57:1: note: in expansion of macro 'DEFINE_GUARD'
      57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
         | ^~~~~~~~~~~~
   include/linux/local_lock.h:57:51: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
      57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
         |                                                   ^
   include/linux/cleanup.h:111:15: note: in definition of macro 'DEFINE_CLASS'
     111 | static inline _type class_##_name##_constructor(_init_args)             \
         |               ^~~~~
   include/linux/local_lock.h:57:1: note: in expansion of macro 'DEFINE_GUARD'
      57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
         | ^~~~~~~~~~~~
>> include/linux/cleanup.h:156:55: error: unknown type name 'class_local_lock_irq_t'; did you mean 'class_read_lock_irq_t'?
     156 |         static inline void * class_##_name##_lock_ptr(class_##_name##_t *_T) \
         |                                                       ^~~~~~
   include/linux/local_lock.h:57:1: note: in expansion of macro 'DEFINE_GUARD'
      57 | DEFINE_GUARD(local_lock_irq, local_lock_t __percpu*,
         | ^~~~~~~~~~~~
>> include/linux/cleanup.h:203:15: error: expected ':', ',', ';', '}' or '__attribute__' before '*' token
     203 |         _type *lock;                                                    \
         |               ^
   include/linux/cleanup.h:236:1: note: in expansion of macro '__DEFINE_UNLOCK_GUARD'
     236 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h: In function 'class_local_lock_irqsave_destructor':
>> include/linux/cleanup.h:209:15: error: 'class_local_lock_irqsave_t' has no member named 'lock'
     209 |         if (_T->lock) { _unlock; }                                      \
         |               ^~
   include/linux/cleanup.h:236:1: note: in expansion of macro '__DEFINE_UNLOCK_GUARD'
     236 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/percpu-defs.h:219:29: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                             ^
   include/linux/cleanup.h:209:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     209 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:284:9: note: in expansion of macro '__verify_pcpu_ptr'
     284 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:289:33: note: in expansion of macro 'per_cpu_ptr'
     289 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:290:33: note: in expansion of macro 'raw_cpu_ptr'
     290 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   include/linux/local_lock_internal.h:108:36: note: in expansion of macro 'this_cpu_ptr'
     108 |                 local_lock_release(this_cpu_ptr(lock));         \
         |                                    ^~~~~~~~~~~~
   include/linux/local_lock.h:52:9: note: in expansion of macro '__local_unlock_irqrestore'
      52 |         __local_unlock_irqrestore(lock, flags)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:62:21: note: in expansion of macro 'local_unlock_irqrestore'
      62 |                     local_unlock_irqrestore(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/percpu-defs.h:219:30: error: '__vpp_verify' undeclared (first use in this function)
     219 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                              ^~~~~~~~~~~~
   include/linux/cleanup.h:209:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     209 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:284:9: note: in expansion of macro '__verify_pcpu_ptr'
     284 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:289:33: note: in expansion of macro 'per_cpu_ptr'
     289 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:290:33: note: in expansion of macro 'raw_cpu_ptr'
     290 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   include/linux/local_lock_internal.h:108:36: note: in expansion of macro 'this_cpu_ptr'
     108 |                 local_lock_release(this_cpu_ptr(lock));         \
         |                                    ^~~~~~~~~~~~
   include/linux/local_lock.h:52:9: note: in expansion of macro '__local_unlock_irqrestore'
      52 |         __local_unlock_irqrestore(lock, flags)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:62:21: note: in expansion of macro 'local_unlock_irqrestore'
      62 |                     local_unlock_irqrestore(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/local_lock.h:62:47: error: 'class_local_lock_irqsave_t' has no member named 'lock'
      62 |                     local_unlock_irqrestore(_T->lock, _T->flags),
         |                                               ^~
   include/linux/cleanup.h:209:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     209 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:284:9: note: in expansion of macro '__verify_pcpu_ptr'
     284 |         __verify_pcpu_ptr(ptr);                                         \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:289:33: note: in expansion of macro 'per_cpu_ptr'
     289 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:290:33: note: in expansion of macro 'raw_cpu_ptr'
     290 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   include/linux/local_lock_internal.h:108:36: note: in expansion of macro 'this_cpu_ptr'
     108 |                 local_lock_release(this_cpu_ptr(lock));         \
         |                                    ^~~~~~~~~~~~
   include/linux/local_lock.h:52:9: note: in expansion of macro '__local_unlock_irqrestore'
      52 |         __local_unlock_irqrestore(lock, flags)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:62:21: note: in expansion of macro 'local_unlock_irqrestore'
      62 |                     local_unlock_irqrestore(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:62:47: error: 'class_local_lock_irqsave_t' has no member named 'lock'
      62 |                     local_unlock_irqrestore(_T->lock, _T->flags),
         |                                               ^~
   include/linux/cleanup.h:209:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     209 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:286:9: note: in expansion of macro 'PERCPU_PTR'
     286 |         PERCPU_PTR(ptr);                                                \
         |         ^~~~~~~~~~
   include/linux/percpu-defs.h:289:33: note: in expansion of macro 'per_cpu_ptr'
     289 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:290:33: note: in expansion of macro 'raw_cpu_ptr'
     290 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   include/linux/local_lock_internal.h:108:36: note: in expansion of macro 'this_cpu_ptr'
     108 |                 local_lock_release(this_cpu_ptr(lock));         \
         |                                    ^~~~~~~~~~~~
   include/linux/local_lock.h:52:9: note: in expansion of macro '__local_unlock_irqrestore'
      52 |         __local_unlock_irqrestore(lock, flags)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:62:21: note: in expansion of macro 'local_unlock_irqrestore'
      62 |                     local_unlock_irqrestore(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:62:47: error: 'class_local_lock_irqsave_t' has no member named 'lock'
      62 |                     local_unlock_irqrestore(_T->lock, _T->flags),
         |                                               ^~
   include/linux/cleanup.h:209:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     209 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:279:10: note: in expansion of macro '__pcpu_typeof'
     279 |         (__pcpu_typeof(*(__p)) __kernel __force *)(ptr__);              \
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:286:9: note: in expansion of macro 'PERCPU_PTR'
     286 |         PERCPU_PTR(ptr);                                                \
         |         ^~~~~~~~~~
   include/linux/percpu-defs.h:289:33: note: in expansion of macro 'per_cpu_ptr'
     289 | #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
         |                                 ^~~~~~~~~~~
   include/linux/percpu-defs.h:290:33: note: in expansion of macro 'raw_cpu_ptr'
     290 | #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
         |                                 ^~~~~~~~~~~
   include/linux/local_lock_internal.h:108:36: note: in expansion of macro 'this_cpu_ptr'
     108 |                 local_lock_release(this_cpu_ptr(lock));         \
         |                                    ^~~~~~~~~~~~
   include/linux/local_lock.h:52:9: note: in expansion of macro '__local_unlock_irqrestore'
      52 |         __local_unlock_irqrestore(lock, flags)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:62:21: note: in expansion of macro 'local_unlock_irqrestore'
      62 |                     local_unlock_irqrestore(_T->lock, _T->flags),
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:62:57: error: 'class_local_lock_irqsave_t' has no member named 'flags'
      62 |                     local_unlock_irqrestore(_T->lock, _T->flags),
         |                                                         ^~
   include/linux/cleanup.h:209:25: note: in definition of macro '__DEFINE_UNLOCK_GUARD'
     209 |         if (_T->lock) { _unlock; }                                      \
         |                         ^~~~~~~
   include/linux/local_lock.h:60:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
      60 | DEFINE_LOCK_GUARD_1(local_lock_irqsave, local_lock_t __percpu,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:171:17: note: in expansion of macro 'typecheck'
     171 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/irqflags.h:234:39: note: in expansion of macro 'raw_local_irq_restore'
     234 | #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } while (0)
         |                                       ^~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:109:17: note: in expansion of macro 'local_irq_restore'
     109 |                 local_irq_restore(flags);                       \


vim +136 include/linux/percpu.h

e74e396204bfcb Tejun Heo          2009-03-30  135  
24e44cc22aa311 Suren Baghdasaryan 2024-03-21 @136  extern void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
24e44cc22aa311 Suren Baghdasaryan 2024-03-21  137  				   gfp_t gfp) __alloc_size(1);
b460bc8302f222 Hou Tao            2023-10-20 @138  extern size_t pcpu_alloc_size(void __percpu *__pdata);
54da6a0924311c Peter Zijlstra     2023-05-26  139  
24e44cc22aa311 Suren Baghdasaryan 2024-03-21  140  #define __alloc_percpu_gfp(_size, _align, _gfp)				\
24e44cc22aa311 Suren Baghdasaryan 2024-03-21  141  	alloc_hooks(pcpu_alloc_noprof(_size, _align, false, _gfp))
24e44cc22aa311 Suren Baghdasaryan 2024-03-21  142  #define __alloc_percpu(_size, _align)					\
24e44cc22aa311 Suren Baghdasaryan 2024-03-21  143  	alloc_hooks(pcpu_alloc_noprof(_size, _align, false, GFP_KERNEL))
24e44cc22aa311 Suren Baghdasaryan 2024-03-21  144  #define __alloc_reserved_percpu(_size, _align)				\
24e44cc22aa311 Suren Baghdasaryan 2024-03-21  145  	alloc_hooks(pcpu_alloc_noprof(_size, _align, true, GFP_KERNEL))
de380b55f92986 Tejun Heo          2010-03-24  146  
5835d96e9ce4ef Tejun Heo          2014-09-02  147  #define alloc_percpu_gfp(type, gfp)					\
5835d96e9ce4ef Tejun Heo          2014-09-02  148  	(typeof(type) __percpu *)__alloc_percpu_gfp(sizeof(type),	\
5835d96e9ce4ef Tejun Heo          2014-09-02  149  						__alignof__(type), gfp)
64ef291f46d795 Tejun Heo          2009-10-29  150  #define alloc_percpu(type)						\
5835d96e9ce4ef Tejun Heo          2014-09-02  151  	(typeof(type) __percpu *)__alloc_percpu(sizeof(type),		\
5835d96e9ce4ef Tejun Heo          2014-09-02  152  						__alignof__(type))
2c321f3f70bc28 Suren Baghdasaryan 2024-04-14  153  #define alloc_percpu_noprof(type)					\
2c321f3f70bc28 Suren Baghdasaryan 2024-04-14  154  	((typeof(type) __percpu *)pcpu_alloc_noprof(sizeof(type),	\
2c321f3f70bc28 Suren Baghdasaryan 2024-04-14  155  					__alignof__(type), false, GFP_KERNEL))
^1da177e4c3f41 Linus Torvalds     2005-04-16  156  
24e44cc22aa311 Suren Baghdasaryan 2024-03-21  157  extern void free_percpu(void __percpu *__pdata);
24e44cc22aa311 Suren Baghdasaryan 2024-03-21  158  
24e44cc22aa311 Suren Baghdasaryan 2024-03-21 @159  DEFINE_FREE(free_percpu, void __percpu *, free_percpu(_T))
24e44cc22aa311 Suren Baghdasaryan 2024-03-21  160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
