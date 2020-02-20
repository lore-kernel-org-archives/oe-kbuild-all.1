Content-Type: multipart/mixed; boundary="===============3556642733277828713=="
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] kbuild: add -Wall to KBUILD_HOSTCXXFLAGS
Date: Thu, 20 Feb 2020 11:39:40 +0900
Message-ID: <CAK7LNARMfv-JzbX1PMy4J6H1XGVPO7s-6Gy6QF2KevKvKjGcoA@mail.gmail.com>
In-Reply-To: <202002200725.lfEcxTej%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3556642733277828713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 8:37 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Masahiro,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on kbuild/for-next]
> [also build test WARNING on kbuild/kconfig linux/master linus/master v5.6=
-rc2 next-20200219]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/kconfig-=
remove-unused-variable-in-qconf-cc/20200219-035229
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-k=
build.git for-next
> config: i386-randconfig-a003-20200219 (attached as .config)
> compiler: gcc-5 (Ubuntu 5.5.0-12ubuntu1) 5.5.0 20171010
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Di386
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/t=
m.h:27,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/g=
cc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/p=
lugin.h:23,
>                     from scripts//gcc-plugins/gcc-common.h:9,
>                     from scripts//gcc-plugins/cyc_complexity_plugin.c:21:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:102:21: =
warning: C++11 requires a space between string literal and macro [-Wc++11-c=
ompat]
>      102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\



Thanks for the report.
This is a warning from the toolchain headers.
I cannot fix it.

I do not see this warning on newer GCC.







>          |                     ^
>    /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:170:24: =
warning: C++11 requires a space between string literal and macro [-Wc++11-c=
ompat]
>      170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",=
  \
>          |                        ^
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/t=
m.h:48,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/g=
cc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/p=
lugin.h:23,
>                     from scripts//gcc-plugins/gcc-common.h:9,
>                     from scripts//gcc-plugins/cyc_complexity_plugin.c:21:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/defaults.h:126:24: warn=
ing: C++11 requires a space between string literal and macro [-Wc++11-compa=
t]
>      126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",=
  \
>          |                        ^
> --
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/t=
m.h:27,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/g=
cc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/p=
lugin.h:23,
>                     from scripts/gcc-plugins/gcc-common.h:9,
>                     from scripts/gcc-plugins/randomize_layout_plugin.c:19:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:102:21: =
warning: C++11 requires a space between string literal and macro [-Wc++11-c=
ompat]
>      102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
>          |                     ^
>    /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:170:24: =
warning: C++11 requires a space between string literal and macro [-Wc++11-c=
ompat]
>      170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",=
  \
>          |                        ^
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/t=
m.h:27,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/g=
cc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/p=
lugin.h:23,
>                     from scripts/gcc-plugins/gcc-common.h:9,
>                     from scripts/gcc-plugins/cyc_complexity_plugin.c:21:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:102:21: =
warning: C++11 requires a space between string literal and macro [-Wc++11-c=
ompat]
>      102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
>          |                     ^
>    /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:170:24: =
warning: C++11 requires a space between string literal and macro [-Wc++11-c=
ompat]
>      170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",=
  \
>          |                        ^
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/t=
m.h:48,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/g=
cc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/p=
lugin.h:23,
>                     from scripts/gcc-plugins/gcc-common.h:9,
>                     from scripts/gcc-plugins/randomize_layout_plugin.c:19:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/defaults.h:126:24: warn=
ing: C++11 requires a space between string literal and macro [-Wc++11-compa=
t]
>      126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",=
  \
>          |                        ^
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/t=
m.h:48,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/g=
cc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/p=
lugin.h:23,
>                     from scripts/gcc-plugins/gcc-common.h:9,
>                     from scripts/gcc-plugins/cyc_complexity_plugin.c:21:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/defaults.h:126:24: warn=
ing: C++11 requires a space between string literal and macro [-Wc++11-compa=
t]
>      126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",=
  \
>          |                        ^
>    Cyclomatic Complexity 1 scripts/mod/devicetable-offsets.c:main
>    Cyclomatic Complexity 1 kernel/bounds.c:main
>    Cyclomatic Complexity 1 arch/x86/kernel/asm-offsets_32.c:foo
>    Cyclomatic Complexity 1 arch/x86/kernel/asm-offsets.c:common
>    51 real  8 user  9 sys  33.65% cpu   make prepare
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



-- =

Best Regards
Masahiro Yamada
--===============3556642733277828713==--

