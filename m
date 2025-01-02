Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250691ACED9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 11:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735818032; cv=none; b=tciVfVzGEm8KEC+WTaMHYH18T4l4GvVn4k1t5+NMXuSjW4lh/jQfROs3mh1zhGJ9hGWFuVTNiOJbKOJzLtUvg1Bv+W0uaLjdxtC4drrMUGzP69f/xJyr5mJArX2/Z7/cJVGJX9ooHdP6+Z/HPhLR7yR15AFOP8WAxNFNIlAICxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735818032; c=relaxed/simple;
	bh=7MTbpVKOu8PeTovG/0vIU/DqVF0kgh+5ngbN0G1UWVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LYN41fEpmMMyZDfe/dJ3SRBZmGskrtwMolQdqnh3T7l1UheXj+2moznx4rBjNZXlBmvCLtvwDb1GSdUBUd7R5m3F97iYm+bTu3riNFOMf6626qYFhKq9JDQZjEccpexcYVvyqy/NrAYY00/3iteDmZt25GuyeemwGzjv8Mcnw2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddakUPwI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddakUPwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735818030; x=1767354030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7MTbpVKOu8PeTovG/0vIU/DqVF0kgh+5ngbN0G1UWVw=;
  b=ddakUPwIH4DYEF17ClQXS+i+WY33TIXpk9TBfb8IoNtAKDx/xZUNKWqf
   HY2veuM9dMiSj8/7p+7ujqn17BqX6bO+OuKKzCs1nWbki7wHf52gcZVMP
   NPPoJZx4ys/gz6PC4jAVePN9nQUxXaMFJGlKDLYWqDtZ+d7B11HZrFcHR
   EA2Ed6GjkEoE/1gIs4Xjk+JHwwQYWLveqQQqMTvoX7C967AGuZIrG4v2I
   4tMfwo2bjxdSIlx2w37sjaGCI1OjBLFO0iNUW33QSFIMh4ErWRyFbzhzU
   jLl81ehVUR8ePs8HVBhVKEaeA2TWPlmpCwrS+D/G5ltYmKe8IvL0J9HEW
   A==;
X-CSE-ConnectionGUID: pItUDDAlT7uKleTYpkQbDw==
X-CSE-MsgGUID: yVsIEkiuRpm9Z6S6IAuOKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46724548"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="46724548"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 03:40:30 -0800
X-CSE-ConnectionGUID: HDiUtqSsS82vEqWxUfnAaA==
X-CSE-MsgGUID: E8ybVnidSoWFLS0R7Eiksg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101270653"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jan 2025 03:40:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTJYu-0008Sq-1V;
	Thu, 02 Jan 2025 11:40:24 +0000
Date: Thu, 2 Jan 2025 19:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/prjc-revert-active-balance 9/12]
 kernel/sched/alt_core.c:1847:19: error: assignment to 'cpumask_t *' {aka
 'struct cpumask *'} from 'int' makes pointer from integer without a cast
Message-ID: <202501021931.BQbGEmHm-lkp@intel.com>
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
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250102/202501021931.BQbGEmHm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021931.BQbGEmHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021931.BQbGEmHm-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   kernel/sched/alt_core.c:1795:36: error: passing argument 2 of 'set_cpus_allowed_common' from incompatible pointer type [-Wincompatible-pointer-types]
    1795 |         set_cpus_allowed_common(p, ctx);
         |                                    ^~~
         |                                    |
         |                                    struct affinity_context *
   kernel/sched/alt_core.c:1779:73: note: expected 'struct affinity_context *' but argument is of type 'struct affinity_context *'
    1779 | set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx)
         |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   kernel/sched/alt_core.c: In function 'do_set_cpus_allowed':
   kernel/sched/alt_core.c:1804:16: error: variable 'ac' has initializer but incomplete type
    1804 |         struct affinity_context ac = {
         |                ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1805:18: error: 'struct affinity_context' has no member named 'new_mask'
    1805 |                 .new_mask  = new_mask,
         |                  ^~~~~~~~
   kernel/sched/alt_core.c:1805:30: warning: excess elements in struct initializer
    1805 |                 .new_mask  = new_mask,
         |                              ^~~~~~~~
   kernel/sched/alt_core.c:1805:30: note: (near initialization for 'ac')
   kernel/sched/alt_core.c:1806:18: error: 'struct affinity_context' has no member named 'user_mask'
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
   kernel/sched/alt_core.c:1807:18: error: 'struct affinity_context' has no member named 'flags'
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
   kernel/sched/alt_core.c:1804:33: error: storage size of 'ac' isn't known
    1804 |         struct affinity_context ac = {
         |                                 ^~
   In file included from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/alt_core.c:15:
   include/linux/rcupdate.h:1091:41: error: invalid type argument of '->' (have 'int')
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
   kernel/sched/alt_core.c:1847:21: error: implicit declaration of function 'alloc_user_cpus_ptr'; did you mean 'dup_user_cpus_ptr'? [-Wimplicit-function-declaration]
    1847 |         user_mask = alloc_user_cpus_ptr(node);
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     dup_user_cpus_ptr
>> kernel/sched/alt_core.c:1847:19: error: assignment to 'cpumask_t *' {aka 'struct cpumask *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1847 |         user_mask = alloc_user_cpus_ptr(node);
         |                   ^
   kernel/sched/alt_core.c: In function 'affine_move_task':
   kernel/sched/alt_core.c:2138:25: error: implicit declaration of function '__task_access_unlock'; did you mean '__task_rq_unlock'? [-Wimplicit-function-declaration]
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
   kernel/sched/alt_core.c:2207:34: error: passing argument 2 of '__do_set_cpus_allowed' from incompatible pointer type [-Wincompatible-pointer-types]
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
   kernel/sched/alt_core.c:2226:5: warning: no previous prototype for '__set_cpus_allowed_ptr' [-Wmissing-prototypes]
    2226 | int __set_cpus_allowed_ptr(struct task_struct *p,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__set_cpus_allowed_ptr':
   kernel/sched/alt_core.c:2234:14: error: implicit declaration of function '__task_access_lock'; did you mean '__task_rq_lock'? [-Wimplicit-function-declaration]
    2234 |         rq = __task_access_lock(p, &lock);
         |              ^~~~~~~~~~~~~~~~~~
         |              __task_rq_lock
>> kernel/sched/alt_core.c:2234:12: error: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   kernel/sched/alt_core.c:2245:49: error: passing argument 2 of '__set_cpus_allowed_ptr_locked' from incompatible pointer type [-Wincompatible-pointer-types]
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
   kernel/sched/alt_core.c:2282:12: error: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
   kernel/sched/alt_core.c:2361:15: error: implicit declaration of function '__sched_setaffinity'; did you mean 'sched_setaffinity'? [-Wimplicit-function-declaration]
    2361 |         ret = __sched_setaffinity(p, &ac);
         |               ^~~~~~~~~~~~~~~~~~~
         |               sched_setaffinity
   kernel/sched/alt_core.c:2351:33: warning: unused variable 'ac' [-Wunused-variable]
    2351 |         struct affinity_context ac = {
         |                                 ^~
   kernel/sched/alt_core.c: In function 'ttwu_runnable':
   kernel/sched/alt_core.c:2465:12: error: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2465 |         rq = __task_access_lock(p, &lock);
         |            ^
--
   In file included from kernel/sched/build_utility.c:68:
   kernel/sched/cpufreq_schedutil.c: In function 'sugov_hold_freq':
>> kernel/sched/cpufreq_schedutil.c:345:13: error: implicit declaration of function 'scx_switched_all' [-Wimplicit-function-declaration]
     345 |         if (scx_switched_all())
         |             ^~~~~~~~~~~~~~~~


vim +1847 kernel/sched/alt_core.c

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

:::::: The code at line 1847 was first introduced by commit
:::::: 00c5318dd60345891e9a65f403f02a29032859d2 sched/alt: [Sync] 9a5418bc48ba sched/core: Use kfree_rcu() in do_set_cpus_allowed()

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
