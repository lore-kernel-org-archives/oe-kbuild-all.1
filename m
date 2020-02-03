Content-Type: multipart/mixed; boundary="===============5044473529731431556=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [zen-kernel-zen-kernel:5.5/muqss 22/22] kernel/sched/wait.c:14:9: warning: 'WF_MIGRATED' macro redefined
Date: Mon, 03 Feb 2020 15:07:10 +0000
Message-ID: <CAKwvOdmWZoT8jui_BiVn1H+hLD3cPco2P601M+jkd+7=niUL-A@mail.gmail.com>
In-Reply-To: <202002021939.yaHm7qPy%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5044473529731431556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+ Steven, can you please take a look at the below report, it looks legit?

On Sun, Feb 2, 2020 at 11:58 AM kbuild test robot <lkp@intel.com> wrote:
>
> CC: kbuild-all(a)lists.01.org
> TO: Steven Barrett <steven@liquorix.net>
>
> tree:   https://github.com/zen-kernel/zen-kernel 5.5/muqss
> head:   bf569053d0fe08b3615793a0105afff3d28f3676
> commit: bf569053d0fe08b3615793a0105afff3d28f3676 [22/22] muqss: Re-define=
 WF_* wake flags in wait.c
> config: arm64-defconfig (attached as .config)
> compiler: clang version 11.0.0 (git://gitmirror/llvm_project ba8110161dfb=
096bbc63039afd87ff6417328f91)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout bf569053d0fe08b3615793a0105afff3d28f3676
>         # save the attached .config to linux build tree
>         make.cross ARCH=3Darm64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/sched/wait.c:14:9: warning: 'WF_MIGRATED' macro redefined [-Wma=
cro-redefined]
>    #define WF_MIGRATED     0x04            /* internal use, task got migr=
ated */
>            ^
>    kernel/sched/sched.h:1659:9: note: previous definition is here
>    #define WF_MIGRATED             0x4             /* Internal use, task =
got migrated */
>            ^
>    1 warning generated.
>
> vim +/WF_MIGRATED +14 kernel/sched/wait.c
>
>      8
>      9  /*
>     10   * wake flags
>     11   */
>     12  #define WF_SYNC         0x01            /* waker goes to sleep af=
ter wakeup */
>     13  #define WF_FORK         0x02            /* child wakeup after for=
k */
>   > 14  #define WF_MIGRATED     0x04            /* internal use, task got=
 migrated */
>     15
>
> ---
> 0-DAY kernel test infrastructure                 Open Source Technology C=
enter
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corp=
oration



-- =

Thanks,
~Nick Desaulniers
--===============5044473529731431556==--

