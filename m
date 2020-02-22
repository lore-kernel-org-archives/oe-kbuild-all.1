Content-Type: multipart/mixed; boundary="===============7450554667620708119=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [rcu:rcu/next 110/168] kernel/rcu/tree.c:3401:2: error: implicit declaration of function 'ASSERT_EXCLUSIVE_WRITER'
Date: Sat, 22 Feb 2020 15:27:04 +0800
Message-ID: <202002221501.6Iz5kP2U%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7450554667620708119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.g=
it rcu/next
head:   8aa63de65a79bd8c5c1c2b19452e35f58b043ac7
commit: e70e4b3e69ce8d3fdfc1f4bfe6ed27187e1a9016 [110/168] rcu: Mark rcu_st=
ate.ncpus to detect concurrent writes
config: arc-defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout e70e4b3e69ce8d3fdfc1f4bfe6ed27187e1a9016
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Darc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

Note: the rcu/rcu/next HEAD 8aa63de65a79bd8c5c1c2b19452e35f58b043ac7 builds=
 fine.
      It only hurts bisectibility.

All errors (new ones prefixed by >>):

   kernel/rcu/tree.c: In function 'rcu_cpu_starting':
>> kernel/rcu/tree.c:3401:2: error: implicit declaration of function 'ASSER=
T_EXCLUSIVE_WRITER' [-Werror=3Dimplicit-function-declaration]
    3401 |  ASSERT_EXCLUSIVE_WRITER(rcu_state.ncpus);
         |  ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/ASSERT_EXCLUSIVE_WRITER +3401 kernel/rcu/tree.c

  3364	=

  3365	/*
  3366	 * Mark the specified CPU as being online so that subsequent grace p=
eriods
  3367	 * (both expedited and normal) will wait on it.  Note that this mean=
s that
  3368	 * incoming CPUs are not allowed to use RCU read-side critical secti=
ons
  3369	 * until this function is called.  Failing to observe this restricti=
on
  3370	 * will result in lockdep splats.
  3371	 *
  3372	 * Note that this function is special in that it is invoked directly
  3373	 * from the incoming CPU rather than from the cpuhp_step mechanism.
  3374	 * This is because this function must be invoked at a precise locati=
on.
  3375	 */
  3376	void rcu_cpu_starting(unsigned int cpu)
  3377	{
  3378		unsigned long flags;
  3379		unsigned long mask;
  3380		int nbits;
  3381		unsigned long oldmask;
  3382		struct rcu_data *rdp;
  3383		struct rcu_node *rnp;
  3384	=

  3385		if (per_cpu(rcu_cpu_started, cpu))
  3386			return;
  3387	=

  3388		per_cpu(rcu_cpu_started, cpu) =3D 1;
  3389	=

  3390		rdp =3D per_cpu_ptr(&rcu_data, cpu);
  3391		rnp =3D rdp->mynode;
  3392		mask =3D rdp->grpmask;
  3393		raw_spin_lock_irqsave_rcu_node(rnp, flags);
  3394		WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
  3395		oldmask =3D rnp->expmaskinitnext;
  3396		rnp->expmaskinitnext |=3D mask;
  3397		oldmask ^=3D rnp->expmaskinitnext;
  3398		nbits =3D bitmap_weight(&oldmask, BITS_PER_LONG);
  3399		/* Allow lockless access for expedited grace periods. */
  3400		smp_store_release(&rcu_state.ncpus, rcu_state.ncpus + nbits); /* ^^=
^ */
> 3401		ASSERT_EXCLUSIVE_WRITER(rcu_state.ncpus);
  3402		rcu_gpnum_ovf(rnp, rdp); /* Offline-induced counter wrap? */
  3403		rdp->rcu_onl_gp_seq =3D READ_ONCE(rcu_state.gp_seq);
  3404		rdp->rcu_onl_gp_flags =3D READ_ONCE(rcu_state.gp_flags);
  3405		if (rnp->qsmask & mask) { /* RCU waiting on incoming CPU? */
  3406			rcu_disable_urgency_upon_qs(rdp);
  3407			/* Report QS -after- changing ->qsmaskinitnext! */
  3408			rcu_report_qs_rnp(mask, rnp, rnp->gp_seq, flags);
  3409		} else {
  3410			raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
  3411		}
  3412		smp_mb(); /* Ensure RCU read-side usage follows above initializatio=
n. */
  3413	}
  3414	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7450554667620708119==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7450554667620708119==--

