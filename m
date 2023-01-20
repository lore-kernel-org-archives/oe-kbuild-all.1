Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F5217F7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674213972; x=1705749972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kNPNsRtn74sfWONmayvk22CLFaMLo6vcDBQOoj/e4FY=;
  b=P9dTkT5MA/YO7P8jeVEnXKjCzdcJ6dWo+Fhu5Stu0QxtfRhYDFsuTRh7
   AniYPcPudz4hf2FbYhwXsMq59ImMnjQy4+hAhjxJC9gnMF+m0EkDq+w9q
   p4kJp3jxbV+Rx3mqbLoF4vBNwRhXUJ4j8SJnzyQjAzKb/KeME8pCss8rx
   TI3ouxPVsR24XDrnPUsXZ/Rk/NcI+6wHRnHKFoum4OVe/2uYnTi35RckW
   Gd7o6bwwq6dygraAp6raH0KGqW+IrCTTl8TmHJpgUt/OEGXL2bIKeO/Gn
   kR6+Lvg/1BeR7k/2sYe9gdNCaQkuN63o3da508v93r/K0Ks+eNQcvwYP3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305924716"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="305924716"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 03:25:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="653758097"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="653758097"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Jan 2023 03:25:58 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIpWv-0002Ve-0I;
	Fri, 20 Jan 2023 11:25:57 +0000
Date: Fri, 20 Jan 2023 19:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] kernel/locking: introduce stack_handle for tracing
 the callstack
Message-ID: <202301201936.J8piT80Q-lkp@intel.com>
References: <1674204502-32123-1-git-send-email-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674204502-32123-1-git-send-email-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang",

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/locking/core]
[also build test ERROR on tip/master tip/auto-latest arm-perf/for-next/perf linus/master v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/kernel-locking-introduce-stack_handle-for-tracing-the-callstack/20230120-165013
patch link:    https://lore.kernel.org/r/1674204502-32123-1-git-send-email-zhaoyang.huang%40unisoc.com
patch subject: [RFC PATCH] kernel/locking: introduce stack_handle for tracing the callstack
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230120/202301201936.J8piT80Q-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/4c9baeb14c923660caa4fc53f7b0c97c2473880b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review zhaoyang-huang/kernel-locking-introduce-stack_handle-for-tracing-the-callstack/20230120-165013
        git checkout 4c9baeb14c923660caa4fc53f7b0c97c2473880b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/locking/rwsem.c: In function '__rwsem_set_reader_owned':
   kernel/locking/rwsem.c:180:37: error: implicit declaration of function 'set_track_prepare' [-Werror=implicit-function-declaration]
     180 |         sem->trace_handle = owner ? set_track_prepare() : NULL;
         |                                     ^~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:180:57: warning: pointer/integer type mismatch in conditional expression
     180 |         sem->trace_handle = owner ? set_track_prepare() : NULL;
         |                                                         ^
   kernel/locking/rwsem.c:180:27: warning: assignment to 'depot_stack_handle_t' {aka 'unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     180 |         sem->trace_handle = owner ? set_track_prepare() : NULL;
         |                           ^
   kernel/locking/rwsem.c: At top level:
   kernel/locking/rwsem.c:406:36: error: conflicting types for 'set_track_prepare'; have 'depot_stack_handle_t(void)' {aka 'unsigned int(void)'}
     406 | static inline depot_stack_handle_t set_track_prepare(void)
         |                                    ^~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:180:37: note: previous implicit declaration of 'set_track_prepare' with type 'int()'
     180 |         sem->trace_handle = owner ? set_track_prepare() : NULL;
         |                                     ^~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c: In function 'set_track_prepare':
>> kernel/locking/rwsem.c:409:31: error: 'MAX_TRACE' undeclared (first use in this function); did you mean 'ABI_TRACE'?
     409 |         unsigned long entries[MAX_TRACE];
         |                               ^~~~~~~~~
         |                               ABI_TRACE
   kernel/locking/rwsem.c:409:31: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from kernel/locking/rwsem.c:19:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:232:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     232 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:55:59: note: in expansion of macro '__must_be_array'
      55 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:412:48: note: in expansion of macro 'ARRAY_SIZE'
     412 |         nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 3);
         |                                                ^~~~~~~~~~
   kernel/locking/rwsem.c:413:24: error: implicit declaration of function 'stack_depot_save'; did you mean 'stack_trace_save'? [-Werror=implicit-function-declaration]
     413 |         trace_handle = stack_depot_save(entries, nr_entries, GFP_NOWAIT);
         |                        ^~~~~~~~~~~~~~~~
         |                        stack_trace_save
   kernel/locking/rwsem.c:409:23: warning: unused variable 'entries' [-Wunused-variable]
     409 |         unsigned long entries[MAX_TRACE];
         |                       ^~~~~~~
   cc1: some warnings being treated as errors


vim +409 kernel/locking/rwsem.c

   404	
   405	#ifdef CONFIG_TRACE_RWSEMS
   406	static inline depot_stack_handle_t set_track_prepare(void)
   407	{
   408		depot_stack_handle_t trace_handle;
 > 409		unsigned long entries[MAX_TRACE];
   410		unsigned int nr_entries;
   411	
   412		nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 3);
   413		trace_handle = stack_depot_save(entries, nr_entries, GFP_NOWAIT);
   414	
   415		return trace_handle;
   416	}
   417	#endif
   418	/*
   419	 * handle the lock release when processes blocked on it that can now run
   420	 * - if we come here from up_xxxx(), then the RWSEM_FLAG_WAITERS bit must
   421	 *   have been set.
   422	 * - there must be someone on the queue
   423	 * - the wait_lock must be held by the caller
   424	 * - tasks are marked for wakeup, the caller must later invoke wake_up_q()
   425	 *   to actually wakeup the blocked task(s) and drop the reference count,
   426	 *   preferably when the wait_lock is released
   427	 * - woken process blocks are discarded from the list after having task zeroed
   428	 * - writers are only marked woken if downgrading is false
   429	 *
   430	 * Implies rwsem_del_waiter() for all woken readers.
   431	 */
   432	static void rwsem_mark_wake(struct rw_semaphore *sem,
   433				    enum rwsem_wake_type wake_type,
   434				    struct wake_q_head *wake_q)
   435	{
   436		struct rwsem_waiter *waiter, *tmp;
   437		long oldcount, woken = 0, adjustment = 0;
   438		struct list_head wlist;
   439	
   440		lockdep_assert_held(&sem->wait_lock);
   441	
   442		/*
   443		 * Take a peek at the queue head waiter such that we can determine
   444		 * the wakeup(s) to perform.
   445		 */
   446		waiter = rwsem_first_waiter(sem);
   447	
   448		if (waiter->type == RWSEM_WAITING_FOR_WRITE) {
   449			if (wake_type == RWSEM_WAKE_ANY) {
   450				/*
   451				 * Mark writer at the front of the queue for wakeup.
   452				 * Until the task is actually later awoken later by
   453				 * the caller, other writers are able to steal it.
   454				 * Readers, on the other hand, will block as they
   455				 * will notice the queued writer.
   456				 */
   457				wake_q_add(wake_q, waiter->task);
   458				lockevent_inc(rwsem_wake_writer);
   459			}
   460	
   461			return;
   462		}
   463	
   464		/*
   465		 * No reader wakeup if there are too many of them already.
   466		 */
   467		if (unlikely(atomic_long_read(&sem->count) < 0))
   468			return;
   469	
   470		/*
   471		 * Writers might steal the lock before we grant it to the next reader.
   472		 * We prefer to do the first reader grant before counting readers
   473		 * so we can bail out early if a writer stole the lock.
   474		 */
   475		if (wake_type != RWSEM_WAKE_READ_OWNED) {
   476			struct task_struct *owner;
   477	
   478			adjustment = RWSEM_READER_BIAS;
   479			oldcount = atomic_long_fetch_add(adjustment, &sem->count);
   480			if (unlikely(oldcount & RWSEM_WRITER_MASK)) {
   481				/*
   482				 * When we've been waiting "too" long (for writers
   483				 * to give up the lock), request a HANDOFF to
   484				 * force the issue.
   485				 */
   486				if (time_after(jiffies, waiter->timeout)) {
   487					if (!(oldcount & RWSEM_FLAG_HANDOFF)) {
   488						adjustment -= RWSEM_FLAG_HANDOFF;
   489						lockevent_inc(rwsem_rlock_handoff);
   490					}
   491					waiter->handoff_set = true;
   492				}
   493	
   494				atomic_long_add(-adjustment, &sem->count);
   495				return;
   496			}
   497			/*
   498			 * Set it to reader-owned to give spinners an early
   499			 * indication that readers now have the lock.
   500			 * The reader nonspinnable bit seen at slowpath entry of
   501			 * the reader is copied over.
   502			 */
   503			owner = waiter->task;
   504			__rwsem_set_reader_owned(sem, owner);
   505		}
   506	
   507		/*
   508		 * Grant up to MAX_READERS_WAKEUP read locks to all the readers in the
   509		 * queue. We know that the woken will be at least 1 as we accounted
   510		 * for above. Note we increment the 'active part' of the count by the
   511		 * number of readers before waking any processes up.
   512		 *
   513		 * This is an adaptation of the phase-fair R/W locks where at the
   514		 * reader phase (first waiter is a reader), all readers are eligible
   515		 * to acquire the lock at the same time irrespective of their order
   516		 * in the queue. The writers acquire the lock according to their
   517		 * order in the queue.
   518		 *
   519		 * We have to do wakeup in 2 passes to prevent the possibility that
   520		 * the reader count may be decremented before it is incremented. It
   521		 * is because the to-be-woken waiter may not have slept yet. So it
   522		 * may see waiter->task got cleared, finish its critical section and
   523		 * do an unlock before the reader count increment.
   524		 *
   525		 * 1) Collect the read-waiters in a separate list, count them and
   526		 *    fully increment the reader count in rwsem.
   527		 * 2) For each waiters in the new list, clear waiter->task and
   528		 *    put them into wake_q to be woken up later.
   529		 */
   530		INIT_LIST_HEAD(&wlist);
   531		list_for_each_entry_safe(waiter, tmp, &sem->wait_list, list) {
   532			if (waiter->type == RWSEM_WAITING_FOR_WRITE)
   533				continue;
   534	
   535			woken++;
   536			list_move_tail(&waiter->list, &wlist);
   537	
   538			/*
   539			 * Limit # of readers that can be woken up per wakeup call.
   540			 */
   541			if (unlikely(woken >= MAX_READERS_WAKEUP))
   542				break;
   543		}
   544	
   545		adjustment = woken * RWSEM_READER_BIAS - adjustment;
   546		lockevent_cond_inc(rwsem_wake_reader, woken);
   547	
   548		oldcount = atomic_long_read(&sem->count);
   549		if (list_empty(&sem->wait_list)) {
   550			/*
   551			 * Combined with list_move_tail() above, this implies
   552			 * rwsem_del_waiter().
   553			 */
   554			adjustment -= RWSEM_FLAG_WAITERS;
   555			if (oldcount & RWSEM_FLAG_HANDOFF)
   556				adjustment -= RWSEM_FLAG_HANDOFF;
   557		} else if (woken) {
   558			/*
   559			 * When we've woken a reader, we no longer need to force
   560			 * writers to give up the lock and we can clear HANDOFF.
   561			 */
   562			if (oldcount & RWSEM_FLAG_HANDOFF)
   563				adjustment -= RWSEM_FLAG_HANDOFF;
   564		}
   565	
   566		if (adjustment)
   567			atomic_long_add(adjustment, &sem->count);
   568	
   569		/* 2nd pass */
   570		list_for_each_entry_safe(waiter, tmp, &wlist, list) {
   571			struct task_struct *tsk;
   572	
   573			tsk = waiter->task;
   574			get_task_struct(tsk);
   575	
   576			/*
   577			 * Ensure calling get_task_struct() before setting the reader
   578			 * waiter to nil such that rwsem_down_read_slowpath() cannot
   579			 * race with do_exit() by always holding a reference count
   580			 * to the task to wakeup.
   581			 */
   582			smp_store_release(&waiter->task, NULL);
   583			/*
   584			 * Ensure issuing the wakeup (either by us or someone else)
   585			 * after setting the reader waiter to nil.
   586			 */
   587			wake_q_add_safe(wake_q, tsk);
   588		}
   589	}
   590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
