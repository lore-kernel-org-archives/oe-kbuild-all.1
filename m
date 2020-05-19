Content-Type: multipart/mixed; boundary="===============1357048167197238832=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 4055/10701] kernel/rcu/tree_stall.h:208:19: warning: variable 'rnp' set but not used
Date: Tue, 19 May 2020 15:12:28 -0700
Message-ID: <20200519221228.GL2869@paulmck-ThinkPad-P72>
In-Reply-To: <202005200458.loIo4uBu%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1357048167197238832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 04:49:01AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> commit: 5bef8da66a9c45d3c371d74463894f1fc31dfdda [4055/10701] rcu: Add pe=
r-task state to RCU CPU stall warnings
> config: nios2-randconfig-r021-20200519 (attached as .config)
> compiler: nios2-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 5bef8da66a9c45d3c371d74463894f1fc31dfdda
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dnios2 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>

Good catch, fixed with your Reported-by.

							Thanx, Paul

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> In file included from kernel/rcu/tree.c:4075:
> kernel/rcu/tree_stall.h: In function 'check_slow_task':
> >> kernel/rcu/tree_stall.h:208:19: warning: variable 'rnp' set but not us=
ed [-Wunused-but-set-variable]
> 208 |  struct rcu_node *rnp;
> |                   ^~~
> =

> vim +/rnp +208 kernel/rcu/tree_stall.h
> =

>    201	=

>    202	/*
>    203	 * Report out the state of a not-running task that is stalling the
>    204	 * current RCU grace period.
>    205	 */
>    206	static bool check_slow_task(struct task_struct *t, void *arg)
>    207	{
>  > 208		struct rcu_node *rnp;
>    209		struct rcu_stall_chk_rdr *rscrp =3D arg;
>    210	=

>    211		if (task_curr(t))
>    212			return false; // It is running, so decline to inspect it.
>    213		rscrp->nesting =3D t->rcu_read_lock_nesting;
>    214		rscrp->rs =3D t->rcu_read_unlock_special;
>    215		rnp =3D t->rcu_blocked_node;
>    216		rscrp->on_blkd_list =3D !list_empty(&t->rcu_node_entry);
>    217		return true;
>    218	}
>    219	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============1357048167197238832==--

