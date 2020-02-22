Content-Type: multipart/mixed; boundary="===============7860274709374470482=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [rcu:rcu/next 110/168] kernel/rcu/tree.c:3401:2: error: implicit declaration of function 'ASSERT_EXCLUSIVE_WRITER'
Date: Sat, 22 Feb 2020 08:33:35 -0800
Message-ID: <20200222163335.GY2935@paulmck-ThinkPad-P72>
In-Reply-To: <202002221501.6Iz5kP2U%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7860274709374470482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2020 at 03:27:04PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu=
.git rcu/next
> head:   8aa63de65a79bd8c5c1c2b19452e35f58b043ac7
> commit: e70e4b3e69ce8d3fdfc1f4bfe6ed27187e1a9016 [110/168] rcu: Mark rcu_=
state.ncpus to detect concurrent writes
> config: arc-defconfig (attached as .config)
> compiler: arc-elf-gcc (GCC) 9.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout e70e4b3e69ce8d3fdfc1f4bfe6ed27187e1a9016
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D9.2.0 make.cross ARCH=3Darc =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> Note: the rcu/rcu/next HEAD 8aa63de65a79bd8c5c1c2b19452e35f58b043ac7 buil=
ds fine.
>       It only hurts bisectibility.
> =

> All errors (new ones prefixed by >>):
> =

>    kernel/rcu/tree.c: In function 'rcu_cpu_starting':
> >> kernel/rcu/tree.c:3401:2: error: implicit declaration of function 'ASS=
ERT_EXCLUSIVE_WRITER' [-Werror=3Dimplicit-function-declaration]
>     3401 |  ASSERT_EXCLUSIVE_WRITER(rcu_state.ncpus);
>          |  ^~~~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

Good catch!  I will move this out of the set of commits intended for
v5.7, thank you!

							Thanx, Paul

> vim +/ASSERT_EXCLUSIVE_WRITER +3401 kernel/rcu/tree.c
> =

>   3364	=

>   3365	/*
>   3366	 * Mark the specified CPU as being online so that subsequent grace=
 periods
>   3367	 * (both expedited and normal) will wait on it.  Note that this me=
ans that
>   3368	 * incoming CPUs are not allowed to use RCU read-side critical sec=
tions
>   3369	 * until this function is called.  Failing to observe this restric=
tion
>   3370	 * will result in lockdep splats.
>   3371	 *
>   3372	 * Note that this function is special in that it is invoked direct=
ly
>   3373	 * from the incoming CPU rather than from the cpuhp_step mechanism.
>   3374	 * This is because this function must be invoked at a precise loca=
tion.
>   3375	 */
>   3376	void rcu_cpu_starting(unsigned int cpu)
>   3377	{
>   3378		unsigned long flags;
>   3379		unsigned long mask;
>   3380		int nbits;
>   3381		unsigned long oldmask;
>   3382		struct rcu_data *rdp;
>   3383		struct rcu_node *rnp;
>   3384	=

>   3385		if (per_cpu(rcu_cpu_started, cpu))
>   3386			return;
>   3387	=

>   3388		per_cpu(rcu_cpu_started, cpu) =3D 1;
>   3389	=

>   3390		rdp =3D per_cpu_ptr(&rcu_data, cpu);
>   3391		rnp =3D rdp->mynode;
>   3392		mask =3D rdp->grpmask;
>   3393		raw_spin_lock_irqsave_rcu_node(rnp, flags);
>   3394		WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
>   3395		oldmask =3D rnp->expmaskinitnext;
>   3396		rnp->expmaskinitnext |=3D mask;
>   3397		oldmask ^=3D rnp->expmaskinitnext;
>   3398		nbits =3D bitmap_weight(&oldmask, BITS_PER_LONG);
>   3399		/* Allow lockless access for expedited grace periods. */
>   3400		smp_store_release(&rcu_state.ncpus, rcu_state.ncpus + nbits); /* =
^^^ */
> > 3401		ASSERT_EXCLUSIVE_WRITER(rcu_state.ncpus);
>   3402		rcu_gpnum_ovf(rnp, rdp); /* Offline-induced counter wrap? */
>   3403		rdp->rcu_onl_gp_seq =3D READ_ONCE(rcu_state.gp_seq);
>   3404		rdp->rcu_onl_gp_flags =3D READ_ONCE(rcu_state.gp_flags);
>   3405		if (rnp->qsmask & mask) { /* RCU waiting on incoming CPU? */
>   3406			rcu_disable_urgency_upon_qs(rdp);
>   3407			/* Report QS -after- changing ->qsmaskinitnext! */
>   3408			rcu_report_qs_rnp(mask, rnp, rnp->gp_seq, flags);
>   3409		} else {
>   3410			raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>   3411		}
>   3412		smp_mb(); /* Ensure RCU read-side usage follows above initializat=
ion. */
>   3413	}
>   3414	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============7860274709374470482==--

