Content-Type: multipart/mixed; boundary="===============3868558605845336036=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [jfern:rcu/refperf 1/3] kernel/rcu/tree.c:3979:8: error: passing argument 4 of 'proc_create' from incompatible pointer type
Date: Fri, 15 May 2020 08:40:57 +0800
Message-ID: <766e27b4-5eb0-733e-1005-87147766a2c6@intel.com>
In-Reply-To: <210D91BF-9EA5-4686-B98B-67D058481DC5@joelfernandes.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3868558605845336036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Joel,

We have a configuration file to set the properties, the definition is at =

https://github.com/intel/lkp-tests/wiki/Repo-Spec,
the branches named as ".experimental." ".*dont-build" won't be tested by =

default, or you can tell us the blacklist branch rule.

Best Regards,
Rong Chen

On 5/14/20 11:42 PM, joel(a)joelfernandes.org wrote:
> This is just a test WIP tree. Is there a way for me to mark some trees =

> as not for kbuild testing?
>
> Thanks for the testing though!
>
>
> On May 14, 2020 11:08:12 AM EDT, kbuild test robot <lkp@intel.com> wrot=
e:
>
>     tree:https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git =
 rcu/refperf
>     head:   df3410c1f7436cf0a91127b2629a33923cc62140
>     commit: e9577008869a8d050252b346823d54ab84af4021 [1/3] test
>     config: i386-randconfig-r015-20200514 (attached as .config)
>     compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
>     reproduce:
>              git checkout e9577008869a8d050252b346823d54ab84af4021
>              # save the attached .config to linux build tree
>              make ARCH=3Di386
>
>     If you fix the issue, kindly add following tag as appropriate
>     Reported-by: kbuild test robot <lkp@intel.com>
>
>     All error/warnings (new ones prefixed by >>, old ones prefixed by <<):
>
>     kernel/rcu/tree.c: In function 'rcu_pr_kthread':
>     kernel/rcu/tree.c:3852:35: warning: unused variable 'spincnt2' [-Wunu=
sed-variable]
>     unsigned long spincnt, spincnt1, spincnt2, x=3D0;
>     ^~~~~~~~
>     kernel/rcu/tree.c:3852:25: warning: unused variable 'spincnt1' [-Wunu=
sed-variable]
>     unsigned long spincnt, spincnt1, spincnt2, x=3D0;
>     ^~~~~~~~
>     kernel/rcu/tree.c:3851:7: warning: unused variable 'work' [-Wunused-v=
ariable]
>     char work, *workp =3D this_cpu_ptr(&rcu_data.rcu_pr_has_work);
>     ^~~~
>     kernel/rcu/tree.c:3850:16: warning: unused variable 'statusp' [-Wunus=
ed-variable]
>     unsigned int *statusp =3D this_cpu_ptr(&rcu_data.rcu_pr_kthread_statu=
s);
>     ^~~~~~~
>     kernel/rcu/tree.c: In function 'rcu_spawn_pr_kthreads':
>
>             kernel/rcu/tree.c:3979:8: error: passing argument 4 of
>             'proc_create' from incompatible pointer type
>             [-Werror=3Dincompatible-pointer-types] =

>
>     &pr_ops);
>     ^
>     In file included from kernel/rcu/tree.c:23:0:
>     include/linux/proc_fs.h:79:24: note: expected 'const struct proc_ops =
*' but argument is of type 'const struct file_operations *'
>     struct proc_dir_entry *proc_create(const char *name, umode_t mode, st=
ruct proc_dir_entry *parent, const struct proc_ops *proc_ops);
>     ^~~~~~~~~~~
>     kernel/rcu/tree.c: In function 'pr_proc_write':
>
>             kernel/rcu/tree.c:3957:1: warning: control reaches end of
>             non-void function [-Wreturn-type] =

>
>     }
>     ^
>     cc1: some warnings being treated as errors
>
>     vim +/proc_create +3979 kernel/rcu/tree.c
>
>        3935	=

>        3936	ssize_t pr_proc_write(struct file * f, const char __user * b,=
 size_t s, loff_t * off)
>        3937	{
>        3938		u64 before, after;
>        3939	=

>        3940		WRITE_ONCE(work_type, PERCPU_RWSEM);
>        3941	repeat:
>        3942		smp_mb();
>        3943	=

>        3944		before =3D ktime_get_mono_fast_ns();
>        3945		do_one_pr_test();
>        3946		after =3D ktime_get_mono_fast_ns();
>        3947	=

>        3948		pr_err("Total time: %lu us , type: %s\n", (unsigned long)((a=
fter - before) / 1000),
>        3949					(work_type =3D=3D PERCPU_RWSEM ? "percpu-rwsem" : "rwsem"=
) );
>        3950	=

>        3951		if (work_type !=3D RWSEM) {
>        3952			work_type =3D RWSEM;
>        3953			msleep(100);
>        3954			goto repeat;
>        3955		}
>        3956	=

>
>         3957 } =

>
>        3958	=

>        3959	static const struct file_operations pr_ops =3D {
>        3960		.write =3D pr_proc_write,
>        3961		.llseek =3D default_llseek,
>        3962	};
>        3963	=

>        3964	/*
>        3965	 * Spawn boost kthreads -- called as soon as the scheduler is=
 running.
>        3966	 */
>        3967	static void __init rcu_spawn_pr_kthreads(void)
>        3968	{
>        3969		int cpu;
>        3970	=

>        3971		for_each_possible_cpu(cpu)
>        3972			per_cpu(rcu_data.rcu_pr_has_work, cpu) =3D 0;
>        3973	=

>        3974		if (WARN_ONCE(smpboot_register_percpu_thread(&rcu_pr_thread_=
spec),
>        3975					"%s: Could not start rcub kthread, OOM is now expected be=
havior\n", __func__))
>        3976			return;
>        3977	=

>        3978		proc_create("prw_test", 0777, NULL,
>
>         3979 &pr_ops); =

>
>        3980	=

>        3981		/*
>        3982		for_each_online_cpu(cpu) {
>        3983			pr_err("waking up thread on online cpu %d\n", cpu);
>        3984			per_cpu(rcu_data.rcu_pr_has_work, cpu) =3D 1;
>        3985			smp_mb();
>        3986			wake_up_process(per_cpu(rcu_data.pr_kthread, cpu));
>        3987		}
>        3988		*/
>        3989	}
>        3990	=

>     ---------------------------------------------------------------------=
---
>     0-DAY CI Kernel Test Service, Intel Corporation
>     https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
>
> -- =

> Sent from my Android device with K-9 Mail. Please excuse my brevity.=20

--===============3868558605845336036==--

