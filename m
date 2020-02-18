Content-Type: multipart/mixed; boundary="===============3440435289718265189=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [rcu:dev.2020.02.15b 33/33] kernel/rcu/tree_plugin.h:396:2: error: expected identifier or '(' before 'if'
Date: Tue, 18 Feb 2020 05:44:57 -0800
Message-ID: <20200218134457.GC2935@paulmck-ThinkPad-P72>
In-Reply-To: <202002181731.hrgvGnlt%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3440435289718265189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2020 at 05:06:32PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu=
.git dev.2020.02.15b
> head:   163cebf16e83ee2e6494976e396ab1a8f8aa9b17
> commit: 163cebf16e83ee2e6494976e396ab1a8f8aa9b17 [33/33] rcu: Don't use n=
egative nesting depth in __rcu_read_unlock()
> config: nds32-defconfig (attached as .config)
> compiler: nds32le-linux-gcc (GCC) 9.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 163cebf16e83ee2e6494976e396ab1a8f8aa9b17
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D9.2.0 make.cross ARCH=3Dnds32 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    In file included from kernel/rcu/tree.c:4030:
> >> kernel/rcu/tree_plugin.h:396:2: error: expected identifier or '(' befo=
re 'if'
>      396 |  if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
>          |  ^~
> >> kernel/rcu/tree_plugin.h:401:1: error: expected identifier or '(' befo=
re '}' token
>      401 | }
>          | ^

This has since been fixed by a new version 756b5aea6df6 ("rcu: Don't use
negative nesting depth in __rcu_read_unlock()") in -rcu.

							Thanx, Paul

> vim +396 kernel/rcu/tree_plugin.h
> =

> 0e5da22e3f809a Paul E. McKenney 2018-03-19  379  =

> 0e5da22e3f809a Paul E. McKenney 2018-03-19  380  /*
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  381   * Preemptible RCU imple=
mentation for rcu_read_unlock().
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  382   * Decrement ->rcu_read_=
lock_nesting.  If the result is zero (outermost
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  383   * rcu_read_unlock()) an=
d ->rcu_read_unlock_special is non-zero, then
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  384   * invoke rcu_read_unloc=
k_special() to clean up after a context switch
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  385   * in an RCU read-side c=
ritical section and other special cases.
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  386   */
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  387  void __rcu_read_unlock(v=
oid)
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  388  {
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  389  	struct task_struct *t =
=3D current;
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  390  =

> 163cebf16e83ee Lai Jiangshan    2020-02-15  391  	if (rcu_preempt_read_ex=
it() =3D=3D 0)
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  392  		barrier();  /* critica=
l section before exit code. */
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  393  		if (unlikely(READ_ONCE=
(t->rcu_read_unlock_special.s)))
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  394  			rcu_read_unlock_speci=
al(t);
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  395  	}
> 5f1a6ef3746f53 Paul E. McKenney 2018-10-29 @396  	if (IS_ENABLED(CONFIG_P=
ROVE_LOCKING)) {
> 77339e61aa3093 Lai Jiangshan    2019-11-15  397  		int rrln =3D rcu_preem=
pt_depth();
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  398  =

> 5f1a6ef3746f53 Paul E. McKenney 2018-10-29  399  		WARN_ON_ONCE(rrln < 0 =
&& rrln > RCU_NEST_NMAX);
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  400  	}
> 0e5da22e3f809a Paul E. McKenney 2018-03-19 @401  }
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  402  EXPORT_SYMBOL_GPL(__rcu_=
read_unlock);
> 0e5da22e3f809a Paul E. McKenney 2018-03-19  403  =

> =

> :::::: The code at line 396 was first introduced by commit
> :::::: 5f1a6ef3746f536157922197d98676fa21154549 rcu: Avoid signed integer=
 overflow in rcu_preempt_deferred_qs()
> =

> :::::: TO: Paul E. McKenney <paulmck@linux.ibm.com>
> :::::: CC: Paul E. McKenney <paulmck@linux.ibm.com>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============3440435289718265189==--

