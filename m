Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE3A1DD0F2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 09:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363677; cv=none; b=t1zWI8mRxFHOgmoy5/Fy0xtusqNUEIoYqySsmMAkcuFkJqFIs4Z+JgQZhc50FWGldonJk6i8shzNJ+Kddb9nBjhENioHnvXOhMS0+34gcno6pw+PyySnvzuFqM3ZOrrysNIcfumcQcLjdvwKN5sJiueQqp+bJN4PtW9EFQmhJeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363677; c=relaxed/simple;
	bh=1ZbghlNtuiA+cou23vrNmacBGe55epMfSmOvbQU3sJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gq1cX6GAQf4Tmvo2KsEvQ5/vbJxhSlkh+D0FIlMyipbLJ3E+bje95iCDZLgCuDZl65WHUUTkFwgphKOQla7K26H7Co0cSb8JjwHrpKmQJbk+mr4uZnJjQop0Jqf5HdCbvcJvM5dZXQ3SnBEtSRkUGUhaQiv9IRGkLH8OX6hZDZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBrkG4Hz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBrkG4Hz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744363674; x=1775899674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZbghlNtuiA+cou23vrNmacBGe55epMfSmOvbQU3sJY=;
  b=VBrkG4HzDT+oAGKtxR1xPrWOO6lAYBY4lFRAZh71u0Mg0it0w+aGmlWz
   C+GLvjX2W4L+y6/P71+hGsqG0SEmEp9pShIw12l7QXspLVpHAoys3oBS8
   f8l2bdoUOsgJb08f9cLl0Dd5QVfrGEx+pfdVpmkm+QoXHEAvj4CI5W2kL
   wNDG5dzhDm1yeDLTDKpf5YwibjByjEKTQhHmua4bLFM4S+k4ZcA3tCfm6
   YMdaxEKOuXa6xLl8IAWCJjp4+aL2DusjCX4gjZEGZfaO05Bsa8LspHsgT
   ifikDgij4NynSKTlC7gTzxVQ4ZH7Wp7QuEbZ4v6YHYUmJIZ4d7UcSEV5a
   g==;
X-CSE-ConnectionGUID: Tue/psZ7S6GNbrHSqARqbA==
X-CSE-MsgGUID: ocYuEtUnQS6iEuwyDyaHoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45814627"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45814627"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:27:53 -0700
X-CSE-ConnectionGUID: lTJ7AptsRziEEjbGFp7sqA==
X-CSE-MsgGUID: BrU5zXCESme5y4sedU1nxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="160118271"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Apr 2025 02:27:51 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Aft-000B04-0q;
	Fri, 11 Apr 2025 09:27:49 +0000
Date: Fri, 11 Apr 2025 17:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:trylock 7/7] mm/slub.c:4430:38: error: 'struct kmem_cache'
 has no member named 'cpu_slab'
Message-ID: <202504111706.PioXoxAe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   28e3f03dae020bb273ab4d5dd660849e08e89bb9
commit: 28e3f03dae020bb273ab4d5dd660849e08e89bb9 [7/7] slab: Introduce try_kmalloc() and kfree_nolock().
config: nios2-randconfig-002-20250411 (https://download.01.org/0day-ci/archive/20250411/202504111706.PioXoxAe-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111706.PioXoxAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111706.PioXoxAe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:0:0:
   mm/slub.c: In function 'try_kmalloc_noprof':
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:263:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:225:3: note: in expansion of macro 'TYPEOF_UNQUAL'
     (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:263:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:225:3: note: in expansion of macro 'TYPEOF_UNQUAL'
     (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:263:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:225:3: note: in expansion of macro 'TYPEOF_UNQUAL'
     (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:263:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:225:3: note: in expansion of macro 'TYPEOF_UNQUAL'
     (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
                        ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:263:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:225:3: note: in expansion of macro 'TYPEOF_UNQUAL'
     (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:537:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
     ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
     compiletime_assert_rwonce_type(x);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:513:13: note: in definition of macro '__unqual_scalar_typeof'
      _Generic((x),      \
                ^
   include/asm-generic/rwonce.h:50:2: note: in expansion of macro '__READ_ONCE'
     __READ_ONCE(x);       \
     ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:263:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:513:13: note: in definition of macro '__unqual_scalar_typeof'
      _Generic((x),      \
                ^
   include/asm-generic/rwonce.h:50:2: note: in expansion of macro '__READ_ONCE'
     __READ_ONCE(x);       \
     ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:225:3: note: in expansion of macro 'TYPEOF_UNQUAL'
     (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/linux/compiler_types.h:513:13: note: in definition of macro '__unqual_scalar_typeof'
      _Generic((x),      \
                ^
   include/asm-generic/rwonce.h:50:2: note: in expansion of macro '__READ_ONCE'
     __READ_ONCE(x);       \
     ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
   In file included from ./arch/nios2/include/generated/asm/rwonce.h:1:0,
                    from include/linux/compiler.h:390,
                    from include/asm-generic/bug.h:5,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/slub.c:13:
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ONCE'
    #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:263:2: note: in expansion of macro '__verify_pcpu_ptr'
     __verify_pcpu_ptr(ptr);      \
     ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
>> mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ONCE'
    #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:225:3: note: in expansion of macro 'TYPEOF_UNQUAL'
     (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
      ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~
   mm/slub.c:4430:38: error: 'struct kmem_cache' has no member named 'cpu_slab'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                                         ^
   include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ONCE'
    #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   include/linux/local_lock_internal.h:169:33: note: in expansion of macro 'READ_ONCE'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                    ^~~~~~~~~
   include/linux/percpu-defs.h:264:2: note: in expansion of macro 'PERCPU_PTR'
     PERCPU_PTR(ptr);      \
     ^~~~~~~~~~
   include/linux/percpu-defs.h:267:26: note: in expansion of macro 'per_cpu_ptr'
    #define raw_cpu_ptr(ptr) per_cpu_ptr(ptr, 0)
                             ^~~~~~~~~~~
   include/linux/percpu-defs.h:268:27: note: in expansion of macro 'raw_cpu_ptr'
    #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                              ^~~~~~~~~~~
   include/linux/local_lock_internal.h:169:43: note: in expansion of macro 'this_cpu_ptr'
    #define __local_lock_held(lock) READ_ONCE(this_cpu_ptr(lock)->acquired)
                                              ^~~~~~~~~~~~
   include/linux/local_lock.h:69:32: note: in expansion of macro '__local_lock_held'
    #define local_lock_held(lock)  __local_lock_held(lock)
                                   ^~~~~~~~~~~~~~~~~
   mm/slub.c:4430:20: note: in expansion of macro 'local_lock_held'
     if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
                       ^~~~~~~~~~~~~~~


vim +4430 mm/slub.c

  4394	
  4395	void *try_kmalloc_noprof(size_t size, gfp_t gfp_flags, int node)
  4396	{
  4397		gfp_t alloc_gfp = __GFP_NOWARN | __GFP_NOMEMALLOC | gfp_flags;
  4398		struct kmem_cache *s;
  4399		bool can_retry = true;
  4400		void *ret = ERR_PTR(-EBUSY);
  4401	
  4402		VM_WARN_ON_ONCE(gfp_flags & ~(__GFP_ACCOUNT | __GFP_ZERO));
  4403	
  4404		if (unlikely(size > KMALLOC_MAX_CACHE_SIZE))
  4405			return NULL;
  4406		if (unlikely(!size))
  4407			return ZERO_SIZE_PTR;
  4408	
  4409	retry:
  4410		s = kmalloc_slab(size, NULL, alloc_gfp, _RET_IP_);
  4411	
  4412		if (!USE_LOCKLESS_FAST_PATH() || !(s->flags & __CMPXCHG_DOUBLE))
  4413			/*
  4414			 * try_kmalloc() is not supported in PREEMPT_RT and
  4415			 * on architectures that don't implement cmpxchg16b.
  4416			 */
  4417			return NULL;
  4418	
  4419		/*
  4420		 * Do not call slab_alloc_node(), since trylock mode isn't
  4421		 * compatible with slab_pre_alloc_hook/should_failslab and
  4422		 * kfence_alloc.
  4423		 *
  4424		 * In !PREEMPT_RT ___slab_alloc() manipulates (freelist,tid) pair
  4425		 * in irq saved region. It assumes that the same cpu will not
  4426		 * __update_cpu_freelist_fast() into the same (freelist,tid) pair.
  4427		 * Therefore in_nmi() check whether particular bucket is in
  4428		 * irq protected.
  4429		 */
> 4430		if (!in_nmi() || !local_lock_held(&s->cpu_slab->lock))
  4431			ret = __slab_alloc_node(s, alloc_gfp, node, _RET_IP_, size);
  4432	
  4433		if (PTR_ERR(ret) == -EBUSY) {
  4434			if (can_retry) {
  4435				/* pick the next kmalloc bucket */
  4436				size = s->object_size + 1;
  4437				/*
  4438				 * Another alternative is to
  4439				 * if (memcg) alloc_gfp &= ~__GFP_ACCOUNT;
  4440				 * else if (!memcg) alloc_gfp |= __GFP_ACCOUNT;
  4441				 * to retry from bucket of the same size.
  4442				 */
  4443				can_retry = false;
  4444				goto retry;
  4445			}
  4446			ret = NULL;
  4447		}
  4448	
  4449		maybe_wipe_obj_freeptr(s, ret);
  4450		/*
  4451		 * Make sure memcg_stock.stock_lock doesn't change cpu
  4452		 * when memcg layers access it.
  4453		 */
  4454		preempt_disable();
  4455		slab_post_alloc_hook(s, NULL, alloc_gfp, 1, &ret,
  4456				     slab_want_init_on_alloc(alloc_gfp, s), size);
  4457		preempt_enable();
  4458	
  4459		ret = kasan_kmalloc(s, ret, size, alloc_gfp);
  4460		return ret;
  4461	}
  4462	EXPORT_SYMBOL_GPL(try_kmalloc_noprof);
  4463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
