Content-Type: multipart/mixed; boundary="===============3760633973702388357=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:locking/kcsan 12/21] kernel/sched/fair.c:2510:13: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Fri, 15 May 2020 18:57:18 +0800
Message-ID: <202005151808.TGToDahQ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3760633973702388357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/kcsan
head:   ffed638b6a2180da8fd002a46632d746af72b299
commit: bbfa112b46bdbbdfc2f5bfb9c2dcbef780ff6417 [12/21] READ_ONCE: Simplif=
y implementations of {READ,WRITE}_ONCE()
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout bbfa112b46bdbbdfc2f5bfb9c2dcbef780ff6417
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   kernel/sched/fair.c:882:34: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@    expected struct sched_entity *se @@    go=
t struct sched_entitstruct sched_entity *se @@
   kernel/sched/fair.c:882:34: sparse:    expected struct sched_entity *se
   kernel/sched/fair.c:882:34: sparse:    got struct sched_entity [noderef]=
 <asn:4> *
>> kernel/sched/fair.c:2510:13: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@    expected struct task_struct *tsk @@    g=
ot struct task_structstruct task_struct *tsk @@
   kernel/sched/fair.c:2510:13: sparse:    expected struct task_struct *tsk
   kernel/sched/fair.c:2510:13: sparse:    got struct task_struct [noderef]=
 <asn:4> *__x
   kernel/sched/fair.c:4835:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:4835:22: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/fair.c:4835:22: sparse:    struct task_struct *
   kernel/sched/fair.c:5358:38: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:5358:38: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/fair.c:5358:38: sparse:    struct task_struct *
   kernel/sched/fair.c:5373:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@    expected struct task_struct *curr @@   =
 got struct task_structstruct task_struct *curr @@
   kernel/sched/fair.c:5373:38: sparse:    expected struct task_struct *curr
   kernel/sched/fair.c:5373:38: sparse:    got struct task_struct [noderef]=
 <asn:4> *curr
   kernel/sched/fair.c:5598:1: sparse: sparse: symbol '__pcpu_scope_load_ba=
lance_mask' was not declared. Should it be static?
   kernel/sched/fair.c:5599:1: sparse: sparse: symbol '__pcpu_scope_select_=
idle_mask' was not declared. Should it be static?
   kernel/sched/fair.c:6529:20: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@    expected struct sched_domain *[assigned]=
 sd @@    got struct struct sched_domain *[assigned] sd @@
   kernel/sched/fair.c:6529:20: sparse:    expected struct sched_domain *[a=
ssigned] sd
   kernel/sched/fair.c:6529:20: sparse:    got struct sched_domain [noderef=
] <asn:4> *parent
   kernel/sched/fair.c:6648:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@    expected struct sched_domain *[assigned] =
tmp @@    got struct struct sched_domain *[assigned] tmp @@
   kernel/sched/fair.c:6648:9: sparse:    expected struct sched_domain *[as=
signed] tmp
   kernel/sched/fair.c:6648:9: sparse:    got struct sched_domain [noderef]=
 <asn:4> *parent
   kernel/sched/fair.c:6850:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@    expected struct task_struct *curr @@   =
 got struct task_structstruct task_struct *curr @@
   kernel/sched/fair.c:6850:38: sparse:    expected struct task_struct *curr
   kernel/sched/fair.c:6850:38: sparse:    got struct task_struct [noderef]=
 <asn:4> *curr
   kernel/sched/fair.c:7101:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@    expected struct task_struct *curr @@   =
 got struct task_structstruct task_struct *curr @@
   kernel/sched/fair.c:7101:38: sparse:    expected struct task_struct *curr
   kernel/sched/fair.c:7101:38: sparse:    got struct task_struct [noderef]=
 <asn:4> *curr
   kernel/sched/fair.c:8059:40: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@    expected struct sched_domain *child @@ =
   got struct sched_domaistruct sched_domain *child @@
   kernel/sched/fair.c:8059:40: sparse:    expected struct sched_domain *ch=
ild
   kernel/sched/fair.c:8059:40: sparse:    got struct sched_domain [noderef=
] <asn:4> *child
   kernel/sched/fair.c:8552:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:8552:22: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/fair.c:8552:22: sparse:    struct task_struct *
   kernel/sched/fair.c:9796:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@    expected struct sched_domain *[assigned] =
sd @@    got struct struct sched_domain *[assigned] sd @@
   kernel/sched/fair.c:9796:9: sparse:    expected struct sched_domain *[as=
signed] sd
   kernel/sched/fair.c:9796:9: sparse:    got struct sched_domain [noderef]=
 <asn:4> *parent
   kernel/sched/fair.c:9456:44: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@    expected struct sched_domain *sd_parent=
 @@    got struct sched_domaistruct sched_domain *sd_parent @@
   kernel/sched/fair.c:9456:44: sparse:    expected struct sched_domain *sd=
_parent
   kernel/sched/fair.c:9456:44: sparse:    got struct sched_domain [noderef=
] <asn:4> *parent
   kernel/sched/fair.c:9875:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@    expected struct sched_domain *[assigned] =
sd @@    got struct struct sched_domain *[assigned] sd @@
   kernel/sched/fair.c:9875:9: sparse:    expected struct sched_domain *[as=
signed] sd
   kernel/sched/fair.c:9875:9: sparse:    got struct sched_domain [noderef]=
 <asn:4> *parent
   kernel/sched/fair.c:10475:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@    expected struct sched_domain *[assigned]=
 sd @@    got struct struct sched_domain *[assigned] sd @@
   kernel/sched/fair.c:10475:9: sparse:    expected struct sched_domain *[a=
ssigned] sd
   kernel/sched/fair.c:10475:9: sparse:    got struct sched_domain [noderef=
] <asn:4> *parent
   kernel/sched/fair.c:10679:22: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/fair.c:10679:22: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/fair.c:10679:22: sparse:    struct task_struct *
   kernel/sched/fair.c:10812:30: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/fair.c:10812:30: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/fair.c:10812:30: sparse:    struct task_struct *
   kernel/sched/fair.c:2454:9: sparse: sparse: context imbalance in 'task_n=
uma_placement' - different lock contexts for basic block
   kernel/sched/fair.c:5904:28: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@    expected struct sched_domain *sd @@    g=
ot struct sched_domaistruct sched_domain *sd @@
   kernel/sched/fair.c:5904:28: sparse:    expected struct sched_domain *sd
   kernel/sched/fair.c:5904:28: sparse:    got struct sched_domain [noderef=
] <asn:4> *child
   kernel/sched/fair.c:5910:28: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@    expected struct sched_domain *sd @@    g=
ot struct sched_domaistruct sched_domain *sd @@
   kernel/sched/fair.c:5910:28: sparse:    expected struct sched_domain *sd
   kernel/sched/fair.c:5910:28: sparse:    got struct sched_domain [noderef=
] <asn:4> *child
   kernel/sched/fair.c:5917:28: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@    expected struct sched_domain *sd @@    g=
ot struct sched_domaistruct sched_domain *sd @@
   kernel/sched/fair.c:5917:28: sparse:    expected struct sched_domain *sd
   kernel/sched/fair.c:5917:28: sparse:    got struct sched_domain [noderef=
] <asn:4> *child
   kernel/sched/fair.c:5925:17: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@    expected struct sched_domain *[assigned]=
 tmp @@    got struct struct sched_domain *[assigned] tmp @@
   kernel/sched/fair.c:5925:17: sparse:    expected struct sched_domain *[a=
ssigned] tmp
   kernel/sched/fair.c:5925:17: sparse:    got struct sched_domain [noderef=
] <asn:4> *parent
   kernel/sched/sched.h:1809:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct [noderef] <as=
n:4> *
   kernel/sched/sched.h:1809:9: sparse:    struct task_struct *

vim +2510 kernel/sched/fair.c

8c8a743c5087ba Peter Zijlstra  2013-10-07  2473  =

3e6a9418cf0563 Mel Gorman      2013-10-07  2474  static void task_numa_grou=
p(struct task_struct *p, int cpupid, int flags,
3e6a9418cf0563 Mel Gorman      2013-10-07  2475  			int *priv)
8c8a743c5087ba Peter Zijlstra  2013-10-07  2476  {
8c8a743c5087ba Peter Zijlstra  2013-10-07  2477  	struct numa_group *grp, *=
my_grp;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2478  	struct task_struct *tsk;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2479  	bool join =3D false;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2480  	int cpu =3D cpupid_to_cpu=
(cpupid);
8c8a743c5087ba Peter Zijlstra  2013-10-07  2481  	int i;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2482  =

cb361d8cdef699 Jann Horn       2019-07-16  2483  	if (unlikely(!deref_curr_=
numa_group(p))) {
8c8a743c5087ba Peter Zijlstra  2013-10-07  2484  		unsigned int size =3D si=
zeof(struct numa_group) +
50ec8a401fed6d Rik van Riel    2014-01-27  2485  				    4*nr_node_ids*size=
of(unsigned long);
8c8a743c5087ba Peter Zijlstra  2013-10-07  2486  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2487  		grp =3D kzalloc(size, GF=
P_KERNEL | __GFP_NOWARN);
8c8a743c5087ba Peter Zijlstra  2013-10-07  2488  		if (!grp)
8c8a743c5087ba Peter Zijlstra  2013-10-07  2489  			return;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2490  =

c45a77952427b6 Elena Reshetova 2019-01-18  2491  		refcount_set(&grp->refco=
unt, 1);
4142c3ebb685bb Rik van Riel    2016-01-25  2492  		grp->active_nodes =3D 1;
4142c3ebb685bb Rik van Riel    2016-01-25  2493  		grp->max_faults_cpu =3D =
0;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2494  		spin_lock_init(&grp->loc=
k);
e29cf08b05dc0b Mel Gorman      2013-10-07  2495  		grp->gid =3D p->pid;
50ec8a401fed6d Rik van Riel    2014-01-27  2496  		/* Second half of the ar=
ray tracks nids where faults happen */
be1e4e760d940c Rik van Riel    2014-01-27  2497  		grp->faults_cpu =3D grp-=
>faults + NR_NUMA_HINT_FAULT_TYPES *
be1e4e760d940c Rik van Riel    2014-01-27  2498  						nr_node_ids;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2499  =

be1e4e760d940c Rik van Riel    2014-01-27  2500  		for (i =3D 0; i < NR_NUM=
A_HINT_FAULT_STATS * nr_node_ids; i++)
44dba3d5d6a106 Iulia Manda     2014-10-31  2501  			grp->faults[i] =3D p->n=
uma_faults[i];
8c8a743c5087ba Peter Zijlstra  2013-10-07  2502  =

989348b5fc2367 Mel Gorman      2013-10-07  2503  		grp->total_faults =3D p-=
>total_numa_faults;
83e1d2cd9eabec Mel Gorman      2013-10-07  2504  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2505  		grp->nr_tasks++;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2506  		rcu_assign_pointer(p->nu=
ma_group, grp);
8c8a743c5087ba Peter Zijlstra  2013-10-07  2507  	}
8c8a743c5087ba Peter Zijlstra  2013-10-07  2508  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2509  	rcu_read_lock();
316c1608d15c73 Jason Low       2015-04-28 @2510  	tsk =3D READ_ONCE(cpu_rq(=
cpu)->curr);
8c8a743c5087ba Peter Zijlstra  2013-10-07  2511  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2512  	if (!cpupid_match_pid(tsk=
, cpupid))
3354781a218438 Peter Zijlstra  2013-10-09  2513  		goto no_join;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2514  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2515  	grp =3D rcu_dereference(t=
sk->numa_group);
8c8a743c5087ba Peter Zijlstra  2013-10-07  2516  	if (!grp)
3354781a218438 Peter Zijlstra  2013-10-09  2517  		goto no_join;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2518  =

cb361d8cdef699 Jann Horn       2019-07-16  2519  	my_grp =3D deref_curr_num=
a_group(p);
8c8a743c5087ba Peter Zijlstra  2013-10-07  2520  	if (grp =3D=3D my_grp)
3354781a218438 Peter Zijlstra  2013-10-09  2521  		goto no_join;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2522  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2523  	/*
8c8a743c5087ba Peter Zijlstra  2013-10-07  2524  	 * Only join the other gr=
oup if its bigger; if we're the bigger group,
8c8a743c5087ba Peter Zijlstra  2013-10-07  2525  	 * the other task will jo=
in us.
8c8a743c5087ba Peter Zijlstra  2013-10-07  2526  	 */
8c8a743c5087ba Peter Zijlstra  2013-10-07  2527  	if (my_grp->nr_tasks > gr=
p->nr_tasks)
3354781a218438 Peter Zijlstra  2013-10-09  2528  		goto no_join;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2529  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2530  	/*
8c8a743c5087ba Peter Zijlstra  2013-10-07  2531  	 * Tie-break on the grp a=
ddress.
8c8a743c5087ba Peter Zijlstra  2013-10-07  2532  	 */
8c8a743c5087ba Peter Zijlstra  2013-10-07  2533  	if (my_grp->nr_tasks =3D=
=3D grp->nr_tasks && my_grp > grp)
3354781a218438 Peter Zijlstra  2013-10-09  2534  		goto no_join;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2535  =

dabe1d992414a6 Rik van Riel    2013-10-07  2536  	/* Always join threads in=
 the same process. */
dabe1d992414a6 Rik van Riel    2013-10-07  2537  	if (tsk->mm =3D=3D curren=
t->mm)
dabe1d992414a6 Rik van Riel    2013-10-07  2538  		join =3D true;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2539  =

dabe1d992414a6 Rik van Riel    2013-10-07  2540  	/* Simple filter to avoid=
 false positives due to PID collisions */
dabe1d992414a6 Rik van Riel    2013-10-07  2541  	if (flags & TNF_SHARED)
8c8a743c5087ba Peter Zijlstra  2013-10-07  2542  		join =3D true;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2543  =

3e6a9418cf0563 Mel Gorman      2013-10-07  2544  	/* Update priv based on w=
hether false sharing was detected */
3e6a9418cf0563 Mel Gorman      2013-10-07  2545  	*priv =3D !join;
3e6a9418cf0563 Mel Gorman      2013-10-07  2546  =

dabe1d992414a6 Rik van Riel    2013-10-07  2547  	if (join && !get_numa_gro=
up(grp))
3354781a218438 Peter Zijlstra  2013-10-09  2548  		goto no_join;
dabe1d992414a6 Rik van Riel    2013-10-07  2549  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2550  	rcu_read_unlock();
8c8a743c5087ba Peter Zijlstra  2013-10-07  2551  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2552  	if (!join)
8c8a743c5087ba Peter Zijlstra  2013-10-07  2553  		return;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2554  =

60e69eed85bb7b Mike Galbraith  2014-04-07  2555  	BUG_ON(irqs_disabled());
60e69eed85bb7b Mike Galbraith  2014-04-07  2556  	double_lock_irq(&my_grp->=
lock, &grp->lock);
989348b5fc2367 Mel Gorman      2013-10-07  2557  =

be1e4e760d940c Rik van Riel    2014-01-27  2558  	for (i =3D 0; i < NR_NUMA=
_HINT_FAULT_STATS * nr_node_ids; i++) {
44dba3d5d6a106 Iulia Manda     2014-10-31  2559  		my_grp->faults[i] -=3D p=
->numa_faults[i];
44dba3d5d6a106 Iulia Manda     2014-10-31  2560  		grp->faults[i] +=3D p->n=
uma_faults[i];
8c8a743c5087ba Peter Zijlstra  2013-10-07  2561  	}
989348b5fc2367 Mel Gorman      2013-10-07  2562  	my_grp->total_faults -=3D=
 p->total_numa_faults;
989348b5fc2367 Mel Gorman      2013-10-07  2563  	grp->total_faults +=3D p-=
>total_numa_faults;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2564  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2565  	my_grp->nr_tasks--;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2566  	grp->nr_tasks++;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2567  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2568  	spin_unlock(&my_grp->lock=
);
60e69eed85bb7b Mike Galbraith  2014-04-07  2569  	spin_unlock_irq(&grp->loc=
k);
8c8a743c5087ba Peter Zijlstra  2013-10-07  2570  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2571  	rcu_assign_pointer(p->num=
a_group, grp);
8c8a743c5087ba Peter Zijlstra  2013-10-07  2572  =

8c8a743c5087ba Peter Zijlstra  2013-10-07  2573  	put_numa_group(my_grp);
3354781a218438 Peter Zijlstra  2013-10-09  2574  	return;
3354781a218438 Peter Zijlstra  2013-10-09  2575  =

3354781a218438 Peter Zijlstra  2013-10-09  2576  no_join:
3354781a218438 Peter Zijlstra  2013-10-09  2577  	rcu_read_unlock();
3354781a218438 Peter Zijlstra  2013-10-09  2578  	return;
8c8a743c5087ba Peter Zijlstra  2013-10-07  2579  }
8c8a743c5087ba Peter Zijlstra  2013-10-07  2580  =


:::::: The code at line 2510 was first introduced by commit
:::::: 316c1608d15c736439d4065ed12f306db554b3da sched, timer: Convert usage=
s of ACCESS_ONCE() in the scheduler to READ_ONCE()/WRITE_ONCE()

:::::: TO: Jason Low <jason.low2@hp.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3760633973702388357==--

