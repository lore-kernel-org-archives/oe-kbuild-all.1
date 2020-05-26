Content-Type: multipart/mixed; boundary="===============7941671817252463523=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [peterz-queue:sched/core 8/8] lib/math/div64.c:194:1: warning: attribute declaration must precede definition
Date: Tue, 26 May 2020 09:53:47 -0700
Message-ID: <CAKwvOdnRDbUXvfGsP9VX47nkuD3a8G_jWmGkH35cMcAATmgbvg@mail.gmail.com>
In-Reply-To: <20200523210231.GC2483@worktop.programming.kicks-ass.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7941671817252463523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2020 at 2:05 PM Peter Zijlstra <peterz@infradead.org> wro=
te:
>
> On Sat, May 23, 2020 at 02:50:21PM +0800, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.gi=
t sched/core
> > head:   42da62769d7de07bea28f81307723050f3339727
> > commit: 42da62769d7de07bea28f81307723050f3339727 [8/8] sched/cputime: I=
mprove cputime_adjust()
> > config: x86_64-randconfig-a013-20200521 (attached as .config)
> > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 33=
93cc4cebf9969db94dc424b7a2b6195589c33b)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         git checkout 42da62769d7de07bea28f81307723050f3339727
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dx86_64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> lib/math/div64.c:194:1: warning: attribute declaration must precede =
definition [-Wignored-attributes]
> > __weak u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> > ^
> > include/linux/compiler_attributes.h:271:56: note: expanded from macro '=
__weak'
> > #define __weak                          __attribute__((__weak__))
> > ^
> > arch/x86/include/asm/div64.h:81:28: note: previous definition is here
> > extern __always_inline u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div)
> > ^
> > 1 warning generated.
>
> So what is that thing complaining about?
>
> Why can't we have two fuctions with the same name and signature, one
> '__weak' and one 'extern __always_inline' ? GCC likes it just fine.
>
> clang folks?

Seems to be related to __attribute__((gnu_inline)) from the kernel's
redefinition of `inline`.
https://godbolt.org/z/q-tfYy
https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=
=3Dsched/core&id=3D42da62769d7de07bea28f81307723050f3339727

Though, playing with this more, is this working as expected?
https://godbolt.org/z/jjrFKL
I thought the `extern inline` definition would be used only for
inlining, but the above case shows that's not the case when the
declaration doesn't contain `__attribute__((gnu_inline)) inline`?

Another question, how come the `__weak` definition of
`mul_u64_u64_div_u64` doesn't follow the convention of the rest of
lib/math/div64.c of using preprocessor guards?  Maybe that's more
appropriate than `__weak` definitions?
https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/tree/lib/m=
ath/div64.c?h=3Dsched/core&id=3D42da62769d7de07bea28f81307723050f3339727
(I think that's the way to go)
-- =

Thanks,
~Nick Desaulniers
--===============7941671817252463523==--

