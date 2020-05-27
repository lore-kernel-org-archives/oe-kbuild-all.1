Content-Type: multipart/mixed; boundary="===============8590151784219149970=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [rcu:dev.2020.05.26b 51/70] powerpc64-linux-ld: kernel/rcu/refperf.o:(.discard+0x0): multiple definition of `__pcpu_unique_srcu_ctl_perf_srcu_data'; kernel/rcu/rcuperf.o:(.discard+0x0): first defined here
Date: Wed, 27 May 2020 12:43:19 -0700
Message-ID: <20200527194319.GX2869@paulmck-ThinkPad-P72>
In-Reply-To: <202005280021.c7upVLgc%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8590151784219149970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 12:17:23AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu=
.git dev.2020.05.26b
> head:   795279db1396bf66621fa3f343fa990fe543b89e
> commit: 786a25497743696d79592b864cafbfe48787e6e1 [51/70] refperf: Add a t=
est to measure performance of read-side synchronization
> config: powerpc-allyesconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 786a25497743696d79592b864cafbfe48787e6e1
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dpowerpc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> powerpc64-linux-ld: kernel/rcu/refperf.o:(.discard+0x0): multiple defi=
nition of `__pcpu_unique_srcu_ctl_perf_srcu_data'; kernel/rcu/rcuperf.o:(.d=
iscard+0x0): first defined here

Ah, yes, despite the "static" keyword, the names must be unique throughout
the kernel.  Will fix!

							Thanx, Paul
--===============8590151784219149970==--

