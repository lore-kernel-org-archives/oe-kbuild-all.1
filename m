Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA713C008A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 11:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768995097; cv=none; b=geNF0vFeCLGOnS2WLJwtDUnhIdayWWbBo10F7QWwjnGB3G/SKXzxseCRxk6V+pBDiZQARkRnB5AtTv8Ee7sZ/jz69zlD0Go10GdXnqkbp5oXcJ4UM6W5vaJGt+PDd1QOqJBSJCcScVVKpw9edCyeLRnjKkDKN4Be2Gv44KdeQfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768995097; c=relaxed/simple;
	bh=gs1aw9rKA0eKhzCAeFzmZEjSyIbk4i2IJOjNqKZI4ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxBt8UBmCWKVfzhEuybq2SLZJStyIxcTWH62UcmkUvsWkJT1GldQ6+ANKLYnfxLPmhmroZo2YXWmxgNbU9BactqVi8fhOdddyEwNE+2VgH9ful9BegTfQ1S9iY6inR3yROTAXNP2WT2l5F2rY047/6QfCx+pigh4bhOG2M7Ew20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bowz42Qi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bowz42Qi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768995095; x=1800531095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gs1aw9rKA0eKhzCAeFzmZEjSyIbk4i2IJOjNqKZI4ks=;
  b=Bowz42Qi5REnfh96v3Zb8EWeK8l6KmrMs/Q1zSMbDQS3YJDxQs9VdkgR
   2NxmQuJ+a9p2vWg3Kqy+eEHvLIUuAUrl+A1E8xpEdEy2k4GElnHis+mMH
   nmww8Pu5lOK5kWjf8sJ49jQvVRC2uFpF7w2y7Y8Ca5Uohs0VUT8Vl+jh2
   ZYwVAd7esPLDzLcNAbTf4X4IV8/7gxJC1Iil3iMI91XxXh9KADXJSLV1S
   nBnwo3SoCHcMgHv0kGajiHh6FuMzBWq7RBlY/dQH9A02ETrk0XFZ+CYLt
   blJmHY1BVlXPlIHCuH/rvBFkBLM8TmTbXNynWRbcDNAbt3cI2YYVlOz7p
   w==;
X-CSE-ConnectionGUID: 5PkvdJaxR9+MjmKC0oOAZQ==
X-CSE-MsgGUID: gr16PbozTsi0LJiYGWdNyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92887959"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="92887959"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 03:31:34 -0800
X-CSE-ConnectionGUID: F+PiJFP7RSyD2bX2meljig==
X-CSE-MsgGUID: MbqidMWaRZukVAOXthGVDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206343788"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 03:31:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viWQs-00000000RC7-1ywG;
	Wed, 21 Jan 2026 11:31:30 +0000
Date: Wed, 21 Jan 2026 19:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH -next 1/7] vmscan: add memcg heat level for reclaim
Message-ID: <202601211944.R2nx1Vd1-lkp@intel.com>
References: <20260120134256.2271710-2-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120134256.2271710-2-chenridong@huaweicloud.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260119]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/vmscan-add-memcg-heat-level-for-reclaim/20260120-220026
base:   next-20260119
patch link:    https://lore.kernel.org/r/20260120134256.2271710-2-chenridong%40huaweicloud.com
patch subject: [RFC PATCH -next 1/7] vmscan: add memcg heat level for reclaim
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260121/202601211944.R2nx1Vd1-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211944.R2nx1Vd1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211944.R2nx1Vd1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/vmscan.c:5994:38: warning: 'struct mem_cgroup_per_node' declared inside parameter list will not be visible outside of this definition or declaration
    5994 | static void memcg_adjust_heat(struct mem_cgroup_per_node *pn, long delta)
         |                                      ^~~~~~~~~~~~~~~~~~~
   mm/vmscan.c: In function 'memcg_adjust_heat':
>> mm/vmscan.c:5998:34: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    5998 |         if (mem_cgroup_is_root(pn->memcg))
         |                                  ^~
   mm/vmscan.c:6001:36: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6001 |         heat = atomic_long_read(&pn->reclaim.heat);
         |                                    ^~
   mm/vmscan.c:6004:44: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6004 |                 if (atomic_long_cmpxchg(&pn->reclaim.heat, heat, new_heat) == heat)
         |                                            ^~
   mm/vmscan.c:6006:44: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6006 |                 heat = atomic_long_read(&pn->reclaim.heat);
         |                                            ^~
   mm/vmscan.c: At top level:
   mm/vmscan.c:6010:37: warning: 'struct mem_cgroup_per_node' declared inside parameter list will not be visible outside of this definition or declaration
    6010 | static void memcg_decay_heat(struct mem_cgroup_per_node *pn)
         |                                     ^~~~~~~~~~~~~~~~~~~
   mm/vmscan.c: In function 'memcg_decay_heat':
   mm/vmscan.c:6015:34: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6015 |         if (mem_cgroup_is_root(pn->memcg))
         |                                  ^~
   In file included from <command-line>:
   mm/vmscan.c:6018:28: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                            ^~
   include/linux/compiler_types.h:676:23: note: in definition of macro '__compiletime_assert'
     676 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:696:9: note: in expansion of macro '_compiletime_assert'
     696 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:6018:16: note: in expansion of macro 'READ_ONCE'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                ^~~~~~~~~
   mm/vmscan.c:6018:28: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                            ^~
   include/linux/compiler_types.h:676:23: note: in definition of macro '__compiletime_assert'
     676 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:696:9: note: in expansion of macro '_compiletime_assert'
     696 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:6018:16: note: in expansion of macro 'READ_ONCE'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                ^~~~~~~~~
   mm/vmscan.c:6018:28: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                            ^~
   include/linux/compiler_types.h:676:23: note: in definition of macro '__compiletime_assert'
     676 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:696:9: note: in expansion of macro '_compiletime_assert'
     696 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:6018:16: note: in expansion of macro 'READ_ONCE'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                ^~~~~~~~~
   mm/vmscan.c:6018:28: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                            ^~
   include/linux/compiler_types.h:676:23: note: in definition of macro '__compiletime_assert'
     676 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:696:9: note: in expansion of macro '_compiletime_assert'
     696 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:6018:16: note: in expansion of macro 'READ_ONCE'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                ^~~~~~~~~
   mm/vmscan.c:6018:28: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                            ^~
   include/linux/compiler_types.h:676:23: note: in definition of macro '__compiletime_assert'
     676 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:696:9: note: in expansion of macro '_compiletime_assert'
     696 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:6018:16: note: in expansion of macro 'READ_ONCE'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                ^~~~~~~~~
   mm/vmscan.c:6018:28: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                            ^~
   include/linux/compiler_types.h:632:53: note: in definition of macro '__unqual_scalar_typeof'
     632 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   mm/vmscan.c:6018:16: note: in expansion of macro 'READ_ONCE'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                ^~~~~~~~~
   In file included from arch/alpha/include/asm/rwonce.h:33,
                    from include/linux/compiler.h:372,
                    from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/alpha/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/vmscan.c:15:
   mm/vmscan.c:6018:28: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                            ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   mm/vmscan.c:6018:16: note: in expansion of macro 'READ_ONCE'
    6018 |         last = READ_ONCE(pn->reclaim.last_decay);
         |                ^~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   mm/vmscan.c:6022:24: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6022 |         if (cmpxchg(&pn->reclaim.last_decay, last, now) != last)
         |                        ^~
   include/linux/atomic/atomic-instrumented.h:4785:16: note: in definition of macro 'cmpxchg'
    4785 |         typeof(ptr) __ai_ptr = (ptr); \
         |                ^~~
   mm/vmscan.c:6022:24: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6022 |         if (cmpxchg(&pn->reclaim.last_decay, last, now) != last)
         |                        ^~
   include/linux/atomic/atomic-instrumented.h:4785:33: note: in definition of macro 'cmpxchg'
    4785 |         typeof(ptr) __ai_ptr = (ptr); \
         |                                 ^~~
>> include/linux/atomic/atomic-instrumented.h:4787:55: error: invalid type argument of unary '*' (have 'int')
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   mm/vmscan.c:6022:13: note: in expansion of macro 'cmpxchg'
    6022 |         if (cmpxchg(&pn->reclaim.last_decay, last, now) != last)
         |             ^~~~~~~
   include/linux/atomic/atomic-instrumented.h:4787:38: error: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4787 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   mm/vmscan.c:6022:13: note: in expansion of macro 'cmpxchg'
    6022 |         if (cmpxchg(&pn->reclaim.last_decay, last, now) != last)
         |             ^~~~~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17:
   include/linux/instrumented.h:110:79: note: expected 'const volatile void *' but argument is of type 'int'
     110 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/alpha/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7:
>> arch/alpha/include/asm/cmpxchg.h:267:20: error: invalid type argument of unary '*' (have 'int')
     267 |         __typeof__(*(ptr)) __ret;                                       \
         |                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/vmscan.c:6022:13: note: in expansion of macro 'cmpxchg'
    6022 |         if (cmpxchg(&pn->reclaim.last_decay, last, now) != last)
         |             ^~~~~~~
   arch/alpha/include/asm/cmpxchg.h:268:20: error: invalid type argument of unary '*' (have 'int')
     268 |         __typeof__(*(ptr)) _o_ = (o);                                   \
         |                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/vmscan.c:6022:13: note: in expansion of macro 'cmpxchg'
    6022 |         if (cmpxchg(&pn->reclaim.last_decay, last, now) != last)
         |             ^~~~~~~
   arch/alpha/include/asm/cmpxchg.h:269:20: error: invalid type argument of unary '*' (have 'int')
     269 |         __typeof__(*(ptr)) _n_ = (n);                                   \
         |                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/vmscan.c:6022:13: note: in expansion of macro 'cmpxchg'
    6022 |         if (cmpxchg(&pn->reclaim.last_decay, last, now) != last)
         |             ^~~~~~~
   arch/alpha/include/asm/cmpxchg.h:271:29: error: invalid type argument of unary '*' (have 'int')
     271 |         __ret = (__typeof__(*(ptr))) ____cmpxchg((ptr),                 \
         |                             ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/vmscan.c:6022:13: note: in expansion of macro 'cmpxchg'
    6022 |         if (cmpxchg(&pn->reclaim.last_decay, last, now) != last)
         |             ^~~~~~~
   arch/alpha/include/asm/cmpxchg.h:272:64: error: invalid type argument of unary '*' (have 'int')
     272 |                 (unsigned long)_o_, (unsigned long)_n_, sizeof(*(ptr)));\
         |                                                                ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/vmscan.c:6022:13: note: in expansion of macro 'cmpxchg'
    6022 |         if (cmpxchg(&pn->reclaim.last_decay, last, now) != last)
         |             ^~~~~~~
>> arch/alpha/include/asm/cmpxchg.h:271:50: error: passing argument 1 of '____cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
     271 |         __ret = (__typeof__(*(ptr))) ____cmpxchg((ptr),                 \
         |                                                  ^~~~~
         |                                                  |
         |                                                  int
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
    4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~
   mm/vmscan.c:6022:13: note: in expansion of macro 'cmpxchg'
    6022 |         if (cmpxchg(&pn->reclaim.last_decay, last, now) != last)
         |             ^~~~~~~
   arch/alpha/include/asm/cmpxchg.h:217:28: note: expected 'volatile void *' but argument is of type 'int'
     217 | ____cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
         |             ~~~~~~~~~~~~~~~^~~
>> mm/vmscan.c:6025:27: error: passing argument 1 of 'memcg_adjust_heat' from incompatible pointer type [-Wincompatible-pointer-types]
    6025 |         memcg_adjust_heat(pn, -MEMCG_HEAT_DECAY_STEP);
         |                           ^~
         |                           |
         |                           struct mem_cgroup_per_node *
   mm/vmscan.c:5994:59: note: expected 'struct mem_cgroup_per_node *' but argument is of type 'struct mem_cgroup_per_node *'
    5994 | static void memcg_adjust_heat(struct mem_cgroup_per_node *pn, long delta)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/vmscan.c: At top level:
   mm/vmscan.c:6028:36: warning: 'struct mem_cgroup_per_node' declared inside parameter list will not be visible outside of this definition or declaration
    6028 | static int memcg_heat_level(struct mem_cgroup_per_node *pn)
         |                                    ^~~~~~~~~~~~~~~~~~~
   mm/vmscan.c: In function 'memcg_heat_level':
   mm/vmscan.c:6032:34: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6032 |         if (mem_cgroup_is_root(pn->memcg))
         |                                  ^~
>> mm/vmscan.c:6035:26: error: passing argument 1 of 'memcg_decay_heat' from incompatible pointer type [-Wincompatible-pointer-types]
    6035 |         memcg_decay_heat(pn);
         |                          ^~
         |                          |
         |                          struct mem_cgroup_per_node *
   mm/vmscan.c:6010:58: note: expected 'struct mem_cgroup_per_node *' but argument is of type 'struct mem_cgroup_per_node *'
    6010 | static void memcg_decay_heat(struct mem_cgroup_per_node *pn)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/vmscan.c:6036:36: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6036 |         heat = atomic_long_read(&pn->reclaim.heat);
         |                                    ^~
   mm/vmscan.c: At top level:
   mm/vmscan.c:6045:48: warning: 'struct mem_cgroup_per_node' declared inside parameter list will not be visible outside of this definition or declaration
    6045 | static void memcg_record_reclaim_result(struct mem_cgroup_per_node *pn,
         |                                                ^~~~~~~~~~~~~~~~~~~
   mm/vmscan.c: In function 'memcg_record_reclaim_result':
   mm/vmscan.c:6052:34: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6052 |         if (mem_cgroup_is_root(pn->memcg))
         |                                  ^~
   mm/vmscan.c:6055:26: error: passing argument 1 of 'memcg_decay_heat' from incompatible pointer type [-Wincompatible-pointer-types]
    6055 |         memcg_decay_heat(pn);
         |                          ^~
         |                          |
         |                          struct mem_cgroup_per_node *
   mm/vmscan.c:6010:58: note: expected 'struct mem_cgroup_per_node *' but argument is of type 'struct mem_cgroup_per_node *'
    6010 | static void memcg_decay_heat(struct mem_cgroup_per_node *pn)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/vmscan.c:6087:44: error: invalid use of undefined type 'struct mem_cgroup_per_node'
    6087 |                 prev = atomic_long_xchg(&pn->reclaim.last_refault, total_refaults);
         |                                            ^~
   mm/vmscan.c:6096:27: error: passing argument 1 of 'memcg_adjust_heat' from incompatible pointer type [-Wincompatible-pointer-types]
    6096 |         memcg_adjust_heat(pn, delta);
         |                           ^~
         |                           |
         |                           struct mem_cgroup_per_node *
   mm/vmscan.c:5994:59: note: expected 'struct mem_cgroup_per_node *' but argument is of type 'struct mem_cgroup_per_node *'
    5994 | static void memcg_adjust_heat(struct mem_cgroup_per_node *pn, long delta)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/vmscan.c: In function 'shrink_node_memcgs':
>> mm/vmscan.c:6129:63: error: invalid use of undefined type 'struct mem_cgroup'
    6129 |                         struct mem_cgroup_per_node *pn = memcg->nodeinfo[pgdat->node_id];
         |                                                               ^~
>> mm/vmscan.c:6161:66: error: passing argument 1 of 'memcg_heat_level' from incompatible pointer type [-Wincompatible-pointer-types]
    6161 |                         if (root_reclaim(sc) && memcg_heat_level(pn) > level) {
         |                                                                  ^~
         |                                                                  |
         |                                                                  struct mem_cgroup_per_node *
   mm/vmscan.c:6028:57: note: expected 'struct mem_cgroup_per_node *' but argument is of type 'struct mem_cgroup_per_node *'
    6028 | static int memcg_heat_level(struct mem_cgroup_per_node *pn)
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
>> mm/vmscan.c:6175:61: error: passing argument 1 of 'memcg_record_reclaim_result' from incompatible pointer type [-Wincompatible-pointer-types]
    6175 |                                 memcg_record_reclaim_result(pn, lruvec,
         |                                                             ^~
         |                                                             |
         |                                                             struct mem_cgroup_per_node *
   mm/vmscan.c:6045:69: note: expected 'struct mem_cgroup_per_node *' but argument is of type 'struct mem_cgroup_per_node *'
    6045 | static void memcg_record_reclaim_result(struct mem_cgroup_per_node *pn,
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~


vim +5998 mm/vmscan.c

  5993	
> 5994	static void memcg_adjust_heat(struct mem_cgroup_per_node *pn, long delta)
  5995	{
  5996		long heat, new_heat;
  5997	
> 5998		if (mem_cgroup_is_root(pn->memcg))
  5999			return;
  6000	
  6001		heat = atomic_long_read(&pn->reclaim.heat);
  6002		do {
  6003			new_heat = clamp_t(long, heat + delta, 0, MEMCG_HEAT_MAX);
  6004			if (atomic_long_cmpxchg(&pn->reclaim.heat, heat, new_heat) == heat)
  6005				break;
  6006			heat = atomic_long_read(&pn->reclaim.heat);
  6007		} while (1);
  6008	}
  6009	
  6010	static void memcg_decay_heat(struct mem_cgroup_per_node *pn)
  6011	{
  6012		unsigned long last;
  6013		unsigned long now = jiffies;
  6014	
  6015		if (mem_cgroup_is_root(pn->memcg))
  6016			return;
  6017	
  6018		last = READ_ONCE(pn->reclaim.last_decay);
  6019		if (!time_after(now, last + MEMCG_HEAT_DECAY_INTERVAL))
  6020			return;
  6021	
  6022		if (cmpxchg(&pn->reclaim.last_decay, last, now) != last)
  6023			return;
  6024	
> 6025		memcg_adjust_heat(pn, -MEMCG_HEAT_DECAY_STEP);
  6026	}
  6027	
  6028	static int memcg_heat_level(struct mem_cgroup_per_node *pn)
  6029	{
  6030		long heat;
  6031	
  6032		if (mem_cgroup_is_root(pn->memcg))
  6033			return MEMCG_LEVEL_COLD;
  6034	
> 6035		memcg_decay_heat(pn);
  6036		heat = atomic_long_read(&pn->reclaim.heat);
  6037	
  6038		if (heat >= MEMCG_HEAT_HOT)
  6039			return MEMCG_LEVEL_HOT;
  6040		if (heat >= MEMCG_HEAT_WARM)
  6041			return MEMCG_LEVEL_WARM;
  6042		return MEMCG_LEVEL_COLD;
  6043	}
  6044	
  6045	static void memcg_record_reclaim_result(struct mem_cgroup_per_node *pn,
  6046						struct lruvec *lruvec,
  6047						unsigned long scanned,
  6048						unsigned long reclaimed)
  6049	{
  6050		long delta;
  6051	
  6052		if (mem_cgroup_is_root(pn->memcg))
  6053			return;
  6054	
  6055		memcg_decay_heat(pn);
  6056	
  6057		/*
  6058		 * Memory cgroup heat adjustment algorithm:
  6059		 * - If scanned == 0: mark as hottest (+MAX_HEAT)
  6060		 * - If reclaimed >= 50% * scanned: strong cool (-2)
  6061		 * - If reclaimed >= 25% * scanned: mild cool (-1)
  6062		 * - Otherwise:  warm up (+1)
  6063		 */
  6064		if (!scanned)
  6065			delta = MEMCG_HEAT_MAX;
  6066		else if (reclaimed * 2 >= scanned)
  6067			delta = -2;
  6068		else if (reclaimed * 4 >= scanned)
  6069			delta = -1;
  6070		else
  6071			delta = 1;
  6072	
  6073		/*
  6074		 * Refault-based heat adjustment:
  6075		 * - If refault increase > reclaimed pages: heat up (more cautious reclaim)
  6076		 * - If no refaults and currently warm:     cool down (allow more reclaim)
  6077		 * This prevents thrashing by backing off when refaults indicate over-reclaim.
  6078		 */
  6079		if (lruvec) {
  6080			unsigned long total_refaults;
  6081			unsigned long prev;
  6082			long refault_delta;
  6083	
  6084			total_refaults = lruvec_page_state(lruvec, WORKINGSET_ACTIVATE_ANON);
  6085			total_refaults += lruvec_page_state(lruvec, WORKINGSET_ACTIVATE_FILE);
  6086	
  6087			prev = atomic_long_xchg(&pn->reclaim.last_refault, total_refaults);
  6088			refault_delta = total_refaults - prev;
  6089	
  6090			if (refault_delta > reclaimed)
  6091				delta++;
  6092			else if (!refault_delta && delta > 0)
  6093				delta--;
  6094		}
  6095	
  6096		memcg_adjust_heat(pn, delta);
  6097	}
  6098	
  6099	static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
  6100	{
  6101		struct mem_cgroup *target_memcg = sc->target_mem_cgroup;
  6102		struct mem_cgroup_reclaim_cookie reclaim = {
  6103			.pgdat = pgdat,
  6104		};
  6105		struct mem_cgroup_reclaim_cookie *partial = &reclaim;
  6106		struct mem_cgroup *memcg;
  6107		int level;
  6108		int max_level = root_reclaim(sc) ? MEMCG_LEVEL_MAX : MEMCG_LEVEL_WARM;
  6109		/*
  6110		 * In most cases, direct reclaimers can do partial walks
  6111		 * through the cgroup tree, using an iterator state that
  6112		 * persists across invocations. This strikes a balance between
  6113		 * fairness and allocation latency.
  6114		 *
  6115		 * For kswapd, reliable forward progress is more important
  6116		 * than a quick return to idle. Always do full walks.
  6117		 */
  6118		if (current_is_kswapd() || sc->memcg_full_walk)
  6119			partial = NULL;
  6120	
  6121		for (level = MEMCG_LEVEL_COLD; level < max_level; level++) {
  6122			bool need_next_level = false;
  6123	
  6124			memcg = mem_cgroup_iter(target_memcg, NULL, partial);
  6125			do {
  6126				struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
  6127				unsigned long reclaimed;
  6128				unsigned long scanned;
> 6129				struct mem_cgroup_per_node *pn = memcg->nodeinfo[pgdat->node_id];
  6130	
  6131				/*
  6132				 * This loop can become CPU-bound when target memcgs
  6133				 * aren't eligible for reclaim - either because they
  6134				 * don't have any reclaimable pages, or because their
  6135				 * memory is explicitly protected. Avoid soft lockups.
  6136				 */
  6137				cond_resched();
  6138	
  6139				mem_cgroup_calculate_protection(target_memcg, memcg);
  6140	
  6141				if (mem_cgroup_below_min(target_memcg, memcg)) {
  6142					/*
  6143					 * Hard protection.
  6144					 * If there is no reclaimable memory, OOM.
  6145					 */
  6146					continue;
  6147				} else if (mem_cgroup_below_low(target_memcg, memcg)) {
  6148					/*
  6149					 * Soft protection.
  6150					 * Respect the protection only as long as
  6151					 * there is an unprotected supply
  6152					 * of reclaimable memory from other cgroups.
  6153					 */
  6154					if (!sc->memcg_low_reclaim) {
  6155						sc->memcg_low_skipped = 1;
  6156						continue;
  6157					}
  6158					memcg_memory_event(memcg, MEMCG_LOW);
  6159				}
  6160	
> 6161				if (root_reclaim(sc) && memcg_heat_level(pn) > level) {
  6162					need_next_level = true;
  6163					continue;
  6164				}
  6165	
  6166				reclaimed = sc->nr_reclaimed;
  6167				scanned = sc->nr_scanned;
  6168	
  6169				shrink_lruvec(lruvec, sc);
  6170				if (!memcg || memcg_page_state(memcg, NR_SLAB_RECLAIMABLE_B))
  6171					shrink_slab(sc->gfp_mask, pgdat->node_id, memcg,
  6172						    sc->priority);
  6173	
  6174				if (root_reclaim(sc))
> 6175					memcg_record_reclaim_result(pn, lruvec,
  6176							    sc->nr_scanned - scanned,
  6177							    sc->nr_reclaimed - reclaimed);
  6178	
  6179				/* Record the group's reclaim efficiency */
  6180				if (!sc->proactive)
  6181					vmpressure(sc->gfp_mask, memcg, false,
  6182						   sc->nr_scanned - scanned,
  6183						   sc->nr_reclaimed - reclaimed);
  6184	
  6185				/* If partial walks are allowed, bail once goal is reached */
  6186				if (partial && sc->nr_reclaimed >= sc->nr_to_reclaim) {
  6187					mem_cgroup_iter_break(target_memcg, memcg);
  6188					break;
  6189				}
  6190			} while ((memcg = mem_cgroup_iter(target_memcg, memcg, partial)));
  6191	
  6192			if (!need_next_level)
  6193				break;
  6194		}
  6195	}
  6196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
