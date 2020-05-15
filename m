Content-Type: multipart/mixed; boundary="===============0604294410048669032=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 8047/8703] ld.lld: error: undefined symbol: __compiletime_assert_457
Date: Fri, 15 May 2020 09:36:17 -0400
Message-ID: <20200515133617.GA622452@cmpxchg.org>
In-Reply-To: <202005140933.YfPvZZ5S%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0604294410048669032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 09:25:36AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   e098d7762d602be640c53565ceca342f81e55ad2
> commit: 157f1f138544760477af362159d2ecd4ad41bd8c [8047/8703] mm: memcontr=
ol: switch to native NR_ANON_THPS counter
> config: x86_64-randconfig-a016-20200513 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 310d=
32cb80a611e6384a921e85607fea05841f26)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout 157f1f138544760477af362159d2ecd4ad41bd8c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

> >> ld.lld: error: undefined symbol: __compiletime_assert_457
> >>> referenced by memcontrol.c:1406 (mm/memcontrol.c:1406)
> >>> memcontrol.o:(memory_stat_format) in archive mm/built-in.a

That's the HPAGE_PMD_NR on !CONFIG_TRANSPARENT_HUGEPAGE. Fix:
https://lore.kernel.org/linux-mm/20200512121750.GA397968(a)cmpxchg.org/
--===============0604294410048669032==--

