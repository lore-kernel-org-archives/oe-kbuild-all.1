Content-Type: multipart/mixed; boundary="===============3983113131745425795=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC v4][PATCH part-1 5/7] mm/asi: Exit/enter ASI when task enters/exits scheduler
Date: Tue, 05 May 2020 09:26:37 +0800
Message-ID: <202005050913.0AxDrwa9%lkp@intel.com>
In-Reply-To: <20200504144939.11318-6-alexandre.chartre@oracle.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3983113131745425795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/x86/asm]
[also build test ERROR on tip/x86/core v5.7-rc4]
[cannot apply to tip/x86/mm next-20200504]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Alexandre-Chartre/ASI-Part=
-I-ASI-Infrastructure-and-PTI/20200505-074555
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 2ce0d7f=
9766f0e49bb54f149c77bae89464932fb
config: um-x86_64_defconfig (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Dum SUBARCH=3Dx86_64

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel//sched/core.c: In function '__schedule':
>> kernel//sched/core.c:4022:3: error: implicit declaration of function 'as=
i_schedule_out'; did you mean '__schedule_bug'? [-Werror=3Dimplicit-functio=
n-declaration]
      asi_schedule_out(current);
      ^~~~~~~~~~~~~~~~
      __schedule_bug
>> kernel//sched/core.c:4111:3: error: implicit declaration of function 'as=
i_schedule_in'; did you mean '__schedule'? [-Werror=3Dimplicit-function-dec=
laration]
      asi_schedule_in(current);
      ^~~~~~~~~~~~~~~
      __schedule
   cc1: some warnings being treated as errors

vim +4022 kernel//sched/core.c

  3968	=

  3969	/*
  3970	 * __schedule() is the main scheduler function.
  3971	 *
  3972	 * The main means of driving the scheduler and thus entering this fu=
nction are:
  3973	 *
  3974	 *   1. Explicit blocking: mutex, semaphore, waitqueue, etc.
  3975	 *
  3976	 *   2. TIF_NEED_RESCHED flag is checked on interrupt and userspace =
return
  3977	 *      paths. For example, see arch/x86/entry_64.S.
  3978	 *
  3979	 *      To drive preemption between tasks, the scheduler sets the fl=
ag in timer
  3980	 *      interrupt handler scheduler_tick().
  3981	 *
  3982	 *   3. Wakeups don't really cause entry into schedule(). They add a
  3983	 *      task to the run-queue and that's it.
  3984	 *
  3985	 *      Now, if the new task added to the run-queue preempts the cur=
rent
  3986	 *      task, then the wakeup sets TIF_NEED_RESCHED and schedule() g=
ets
  3987	 *      called on the nearest possible occasion:
  3988	 *
  3989	 *       - If the kernel is preemptible (CONFIG_PREEMPTION=3Dy):
  3990	 *
  3991	 *         - in syscall or exception context, at the next outmost
  3992	 *           preempt_enable(). (this might be as soon as the wake_up=
()'s
  3993	 *           spin_unlock()!)
  3994	 *
  3995	 *         - in IRQ context, return from interrupt-handler to
  3996	 *           preemptible context
  3997	 *
  3998	 *       - If the kernel is not preemptible (CONFIG_PREEMPTION is no=
t set)
  3999	 *         then at the next:
  4000	 *
  4001	 *          - cond_resched() call
  4002	 *          - explicit schedule() call
  4003	 *          - return from syscall or exception to user-space
  4004	 *          - return from interrupt-handler to user-space
  4005	 *
  4006	 * WARNING: must be called with preemption disabled!
  4007	 */
  4008	static void __sched notrace __schedule(bool preempt)
  4009	{
  4010		struct task_struct *prev, *next;
  4011		unsigned long *switch_count;
  4012		struct rq_flags rf;
  4013		struct rq *rq;
  4014		int cpu;
  4015	=

  4016		/*
  4017		 * If the task is using ASI then exit it right away otherwise the
  4018		 * ASI will likely quickly fault, for example when accessing run
  4019		 * queues.
  4020		 */
  4021		if (IS_ENABLED(CONFIG_ADDRESS_SPACE_ISOLATION))
> 4022			asi_schedule_out(current);
  4023	=

  4024		cpu =3D smp_processor_id();
  4025		rq =3D cpu_rq(cpu);
  4026		prev =3D rq->curr;
  4027	=

  4028		schedule_debug(prev, preempt);
  4029	=

  4030		if (sched_feat(HRTICK))
  4031			hrtick_clear(rq);
  4032	=

  4033		local_irq_disable();
  4034		rcu_note_context_switch(preempt);
  4035	=

  4036		/*
  4037		 * Make sure that signal_pending_state()->signal_pending() below
  4038		 * can't be reordered with __set_current_state(TASK_INTERRUPTIBLE)
  4039		 * done by the caller to avoid the race with signal_wake_up().
  4040		 *
  4041		 * The membarrier system call requires a full memory barrier
  4042		 * after coming from user-space, before storing to rq->curr.
  4043		 */
  4044		rq_lock(rq, &rf);
  4045		smp_mb__after_spinlock();
  4046	=

  4047		/* Promote REQ to ACT */
  4048		rq->clock_update_flags <<=3D 1;
  4049		update_rq_clock(rq);
  4050	=

  4051		switch_count =3D &prev->nivcsw;
  4052		if (!preempt && prev->state) {
  4053			if (signal_pending_state(prev->state, prev)) {
  4054				prev->state =3D TASK_RUNNING;
  4055			} else {
  4056				deactivate_task(rq, prev, DEQUEUE_SLEEP | DEQUEUE_NOCLOCK);
  4057	=

  4058				if (prev->in_iowait) {
  4059					atomic_inc(&rq->nr_iowait);
  4060					delayacct_blkio_start();
  4061				}
  4062			}
  4063			switch_count =3D &prev->nvcsw;
  4064		}
  4065	=

  4066		next =3D pick_next_task(rq, prev, &rf);
  4067		clear_tsk_need_resched(prev);
  4068		clear_preempt_need_resched();
  4069	=

  4070		if (likely(prev !=3D next)) {
  4071			rq->nr_switches++;
  4072			/*
  4073			 * RCU users of rcu_dereference(rq->curr) may not see
  4074			 * changes to task_struct made by pick_next_task().
  4075			 */
  4076			RCU_INIT_POINTER(rq->curr, next);
  4077			/*
  4078			 * The membarrier system call requires each architecture
  4079			 * to have a full memory barrier after updating
  4080			 * rq->curr, before returning to user-space.
  4081			 *
  4082			 * Here are the schemes providing that barrier on the
  4083			 * various architectures:
  4084			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC.
  4085			 *   switch_mm() rely on membarrier_arch_switch_mm() on PowerPC.
  4086			 * - finish_lock_switch() for weakly-ordered
  4087			 *   architectures where spin_unlock is a full barrier,
  4088			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  4089			 *   is a RELEASE barrier),
  4090			 */
  4091			++*switch_count;
  4092	=

  4093			psi_sched_switch(prev, next, !task_on_rq_queued(prev));
  4094	=

  4095			trace_sched_switch(preempt, prev, next);
  4096	=

  4097			/* Also unlocks the rq: */
  4098			rq =3D context_switch(rq, prev, next, &rf);
  4099		} else {
  4100			rq->clock_update_flags &=3D ~(RQCF_ACT_SKIP|RQCF_REQ_SKIP);
  4101			rq_unlock_irq(rq, &rf);
  4102		}
  4103	=

  4104		balance_callback(rq);
  4105	=

  4106		/*
  4107		 * Now the task will resume execution, we can safely return to
  4108		 * its ASI if one was in used.
  4109		 */
  4110		if (IS_ENABLED(CONFIG_ADDRESS_SPACE_ISOLATION))
> 4111			asi_schedule_in(current);
  4112	}
  4113	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3983113131745425795==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
47FzcW940Smj6f8AJQkTk+aDAAA=
--===============3983113131745425795==--

