Content-Type: multipart/mixed; boundary="===============4128156040844044717=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] ubsan: Implement __ubsan_handle_alignment_assumption
Date: Wed, 27 Jan 2021 14:26:45 -0800
Message-ID: <CAKwvOd=WpK52Y4HpqoeaukmfOAWqTg-+NV1wdBjokwRuumdtSw@mail.gmail.com>
In-Reply-To: <CAKwvOdnx99YTGhP-mH-9E6YTLLUfauuteFtqZSeXLv5Vy+XowA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4128156040844044717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 5:39 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Jan 12, 2021 at 5:31 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Wed, Jan 13, 2021 at 08:39:52AM +0800, kernel test robot wrote:
> > > Hi Nathan,
> > >
> > > I love your patch! Perhaps something to improve:
> > >
> > > [auto build test WARNING on 7c53f6b671f4aba70ff15e1b05148b10d58c2837]
> > >
> > > url:    https://github.com/0day-ci/linux/commits/Nathan-Chancellor/ub=
san-Implement-__ubsan_handle_alignment_assumption/20210113-055714
> > > base:    7c53f6b671f4aba70ff15e1b05148b10d58c2837
> > > config: arm64-randconfig-r031-20210112 (attached as .config)
> > > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project =
32bcfcda4e28375e5a85268d2acfabcfcc011abf)
> > > reproduce (this is a W=3D1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install arm64 cross compiling tool for clang build
> > >         # apt-get install binutils-aarch64-linux-gnu
> > >         # https://github.com/0day-ci/linux/commit/775adad26a60878926c=
0ee6cd460a1375bbe51e6
> > >         git remote add linux-review https://github.com/0day-ci/linux
> > >         git fetch --no-tags linux-review Nathan-Chancellor/ubsan-Impl=
ement-__ubsan_handle_alignment_assumption/20210113-055714
> > >         git checkout 775adad26a60878926c0ee6cd460a1375bbe51e6
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cros=
s ARCH=3Darm64
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >    lib/ubsan.c:192:6: warning: no previous prototype for function '__=
ubsan_handle_add_overflow' [-Wmissing-prototypes]
> > >    void __ubsan_handle_add_overflow(void *data,
> > >         ^
> > >    lib/ubsan.c:192:1: note: declare 'static' if the function is not i=
ntended to be used outside of this translation unit
> > >    void __ubsan_handle_add_overflow(void *data,
> > >    ^
> > >    static
> > >    lib/ubsan.c:200:6: warning: no previous prototype for function '__=
ubsan_handle_sub_overflow' [-Wmissing-prototypes]
> > >    void __ubsan_handle_sub_overflow(void *data,
> > >         ^
> > >    lib/ubsan.c:200:1: note: declare 'static' if the function is not i=
ntended to be used outside of this translation unit
> > >    void __ubsan_handle_sub_overflow(void *data,
> > >    ^
> >
> > Given that these are compiler inserted functions, there is not much of a
> > point to having prototypes to them. If people feel shutting these
> > warnings up is worthwhile, we can just add the prototypes right above
> > the function definition in a follow up patch.
>
> Same as stpcpy; it would be nice though. ;)

If you would be so kind, I'd be happy to sign off on such a v3.

> --
> Thanks,
> ~Nick Desaulniers



-- =

Thanks,
~Nick Desaulniers
--===============4128156040844044717==--

