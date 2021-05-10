Content-Type: multipart/mixed; boundary="===============3640914117129041061=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [rcu:dev.2021.05.02a 114/114] kernel/rcu/refscale.c:472:15: warning: variable 'x' set but not used
Date: Mon, 10 May 2021 11:14:55 -0700
Message-ID: <20210510181455.GH975577@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <202105061040.osgFAKrJ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3640914117129041061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 10:16:43AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu=
.git dev.2021.05.02a
> head:   35d2c62851bc03a945ae81ab0726985f726107b1
> commit: 35d2c62851bc03a945ae81ab0726985f726107b1 [114/114] refscale: Add =
measurement of clock readout
> config: nios2-randconfig-r014-20210505 (attached as .config)
> compiler: nios2-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-r=
cu.git/commit/?id=3D35d2c62851bc03a945ae81ab0726985f726107b1
>         git remote add rcu https://git.kernel.org/pub/scm/linux/kernel/gi=
t/paulmck/linux-rcu.git
>         git fetch --no-tags rcu dev.2021.05.02a
>         git checkout 35d2c62851bc03a945ae81ab0726985f726107b1
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Dnios2 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    kernel/rcu/refscale.c: In function 'ref_clock_section':
> >> kernel/rcu/refscale.c:472:15: warning: variable 'x' set but not used [=
-Wunused-but-set-variable]
>      472 |  volatile u64 x;
>          |               ^
>    kernel/rcu/refscale.c: In function 'ref_clock_delay_section':
>    kernel/rcu/refscale.c:484:15: warning: variable 'x' set but not used [=
-Wunused-but-set-variable]
>      484 |  volatile u64 x;
>          |               ^
> =

> =

> vim +/x +472 kernel/rcu/refscale.c
> =

>    469	=

>    470	static void ref_clock_section(const int nloops)
>    471	{
>  > 472		volatile u64 x;
>    473		int i;
>    474	=

>    475		preempt_disable();
>    476		for (i =3D nloops; i >=3D 0; i--) {
>    477			x =3D ktime_get_real_fast_ns();
>    478		}
>    479		preempt_enable();
>    480	}
>    481	=


OK, how about with the following fixup patch?

But please note that this compiler warning is incorrect.  The variable
is marked volatile, so the compiler cannot possibly know that it is in
fact unused.  Some debugger might be examining it, for but one example.

Thus, the fixup patch below is a workaround for the compiler bug.

							Thanx, Paul

------------------------------------------------------------------------

commit 1838223c42250bfc27a15b9712591e663babb1f0
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Mon May 10 11:12:01 2021 -0700

    squash! refscale: Add measurement of clock readout
    =

    [ paulmck: Adjust volatility per kernel test robot feedback. ]
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/rcu/refscale.c b/kernel/rcu/refscale.c
index bef61a322104..20e892b2502c 100644
--- a/kernel/rcu/refscale.c
+++ b/kernel/rcu/refscale.c
@@ -467,29 +467,33 @@ static struct ref_scale_ops acqrel_ops =3D {
 	.name		=3D "acqrel"
 };
 =

+static volatile u64 stopopts;
+
 static void ref_clock_section(const int nloops)
 {
-	volatile u64 x;
+	u64 x;
 	int i;
 =

 	preempt_disable();
 	for (i =3D nloops; i >=3D 0; i--) {
-		x =3D ktime_get_real_fast_ns();
+		x +=3D ktime_get_real_fast_ns();
 	}
 	preempt_enable();
+	stopopts =3D x;
 }
 =

 static void ref_clock_delay_section(const int nloops, const int udl, const=
 int ndl)
 {
-	volatile u64 x;
+	u64 x;
 	int i;
 =

 	preempt_disable();
 	for (i =3D nloops; i >=3D 0; i--) {
-		x =3D ktime_get_real_fast_ns();
+		x +=3D ktime_get_real_fast_ns();
 		un_delay(udl, ndl);
 	}
 	preempt_enable();
+	stopopts =3D x;
 }
 =

 static struct ref_scale_ops clock_ops =3D {
--===============3640914117129041061==--

