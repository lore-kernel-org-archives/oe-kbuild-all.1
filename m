Content-Type: multipart/mixed; boundary="===============7265209800653214274=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [rcu:dev.2020.05.25a 51/63] kernel/rcu/refperf.c:298:6: warning: no previous prototype for function 'reset_readers'
Date: Tue, 26 May 2020 09:11:17 -0700
Message-ID: <20200526161117.GH2869@paulmck-ThinkPad-P72>
In-Reply-To: <202005262032.uaSJI5NU%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7265209800653214274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2020 at 08:07:35PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu=
.git dev.2020.05.25a
> head:   1e9451642683146552713c5ce6d269ae378eacd5
> commit: 786a25497743696d79592b864cafbfe48787e6e1 [51/63] refperf: Add a t=
est to measure performance of read-side synchronization
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 3393=
cc4cebf9969db94dc424b7a2b6195589c33b)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout 786a25497743696d79592b864cafbfe48787e6e1
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> kernel/rcu/refperf.c:298:6: warning: no previous prototype for functio=
n 'reset_readers' [-Wmissing-prototypes]
> void reset_readers(int n)
> ^
> kernel/rcu/refperf.c:298:1: note: declare 'static' if the function is not=
 intended to be used outside of this translation unit
> void reset_readers(int n)
> ^
> static
> >> kernel/rcu/refperf.c:311:5: warning: no previous prototype for functio=
n 'process_durations' [-Wmissing-prototypes]
> u64 process_durations(int n)
> ^
> kernel/rcu/refperf.c:311:1: note: declare 'static' if the function is not=
 intended to be used outside of this translation unit
> u64 process_durations(int n)
> ^
> static
> 2 warnings generated.

Good catches, fixing!

							Thanx, Paul

> vim +/reset_readers +298 kernel/rcu/refperf.c
> =

>    297	=

>  > 298	void reset_readers(int n)
>    299	{
>    300		int i;
>    301		struct reader_task *rt;
>    302	=

>    303		for (i =3D 0; i < n; i++) {
>    304			rt =3D &(reader_tasks[i]);
>    305	=

>    306			rt->last_duration_ns =3D 0;
>    307		}
>    308	}
>    309	=

>    310	// Print the results of each reader and return the sum of all thei=
r durations.
>  > 311	u64 process_durations(int n)
>    312	{
>    313		int i;
>    314		struct reader_task *rt;
>    315		char buf1[64];
>    316		char buf[512];
>    317		u64 sum =3D 0;
>    318	=

>    319		buf[0] =3D 0;
>    320		sprintf(buf, "Experiment #%d (Format: <THREAD-NUM>:<Total loop ti=
me in ns>)",
>    321			exp_idx);
>    322	=

>    323		for (i =3D 0; i <=3D n && !torture_must_stop(); i++) {
>    324			rt =3D &(reader_tasks[i]);
>    325			sprintf(buf1, "%d: %llu\t", i, rt->last_duration_ns);
>    326	=

>    327			if (i % 5 =3D=3D 0)
>    328				strcat(buf, "\n");
>    329			strcat(buf, buf1);
>    330	=

>    331			sum +=3D rt->last_duration_ns;
>    332		}
>    333		strcat(buf, "\n");
>    334	=

>    335		PERFOUT("%s\n", buf);
>    336	=

>    337		return sum;
>    338	}
>    339	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============7265209800653214274==--

