Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA429369D4A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786738895; cv=none; b=ulznpqJW4ZNzp5DVOJBRau3MRVAGAWmfoLlQ/Puw9ggLw7TOZfjGuOJ/GNGhoYeBF9xnQSqEbuB34v9N/5DrT0BOP7WuNC7STRhyuanBy27L8PaiaWd3U2w1qHPE03oL7zMzwDfsASrgHGmfHlnhQ58Cs/MySzdcmAYKXCZXxAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786738895; c=relaxed/simple;
	bh=/radOUCjdveQl7Nb+2oS25KhBNzCj8TbQMJManaIy8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bsyVvoQ6C8r3rM6OtwULoz4HHQ5EAUhJKj7yQeOVvgZ6x6MGMTTjssUOf1/VWUXfgQyEB6N8qwW+aDVOHZAi+7dkJJW3ym69aMjgGFweEhQIPqZzVdQ31iTfbpXT0+o72IKOz2cYE/R2i8aJhjsuXzqidrgjPRkfPfdgrA6YVbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lpl6+a5f; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lpl6+a5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786738893; x=1818274893;
  h=date:from:to:cc:subject:message-id;
  bh=/radOUCjdveQl7Nb+2oS25KhBNzCj8TbQMJManaIy8U=;
  b=Lpl6+a5fPUtUM5h9ORlTREJivq+T7cALCgZFPrd8VpRDHEUUm1WQAa2d
   9kqAkHA0OfAJqiTa3Jq3pPgB5JNPpDH2MOYceoXEPz2wExef1OWxLjSgb
   cD7K+x3LPwR0txb9FfZENP0lZsWgOVEPitBQkl47a7tMkqGHuWcVzL78L
   /hpiRuXjyMon84QZPPlpqd/LaGNL2G768RAXdAIHFRFjV7bsmxVo/tjFz
   F8wR5phIe4aC8hdVuV1hzun3GxcOCt6SoUgfiqwxC9UyAhLwb54tJ7tS5
   NSAE5PDlGenBzerEs3bMqmRJ8txV9EnRl8LbbR71FSHbuszUJRNOVHuv8
   w==;
X-CSE-ConnectionGUID: QTKIfjX6RrCzfoGPlPe4dQ==
X-CSE-MsgGUID: 7Y69pPftQ6GLhbsZlEKdXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87245186"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87245186"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 13:21:32 -0700
X-CSE-ConnectionGUID: 0B1UiZs6Sp2TeI4u3pH9Xw==
X-CSE-MsgGUID: WTq13+3kSu2F4lncM8d5Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="261045663"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Aug 2026 13:21:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuyP6-00000000a5G-1Di3;
	Fri, 14 Aug 2026 20:21:24 +0000
Date: Sat, 15 Aug 2026 04:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/1]
 kernel/sched/core.c:1660:8: error: no member named 'avg' in 'struct
 sched_entity'
Message-ID: <202608150403.yIeC8QNv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   8b4ccabf3e6b7ef8ad04f513e8e5b1a5a1021267
commit: e0515f89730a8597730e11f244a80d37c7970d4a [0/1] CHROMIUM: FROMLIST: sched/fair: Add util_guest for tasks
config: i386-buildonly-randconfig-001-20260814 (https://download.01.org/0day-ci/archive/20260815/202608150403.yIeC8QNv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150403.yIeC8QNv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150403.yIeC8QNv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:1660:8: error: no member named 'avg' in 'struct sched_entity'
    1660 |         p->se.avg.util_guest = attr->sched_util_min;
         |         ~~~~~ ^
   1 error generated.
--
   kernel/sched/fair.c:4594:6: warning: no previous prototype for function 'set_next_entity' [-Wmissing-prototypes]
    4594 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^
   kernel/sched/fair.c:4594:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4594 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         | ^
         | static 
>> kernel/sched/fair.c:5712:22: error: no member named 'avg' in 'struct sched_entity'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                       ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:285:10: note: expanded from macro '__native_word'
     285 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:317:22: note: expanded from macro 'compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:305:23: note: expanded from macro '_compiletime_assert'
     305 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:297:9: note: expanded from macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/sched/fair.c:5712:22: error: no member named 'avg' in 'struct sched_entity'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                       ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:285:39: note: expanded from macro '__native_word'
     285 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:317:22: note: expanded from macro 'compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:305:23: note: expanded from macro '_compiletime_assert'
     305 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:297:9: note: expanded from macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/sched/fair.c:5712:22: error: no member named 'avg' in 'struct sched_entity'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                       ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:286:10: note: expanded from macro '__native_word'
     286 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:317:22: note: expanded from macro 'compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:305:23: note: expanded from macro '_compiletime_assert'
     305 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:297:9: note: expanded from macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/sched/fair.c:5712:22: error: no member named 'avg' in 'struct sched_entity'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                       ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:286:38: note: expanded from macro '__native_word'
     286 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:317:22: note: expanded from macro 'compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:305:23: note: expanded from macro '_compiletime_assert'
     305 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:297:9: note: expanded from macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/sched/fair.c:5712:22: error: no member named 'avg' in 'struct sched_entity'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                       ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:317:22: note: expanded from macro 'compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:305:23: note: expanded from macro '_compiletime_assert'
     305 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:297:9: note: expanded from macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> kernel/sched/fair.c:5712:22: error: no member named 'avg' in 'struct sched_entity'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                       ~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:274:13: note: expanded from macro '__unqual_scalar_typeof'
     274 |                 _Generic((x),                                           \
         |                           ^
>> kernel/sched/fair.c:5712:22: error: no member named 'avg' in 'struct sched_entity'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                       ~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:281:15: note: expanded from macro '__unqual_scalar_typeof'
     281 |                          default: (x)))
         |                                    ^
>> kernel/sched/fair.c:5712:22: error: no member named 'avg' in 'struct sched_entity'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                       ~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   1 warning and 8 errors generated.


vim +1660 kernel/sched/core.c

  1656	
  1657		if (likely(!(attr->sched_flags & SCHED_FLAG_UTIL_GUEST)))
  1658			return;
  1659	
> 1660		p->se.avg.util_guest = attr->sched_util_min;
  1661	}
  1662	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
