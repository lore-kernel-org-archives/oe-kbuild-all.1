Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F892E718D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Jun 2025 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951168; cv=none; b=nhPvvTffTtb1ad7X8iJHkr1H4Z5WaVd+9GvuUBpKa0f38lCDZBBwsxpZMV/NGX5lkU+oMUo1nevJ18sDar+DqdyWO8+z/CyRc/4rAzkOKKnuCvp7kxWP6aAozv7JAztkYBytn1BKRobn1CYSuAhyO5Nh/7HaN+5fG6HuJvhbxdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951168; c=relaxed/simple;
	bh=snu57Ne6Cg4V6ZGGVQSxAwUcdMHrzYnpTUHGrCx2NAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kki9LlH41Pi9BpaL3hswcgpZ0iKAm42uaSA+CoqS/Cp++hsB7R6Tfgu8DaTolR1sMvv9AeAuFb2R3XhaYb9ld+S4foBXjfqMHKx2Xjhr4CsuZcY4YyCDJm0uxDP3K4HlBJfrsPF2mCVYln5kG61kPXd+CXoVr/AucEO51hkBF8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LswEo6jT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LswEo6jT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750951167; x=1782487167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=snu57Ne6Cg4V6ZGGVQSxAwUcdMHrzYnpTUHGrCx2NAk=;
  b=LswEo6jTFiEm4CiNEe0HAqpgWhc3paIBSbxUhR2usAShGX14KW7bO/xm
   mOLeOaKHkb+Rqp1ndQ+qnQoYEil+MeUIGa36tT6tSJlaCM+4HDzwMweOq
   JfD/Nmw3A/wkaykStzPKNNLQbzOgcyJ5zZdqqcGaMwSVfyjWi36YsHg1r
   YlF3dWdyNjUMrcduoWk7Rm3v2g4FeGIWuu0FuokOgNX7q4267/TSFf7+9
   seLeYLXsVJbPmLeqE/QuepUEBIh0nW/vzoatomb4IczghFsLTyBJPxgqb
   j+IPP0cYY9vt+LLBAhoLMppzClZCHEh+sxsA+58hI//HSmpGLxrnE2Gjf
   A==;
X-CSE-ConnectionGUID: qeXJGKJfQvi8D8vdbw0Fxg==
X-CSE-MsgGUID: 6GrmssEjQBOZ943TyKg9Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52371538"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="52371538"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:19:26 -0700
X-CSE-ConnectionGUID: 9Wtf6e37T/mU2P+8AP42Tg==
X-CSE-MsgGUID: z7I4lQEZSdmZi+ZgkFcB1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="176210377"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jun 2025 08:19:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUoNn-000UBw-0C;
	Thu, 26 Jun 2025 15:19:23 +0000
Date: Thu, 26 Jun 2025 23:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:unwind/perf 7/25] include/asm-generic/local64.h:47:9: error:
 implicit declaration of function 'local_cmpxchg'; did you mean
 'local64_cmpxchg'?
Message-ID: <202506262326.fWi7Ph5b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace unwind/perf
head:   ef14ef3b4ae3d7710e7249ca40ee5eed9979f781
commit: f773ef7b06cd28026b7d301370d5b389d04b20c2 [7/25] unwind_user/deferred: Make unwind deferral requests NMI-safe
config: arm64-randconfig-003-20250626 (https://download.01.org/0day-ci/archive/20250626/202506262326.fWi7Ph5b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506262326.fWi7Ph5b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506262326.fWi7Ph5b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/arm64/include/generated/asm/local64.h:1,
                    from include/linux/unwind_deferred_types.h:5,
                    from include/linux/sched.h:49,
                    from include/linux/percpu.h:12,
                    from include/asm-generic/local.h:5,
                    from ./arch/arm64/include/generated/asm/local.h:1,
                    from drivers/hwtracing/coresight/coresight-stm.c:18:
   include/asm-generic/local64.h:25:2: error: unknown type name 'local_t'
     local_t a;
     ^~~~~~~
   include/asm-generic/local64.h: In function 'local64_cmpxchg':
>> include/asm-generic/local64.h:47:9: error: implicit declaration of function 'local_cmpxchg'; did you mean 'local64_cmpxchg'? [-Werror=implicit-function-declaration]
     return local_cmpxchg(&l->a, old, new);
            ^~~~~~~~~~~~~
            local64_cmpxchg
   include/asm-generic/local64.h: In function 'local64_try_cmpxchg':
>> include/asm-generic/local64.h:52:9: error: implicit declaration of function 'local_try_cmpxchg'; did you mean 'local64_try_cmpxchg'? [-Werror=implicit-function-declaration]
     return local_try_cmpxchg(&l->a, (long *)old, new);
            ^~~~~~~~~~~~~~~~~
            local64_try_cmpxchg
   In file included from include/linux/sched.h:49,
                    from include/linux/percpu.h:12,
                    from include/asm-generic/local.h:5,
                    from ./arch/arm64/include/generated/asm/local.h:1,
                    from drivers/hwtracing/coresight/coresight-stm.c:18:
   include/linux/unwind_deferred_types.h: At top level:
   include/linux/unwind_deferred_types.h:17:2: error: unknown type name 'local_t'
     local_t   pending;
     ^~~~~~~
   In file included from ./arch/arm64/include/generated/asm/local.h:1,
                    from drivers/hwtracing/coresight/coresight-stm.c:18:
   include/linux/u64_stats_sync.h: In function 'u64_stats_read':
>> include/asm-generic/local.h:29:44: error: request for member 'a' in something not a structure or union
    #define local_read(l) atomic_long_read(&(l)->a)
                                               ^~
   include/asm-generic/local64.h:30:26: note: in expansion of macro 'local_read'
    #define local64_read(l)  local_read(&(l)->a)
                             ^~~~~~~~~~
   include/linux/u64_stats_sync.h:79:9: note: in expansion of macro 'local64_read'
     return local64_read(&p->v);
            ^~~~~~~~~~~~
   include/linux/u64_stats_sync.h: In function 'u64_stats_set':
   include/asm-generic/local.h:30:45: error: request for member 'a' in something not a structure or union
    #define local_set(l,i) atomic_long_set((&(l)->a),(i))
                                                ^~
   include/asm-generic/local64.h:31:26: note: in expansion of macro 'local_set'
    #define local64_set(l,i) local_set((&(l)->a),(i))
                             ^~~~~~~~~
   include/linux/u64_stats_sync.h:84:2: note: in expansion of macro 'local64_set'
     local64_set(&p->v, val);
     ^~~~~~~~~~~
   include/linux/u64_stats_sync.h: In function 'u64_stats_add':
   include/asm-generic/local.h:33:49: error: request for member 'a' in something not a structure or union
    #define local_add(i,l) atomic_long_add((i),(&(l)->a))
                                                    ^~
   include/asm-generic/local64.h:34:26: note: in expansion of macro 'local_add'
    #define local64_add(i,l) local_add((i),(&(l)->a))
                             ^~~~~~~~~
   include/linux/u64_stats_sync.h:89:2: note: in expansion of macro 'local64_add'
     local64_add(val, &p->v);
     ^~~~~~~~~~~
   include/linux/u64_stats_sync.h: In function 'u64_stats_inc':
   include/asm-generic/local.h:31:42: error: request for member 'a' in something not a structure or union
    #define local_inc(l) atomic_long_inc(&(l)->a)
                                             ^~
   include/asm-generic/local64.h:32:25: note: in expansion of macro 'local_inc'
    #define local64_inc(l)  local_inc(&(l)->a)
                            ^~~~~~~~~
   include/linux/u64_stats_sync.h:94:2: note: in expansion of macro 'local64_inc'
     local64_inc(&p->v);
     ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +47 include/asm-generic/local64.h

1996bda2a42480 Peter Zijlstra 2010-05-21  44  
8fc4fddaf9a184 Uros Bizjak    2023-04-05  45  static inline s64 local64_cmpxchg(local64_t *l, s64 old, s64 new)
8fc4fddaf9a184 Uros Bizjak    2023-04-05  46  {
8fc4fddaf9a184 Uros Bizjak    2023-04-05 @47  	return local_cmpxchg(&l->a, old, new);
8fc4fddaf9a184 Uros Bizjak    2023-04-05  48  }
8fc4fddaf9a184 Uros Bizjak    2023-04-05  49  
8fc4fddaf9a184 Uros Bizjak    2023-04-05  50  static inline bool local64_try_cmpxchg(local64_t *l, s64 *old, s64 new)
8fc4fddaf9a184 Uros Bizjak    2023-04-05  51  {
8fc4fddaf9a184 Uros Bizjak    2023-04-05 @52  	return local_try_cmpxchg(&l->a, (long *)old, new);
8fc4fddaf9a184 Uros Bizjak    2023-04-05  53  }
8fc4fddaf9a184 Uros Bizjak    2023-04-05  54  

:::::: The code at line 47 was first introduced by commit
:::::: 8fc4fddaf9a184eea7da21290236a1764e608a01 locking/generic: Wire up local{,64}_try_cmpxchg()

:::::: TO: Uros Bizjak <ubizjak@gmail.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
