Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF99192B71
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735808534; cv=none; b=aBx7At6Q+z4Xqge11ou3FhOwj0X96bq0zVOGShYv1jIWEvrg934wX+sd/ymdko5n5vxMuNUIZlFx7ZEwkjPmFc2g6LGcCJMl7vOBKcKhPn/g3MykBZfod7Gc7y/7cZ/T3Q0/2rO8mgTRzOadUFZBTOJKKKZU1AagpxWbrijATAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735808534; c=relaxed/simple;
	bh=hBlxOPtJyzTTxowE5qenL2rmHiyoO/UydbUw9OpX7aM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKi6UHOLLNpcgc3aJc8vcuUQz1ucz2rHG2skWThzY0qR0I95iwBcFp/J2ru+WdBtsA+CbWOuGPg10XbcMtAXZNP6DdkBUxps5VDGSsUL2mTFjuuI+gSv/zf/gLeYD8GzFlPlAe4MjiO6kcUo7if3qVbzk6KBtY+18/h2Y1hrfDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGG+QVbm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGG+QVbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735808532; x=1767344532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hBlxOPtJyzTTxowE5qenL2rmHiyoO/UydbUw9OpX7aM=;
  b=OGG+QVbmGdw+gBswYaoPKFxeevniwnJtE7znxDXTnumAADs/7FCKEyCS
   PEjvitG6SAqksZIuuxnD/PL3c2RSKbK4fiw9ImgisTqTvFbfbejKqet9v
   bZnalkNZlgHYyBI8m3mGn3OnkMnO5MpaHpUrWZmOn9srPFAATEHMpXubW
   i7XKFgMZdRRJ9xAHQATBxYciQoHnTCdQlCm/gDWz6GFFWU+MO5iQEyhaB
   CUF9Pj/lLxq0ApHwhxwBIZ7j9FVkHH2sT04YfXZgCyQvNcpEaPruHJJy3
   doEzePKMW8E60RYgmYoKpspUvcCz0+0O7BxnrXQ7+9GZl/Jw1EDpmLCoM
   g==;
X-CSE-ConnectionGUID: A0onc8RUQTSHmoulhLzqag==
X-CSE-MsgGUID: xxg4g9zXTB6o9wm+UHA1qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47032333"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="47032333"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 01:02:11 -0800
X-CSE-ConnectionGUID: oebWYtY1T0WxlCtegNPydw==
X-CSE-MsgGUID: slIMw+D3TIOrUMXW/Xo4fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="101884146"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jan 2025 01:02:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTH5k-0008Lh-0M;
	Thu, 02 Jan 2025 09:02:08 +0000
Date: Thu, 2 Jan 2025 17:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/prjc-revert-active-balance 9/12]
 kernel/sched/alt_core.c:1781:40: error: invalid use of undefined type
 'struct affinity_context'
Message-ID: <202501021602.lRChjX55-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/prjc-revert-active-balance
head:   4a42958cae493501eea276a2926f0d3727193c66
commit: 2352960e110a0c5e47e22008a9a47003bf62c7c3 [9/12] Revert "sched/alt: Introduce alt_topology.c/.h files"
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250102/202501021602.lRChjX55-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021602.lRChjX55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021602.lRChjX55-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/sched/alt_core.c:811:6: warning: no previous prototype for 'requeue_task' [-Wmissing-prototypes]
     811 | void requeue_task(struct task_struct *p, struct rq *rq)
         |      ^~~~~~~~~~~~
>> kernel/sched/alt_core.c:1779:55: warning: 'struct affinity_context' declared inside parameter list will not be visible outside of this definition or declaration
    1779 | set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx)
         |                                                       ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'set_cpus_allowed_common':
>> kernel/sched/alt_core.c:1781:40: error: invalid use of undefined type 'struct affinity_context'
    1781 |         cpumask_copy(&p->cpus_mask, ctx->new_mask);
         |                                        ^~
   kernel/sched/alt_core.c:1782:48: error: invalid use of undefined type 'struct affinity_context'
    1782 |         p->nr_cpus_allowed = cpumask_weight(ctx->new_mask);
         |                                                ^~
   kernel/sched/alt_core.c:1787:16: error: invalid use of undefined type 'struct affinity_context'
    1787 |         if (ctx->flags & SCA_USER)
         |                ^~
   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/alt_core.c:14:
   kernel/sched/alt_core.c:1788:43: error: invalid use of undefined type 'struct affinity_context'
    1788 |                 swap(p->user_cpus_ptr, ctx->user_mask);
         |                                           ^~
   include/linux/minmax.h:323:44: note: in definition of macro 'swap'
     323 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                            ^
   kernel/sched/alt_core.c:1788:43: error: invalid use of undefined type 'struct affinity_context'
    1788 |                 swap(p->user_cpus_ptr, ctx->user_mask);
         |                                           ^~
   include/linux/minmax.h:323:49: note: in definition of macro 'swap'
     323 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                                 ^
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:1792:53: warning: 'struct affinity_context' declared inside parameter list will not be visible outside of this definition or declaration
    1792 | __do_set_cpus_allowed(struct task_struct *p, struct affinity_context *ctx)
         |                                                     ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__do_set_cpus_allowed':
>> kernel/sched/alt_core.c:1795:36: error: passing argument 2 of 'set_cpus_allowed_common' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1795 |         set_cpus_allowed_common(p, ctx);
         |                                    ^~~
         |                                    |
         |                                    struct affinity_context *
   kernel/sched/alt_core.c:1779:73: note: expected 'struct affinity_context *' but argument is of type 'struct affinity_context *'
    1779 | set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx)
         |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   kernel/sched/alt_core.c: In function 'do_set_cpus_allowed':
>> kernel/sched/alt_core.c:1804:16: error: variable 'ac' has initializer but incomplete type
    1804 |         struct affinity_context ac = {
         |                ^~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:1805:18: error: 'struct affinity_context' has no member named 'new_mask'
    1805 |                 .new_mask  = new_mask,
         |                  ^~~~~~~~
>> kernel/sched/alt_core.c:1805:30: warning: excess elements in struct initializer
    1805 |                 .new_mask  = new_mask,
         |                              ^~~~~~~~
   kernel/sched/alt_core.c:1805:30: note: (near initialization for 'ac')
>> kernel/sched/alt_core.c:1806:18: error: 'struct affinity_context' has no member named 'user_mask'
    1806 |                 .user_mask = NULL,
         |                  ^~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/smp.h:11:
   include/linux/stddef.h:8:14: warning: excess elements in struct initializer
       8 | #define NULL ((void *)0)
         |              ^
   kernel/sched/alt_core.c:1806:30: note: in expansion of macro 'NULL'
    1806 |                 .user_mask = NULL,
         |                              ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'ac')
       8 | #define NULL ((void *)0)
         |              ^
   kernel/sched/alt_core.c:1806:30: note: in expansion of macro 'NULL'
    1806 |                 .user_mask = NULL,
         |                              ^~~~
>> kernel/sched/alt_core.c:1807:18: error: 'struct affinity_context' has no member named 'flags'
    1807 |                 .flags     = SCA_USER,  /* clear the user requested mask */
         |                  ^~~~~
   kernel/sched/alt_core.c:1493:33: warning: excess elements in struct initializer
    1493 | #define SCA_USER                0x08
         |                                 ^~~~
   kernel/sched/alt_core.c:1807:30: note: in expansion of macro 'SCA_USER'
    1807 |                 .flags     = SCA_USER,  /* clear the user requested mask */
         |                              ^~~~~~~~
   kernel/sched/alt_core.c:1493:33: note: (near initialization for 'ac')
    1493 | #define SCA_USER                0x08
         |                                 ^~~~
   kernel/sched/alt_core.c:1807:30: note: in expansion of macro 'SCA_USER'
    1807 |                 .flags     = SCA_USER,  /* clear the user requested mask */
         |                              ^~~~~~~~
>> kernel/sched/alt_core.c:1804:33: error: storage size of 'ac' isn't known
    1804 |         struct affinity_context ac = {
         |                                 ^~
   In file included from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/alt_core.c:15:
>> include/linux/rcupdate.h:1091:41: error: invalid type argument of '->' (have 'int')
    1091 |                 kvfree_call_rcu(&((___p)->rhf), (void *) (___p));                       \
         |                                         ^~
   include/linux/rcupdate.h:1062:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1062 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1824:9: note: in expansion of macro 'kfree_rcu'
    1824 |         kfree_rcu((union cpumask_rcuhead *)ac.user_mask, rcu);
         |         ^~~~~~~~~
   kernel/sched/alt_core.c:1804:33: warning: unused variable 'ac' [-Wunused-variable]
    1804 |         struct affinity_context ac = {
         |                                 ^~
   kernel/sched/alt_core.c: In function 'dup_user_cpus_ptr':
>> kernel/sched/alt_core.c:1847:21: error: implicit declaration of function 'alloc_user_cpus_ptr'; did you mean 'dup_user_cpus_ptr'? [-Werror=implicit-function-declaration]
    1847 |         user_mask = alloc_user_cpus_ptr(node);
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     dup_user_cpus_ptr
>> kernel/sched/alt_core.c:1847:19: warning: assignment to 'cpumask_t *' {aka 'struct cpumask *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1847 |         user_mask = alloc_user_cpus_ptr(node);
         |                   ^
   kernel/sched/alt_core.c: In function 'affine_move_task':
>> kernel/sched/alt_core.c:2138:25: error: implicit declaration of function '__task_access_unlock'; did you mean '__task_rq_unlock'? [-Werror=implicit-function-declaration]
    2138 |                         __task_access_unlock(p, lock);
         |                         ^~~~~~~~~~~~~~~~~~~~
         |                         __task_rq_unlock
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:2159:49: warning: 'struct affinity_context' declared inside parameter list will not be visible outside of this definition or declaration
    2159 |                                          struct affinity_context *ctx,
         |                                                 ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__set_cpus_allowed_ptr_locked':
   kernel/sched/alt_core.c:2184:44: error: invalid use of undefined type 'struct affinity_context'
    2184 |         if (!kthread && !cpumask_subset(ctx->new_mask, cpu_allowed_mask)) {
         |                                            ^~
   kernel/sched/alt_core.c:2193:17: error: invalid use of undefined type 'struct affinity_context'
    2193 |         if ((ctx->flags & SCA_CHECK) && (p->flags & PF_NO_SETAFFINITY)) {
         |                 ^~
   kernel/sched/alt_core.c:2198:45: error: invalid use of undefined type 'struct affinity_context'
    2198 |         if (cpumask_equal(&p->cpus_mask, ctx->new_mask))
         |                                             ^~
   kernel/sched/alt_core.c:2201:55: error: invalid use of undefined type 'struct affinity_context'
    2201 |         dest_cpu = cpumask_any_and(cpu_valid_mask, ctx->new_mask);
         |                                                       ^~
   include/linux/cpumask.h:857:67: note: in definition of macro 'cpumask_any_and'
     857 | #define cpumask_any_and(mask1, mask2) cpumask_first_and((mask1), (mask2))
         |                                                                   ^~~~~
>> kernel/sched/alt_core.c:2207:34: error: passing argument 2 of '__do_set_cpus_allowed' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2207 |         __do_set_cpus_allowed(p, ctx);
         |                                  ^~~
         |                                  |
         |                                  struct affinity_context *
   kernel/sched/alt_core.c:1792:71: note: expected 'struct affinity_context *' but argument is of type 'struct affinity_context *'
    1792 | __do_set_cpus_allowed(struct task_struct *p, struct affinity_context *ctx)
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:2227:35: warning: 'struct affinity_context' declared inside parameter list will not be visible outside of this definition or declaration
    2227 |                            struct affinity_context *ctx)
         |                                   ^~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:2226:5: warning: no previous prototype for '__set_cpus_allowed_ptr' [-Wmissing-prototypes]
    2226 | int __set_cpus_allowed_ptr(struct task_struct *p,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__set_cpus_allowed_ptr':
>> kernel/sched/alt_core.c:2234:14: error: implicit declaration of function '__task_access_lock'; did you mean '__task_rq_lock'? [-Werror=implicit-function-declaration]
    2234 |         rq = __task_access_lock(p, &lock);
         |              ^~~~~~~~~~~~~~~~~~
         |              __task_rq_lock
>> kernel/sched/alt_core.c:2234:12: warning: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2234 |         rq = __task_access_lock(p, &lock);
         |            ^
   kernel/sched/alt_core.c:2240:18: error: invalid use of undefined type 'struct affinity_context'
    2240 |             !(ctx->flags & SCA_USER) &&
         |                  ^~
   kernel/sched/alt_core.c:2241:46: error: invalid use of undefined type 'struct affinity_context'
    2241 |             cpumask_and(rq->scratch_mask, ctx->new_mask, p->user_cpus_ptr))
         |                                              ^~
   kernel/sched/alt_core.c:2242:20: error: invalid use of undefined type 'struct affinity_context'
    2242 |                 ctx->new_mask = rq->scratch_mask;
         |                    ^~
>> kernel/sched/alt_core.c:2245:49: error: passing argument 2 of '__set_cpus_allowed_ptr_locked' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2245 |         return __set_cpus_allowed_ptr_locked(p, ctx, rq, lock, irq_flags);
         |                                                 ^~~
         |                                                 |
         |                                                 struct affinity_context *
   kernel/sched/alt_core.c:2159:67: note: expected 'struct affinity_context *' but argument is of type 'struct affinity_context *'
    2159 |                                          struct affinity_context *ctx,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   kernel/sched/alt_core.c: In function 'set_cpus_allowed_ptr':
   kernel/sched/alt_core.c:2250:16: error: variable 'ac' has initializer but incomplete type
    2250 |         struct affinity_context ac = {
         |                ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2251:18: error: 'struct affinity_context' has no member named 'new_mask'
    2251 |                 .new_mask  = new_mask,
         |                  ^~~~~~~~
   kernel/sched/alt_core.c:2251:30: warning: excess elements in struct initializer
    2251 |                 .new_mask  = new_mask,
         |                              ^~~~~~~~
   kernel/sched/alt_core.c:2251:30: note: (near initialization for 'ac')
   kernel/sched/alt_core.c:2252:18: error: 'struct affinity_context' has no member named 'flags'
    2252 |                 .flags     = 0,
         |                  ^~~~~
   kernel/sched/alt_core.c:2252:30: warning: excess elements in struct initializer
    2252 |                 .flags     = 0,
         |                              ^
   kernel/sched/alt_core.c:2252:30: note: (near initialization for 'ac')
   kernel/sched/alt_core.c:2250:33: error: storage size of 'ac' isn't known
    2250 |         struct affinity_context ac = {
         |                                 ^~
   kernel/sched/alt_core.c:2250:33: warning: unused variable 'ac' [-Wunused-variable]
   kernel/sched/alt_core.c: In function 'restrict_cpus_allowed_ptr':
   kernel/sched/alt_core.c:2272:16: error: variable 'ac' has initializer but incomplete type
    2272 |         struct affinity_context ac = {
         |                ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2273:18: error: 'struct affinity_context' has no member named 'new_mask'
    2273 |                 .new_mask  = new_mask,
         |                  ^~~~~~~~
   kernel/sched/alt_core.c:2273:30: warning: excess elements in struct initializer
    2273 |                 .new_mask  = new_mask,
         |                              ^~~~~~~~
   kernel/sched/alt_core.c:2273:30: note: (near initialization for 'ac')
   kernel/sched/alt_core.c:2274:18: error: 'struct affinity_context' has no member named 'flags'
    2274 |                 .flags     = 0,
         |                  ^~~~~
   kernel/sched/alt_core.c:2274:30: warning: excess elements in struct initializer
    2274 |                 .flags     = 0,
         |                              ^
   kernel/sched/alt_core.c:2274:30: note: (near initialization for 'ac')
   kernel/sched/alt_core.c:2272:33: error: storage size of 'ac' isn't known
    2272 |         struct affinity_context ac = {
         |                                 ^~
   kernel/sched/alt_core.c:2282:12: warning: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2282 |         rq = __task_access_lock(p, &lock);
         |            ^
   kernel/sched/alt_core.c:2272:33: warning: unused variable 'ac' [-Wunused-variable]
    2272 |         struct affinity_context ac = {
         |                                 ^~
   kernel/sched/alt_core.c: In function 'relax_compatible_cpus_allowed_ptr':
   kernel/sched/alt_core.c:2351:16: error: variable 'ac' has initializer but incomplete type
    2351 |         struct affinity_context ac = {
         |                ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2352:18: error: 'struct affinity_context' has no member named 'new_mask'
    2352 |                 .new_mask  = task_user_cpus(p),
         |                  ^~~~~~~~
   kernel/sched/alt_core.c:2352:30: warning: excess elements in struct initializer
    2352 |                 .new_mask  = task_user_cpus(p),
         |                              ^~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2352:30: note: (near initialization for 'ac')
   kernel/sched/alt_core.c:2353:18: error: 'struct affinity_context' has no member named 'flags'
    2353 |                 .flags     = 0,
         |                  ^~~~~
   kernel/sched/alt_core.c:2353:30: warning: excess elements in struct initializer
    2353 |                 .flags     = 0,
         |                              ^
   kernel/sched/alt_core.c:2353:30: note: (near initialization for 'ac')
   kernel/sched/alt_core.c:2351:33: error: storage size of 'ac' isn't known
    2351 |         struct affinity_context ac = {
         |                                 ^~
>> kernel/sched/alt_core.c:2361:15: error: implicit declaration of function '__sched_setaffinity'; did you mean 'sched_setaffinity'? [-Werror=implicit-function-declaration]
    2361 |         ret = __sched_setaffinity(p, &ac);
         |               ^~~~~~~~~~~~~~~~~~~
         |               sched_setaffinity
   kernel/sched/alt_core.c:2351:33: warning: unused variable 'ac' [-Wunused-variable]
    2351 |         struct affinity_context ac = {
         |                                 ^~
   kernel/sched/alt_core.c: In function 'ttwu_runnable':
   kernel/sched/alt_core.c:2465:12: warning: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2465 |         rq = __task_access_lock(p, &lock);
         |            ^
   kernel/sched/alt_core.c: In function 'sched_fork':
   kernel/sched/alt_core.c:3192:21: error: implicit declaration of function 'task_has_rt_policy' [-Werror=implicit-function-declaration]
    3192 |                 if (task_has_rt_policy(p)) {
         |                     ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:3569:26: warning: no previous prototype for 'splice_balance_callbacks' [-Wmissing-prototypes]
    3569 | struct balance_callback *splice_balance_callbacks(struct rq *rq)
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:3579:6: warning: no previous prototype for 'balance_callbacks' [-Wmissing-prototypes]
    3579 | void balance_callbacks(struct rq *rq, struct balance_callback *head)
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'choose_next_task':
   kernel/sched/alt_core.c:4775:9: error: implicit declaration of function 'hrtick_start'; did you mean 'hrtimer_start'? [-Werror=implicit-function-declaration]
    4775 |         hrtick_start(rq, next->time_slice);
         |         ^~~~~~~~~~~~
         |         hrtimer_start
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:5306:6: warning: no previous prototype for 'check_task_changed' [-Wmissing-prototypes]
    5306 | void check_task_changed(struct task_struct *p, struct rq *rq)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:5316:6: warning: no previous prototype for '__setscheduler_prio' [-Wmissing-prototypes]
    5316 | void __setscheduler_prio(struct task_struct *p, int prio)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'rt_mutex_setprio':
   kernel/sched/alt_core.c:5367:16: error: implicit declaration of function '__rt_effective_prio' [-Werror=implicit-function-declaration]
    5367 |         prio = __rt_effective_prio(pi_task, p->normal_prio);
         |                ^~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:5375:12: warning: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    5375 |         rq = __task_access_lock(p, &lock);
         |            ^
   kernel/sched/alt_core.c: In function 'init_idle':
   kernel/sched/alt_core.c:5920:16: error: variable 'ac' has initializer but incomplete type
    5920 |         struct affinity_context ac = (struct affinity_context) {
         |                ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:5921:18: error: 'struct affinity_context' has no member named 'new_mask'
    5921 |                 .new_mask  = cpumask_of(cpu),
         |                  ^~~~~~~~
   include/linux/cpumask.h:863:25: warning: excess elements in struct initializer
     863 | #define cpumask_of(cpu) (get_cpu_mask(cpu))
         |                         ^
   kernel/sched/alt_core.c:5921:30: note: in expansion of macro 'cpumask_of'
    5921 |                 .new_mask  = cpumask_of(cpu),
         |                              ^~~~~~~~~~
   include/linux/cpumask.h:863:25: note: (near initialization for '(anonymous)')
     863 | #define cpumask_of(cpu) (get_cpu_mask(cpu))
         |                         ^
   kernel/sched/alt_core.c:5921:30: note: in expansion of macro 'cpumask_of'
    5921 |                 .new_mask  = cpumask_of(cpu),
         |                              ^~~~~~~~~~
   kernel/sched/alt_core.c:5922:18: error: 'struct affinity_context' has no member named 'flags'
    5922 |                 .flags     = 0,
         |                  ^~~~~
   kernel/sched/alt_core.c:5922:30: warning: excess elements in struct initializer
    5922 |                 .flags     = 0,
         |                              ^
   kernel/sched/alt_core.c:5922:30: note: (near initialization for '(anonymous)')
   kernel/sched/alt_core.c:5920:64: error: invalid use of undefined type 'struct affinity_context'
    5920 |         struct affinity_context ac = (struct affinity_context) {
         |                                                                ^
   kernel/sched/alt_core.c:5920:33: error: storage size of 'ac' isn't known
    5920 |         struct affinity_context ac = (struct affinity_context) {
         |                                 ^~
   kernel/sched/alt_core.c:5920:33: warning: unused variable 'ac' [-Wunused-variable]
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:6533:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Werror=implicit-function-declaration]
    6533 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6533:57: warning: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    6533 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   include/linux/cpumask.h:152:73: note: expected 'const struct cpumask *' but argument is of type 'int'
     152 | static __always_inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:6535:45: warning: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6535 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6454:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6454 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:635:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     635 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:6535:45: warning: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    6535 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
..


vim +1781 kernel/sched/alt_core.c

54431cbdff3201 Alfred Chen 2019-08-19  1777  
54431cbdff3201 Alfred Chen 2019-08-19  1778  static inline void
e1d031511268c3 Alfred Chen 2023-02-04 @1779  set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx)
54431cbdff3201 Alfred Chen 2019-08-19  1780  {
e1d031511268c3 Alfred Chen 2023-02-04 @1781  	cpumask_copy(&p->cpus_mask, ctx->new_mask);
e1d031511268c3 Alfred Chen 2023-02-04  1782  	p->nr_cpus_allowed = cpumask_weight(ctx->new_mask);
db58624583bd0c Alfred Chen 2023-02-04  1783  
db58624583bd0c Alfred Chen 2023-02-04  1784  	/*
db58624583bd0c Alfred Chen 2023-02-04  1785  	 * Swap in a new user_cpus_ptr if SCA_USER flag set
db58624583bd0c Alfred Chen 2023-02-04  1786  	 */
db58624583bd0c Alfred Chen 2023-02-04  1787  	if (ctx->flags & SCA_USER)
db58624583bd0c Alfred Chen 2023-02-04  1788  		swap(p->user_cpus_ptr, ctx->user_mask);
54431cbdff3201 Alfred Chen 2019-08-19  1789  }
54431cbdff3201 Alfred Chen 2019-08-19  1790  
4ef709ac40a9d4 Alfred Chen 2021-01-31  1791  static void
e1d031511268c3 Alfred Chen 2023-02-04 @1792  __do_set_cpus_allowed(struct task_struct *p, struct affinity_context *ctx)
4ef709ac40a9d4 Alfred Chen 2021-01-31  1793  {
b112c470d6db17 Alfred Chen 2021-02-02  1794  	lockdep_assert_held(&p->pi_lock);
e1d031511268c3 Alfred Chen 2023-02-04 @1795  	set_cpus_allowed_common(p, ctx);
4ef709ac40a9d4 Alfred Chen 2021-01-31  1796  }
4ef709ac40a9d4 Alfred Chen 2021-01-31  1797  
c2e9db9f85ca30 Alfred Chen 2023-02-04  1798  /*
c2e9db9f85ca30 Alfred Chen 2023-02-04  1799   * Used for kthread_bind() and select_fallback_rq(), in both cases the user
c2e9db9f85ca30 Alfred Chen 2023-02-04  1800   * affinity (if any) should be destroyed too.
c2e9db9f85ca30 Alfred Chen 2023-02-04  1801   */
54431cbdff3201 Alfred Chen 2019-08-19  1802  void do_set_cpus_allowed(struct task_struct *p, const struct cpumask *new_mask)
54431cbdff3201 Alfred Chen 2019-08-19  1803  {
e1d031511268c3 Alfred Chen 2023-02-04 @1804  	struct affinity_context ac = {
e1d031511268c3 Alfred Chen 2023-02-04 @1805  		.new_mask  = new_mask,
c2e9db9f85ca30 Alfred Chen 2023-02-04 @1806  		.user_mask = NULL,
c2e9db9f85ca30 Alfred Chen 2023-02-04 @1807  		.flags     = SCA_USER,	/* clear the user requested mask */
e1d031511268c3 Alfred Chen 2023-02-04  1808  	};
00c5318dd60345 Alfred Chen 2023-02-04  1809  	union cpumask_rcuhead {
00c5318dd60345 Alfred Chen 2023-02-04  1810  		cpumask_t cpumask;
00c5318dd60345 Alfred Chen 2023-02-04  1811  		struct rcu_head rcu;
00c5318dd60345 Alfred Chen 2023-02-04  1812  	};
e1d031511268c3 Alfred Chen 2023-02-04  1813  
e1d031511268c3 Alfred Chen 2023-02-04  1814  	__do_set_cpus_allowed(p, &ac);
00c5318dd60345 Alfred Chen 2023-02-04  1815  
d8dc101f4e9243 Alfred Chen 2024-11-07  1816  	if (is_migration_disabled(p) && !cpumask_test_cpu(task_cpu(p), &p->cpus_mask))
d8dc101f4e9243 Alfred Chen 2024-11-07  1817  		__migrate_force_enable(p, task_rq(p));
d8dc101f4e9243 Alfred Chen 2024-11-07  1818  
00c5318dd60345 Alfred Chen 2023-02-04  1819  	/*
00c5318dd60345 Alfred Chen 2023-02-04  1820  	 * Because this is called with p->pi_lock held, it is not possible
00c5318dd60345 Alfred Chen 2023-02-04  1821  	 * to use kfree() here (when PREEMPT_RT=y), therefore punt to using
00c5318dd60345 Alfred Chen 2023-02-04  1822  	 * kfree_rcu().
00c5318dd60345 Alfred Chen 2023-02-04  1823  	 */
00c5318dd60345 Alfred Chen 2023-02-04 @1824  	kfree_rcu((union cpumask_rcuhead *)ac.user_mask, rcu);
00c5318dd60345 Alfred Chen 2023-02-04  1825  }
00c5318dd60345 Alfred Chen 2023-02-04  1826  
e936e490ec8737 Alfred Chen 2021-10-15  1827  int dup_user_cpus_ptr(struct task_struct *dst, struct task_struct *src,
e936e490ec8737 Alfred Chen 2021-10-15  1828  		      int node)
e936e490ec8737 Alfred Chen 2021-10-15  1829  {
50e5f35c2d084a Alfred Chen 2023-02-04  1830  	cpumask_t *user_mask;
db58624583bd0c Alfred Chen 2023-02-04  1831  	unsigned long flags;
db58624583bd0c Alfred Chen 2023-02-04  1832  
50e5f35c2d084a Alfred Chen 2023-02-04  1833  	/*
50e5f35c2d084a Alfred Chen 2023-02-04  1834  	 * Always clear dst->user_cpus_ptr first as their user_cpus_ptr's
50e5f35c2d084a Alfred Chen 2023-02-04  1835  	 * may differ by now due to racing.
50e5f35c2d084a Alfred Chen 2023-02-04  1836  	 */
50e5f35c2d084a Alfred Chen 2023-02-04  1837  	dst->user_cpus_ptr = NULL;
50e5f35c2d084a Alfred Chen 2023-02-04  1838  
50e5f35c2d084a Alfred Chen 2023-02-04  1839  	/*
50e5f35c2d084a Alfred Chen 2023-02-04  1840  	 * This check is racy and losing the race is a valid situation.
50e5f35c2d084a Alfred Chen 2023-02-04  1841  	 * It is not worth the extra overhead of taking the pi_lock on
50e5f35c2d084a Alfred Chen 2023-02-04  1842  	 * every fork/clone.
50e5f35c2d084a Alfred Chen 2023-02-04  1843  	 */
50e5f35c2d084a Alfred Chen 2023-02-04  1844  	if (data_race(!src->user_cpus_ptr))
e936e490ec8737 Alfred Chen 2021-10-15  1845  		return 0;
e936e490ec8737 Alfred Chen 2021-10-15  1846  
00c5318dd60345 Alfred Chen 2023-02-04 @1847  	user_mask = alloc_user_cpus_ptr(node);
50e5f35c2d084a Alfred Chen 2023-02-04  1848  	if (!user_mask)
e936e490ec8737 Alfred Chen 2021-10-15  1849  		return -ENOMEM;
e936e490ec8737 Alfred Chen 2021-10-15  1850  
50e5f35c2d084a Alfred Chen 2023-02-04  1851  	/*
50e5f35c2d084a Alfred Chen 2023-02-04  1852  	 * Use pi_lock to protect content of user_cpus_ptr
50e5f35c2d084a Alfred Chen 2023-02-04  1853  	 *
50e5f35c2d084a Alfred Chen 2023-02-04  1854  	 * Though unlikely, user_cpus_ptr can be reset to NULL by a concurrent
50e5f35c2d084a Alfred Chen 2023-02-04  1855  	 * do_set_cpus_allowed().
50e5f35c2d084a Alfred Chen 2023-02-04  1856  	 */
db58624583bd0c Alfred Chen 2023-02-04  1857  	raw_spin_lock_irqsave(&src->pi_lock, flags);
50e5f35c2d084a Alfred Chen 2023-02-04  1858  	if (src->user_cpus_ptr) {
50e5f35c2d084a Alfred Chen 2023-02-04  1859  		swap(dst->user_cpus_ptr, user_mask);
e936e490ec8737 Alfred Chen 2021-10-15  1860  		cpumask_copy(dst->user_cpus_ptr, src->user_cpus_ptr);
50e5f35c2d084a Alfred Chen 2023-02-04  1861  	}
db58624583bd0c Alfred Chen 2023-02-04  1862  	raw_spin_unlock_irqrestore(&src->pi_lock, flags);
50e5f35c2d084a Alfred Chen 2023-02-04  1863  
50e5f35c2d084a Alfred Chen 2023-02-04  1864  	if (unlikely(user_mask))
50e5f35c2d084a Alfred Chen 2023-02-04  1865  		kfree(user_mask);
50e5f35c2d084a Alfred Chen 2023-02-04  1866  
e936e490ec8737 Alfred Chen 2021-10-15  1867  	return 0;
e936e490ec8737 Alfred Chen 2021-10-15  1868  }
e936e490ec8737 Alfred Chen 2021-10-15  1869  

:::::: The code at line 1781 was first introduced by commit
:::::: e1d031511268c393452059d30d70412804275555 sched/alt: [Sync] 713a2e21a513 sched: Introduce affinity_context

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
