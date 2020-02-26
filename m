Content-Type: multipart/mixed; boundary="===============2790026182724919347=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v3 5/7] mm/asi: Switch ASI on task switch
Date: Thu, 27 Feb 2020 04:50:35 +0800
Message-ID: <202002270447.KVX08H5h%lkp@intel.com>
In-Reply-To: <1582734120-26757-6-git-send-email-alexandre.chartre@oracle.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2790026182724919347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/x86/asm tip/x86/mm v5.6-rc3]
[cannot apply to next-20200226]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Alexandre-Chartre/Kernel-A=
ddress-Space-Isolation/20200227-034033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 248ed51=
048c40d36728e70914e38bffd7821da57
config: um-x86_64_defconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Dum SUBARCH=3Dx86_64

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'prepare_task_switch':
>> kernel/sched/core.c:3158:3: error: implicit declaration of function 'asi=
_schedule_out'; did you mean 'io_schedule'? [-Werror=3Dimplicit-function-de=
claration]
      asi_schedule_out(prev);
      ^~~~~~~~~~~~~~~~
      io_schedule
   kernel/sched/core.c: In function 'finish_task_switch':
>> kernel/sched/core.c:3268:3: error: implicit declaration of function 'asi=
_schedule_in'; did you mean 'io_schedule'? [-Werror=3Dimplicit-function-dec=
laration]
      asi_schedule_in(current);
      ^~~~~~~~~~~~~~~
      io_schedule
   cc1: some warnings being treated as errors

vim +3158 kernel/sched/core.c

  3139	=

  3140	/**
  3141	 * prepare_task_switch - prepare to switch tasks
  3142	 * @rq: the runqueue preparing to switch
  3143	 * @prev: the current task that is being switched out
  3144	 * @next: the task we are going to switch to.
  3145	 *
  3146	 * This is called with the rq lock held and interrupts off. It must
  3147	 * be paired with a subsequent finish_task_switch after the context
  3148	 * switch.
  3149	 *
  3150	 * prepare_task_switch sets up locking and calls architecture specif=
ic
  3151	 * hooks.
  3152	 */
  3153	static inline void
  3154	prepare_task_switch(struct rq *rq, struct task_struct *prev,
  3155			    struct task_struct *next)
  3156	{
  3157		if (IS_ENABLED(CONFIG_ADDRESS_SPACE_ISOLATION))
> 3158			asi_schedule_out(prev);
  3159	=

  3160		kcov_prepare_switch(prev);
  3161		sched_info_switch(rq, prev, next);
  3162		perf_event_task_sched_out(prev, next);
  3163		rseq_preempt(prev);
  3164		fire_sched_out_preempt_notifiers(prev, next);
  3165		prepare_task(next);
  3166		prepare_arch_switch(next);
  3167	}
  3168	=

  3169	/**
  3170	 * finish_task_switch - clean up after a task-switch
  3171	 * @prev: the thread we just switched away from.
  3172	 *
  3173	 * finish_task_switch must be called after the context switch, paired
  3174	 * with a prepare_task_switch call before the context switch.
  3175	 * finish_task_switch will reconcile locking set up by prepare_task_=
switch,
  3176	 * and do any other architecture-specific cleanup actions.
  3177	 *
  3178	 * Note that we may have delayed dropping an mm in context_switch().=
 If
  3179	 * so, we finish that here outside of the runqueue lock. (Doing it
  3180	 * with the lock held can cause deadlocks; see schedule() for
  3181	 * details.)
  3182	 *
  3183	 * The context switch have flipped the stack from under us and resto=
red the
  3184	 * local variables which were saved when this task called schedule()=
 in the
  3185	 * past. prev =3D=3D current is still correct but we need to recalcu=
late this_rq
  3186	 * because prev may have moved to another CPU.
  3187	 */
  3188	static struct rq *finish_task_switch(struct task_struct *prev)
  3189		__releases(rq->lock)
  3190	{
  3191		struct rq *rq =3D this_rq();
  3192		struct mm_struct *mm =3D rq->prev_mm;
  3193		long prev_state;
  3194	=

  3195		/*
  3196		 * The previous task will have left us with a preempt_count of 2
  3197		 * because it left us after:
  3198		 *
  3199		 *	schedule()
  3200		 *	  preempt_disable();			// 1
  3201		 *	  __schedule()
  3202		 *	    raw_spin_lock_irq(&rq->lock)	// 2
  3203		 *
  3204		 * Also, see FORK_PREEMPT_COUNT.
  3205		 */
  3206		if (WARN_ONCE(preempt_count() !=3D 2*PREEMPT_DISABLE_OFFSET,
  3207			      "corrupted preempt_count: %s/%d/0x%x\n",
  3208			      current->comm, current->pid, preempt_count()))
  3209			preempt_count_set(FORK_PREEMPT_COUNT);
  3210	=

  3211		rq->prev_mm =3D NULL;
  3212	=

  3213		/*
  3214		 * A task struct has one reference for the use as "current".
  3215		 * If a task dies, then it sets TASK_DEAD in tsk->state and calls
  3216		 * schedule one last time. The schedule call will never return, and
  3217		 * the scheduled task must drop that reference.
  3218		 *
  3219		 * We must observe prev->state before clearing prev->on_cpu (in
  3220		 * finish_task), otherwise a concurrent wakeup can get prev
  3221		 * running on another CPU and we could rave with its RUNNING -> DEAD
  3222		 * transition, resulting in a double drop.
  3223		 */
  3224		prev_state =3D prev->state;
  3225		vtime_task_switch(prev);
  3226		perf_event_task_sched_in(prev, current);
  3227		finish_task(prev);
  3228		finish_lock_switch(rq);
  3229		finish_arch_post_lock_switch();
  3230		kcov_finish_switch(current);
  3231	=

  3232		fire_sched_in_preempt_notifiers(current);
  3233		/*
  3234		 * When switching through a kernel thread, the loop in
  3235		 * membarrier_{private,global}_expedited() may have observed that
  3236		 * kernel thread and not issued an IPI. It is therefore possible to
  3237		 * schedule between user->kernel->user threads without passing thou=
gh
  3238		 * switch_mm(). Membarrier requires a barrier after storing to
  3239		 * rq->curr, before returning to userspace, so provide them here:
  3240		 *
  3241		 * - a full memory barrier for {PRIVATE,GLOBAL}_EXPEDITED, implicit=
ly
  3242		 *   provided by mmdrop(),
  3243		 * - a sync_core for SYNC_CORE.
  3244		 */
  3245		if (mm) {
  3246			membarrier_mm_sync_core_before_usermode(mm);
  3247			mmdrop(mm);
  3248		}
  3249		if (unlikely(prev_state =3D=3D TASK_DEAD)) {
  3250			if (prev->sched_class->task_dead)
  3251				prev->sched_class->task_dead(prev);
  3252	=

  3253			/*
  3254			 * Remove function-return probe instances associated with this
  3255			 * task and put them back on the free list.
  3256			 */
  3257			kprobe_flush_task(prev);
  3258	=

  3259			/* Task is done with its stack. */
  3260			put_task_stack(prev);
  3261	=

  3262			put_task_struct_rcu_user(prev);
  3263		}
  3264	=

  3265		tick_nohz_task_switch();
  3266	=

  3267		if (IS_ENABLED(CONFIG_ADDRESS_SPACE_ISOLATION))
> 3268			asi_schedule_in(current);
  3269	=

  3270		return rq;
  3271	}
  3272	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2790026182724919347==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
QIIAAA==
--===============2790026182724919347==--

