Content-Type: multipart/mixed; boundary="===============4026424257429745889=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [rcu:dev.2020.02.12a 109/124] kernel/torture.c:239:3: error: implicit declaration of function 'rcutorture_sched_setaffinity'; did you mean '__NR_ia32_sched_setaffinity'?
Date: Sat, 15 Feb 2020 05:15:00 -0800
Message-ID: <20200215131500.GA2935@paulmck-ThinkPad-P72>
In-Reply-To: <202002151524.4UGF8vEo%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4026424257429745889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2020 at 03:55:27PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu=
.git dev.2020.02.12a
> head:   35a305226917a71de1c060db96fed0520cf644d9
> commit: bc3db9afb8492662a1108616342f288de66baa8f [109/124] EXP: rcutortur=
e hack to force CPU hotplug onto CPU 0
> config: x86_64-randconfig-s0-20200215 (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-4) 7.5.0
> reproduce:
>         git checkout bc3db9afb8492662a1108616342f288de66baa8f
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    kernel/torture.c: In function 'torture_onoff':
> >> kernel/torture.c:239:3: error: implicit declaration of function 'rcuto=
rture_sched_setaffinity'; did you mean '__NR_ia32_sched_setaffinity'? [-Wer=
ror=3Dimplicit-function-declaration]
>       rcutorture_sched_setaffinity(current->pid, cpumask_of(0));
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       __NR_ia32_sched_setaffinity
>    cc1: some warnings being treated as errors

And this experimental commit is now gone from current -rcu, though you
might well have a few more branches containing it in your queue.

							Thanx, Paul

> vim +239 kernel/torture.c
> =

>    195	=

>    196	/*
>    197	 * Execute random CPU-hotplug operations at the interval specified
>    198	 * by the onoff_interval.
>    199	 */
>    200	static int
>    201	torture_onoff(void *arg)
>    202	{
>    203		int cpu;
>    204		int maxcpu =3D -1;
>    205		DEFINE_TORTURE_RANDOM(rand);
>    206		int ret;
>    207	=

>    208		VERBOSE_TOROUT_STRING("torture_onoff task started");
>    209		for_each_online_cpu(cpu)
>    210			maxcpu =3D cpu;
>    211		WARN_ON(maxcpu < 0);
>    212		if (!IS_MODULE(CONFIG_TORTURE_TEST))
>    213			for_each_possible_cpu(cpu) {
>    214				if (cpu_online(cpu))
>    215					continue;
>    216				ret =3D cpu_up(cpu);
>    217				if (ret && verbose) {
>    218					pr_alert("%s" TORTURE_FLAG
>    219						 "%s: Initial online %d: errno %d\n",
>    220						 __func__, torture_type, cpu, ret);
>    221				}
>    222			}
>    223	=

>    224		if (maxcpu =3D=3D 0) {
>    225			VERBOSE_TOROUT_STRING("Only one CPU, so CPU-hotplug testing is d=
isabled");
>    226			goto stop;
>    227		}
>    228	=

>    229		if (onoff_holdoff > 0) {
>    230			VERBOSE_TOROUT_STRING("torture_onoff begin holdoff");
>    231			schedule_timeout_interruptible(onoff_holdoff);
>    232			VERBOSE_TOROUT_STRING("torture_onoff end holdoff");
>    233		}
>    234		while (!torture_must_stop()) {
>    235			if (disable_onoff_at_boot && !rcu_inkernel_boot_has_ended()) {
>    236				schedule_timeout_interruptible(HZ / 10);
>    237				continue;
>    238			}
>  > 239			rcutorture_sched_setaffinity(current->pid, cpumask_of(0));
>    240			cpu =3D (torture_random(&rand) >> 4) % (maxcpu + 1);
>    241			if (!torture_offline(cpu,
>    242					     &n_offline_attempts, &n_offline_successes,
>    243					     &sum_offline, &min_offline, &max_offline))
>    244				torture_online(cpu,
>    245					       &n_online_attempts, &n_online_successes,
>    246					       &sum_online, &min_online, &max_online);
>    247			schedule_timeout_interruptible(onoff_interval);
>    248		}
>    249	=

>    250	stop:
>    251		torture_kthread_stopping("torture_onoff");
>    252		return 0;
>    253	}
>    254	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============4026424257429745889==--

