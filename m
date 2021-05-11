Content-Type: multipart/mixed; boundary="===============2721919472180909305=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: kernel/sched/fair.c:9551:12: warning: stack frame size of 1376 bytes in function 'load_balance'
Date: Wed, 12 May 2021 00:00:17 +0800
Message-ID: <202105112356.JuDlybKz-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2721919472180909305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1140ab592e2ebf8153d2b322604031a8868ce7a5
commit: 0826530de3cbdc89e60a89e86def94a5f0fc81ca sched/fair: Remove update =
of blocked load from newidle_balance
date:   9 weeks ago
config: mips-randconfig-r022-20210511 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0fed6=
35fe1701470062495a6ffee1c608f3f1bc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D0826530de3cbdc89e60a89e86def94a5f0fc81ca
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0826530de3cbdc89e60a89e86def94a5f0fc81ca
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:5381:6: warning: no previous prototype for function =
'init_cfs_bandwidth' [-Wmissing-prototypes]
   void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
        ^
   kernel/sched/fair.c:5381:1: note: declare 'static' if the function is no=
t intended to be used outside of this translation unit
   void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
   ^
   static =

   kernel/sched/fair.c:11166:6: warning: no previous prototype for function=
 'free_fair_sched_group' [-Wmissing-prototypes]
   void free_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:11166:1: note: declare 'static' if the function is n=
ot intended to be used outside of this translation unit
   void free_fair_sched_group(struct task_group *tg) { }
   ^
   static =

   kernel/sched/fair.c:11168:5: warning: no previous prototype for function=
 'alloc_fair_sched_group' [-Wmissing-prototypes]
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *par=
ent)
       ^
   kernel/sched/fair.c:11168:1: note: declare 'static' if the function is n=
ot intended to be used outside of this translation unit
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *par=
ent)
   ^
   static =

   kernel/sched/fair.c:11173:6: warning: no previous prototype for function=
 'online_fair_sched_group' [-Wmissing-prototypes]
   void online_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:11173:1: note: declare 'static' if the function is n=
ot intended to be used outside of this translation unit
   void online_fair_sched_group(struct task_group *tg) { }
   ^
   static =

   kernel/sched/fair.c:11175:6: warning: no previous prototype for function=
 'unregister_fair_sched_group' [-Wmissing-prototypes]
   void unregister_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:11175:1: note: declare 'static' if the function is n=
ot intended to be used outside of this translation unit
   void unregister_fair_sched_group(struct task_group *tg) { }
   ^
   static =

   kernel/sched/fair.c:486:20: warning: unused function 'list_del_leaf_cfs_=
rq' [-Wunused-function]
   static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
                      ^
   kernel/sched/fair.c:5362:20: warning: unused function 'sync_throttle' [-=
Wunused-function]
   static inline void sync_throttle(struct task_group *tg, int cpu) {}
                      ^
   kernel/sched/fair.c:5387:37: warning: unused function 'tg_cfs_bandwidth'=
 [-Wunused-function]
   static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *=
tg)
                                       ^
   kernel/sched/fair.c:5391:20: warning: unused function 'destroy_cfs_bandw=
idth' [-Wunused-function]
   static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
                      ^
>> kernel/sched/fair.c:9551:12: warning: stack frame size of 1376 bytes in =
function 'load_balance' [-Wframe-larger-than=3D]
   static int load_balance(int this_cpu, struct rq *this_rq,
              ^
   10 warnings generated.


vim +/load_balance +9551 kernel/sched/fair.c

23f0d2093c789e kernel/sched/fair.c Joonsoo Kim               2013-08-06  95=
46  =

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
47  /*
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
48   * Check this_cpu to ensure it is balanced within domain. Attempt to mo=
ve
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
49   * tasks if there is an imbalance.
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
50   */
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17 @95=
51  static int load_balance(int this_cpu, struct rq *this_rq,
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
52  			struct sched_domain *sd, enum cpu_idle_type idle,
23f0d2093c789e kernel/sched/fair.c Joonsoo Kim               2013-08-06  95=
53  			int *continue_balancing)
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
54  {
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  95=
55  	int ld_moved, cur_ld_moved, active_balance =3D 0;
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  95=
56  	struct sched_domain *sd_parent =3D sd->parent;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
57  	struct sched_group *group;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
58  	struct rq *busiest;
8a8c69c3277886 kernel/sched/fair.c Peter Zijlstra            2016-10-04  95=
59  	struct rq_flags rf;
4ba2968420fa9d kernel/sched/fair.c Christoph Lameter         2014-08-26  95=
60  	struct cpumask *cpus =3D this_cpu_cpumask_var_ptr(load_balance_mask);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
61  =

8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  95=
62  	struct lb_env env =3D {
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  95=
63  		.sd		=3D sd,
ddcdf6e7d9919d kernel/sched/fair.c Peter Zijlstra            2012-02-22  95=
64  		.dst_cpu	=3D this_cpu,
ddcdf6e7d9919d kernel/sched/fair.c Peter Zijlstra            2012-02-22  95=
65  		.dst_rq		=3D this_rq,
ae4df9d6c93510 kernel/sched/fair.c Peter Zijlstra            2017-05-01  95=
66  		.dst_grpmask    =3D sched_group_span(sd->groups),
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  95=
67  		.idle		=3D idle,
eb95308ee2a694 kernel/sched/fair.c Peter Zijlstra            2012-04-17  95=
68  		.loop_break	=3D sched_nr_migrate_break,
b9403130a5350f kernel/sched/fair.c Michael Wang              2012-07-12  95=
69  		.cpus		=3D cpus,
0ec8aa00f2b4dc kernel/sched/fair.c Peter Zijlstra            2013-10-07  95=
70  		.fbq_type	=3D all,
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  95=
71  		.tasks		=3D LIST_HEAD_INIT(env.tasks),
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  95=
72  	};
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  95=
73  =

65a4433aebe36c kernel/sched/fair.c Jeffrey Hugo              2017-06-07  95=
74  	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
75  =

ae92882e5646d8 kernel/sched/fair.c Josh Poimboeuf            2016-06-17  95=
76  	schedstat_inc(sd->lb_count[idle]);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
77  =

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
78  redo:
23f0d2093c789e kernel/sched/fair.c Joonsoo Kim               2013-08-06  95=
79  	if (!should_we_balance(&env)) {
23f0d2093c789e kernel/sched/fair.c Joonsoo Kim               2013-08-06  95=
80  		*continue_balancing =3D 0;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
81  		goto out_balanced;
23f0d2093c789e kernel/sched/fair.c Joonsoo Kim               2013-08-06  95=
82  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
83  =

23f0d2093c789e kernel/sched/fair.c Joonsoo Kim               2013-08-06  95=
84  	group =3D find_busiest_group(&env);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
85  	if (!group) {
ae92882e5646d8 kernel/sched/fair.c Josh Poimboeuf            2016-06-17  95=
86  		schedstat_inc(sd->lb_nobusyg[idle]);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
87  		goto out_balanced;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
88  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
89  =

b9403130a5350f kernel/sched/fair.c Michael Wang              2012-07-12  95=
90  	busiest =3D find_busiest_queue(&env, group);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
91  	if (!busiest) {
ae92882e5646d8 kernel/sched/fair.c Josh Poimboeuf            2016-06-17  95=
92  		schedstat_inc(sd->lb_nobusyq[idle]);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
93  		goto out_balanced;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
94  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
95  =

78feefc512a091 kernel/sched/fair.c Michael Wang              2012-08-06  95=
96  	BUG_ON(busiest =3D=3D env.dst_rq);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
97  =

ae92882e5646d8 kernel/sched/fair.c Josh Poimboeuf            2016-06-17  95=
98  	schedstat_add(sd->lb_imbalance[idle], env.imbalance);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  95=
99  =

1aaf90a4b88aae kernel/sched/fair.c Vincent Guittot           2015-02-27  96=
00  	env.src_cpu =3D busiest->cpu;
1aaf90a4b88aae kernel/sched/fair.c Vincent Guittot           2015-02-27  96=
01  	env.src_rq =3D busiest;
1aaf90a4b88aae kernel/sched/fair.c Vincent Guittot           2015-02-27  96=
02  =

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
03  	ld_moved =3D 0;
8a41dfcda7a32e kernel/sched/fair.c Vincent Guittot           2021-01-07  96=
04  	/* Clear this flag as soon as we find a pullable task */
8a41dfcda7a32e kernel/sched/fair.c Vincent Guittot           2021-01-07  96=
05  	env.flags |=3D LBF_ALL_PINNED;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
06  	if (busiest->nr_running > 1) {
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
07  		/*
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
08  		 * Attempt to move tasks. If find_busiest_group has found
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
09  		 * an imbalance but busiest->nr_running <=3D 1, the group is
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
10  		 * still unbalanced. ld_moved simply stays zero, so it is
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
11  		 * correctly treated as an imbalance.
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
12  		 */
c82513e513556a kernel/sched/fair.c Peter Zijlstra            2012-04-26  96=
13  		env.loop_max  =3D min(sysctl_sched_nr_migrate, busiest->nr_running);
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  96=
14  =

5d6523ebd2f67d kernel/sched/fair.c Peter Zijlstra            2012-03-10  96=
15  more_balance:
8a8c69c3277886 kernel/sched/fair.c Peter Zijlstra            2016-10-04  96=
16  		rq_lock_irqsave(busiest, &rf);
3bed5e2166a5e4 kernel/sched/fair.c Peter Zijlstra            2016-10-03  96=
17  		update_rq_clock(busiest);
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
18  =

88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
19  		/*
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
20  		 * cur_ld_moved - load moved in current iteration
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
21  		 * ld_moved     - cumulative load moved across iterations
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
22  		 */
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  96=
23  		cur_ld_moved =3D detach_tasks(&env);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
24  =

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
25  		/*
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  96=
26  		 * We've detached some tasks from busiest_rq. Every
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  96=
27  		 * task is masked "TASK_ON_RQ_MIGRATING", so we can safely
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  96=
28  		 * unlock busiest->lock, and we are able to be sure
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  96=
29  		 * that nobody can manipulate the tasks in parallel.
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  96=
30  		 * See task_rq_lock() family for the details.
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
31  		 */
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  96=
32  =

8a8c69c3277886 kernel/sched/fair.c Peter Zijlstra            2016-10-04  96=
33  		rq_unlock(busiest, &rf);
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  96=
34  =

163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  96=
35  		if (cur_ld_moved) {
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  96=
36  			attach_tasks(&env);
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
37  			ld_moved +=3D cur_ld_moved;
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  96=
38  		}
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  96=
39  =

8a8c69c3277886 kernel/sched/fair.c Peter Zijlstra            2016-10-04  96=
40  		local_irq_restore(rf.flags);
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
41  =

f1cd0858100c67 kernel/sched/fair.c Joonsoo Kim               2013-04-23  96=
42  		if (env.flags & LBF_NEED_BREAK) {
f1cd0858100c67 kernel/sched/fair.c Joonsoo Kim               2013-04-23  96=
43  			env.flags &=3D ~LBF_NEED_BREAK;
f1cd0858100c67 kernel/sched/fair.c Joonsoo Kim               2013-04-23  96=
44  			goto more_balance;
f1cd0858100c67 kernel/sched/fair.c Joonsoo Kim               2013-04-23  96=
45  		}
f1cd0858100c67 kernel/sched/fair.c Joonsoo Kim               2013-04-23  96=
46  =

88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
47  		/*
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
48  		 * Revisit (affine) tasks on src_cpu that couldn't be moved to
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
49  		 * us and move them to an alternate dst_cpu in our sched_group
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
50  		 * where they can run. The upper limit on how many times we
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  96=
51  		 * iterate on same src_cpu is dependent on number of CPUs in our
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
52  		 * sched_group.
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
53  		 *
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
54  		 * This changes load balance semantics a bit on who can move
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
55  		 * load to a given_cpu. In addition to the given_cpu itself
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
56  		 * (or a ilb_cpu acting on its behalf where given_cpu is
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
57  		 * nohz-idle), we now have balance_cpu in a position to move
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
58  		 * load to given_cpu. In rare situations, this may cause
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
59  		 * conflicts (balance_cpu and given_cpu/ilb_cpu deciding
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
60  		 * _independently_ and at _same_ time to move some load to
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
61  		 * given_cpu) causing exceess load to be moved to given_cpu.
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
62  		 * This however should not happen so much in practice and
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
63  		 * moreover subsequent load balance cycles should correct the
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
64  		 * excess load moved.
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
65  		 */
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  96=
66  		if ((env.flags & LBF_DST_PINNED) && env.imbalance > 0) {
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
67  =

97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  96=
68  			/* Prevent to re-select dst_cpu via env's CPUs */
c89d92eddfad11 kernel/sched/fair.c Viresh Kumar              2019-02-12  96=
69  			__cpumask_clear_cpu(env.dst_cpu, env.cpus);
7aff2e3a56b724 kernel/sched/fair.c Vladimir Davydov          2013-09-15  96=
70  =

78feefc512a091 kernel/sched/fair.c Michael Wang              2012-08-06  96=
71  			env.dst_rq	 =3D cpu_rq(env.new_dst_cpu);
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
72  			env.dst_cpu	 =3D env.new_dst_cpu;
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  96=
73  			env.flags	&=3D ~LBF_DST_PINNED;
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
74  			env.loop	 =3D 0;
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
75  			env.loop_break	 =3D sched_nr_migrate_break;
e02e60c109ca70 kernel/sched/fair.c Joonsoo Kim               2013-04-23  96=
76  =

88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
77  			/*
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
78  			 * Go back to "more_balance" rather than "redo" since we
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
79  			 * need to continue with same src_cpu.
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
80  			 */
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
81  			goto more_balance;
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  96=
82  		}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
83  =

6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  96=
84  		/*
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  96=
85  		 * We failed to reach balance because of affinity.
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  96=
86  		 */
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  96=
87  		if (sd_parent) {
63b2ca30bdb3db kernel/sched/fair.c Nicolas Pitre             2014-05-26  96=
88  			int *group_imbalance =3D &sd_parent->groups->sgc->imbalance;
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  96=
89  =

afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  96=
90  			if ((env.flags & LBF_SOME_PINNED) && env.imbalance > 0)
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  96=
91  				*group_imbalance =3D 1;
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  96=
92  		}
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  96=
93  =

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  96=
94  		/* All tasks on this runqueue were pinned by CPU affinity */
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  96=
95  		if (unlikely(env.flags & LBF_ALL_PINNED)) {
c89d92eddfad11 kernel/sched/fair.c Viresh Kumar              2019-02-12  96=
96  			__cpumask_clear_cpu(cpu_of(busiest), cpus);
65a4433aebe36c kernel/sched/fair.c Jeffrey Hugo              2017-06-07  96=
97  			/*
65a4433aebe36c kernel/sched/fair.c Jeffrey Hugo              2017-06-07  96=
98  			 * Attempting to continue load balancing at the current
65a4433aebe36c kernel/sched/fair.c Jeffrey Hugo              2017-06-07  96=
99  			 * sched_domain level only makes sense if there are
65a4433aebe36c kernel/sched/fair.c Jeffrey Hugo              2017-06-07  97=
00  			 * active CPUs remaining as possible busiest CPUs to
65a4433aebe36c kernel/sched/fair.c Jeffrey Hugo              2017-06-07  97=
01  			 * pull load from which are not contained within the
65a4433aebe36c kernel/sched/fair.c Jeffrey Hugo              2017-06-07  97=
02  			 * destination group that is receiving any migrated
65a4433aebe36c kernel/sched/fair.c Jeffrey Hugo              2017-06-07  97=
03  			 * load.
65a4433aebe36c kernel/sched/fair.c Jeffrey Hugo              2017-06-07  97=
04  			 */
65a4433aebe36c kernel/sched/fair.c Jeffrey Hugo              2017-06-07  97=
05  			if (!cpumask_subset(cpus, env.dst_grpmask)) {
bbf18b19495942 kernel/sched/fair.c Prashanth Nageshappa      2012-06-19  97=
06  				env.loop =3D 0;
bbf18b19495942 kernel/sched/fair.c Prashanth Nageshappa      2012-06-19  97=
07  				env.loop_break =3D sched_nr_migrate_break;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
08  				goto redo;
bbf18b19495942 kernel/sched/fair.c Prashanth Nageshappa      2012-06-19  97=
09  			}
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
10  			goto out_all_pinned;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
11  		}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
12  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
13  =

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
14  	if (!ld_moved) {
ae92882e5646d8 kernel/sched/fair.c Josh Poimboeuf            2016-06-17  97=
15  		schedstat_inc(sd->lb_failed[idle]);
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  97=
16  		/*
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  97=
17  		 * Increment the failure counter only on periodic balance.
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  97=
18  		 * We do not want newidle balance, which can be very
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  97=
19  		 * frequent, pollute the failure counter causing
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  97=
20  		 * excessive cache_hot migrations and active balances.
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  97=
21  		 */
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  97=
22  		if (idle !=3D CPU_NEWLY_IDLE)
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
23  			sd->nr_balance_failed++;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
24  =

bd939f45da24e2 kernel/sched/fair.c Peter Zijlstra            2012-05-02  97=
25  		if (need_active_balance(&env)) {
8a8c69c3277886 kernel/sched/fair.c Peter Zijlstra            2016-10-04  97=
26  			unsigned long flags;
8a8c69c3277886 kernel/sched/fair.c Peter Zijlstra            2016-10-04  97=
27  =

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
28  			raw_spin_lock_irqsave(&busiest->lock, flags);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
29  =

97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  97=
30  			/*
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  97=
31  			 * Don't kick the active_load_balance_cpu_stop,
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  97=
32  			 * if the curr task on busiest CPU can't be
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  97=
33  			 * moved to this_cpu:
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
34  			 */
3bd3706251ee8a kernel/sched/fair.c Sebastian Andrzej Siewior 2019-04-23  97=
35  			if (!cpumask_test_cpu(this_cpu, busiest->curr->cpus_ptr)) {
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
36  				raw_spin_unlock_irqrestore(&busiest->lock,
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
37  							    flags);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
38  				goto out_one_pinned;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
39  			}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
40  =

8a41dfcda7a32e kernel/sched/fair.c Vincent Guittot           2021-01-07  97=
41  			/* Record that we found at least one task that could run on this_cpu=
 */
8a41dfcda7a32e kernel/sched/fair.c Vincent Guittot           2021-01-07  97=
42  			env.flags &=3D ~LBF_ALL_PINNED;
8a41dfcda7a32e kernel/sched/fair.c Vincent Guittot           2021-01-07  97=
43  =

969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  97=
44  			/*
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  97=
45  			 * ->active_balance synchronizes accesses to
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  97=
46  			 * ->active_balance_work.  Once set, it's cleared
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  97=
47  			 * only after active load balance is finished.
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  97=
48  			 */
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
49  			if (!busiest->active_balance) {
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
50  				busiest->active_balance =3D 1;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
51  				busiest->push_cpu =3D this_cpu;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
52  				active_balance =3D 1;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
53  			}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
54  			raw_spin_unlock_irqrestore(&busiest->lock, flags);
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  97=
55  =

bd939f45da24e2 kernel/sched/fair.c Peter Zijlstra            2012-05-02  97=
56  			if (active_balance) {
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  97=
57  				stop_one_cpu_nowait(cpu_of(busiest),
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  97=
58  					active_load_balance_cpu_stop, busiest,
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  97=
59  					&busiest->active_balance_work);
bd939f45da24e2 kernel/sched/fair.c Peter Zijlstra            2012-05-02  97=
60  			}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
61  =

d02c071183e1c0 kernel/sched/fair.c Srikar Dronamraju         2016-03-23  97=
62  			/* We've kicked active balancing, force task migration. */
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
63  			sd->nr_balance_failed =3D sd->cache_nice_tries+1;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
64  		}
e9b9734b74656a kernel/sched/fair.c Vincent Guittot           2021-01-07  97=
65  	} else {
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
66  		sd->nr_balance_failed =3D 0;
e9b9734b74656a kernel/sched/fair.c Vincent Guittot           2021-01-07  97=
67  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
68  =

e9b9734b74656a kernel/sched/fair.c Vincent Guittot           2021-01-07  97=
69  	if (likely(!active_balance) || need_active_balance(&env)) {
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
70  		/* We were unbalanced, so reset the balancing interval */
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
71  		sd->balance_interval =3D sd->min_interval;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
72  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
73  =

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
74  	goto out;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
75  =

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
76  out_balanced:
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
77  	/*
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
78  	 * We reach balance although we may have faced some affinity
f6cad8df6b30a5 kernel/sched/fair.c Vincent Guittot           2019-07-01  97=
79  	 * constraints. Clear the imbalance flag only if other tasks got
f6cad8df6b30a5 kernel/sched/fair.c Vincent Guittot           2019-07-01  97=
80  	 * a chance to move and fix the imbalance.
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
81  	 */
f6cad8df6b30a5 kernel/sched/fair.c Vincent Guittot           2019-07-01  97=
82  	if (sd_parent && !(env.flags & LBF_ALL_PINNED)) {
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
83  		int *group_imbalance =3D &sd_parent->groups->sgc->imbalance;
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
84  =

afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
85  		if (*group_imbalance)
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
86  			*group_imbalance =3D 0;
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
87  	}
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
88  =

afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
89  out_all_pinned:
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
90  	/*
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
91  	 * We reach balance because all tasks are pinned at this level so
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
92  	 * we can't migrate them. Let the imbalance flag set so parent level
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
93  	 * can try to migrate them.
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  97=
94  	 */
ae92882e5646d8 kernel/sched/fair.c Josh Poimboeuf            2016-06-17  97=
95  	schedstat_inc(sd->lb_balanced[idle]);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
96  =

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
97  	sd->nr_balance_failed =3D 0;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
98  =

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  97=
99  out_one_pinned:
3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  98=
00  	ld_moved =3D 0;
3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  98=
01  =

3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  98=
02  	/*
5ba553eff0c3a7 kernel/sched/fair.c Peter Zijlstra            2019-05-29  98=
03  	 * newidle_balance() disregards balance intervals, so we could
5ba553eff0c3a7 kernel/sched/fair.c Peter Zijlstra            2019-05-29  98=
04  	 * repeatedly reach this code, which would lead to balance_interval
5ba553eff0c3a7 kernel/sched/fair.c Peter Zijlstra            2019-05-29  98=
05  	 * skyrocketting in a short amount of time. Skip the balance_interval
5ba553eff0c3a7 kernel/sched/fair.c Peter Zijlstra            2019-05-29  98=
06  	 * increase logic to avoid that.
3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  98=
07  	 */
3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  98=
08  	if (env.idle =3D=3D CPU_NEWLY_IDLE)
3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  98=
09  		goto out;
3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  98=
10  =

1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  98=
11  	/* tune up the balancing interval */
47b7aee14fd7e4 kernel/sched/fair.c Valentin Schneider        2018-09-26  98=
12  	if ((env.flags & LBF_ALL_PINNED &&
5b54b56be5b540 kernel/sched/fair.c Peter Zijlstra            2011-09-22  98=
13  	     sd->balance_interval < MAX_PINNED_INTERVAL) ||
47b7aee14fd7e4 kernel/sched/fair.c Valentin Schneider        2018-09-26  98=
14  	    sd->balance_interval < sd->max_interval)
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  98=
15  		sd->balance_interval *=3D 2;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  98=
16  out:
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  98=
17  	return ld_moved;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  98=
18  }
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  98=
19  =


:::::: The code at line 9551 was first introduced by commit
:::::: 1e3c88bdeb1260edc341e45c9fb8efd182a5c511 sched: Move load balance co=
de into sched_fair.c

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2721919472180909305==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2721919472180909305==--

