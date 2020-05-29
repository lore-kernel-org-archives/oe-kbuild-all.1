Content-Type: multipart/mixed; boundary="===============5915116809740584003=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 4066/13554] kernel/rcu/tasks.h:1022:6: warning: no previous prototype for 'show_rcu_tasks_gp_kthreads'
Date: Thu, 28 May 2020 20:05:56 -0700
Message-ID: <20200529030556.GV2869@paulmck-ThinkPad-P72>
In-Reply-To: <202005290957.bP70vtyQ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5915116809740584003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2020 at 09:51:58AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   ff387fc20c697cdc887b2abf7ef494e853795a2f
> commit: e21408ceec2de5be418efa39feb1e2c00f824a72 [4066/13554] rcu-tasks: =
Add RCU tasks to rcutorture writer stall output
> config: m68k-randconfig-s031-20200528 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-240-gf0fe1cd9-dirty
>         git checkout e21408ceec2de5be418efa39feb1e2c00f824a72
>         # save the attached .config to linux build tree
>         make W=3D1 C=3D1 ARCH=3Dm68k CF=3D'-fdiagnostic-prefix -D__CHECK_=
ENDIAN__'
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>

Good catches!

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> In file included from kernel/rcu/update.c:587:
> kernel/rcu/tasks.h:340:6: warning: no previous prototype for 'rcu_tasks_p=
ostscan' [-Wmissing-prototypes]
> 340 | void rcu_tasks_postscan(void)
> |      ^~~~~~~~~~~~~~~~~~

I added the missing "static".

> kernel/rcu/tasks.h:650:6: warning: no previous prototype for 'rcu_read_un=
lock_trace_special' [-Wmissing-prototypes]
> 650 | void rcu_read_unlock_trace_special(struct task_struct *t)
> |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The prototype is there, just not included by this file.  But now that you
mention it, the added type checking is a good thing, so I added
"#include <linux/rcupdate_trace.h>" to kernel/rcu/update.c.

> In file included from include/linux/kernel.h:14,
> from kernel/rcu/update.c:21:
> kernel/rcu/tasks.h: In function 'trc_wait_for_one_reader':
> kernel/rcu/tasks.h:765:42: error: 'rcu_tasks_trace' undeclared (first use=
 in this function); did you mean 'rcu_tasks_rude'?
> 765 |  if (task_curr(t) && time_after(jiffies, rcu_tasks_trace.gp_start +=
 rcu_task_ipi_delay)) {
> |                                          ^~~~~~~~~~~~~~~
> include/linux/typecheck.h:11:9: note: in definition of macro 'typecheck'
> 11 |  typeof(x) __dummy2;          |         ^
> kernel/rcu/tasks.h:765:22: note: in expansion of macro 'time_after'
> 765 |  if (task_curr(t) && time_after(jiffies, rcu_tasks_trace.gp_start +=
 rcu_task_ipi_delay)) {
> |                      ^~~~~~~~~~
> kernel/rcu/tasks.h:765:42: note: each undeclared identifier is reported o=
nly once for each function it appears in
> 765 |  if (task_curr(t) && time_after(jiffies, rcu_tasks_trace.gp_start +=
 rcu_task_ipi_delay)) {
> |                                          ^~~~~~~~~~~~~~~
> include/linux/typecheck.h:11:9: note: in definition of macro 'typecheck'
> 11 |  typeof(x) __dummy2;          |         ^
> kernel/rcu/tasks.h:765:22: note: in expansion of macro 'time_after'
> 765 |  if (task_curr(t) && time_after(jiffies, rcu_tasks_trace.gp_start +=
 rcu_task_ipi_delay)) {
> |                      ^~~~~~~~~~

This has been since been fixed by b0afa0f05667 ("rcu-tasks: Provide boot
parameter to delay IPIs until late in grace period").

> kernel/rcu/tasks.h:765:69: error: 'rcu_task_ipi_delay' undeclared (first =
use in this function)
> 765 |  if (task_curr(t) && time_after(jiffies, rcu_tasks_trace.gp_start +=
 rcu_task_ipi_delay)) {
> |                                                                     ^~~=
~~~~~~~~~~~~~~~
> include/linux/typecheck.h:11:9: note: in definition of macro 'typecheck'
> 11 |  typeof(x) __dummy2;          |         ^
> kernel/rcu/tasks.h:765:22: note: in expansion of macro 'time_after'
> 765 |  if (task_curr(t) && time_after(jiffies, rcu_tasks_trace.gp_start +=
 rcu_task_ipi_delay)) {
> |                      ^~~~~~~~~~
> include/linux/typecheck.h:12:18: warning: comparison of distinct pointer =
types lacks a cast
> 12 |  (void)(&__dummy =3D=3D &__dummy2);          |                  ^~
> include/linux/jiffies.h:105:3: note: in expansion of macro 'typecheck'
> 105 |   typecheck(unsigned long, b) &&          |   ^~~~~~~~~
> kernel/rcu/tasks.h:765:22: note: in expansion of macro 'time_after'
> 765 |  if (task_curr(t) && time_after(jiffies, rcu_tasks_trace.gp_start +=
 rcu_task_ipi_delay)) {
> |                      ^~~~~~~~~~

This has since been fixed by b0afa0f05667 ("rcu-tasks: Provide boot
parameter to delay IPIs until late in grace period").

> In file included from kernel/rcu/update.c:587:
> kernel/rcu/tasks.h: At top level:
> kernel/rcu/tasks.h:977:6: warning: no previous prototype for 'synchronize=
_rcu_tasks_trace' [-Wmissing-prototypes]
> 977 | void synchronize_rcu_tasks_trace(void)
> |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from kernel/rcu/update.c:587:
> kernel/rcu/tasks.h:990:6: warning: no previous prototype for 'rcu_barrier=
_tasks_trace' [-Wmissing-prototypes]
> 990 | void rcu_barrier_tasks_trace(void)
> |      ^~~~~~~~~~~~~~~~~~~~~~~

These two are covered by adding the "#include <linux/rcupdate_trace.h>".

> >> kernel/rcu/tasks.h:1022:6: warning: no previous prototype for 'show_rc=
u_tasks_gp_kthreads' [-Wmissing-prototypes]
> 1022 | void show_rcu_tasks_gp_kthreads(void)
> |      ^~~~~~~~~~~~~~~~~~~~~~~~~~

Heh!  This one is not used by Tiny RCU, so the function is not declared
for Tiny RCU builds.  But the function's definition is still present.
I queued a commit to ifdef this out of Tiny RCU builds.

							Thanx, Paul

> vim +/show_rcu_tasks_gp_kthreads +1022 kernel/rcu/tasks.h
> =

>   1021	=

> > 1022	void show_rcu_tasks_gp_kthreads(void)
>   1023	{
>   1024		show_rcu_tasks_classic_gp_kthread();
>   1025		show_rcu_tasks_rude_gp_kthread();
>   1026		show_rcu_tasks_trace_gp_kthread();
>   1027	}
>   1028	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============5915116809740584003==--

