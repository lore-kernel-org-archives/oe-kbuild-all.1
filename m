Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD2B2E371F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 02:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754276089; cv=none; b=sR/4UvTyAbk/T1vd4PkhCQ5bKVddRoMpMR82MXs1rt0Ttu4WBGY/B8iZnLszDYxkCtXlOwEGZC8a+xd2RLL+q+yhFTSwuK74ZLBYsk5OTvrQ2RcrfA3chdMaVE55zO7hSUFw3u2FfIiOj5OyztN4vmO0jLfGuJl5BUNcW9DQEyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754276089; c=relaxed/simple;
	bh=7P/lT/jsTQVIQtwYUbaGNCA7WxPmuWE2mYZyL7AZhe4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V01gjQtiVvpMP+BNXOQ4o7VYiJS+42XLYCy0vuc77B9IdV9FYipApwKcMgKLgDiXdY1S6tdQPyXgpqGDOUCsLtZ0IZHpFVPW7RLcOhqmwgjylEzZpzGRNyz8zHLPNAurOUKmikZzRSMuAbgfeozSUmEriIGWDIxnt5qnGkeVh6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGCyIiVN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGCyIiVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754276087; x=1785812087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7P/lT/jsTQVIQtwYUbaGNCA7WxPmuWE2mYZyL7AZhe4=;
  b=kGCyIiVNJN9ow3I6/8NdXAmRW5Kg4QgJNr73HfWXVuNyZD/2YCkeFGwc
   Une22itZLIFetYvJONra38L2ayL/ZTYSf+hfNHkr9Lbfn2V8ss/U78HY1
   FI/rp5D2Gwve6lHEGv53t2HPYpIIM7mxTWxcAaXLq8cjgJWAAM2zpk8nK
   kUfrBdULddzSu8h3irWhwjCpaVo5YBQoKhGa7y1xHppAJ9hLeVXQMywS4
   D+694Tcd7JE8DcSB8aiQkXon/j/8x1MX2KBl9TfmD+XUiaG0JAwFAspN7
   36vTRQGr0P53yK8wckjENu2ftzRi4nfjup1+7zaWaqzUfoh96XqeIo6fs
   w==;
X-CSE-ConnectionGUID: c/sQbV2YTRS1Qwt5364oZQ==
X-CSE-MsgGUID: t9AhuPPFTyWATFIuA+JawQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56605515"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56605515"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 19:54:46 -0700
X-CSE-ConnectionGUID: M3I25Ob6SbuuSzW6iz8IcQ==
X-CSE-MsgGUID: hMVtyJFVRFyxgQ0MSJHvnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168292213"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Aug 2025 19:54:45 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uilLW-0006lM-2T;
	Mon, 04 Aug 2025 02:54:42 +0000
Date: Mon, 4 Aug 2025 10:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 34/34] kernel/sched/core.c:6748:9: warning:
 calling function 'pick_next_task' requires holding raw_spinlock
 '__rq_lockp(rq)' exclusively
Message-ID: <202508041041.fLVE4JRa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   f1cc5c884f88ed0d4f9619b9d8b6e75d35d226d9
commit: f1cc5c884f88ed0d4f9619b9d8b6e75d35d226d9 [34/34] sched: Enable capability analysis for core.c and fair.c
config: s390-randconfig-001-20250804 (https://download.01.org/0day-ci/archive/20250804/202508041041.fLVE4JRa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041041.fLVE4JRa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041041.fLVE4JRa-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
         |         ^
   kernel/sched/core.c:5310:1: warning: raw_spinlock '__rq_lockp(__this_rq())' is still held at the end of function [-Wthread-safety-analysis]
    5310 | }
         | ^
   kernel/sched/core.c:5229:2: note: raw_spinlock acquired here
    5229 |         __releases(__rq_lockp(this_rq()))
         |         ^
   include/linux/compiler-capability-analysis.h:286:26: note: expanded from macro '__releases'
     286 | #define __releases(...)         __releases_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:20:47: note: expanded from macro '__releases_cap'
      20 | # define __releases_cap(...)                    __attribute__((release_capability(__VA_ARGS__)))
         |                                                                ^
   kernel/sched/core.c:5328:2: warning: releasing raw_spinlock '__rq_lockp(__this_rq())' that was not held [-Wthread-safety-analysis]
    5328 |         finish_task_switch(prev);
         |         ^
   kernel/sched/core.c:5341:1: warning: raw_spinlock '__this_rq().__lock' is still held at the end of function [-Wthread-safety-analysis]
    5341 | }
         | ^
   kernel/sched/core.c:5317:2: note: raw_spinlock acquired here
    5317 |         __releases(&this_rq()->__lock)
         |         ^
   include/linux/compiler-capability-analysis.h:286:26: note: expanded from macro '__releases'
     286 | #define __releases(...)         __releases_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:20:47: note: expanded from macro '__releases_cap'
      20 | # define __releases_cap(...)                    __attribute__((release_capability(__VA_ARGS__)))
         |                                                                ^
   kernel/sched/core.c:5401:2: warning: releasing raw_spinlock '__rq_lockp(rq)' that was not held [-Wthread-safety-analysis]
    5401 |         prepare_lock_switch(rq, next, rf);
         |         ^
   kernel/sched/core.c:5408:1: warning: raw_spinlock 'rq->__lock' is still held at the end of function [-Wthread-safety-analysis]
    5408 | }
         | ^
   kernel/sched/core.c:5349:2: note: raw_spinlock acquired here
    5349 |         __releases(&rq->__lock)
         |         ^
   include/linux/compiler-capability-analysis.h:286:26: note: expanded from macro '__releases'
     286 | #define __releases(...)         __releases_cap(__VA_ARGS__)
         |                                 ^
   include/linux/compiler-capability-analysis.h:20:47: note: expanded from macro '__releases_cap'
      20 | # define __releases_cap(...)                    __attribute__((release_capability(__VA_ARGS__)))
         |                                                                ^
   kernel/sched/core.c:5601:2: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    5601 |         task_rq_unlock(rq, p, &rf);
         |         ^
   kernel/sched/core.c:5604:1: warning: raw_spinlock '__ret->__lock' is not held on every path through here [-Wthread-safety-analysis]
    5604 | }
         | ^
   kernel/sched/core.c:5589:18: note: raw_spinlock acquired here
    5589 |         struct rq *rq = task_rq_lock(p, &rf);
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
   kernel/sched/core.c:6435:2: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    6435 |         raw_spin_rq_unlock_irq(rq);
         |         ^
   kernel/sched/core.c:6444:1: warning: raw_spinlock 'rq->__lock' is still held at the end of function [-Wthread-safety-analysis]
    6444 | }
         | ^
   kernel/sched/core.c:6443:2: note: raw_spinlock acquired here
    6443 |         raw_spin_rq_lock_irq(rq);
         |         ^
>> kernel/sched/core.c:6748:9: warning: calling function 'pick_next_task' requires holding raw_spinlock '__rq_lockp(rq)' exclusively [-Wthread-safety-analysis]
    6748 |         next = pick_next_task(rq, prev, &rf);
         |                ^
   kernel/sched/core.c:7309:2: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    7309 |         raw_spin_rq_unlock(rq);
         |         ^
   kernel/sched/core.c:7312:1: warning: raw_spinlock '__ret->__lock' is not held on every path through here [-Wthread-safety-analysis]
    7312 | }
         | ^
   kernel/sched/core.c:7205:18: note: raw_spinlock acquired here
    7205 |         struct rq *rq = __task_rq_lock(p, &rf);
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
   kernel/sched/core.c:7977:2: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    7977 |         task_rq_unlock(rq, p, &rf);
         |         ^
   kernel/sched/core.c:7978:1: warning: raw_spinlock '__ret->__lock' is still held at the end of function [-Wthread-safety-analysis]
    7978 | }
         | ^
   kernel/sched/core.c:7962:7: note: raw_spinlock acquired here
    7962 |         rq = task_rq_lock(p, &rf);
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
   kernel/sched/core.c:6462:1: warning: unused function 'class_core_lock_lock_ptr' [-Wunused-function]
    6462 | DEFINE_LOCK_GUARD_1(core_lock, int,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6463 |                     sched_core_lock(*_T->lock, &_T->flags),
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6464 |                     sched_core_unlock(*_T->lock, &_T->flags),
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6465 |                     unsigned long flags)
         |                     ~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:444:49: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     444 | __DEFINE_CLASS_IS_CONDITIONAL(_name, false);                            \
         |                                                                         ^
     445 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:413:10: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
     413 |                                                                         \
         |                                                                         ^
     414 | __DEFINE_GUARD_LOCK_PTR(_name, &_T->lock)
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:319:23: note: expanded from macro '\
   __DEFINE_GUARD_LOCK_PTR'
     319 |         static inline void * class_##_name##_lock_ptr(class_##_name##_t *_T) \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:109:1: note: expanded from here
     109 | class_core_lock_lock_ptr
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   45 warnings generated.
--
   In file included from kernel/sched/fair.c:57:
   kernel/sched/sched.h:3062:3: warning: releasing raw_spinlock '__rq_lockp(busiest)' that was not held [-Wthread-safety-analysis]
    3062 |                 __release(__rq_lockp(busiest)); /* fake release */
         |                 ^
   include/linux/compiler-capability-analysis.h:302:23: note: expanded from macro '__release'
     302 | #define __release(x)            __release_cap(x)
         |                                 ^
   In file included from kernel/sched/fair.c:57:
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
   In file included from kernel/sched/fair.c:57:
   In file included from kernel/sched/sched.h:3227:
   kernel/sched/stats.h:209:3: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
     209 |                 __task_rq_unlock(rq, &rf);
         |                 ^
   kernel/sched/stats.h:211:1: warning: raw_spinlock '__ret->__lock' is not held on every path through here [-Wthread-safety-analysis]
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
>> kernel/sched/fair.c:2928:2: warning: spinlock 'group_lock' is not held on every path through here [-Wthread-safety-analysis]
    2928 |         for_each_online_node(nid) {
         |         ^
   include/linux/nodemask.h:524:36: note: expanded from macro 'for_each_online_node'
     524 | #define for_each_online_node(node) for_each_node_state(node, N_ONLINE)
         |                                    ^
   include/linux/nodemask.h:429:2: note: expanded from macro 'for_each_node_state'
     429 |         for_each_node_mask((__node), node_states[__state])
         |         ^
   include/linux/nodemask.h:374:16: note: expanded from macro 'for_each_node_mask'
     374 |         for ((node) = first_node(mask);                             \
         |                       ^
   include/linux/nodemask.h:250:25: note: expanded from macro 'first_node'
     250 | #define first_node(src) __first_node(&(src))
         |                         ^
   kernel/sched/fair.c:2924:3: note: spinlock acquired here
    2924 |                 spin_lock_irq(group_lock);
         |                 ^
>> kernel/sched/fair.c:2995:3: warning: releasing spinlock 'group_lock' that was not held [-Wthread-safety-analysis]
    2995 |                 spin_unlock_irq(group_lock);
         |                 ^
>> kernel/sched/fair.c:8703:3: warning: releasing raw_spinlock 'rq->__lock' that was not held [-Wthread-safety-analysis]
    8703 |                 task_rq_unlock(rq, p, &rf);
         |                 ^
>> kernel/sched/fair.c:8706:2: warning: raw_spinlock '__ret->__lock' is not held on every path through here [-Wthread-safety-analysis]
    8706 |         remove_entity_load_avg(se);
         |         ^
   kernel/sched/fair.c:8698:8: note: raw_spinlock acquired here
    8698 |                 rq = task_rq_lock(p, &rf);
         |                      ^
   kernel/sched/sched.h:1829:27: note: expanded from macro 'task_rq_lock'
    1829 | #define task_rq_lock(...) __acquire_ret(_task_rq_lock(__VA_ARGS__), &__ret->__lock)
         |                           ^
   include/linux/compiler-capability-analysis.h:368:3: note: expanded from macro '__acquire_ret'
     368 |                 __acquire(ret_expr);            \
         |                 ^
   include/linux/compiler-capability-analysis.h:294:23: note: expanded from macro '__acquire'
     294 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
>> kernel/sched/fair.c:12852:2: warning: releasing raw_spinlock 'this_rq->__lock' that was not held [-Wthread-safety-analysis]
    12852 |         raw_spin_rq_unlock(this_rq);
          |         ^
>> kernel/sched/fair.c:12908:6: warning: raw_spinlock 'this_rq->__lock' is not held on every path through here [-Wthread-safety-analysis]
    12908 |         if (time_after(this_rq->next_balance, next_balance))
          |             ^
   include/linux/jiffies.h:128:13: note: expanded from macro 'time_after'
     128 |         (typecheck(unsigned long, a) && \
         |                    ^
   kernel/sched/fair.c:12889:2: note: raw_spinlock acquired here
    12889 |         raw_spin_rq_lock(this_rq);
          |         ^
   kernel/sched/fair.c:484:20: warning: unused function 'list_del_leaf_cfs_rq' [-Wunused-function]
     484 | static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:505:19: warning: unused function 'tg_is_idle' [-Wunused-function]
     505 | static inline int tg_is_idle(struct task_group *tg)
         |                   ^~~~~~~~~~
   kernel/sched/fair.c:4033:20: warning: unused function 'load_avg_is_decayed' [-Wunused-function]
    4033 | static inline bool load_avg_is_decayed(struct sched_avg *sa)
         |                    ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6744:20: warning: unused function 'sync_throttle' [-Wunused-function]
    6744 | static inline void sync_throttle(struct task_group *tg, int cpu) {}
         |                    ^~~~~~~~~~~~~
   kernel/sched/fair.c:6768:37: warning: unused function 'tg_cfs_bandwidth' [-Wunused-function]
    6768 | static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
         |                                     ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6772:20: warning: unused function 'destroy_cfs_bandwidth' [-Wunused-function]
    6772 | static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10103:20: warning: unused function 'check_misfit_status' [-Wunused-function]
    10103 | static inline bool check_misfit_status(struct rq *rq)
          |                    ^~~~~~~~~~~~~~~~~~~
   17 warnings generated.


vim +6748 kernel/sched/core.c

7b3d61f6578ab0 kernel/sched/core.c John Stultz         2024-10-09  6631  
^1da177e4c3f41 kernel/sched.c      Linus Torvalds      2005-04-16  6632  /*
c259e01a1ec900 kernel/sched.c      Thomas Gleixner     2011-06-22  6633   * __schedule() is the main scheduler function.
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6634   *
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6635   * The main means of driving the scheduler and thus entering this function are:
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6636   *
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6637   *   1. Explicit blocking: mutex, semaphore, waitqueue, etc.
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6638   *
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6639   *   2. TIF_NEED_RESCHED flag is checked on interrupt and userspace return
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6640   *      paths. For example, see arch/x86/entry_64.S.
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6641   *
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6642   *      To drive preemption between tasks, the scheduler sets the flag in timer
86dd6c04ef9f21 kernel/sched/core.c Ingo Molnar         2024-03-08  6643   *      interrupt handler sched_tick().
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6644   *
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6645   *   3. Wakeups don't really cause entry into schedule(). They add a
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6646   *      task to the run-queue and that's it.
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6647   *
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6648   *      Now, if the new task added to the run-queue preempts the current
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6649   *      task, then the wakeup sets TIF_NEED_RESCHED and schedule() gets
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6650   *      called on the nearest possible occasion:
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6651   *
c1a280b68d4e6b kernel/sched/core.c Thomas Gleixner     2019-07-26  6652   *       - If the kernel is preemptible (CONFIG_PREEMPTION=y):
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6653   *
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6654   *         - in syscall or exception context, at the next outmost
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6655   *           preempt_enable(). (this might be as soon as the wake_up()'s
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6656   *           spin_unlock()!)
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6657   *
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6658   *         - in IRQ context, return from interrupt-handler to
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6659   *           preemptible context
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6660   *
c1a280b68d4e6b kernel/sched/core.c Thomas Gleixner     2019-07-26  6661   *       - If the kernel is not preemptible (CONFIG_PREEMPTION is not set)
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6662   *         then at the next:
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6663   *
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6664   *          - cond_resched() call
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6665   *          - explicit schedule() call
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6666   *          - return from syscall or exception to user-space
edde96eafc91a5 kernel/sched/core.c Pekka Enberg        2012-08-04  6667   *          - return from interrupt-handler to user-space
bfd9b2b5f80e72 kernel/sched/core.c Frederic Weisbecker 2015-01-28  6668   *
b30f0e3ffedfa5 kernel/sched/core.c Frederic Weisbecker 2015-05-12  6669   * WARNING: must be called with preemption disabled!
^1da177e4c3f41 kernel/sched.c      Linus Torvalds      2005-04-16  6670   */
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6671  static void __sched notrace __schedule(int sched_mode)
dd41f596cda0d7 kernel/sched.c      Ingo Molnar         2007-07-09  6672  {
dd41f596cda0d7 kernel/sched.c      Ingo Molnar         2007-07-09  6673  	struct task_struct *prev, *next;
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6674  	/*
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6675  	 * On PREEMPT_RT kernel, SM_RTLOCK_WAIT is noted
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6676  	 * as a preemption by schedule_debug() and RCU.
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6677  	 */
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6678  	bool preempt = sched_mode > SM_NONE;
26f80681a09b95 kernel/sched/core.c Gabriele Monaco     2025-03-05  6679  	bool is_switch = false;
67ca7bde2e9d35 kernel/sched.c      Harvey Harrison     2008-02-15  6680  	unsigned long *switch_count;
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra      2020-07-03  6681  	unsigned long prev_state;
d8ac897137a230 kernel/sched/core.c Matt Fleming        2016-09-21  6682  	struct rq_flags rf;
dd41f596cda0d7 kernel/sched.c      Ingo Molnar         2007-07-09  6683  	struct rq *rq;
31656519e132f6 kernel/sched.c      Peter Zijlstra      2008-07-18  6684  	int cpu;
dd41f596cda0d7 kernel/sched.c      Ingo Molnar         2007-07-09  6685  
26f80681a09b95 kernel/sched/core.c Gabriele Monaco     2025-03-05  6686  	trace_sched_entry_tp(preempt, CALLER_ADDR0);
26f80681a09b95 kernel/sched/core.c Gabriele Monaco     2025-03-05  6687  
dd41f596cda0d7 kernel/sched.c      Ingo Molnar         2007-07-09  6688  	cpu = smp_processor_id();
dd41f596cda0d7 kernel/sched.c      Ingo Molnar         2007-07-09  6689  	rq = cpu_rq(cpu);
dd41f596cda0d7 kernel/sched.c      Ingo Molnar         2007-07-09  6690  	prev = rq->curr;
dd41f596cda0d7 kernel/sched.c      Ingo Molnar         2007-07-09  6691  
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6692  	schedule_debug(prev, preempt);
^1da177e4c3f41 kernel/sched.c      Linus Torvalds      2005-04-16  6693  
e0ee463c93c43b kernel/sched/core.c Juri Lelli          2021-02-08  6694  	if (sched_feat(HRTICK) || sched_feat(HRTICK_DL))
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra      2008-01-25  6695  		hrtick_clear(rq);
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra      2008-01-25  6696  
676e8cf70cb053 kernel/sched/core.c Peter Zijlstra      2025-05-09  6697  	klp_sched_try_switch(prev);
676e8cf70cb053 kernel/sched/core.c Peter Zijlstra      2025-05-09  6698  
46a5d164db53ba kernel/sched/core.c Paul E. McKenney    2015-10-07  6699  	local_irq_disable();
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6700  	rcu_note_context_switch(preempt);
46a5d164db53ba kernel/sched/core.c Paul E. McKenney    2015-10-07  6701  
e0acd0a68ec7db kernel/sched/core.c Oleg Nesterov       2013-08-12  6702  	/*
e0acd0a68ec7db kernel/sched/core.c Oleg Nesterov       2013-08-12  6703  	 * Make sure that signal_pending_state()->signal_pending() below
e0acd0a68ec7db kernel/sched/core.c Oleg Nesterov       2013-08-12  6704  	 * can't be reordered with __set_current_state(TASK_INTERRUPTIBLE)
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra      2020-07-03  6705  	 * done by the caller to avoid the race with signal_wake_up():
306e060435d7a3 kernel/sched/core.c Mathieu Desnoyers   2018-01-29  6706  	 *
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra      2020-07-03  6707  	 * __set_current_state(@state)		signal_wake_up()
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra      2020-07-03  6708  	 * schedule()				  set_tsk_thread_flag(p, TIF_SIGPENDING)
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra      2020-07-03  6709  	 *					  wake_up_state(p, state)
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra      2020-07-03  6710  	 *   LOCK rq->lock			    LOCK p->pi_state
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra      2020-07-03  6711  	 *   smp_mb__after_spinlock()		    smp_mb__after_spinlock()
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra      2020-07-03  6712  	 *     if (signal_pending_state())	    if (p->state & @state)
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra      2020-07-03  6713  	 *
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra      2020-07-03  6714  	 * Also, the membarrier system call requires a full memory barrier
a14d11a0f5f410 kernel/sched/core.c Andrea Parri        2024-01-31  6715  	 * after coming from user-space, before storing to rq->curr; this
a14d11a0f5f410 kernel/sched/core.c Andrea Parri        2024-01-31  6716  	 * barrier matches a full barrier in the proximity of the membarrier
a14d11a0f5f410 kernel/sched/core.c Andrea Parri        2024-01-31  6717  	 * system call exit.
e0acd0a68ec7db kernel/sched/core.c Oleg Nesterov       2013-08-12  6718  	 */
8a8c69c3277886 kernel/sched/core.c Peter Zijlstra      2016-10-04  6719  	rq_lock(rq, &rf);
d89e588ca40816 kernel/sched/core.c Peter Zijlstra      2016-09-05  6720  	smp_mb__after_spinlock();
^1da177e4c3f41 kernel/sched.c      Linus Torvalds      2005-04-16  6721  
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar         2017-02-01  6722  	/* Promote REQ to ACT */
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar         2017-02-01  6723  	rq->clock_update_flags <<= 1;
bce4dc80c66ad3 kernel/sched/core.c Peter Zijlstra      2017-02-21  6724  	update_rq_clock(rq);
5ebde09d91707a kernel/sched/core.c Hao Jia             2023-10-12  6725  	rq->clock_update_flags = RQCF_UPDATED;
9edfbfed3f544a kernel/sched/core.c Peter Zijlstra      2015-01-05  6726  
246d86b5184506 kernel/sched.c      Oleg Nesterov       2010-05-19  6727  	switch_count = &prev->nivcsw;
d136122f584584 kernel/sched/core.c Peter Zijlstra      2020-07-20  6728  
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6729  	/* Task state changes only considers SM_PREEMPT as preemption */
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6730  	preempt = sched_mode == SM_PREEMPT;
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6731  
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra      2020-07-03  6732  	/*
d136122f584584 kernel/sched/core.c Peter Zijlstra      2020-07-20  6733  	 * We must load prev->state once (task_struct::state is volatile), such
2500ad1c7fa42a kernel/sched/core.c Eric W. Biederman   2022-04-29  6734  	 * that we form a control dependency vs deactivate_task() below.
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra      2020-07-03  6735  	 */
2f064a59a11ff9 kernel/sched/core.c Peter Zijlstra      2021-06-11  6736  	prev_state = READ_ONCE(prev->__state);
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6737  	if (sched_mode == SM_IDLE) {
edf1c586e92675 kernel/sched/core.c Pat Somaru          2024-09-20  6738  		/* SCX must consult the BPF scheduler to tell if rq is empty */
edf1c586e92675 kernel/sched/core.c Pat Somaru          2024-09-20  6739  		if (!rq->nr_running && !scx_enabled()) {
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6740  			next = prev;
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6741  			goto picked;
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6742  		}
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6743  	} else if (!preempt && prev_state) {
8feb053d531943 kernel/sched/core.c Peter Zijlstra      2025-03-19  6744  		try_to_block_task(rq, prev, &prev_state);
6631e635c65dc3 kernel/sched.c      Linus Torvalds      2011-04-13  6745  		switch_count = &prev->nvcsw;
6631e635c65dc3 kernel/sched.c      Linus Torvalds      2011-04-13  6746  	}
73c101011926c5 kernel/sched.c      Jens Axboe          2011-03-08  6747  
d8ac897137a230 kernel/sched/core.c Matt Fleming        2016-09-21 @6748  	next = pick_next_task(rq, prev, &rf);
af0c8b2bf67b25 kernel/sched/core.c Peter Zijlstra      2024-10-09  6749  	rq_set_donor(rq, next);
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6750  picked:
f26f9aff6aaf67 kernel/sched.c      Mike Galbraith      2010-12-08  6751  	clear_tsk_need_resched(prev);
f27dde8deef33c kernel/sched/core.c Peter Zijlstra      2013-08-14  6752  	clear_preempt_need_resched();
c006fac556e401 kernel/sched/core.c Paul Turner         2021-04-16  6753  	rq->last_seen_need_resched_ns = 0;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds      2005-04-16  6754  
26f80681a09b95 kernel/sched/core.c Gabriele Monaco     2025-03-05  6755  	is_switch = prev != next;
26f80681a09b95 kernel/sched/core.c Gabriele Monaco     2025-03-05  6756  	if (likely(is_switch)) {
^1da177e4c3f41 kernel/sched.c      Linus Torvalds      2005-04-16  6757  		rq->nr_switches++;
5311a98fef7d0d kernel/sched/core.c Eric W. Biederman   2019-09-14  6758  		/*
5311a98fef7d0d kernel/sched/core.c Eric W. Biederman   2019-09-14  6759  		 * RCU users of rcu_dereference(rq->curr) may not see
5311a98fef7d0d kernel/sched/core.c Eric W. Biederman   2019-09-14  6760  		 * changes to task_struct made by pick_next_task().
5311a98fef7d0d kernel/sched/core.c Eric W. Biederman   2019-09-14  6761  		 */
5311a98fef7d0d kernel/sched/core.c Eric W. Biederman   2019-09-14  6762  		RCU_INIT_POINTER(rq->curr, next);
22e4ebb9758228 kernel/sched/core.c Mathieu Desnoyers   2017-07-28  6763  		/*
22e4ebb9758228 kernel/sched/core.c Mathieu Desnoyers   2017-07-28  6764  		 * The membarrier system call requires each architecture
22e4ebb9758228 kernel/sched/core.c Mathieu Desnoyers   2017-07-28  6765  		 * to have a full memory barrier after updating
306e060435d7a3 kernel/sched/core.c Mathieu Desnoyers   2018-01-29  6766  		 * rq->curr, before returning to user-space.
306e060435d7a3 kernel/sched/core.c Mathieu Desnoyers   2018-01-29  6767  		 *
306e060435d7a3 kernel/sched/core.c Mathieu Desnoyers   2018-01-29  6768  		 * Here are the schemes providing that barrier on the
306e060435d7a3 kernel/sched/core.c Mathieu Desnoyers   2018-01-29  6769  		 * various architectures:
d6cfd1770f2039 kernel/sched/core.c Andrea Parri        2024-01-31  6770  		 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
d6cfd1770f2039 kernel/sched/core.c Andrea Parri        2024-01-31  6771  		 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
d6cfd1770f2039 kernel/sched/core.c Andrea Parri        2024-01-31  6772  		 *   on PowerPC and on RISC-V.
306e060435d7a3 kernel/sched/core.c Mathieu Desnoyers   2018-01-29  6773  		 * - finish_lock_switch() for weakly-ordered
306e060435d7a3 kernel/sched/core.c Mathieu Desnoyers   2018-01-29  6774  		 *   architectures where spin_unlock is a full barrier,
306e060435d7a3 kernel/sched/core.c Mathieu Desnoyers   2018-01-29  6775  		 * - switch_to() for arm64 (weakly-ordered, spin_unlock
306e060435d7a3 kernel/sched/core.c Mathieu Desnoyers   2018-01-29  6776  		 *   is a RELEASE barrier),
a14d11a0f5f410 kernel/sched/core.c Andrea Parri        2024-01-31  6777  		 *
a14d11a0f5f410 kernel/sched/core.c Andrea Parri        2024-01-31  6778  		 * The barrier matches a full barrier in the proximity of
a14d11a0f5f410 kernel/sched/core.c Andrea Parri        2024-01-31  6779  		 * the membarrier system call entry.
cd9b29014dc696 kernel/sched/core.c Andrea Parri        2024-01-31  6780  		 *
cd9b29014dc696 kernel/sched/core.c Andrea Parri        2024-01-31  6781  		 * On RISC-V, this barrier pairing is also needed for the
cd9b29014dc696 kernel/sched/core.c Andrea Parri        2024-01-31  6782  		 * SYNC_CORE command when switching between processes, cf.
cd9b29014dc696 kernel/sched/core.c Andrea Parri        2024-01-31  6783  		 * the inline comments in membarrier_arch_switch_mm().
22e4ebb9758228 kernel/sched/core.c Mathieu Desnoyers   2017-07-28  6784  		 */
^1da177e4c3f41 kernel/sched.c      Linus Torvalds      2005-04-16  6785  		++*switch_count;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds      2005-04-16  6786  
af449901b84c98 kernel/sched/core.c Peter Zijlstra      2020-09-17  6787  		migrate_disable_switch(rq, prev);
ddae0ca2a8fe12 kernel/sched/core.c John Stultz         2024-06-18  6788  		psi_account_irqtime(rq, prev, next);
7d9da040575b34 kernel/sched/core.c Chengming Zhou      2024-12-27  6789  		psi_sched_switch(prev, next, !task_on_rq_queued(prev) ||
7d9da040575b34 kernel/sched/core.c Chengming Zhou      2024-12-27  6790  					     prev->se.sched_delayed);
b05e75d6113808 kernel/sched/core.c Johannes Weiner     2020-03-16  6791  
3dcac251b066b6 kernel/sched/core.c Peter Zijlstra      2024-08-09  6792  		trace_sched_switch(preempt, prev, next, prev_state);
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar         2017-02-01  6793  
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar         2017-02-01  6794  		/* Also unlocks the rq: */
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar         2017-02-01  6795  		rq = context_switch(rq, prev, next, &rf);
cbce1a68670059 kernel/sched/core.c Peter Zijlstra      2015-06-11  6796  	} else {
565790d28b1e33 kernel/sched/core.c Peter Zijlstra      2020-05-11  6797  		rq_unpin_lock(rq, &rf);
565790d28b1e33 kernel/sched/core.c Peter Zijlstra      2020-05-11  6798  		__balance_callbacks(rq);
5cb9eaa3d274f7 kernel/sched/core.c Peter Zijlstra      2020-11-17  6799  		raw_spin_rq_unlock_irq(rq);
565790d28b1e33 kernel/sched/core.c Peter Zijlstra      2020-05-11  6800  	}
26f80681a09b95 kernel/sched/core.c Gabriele Monaco     2025-03-05  6801  	trace_sched_exit_tp(is_switch, CALLER_ADDR0);
^1da177e4c3f41 kernel/sched.c      Linus Torvalds      2005-04-16  6802  }
c259e01a1ec900 kernel/sched.c      Thomas Gleixner     2011-06-22  6803  

:::::: The code at line 6748 was first introduced by commit
:::::: d8ac897137a230ec351269f6378017f2decca512 sched/core: Add wrappers for lockdep_(un)pin_lock()

:::::: TO: Matt Fleming <matt@codeblueprint.co.uk>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
