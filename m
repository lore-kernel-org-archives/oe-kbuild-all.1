Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC614805
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 19:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685561931; x=1717097931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C0aST/MEYl6apUpMmoc0vvSIAhVXXHlaIQfqmBsXb2c=;
  b=hfXx4SdAav6fmAy7x/2WptwC2jFNuINBgYexq9YF0yxBsR0PK+q8Q8Ui
   G6FsRDnfILHI2M9jEvac0+Vry1+RfSG8YcS0NJ6NdbthU8LW3npqwqkiS
   K0Y1yVYJV1uUZBq3uETOyHSrEAhrhERhAdRA0VzWxYovb+J0AJfUpcCPO
   lHud6axYkzCWpjGDWQsdHN+gngAHaGbeKOLR6sMW8cBOCjaxMcL4cEpQU
   WSMZj6lmKdPFCwey5FSBrn2y9937aCnpRVPCcvbReBcVtE5wqa/DHOQFJ
   utPLCQmxaf9OgDK9lzp3JWCwSpROSVKXcr882tx4Nxjkxb+PumJ3VaJ48
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="352845452"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="352845452"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 12:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="1037177713"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="1037177713"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 May 2023 12:34:37 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Rae-0001Yp-1q;
	Wed, 31 May 2023 19:34:36 +0000
Date: Thu, 1 Jun 2023 03:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 19/30]
 kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member
 named 'avg'
Message-ID: <202306010320.bFBVc6Fl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   2d9bf29161d378d58600e7897007478e0b156a63
commit: e0515f89730a8597730e11f244a80d37c7970d4a [19/30] CHROMIUM: FROMLIST: sched/fair: Add util_guest for tasks
config: i386-randconfig-i094-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010320.bFBVc6Fl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common mirror-chromeos-5.10-arcvm
        git checkout e0515f89730a8597730e11f244a80d37c7970d4a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010320.bFBVc6Fl-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:4594:6: warning: no previous prototype for 'set_next_entity' [-Wmissing-prototypes]
    4594 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~
   In file included from <command-line>:
   kernel/sched/fair.c: In function 'enqueue_task_fair':
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:297:23: note: in definition of macro '__compiletime_assert'
     297 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:317:9: note: in expansion of macro '_compiletime_assert'
     317 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:274:27: note: in definition of macro '__unqual_scalar_typeof'
     274 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/fair.c:23:
>> kernel/sched/fair.c:5712:28: error: 'struct sched_entity' has no member named 'avg'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   kernel/sched/fair.c:5712:13: note: in expansion of macro 'READ_ONCE'
    5712 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
--
   kernel/sched/core.c: In function '__setscheduler_task_util':
>> kernel/sched/core.c:1660:14: error: 'struct sched_entity' has no member named 'avg'
    1660 |         p->se.avg.util_guest = attr->sched_util_min;
         |              ^


vim +5712 kernel/sched/fair.c

  5683	
  5684	/*
  5685	 * The enqueue_task method is called before nr_running is
  5686	 * increased. Here we update the fair scheduling stats and
  5687	 * then put the task into the rbtree:
  5688	 */
  5689	static void
  5690	enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
  5691	{
  5692		struct cfs_rq *cfs_rq;
  5693		struct sched_entity *se = &p->se;
  5694		int idle_h_nr_running = task_has_idle_policy(p);
  5695		int task_new = !(flags & ENQUEUE_WAKEUP);
  5696		int should_iowait_boost;
  5697	
  5698		/*
  5699		 * The code below (indirectly) updates schedutil which looks at
  5700		 * the cfs_rq utilization to select a frequency.
  5701		 * Let's add the task's estimated utilization to the cfs_rq's
  5702		 * estimated utilization, before we update schedutil.
  5703		 */
  5704		util_est_enqueue(&rq->cfs, p);
  5705	
  5706		/*
  5707		 * The normal code path for host thread enqueue doesn't take into
  5708		 * account guest task migrations when updating cpufreq util.
  5709		 * So, always update the cpufreq when a vCPU thread has a
  5710		 * non-zero util_guest value.
  5711		 */
> 5712		if (READ_ONCE(p->se.avg.util_guest))
  5713			cpufreq_update_util(rq, 0);
  5714	
  5715		/*
  5716		 * If in_iowait is set, the code below may not trigger any cpufreq
  5717		 * utilization updates, so do it here explicitly with the IOWAIT flag
  5718		 * passed.
  5719		 */
  5720		should_iowait_boost = p->in_iowait;
  5721		trace_android_rvh_set_iowait(p, &should_iowait_boost);
  5722		if (should_iowait_boost)
  5723			cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
  5724	
  5725		for_each_sched_entity(se) {
  5726			if (se->on_rq)
  5727				break;
  5728			cfs_rq = cfs_rq_of(se);
  5729			enqueue_entity(cfs_rq, se, flags);
  5730	
  5731			cfs_rq->h_nr_running++;
  5732			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  5733	
  5734			/* end evaluation on encountering a throttled cfs_rq */
  5735			if (cfs_rq_throttled(cfs_rq))
  5736				goto enqueue_throttle;
  5737	
  5738			flags = ENQUEUE_WAKEUP;
  5739		}
  5740	
  5741		trace_android_rvh_enqueue_task_fair(rq, p, flags);
  5742		for_each_sched_entity(se) {
  5743			cfs_rq = cfs_rq_of(se);
  5744	
  5745			update_load_avg(cfs_rq, se, UPDATE_TG);
  5746			se_update_runnable(se);
  5747			update_cfs_group(se);
  5748	
  5749			cfs_rq->h_nr_running++;
  5750			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  5751	
  5752			/* end evaluation on encountering a throttled cfs_rq */
  5753			if (cfs_rq_throttled(cfs_rq))
  5754				goto enqueue_throttle;
  5755	
  5756	               /*
  5757	                * One parent has been throttled and cfs_rq removed from the
  5758	                * list. Add it back to not break the leaf list.
  5759	                */
  5760	               if (throttled_hierarchy(cfs_rq))
  5761	                       list_add_leaf_cfs_rq(cfs_rq);
  5762		}
  5763	
  5764		/* At this point se is NULL and we are at root level*/
  5765		add_nr_running(rq, 1);
  5766	
  5767		/*
  5768		 * Since new tasks are assigned an initial util_avg equal to
  5769		 * half of the spare capacity of their CPU, tiny tasks have the
  5770		 * ability to cross the overutilized threshold, which will
  5771		 * result in the load balancer ruining all the task placement
  5772		 * done by EAS. As a way to mitigate that effect, do not account
  5773		 * for the first enqueue operation of new tasks during the
  5774		 * overutilized flag detection.
  5775		 *
  5776		 * A better way of solving this problem would be to wait for
  5777		 * the PELT signals of tasks to converge before taking them
  5778		 * into account, but that is not straightforward to implement,
  5779		 * and the following generally works well enough in practice.
  5780		 */
  5781		if (!task_new)
  5782			update_overutilized_status(rq);
  5783	
  5784	enqueue_throttle:
  5785		if (cfs_bandwidth_used()) {
  5786			/*
  5787			 * When bandwidth control is enabled; the cfs_rq_throttled()
  5788			 * breaks in the above iteration can result in incomplete
  5789			 * leaf list maintenance, resulting in triggering the assertion
  5790			 * below.
  5791			 */
  5792			for_each_sched_entity(se) {
  5793				cfs_rq = cfs_rq_of(se);
  5794	
  5795				if (list_add_leaf_cfs_rq(cfs_rq))
  5796					break;
  5797			}
  5798		}
  5799	
  5800		assert_list_leaf_cfs_rq(rq);
  5801	
  5802		hrtick_update(rq);
  5803	}
  5804	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
