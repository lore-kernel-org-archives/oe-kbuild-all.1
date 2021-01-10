Content-Type: multipart/mixed; boundary="===============0614303400260655457=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [luto:x86/fixes 14/21] arch/x86/mm/tlb.c:537:34: error: 'struct mm_struct' has no member named 'membarrier_state'
Date: Mon, 11 Jan 2021 06:38:19 +0800
Message-ID: <202101110613.AGgOTRGz-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0614303400260655457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andy,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/=
fixes
head:   f3086de0babcab36f69949b5780bde851f719bc8
commit: ff7d4d734d212919749ff79b8c08e1615f7de83b [14/21] x86/mm: Handle unl=
azying membarrier core sync in the arch code
config: i386-tinyconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git/co=
mmit/?id=3Dff7d4d734d212919749ff79b8c08e1615f7de83b
        git remote add luto https://git.kernel.org/pub/scm/linux/kernel/git=
/luto/linux.git
        git fetch --no-tags luto x86/fixes
        git checkout ff7d4d734d212919749ff79b8c08e1615f7de83b
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from arch/x86/mm/tlb.c:2:
   arch/x86/mm/tlb.c: In function 'switch_mm_irqs_off':
>> arch/x86/mm/tlb.c:537:34: error: 'struct mm_struct' has no member named =
'membarrier_state'
     537 |    if (unlikely(atomic_read(&next->membarrier_state) &
         |                                  ^~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
>> arch/x86/mm/tlb.c:538:10: error: 'MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYN=
C_CORE' undeclared (first use in this function)
     538 |          MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE))
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   arch/x86/mm/tlb.c:538:10: note: each undeclared identifier is reported o=
nly once for each function it appears in
     538 |          MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE))
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^


vim +537 arch/x86/mm/tlb.c

   422	=

   423	void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *ne=
xt,
   424				struct task_struct *tsk)
   425	{
   426		struct mm_struct *real_prev =3D this_cpu_read(cpu_tlbstate.loaded_m=
m);
   427		u16 prev_asid =3D this_cpu_read(cpu_tlbstate.loaded_mm_asid);
   428		bool was_lazy =3D this_cpu_read(cpu_tlbstate.is_lazy);
   429		unsigned cpu =3D smp_processor_id();
   430		u64 next_tlb_gen;
   431		bool need_flush;
   432		u16 new_asid;
   433	=

   434		/*
   435		 * NB: The scheduler will call us with prev =3D=3D next when switch=
ing
   436		 * from lazy TLB mode to normal mode if active_mm isn't changing.
   437		 * When this happens, we don't assume that CR3 (and hence
   438		 * cpu_tlbstate.loaded_mm) matches next.
   439		 *
   440		 * NB: leave_mm() calls us with prev =3D=3D NULL and tsk =3D=3D NUL=
L.
   441		 */
   442	=

   443		/* We don't want flush_tlb_func_* to run concurrently with us. */
   444		if (IS_ENABLED(CONFIG_PROVE_LOCKING))
   445			WARN_ON_ONCE(!irqs_disabled());
   446	=

   447		/*
   448		 * Verify that CR3 is what we think it is.  This will catch
   449		 * hypothetical buggy code that directly switches to swapper_pg_dir
   450		 * without going through leave_mm() / switch_mm_irqs_off() or that
   451		 * does something like write_cr3(read_cr3_pa()).
   452		 *
   453		 * Only do this check if CONFIG_DEBUG_VM=3Dy because __read_cr3()
   454		 * isn't free.
   455		 */
   456	#ifdef CONFIG_DEBUG_VM
   457		if (WARN_ON_ONCE(__read_cr3() !=3D build_cr3(real_prev->pgd, prev_a=
sid))) {
   458			/*
   459			 * If we were to BUG here, we'd be very likely to kill
   460			 * the system so hard that we don't see the call trace.
   461			 * Try to recover instead by ignoring the error and doing
   462			 * a global flush to minimize the chance of corruption.
   463			 *
   464			 * (This is far from being a fully correct recovery.
   465			 *  Architecturally, the CPU could prefetch something
   466			 *  back into an incorrect ASID slot and leave it there
   467			 *  to cause trouble down the road.  It's better than
   468			 *  nothing, though.)
   469			 */
   470			__flush_tlb_all();
   471		}
   472	#endif
   473		this_cpu_write(cpu_tlbstate.is_lazy, false);
   474	=

   475		/*
   476		 * membarrier() support requires that, when we change rq->curr->mm:
   477		 *
   478		 *  - If next->mm has membarrier registered, a full memory barrier
   479		 *    after writing rq->curr (or rq->curr->mm if we switched the mm
   480		 *    without switching tasks) and before returning to user mode.
   481		 *
   482		 *  - If next->mm has SYNC_CORE registered, then we sync core before
   483		 *    returning to user mode.
   484		 *
   485		 * In the case where prev->mm =3D=3D next->mm, membarrier() uses an=
 IPI
   486		 * instead, and no particular barriers are needed while context
   487		 * switching.
   488		 *
   489		 * x86 gets all of this as a side-effect of writing to CR3 except
   490		 * in the case where we unlazy without flushing.
   491		 *
   492		 * All other architectures are civilized and do all of this implici=
tly
   493		 * when transitioning from kernel to user mode.
   494		 */
   495		if (real_prev =3D=3D next) {
   496			VM_WARN_ON(this_cpu_read(cpu_tlbstate.ctxs[prev_asid].ctx_id) !=3D
   497				   next->context.ctx_id);
   498	=

   499			/*
   500			 * Even in lazy TLB mode, the CPU should stay set in the
   501			 * mm_cpumask. The TLB shootdown code can figure out from
   502			 * from cpu_tlbstate.is_lazy whether or not to send an IPI.
   503			 */
   504			if (WARN_ON_ONCE(real_prev !=3D &init_mm &&
   505					 !cpumask_test_cpu(cpu, mm_cpumask(next))))
   506				cpumask_set_cpu(cpu, mm_cpumask(next));
   507	=

   508			/*
   509			 * If the CPU is not in lazy TLB mode, we are just switching
   510			 * from one thread in a process to another thread in the same
   511			 * process. No TLB flush or membarrier() synchronization
   512			 * is required.
   513			 */
   514			if (!was_lazy)
   515				return;
   516	=

   517			/*
   518			 * Read the tlb_gen to check whether a flush is needed.
   519			 * If the TLB is up to date, just use it.
   520			 * The barrier synchronizes with the tlb_gen increment in
   521			 * the TLB shootdown code.
   522			 *
   523			 * As a future optimization opportunity, it's plausible
   524			 * that the x86 memory model is strong enough that this
   525			 * smp_mb() isn't needed.
   526			 */
   527			smp_mb();
   528			next_tlb_gen =3D atomic64_read(&next->context.tlb_gen);
   529			if (this_cpu_read(cpu_tlbstate.ctxs[prev_asid].tlb_gen) =3D=3D
   530			    next_tlb_gen) {
   531				/*
   532				 * We switched logical mm but we're not going to
   533				 * write to CR3.  We already did smp_mb() above,
   534				 * but membarrier() might require a sync_core()
   535				 * as well.
   536				 */
 > 537				if (unlikely(atomic_read(&next->membarrier_state) &
 > 538					     MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE))
   539					sync_core_before_usermode();
   540	=

   541				return;
   542			}
   543	=

   544			/*
   545			 * TLB contents went out of date while we were in lazy
   546			 * mode. Fall through to the TLB switching code below.
   547			 * No need for an explicit membarrier invocation -- the CR3
   548			 * write will serialize.
   549			 */
   550			new_asid =3D prev_asid;
   551			need_flush =3D true;
   552		} else {
   553			/*
   554			 * Avoid user/user BTB poisoning by flushing the branch
   555			 * predictor when switching between processes. This stops
   556			 * one process from doing Spectre-v2 attacks on another.
   557			 */
   558			cond_ibpb(tsk);
   559	=

   560			/*
   561			 * Stop remote flushes for the previous mm.
   562			 * Skip kernel threads; we never send init_mm TLB flushing IPIs,
   563			 * but the bitmap manipulation can cause cache line contention.
   564			 */
   565			if (real_prev !=3D &init_mm) {
   566				VM_WARN_ON_ONCE(!cpumask_test_cpu(cpu,
   567							mm_cpumask(real_prev)));
   568				cpumask_clear_cpu(cpu, mm_cpumask(real_prev));
   569			}
   570	=

   571			/*
   572			 * Start remote flushes and then read tlb_gen.
   573			 */
   574			if (next !=3D &init_mm)
   575				cpumask_set_cpu(cpu, mm_cpumask(next));
   576			next_tlb_gen =3D atomic64_read(&next->context.tlb_gen);
   577	=

   578			choose_new_asid(next, next_tlb_gen, &new_asid, &need_flush);
   579	=

   580			/* Let nmi_uaccess_okay() know that we're changing CR3. */
   581			this_cpu_write(cpu_tlbstate.loaded_mm, LOADED_MM_SWITCHING);
   582			barrier();
   583		}
   584	=

   585		if (need_flush) {
   586			this_cpu_write(cpu_tlbstate.ctxs[new_asid].ctx_id, next->context.c=
tx_id);
   587			this_cpu_write(cpu_tlbstate.ctxs[new_asid].tlb_gen, next_tlb_gen);
   588			load_new_mm_cr3(next->pgd, new_asid, true);
   589	=

   590			trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
   591		} else {
   592			/* The new ASID is already up to date. */
   593			load_new_mm_cr3(next->pgd, new_asid, false);
   594	=

   595			trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, 0);
   596		}
   597	=

   598		/* Make sure we write CR3 before loaded_mm. */
   599		barrier();
   600	=

   601		this_cpu_write(cpu_tlbstate.loaded_mm, next);
   602		this_cpu_write(cpu_tlbstate.loaded_mm_asid, new_asid);
   603	=

   604		if (next !=3D real_prev) {
   605			cr4_update_pce_mm(next);
   606			switch_ldt(real_prev, next);
   607		}
   608	}
   609	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0614303400260655457==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
S3824lQ9+9qTPXmzj/YfMGcEYSJpAAA=
--===============0614303400260655457==--

