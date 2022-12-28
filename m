Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8548A2A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Dec 2022 01:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672189425; x=1703725425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s9LgDFNY1d1TIBTUR2DdYDQxKQw9Y1jeLdGaL3FYkoo=;
  b=aAOjAaj0uGNt5iGHg16hu8PDu+GOAzCrnE8lRzvgHj8lbI1aQmztIUqO
   CQgoh6kyF37ON+T6vQm2dCEM1OZLVy7MK/YAu5ce/YXtlu6nnLPQi46BU
   NusCx0u24j3OWMT9GT+mfJSf/topyY1H3CHmkiEoxgY6lv8jWr2vVIlVZ
   s70FGtP5UwPZHCUlvEjwrBVlQ9Vbgg+0ggv6EmBwuycu/ic8gF6P8queQ
   ZEGJXRSlo8D41Kfy7QUPWiEMR+LjiVeq8BY+YjnoGfcGpBRPvSekTdIsJ
   6p9eSPmeHMV1UDCcZep4qON768S4IL2iJr0WivYMCe1MzHLw12KV3Olvd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="322762908"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="322762908"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2022 17:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="721652940"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="721652940"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Dec 2022 17:03:42 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pAKr8-000FIb-0Q;
	Wed, 28 Dec 2022 01:03:42 +0000
Date: Wed, 28 Dec 2022 09:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2022-06 11182/11257]
 include/../kernel/cgroup/cgroup-internal.h:79:41: error: field 'iter' has
 incomplete type
Message-ID: <202212280852.IMCyJIr7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="smuC0qGUS2CdLb6t"
Content-Disposition: inline


--smuC0qGUS2CdLb6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Giuliano,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2022-06
head:   9369f154c65c41b25895f01baea5f1e0bf1ea760
commit: 7b26719a77c462ab8ee8bacfd9f1ede643415318 [11182/11257] ANDROID: GKI: use internal type definitions in vendor hooks
config: i386-tinyconfig
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15-2022-06
        git checkout 7b26719a77c462ab8ee8bacfd9f1ede643415318
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/trace/hooks/sched.h:13,
                    from kernel/fork.c:115:
>> include/../kernel/cgroup/cgroup-internal.h:79:41: error: field 'iter' has incomplete type
      79 |                 struct css_task_iter    iter;
         |                                         ^~~~
   include/../kernel/cgroup/cgroup-internal.h: In function 'cgroup_is_dead':
>> include/../kernel/cgroup/cgroup-internal.h:188:22: error: invalid use of undefined type 'const struct cgroup'
     188 |         return !(cgrp->self.flags & CSS_ONLINE);
         |                      ^~
>> include/../kernel/cgroup/cgroup-internal.h:188:37: error: 'CSS_ONLINE' undeclared (first use in this function); did you mean 'CPU_ONLINE'?
     188 |         return !(cgrp->self.flags & CSS_ONLINE);
         |                                     ^~~~~~~~~~
         |                                     CPU_ONLINE
   include/../kernel/cgroup/cgroup-internal.h:188:37: note: each undeclared identifier is reported only once for each function it appears in
   include/../kernel/cgroup/cgroup-internal.h: In function 'notify_on_release':
>> include/../kernel/cgroup/cgroup-internal.h:193:25: error: 'CGRP_NOTIFY_ON_RELEASE' undeclared (first use in this function); did you mean 'MMU_NOTIFY_RELEASE'?
     193 |         return test_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         MMU_NOTIFY_RELEASE
   include/../kernel/cgroup/cgroup-internal.h:193:54: error: invalid use of undefined type 'const struct cgroup'
     193 |         return test_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
         |                                                      ^~
   include/../kernel/cgroup/cgroup-internal.h: In function 'put_css_set':
>> include/../kernel/cgroup/cgroup-internal.h:207:39: error: invalid use of undefined type 'struct css_set'
     207 |         if (refcount_dec_not_one(&cset->refcount))
         |                                       ^~
   include/../kernel/cgroup/cgroup-internal.h: In function 'get_css_set':
   include/../kernel/cgroup/cgroup-internal.h:220:27: error: invalid use of undefined type 'struct css_set'
     220 |         refcount_inc(&cset->refcount);
         |                           ^~
   include/../kernel/cgroup/cgroup-internal.h: At top level:
>> include/../kernel/cgroup/cgroup-internal.h:285:22: error: array type has incomplete element type 'struct cftype'
     285 | extern struct cftype cgroup1_base_files[];
         |                      ^~~~~~~~~~~~~~~~~~
   In file included from include/trace/hooks/vendor_hooks.h:11,
                    from include/trace/hooks/sched.h:7,
                    from kernel/fork.c:115:
   include/trace/hooks/sched.h:332:25: warning: 'struct uclamp_se' declared inside parameter list will not be visible outside of this definition or declaration
     332 |                  struct uclamp_se *uclamp_max, struct uclamp_se *uclamp_eff, int *ret),
         |                         ^~~~~~~~~
   include/linux/tracepoint.h:571:41: note: in definition of macro 'DECLARE_EVENT_NOP'
     571 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/trace/hooks/vendor_hooks.h:121:33: note: in expansion of macro 'PARAMS'
     121 |         DECLARE_EVENT_NOP(name, PARAMS(proto), PARAMS(args))
         |                                 ^~~~~~
   include/trace/hooks/sched.h:330:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
     330 | DECLARE_RESTRICTED_HOOK(android_rvh_uclamp_eff_get,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/sched.h:331:9: note: in expansion of macro 'TP_PROTO'
     331 |         TP_PROTO(struct task_struct *p, enum uclamp_id clamp_id,
         |         ^~~~~~~~
--
   In file included from include/trace/hooks/sched.h:13,
                    from kernel/sched/core.c:30:
>> include/../kernel/cgroup/cgroup-internal.h:79:41: error: field 'iter' has incomplete type
      79 |                 struct css_task_iter    iter;
         |                                         ^~~~
   include/../kernel/cgroup/cgroup-internal.h: In function 'cgroup_is_dead':
>> include/../kernel/cgroup/cgroup-internal.h:188:22: error: invalid use of undefined type 'const struct cgroup'
     188 |         return !(cgrp->self.flags & CSS_ONLINE);
         |                      ^~
>> include/../kernel/cgroup/cgroup-internal.h:188:37: error: 'CSS_ONLINE' undeclared (first use in this function); did you mean 'CPU_ONLINE'?
     188 |         return !(cgrp->self.flags & CSS_ONLINE);
         |                                     ^~~~~~~~~~
         |                                     CPU_ONLINE
   include/../kernel/cgroup/cgroup-internal.h:188:37: note: each undeclared identifier is reported only once for each function it appears in
   include/../kernel/cgroup/cgroup-internal.h: In function 'notify_on_release':
>> include/../kernel/cgroup/cgroup-internal.h:193:25: error: 'CGRP_NOTIFY_ON_RELEASE' undeclared (first use in this function); did you mean 'MMU_NOTIFY_RELEASE'?
     193 |         return test_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         MMU_NOTIFY_RELEASE
   include/../kernel/cgroup/cgroup-internal.h:193:54: error: invalid use of undefined type 'const struct cgroup'
     193 |         return test_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
         |                                                      ^~
   include/../kernel/cgroup/cgroup-internal.h: In function 'put_css_set':
>> include/../kernel/cgroup/cgroup-internal.h:207:39: error: invalid use of undefined type 'struct css_set'
     207 |         if (refcount_dec_not_one(&cset->refcount))
         |                                       ^~
   include/../kernel/cgroup/cgroup-internal.h: In function 'get_css_set':
   include/../kernel/cgroup/cgroup-internal.h:220:27: error: invalid use of undefined type 'struct css_set'
     220 |         refcount_inc(&cset->refcount);
         |                           ^~
   include/../kernel/cgroup/cgroup-internal.h: At top level:
>> include/../kernel/cgroup/cgroup-internal.h:285:22: error: array type has incomplete element type 'struct cftype'
     285 | extern struct cftype cgroup1_base_files[];
         |                      ^~~~~~~~~~~~~~~~~~
   In file included from include/trace/events/tlb.h:9,
                    from arch/x86/include/asm/mmu_context.h:10,
                    from include/linux/mmu_context.h:5,
                    from include/linux/cpuset.h:18,
                    from kernel/sched/sched.h:45,
                    from kernel/sched/core.c:13:
   include/trace/hooks/sched.h:332:25: warning: 'struct uclamp_se' declared inside parameter list will not be visible outside of this definition or declaration
     332 |                  struct uclamp_se *uclamp_max, struct uclamp_se *uclamp_eff, int *ret),
         |                         ^~~~~~~~~
   include/linux/tracepoint.h:571:41: note: in definition of macro 'DECLARE_EVENT_NOP'
     571 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/trace/hooks/vendor_hooks.h:121:33: note: in expansion of macro 'PARAMS'
     121 |         DECLARE_EVENT_NOP(name, PARAMS(proto), PARAMS(args))
         |                                 ^~~~~~
   include/trace/hooks/sched.h:330:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
     330 | DECLARE_RESTRICTED_HOOK(android_rvh_uclamp_eff_get,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/sched.h:331:9: note: in expansion of macro 'TP_PROTO'
     331 |         TP_PROTO(struct task_struct *p, enum uclamp_id clamp_id,
         |         ^~~~~~~~
   kernel/sched/core.c: In function 'ttwu_stat':
   kernel/sched/core.c:3552:20: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
    3552 |         struct rq *rq;
         |                    ^~
--
   In file included from include/trace/hooks/sched.h:13,
                    from kernel/sched/fair.c:25:
>> include/../kernel/cgroup/cgroup-internal.h:79:41: error: field 'iter' has incomplete type
      79 |                 struct css_task_iter    iter;
         |                                         ^~~~
   include/../kernel/cgroup/cgroup-internal.h: In function 'cgroup_is_dead':
>> include/../kernel/cgroup/cgroup-internal.h:188:22: error: invalid use of undefined type 'const struct cgroup'
     188 |         return !(cgrp->self.flags & CSS_ONLINE);
         |                      ^~
>> include/../kernel/cgroup/cgroup-internal.h:188:37: error: 'CSS_ONLINE' undeclared (first use in this function); did you mean 'CPU_ONLINE'?
     188 |         return !(cgrp->self.flags & CSS_ONLINE);
         |                                     ^~~~~~~~~~
         |                                     CPU_ONLINE
   include/../kernel/cgroup/cgroup-internal.h:188:37: note: each undeclared identifier is reported only once for each function it appears in
   include/../kernel/cgroup/cgroup-internal.h: In function 'notify_on_release':
>> include/../kernel/cgroup/cgroup-internal.h:193:25: error: 'CGRP_NOTIFY_ON_RELEASE' undeclared (first use in this function); did you mean 'MMU_NOTIFY_RELEASE'?
     193 |         return test_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         MMU_NOTIFY_RELEASE
   include/../kernel/cgroup/cgroup-internal.h:193:54: error: invalid use of undefined type 'const struct cgroup'
     193 |         return test_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
         |                                                      ^~
   include/../kernel/cgroup/cgroup-internal.h: In function 'put_css_set':
>> include/../kernel/cgroup/cgroup-internal.h:207:39: error: invalid use of undefined type 'struct css_set'
     207 |         if (refcount_dec_not_one(&cset->refcount))
         |                                       ^~
   include/../kernel/cgroup/cgroup-internal.h: In function 'get_css_set':
   include/../kernel/cgroup/cgroup-internal.h:220:27: error: invalid use of undefined type 'struct css_set'
     220 |         refcount_inc(&cset->refcount);
         |                           ^~
   include/../kernel/cgroup/cgroup-internal.h: At top level:
>> include/../kernel/cgroup/cgroup-internal.h:285:22: error: array type has incomplete element type 'struct cftype'
     285 | extern struct cftype cgroup1_base_files[];
         |                      ^~~~~~~~~~~~~~~~~~
   In file included from include/trace/events/tlb.h:9,
                    from arch/x86/include/asm/mmu_context.h:10,
                    from include/linux/mmu_context.h:5,
                    from include/linux/cpuset.h:18,
                    from kernel/sched/sched.h:45,
                    from kernel/sched/fair.c:23:
   include/trace/hooks/sched.h:332:25: warning: 'struct uclamp_se' declared inside parameter list will not be visible outside of this definition or declaration
     332 |                  struct uclamp_se *uclamp_max, struct uclamp_se *uclamp_eff, int *ret),
         |                         ^~~~~~~~~
   include/linux/tracepoint.h:571:41: note: in definition of macro 'DECLARE_EVENT_NOP'
     571 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/trace/hooks/vendor_hooks.h:121:33: note: in expansion of macro 'PARAMS'
     121 |         DECLARE_EVENT_NOP(name, PARAMS(proto), PARAMS(args))
         |                                 ^~~~~~
   include/trace/hooks/sched.h:330:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
     330 | DECLARE_RESTRICTED_HOOK(android_rvh_uclamp_eff_get,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/sched.h:331:9: note: in expansion of macro 'TP_PROTO'
     331 |         TP_PROTO(struct task_struct *p, enum uclamp_id clamp_id,
         |         ^~~~~~~~
   kernel/sched/fair.c:4509:6: warning: no previous prototype for 'set_next_entity' [-Wmissing-prototypes]
    4509 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:5523:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    5523 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11788:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   11788 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11790:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   11790 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11795:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   11795 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11797:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   11797 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/trace/hooks/sched.h:13,
                    from kernel/sched/rt.c:10:
>> include/../kernel/cgroup/cgroup-internal.h:79:41: error: field 'iter' has incomplete type
      79 |                 struct css_task_iter    iter;
         |                                         ^~~~
   include/../kernel/cgroup/cgroup-internal.h: In function 'cgroup_is_dead':
>> include/../kernel/cgroup/cgroup-internal.h:188:22: error: invalid use of undefined type 'const struct cgroup'
     188 |         return !(cgrp->self.flags & CSS_ONLINE);
         |                      ^~
>> include/../kernel/cgroup/cgroup-internal.h:188:37: error: 'CSS_ONLINE' undeclared (first use in this function); did you mean 'CPU_ONLINE'?
     188 |         return !(cgrp->self.flags & CSS_ONLINE);
         |                                     ^~~~~~~~~~
         |                                     CPU_ONLINE
   include/../kernel/cgroup/cgroup-internal.h:188:37: note: each undeclared identifier is reported only once for each function it appears in
   include/../kernel/cgroup/cgroup-internal.h: In function 'notify_on_release':
>> include/../kernel/cgroup/cgroup-internal.h:193:25: error: 'CGRP_NOTIFY_ON_RELEASE' undeclared (first use in this function); did you mean 'MMU_NOTIFY_RELEASE'?
     193 |         return test_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         MMU_NOTIFY_RELEASE
   include/../kernel/cgroup/cgroup-internal.h:193:54: error: invalid use of undefined type 'const struct cgroup'
     193 |         return test_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
         |                                                      ^~
   include/../kernel/cgroup/cgroup-internal.h: In function 'put_css_set':
>> include/../kernel/cgroup/cgroup-internal.h:207:39: error: invalid use of undefined type 'struct css_set'
     207 |         if (refcount_dec_not_one(&cset->refcount))
         |                                       ^~
   include/../kernel/cgroup/cgroup-internal.h: In function 'get_css_set':
   include/../kernel/cgroup/cgroup-internal.h:220:27: error: invalid use of undefined type 'struct css_set'
     220 |         refcount_inc(&cset->refcount);
         |                           ^~
   include/../kernel/cgroup/cgroup-internal.h: At top level:
>> include/../kernel/cgroup/cgroup-internal.h:285:22: error: array type has incomplete element type 'struct cftype'
     285 | extern struct cftype cgroup1_base_files[];
         |                      ^~~~~~~~~~~~~~~~~~
   In file included from include/trace/events/tlb.h:9,
                    from arch/x86/include/asm/mmu_context.h:10,
                    from include/linux/mmu_context.h:5,
                    from include/linux/cpuset.h:18,
                    from kernel/sched/sched.h:45,
                    from kernel/sched/rt.c:6:
   include/trace/hooks/sched.h:332:25: warning: 'struct uclamp_se' declared inside parameter list will not be visible outside of this definition or declaration
     332 |                  struct uclamp_se *uclamp_max, struct uclamp_se *uclamp_eff, int *ret),
         |                         ^~~~~~~~~
   include/linux/tracepoint.h:571:41: note: in definition of macro 'DECLARE_EVENT_NOP'
     571 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/trace/hooks/vendor_hooks.h:121:33: note: in expansion of macro 'PARAMS'
     121 |         DECLARE_EVENT_NOP(name, PARAMS(proto), PARAMS(args))
         |                                 ^~~~~~
   include/trace/hooks/sched.h:330:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
     330 | DECLARE_RESTRICTED_HOOK(android_rvh_uclamp_eff_get,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/sched.h:331:9: note: in expansion of macro 'TP_PROTO'
     331 |         TP_PROTO(struct task_struct *p, enum uclamp_id clamp_id,
         |         ^~~~~~~~
   kernel/sched/rt.c:264:6: warning: no previous prototype for 'unregister_rt_sched_group' [-Wmissing-prototypes]
     264 | void unregister_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:266:6: warning: no previous prototype for 'free_rt_sched_group' [-Wmissing-prototypes]
     266 | void free_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:268:5: warning: no previous prototype for 'alloc_rt_sched_group' [-Wmissing-prototypes]
     268 | int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:682:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     682 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/trace/hooks/sched.h:13,
                    from kernel/time/tick-common.c:20:
>> include/../kernel/cgroup/cgroup-internal.h:79:41: error: field 'iter' has incomplete type
      79 |                 struct css_task_iter    iter;
         |                                         ^~~~
   include/../kernel/cgroup/cgroup-internal.h: In function 'cgroup_is_dead':
>> include/../kernel/cgroup/cgroup-internal.h:188:22: error: invalid use of undefined type 'const struct cgroup'
     188 |         return !(cgrp->self.flags & CSS_ONLINE);
         |                      ^~
>> include/../kernel/cgroup/cgroup-internal.h:188:37: error: 'CSS_ONLINE' undeclared (first use in this function); did you mean 'CPU_ONLINE'?
     188 |         return !(cgrp->self.flags & CSS_ONLINE);
         |                                     ^~~~~~~~~~
         |                                     CPU_ONLINE
   include/../kernel/cgroup/cgroup-internal.h:188:37: note: each undeclared identifier is reported only once for each function it appears in
   include/../kernel/cgroup/cgroup-internal.h: In function 'notify_on_release':
   include/../kernel/cgroup/cgroup-internal.h:193:25: error: 'CGRP_NOTIFY_ON_RELEASE' undeclared (first use in this function)
     193 |         return test_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/../kernel/cgroup/cgroup-internal.h:193:54: error: invalid use of undefined type 'const struct cgroup'
     193 |         return test_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
         |                                                      ^~
   include/../kernel/cgroup/cgroup-internal.h: In function 'put_css_set':
>> include/../kernel/cgroup/cgroup-internal.h:207:39: error: invalid use of undefined type 'struct css_set'
     207 |         if (refcount_dec_not_one(&cset->refcount))
         |                                       ^~
   include/../kernel/cgroup/cgroup-internal.h: In function 'get_css_set':
   include/../kernel/cgroup/cgroup-internal.h:220:27: error: invalid use of undefined type 'struct css_set'
     220 |         refcount_inc(&cset->refcount);
         |                           ^~
   include/../kernel/cgroup/cgroup-internal.h: At top level:
>> include/../kernel/cgroup/cgroup-internal.h:285:22: error: array type has incomplete element type 'struct cftype'
     285 | extern struct cftype cgroup1_base_files[];
         |                      ^~~~~~~~~~~~~~~~~~
   In file included from include/trace/events/power.h:11,
                    from kernel/time/tick-common.c:19:
   include/trace/hooks/sched.h:332:25: warning: 'struct uclamp_se' declared inside parameter list will not be visible outside of this definition or declaration
     332 |                  struct uclamp_se *uclamp_max, struct uclamp_se *uclamp_eff, int *ret),
         |                         ^~~~~~~~~
   include/linux/tracepoint.h:571:41: note: in definition of macro 'DECLARE_EVENT_NOP'
     571 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/trace/hooks/vendor_hooks.h:121:33: note: in expansion of macro 'PARAMS'
     121 |         DECLARE_EVENT_NOP(name, PARAMS(proto), PARAMS(args))
         |                                 ^~~~~~
   include/trace/hooks/sched.h:330:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
     330 | DECLARE_RESTRICTED_HOOK(android_rvh_uclamp_eff_get,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/sched.h:331:9: note: in expansion of macro 'TP_PROTO'
     331 |         TP_PROTO(struct task_struct *p, enum uclamp_id clamp_id,
         |         ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]


vim +/iter +79 include/../kernel/cgroup/cgroup-internal.h

50273128d640e8 Tejun Heo       2022-01-06   69  
50273128d640e8 Tejun Heo       2022-01-06   70  struct cgroup_file_ctx {
43fa0b3639c5fd Tejun Heo       2022-01-06   71  	struct cgroup_namespace	*ns;
43fa0b3639c5fd Tejun Heo       2022-01-06   72  
50273128d640e8 Tejun Heo       2022-01-06   73  	struct {
50273128d640e8 Tejun Heo       2022-01-06   74  		void			*trigger;
50273128d640e8 Tejun Heo       2022-01-06   75  	} psi;
50273128d640e8 Tejun Heo       2022-01-06   76  
50273128d640e8 Tejun Heo       2022-01-06   77  	struct {
50273128d640e8 Tejun Heo       2022-01-06   78  		bool			started;
50273128d640e8 Tejun Heo       2022-01-06  @79  		struct css_task_iter	iter;
50273128d640e8 Tejun Heo       2022-01-06   80  	} procs;
50273128d640e8 Tejun Heo       2022-01-06   81  
50273128d640e8 Tejun Heo       2022-01-06   82  	struct {
50273128d640e8 Tejun Heo       2022-01-06   83  		struct cgroup_pidlist	*pidlist;
50273128d640e8 Tejun Heo       2022-01-06   84  	} procs1;
50273128d640e8 Tejun Heo       2022-01-06   85  };
50273128d640e8 Tejun Heo       2022-01-06   86  
0a268dbd7932c7 Tejun Heo       2016-12-27   87  /*
0a268dbd7932c7 Tejun Heo       2016-12-27   88   * A cgroup can be associated with multiple css_sets as different tasks may
0a268dbd7932c7 Tejun Heo       2016-12-27   89   * belong to different cgroups on different hierarchies.  In the other
0a268dbd7932c7 Tejun Heo       2016-12-27   90   * direction, a css_set is naturally associated with multiple cgroups.
0a268dbd7932c7 Tejun Heo       2016-12-27   91   * This M:N relationship is represented by the following link structure
0a268dbd7932c7 Tejun Heo       2016-12-27   92   * which exists for each association and allows traversing the associations
0a268dbd7932c7 Tejun Heo       2016-12-27   93   * from both sides.
0a268dbd7932c7 Tejun Heo       2016-12-27   94   */
0a268dbd7932c7 Tejun Heo       2016-12-27   95  struct cgrp_cset_link {
0a268dbd7932c7 Tejun Heo       2016-12-27   96  	/* the cgroup and css_set this link associates */
0a268dbd7932c7 Tejun Heo       2016-12-27   97  	struct cgroup		*cgrp;
0a268dbd7932c7 Tejun Heo       2016-12-27   98  	struct css_set		*cset;
0a268dbd7932c7 Tejun Heo       2016-12-27   99  
0a268dbd7932c7 Tejun Heo       2016-12-27  100  	/* list of cgrp_cset_links anchored at cgrp->cset_links */
0a268dbd7932c7 Tejun Heo       2016-12-27  101  	struct list_head	cset_link;
0a268dbd7932c7 Tejun Heo       2016-12-27  102  
0a268dbd7932c7 Tejun Heo       2016-12-27  103  	/* list of cgrp_cset_links anchored at css_set->cgrp_links */
0a268dbd7932c7 Tejun Heo       2016-12-27  104  	struct list_head	cgrp_link;
0a268dbd7932c7 Tejun Heo       2016-12-27  105  };
0a268dbd7932c7 Tejun Heo       2016-12-27  106  
e595cd706982bf Tejun Heo       2017-01-15  107  /* used to track tasks and csets during migration */
e595cd706982bf Tejun Heo       2017-01-15  108  struct cgroup_taskset {
e595cd706982bf Tejun Heo       2017-01-15  109  	/* the src and dst cset list running through cset->mg_node */
e595cd706982bf Tejun Heo       2017-01-15  110  	struct list_head	src_csets;
e595cd706982bf Tejun Heo       2017-01-15  111  	struct list_head	dst_csets;
e595cd706982bf Tejun Heo       2017-01-15  112  
610467270fb368 Tejun Heo       2017-07-08  113  	/* the number of tasks in the set */
610467270fb368 Tejun Heo       2017-07-08  114  	int			nr_tasks;
610467270fb368 Tejun Heo       2017-07-08  115  
e595cd706982bf Tejun Heo       2017-01-15  116  	/* the subsys currently being processed */
e595cd706982bf Tejun Heo       2017-01-15  117  	int			ssid;
e595cd706982bf Tejun Heo       2017-01-15  118  
e595cd706982bf Tejun Heo       2017-01-15  119  	/*
e595cd706982bf Tejun Heo       2017-01-15  120  	 * Fields for cgroup_taskset_*() iteration.
e595cd706982bf Tejun Heo       2017-01-15  121  	 *
e595cd706982bf Tejun Heo       2017-01-15  122  	 * Before migration is committed, the target migration tasks are on
e595cd706982bf Tejun Heo       2017-01-15  123  	 * ->mg_tasks of the csets on ->src_csets.  After, on ->mg_tasks of
e595cd706982bf Tejun Heo       2017-01-15  124  	 * the csets on ->dst_csets.  ->csets point to either ->src_csets
e595cd706982bf Tejun Heo       2017-01-15  125  	 * or ->dst_csets depending on whether migration is committed.
e595cd706982bf Tejun Heo       2017-01-15  126  	 *
e595cd706982bf Tejun Heo       2017-01-15  127  	 * ->cur_csets and ->cur_task point to the current task position
e595cd706982bf Tejun Heo       2017-01-15  128  	 * during iteration.
e595cd706982bf Tejun Heo       2017-01-15  129  	 */
e595cd706982bf Tejun Heo       2017-01-15  130  	struct list_head	*csets;
e595cd706982bf Tejun Heo       2017-01-15  131  	struct css_set		*cur_cset;
e595cd706982bf Tejun Heo       2017-01-15  132  	struct task_struct	*cur_task;
e595cd706982bf Tejun Heo       2017-01-15  133  };
e595cd706982bf Tejun Heo       2017-01-15  134  
e595cd706982bf Tejun Heo       2017-01-15  135  /* migration context also tracks preloading */
e595cd706982bf Tejun Heo       2017-01-15  136  struct cgroup_mgctx {
e595cd706982bf Tejun Heo       2017-01-15  137  	/*
e595cd706982bf Tejun Heo       2017-01-15  138  	 * Preloaded source and destination csets.  Used to guarantee
e595cd706982bf Tejun Heo       2017-01-15  139  	 * atomic success or failure on actual migration.
e595cd706982bf Tejun Heo       2017-01-15  140  	 */
e595cd706982bf Tejun Heo       2017-01-15  141  	struct list_head	preloaded_src_csets;
e595cd706982bf Tejun Heo       2017-01-15  142  	struct list_head	preloaded_dst_csets;
e595cd706982bf Tejun Heo       2017-01-15  143  
e595cd706982bf Tejun Heo       2017-01-15  144  	/* tasks and csets to migrate */
e595cd706982bf Tejun Heo       2017-01-15  145  	struct cgroup_taskset	tset;
bfc2cf6f61fcea Tejun Heo       2017-01-15  146  
bfc2cf6f61fcea Tejun Heo       2017-01-15  147  	/* subsystems affected by migration */
bfc2cf6f61fcea Tejun Heo       2017-01-15  148  	u16			ss_mask;
e595cd706982bf Tejun Heo       2017-01-15  149  };
e595cd706982bf Tejun Heo       2017-01-15  150  
e595cd706982bf Tejun Heo       2017-01-15  151  #define CGROUP_TASKSET_INIT(tset)						\
e595cd706982bf Tejun Heo       2017-01-15  152  {										\
e595cd706982bf Tejun Heo       2017-01-15  153  	.src_csets		= LIST_HEAD_INIT(tset.src_csets),		\
e595cd706982bf Tejun Heo       2017-01-15  154  	.dst_csets		= LIST_HEAD_INIT(tset.dst_csets),		\
e595cd706982bf Tejun Heo       2017-01-15  155  	.csets			= &tset.src_csets,				\
e595cd706982bf Tejun Heo       2017-01-15  156  }
e595cd706982bf Tejun Heo       2017-01-15  157  
e595cd706982bf Tejun Heo       2017-01-15  158  #define CGROUP_MGCTX_INIT(name)							\
e595cd706982bf Tejun Heo       2017-01-15  159  {										\
e595cd706982bf Tejun Heo       2017-01-15  160  	LIST_HEAD_INIT(name.preloaded_src_csets),				\
e595cd706982bf Tejun Heo       2017-01-15  161  	LIST_HEAD_INIT(name.preloaded_dst_csets),				\
e595cd706982bf Tejun Heo       2017-01-15  162  	CGROUP_TASKSET_INIT(name.tset),						\
e595cd706982bf Tejun Heo       2017-01-15  163  }
e595cd706982bf Tejun Heo       2017-01-15  164  
e595cd706982bf Tejun Heo       2017-01-15  165  #define DEFINE_CGROUP_MGCTX(name)						\
e595cd706982bf Tejun Heo       2017-01-15  166  	struct cgroup_mgctx name = CGROUP_MGCTX_INIT(name)
e595cd706982bf Tejun Heo       2017-01-15  167  
0a268dbd7932c7 Tejun Heo       2016-12-27  168  extern spinlock_t css_set_lock;
0a268dbd7932c7 Tejun Heo       2016-12-27  169  extern struct cgroup_subsys *cgroup_subsys[];
0a268dbd7932c7 Tejun Heo       2016-12-27  170  extern struct list_head cgroup_roots;
0a268dbd7932c7 Tejun Heo       2016-12-27  171  extern struct file_system_type cgroup_fs_type;
0a268dbd7932c7 Tejun Heo       2016-12-27  172  
0a268dbd7932c7 Tejun Heo       2016-12-27  173  /* iterate across the hierarchies */
0a268dbd7932c7 Tejun Heo       2016-12-27  174  #define for_each_root(root)						\
0a268dbd7932c7 Tejun Heo       2016-12-27  175  	list_for_each_entry((root), &cgroup_roots, root_list)
0a268dbd7932c7 Tejun Heo       2016-12-27  176  
0a268dbd7932c7 Tejun Heo       2016-12-27  177  /**
0a268dbd7932c7 Tejun Heo       2016-12-27  178   * for_each_subsys - iterate all enabled cgroup subsystems
0a268dbd7932c7 Tejun Heo       2016-12-27  179   * @ss: the iteration cursor
0a268dbd7932c7 Tejun Heo       2016-12-27  180   * @ssid: the index of @ss, CGROUP_SUBSYS_COUNT after reaching the end
0a268dbd7932c7 Tejun Heo       2016-12-27  181   */
0a268dbd7932c7 Tejun Heo       2016-12-27  182  #define for_each_subsys(ss, ssid)					\
0a268dbd7932c7 Tejun Heo       2016-12-27  183  	for ((ssid) = 0; (ssid) < CGROUP_SUBSYS_COUNT &&		\
0a268dbd7932c7 Tejun Heo       2016-12-27  184  	     (((ss) = cgroup_subsys[ssid]) || true); (ssid)++)
0a268dbd7932c7 Tejun Heo       2016-12-27  185  
0a268dbd7932c7 Tejun Heo       2016-12-27  186  static inline bool cgroup_is_dead(const struct cgroup *cgrp)
0a268dbd7932c7 Tejun Heo       2016-12-27  187  {
0a268dbd7932c7 Tejun Heo       2016-12-27 @188  	return !(cgrp->self.flags & CSS_ONLINE);
0a268dbd7932c7 Tejun Heo       2016-12-27  189  }
0a268dbd7932c7 Tejun Heo       2016-12-27  190  
0a268dbd7932c7 Tejun Heo       2016-12-27  191  static inline bool notify_on_release(const struct cgroup *cgrp)
0a268dbd7932c7 Tejun Heo       2016-12-27  192  {
0a268dbd7932c7 Tejun Heo       2016-12-27 @193  	return test_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
0a268dbd7932c7 Tejun Heo       2016-12-27  194  }
0a268dbd7932c7 Tejun Heo       2016-12-27  195  
dcfe149b9f45aa Tejun Heo       2016-12-27  196  void put_css_set_locked(struct css_set *cset);
dcfe149b9f45aa Tejun Heo       2016-12-27  197  
dcfe149b9f45aa Tejun Heo       2016-12-27  198  static inline void put_css_set(struct css_set *cset)
dcfe149b9f45aa Tejun Heo       2016-12-27  199  {
dcfe149b9f45aa Tejun Heo       2016-12-27  200  	unsigned long flags;
dcfe149b9f45aa Tejun Heo       2016-12-27  201  
dcfe149b9f45aa Tejun Heo       2016-12-27  202  	/*
dcfe149b9f45aa Tejun Heo       2016-12-27  203  	 * Ensure that the refcount doesn't hit zero while any readers
dcfe149b9f45aa Tejun Heo       2016-12-27  204  	 * can see it. Similar to atomic_dec_and_lock(), but for an
dcfe149b9f45aa Tejun Heo       2016-12-27  205  	 * rwlock
dcfe149b9f45aa Tejun Heo       2016-12-27  206  	 */
4b9502e63b5e2b Elena Reshetova 2017-03-08 @207  	if (refcount_dec_not_one(&cset->refcount))
dcfe149b9f45aa Tejun Heo       2016-12-27  208  		return;
dcfe149b9f45aa Tejun Heo       2016-12-27  209  
dcfe149b9f45aa Tejun Heo       2016-12-27  210  	spin_lock_irqsave(&css_set_lock, flags);
dcfe149b9f45aa Tejun Heo       2016-12-27  211  	put_css_set_locked(cset);
dcfe149b9f45aa Tejun Heo       2016-12-27  212  	spin_unlock_irqrestore(&css_set_lock, flags);
dcfe149b9f45aa Tejun Heo       2016-12-27  213  }
dcfe149b9f45aa Tejun Heo       2016-12-27  214  

:::::: The code at line 79 was first introduced by commit
:::::: 50273128d640e8d21a13aec5f4bbce4802f17d7d cgroup: Allocate cgroup_file_ctx for kernfs_open_file->priv

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--smuC0qGUS2CdLb6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/i386 5.15.41 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-11 (Debian 11.3.0-8) 11.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=110300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23900
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23900
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
# CONFIG_LOCALVERSION_AUTO is not set
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
CONFIG_KERNEL_XZ=y
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_WATCH_QUEUE is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
# CONFIG_USELIB is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
# end of Timers subsystem

CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# end of BPF subsystem

CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
# CONFIG_CGROUPS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_RELAY is not set
# CONFIG_BLK_DEV_INITRD is not set
# CONFIG_BOOT_CONFIG is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_LD_ORPHAN_WARN=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
# CONFIG_SGETMASK_SYSCALL is not set
# CONFIG_SYSFS_SYSCALL is not set
# CONFIG_FHANDLE is not set
# CONFIG_POSIX_TIMERS is not set
# CONFIG_PRINTK is not set
# CONFIG_BUG is not set
# CONFIG_PCSPKR_PLATFORM is not set
# CONFIG_BASE_FULL is not set
# CONFIG_FUTEX is not set
# CONFIG_EPOLL is not set
# CONFIG_SIGNALFD is not set
# CONFIG_TIMERFD is not set
# CONFIG_EVENTFD is not set
# CONFIG_SHMEM is not set
# CONFIG_AIO is not set
# CONFIG_IO_URING is not set
# CONFIG_ADVISE_SYSCALLS is not set
# CONFIG_MEMBARRIER is not set
# CONFIG_KALLSYMS is not set
# CONFIG_USERFAULTFD is not set
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
# CONFIG_KCMP is not set
# CONFIG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

# CONFIG_VM_EVENT_COUNTERS is not set
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
# CONFIG_SLUB is not set
CONFIG_SLOB=y
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_PROFILING is not set
# end of General setup

CONFIG_X86_32=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf32-i386"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=16
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_NR_GPIO=512
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
# CONFIG_SMP is not set
# CONFIG_X86_FEATURE_NAMES is not set
# CONFIG_GOLDFISH is not set
# CONFIG_RETPOLINE is not set
CONFIG_CC_HAS_SLS=y
# CONFIG_X86_CPU_RESCTRL is not set
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_32_IRIS is not set
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
# CONFIG_HYPERVISOR_GUEST is not set
# CONFIG_M486SX is not set
# CONFIG_M486 is not set
# CONFIG_M586 is not set
# CONFIG_M586TSC is not set
# CONFIG_M586MMX is not set
CONFIG_M686=y
# CONFIG_MPENTIUMII is not set
# CONFIG_MPENTIUMIII is not set
# CONFIG_MPENTIUMM is not set
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MK8 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MEFFICEON is not set
# CONFIG_MWINCHIPC6 is not set
# CONFIG_MWINCHIP3D is not set
# CONFIG_MELAN is not set
# CONFIG_MGEODEGX1 is not set
# CONFIG_MGEODE_LX is not set
# CONFIG_MCYRIXIII is not set
# CONFIG_MVIAC3_2 is not set
# CONFIG_MVIAC7 is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
# CONFIG_X86_GENERIC is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=5
CONFIG_X86_L1_CACHE_SHIFT=5
CONFIG_X86_USE_PPRO_CHECKSUM=y
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=6
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
# CONFIG_PROCESSOR_SELECT is not set
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_CYRIX_32=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_TRANSMETA_32=y
CONFIG_CPU_SUP_UMC_32=y
CONFIG_CPU_SUP_ZHAOXIN=y
# CONFIG_HPET_TIMER is not set
# CONFIG_DMI is not set
CONFIG_NR_CPUS_RANGE_BEGIN=1
CONFIG_NR_CPUS_RANGE_END=1
CONFIG_NR_CPUS_DEFAULT=1
CONFIG_NR_CPUS=1
# CONFIG_X86_UP_APIC is not set
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# end of Performance monitoring

# CONFIG_X86_LEGACY_VM86 is not set
# CONFIG_X86_IOPL_IOPERM is not set
# CONFIG_TOSHIBA is not set
# CONFIG_X86_REBOOTFIXUPS is not set
# CONFIG_MICROCODE is not set
# CONFIG_X86_MSR is not set
# CONFIG_X86_CPUID is not set
CONFIG_NOHIGHMEM=y
# CONFIG_HIGHMEM4G is not set
# CONFIG_HIGHMEM64G is not set
CONFIG_VMSPLIT_3G=y
# CONFIG_VMSPLIT_3G_OPT is not set
# CONFIG_VMSPLIT_2G is not set
# CONFIG_VMSPLIT_2G_OPT is not set
# CONFIG_VMSPLIT_1G is not set
CONFIG_PAGE_OFFSET=0xC0000000
# CONFIG_X86_PAE is not set
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ILLEGAL_POINTER_VALUE=0
# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
# CONFIG_MTRR is not set
# CONFIG_ARCH_RANDOM is not set
# CONFIG_X86_SMAP is not set
# CONFIG_X86_UMIP is not set
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
# CONFIG_KEXEC is not set
CONFIG_PHYSICAL_START=0x1000000
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
# CONFIG_COMPAT_VDSO is not set
# CONFIG_CMDLINE_BOOL is not set
# CONFIG_MODIFY_LDT_SYSCALL is not set
# end of Processor type and features

CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
# CONFIG_SUSPEND is not set
# CONFIG_PM is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
# CONFIG_ACPI is not set

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
# CONFIG_CPU_IDLE is not set
# end of CPU Idle
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
# CONFIG_ISA is not set
# CONFIG_SCx200 is not set
# CONFIG_OLPC is not set
# CONFIG_ALIX is not set
# CONFIG_NET5501 is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_COMPAT_32=y
# end of Binary Emulations

CONFIG_HAVE_ATOMIC_IOMAP=y
CONFIG_HAVE_KVM=y
# CONFIG_VIRTUALIZATION is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_GENERIC_ENTRY=y
# CONFIG_JUMP_LABEL is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=8
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SPLIT_ARG64=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# CONFIG_GCC_PLUGINS is not set
# end of General architecture-dependent options

CONFIG_BASE_SMALL=1
# CONFIG_MODULES is not set
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
# CONFIG_GKI_HIDDEN_DRM_CONFIGS is not set
# CONFIG_GKI_HIDDEN_REGMAP_CONFIGS is not set
# CONFIG_GKI_HIDDEN_CRYPTO_CONFIGS is not set
# CONFIG_GKI_HIDDEN_SND_CONFIGS is not set
# CONFIG_GKI_HIDDEN_SND_SOC_CONFIGS is not set
# CONFIG_GKI_HIDDEN_MMC_CONFIGS is not set
# CONFIG_GKI_HIDDEN_GPIO_CONFIGS is not set
# CONFIG_GKI_HIDDEN_QCOM_CONFIGS is not set
# CONFIG_GKI_HIDDEN_MEDIA_CONFIGS is not set
# CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS is not set
# CONFIG_GKI_LEGACY_WEXT_ALLCONFIG is not set
# CONFIG_GKI_HIDDEN_USB_CONFIGS is not set
# CONFIG_GKI_HIDDEN_SOC_BUS_CONFIGS is not set
# CONFIG_GKI_HIDDEN_RPMSG_CONFIGS is not set
# CONFIG_GKI_HIDDEN_GPU_CONFIGS is not set
# CONFIG_GKI_HIDDEN_IRQ_CONFIGS is not set
# CONFIG_GKI_HIDDEN_HYPERVISOR_CONFIGS is not set
# CONFIG_GKI_HIDDEN_NET_CONFIGS is not set
# CONFIG_GKI_HIDDEN_PHY_CONFIGS is not set
# CONFIG_GKI_HIDDEN_MM_CONFIGS is not set
# CONFIG_GKI_HIDDEN_ETHERNET_CONFIGS is not set
# CONFIG_GKI_HIDDEN_DMA_CONFIGS is not set
# CONFIG_GKI_HACKS_TO_FIX is not set

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
# CONFIG_BINFMT_SCRIPT is not set
# CONFIG_BINFMT_MISC is not set
# CONFIG_COREDUMP is not set
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_FLATMEM_MANUAL=y
# CONFIG_SPARSEMEM_MANUAL is not set
CONFIG_FLATMEM=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_SPLIT_PTLOCK_CPUS=4
# CONFIG_COMPACTION is not set
# CONFIG_PAGE_REPORTING is not set
CONFIG_VIRT_TO_BUS=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CLEANCACHE is not set
# CONFIG_CMA is not set
# CONFIG_ZPOOL is not set
# CONFIG_ZSMALLOC is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
# CONFIG_ZONE_DMA is not set
# CONFIG_PERCPU_STATS is not set

#
# GUP_TEST needs to have DEBUG_FS enabled
#
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_KMAP_LOCAL=y
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
# CONFIG_PCI is not set
# CONFIG_PCCARD is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
# CONFIG_DEVTMPFS is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
# CONFIG_FW_LOADER is not set
# end of Firmware loader

# CONFIG_ALLOW_DEV_COREDUMP is not set
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# end of Bus devices

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

# CONFIG_EDD is not set
# CONFIG_FIRMWARE_MEMMAP is not set
CONFIG_SYSFB=y
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
# CONFIG_DUMMY_IRQ is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_SRAM is not set
# CONFIG_XILINX_SDFEC is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_93CX6 is not set
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

#
# Altera FPGA firmware download module (requires I2C)
#
# CONFIG_ECHO is not set
# CONFIG_PVPANIC is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# end of SCSI device support

# CONFIG_MACINTOSH_DRIVERS is not set

#
# Input device support
#
# CONFIG_INPUT is not set

#
# Hardware I/O ports
#
# CONFIG_SERIO is not set
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
# CONFIG_TTY is not set
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_IPMI_HANDLER is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_PC8736x_GPIO is not set
# CONFIG_NSC_GPIO is not set
# CONFIG_DEVMEM is not set
# CONFIG_NVRAM is not set
# CONFIG_HANGCHECK_TIMER is not set
# CONFIG_TCG_TPM is not set
# CONFIG_TELCLOCK is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
# CONFIG_I2C is not set
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
# CONFIG_PPS is not set

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

# CONFIG_PINCTRL is not set
# CONFIG_GPIOLIB is not set
# CONFIG_W1 is not set
# CONFIG_POWER_RESET is not set
# CONFIG_POWER_SUPPLY is not set
# CONFIG_HWMON is not set
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
# CONFIG_MFD_MADERA is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_TQMX86 is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
# CONFIG_DRM is not set

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
# CONFIG_FB is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
# end of Backlight & LCD device support
# end of Graphics support

# CONFIG_SOUND is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_USB_SUPPORT is not set
# CONFIG_MMC is not set
# CONFIG_MEMSTICK is not set
# CONFIG_NEW_LEDS is not set
# CONFIG_ACCESSIBILITY is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_HEAPS_DEFERRED_FREE is not set
# CONFIG_DMABUF_HEAPS_PAGE_POOL is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_UIO is not set
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_X86_PLATFORM_DEVICES is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_COMMON_CLK is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKSRC_I8253=y
CONFIG_CLKEVT_I8253=y
CONFIG_CLKBLD_I8253=y
# CONFIG_SUN4I_TIMER is not set
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

# CONFIG_RAS is not set

#
# Android
#
# CONFIG_ANDROID is not set
# end of Android

# CONFIG_DAX is not set
# CONFIG_NVMEM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_TEE is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
# CONFIG_EXPORTFS_BLOCK_OPS is not set
# CONFIG_FILE_LOCKING is not set
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
# CONFIG_DNOTIFY is not set
# CONFIG_INOTIFY_USER is not set
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
# CONFIG_PROC_CHILDREN is not set
# CONFIG_SYSFS is not set
# CONFIG_HUGETLBFS is not set
# CONFIG_CONFIGFS_FS is not set
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NLS is not set
# CONFIG_UNICODE is not set
# end of File systems

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITYFS is not set
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

# CONFIG_CRYPTO is not set

#
# Library routines
#
# CONFIG_PACKING is not set
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
# CONFIG_CORDIC is not set
# CONFIG_PRIME_NUMBERS is not set
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y
# CONFIG_CRC_CCITT is not set
# CONFIG_CRC16 is not set
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC_ITU_T is not set
# CONFIG_CRC32 is not set
# CONFIG_CRC64 is not set
# CONFIG_CRC4 is not set
# CONFIG_CRC7 is not set
# CONFIG_LIBCRC32C is not set
# CONFIG_CRC8 is not set
# CONFIG_RANDOM32_SELFTEST is not set
# CONFIG_XZ_DEC is not set
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_IRQ_POLL is not set
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_32=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_ARCH_STACKWALK=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_SYMBOLIC_ERRNAME is not set
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
# CONFIG_DEBUG_INFO is not set
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_DEBUG_FS is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
# CONFIG_DEBUG_KMAP_LOCAL is not set
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SOFTLOCKUP_DETECTOR is not set
# CONFIG_HARDLOCKUP_DETECTOR is not set
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
# CONFIG_STACKTRACE is not set
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y

#
# x86 Debugging
#
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
# CONFIG_X86_VERBOSE_BOOTUP is not set
# CONFIG_EARLY_PRINTK is not set
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_UNWINDER_FRAME_POINTER is not set
CONFIG_UNWINDER_GUESS=y
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

--smuC0qGUS2CdLb6t--
