Content-Type: multipart/mixed; boundary="===============3111692511174644597=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC][PATCH 4/7] smp: Optimize send_call_function_single_ipi()
Date: Wed, 27 May 2020 15:01:05 +0800
Message-ID: <202005271422.6VSuU83P%lkp@intel.com>
In-Reply-To: <20200526161907.953304789@infradead.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3111692511174644597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/auto-latest next-20200526]
[cannot apply to linus/master linux/master v5.7-rc7]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Peter-Zijlstra/Fix-the-sch=
eduler-IPI-mess/20200527-010828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 2ebb177=
17550607bcd85fb8cf7d24ac870e9d762
config: i386-tinyconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce (this is a W=3D1 build):
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

kernel/sched/idle.c: In function 'do_idle':
>> kernel/sched/idle.c:292:2: error: implicit declaration of function 'flus=
h_smp_call_function_from_idle' [-Werror=3Dimplicit-function-declaration]
292 |  flush_smp_call_function_from_idle();
|  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

vim +/flush_smp_call_function_from_idle +292 kernel/sched/idle.c

   225	=

   226	/*
   227	 * Generic idle loop implementation
   228	 *
   229	 * Called with polling cleared.
   230	 */
   231	static void do_idle(void)
   232	{
   233		int cpu =3D smp_processor_id();
   234		/*
   235		 * If the arch has a polling bit, we maintain an invariant:
   236		 *
   237		 * Our polling bit is clear if we're not scheduled (i.e. if rq->cur=
r !=3D
   238		 * rq->idle). This means that, if rq->idle has the polling bit set,
   239		 * then setting need_resched is guaranteed to cause the CPU to
   240		 * reschedule.
   241		 */
   242	=

   243		__current_set_polling();
   244		tick_nohz_idle_enter();
   245	=

   246		while (!need_resched()) {
   247			rmb();
   248	=

   249			local_irq_disable();
   250	=

   251			if (cpu_is_offline(cpu)) {
   252				tick_nohz_idle_stop_tick();
   253				cpuhp_report_idle_dead();
   254				arch_cpu_idle_dead();
   255			}
   256	=

   257			arch_cpu_idle_enter();
   258	=

   259			/*
   260			 * In poll mode we reenable interrupts and spin. Also if we
   261			 * detected in the wakeup from idle path that the tick
   262			 * broadcast device expired for us, we don't want to go deep
   263			 * idle as we know that the IPI is going to arrive right away.
   264			 */
   265			if (cpu_idle_force_poll || tick_check_broadcast_expired()) {
   266				tick_nohz_idle_restart_tick();
   267				cpu_idle_poll();
   268			} else {
   269				cpuidle_idle_call();
   270			}
   271			arch_cpu_idle_exit();
   272		}
   273	=

   274		/*
   275		 * Since we fell out of the loop above, we know TIF_NEED_RESCHED mu=
st
   276		 * be set, propagate it into PREEMPT_NEED_RESCHED.
   277		 *
   278		 * This is required because for polling idle loops we will not have=
 had
   279		 * an IPI to fold the state for us.
   280		 */
   281		preempt_set_need_resched();
   282		tick_nohz_idle_exit();
   283		__current_clr_polling();
   284	=

   285		/*
   286		 * We promise to call sched_ttwu_pending() and reschedule if
   287		 * need_resched() is set while polling is set. That means that clea=
ring
   288		 * polling needs to be visible before doing these things.
   289		 */
   290		smp_mb__after_atomic();
   291	=

 > 292		flush_smp_call_function_from_idle();
   293		sched_ttwu_pending();
   294		schedule_idle();
   295	=

   296		if (unlikely(klp_patch_pending(current)))
   297			klp_update_patch_state(current);
   298	}
   299	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3111692511174644597==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
CDBoAAA=
--===============3111692511174644597==--

