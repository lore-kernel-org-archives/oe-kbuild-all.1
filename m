Content-Type: multipart/mixed; boundary="===============1641802953746977309=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 4053/14131] kernel//rcu/tasks.h:257:6: warning: no previous prototype for function 'rcu_tasks_postscan'
Date: Sun, 31 May 2020 08:57:03 -0700
Message-ID: <20200531155703.GK2869@paulmck-ThinkPad-P72>
In-Reply-To: <202005312323.3njarq3E%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1641802953746977309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2020 at 11:00:26PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   e7b08814b16b80a0bf76eeca16317f8c2ed23b8c
> commit: e4fe5dd6f26f74233e217d9dd351adc3e5165bb9 [4053/14131] rcu-tasks: =
Further refactor RCU-tasks to allow adding more variants
> config: x86_64-randconfig-a015-20200529 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 2d06=
8e534f1671459e1b135852c1b3c10502e929)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout e4fe5dd6f26f74233e217d9dd351adc3e5165bb9
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):

Fixed by b47663597c1b ("rcu-tasks: Make rcu_tasks_postscan() be static"),
now in -rcu on branch "dev".

							Thanx, Paul

> In file included from kernel//rcu/update.c:588:
> >> kernel//rcu/tasks.h:257:6: warning: no previous prototype for function=
 'rcu_tasks_postscan' [-Wmissing-prototypes]
> void rcu_tasks_postscan(void)
> ^
> kernel//rcu/tasks.h:257:1: note: declare 'static' if the function is not =
intended to be used outside of this translation unit
> void rcu_tasks_postscan(void)
> ^
> static
> 1 warning generated.
> =

> vim +/rcu_tasks_postscan +257 kernel//rcu/tasks.h
> =

>    255	=

>    256	/* Processing between scanning taskslist and draining the holdout =
list. */
>  > 257	void rcu_tasks_postscan(void)
>    258	{
>    259		/*
>    260		 * Wait for tasks that are in the process of exiting.  This
>    261		 * does only part of the job, ensuring that all tasks that were
>    262		 * previously exiting reach the point where they have disabled
>    263		 * preemption, allowing the later synchronize_rcu() to finish
>    264		 * the job.
>    265		 */
>    266		synchronize_srcu(&tasks_rcu_exit_srcu);
>    267	}
>    268	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============1641802953746977309==--

