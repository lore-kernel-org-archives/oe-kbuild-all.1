Content-Type: multipart/mixed; boundary="===============0005090440554414153=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [vincent.guittot:sched/pelt 3/4] kernel/sched/debug.c:949:6: error: 'struct sched_entity' has no member named 'runnable_weight'
Date: Sat, 08 Feb 2020 02:19:01 +0800
Message-ID: <202002080256.AEqCLVjY%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0005090440554414153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git sched/pelt
head:   72e466a4097a9efd0972ed8b5a8e0a07b2740e98
commit: c761852dbba8229856b6e86f421292cf75e5ab73 [3/4] sched/fair: replace =
runnable load average by runnable average
config: xtensa-common_defconfig (attached as .config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout c761852dbba8229856b6e86f421292cf75e5ab73
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dxtensa =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   kernel/sched/debug.c: In function 'proc_sched_show_task':
>> kernel/sched/debug.c:949:6: error: 'struct sched_entity' has no member n=
amed 'runnable_weight'
     P(se.runnable_weight);
         ^
   kernel/sched/debug.c:20:17: note: in definition of macro 'SEQ_printf'
      seq_printf(m, x);  \
                    ^
>> kernel/sched/debug.c:949:2: note: in expansion of macro 'P'
     P(se.runnable_weight);
     ^
   In file included from include/linux/kernel.h:15:0,
                    from include/asm-generic/bug.h:19,
                    from ./arch/xtensa/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/xtensa/include/asm/current.h:18,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/debug.c:9:
>> kernel/sched/debug.c:949:6: error: 'struct sched_entity' has no member n=
amed 'runnable_weight'
     P(se.runnable_weight);
         ^
   include/linux/printk.h:317:26: note: in definition of macro 'pr_cont'
     printk(KERN_CONT fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~
>> kernel/sched/debug.c:875:2: note: in expansion of macro 'SEQ_printf'
     SEQ_printf(m, "%-45s:%21Ld\n", #F, (long long)p->F)
     ^~~~~~~~~~
>> kernel/sched/debug.c:949:2: note: in expansion of macro 'P'
     P(se.runnable_weight);
     ^

vim +949 kernel/sched/debug.c

b32e86b4301e345 kernel/sched/debug.c Ingo Molnar       2013-10-07  861  =

74dc3384fc7983b kernel/sched/debug.c Aleksa Sarai      2017-08-06  862  voi=
d proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
74dc3384fc7983b kernel/sched/debug.c Aleksa Sarai      2017-08-06  863  			=
			  struct seq_file *m)
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  864  {
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  865  	un=
signed long nr_switches;
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  866  =

74dc3384fc7983b kernel/sched/debug.c Aleksa Sarai      2017-08-06  867  	SE=
Q_printf(m, "%s (%d, #threads: %d)\n", p->comm, task_pid_nr_ns(p, ns),
5089a9768041206 kernel/sched_debug.c Oleg Nesterov     2010-05-26  868  			=
			get_nr_threads(p));
2d92f22784b7b88 kernel/sched_debug.c Ingo Molnar       2007-10-15  869  	SE=
Q_printf(m,
add332a1523a09c kernel/sched/debug.c Kamalesh Babulal  2013-06-27  870  		"=
---------------------------------------------------------"
add332a1523a09c kernel/sched/debug.c Kamalesh Babulal  2013-06-27  871  		"=
----------\n");
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  872  #de=
fine __P(F) \
add332a1523a09c kernel/sched/debug.c Kamalesh Babulal  2013-06-27  873  	SE=
Q_printf(m, "%-45s:%21Ld\n", #F, (long long)F)
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  874  #de=
fine P(F) \
add332a1523a09c kernel/sched/debug.c Kamalesh Babulal  2013-06-27 @875  	SE=
Q_printf(m, "%-45s:%21Ld\n", #F, (long long)p->F)
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  876  #de=
fine P_SCHEDSTAT(F) \
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  877  	SE=
Q_printf(m, "%-45s:%21Ld\n", #F, (long long)schedstat_val(p->F))
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  878  #de=
fine __PN(F) \
add332a1523a09c kernel/sched/debug.c Kamalesh Babulal  2013-06-27  879  	SE=
Q_printf(m, "%-45s:%14Ld.%06ld\n", #F, SPLIT_NS((long long)F))
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar       2007-10-15  880  #de=
fine PN(F) \
add332a1523a09c kernel/sched/debug.c Kamalesh Babulal  2013-06-27  881  	SE=
Q_printf(m, "%-45s:%14Ld.%06ld\n", #F, SPLIT_NS((long long)p->F))
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  882  #de=
fine PN_SCHEDSTAT(F) \
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  883  	SE=
Q_printf(m, "%-45s:%14Ld.%06ld\n", #F, SPLIT_NS((long long)schedstat_val(p-=
>F)))
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  884  =

ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar       2007-10-15  885  	PN=
(se.exec_start);
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar       2007-10-15  886  	PN=
(se.vruntime);
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar       2007-10-15  887  	PN=
(se.sum_exec_runtime);
6cfb0d5d06bea2b kernel/sched_debug.c Ingo Molnar       2007-08-02  888  =

cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  889  	nr=
_switches =3D p->nvcsw + p->nivcsw;
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  890  =

cb2517653fccaf9 kernel/sched/debug.c Mel Gorman        2016-02-05  891  	P(=
se.nr_migrations);
cb2517653fccaf9 kernel/sched/debug.c Mel Gorman        2016-02-05  892  =

cb2517653fccaf9 kernel/sched/debug.c Mel Gorman        2016-02-05  893  	if=
 (schedstat_enabled()) {
cb2517653fccaf9 kernel/sched/debug.c Mel Gorman        2016-02-05  894  		u=
64 avg_atom, avg_per_cpu;
cb2517653fccaf9 kernel/sched/debug.c Mel Gorman        2016-02-05  895  =

4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  896  		P=
N_SCHEDSTAT(se.statistics.sum_sleep_runtime);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  897  		P=
N_SCHEDSTAT(se.statistics.wait_start);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  898  		P=
N_SCHEDSTAT(se.statistics.sleep_start);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  899  		P=
N_SCHEDSTAT(se.statistics.block_start);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  900  		P=
N_SCHEDSTAT(se.statistics.sleep_max);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  901  		P=
N_SCHEDSTAT(se.statistics.block_max);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  902  		P=
N_SCHEDSTAT(se.statistics.exec_max);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  903  		P=
N_SCHEDSTAT(se.statistics.slice_max);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  904  		P=
N_SCHEDSTAT(se.statistics.wait_max);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  905  		P=
N_SCHEDSTAT(se.statistics.wait_sum);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  906  		P=
_SCHEDSTAT(se.statistics.wait_count);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  907  		P=
N_SCHEDSTAT(se.statistics.iowait_sum);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  908  		P=
_SCHEDSTAT(se.statistics.iowait_count);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  909  		P=
_SCHEDSTAT(se.statistics.nr_migrations_cold);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  910  		P=
_SCHEDSTAT(se.statistics.nr_failed_migrations_affine);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  911  		P=
_SCHEDSTAT(se.statistics.nr_failed_migrations_running);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  912  		P=
_SCHEDSTAT(se.statistics.nr_failed_migrations_hot);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  913  		P=
_SCHEDSTAT(se.statistics.nr_forced_migrations);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  914  		P=
_SCHEDSTAT(se.statistics.nr_wakeups);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  915  		P=
_SCHEDSTAT(se.statistics.nr_wakeups_sync);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  916  		P=
_SCHEDSTAT(se.statistics.nr_wakeups_migrate);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  917  		P=
_SCHEDSTAT(se.statistics.nr_wakeups_local);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  918  		P=
_SCHEDSTAT(se.statistics.nr_wakeups_remote);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  919  		P=
_SCHEDSTAT(se.statistics.nr_wakeups_affine);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  920  		P=
_SCHEDSTAT(se.statistics.nr_wakeups_affine_attempts);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  921  		P=
_SCHEDSTAT(se.statistics.nr_wakeups_passive);
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  922  		P=
_SCHEDSTAT(se.statistics.nr_wakeups_idle);
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  923  =

cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  924  		a=
vg_atom =3D p->se.sum_exec_runtime;
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  925  		i=
f (nr_switches)
b0ab99e7736af88 kernel/sched/debug.c Mateusz Guzik     2014-06-14  926  			=
avg_atom =3D div64_ul(avg_atom, nr_switches);
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  927  		e=
lse
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  928  			=
avg_atom =3D -1LL;
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  929  =

cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  930  		a=
vg_per_cpu =3D p->se.sum_exec_runtime;
c1a89740da168d3 kernel/sched_debug.c Ingo Molnar       2007-11-28  931  		i=
f (p->se.nr_migrations) {
6f6d6a1a6a13364 kernel/sched_debug.c Roman Zippel      2008-05-01  932  			=
avg_per_cpu =3D div64_u64(avg_per_cpu,
c1a89740da168d3 kernel/sched_debug.c Ingo Molnar       2007-11-28  933  			=
			p->se.nr_migrations);
c1a89740da168d3 kernel/sched_debug.c Ingo Molnar       2007-11-28  934  		}=
 else {
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  935  			=
avg_per_cpu =3D -1LL;
c1a89740da168d3 kernel/sched_debug.c Ingo Molnar       2007-11-28  936  		}
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  937  =

cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  938  		_=
_PN(avg_atom);
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  939  		_=
_PN(avg_per_cpu);
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  940  	}
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  941  =

cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  942  	__=
P(nr_switches);
add332a1523a09c kernel/sched/debug.c Kamalesh Babulal  2013-06-27  943  	SE=
Q_printf(m, "%-45s:%21Ld\n",
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  944  		 =
  "nr_voluntary_switches", (long long)p->nvcsw);
add332a1523a09c kernel/sched/debug.c Kamalesh Babulal  2013-06-27  945  	SE=
Q_printf(m, "%-45s:%21Ld\n",
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  946  		 =
  "nr_involuntary_switches", (long long)p->nivcsw);
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  947  =

43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  948  	P(=
se.load.weight);
1ea6c46a23f1213 kernel/sched/debug.c Peter Zijlstra    2017-05-06 @949  	P(=
se.runnable_weight);
333bb864f192015 kernel/sched/debug.c Alex Shi          2013-06-28  950  #if=
def CONFIG_SMP
9d89c257dfb9c51 kernel/sched/debug.c Yuyang Du         2015-07-15  951  	P(=
se.avg.load_sum);
c761852dbba8229 kernel/sched/debug.c Vincent Guittot   2020-01-29  952  	P(=
se.avg.runnable_sum);
9d89c257dfb9c51 kernel/sched/debug.c Yuyang Du         2015-07-15  953  	P(=
se.avg.util_sum);
9d89c257dfb9c51 kernel/sched/debug.c Yuyang Du         2015-07-15  954  	P(=
se.avg.load_avg);
c761852dbba8229 kernel/sched/debug.c Vincent Guittot   2020-01-29  955  	P(=
se.avg.runnable_avg);
9d89c257dfb9c51 kernel/sched/debug.c Yuyang Du         2015-07-15  956  	P(=
se.avg.util_avg);
9d89c257dfb9c51 kernel/sched/debug.c Yuyang Du         2015-07-15  957  	P(=
se.avg.last_update_time);
7f65ea42eb00bc9 kernel/sched/debug.c Patrick Bellasi   2018-03-09  958  	P(=
se.avg.util_est.ewma);
7f65ea42eb00bc9 kernel/sched/debug.c Patrick Bellasi   2018-03-09  959  	P(=
se.avg.util_est.enqueued);
939fd731eb88a0c kernel/sched/debug.c Kamalesh Babulal  2013-06-25  960  #en=
dif
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  961  	P(=
policy);
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  962  	P(=
prio);
1da1843f9f0334e kernel/sched/debug.c Viresh Kumar      2018-11-05  963  	if=
 (task_has_dl_policy(p)) {
59f8c2989283bbd kernel/sched/debug.c Tommaso Cucinotta 2016-10-26  964  		P=
(dl.runtime);
59f8c2989283bbd kernel/sched/debug.c Tommaso Cucinotta 2016-10-26  965  		P=
(dl.deadline);
59f8c2989283bbd kernel/sched/debug.c Tommaso Cucinotta 2016-10-26  966  	}
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  967  #un=
def PN_SCHEDSTAT
ef83a5714d9a817 kernel/sched_debug.c Ingo Molnar       2007-10-15  968  #un=
def PN
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  969  #un=
def __PN
4fa8d299b43a91f kernel/sched/debug.c Josh Poimboeuf    2016-06-17  970  #un=
def P_SCHEDSTAT
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  971  #un=
def P
cc367732ff0b1c6 kernel/sched_debug.c Ingo Molnar       2007-10-15  972  #un=
def __P
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  973  =

43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  974  	{
29d7b90c1503574 kernel/sched_debug.c Ingo Molnar       2008-11-16  975  		u=
nsigned int this_cpu =3D raw_smp_processor_id();
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  976  		u=
64 t0, t1;
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  977  =

29d7b90c1503574 kernel/sched_debug.c Ingo Molnar       2008-11-16  978  		t=
0 =3D cpu_clock(this_cpu);
29d7b90c1503574 kernel/sched_debug.c Ingo Molnar       2008-11-16  979  		t=
1 =3D cpu_clock(this_cpu);
add332a1523a09c kernel/sched/debug.c Kamalesh Babulal  2013-06-27  980  		S=
EQ_printf(m, "%-45s:%21Ld\n",
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  981  			=
   "clock-delta", (long long)(t1-t0));
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  982  	}
b32e86b4301e345 kernel/sched/debug.c Ingo Molnar       2013-10-07  983  =

b32e86b4301e345 kernel/sched/debug.c Ingo Molnar       2013-10-07  984  	sc=
hed_show_numa(p, m);
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  985  }
43ae34cb4cd650d kernel/sched_debug.c Ingo Molnar       2007-07-09  986  =


:::::: The code at line 949 was first introduced by commit
:::::: 1ea6c46a23f1213d1972bfae220db5c165e27bba sched/fair: Propagate an ef=
fective runnable_load_avg

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0005090440554414153==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICLSkPV4AAy5jb25maWcAnDxtj9s2k9/7K4QUOLTApVl7N+nmHixwNEVZfCyJWpHyS74Izq42
Nbpr79netvn3N6Qkm5SHdvAUbWNxhkNyOJw3DvPzTz8H5G2/eVnuVw/L5+fvwbd6XW+X+/oxeFo9
1/8KQhFkQgUs5Oo3QE5W67d/Pvyzr9e7ZfDxt4+/Xb3fPlwHk3q7rp8Dulk/rb69Qf/VZv3Tzz/B
vz9D48srkNr+T9B0e/+sabz/9vAQ/DKm9Nfgd00GUKnIIj6uKK24rABy971rgo9qygrJRXb3+9XH
q6sDbkKy8QF0ZZGIiayITKuxUOJIyALwLOEZOwHNSJFVKVmMWFVmPOOKk4R/YeERkRf31UwUk2PL
qORJqHjKKjZXZJSwSopCAdysf2w4+hzs6v3b63GZo0JMWFaJrJJpblGHISuWTStSjKuEp1zdXQ81
F9tZijTnMIBiUgWrXbDe7DXhrnciKEk6drx7hzVXpLQ5YuZeSZIoCz9kESkTVcVCqoyk7O7dL+vN
uv71gCBnxJqzXMgpz+lJg/6TqgTaD/PPheTzKr0vWcmQ+dNCSFmlLBXFoiJKERrbvUvJEj6y+x1A
pAQJtSGG97BXwe7t6+77bl+/HHk/ZhkrODVbKWMxczc3FCnhmRm3Xj8Gm6cemT4VCuydsCnLlOz2
XK1e6u0OGzr+UuXQS4Sc2ivLhIbwMGHo6gwYhcR8HFcFk5WWv0K6OO30T2bTTSYvGEtzBeTNSTju
Uts+FUmZKVIs0KFbrBOm07z8oJa7P4M9jBssYQ67/XK/C5YPD5u39X61/nZkh+J0UkGHilAqYCye
je2J6O0wB+sIRqRmJEOYjKAMZAcQlU2hD6um1+hiFJETqYiS+FIlRzn7A0s1LCloGchTYYD1LCqA
2ROGT1AjICPY+ZYNst1ddv3bKblDWaycND/Q9fFJzEjYk5+D8tBaIoKDwiN1N7g5Cg/P1ARUR8T6
ONf9IyJpzMLmoHRHRD78UT++gV0Inurl/m1b70xzuwoEainBcSHKHJurVlYyJ7DbRy6VSlaZ9a0V
k/m21UoBTQi9nIdO34ypXl9YGJ3kAlihT6ESBX6AGwZo1WvmjuMsZCRB98K5okSxEEUqWELw4zhK
JtB5aixIEWLKlVYih9ME5qyKRKH1EPyRkow6h7+PJuEHJoqdbu+GzyObileEUzAsXHPcMRewcE2Q
JBbFKCYZKMRjQ2M8GkVntRo5tC3a+PjBkghsZmERGREJ6yqdgUrF5r1P2HqLSi5sfMnHGUmi0D6J
MCe7wZgDu0HGYNWOn4RbNpiLqiwazdeBwymHabYssRYLREakKLjNvolGWaSOWHZtFfyJbMIBbLih
ZUrxqSMFsJ3d8Ki06R00TkKEyynMk4Uhw+QwJlNmhK86GM1uK3UjUK6mKYwraKcrWvcyr7dPm+3L
cv1QB+yveg2KloC6oFrVgoFrjI9FqSGPKu4fpNhNbJo2xCpjhRzxk0k5gnPnSJ320ogCF29is1Qm
ZIQdJCBgkyMj2OVizDovrE+iisDuJlyCwoHzIVJclziIMSlC0MT4Tsm4jCJwKXMCYxq2E1BjHosv
Ip70jPCBp66j2y1orlgmieXLtyYhnjFwXdQREH+5Gxw9e20qQBVWsszzxpnupgtO4UQVoONPYU0z
OA1RQsbyFJ6mpX1sJAHnOyahmFUiiiRTd1f/fKpvrvQ/jeDl281DvdtttsH++2tj4C1r5aywmpKC
ExCRSDqKsAcN6fB6iLuwCOY1/RFMWoLhSRHR6uE1rvzT7undCakSFBpoNbBR+mCjg0YEJKlVCW23
y3gSopUEFMwYxBB3L4zxJSOOifsBpmldQayU4KavhwdiOmKoiJ7bz2bDn5d7rRGCzauOYR2d0rIq
B2Wp7SZEqdh6+lhzNQRxQiTCwojyMcG8jw4jK7RQy7vr3iDacW6cqsGnk6gENnRUgB8BjAWXwVJO
aagj32okRHLSevfuAVa9ea7v9vvv8uq/r2/hOASr17uvm83+NdjC/+/WTzDTp535/QH49OFls94v
/1qB6/vhdbv58Fj/9edq3yYJPphov/paf9gvt9/qffBSv7wsX+8Gw9v0f6/eOXsIpxDjAimkma2C
XyTt2QQgt9l+D56X3zdv++OZnLAiYwloEQJeVxiCaybhcD/CTlxfHZXMlFFQdfJ4+q96CF0gDGZX
K56iw7mycNq9mEhmFEw1HdqbreMz6I2sC3YWlFVK5tUXCL8EaOjibjCwZLUvio2Abv4Gpxgs1vJb
/QIGCxPUPMWF39fVSVMstw9/rPb1gz4U7x/rV+jsDmNbcdFYBMdz+HeZ5hWYH4Y5HqYXKWjc6OpY
CMtzM8AwBbkWEOqNS1FadtZ00hmaMqPEeNPA8BRscg8FtCtXekcr1aNMk/5YpsNxvj1KM60zdbTQ
SGCXVnFJGHMEXFBGlE7SSS64C7RtU4b07XWSqhC2c2jGRSJjy86JsEyYNGdKe8DawbO8rHGTpErA
pQHfcujQZXPgnooLCAetxSRCKwyY1Qw8CXni6DQ819M5JL2omL7/utzVj8GfzUEFzfC0em6C/6PL
cAbtqAXLMc9MLopSnaQ6cTguiGxHqIBzrF17Ozg0/q/U3uYxe9hyz5bppqk9slqpoGaoxSqzcxit
GOF5hpYCxPSHbJ3H/+4wPQF9C9b7o3XfORzt8s2qFKwZyNAxgq54qp0nvGuZgWjBCVykI5HgKKrg
aYc30bEGlrhpEwJWBCup5CCv9yUE0y5Ex7Yj6aSHrGZfXvAYFSs2Lrg6HztrTYzvnMboLKfRB7iT
pNFmI+WFaW6InDh72uj15Xa/0vIaKPBMXHUOdocrIwzhVEfrWFCVylDII6oViUbcaT6ag96INq/T
+yqnvDvMXBzzMZYFACQumsRGCOrCTadbwMliZMLVY7apBYyie9RQueMdM+OG+eBRZuaI0YlWgnbm
3MC15mrh52Bo3xkICPN1toFub2MttK41ae3QTFFj9a2XhVLMOgTDYfZP/fC2X359rs21S2CC0r3F
6xHPolRpZe7kNtzUhv6qQm3OOr9FK/82s2cdpoaWpAXP1UkzKALqktQUbcHxTdasJG38sRRzUDrH
B9xaJxmiG8A0hsz4WalztZAnYFlyZZgO7q68u3FsD3WFPeVjcHmdpikHva9ENSrdBInEfLKDvweT
AGKZ8R3vbq4+H9zrjMHu5RBuaN97kjqJs4SRxjfB4yKw4kpfnKBQmuLR1Jcc3HQcMipxVfVFNtkT
PNMbdqG+dsAmJ7H8MX+iF+jPiI/LvBqxjMYpKSboKfZLgpVN7Q5AVu//3mz/BLuPOrQwU4YlE8uM
W4k7/QVi7WyKaQs5wZepPMZrHkHU5Y2EdRZ4whbIfHizpO4rb7KdlEi3tdPjVSHAIXF1Y15FfKSt
Jzvlfo9uri8CtSvnZLcboi0GUTECA+diJCRDIDQh4AeEDiTP8v53Fcb0tNHEaCetBSly56qLaa+a
48egAY61HmNpOcdFGJZvZuvJomegGsSEM3xrmxGminuhkSjxcTWQxH4YOE5+IAQSoLA8MmMk1LY4
0KRo3jW7lMow90u0wSjI7AKGhgKLdWiBe0R6dPg5PudzHHBoOeKW0ei0aAe/e/fw9nX18M6lnoYf
fd4r7M8n3/boq3dwo+ip3unh5PHChCRwitLcp+cAGeJX5fPm8jNAEMOQUs+O56CHFA6DAArnOEgI
frWt8BxvMvSMMCp4OMbubEyEZ7bfZGQdqQ896bxpQrLq9mo4uEfBIaMZw/3dJKFDz4JIgu/dfPgR
J0Vy3L3PY+EbnjPG9Lw/3mAXhUw1d3KdAbp/q99qMD8fWs/TuaVusSs6ur976TfGagSNDi9NcySp
f2B9ayWwbkZt35/pCP4Y1k9G2N3CEYpMXLH7BGkdRRh9OvKrUw2Hc3QWrohe8ZkpjpuF9VpDqc85
NiH4k+Hn4tC38Jtvw+r7/pROuToZXcShsZh4qjZajPt+nNOnAK4v7uN1GNH9DyBRcmEeF6YRx+e3
MOfnyetEzfkNaezCacHI83K3Wz2tHrq6MasfTWRfU0GTzttw3/HScEV5FrK5K1AaYByHm9P2aHba
Vl4Pbclrm8zdIu7Dtwh909SfgpzmyMSg9VNf0M3MEjHzstXwIvfvW0fgjCerUVKiaOxLNRnXxmCc
pQGx2JnjHfFI2BsZUk++BqwdMZkOFCxylk3ljPsmM5W6FssTs8BcIJKf+F2jNPfEA03dBz5kLM+o
GTPTkOGL0RjJNTBf341V57Ay6hYgWaBirkPbReWWKIzuk15oFezr3b5Lv1r984kaswyN4E569gB2
tGbxg6QFCT1Kk5IM33bchpMI1lf4/KKomlD0ZgUCqKJ0wqIZL1iiL4HseD0aa/9gcKqPOsC6rh93
wX4TfK1h6Trj8aizHUFKqEGwcmFti47ZdOI/Nhc7unTm7uo44oxDK+4URhN+5vh99iQNCPdoIpbH
lS8lmkU4P3MJjrKvAFFHMBEOS2aqzDKPcYoIT8TUVT+GyWH91+qhDsLt6i8nq9hUh1Cr+qb5OE6T
cqYz0yD1yN5rKJF56nQ3LdgF8wGWaxUpYWicMw6ariv4IeRjfZUXsco9zj0AqxQ99BpyX/JiInsr
aapQvNSkKj0+NAC5wJWPhoEH5IeBHcazULFQ2iHQWKfJbmh72Kz3282zLvF7PMhAKxm71bf1bLmt
DSLdwA/59vq62e7tu6NzaM0xXj7WurAHoLU1nC6EPSF2GfeQNsfnflgXWz++blbrvZO/Ak6xLDRl
gqimdToeSO3+Xu0f/sA55W7trLU0ilEvfT81mxglhafwkOS8p9WP98arh/YgB+I0e1c2pVMxS3KP
GwKmT6V5hJ1n0KdZSBLn3jQvGooRL9IZKVhTxN7Zu2i1fflbS8XzBjZ1a+WdZ+bqzi6dY3NVkAOd
5nKxj91Ul5yZ/RETv25r96A/r8PVgLl/07dPTrL9wBo40xDK8KmXdwaBTQtPwqtB0A8GWjIQQqbC
o7wMGpGLjHbI/mIaz86bTRi97YJHo+Gdsl672bJWAswH9RWdjTPf/aXCJVXgNjEnhTYbiIy1t3/Y
zWJWJon+wJ2WFkkrcilDmBDPr4dz3MJ3yGXqCVs7hEQIT1qnRQiLkf+O0kz6AlzOb8/CC4LPkIaF
SLXDSMMpPgIB70db+4op3Fk+DHFhioV02dh4stOUOZagv24NR70XAFR9r6fzZW2izRXWavfgCG93
kMo0XeibP08mimTKU42peJSa041CWUYTIUvQY6Boppx6znGcV+BKoSDp2zHb8Jy8GTpm3XRNJ3ir
YdQ3H93GD/snp7m1ZKAcUsecdksykOrzNZ1/Qrne62oNNfp9cHXCq+ZRTf3Pchfw9W6/fXsxtbq7
P0CfPgb77XK903SC59W6Dh5h/1av+qetev6D3qY7ed7X22VgSvSeOhX+uPl7rdV48LLRt9TBL9v6
/95W2xoGGNJfO0eGr/f1c5ByGvxXsK2fzas6hFlTkVc9Z/Z4FX6GhMVuGuOCoS9zwcBQXe1PcS/O
oBRKzr0YMRmRjFQEfwLjnBa3RCl06sLg82RLdbVH29niTCfVuhQkFaFNpCA81A/D+i+drC7oLLGB
HLWF8wZXUooUY5308B3oqNSlOyeL1QnpYHD9+Sb4BXyBegb//YrJA7gjTMerOO0WWGVCLnCROTeM
lTkAjcmdhzJZuybHDoosxB9dGW3ovPi4L81TSX82RDGPmoLoWV8zoDCee0HTuQ+ii2A9Hs7Yc2kC
c5Ae9Qdzh19SeGJjiH597dXUMNW8avT0nvpMZZakAidMiv6dSxM3rUC3rb6+aR0hG2efWJVxTvDQ
xVA/2OXgL6tYF9aqfkoW3PEQdMw1RcvQLQwSkhyCFLt/22Tqa6Oe2CMExsyVUKYG14P5hU4Jobp6
x31NKhNOBVrD7XRVrK2b6uZLWcY9GSl9WUgqJS8tIiVf7BoVB+ToO/i8HQwGXn8q15JwPbwwHJzM
THGCD1hQvF1vtXByDEQlvgu9ZOAF4GKvIT4mXtrNshCFc3/ZtIDfe3urq9XPdR4VEKqBmDpK7uYG
ncmIplqReKr5sjnODOqTDsXHIsNfn2pieNggF1KxtO9+2R19WffjgilxLfEow14bWH10h96rQFCP
vgvGQ6cpL1NUlihEz5I7+f+2qVK44BzAOL8OYHzjjuAp9qLAnhl4P868+mcb6QJ7wTNH/sIMrU6y
OoWuzjPWsEw4Vg9i99LXFc5AyRAPRWWZhf1E4yk9lpaJeel4FAU2vDh39oXGPEc3dizE2H6haYHi
kswYR0H8dvhxPsdBmWLOXxjABu6JdgBnILjW4WM8BQrtUzxrwOe+LgDwDHLjHR1XDP9OL+xbSoop
Sxy+pNPUd8ciJ2NPadRkccFSpDAKyYQjImkyv6n6N0RH2Ee/HwxQOTsLjmYX5sNp4crDRN7efhxA
X/y6YSK/3N7enMQyOGXRyvWhN6z995vrC+bH9JQsxWU7XRTObYX+Hlx5NiRiJMkuDJcR1Q521B5N
E+41ytvr2yF+MNqXSs2LtEqKi6pO11gU3HV/5NAjdtM5WnPkkitEJlJcYWTuGnkF9EDyM/D49DOf
qm+JTyncXn++crXscHJZErIpD7mjzs0zj7Dncp12FBNnxoAvLvCzqWOFlYx55j4wicElBGlEGbtg
OkMc8ewCcb258Atl7n0ixu7fOHKfkOu5J1d5n3idGKA5Z1nlA9+jhYL2REqdjkgd/+seGnSFAU6y
SC9ufBE6Sys+Xd1ccAMLpn11x7beQszsKefTICVwsS9uB58+XxoMdptIdGMKXa9QoCBJUjDrTv2n
1EanHwwgPRm7x0mKBIIs+M/x7aTnQhjaq0hv1wXJkxwUp0OQfh5eXQ8u9XJOAHx+9hh0AA0+X9hQ
mUpHBmRKPw9w6WY5pz6vQpP5PPB0NMCb4aWZCAoqk80VvgPK2A9nqioF2f+BXS0zV2Xk+SJlBDeE
WnI8Fw1Ul3hnHvPBywuTWGQih6DE8UpntJon494BPu2rWFwqR2c2LRd6uT14RXPwKnR1r/TUHKhe
WuiU5tRV+PBZFTHoZNywARTcL9hWhdX8W2Rn/EsvOdK0VLOPPoE7IFxfilybLL1NvM3bkzn3a88o
DD1ZXZ7nnowwOJZVkx3Ecw7xwldakueev9qmF+qYHFS82e3f71aPdVDKUZehNFh1/dhW2mhIV4ZE
Hpev+3p7miieNerH+jqmm9JGy2Mw5WSD4PNMAQVAP/p8CZdoar8jtkFW5gGBdoEoAupiIg+oAPXr
6AUhleeRUV5wmaL10DbRY7SBARk4S16eFqSNWDHYweRiQMlxgP1yxm5XHvwvi9C2tDbIZMFYZkL3
5v7KlHQFs5WuyvrltKjt/yu7kufGcV5/n7/C9R1ezVT1dCfO5jn0QZZkm7G2aPHSF5XHcaddncQp
J/lq+v31DwAli5QAZd6hFxMQRVJcABD44Q90/Xrd7QZvP2ouxgFjKVmnwxXa5kRrOOcZ1aiKmcdu
YQtLcIKfZdK6na5unl7e38SLFRUlhRmQhD/LyQSj79o+cpqGvoWSe6LmyCgmdh4KE08zhU6eqlWb
iRpcvO6OjwjHsUfgne+b1tVr9XyM0cS97biN1/0M/uIjemsLMMaz47LWenbur8ex5D9jdKG//Rli
4vWwUMSXEPKgGeLCnWWgOAtKe9USlUnytrrkL2Bnm+M9XX+qL/EAp5ThtpehomhJNViAf4u2S80B
e2qS8ZZUzQBnTT9D6vD+0Zpa2eT7qwBq2PJMb1eTumIdBbGwpKkT+t0BqG5fuPFsLn6ZFayn3I/N
cbPFg7DxUagFn9zAeVkYS9zV11cY8xllAUXIZiZnzdCUzZZGWbOn5QYBI4aFy0GMuvxrVCb52nhN
4E8ddy0Wamytr8Ora3vsnQBhM7QfmLC2ovhbLNlDymkmOGVoDCk4r/gH0fMnZyW+wKNr9SKP0e/L
jHtb6LjmRjL2F/OWv4++994d95tH4zSx++s7abB2zRuiijAaXp2xhQZsIKH3xTZKock5QaGBi08w
mTrzwSRa3rkmwV85KU+J0rJw0twI3zapKQKYhP6JhW23j+YrTwIxM4dC3g5OL8yHoxHjYHR4/hPp
UELfhwRS5oa+qgqbG6ics3pVHHZ8vlHILa6KfCvM14qcuW60EqRszVHteLe5M8UW/gvWD9lSwUCg
yWki761AnmRBGSQfvYO4VDQJ/FWXtfbisJdNpw7CAml70tSnXhKqUiNKpswHg21Nw+mZITinQg3w
qGLJdw9UcbxM5okUjSs7cOYu/El4NIJFhV9nqnzBWnIW6p4MZiN0P9IiyylQW7usdiWdocvNeCzm
XmmyG9wCbl0maJxZIuzes7Y7z0nPzDotT/JksH08bH9y7QdieX41Gmm4tM6zlSZQabYoh0ZSFLGh
Emzu7wlABaYkvfj1s+lb0W2P0RwVuXnKWy+miYol/XrJ35bqsARnIYAXEzX1M0FqPAU1JAF32s2W
oX0DQAWVWzHeoHS30c0bLFBOV8p82PVSBGC/uBEMcCeOxBf3es2iQCN3Qn6gap7Jzfno7Iq/2jN5
RsMJr/ifXpaPbnoZQDs8/6ufJXFHNxfX/f1Gnsthfz1R7pbonQEivOQ0fWJ18+vrEa+Emjw3N3zg
9YknccMb4bag5slUdnX1V389aEK9vAn5aWwzjS8+GM6Fcq5H17zn3oknP29FeDEso+FFP8tydHE9
vBHCY20mX+Ci7yXYapcYW+nFnCCdZWOEPc7UuCUrZJw3xtgNHZZ93IKX0X7O749v++/vz1sCgapU
DWbRhhMPZjccFvxQz3KXwoBcfpYFiVsqIVoTaZlAw7feOtG30g1j6aYbeeZ+mAQC2ho2PL+W5hGS
U8+9GArmfqRn4dWZ4No0Xl2ddT2V7afXmSv48CE5V7B/XVxcrco8cx2PPzOJ8S5cjXhEDCQvVqOr
1rKrnXP7PrEhHPjTIhBRf0HzlXuJ5sAaaLczw6bHzcuP/fa1a4JaTB2QKg3c46qAwianiPN0bqiB
XspLVlBeeknp2n6b2m0bHmECUMxizecmg9+d9/v9YeAeTvCwf3RSmTQ1/KsHdCTScfO0G/z9/v07
iGReN6BgMmY/GvuYjqrZbH8+7h9+vA3+ZxC4XtfA16ws19NYPn2GfAR0DBCEuYe1Dtzpf3OV6IWQ
Y9GD/uVx86uaZ6zH+9SpFSBO7KU4i44GahXDv0ERgpI7OuPpabzMvg6vDOH4g9adoprac9bYdOMi
8jozbaa87vyeKcuNE35iZDsoW2uE8/SjqeDPCYySOauYKRZNHaquMH9ru3b2stuinoQPdEwMyO9c
tn1hqdRNC84ZhWggHPqdB4q0df1odtcP5spES4UyFw7BdN0uA8UpWrfrduNi6vD7EZJDB6Geeegi
epw2JqFp7pqi9NqvhJGfxlGqBAMtsvghiIv8AU/kwOc9oIn4be53ujn1w7ESrFpEnwhbHxKhPrL1
ygxruStL0P2FQDMkL5S/7HgI2U1ba6g9kUGhG6kwGCrvzKZbZyxJGEDNlyqasde6eiQiRC/NW4oK
UAI3EdEviO5H8YKXLvQ8mypXNtprlgDdmnro6wlsr9zlPpJTX887e1VoJ7N4kreKY7zw604jQg3q
nwuRgHiGNDi7fd4KitTEiVB6DeKeeZr4uROsI16QIgZY5XhwiPQA3pLihBOi35AnFfETkJw5qq8b
lTuNTEeFM5DMwcQhBrBUVD9AQ5QUv4c8RZQEgoGKJoNkB8H1hhc6IGfLawSxkvLbeN37ilz1THfY
ETJJ7Sb6DO1HGrBEZCrwCCuTjNcHkGOlolBuxDc/jXu7gHe8bt+S0ypZORMAD+jsChLeiMYenqcb
G+OsP911gIoWz1xVBirPQfLwIzh5jOWM9CYTRXOcQ3ERJKptsDTIJ8jzmeu1HhWeMEB7kYns1y10
BSxPfvx6xXx/g2Dzi0cViOKEKly5vlqw49RTj93JqeNNBctTvk6EkCt8MEU5rgfrJwwFjQlOafEO
NfKXsOcLEHyOi3nC1FgFElC0gr8jNXYiASQhd7UszasrqEUv2gG+OnYrdMbFhMM+pVh8xNhnv0Lr
OaMrxcpTWSIliyokJ15Ey9XGam5WIlnFMMKRlbOsKpYCSOunQgY+Itxvj4fXw/e3wezXy+7452Lw
8L57feMwOj5ibV4IW2XXSF6PZw5HunAMTOPAmyj2qHaDeRWcPy+MWIg6sQBiUiSODcYcoplUJx2o
9KOnJ9DCXbIJk5KH/iYWCgnPYexcyxpbujOQ+qHs8H7csqF+LN1YNI4KxjEn/qsYs1o0O5iF+kHE
QbJ52GlAaAan5SNW4k13T4e33Quo09xuhIAVOUaM85cQzMO60pen1we2viTM6mnJ12g9qZUqePnv
GWXVG8TwjX7sX/4YvOJh8f2EgXHaZJ2nx8MDFGcHl/sWHFk/BxViKKbwWJeqzQLHw+Z+e3iSnmPp
2lK/Sr5MjrvdK2ziu8Hd4ajupEo+YiXe/edwJVXQoVW4m5tHaJrYdpZuquRumXcBhlaYQuKfTp3V
Q5Xf5MIt2I/PPXySDv7VLGheRbBTi0nq86AR/goji6VTLBYSbyoJkTLn5R1Ev5C2w2TZ9U5AiIst
9IzbhDs0o1kY3iC+iO6fKLMLnOsBc/OYzNZWjsxmV64yGiEDa8Zyw3IeRw4KDUORCy/ykpVTDkdR
iPeKAgaayYX1sTPEbqrxNKqaruADFwqIh6nTFQec5/vjYX9vjgKIHGncxtqqN4aK3RA1BD0J0U66
H3y2RBSMLbo+ct4OAkQZ+aWWbUNWLSl3q2yebOe7al6lYuGOKVCheLOPOrGrMYRYhippHy9A2T59
FYIU7HD641r7xsIJlIcZtSZZXw4QWNTDcsK3FWgXPbRLiZb6ChMuZhL9ViatZNJ0koktHec9r4tU
0PPoZCg/iRlOHU7M8FcoX0wsq1xdphPFlDGb8xVlY0oXaKdAQnexHNNIt+hmS/zITdeJaMQCDpCD
ea//SRbFuZoYxkyvXaB0QVklO22qdTSBfeddEQtgJOhvNsnEGaLJ4rBj7hGBhk7IoCe0yBWE3vZH
684iYzJcnED0iFuze3+mcfgFgaJwOTGrSWXxX9fXZ1KrCm/SIdXv4evWilScfZk4+Zcol96rM+UI
b13As+Kkz5nxrbcR/rX6YHvdvd8fKFdK05z6xACZtrQnPRXN2zduJrGdepcKKacHaBxKpxKzq3Nn
KvBSnzOfYqa8iZnPFJPxWhE3bWQ+Y1/Ff+RBYTp+Wp7oQYkrU+MbWC+MUyea+vJcdrwe2kSmzXpJ
aHES98Ke1oxlUs9TbuqEAim7K5xsJs3Pnt08VJjrRFrkYU/vE5l2F60ue6nXMjXte2nSkyx7nS3E
baFnuNPuBniy+mhvLnvG1UR6yv5NSRzN3xdW3AWVlI4rIPYimUemQFI7B9BptOK8jOy1Bz+5O78p
uS4n6JFouB9TytzWT2iH3RFtljCWexGliR05SSU9sVAELizNayXuFZ4jL1pZ0BAAuYtIISA+a64o
l3dfjXRVljRXeV9v34/7t1+cuW3ur4Vl6bsFygKlF/oZqTM5KCWSS6vm7SWyE5XsSXW6ZpIc3DhZ
N2mZ7QDQFptk78pBeUKeEEasi2Naiy9V0pamn44BDBRk4df/oAUJke8+/do8bT4h/t3L/vnT6+b7
DurZ33/C2J0HHNj/WClaf2yO97tnO7XTb0ausP3z/m2/edz/bwv+HxPZ61yYdd5MQ+THHJ+RHpdT
0wUxrmbGdNgir520qt2kVtpwpkeNi3Jrbpl7PsiaXQtosP/7uIF3Hg/vb/vnduq/Toqu+thROaLg
pmYWp1pRxuiyIld25gQQKDzFBejqW1wn6NajgaF1PjajFyBOuCoXVK3UPecdlfC5/PzMkxDLgazy
ouQi/YF2MWy14WKI4b+TNqalzRAo1x+vR8yjmiKgB2kWJ106Qo4pzQGfQKJeizWLBN5HLVBjepmA
y5m6PJKr9vYWxqjRDL8hLhF3vlQTwNx2TptOVpIffLsINTU7dx+We6GFOoapIkMH2WhfMubu6a5L
Yw8D04Rgk/C65CMuNykYFqSiVR5m/sxPrUTBSIItpSZQuj+bmvqtaY+FTsJgrNf0O2MBRQFCVHYX
FAxlqGByWFtZekfxlUydGcywVjPw0ImmwmettqDOhmJvxtufOgsElb4cYdP+SR7v90+7Vz77Hrwy
n5MXPC/JaTo65LAni1u5ZAWIFbXwgxMQ/43IcVcoP29iheDEzVC96dRwacjhKD5VTaGM59yAUr5a
+BB+mmKiW1NMEEeivrt5ATniz7f9024AWu725yuxbnX5kRs37SGvogmX9siPKAdziOEYoE+b+UYn
oBv45dJJo6/nZ8NL++MnpZOFZTufrmEncjyq2BGiiKpsoNAsWIDsrMPwsVB983Xe05bRRPcJZATK
RwtaXCcvTCPlWCzUHzh1g3VrqVKWbd1lginWqUobe4NJYXukm6RTMy99Z15n5+RNB//2O1q3XNXa
8XZ/vz884LFvwAj/ZuQAmSpSzs3csEZhk5WVvv3Xs3/OOS4dy9QddEkhGmesWxSVww6uplGVJb1z
I9fbrd+sl6OVwAQh0KVVrlhTmDtVZosxU1/H77WBcVt9REY5dylVEy8jYSIQGWYKuq0JF7z6LfH4
FmanIOYHxbhm41tKHFJqTp3CXg8ZhdM78+6XrCk9TdRib4G7Ht8ISqCsufzI01tIT30LPr6MPiJd
NJGU3LrXpvU5dzLTm6XKa0+lht9poz85/HTUD1CDv5535O1m1nQGYtYCXNdWPuQfxIeX10+DALSS
9xe9jGeb54eWAA2KIgr/MW88tuho4C/8JhG8JuK5Fxe5mccHHfNQvS4w03Iupy7QxHJWRAganfEf
aHnHBoAYNxR9fdUKbZ0t21p+1lSh0bQkCSxm8vvWegxTZfvb4MjMfb+dXFNrNeht0Owsv7+Cqkgx
cp8GT+9vu3928J/d2/bz589/NE0lKz/VPSUpp+s1laTx4mTN5yVmrAP71bMaUFItcn/VmzGD87Ro
sXxcyXKpmWDXiJeYjbevVcvMF451zUBdk7dHzaRlTHgffJgP6sIxRpm2lib5d9NbYYbnmKFA1CWa
jvaKpv+PWWGZMNw5hevzr0bJAoalLCJ0XsS0yqT+9PR+ro8AYV/5qc/F+83bZoAHImFhM6JdoITB
qA6zD+hZ3xlFV0TKF3Du9fFUephvAxT7tGAusaztQ+hS+61uCuOHUNG22U1707gFf7oDgXJdyZMD
OT6cQcQkfmSk+ncZZ5asfXas9nUW4l0lIqaMcGhx6rtGkFYoLRG/JEB1jdx1y3/ePDonRaTlX+pR
2jpY8QIHJywRSbY1zM9YaO9+tShM7JZwbL9F0M58P4TpAZIlZU0S7tDTOzjUJn0V6XOkh2G2hHHp
Y6h0nlN6aOIU7isrdA49UELCZHq+zCInyWYxm9gHNgLKtRvTJXDbiliXOxGsNoLO0A8IO/qJHVMC
9TFqsaxnIOqENQhRLc74ZnKUY5htMzHhtfGFSfGVl5hO8Ndd2v+87Z5fN/zqro76AGReEIcEPBQY
WlA9A8cAdc4uhu55c7aYt5XYJT1Gnp/ks6/Xl80q7jTFNF7kOhEliT/u4b+74+ZhZxnvi0iwydXb
KWr+hJt2q/VTfvLR9GR5bCkYRsSNFxWSTGKYy2tAE+w5ruW2wyyl2cLjAURJARaDWETquD4RaYB7
NtVxjlZvmY4muSwOYvRVFblI+QbhuOyvDA4B2Fplem3+6rdKUsdn/gozofWMjDaE6esMYX+o+DJX
uBohhjlw5ILXETHQfBWCupGujXS9dJh5QogycRSFkEORqCsnTQUvbqKj+4aYI5g4UkxISrBhPQPu
COltiao83idFz+O5ALCExEUoC6y68xklzuv7RFKCY00MYCnMYjpXeGC3iQIFGb7CB9so1VanAuyZ
UOR80dOfjvGxPSHpPk68Z9STMox7ZgRo7C6ctL2rgy6OhM2wrkRkAJoowvduxZ17Mm1s/j8c5hPo
Z6IAAA==
--===============0005090440554414153==--

