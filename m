Content-Type: multipart/mixed; boundary="===============2363315368570165610=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [jfern:rcu/refperf 1/3] kernel/rcu/tree.c:3979:8: error: passing argument 4 of 'proc_create' from incompatible pointer type
Date: Mon, 18 May 2020 14:06:28 +0800
Message-ID: <4de0fe11-f9bd-2f3f-8f6b-7cecf3b0fb56@intel.com>
In-Reply-To: <CAJWu+oqvP1AhGMuYFqLKBz7TXUYHSRabead4XFFVUPGc4v_pOw@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2363315368570165610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sorry, we don't support that way because we'll merge branches into one =

branch and test the branch firstly.

On 5/15/20 10:48 PM, Joel Fernandes wrote:
> Thanks. Is there a way to also add a file to the tree or a commit =

> message that says "DONOT TEST" or such?=C2=A0 Then no branch renaming is =

> needed.
>
> On Thu, May 14, 2020 at 8:41 PM Rong Chen <rong.a.chen@intel.com =

> <mailto:rong.a.chen@intel.com>> wrote:
>
>     Hi Joel,
>
>     We have a configuration file to set the properties, the definition
>     is at
>     https://github.com/intel/lkp-tests/wiki/Repo-Spec,
>     the branches named as ".experimental." ".*dont-build" won't be
>     tested by
>     default, or you can tell us the blacklist branch rule.
>
>     Best Regards,
>     Rong Chen
>
>     On 5/14/20 11:42 PM, joel(a)joelfernandes.org
>     <mailto:joel@joelfernandes.org> wrote:
>     > This is just a test WIP tree. Is there a way for me to mark some
>     trees
>     > as not for kbuild testing?
>     >
>     > Thanks for the testing though!
>     >
>     >
>     > On May 14, 2020 11:08:12 AM EDT, kbuild test robot
>     <lkp(a)intel.com <mailto:lkp@intel.com>> wrote:
>     >
>     >=C2=A0 =C2=A0
>     =C2=A0tree:https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linu=
x.git
>     rcu/refperf
>     >=C2=A0 =C2=A0 =C2=A0head:=C2=A0 =C2=A0df3410c1f7436cf0a91127b2629a33=
923cc62140
>     >=C2=A0 =C2=A0 =C2=A0commit: e9577008869a8d050252b346823d54ab84af4021=
 [1/3] test
>     >=C2=A0 =C2=A0 =C2=A0config: i386-randconfig-r015-20200514 (attached =
as .config)
>     >=C2=A0 =C2=A0 =C2=A0compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
>     >=C2=A0 =C2=A0 =C2=A0reproduce:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git checkout e95770=
08869a8d050252b346823d54ab84af4021
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # save the attached=
 .config to linux build tree
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 make ARCH=3Di386
>     >
>     >=C2=A0 =C2=A0 =C2=A0If you fix the issue, kindly add following tag a=
s appropriate
>     >=C2=A0 =C2=A0 =C2=A0Reported-by: kbuild test robot <lkp@intel.com
>     <mailto:lkp@intel.com>>
>     >
>     >=C2=A0 =C2=A0 =C2=A0All error/warnings (new ones prefixed by >>, old=
 ones
>     prefixed by <<):
>     >
>     >=C2=A0 =C2=A0 =C2=A0kernel/rcu/tree.c: In function 'rcu_pr_kthread':
>     >=C2=A0 =C2=A0 =C2=A0kernel/rcu/tree.c:3852:35: warning: unused varia=
ble
>     'spincnt2' [-Wunused-variable]
>     >=C2=A0 =C2=A0 =C2=A0unsigned long spincnt, spincnt1, spincnt2, x=3D0;
>     >=C2=A0 =C2=A0 =C2=A0^~~~~~~~
>     >=C2=A0 =C2=A0 =C2=A0kernel/rcu/tree.c:3852:25: warning: unused varia=
ble
>     'spincnt1' [-Wunused-variable]
>     >=C2=A0 =C2=A0 =C2=A0unsigned long spincnt, spincnt1, spincnt2, x=3D0;
>     >=C2=A0 =C2=A0 =C2=A0^~~~~~~~
>     >=C2=A0 =C2=A0 =C2=A0kernel/rcu/tree.c:3851:7: warning: unused variab=
le 'work'
>     [-Wunused-variable]
>     >=C2=A0 =C2=A0 =C2=A0char work, *workp =3D this_cpu_ptr(&rcu_data.rcu=
_pr_has_work);
>     >=C2=A0 =C2=A0 =C2=A0^~~~
>     >=C2=A0 =C2=A0 =C2=A0kernel/rcu/tree.c:3850:16: warning: unused varia=
ble
>     'statusp' [-Wunused-variable]
>     >=C2=A0 =C2=A0 =C2=A0unsigned int *statusp =3D
>     this_cpu_ptr(&rcu_data.rcu_pr_kthread_status);
>     >=C2=A0 =C2=A0 =C2=A0^~~~~~~
>     >=C2=A0 =C2=A0 =C2=A0kernel/rcu/tree.c: In function 'rcu_spawn_pr_kth=
reads':
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel/rcu/tree.c:39=
79:8: error: passing argument 4 of
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'proc_create' from i=
ncompatible pointer type
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-Werror=3Dincompati=
ble-pointer-types]
>     >
>     >=C2=A0 =C2=A0 =C2=A0&pr_ops);
>     >=C2=A0 =C2=A0 =C2=A0^
>     >=C2=A0 =C2=A0 =C2=A0In file included from kernel/rcu/tree.c:23:0:
>     >=C2=A0 =C2=A0 =C2=A0include/linux/proc_fs.h:79:24: note: expected 'c=
onst struct
>     proc_ops *' but argument is of type 'const struct file_operations *'
>     >=C2=A0 =C2=A0 =C2=A0struct proc_dir_entry *proc_create(const char *n=
ame, umode_t
>     mode, struct proc_dir_entry *parent, const struct proc_ops *proc_ops);
>     >=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~
>     >=C2=A0 =C2=A0 =C2=A0kernel/rcu/tree.c: In function 'pr_proc_write':
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel/rcu/tree.c:39=
57:1: warning: control reaches
>     end of
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0non-void function [-=
Wreturn-type]
>     >
>     >=C2=A0 =C2=A0 =C2=A0}
>     >=C2=A0 =C2=A0 =C2=A0^
>     >=C2=A0 =C2=A0 =C2=A0cc1: some warnings being treated as errors
>     >
>     >=C2=A0 =C2=A0 =C2=A0vim +/proc_create +3979 kernel/rcu/tree.c
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3935
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3936=C2=A0 =C2=A0ssize_t pr_proc_write(s=
truct file * f, const char
>     __user * b, size_t s, loff_t * off)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3937=C2=A0 =C2=A0{
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3938=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0u64 before, after;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3939
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3940=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0WRITE_ONCE(work_type, PERCPU_RWSEM);
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3941=C2=A0 =C2=A0repeat:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3942=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0smp_mb();
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3943
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3944=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0before =3D ktime_get_mono_fast_ns();
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3945=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0do_one_pr_test();
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3946=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0after =3D ktime_get_mono_fast_ns();
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3947
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3948=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0pr_err("Total time: %lu us , type: %s\n",
>     (unsigned long)((after - before) / 1000),
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3949=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(work_type =3D=3D
>     PERCPU_RWSEM ? "percpu-rwsem" : "rwsem") );
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3950
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3951=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (work_type !=3D RWSEM) {
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3952=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0work_type =3D RWSEM;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3953=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msleep(100);
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3954=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto repeat;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3955=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3956
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03957 }
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3958
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3959=C2=A0 =C2=A0static const struct fil=
e_operations pr_ops =3D {
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3960=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0.write =3D pr_proc_write,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3961=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0.llseek =3D default_llseek,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3962=C2=A0 =C2=A0};
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3963
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3964=C2=A0 =C2=A0/*
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3965=C2=A0 =C2=A0 * Spawn boost kthreads=
 -- called as soon as the
>     scheduler is running.
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3966=C2=A0 =C2=A0 */
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3967=C2=A0 =C2=A0static void __init rcu_=
spawn_pr_kthreads(void)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3968=C2=A0 =C2=A0{
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3969=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0int cpu;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3970
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3971=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for_each_possible_cpu(cpu)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3972 =C2=A0per_cpu(rcu_data.rcu_pr_has_w=
ork, cpu) =3D 0;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3973
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3974=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if
>     (WARN_ONCE(smpboot_register_percpu_thread(&rcu_pr_thread_spec),
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3975=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0"%s: Could not
>     start rcub kthread, OOM is now expected behavior\n", __func__))
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3976=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3977
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3978=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0proc_create("prw_test", 0777, NULL,
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03979 &pr_ops);
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3980
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3981=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/*
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3982=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for_each_online_cpu(cpu) {
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3983=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err("waking up thread on online
>     cpu %d\n", cpu);
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3984 =C2=A0per_cpu(rcu_data.rcu_pr_has_w=
ork, cpu) =3D 1;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3985=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0smp_mb();
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3986 =C2=A0wake_up_process(per_cpu(rcu_d=
ata.pr_kthread, cpu));
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3987=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3988=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*/
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3989=C2=A0 =C2=A0}
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 3990
>     >
>     =C2=A0---------------------------------------------------------------=
---------
>     >=C2=A0 =C2=A0 =C2=A00-DAY CI Kernel Test Service, Intel Corporation
>     > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>     >
>     >
>     > --
>     > Sent from my Android device with K-9 Mail. Please excuse my
>     brevity.
>

--===============2363315368570165610==--

