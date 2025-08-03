Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7A314E2F2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 22:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754259147; cv=none; b=nbnw7Yo0lHvc7Z3lrZcfoRMcrPzN8a+lOhTi/AHdRmL/J31+fuzopFXD5zUOpc7ic3V+Azyl8OWpu6s6xuoEC5ppRHE8W3HJejL/pISFozPG6WyOZit27PfmwI+Wu007KCiepzipeIYTCiMV+LLolJTkUFyk92d7iplxaVMWOwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754259147; c=relaxed/simple;
	bh=c3boaM5M+EZ2xuoCBSzcf9g9H/5t3KauZkwm3pTts1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lh+Mmd1N4J2VESbxfFppKBAbN3aUQmLBrgtGf3l/jZ3EDqAaKoFqPfaEO0U6dE46jUcgOpNqOx4+tBLZ9fHqDxqqtei1sivs/XRCyTz3emdsyGj4UiyX0KdjvyNiOo2LZCe6lfgbVciH158yshKpBFOjJsNPQgCj8JHsvHNIRHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yi8DkdOc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yi8DkdOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754259145; x=1785795145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c3boaM5M+EZ2xuoCBSzcf9g9H/5t3KauZkwm3pTts1I=;
  b=Yi8DkdOcWuiZxz3IXNy5qyuqcjYiIZ+ogB0C5y0r4b/Sl3I1mbzjAJ4P
   zLc1nZ4xZt8naL16+FTO3ZUHEnmfvQIZL7q0NixbJAonL9DEGQcba5Ik6
   qSqz72F7oK1wdXkyY74FsKlboDin3AQiz3FfkwEh7ne48mh9q+whk0vlR
   ZSRp/whuOKTybqujaEGIMisZUKOvaySmSWvA5mlBbZE3lNXU9XKMTq+Oq
   WHhFw56iRTCIwY6UttnJGLXotJNY38Kpk/OX+trRv+ISOr822ZqgSgQmH
   t2rvO6v1aEaAvk/nRIDIy98N18MHV4yoU8ZC8ZboBvtkOfVF9isSiw5XL
   Q==;
X-CSE-ConnectionGUID: a0lV28fyRWCGxqNospIHJQ==
X-CSE-MsgGUID: aH4E4NE1SGqFuCjB0CuIHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="44106960"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44106960"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 15:12:25 -0700
X-CSE-ConnectionGUID: HGHcYYbaTGeRm4tTDnLd3w==
X-CSE-MsgGUID: LeRscabwS1+9Pk6Ljqd8mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168188181"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2025 15:12:23 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uigwG-0006em-35;
	Sun, 03 Aug 2025 22:12:20 +0000
Date: Mon, 4 Aug 2025 06:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 34/34] kernel/sched/sched.h:3026:3:
 warning: raw_spinlock 'busiest->__lock' is not held on every path through
 here
Message-ID: <202508040808.Njjxa1F9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   0ec55cac64b4d3427708d952adc59cdd1d3493d1
commit: 0ec55cac64b4d3427708d952adc59cdd1d3493d1 [34/34] sched/core: Enable capability analysis
config: arm-randconfig-002-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040808.Njjxa1F9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040808.Njjxa1F9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040808.Njjxa1F9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:89:
>> kernel/sched/sched.h:3026:3: warning: raw_spinlock 'busiest->__lock' is not held on every path through here [-Wthread-safety-analysis]
    3026 |                 double_rq_clock_clear_update(this_rq, busiest);
         |                 ^
   kernel/sched/sched.h:3025:13: note: raw_spinlock acquired here
    3025 |             likely(raw_spin_rq_trylock(busiest))) {
         |                    ^
   kernel/sched/sched.h:3040:1: warning: raw_spinlock 'busiest->__lock' is not held on every path through here [-Wthread-safety-analysis]
    3040 | }
         | ^
   kernel/sched/sched.h:3037:2: note: raw_spinlock acquired here
    3037 |         double_rq_lock(this_rq, busiest);
         |         ^
>> kernel/sched/sched.h:3040:1: warning: expecting raw_spinlock 'busiest->__lock' to be held at the end of function [-Wthread-safety-analysis]
    3040 | }
         | ^
   kernel/sched/sched.h:3020:19: note: raw_spinlock acquired here
    3020 | static inline int _double_lock_balance(struct rq *this_rq, struct rq *busiest)
         |                   ^
>> kernel/sched/sched.h:3062:3: warning: releasing raw_spinlock '__rq_lockp(busiest)' that was not held [-Wthread-safety-analysis]
    3062 |                 __release(__rq_lockp(busiest)); /* fake release */
         |                 ^
   include/linux/compiler-capability-analysis.h:302:23: note: expanded from macro '__release'
     302 | #define __release(x)            __release_cap(x)
         |                                 ^
   In file included from kernel/sched/core.c:89:
   kernel/sched/sched.h:3063:2: warning: raw_spinlock 'busiest->__lock' is not held on every path through here [-Wthread-safety-analysis]
    3063 |         lock_set_subclass(&__rq_lockp(this_rq)->dep_map, 0, _RET_IP_);
         |         ^
   kernel/sched/sched.h:3057:2: note: raw_spinlock acquired here
    3057 |         __releases(&busiest->__lock)
         |         ^
   include/linux/compiler-capability-analysis.h:286:26: note: expanded from macro '__releases'
     286 | #define __releases(...)         __releases_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:20:47: note: expanded from macro '__releases_cap'
      20 | # define __releases_cap(...)                    __attribute__((release_capability(__VA_ARGS__)))
         |                                                                ^
   In file included from kernel/sched/core.c:89:
   In file included from kernel/sched/sched.h:3227:
>> kernel/sched/stats.h:209:3: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
     209 |                 __task_rq_unlock(rq, &rf);
         |                 ^
>> kernel/sched/stats.h:211:1: warning: raw_spinlock '__ret->__lock' is not held on every path through here [-Wthread-safety-analysis]
     211 | }
         | ^
   kernel/sched/stats.h:207:8: note: raw_spinlock acquired here
     207 |                 rq = __task_rq_lock(p, &rf);
         |                      ^
   kernel/sched/sched.h:1826:29: note: expanded from macro '__task_rq_lock'
    1826 | #define __task_rq_lock(...) __acquire_ret(___task_rq_lock(__VA_ARGS__), &__ret->__lock)
         |                             ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
>> kernel/sched/core.c:371:2: warning: expecting raw_spinlock '#undefined.__lock' to be held at start of each loop [-Wthread-safety-analysis]
     371 |         for_each_cpu(t, smt_mask)
         |         ^
   include/linux/cpumask.h:365:2: note: expanded from macro 'for_each_cpu'
     365 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ^
   include/linux/find.h:611:26: note: expanded from macro 'for_each_set_bit'
     611 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                 ^
   arch/arm/include/asm/bitops.h:205:34: note: expanded from macro 'find_next_bit'
     205 | #define find_next_bit(p,sz,off)         _find_next_bit_le(p,sz,off)
         |                                         ^
   kernel/sched/core.c:372:3: note: raw_spinlock acquired here
     372 |                 raw_spin_lock_nested(&cpu_rq(t)->__lock, i++);
         |                 ^
   include/linux/spinlock.h:222:2: note: expanded from macro 'raw_spin_lock_nested'
     222 |         _raw_spin_lock_nested(lock, subclass)
         |         ^
>> kernel/sched/core.c:381:3: warning: releasing raw_spinlock '#undefined.__lock' that was not held [-Wthread-safety-analysis]
     381 |                 raw_spin_unlock(&cpu_rq(t)->__lock);
         |                 ^
   include/linux/spinlock.h:277:32: note: expanded from macro 'raw_spin_unlock'
     277 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
         |                                         ^
>> kernel/sched/core.c:621:1: warning: raw_spinlock 'rq->__lock' is not held on every path through here [-Wthread-safety-analysis]
     621 | }
         | ^
   kernel/sched/core.c:604:3: note: raw_spinlock acquired here
     604 |                 raw_spin_lock_nested(&rq->__lock, subclass);
         |                 ^
   include/linux/spinlock.h:222:2: note: expanded from macro 'raw_spin_lock_nested'
     222 |         _raw_spin_lock_nested(lock, subclass)
         |         ^
>> kernel/sched/core.c:621:1: warning: raw_spinlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     621 | }
         | ^
   kernel/sched/core.c:613:3: note: raw_spinlock acquired here
     613 |                 raw_spin_lock_nested(lock, subclass);
         |                 ^
   include/linux/spinlock.h:222:2: note: expanded from macro 'raw_spin_lock_nested'
     222 |         _raw_spin_lock_nested(lock, subclass)
         |         ^
>> kernel/sched/core.c:621:1: warning: expecting raw_spinlock 'rq->__lock' to be held at the end of function [-Wthread-safety-analysis]
     621 | }
         | ^
   kernel/sched/core.c:599:6: note: raw_spinlock acquired here
     599 | void raw_spin_rq_lock_nested(struct rq *rq, int subclass)
         |      ^
>> kernel/sched/core.c:649:2: warning: releasing raw_spinlock 'rq_lockp(rq)' that was not held [-Wthread-safety-analysis]
     649 |         raw_spin_unlock(rq_lockp(rq));
         |         ^
   include/linux/spinlock.h:277:32: note: expanded from macro 'raw_spin_unlock'
     277 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
         |                                         ^
>> kernel/sched/core.c:650:1: warning: raw_spinlock 'rq->__lock' is still held at the end of function [-Wthread-safety-analysis]
     650 | }
         | ^
   kernel/sched/sched.h:1541:2: note: raw_spinlock acquired here
    1541 |         __releases(&rq->__lock);
         |         ^
   include/linux/compiler-capability-analysis.h:286:26: note: expanded from macro '__releases'
     286 | #define __releases(...)         __releases_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:20:47: note: expanded from macro '__releases_cap'
      20 | # define __releases_cap(...)                    __attribute__((release_capability(__VA_ARGS__)))
         |                                                                ^
>> kernel/sched/core.c:669:2: warning: raw_spinlock 'rq2->__lock' is not held on every path through here [-Wthread-safety-analysis]
     669 |         double_rq_clock_clear_update(rq1, rq2);
         |         ^
   kernel/sched/core.c:665:3: note: raw_spinlock acquired here
     665 |                 raw_spin_rq_lock_nested(rq2, SINGLE_DEPTH_NESTING);
         |                 ^
>> kernel/sched/core.c:669:2: warning: raw_spinlock '__rq_lockp(rq2)' is not held on every path through here [-Wthread-safety-analysis]
     669 |         double_rq_clock_clear_update(rq1, rq2);
         |         ^
   kernel/sched/core.c:667:3: note: raw_spinlock acquired here
     667 |                 __acquire_cap(__rq_lockp(rq2)); /* fake acquire */
         |                 ^
>> kernel/sched/core.c:670:1: warning: expecting raw_spinlock 'rq2->__lock' to be held at the end of function [-Wthread-safety-analysis]
     670 | }
         | ^
   kernel/sched/core.c:656:6: note: raw_spinlock acquired here
     656 | void double_rq_lock(struct rq *rq1, struct rq *rq2)
         |      ^
>> kernel/sched/core.c:1848:2: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    1848 |         task_rq_unlock(rq, p, &rf);
         |         ^
>> kernel/sched/core.c:1849:1: warning: raw_spinlock '__ret->__lock' is still held at the end of function [-Wthread-safety-analysis]
    1849 | }
         | ^
   kernel/sched/core.c:1837:7: note: raw_spinlock acquired here
    1837 |         rq = task_rq_lock(p, &rf);
         |              ^
   kernel/sched/sched.h:1829:27: note: expanded from macro 'task_rq_lock'
    1829 | #define task_rq_lock(...) __acquire_ret(_task_rq_lock(__VA_ARGS__), &__ret->__lock)
         |                           ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
>> kernel/sched/core.c:2255:2: warning: expecting raw_spinlock '__ret->__lock' to be held at start of each loop [-Wthread-safety-analysis]
    2255 |         for (;;) {
         |         ^
   kernel/sched/core.c:2286:19: note: raw_spinlock acquired here
    2286 |                 struct rq *rq = task_rq_lock(p, &rf);
         |                                 ^
   kernel/sched/sched.h:1829:27: note: expanded from macro 'task_rq_lock'
    1829 | #define task_rq_lock(...) __acquire_ret(_task_rq_lock(__VA_ARGS__), &__ret->__lock)
         |                           ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   kernel/sched/core.c:2306:3: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    2306 |                 task_rq_unlock(rq, p, &rf);
         |                 ^
>> kernel/sched/core.c:2351:1: warning: raw_spinlock '__ret->__lock' is not held on every path through here [-Wthread-safety-analysis]
    2351 | }
         | ^
   kernel/sched/core.c:2286:19: note: raw_spinlock acquired here
    2286 |                 struct rq *rq = task_rq_lock(p, &rf);
         |                                 ^
   kernel/sched/sched.h:1829:27: note: expanded from macro 'task_rq_lock'
    1829 | #define task_rq_lock(...) __acquire_ret(_task_rq_lock(__VA_ARGS__), &__ret->__lock)
         |                           ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
>> kernel/sched/core.c:2695:2: warning: releasing raw_spinlock 'lowest_rq->__lock' that was not held [-Wthread-safety-analysis]
    2695 |         double_unlock_balance(rq, lowest_rq);
         |         ^
   kernel/sched/core.c:3180:9: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    3180 |         return __set_cpus_allowed_ptr_locked(p, ctx, rq, &rf);
         |                ^
   kernel/sched/core.c:3181:1: warning: raw_spinlock '__ret->__lock' is still held at the end of function [-Wthread-safety-analysis]
    3181 | }
         | ^
   kernel/sched/core.c:3170:7: note: raw_spinlock acquired here
    3170 |         rq = task_rq_lock(p, &rf);
         |              ^
   kernel/sched/sched.h:1829:27: note: expanded from macro 'task_rq_lock'
    1829 | #define task_rq_lock(...) __acquire_ret(_task_rq_lock(__VA_ARGS__), &__ret->__lock)
         |                           ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   kernel/sched/core.c:3230:9: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    3230 |         return __set_cpus_allowed_ptr_locked(p, &ac, rq, &rf);
         |                ^
   kernel/sched/core.c:3233:2: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    3233 |         task_rq_unlock(rq, p, &rf);
         |         ^
   kernel/sched/core.c:3235:1: warning: raw_spinlock '__ret->__lock' is still held at the end of function [-Wthread-safety-analysis]
    3235 | }
         | ^
   kernel/sched/core.c:3212:18: note: raw_spinlock acquired here
    3212 |         struct rq *rq = task_rq_lock(p, &rf);
         |                         ^
   kernel/sched/sched.h:1829:27: note: expanded from macro 'task_rq_lock'
    1829 | #define task_rq_lock(...) __acquire_ret(_task_rq_lock(__VA_ARGS__), &__ret->__lock)
         |                           ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   kernel/sched/core.c:3814:2: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    3814 |         __task_rq_unlock(rq, &rf);
         |         ^
   kernel/sched/core.c:3817:1: warning: raw_spinlock '__ret->__lock' is still held at the end of function [-Wthread-safety-analysis]
    3817 | }
         | ^
   kernel/sched/core.c:3797:18: note: raw_spinlock acquired here
    3797 |         struct rq *rq = __task_rq_lock(p, &rf);
         |                         ^
   kernel/sched/sched.h:1826:29: note: expanded from macro '__task_rq_lock'
    1826 | #define __task_rq_lock(...) __acquire_ret(___task_rq_lock(__VA_ARGS__), &__ret->__lock)
         |                             ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   kernel/sched/core.c:4419:3: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    4419 |                 rq_unlock(rq, &rf);
         |                 ^
   kernel/sched/core.c:4424:2: warning: raw_spinlock '__ret->__lock' is not held on every path through here [-Wthread-safety-analysis]
    4424 |         raw_spin_unlock_irqrestore(&p->pi_lock, rf.flags);
         |         ^
   include/linux/spinlock.h:282:13: note: expanded from macro 'raw_spin_unlock_irqrestore'
     282 |                 typecheck(unsigned long, flags);                \
         |                           ^
   kernel/sched/core.c:4405:19: note: raw_spinlock acquired here
    4405 |                 struct rq *rq = __task_rq_lock(p, &rf);
         |                                 ^
   kernel/sched/sched.h:1826:29: note: expanded from macro '__task_rq_lock'
    1826 | #define __task_rq_lock(...) __acquire_ret(___task_rq_lock(__VA_ARGS__), &__ret->__lock)
         |                             ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   kernel/sched/core.c:4903:2: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    4903 |         task_rq_unlock(rq, p, &rf);
         |         ^
   kernel/sched/core.c:4904:1: warning: raw_spinlock '__ret->__lock' is still held at the end of function [-Wthread-safety-analysis]
    4904 | }
         | ^
   kernel/sched/core.c:4885:7: note: raw_spinlock acquired here
    4885 |         rq = __task_rq_lock(p, &rf);
         |              ^
   kernel/sched/sched.h:1826:29: note: expanded from macro '__task_rq_lock'
    1826 | #define __task_rq_lock(...) __acquire_ret(___task_rq_lock(__VA_ARGS__), &__ret->__lock)
         |                             ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   kernel/sched/core.c:5269:2: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    5269 |         finish_lock_switch(rq);


vim +3026 kernel/sched/sched.h

029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3011  
127f6bf1618868 kernel/sched/sched.h Ingo Molnar    2024-06-05  3012  #else /* !CONFIG_PREEMPTION: */
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3013  /*
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3014   * Unfair double_lock_balance: Optimizes throughput at the expense of
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3015   * latency by eliminating extra atomic operations when the locks are
97fb7a0a8944bd kernel/sched/sched.h Ingo Molnar    2018-03-03  3016   * already in proper order on entry.  This favors lower CPU-ids and will
97fb7a0a8944bd kernel/sched/sched.h Ingo Molnar    2018-03-03  3017   * grant the double lock to lower CPUs over higher ids under contention,
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3018   * regardless of entry order into the function.
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3019   */
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3020  static inline int _double_lock_balance(struct rq *this_rq, struct rq *busiest)
0ec55cac64b4d3 kernel/sched/sched.h Marco Elver    2025-08-03  3021  	__must_hold(&this_rq->__lock)
0ec55cac64b4d3 kernel/sched/sched.h Marco Elver    2025-08-03  3022  	__acquires(&busiest->__lock)
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3023  {
2679a83731d51a kernel/sched/sched.h Hao Jia        2022-04-30  3024  	if (__rq_lockp(this_rq) == __rq_lockp(busiest) ||
2679a83731d51a kernel/sched/sched.h Hao Jia        2022-04-30 @3025  	    likely(raw_spin_rq_trylock(busiest))) {
2679a83731d51a kernel/sched/sched.h Hao Jia        2022-04-30 @3026  		double_rq_clock_clear_update(this_rq, busiest);
5cb9eaa3d274f7 kernel/sched/sched.h Peter Zijlstra 2020-11-17  3027  		return 0;
2679a83731d51a kernel/sched/sched.h Hao Jia        2022-04-30  3028  	}
5cb9eaa3d274f7 kernel/sched/sched.h Peter Zijlstra 2020-11-17  3029  
d66f1b06b5b438 kernel/sched/sched.h Peter Zijlstra 2021-03-02  3030  	if (rq_order_less(this_rq, busiest)) {
5cb9eaa3d274f7 kernel/sched/sched.h Peter Zijlstra 2020-11-17  3031  		raw_spin_rq_lock_nested(busiest, SINGLE_DEPTH_NESTING);
2679a83731d51a kernel/sched/sched.h Hao Jia        2022-04-30  3032  		double_rq_clock_clear_update(this_rq, busiest);
5cb9eaa3d274f7 kernel/sched/sched.h Peter Zijlstra 2020-11-17  3033  		return 0;
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3034  	}
5cb9eaa3d274f7 kernel/sched/sched.h Peter Zijlstra 2020-11-17  3035  
5cb9eaa3d274f7 kernel/sched/sched.h Peter Zijlstra 2020-11-17  3036  	raw_spin_rq_unlock(this_rq);
d66f1b06b5b438 kernel/sched/sched.h Peter Zijlstra 2021-03-02 @3037  	double_rq_lock(this_rq, busiest);
5cb9eaa3d274f7 kernel/sched/sched.h Peter Zijlstra 2020-11-17  3038  
5cb9eaa3d274f7 kernel/sched/sched.h Peter Zijlstra 2020-11-17  3039  	return 1;
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25 @3040  }
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3041  
127f6bf1618868 kernel/sched/sched.h Ingo Molnar    2024-06-05  3042  #endif /* !CONFIG_PREEMPTION */
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3043  
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3044  /*
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3045   * double_lock_balance - lock the busiest runqueue, this_rq is locked already.
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3046   */
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3047  static inline int double_lock_balance(struct rq *this_rq, struct rq *busiest)
0ec55cac64b4d3 kernel/sched/sched.h Marco Elver    2025-08-03  3048  	__must_hold(&this_rq->__lock)
0ec55cac64b4d3 kernel/sched/sched.h Marco Elver    2025-08-03  3049  	__acquires(&busiest->__lock)
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3050  {
5cb9eaa3d274f7 kernel/sched/sched.h Peter Zijlstra 2020-11-17  3051  	lockdep_assert_irqs_disabled();
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3052  
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3053  	return _double_lock_balance(this_rq, busiest);
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3054  }
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3055  
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3056  static inline void double_unlock_balance(struct rq *this_rq, struct rq *busiest)
0ec55cac64b4d3 kernel/sched/sched.h Marco Elver    2025-08-03  3057  	__releases(&busiest->__lock)
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3058  {
9ef7e7e33bcdb5 kernel/sched/sched.h Peter Zijlstra 2021-03-03  3059  	if (__rq_lockp(this_rq) != __rq_lockp(busiest))
5cb9eaa3d274f7 kernel/sched/sched.h Peter Zijlstra 2020-11-17  3060  		raw_spin_rq_unlock(busiest);
0ec55cac64b4d3 kernel/sched/sched.h Marco Elver    2025-08-03  3061  	else
0ec55cac64b4d3 kernel/sched/sched.h Marco Elver    2025-08-03 @3062  		__release(__rq_lockp(busiest)); /* fake release */
9ef7e7e33bcdb5 kernel/sched/sched.h Peter Zijlstra 2021-03-03  3063  	lock_set_subclass(&__rq_lockp(this_rq)->dep_map, 0, _RET_IP_);
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3064  }
029632fbb7b7c9 kernel/sched.h       Peter Zijlstra 2011-10-25  3065  

:::::: The code at line 3026 was first introduced by commit
:::::: 2679a83731d51a744657f718fc02c3b077e47562 sched/core: Avoid obvious double update_rq_clock warning

:::::: TO: Hao Jia <jiahao.os@bytedance.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
