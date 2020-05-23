Content-Type: multipart/mixed; boundary="===============2669661392529564245=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [peterz-queue:sched/core 8/8] lib/math/div64.c:194:1: warning: attribute declaration must precede definition
Date: Sat, 23 May 2020 23:02:31 +0200
Message-ID: <20200523210231.GC2483@worktop.programming.kicks-ass.net>
In-Reply-To: <202005231418.iVv6BaVV%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2669661392529564245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2020 at 02:50:21PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git =
sched/core
> head:   42da62769d7de07bea28f81307723050f3339727
> commit: 42da62769d7de07bea28f81307723050f3339727 [8/8] sched/cputime: Imp=
rove cputime_adjust()
> config: x86_64-randconfig-a013-20200521 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 3393=
cc4cebf9969db94dc424b7a2b6195589c33b)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout 42da62769d7de07bea28f81307723050f3339727
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> lib/math/div64.c:194:1: warning: attribute declaration must precede de=
finition [-Wignored-attributes]
> __weak u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> ^
> include/linux/compiler_attributes.h:271:56: note: expanded from macro '__=
weak'
> #define __weak                          __attribute__((__weak__))
> ^
> arch/x86/include/asm/div64.h:81:28: note: previous definition is here
> extern __always_inline u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div)
> ^
> 1 warning generated.

So what is that thing complaining about?

Why can't we have two fuctions with the same name and signature, one
'__weak' and one 'extern __always_inline' ? GCC likes it just fine.

clang folks?
--===============2669661392529564245==--

